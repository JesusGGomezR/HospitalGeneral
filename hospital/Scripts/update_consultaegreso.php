<?php
// update_consultaegreso.php

header('Content-Type: application/json');

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Verifica si los parámetros necesarios están definidos en la solicitud POST
if (isset($_POST['id_paciente']) && isset($_POST['dxe']) && isset($_POST['fecha_egreso']) && isset($_POST['medico_egreso']) && isset($_POST['observaciones'])) {
    // Obtén los datos desde la solicitud POST
    $idPaciente = $_POST['id_paciente'];
    $dxe = $_POST['dxe'];
    $fechaEgreso = $_POST['fecha_egreso'];
    $medicoEgreso = $_POST['medico_egreso'];
    $observaciones = $_POST['observaciones'];

    // Actualiza los datos de consultaegreso del paciente
    $query = "UPDATE consultasegreso SET dxe = '$dxe', fecha_egreso = '$fechaEgreso', medico_egreso = '$medicoEgreso', observaciones = '$observaciones' WHERE id_paciente = $idPaciente";

    if ($mysqli->query($query)) {
        echo json_encode(array('success' => 'Consulta de egreso actualizada exitosamente.'));
    } else {
        // Manejo de errores
        echo json_encode(array('error' => 'Error al actualizar la consulta de egreso.'));
    }
} else {
    // Manejo de errores si los parámetros no están definidos
    echo json_encode(array('error' => 'Parámetros insuficientes en la solicitud.'));
}

$mysqli->close();
?>
