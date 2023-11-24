<?php
// load_diagnosticosembarazadas.php

header('Content-Type: application/json');

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Verifica si el parámetro id_paciente está definido en la URL
if (isset($_GET['id_paciente'])) {
    // Obtén el ID del paciente desde la solicitud GET
    $idPaciente = $_GET['id_paciente'];

    // Consulta para obtener los datos de diagnosticosembarazadas del paciente
    $query = "SELECT fecha_ultima_revision_exp, fecha_ultima_revision, fecha_puerperio, riesgo, traslado, apeo 
              FROM diagnosticosembarazadas 
              WHERE id_paciente = $idPaciente";
    $result = $mysqli->query($query);

    if ($result) {
        $consultaEmbarazadaData = $result->fetch_assoc();
        echo json_encode($consultaEmbarazadaData);
    } else {
        // Manejo de errores
        echo json_encode(array('error' => 'Error al obtener los datos de consultaegreso'));
    }
} else {
    // Manejo de errores si id_paciente no está definido
    echo json_encode(array('error' => 'ID de paciente no definido en la URL'));
}

$mysqli->close();
?>
