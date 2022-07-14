<?php

function fibonacci (int $jumlahBilangan) {
  # array ini akan digunakan untuk menampung bilangan fibonacci
  $fibonacci = [];

  if ($jumlahBilangan < 0) {
    # langsung hentikan fungsi jika $jumlahBilangan kurang dari 0
    return $fibonacci; 
  }

  # mulai perulangan
  for ($i = 0; $i < $jumlahBilangan; $i++) {
    if ($i < 2) {
      $bilangan = $i;
    } else {
      $bilangan = $fibonacci[$i - 1] + $fibonacci[$i - 2];
    }

    # tambahkan $bilangan ke dalam array $fibonacci
    array_push($fibonacci, $bilangan);
  }

  return $fibonacci;
}


# panggil fungsi fibonacci dengan berbagai parameter
echo print_deret_fibonacci(3);
echo "<br>";
// hasil: 1 1 2

echo print_deret_fibonacci(5);
echo "<br>";
// hasil: 0 1 1 2 3

echo print_deret_fibonacci(2);
echo "<br>";
// hasil: 1 1   