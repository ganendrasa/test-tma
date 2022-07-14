<?php

    $host = "localhost";
    $database = "db_karyawan";
    $username = "root";
    $password = "";

    $mysqli = mysqli_connect($host, $username, $password, $database);

    if(!$mysqli){
        die("Koneksi gagal: " . mysqli_connect_error());
    }

?> 