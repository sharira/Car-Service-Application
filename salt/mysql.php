<?php
$link = new mysqli("localhost", "root", "secret",'', NULL, '/var/run/mysql-default/mysqld.sock');

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    exit;
}

echo "Success: A proper connection to MySQL was made! The my_db database is great." . PHP_EOL;

mysqli_close($link);
?>
