<?php
// update_diagnosticosembarazadas.php

header('Content-Type: application/json');

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Verifica si los datos necesarios están presentes en la solicitud POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idPaciente = $_POST['id_paciente'];
    $fechaUltimaRevisionExp = $_POST['fecha_ultima_revision_exp'];
    $fechaUltimaRevision = $_POST['fecha_ultima_revision'];
    $fechaPuerperio = $_POST['fecha_puerperio'];
    $riesgo = $_POST['riesgo'];
    $traslado = $_POST['traslado'];
    $apeo = $_POST['apeo'];

    // Consulta para actualizar los datos en la tabla diagnosticosembarazadas
    $query = "UPDATE diagnosticosembarazadas SET
        fecha_ultima_revision_exp = '$fechaUltimaRevisionExp',
        fecha_ultima_revision = '$fechaUltimaRevision',
        fecha_puerperio = '$fechaPuerperio',
        riesgo = '$riesgo',
        traslado = '$traslado',
        apeo = '$apeo'
        WHERE id_paciente = $idPaciente";

    $result = $mysqli->query($query);

    if ($result) {
        echo json_encode(array('message' => 'Datos de diagnosticosembarazadas actualizados exitosamente'));
    } else {
        // Manejo de errores
        echo json_encode(array('error' => 'Error al actualizar los datos de diagnosticosembarazadas'));
    }
} else {
    // Manejo de errores si los datos no están presentes en la solicitud POST
    echo json_encode(array('error' => 'Datos no presentes en la solicitud POST'));
}

$mysqli->close();
?>
