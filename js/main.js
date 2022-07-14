function getTableData(table) {
    const dataArray = [],
        nama = [],
        // jabatan = [],
        nilai = [];

    table.rows({ search: "applied" }).every(function () {
        const data = this.data();
        nama.push(data["nama"]);
        // jabatan.push(data["jabatan"]);
        nilai.push(parseFloat(data["penilaian"]));
    });

    dataArray.push(
        nama,
        // jabatan,
        nilai,
    );
    return dataArray;
}

function chart(data) {
    Highcharts.chart("column-chart", {
        chart: {
            type: "column",
        },
        title: {
            text: "Nilai Per Orang",
        },
        xAxis: {
            categories: data[0],
            title: {
                text: null,
            },
        },
        yAxis: {
            title: {
                text: "Jumlah",
            },
            labels: {
                overflow: "justify",
            },
        },
        series: [
            {
                name: "Nilai",
                data: data[1],
            },
        ],
    });

    Highcharts.chart("bar-chart", {
        chart: {
            type: "bar",
        },
        title: {
            text: "berdasarkan grade penilaian",    
        },
        xAxis: {
            categories: ["B", "A", "A+"],
            title: {
                text: null,
            },
        },
        yAxis: {
            title: {
                text: "Jumlah",
            },
            labels: {
                overflow: "justify",
            },
        },
        series: [
            {
                name: "Jumlah",
                data: [
                    data[1].filter((x) => x >= 50 && x <= 70).length,
                    data[1].filter((x) => x >= 71 && x <= 90).length,
                    data[1].filter((x) => x >= 91 && x <= 100).length,
                ],
            },
        ],
    });

    Highcharts.chart("pie-chart", {
        chart: {
            type: 'pie'
        },
        title: {
            text: "berdasarkan grade penilaian",
        },
        series: [
            {
                name: "Jumlah",
                colorByPoint: true,
                data: [
                    {
                        name: 'B',
                        y: data[1].filter((x) => x >= 50 && x <= 70).length,
                    },
                    {
                        name: 'A',
                        y: data[1].filter((x) => x >= 71 && x <= 90).length,
                    },
                    {
                        name: 'A+',
                        y: data[1].filter((x) => x >= 91 && x <= 100).length,
                    }
                ]
            }
        ]
    })
}

let draw = false;
function setTableEvents(table) {
    table.on("page", () => {
        draw = true;
    });

    table.on("draw", () => {
        if (draw) {
            draw = false;
        } else {
            const tableData = getTableData(table);
            chart(tableData);
        }
    });
}

$(document).ready(function () {
    const table_karyawan = $("#tbl-karyawan").DataTable({
        ajax: {
            url: "http://localhost/test-tma/karyawan.php?function=list_karyawan",
            dataSrc: "data",
        },
        columns: [
            { data: "nama" },
            { data: "jabatan" },
            { data: "penilaian" },
        ],
    });

    const dataTable = getTableData(table_karyawan);
    // console.log(dataTable)
    chart(dataTable);
    setTableEvents(table_karyawan);

});