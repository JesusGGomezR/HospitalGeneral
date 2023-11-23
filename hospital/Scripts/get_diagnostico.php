<?php
header('Content-Type: application/json');

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Obtener el ID del paciente desde la solicitud GET
$idPaciente = $_GET['id_paciente'];

// Consulta para obtener el historial de diagnósticos del paciente
$query = "SELECT * FROM historial_diagnosticos WHERE id_paciente = $idPaciente";
$result = $mysqli->query($query);

if ($result) {
    $diagnosticos = array();

    while ($row = $result->fetch_assoc()) {
        $diagnostico = array(
            'id_historial_diagnostico' => $row['id_historial_diagnostico'],
            'id_paciente' => $row['id_paciente'],
            'diagnostico' => $row['diagnostico'],
            'fecha_registro' => $row['fecha_registro']
        );

        array_push($diagnosticos, $diagnostico);
    }

    echo json_encode($diagnosticos);
} else {
    // Manejo de errores
    echo json_encode(array('error' => 'Error al obtener el historial de diagnósticos'));
}

$mysqli->close();
?>


