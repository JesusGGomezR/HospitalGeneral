<?php
header('Content-Type: application/json');

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

// Manejar errores de conexión
if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

$patientId = $_GET['patientId'];

// Utilizar consultas preparadas para evitar inyección SQL
$query = "SELECT * FROM expedientes WHERE id_paciente = $patientId"; // Ajusta el nombre de la columna según tu base de datos
$result = $mysqli->query($query);


if ($result) {
    // Obtener resultados como una lista de pacientes
    $expedientDataList = $result->fetch_all(MYSQLI_ASSOC);

    echo json_encode($expedientDataList);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error al obtener expedientes']);
}

// Cerrar la conexión a la base de datos
$mysqli->close();
?>
