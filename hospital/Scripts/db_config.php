<?php
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'hospital-tarimoro';

$conexion = new mysqli($host, $username, $password, $database);

if ($conexion->connect_error) {
    die('Error de conexión: ' . $conexion->connect_error);
}
?>

