<?php
$host = 'localhost';
$user = 'emeals_users';
$password = '';
$database = 'emeals';

$db = mysqli_connect($host, $user, $password, $database);

if(!$db){
    die("Error, database connectivity failed!");
}
?>