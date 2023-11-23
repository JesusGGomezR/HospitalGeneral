<?php
header('Content-Type: application/json');
//ESTE ES PARA LA LISTA DE PACIENTES
// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

// Manejar errores de conexión
if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Utilizar consultas preparadas para evitar inyección SQL
/*
Esto creará una columna llamada "diagnosticos" 
que contendrá una cadena con todos los diagnósticos del paciente separados por comas.
*/
$query = "SELECT pacientes.*, GROUP_CONCAT(historial_diagnosticos.diagnostico) AS diagnosticos
FROM pacientes 
LEFT JOIN historial_diagnosticos ON pacientes.id_paciente = historial_diagnosticos.id_paciente
GROUP BY pacientes.id_paciente"; 

$result = $mysqli->query($query);

if ($result) {
    // Obtener resultados como una lista de pacientes con información de diagnóstico
    $patientDataList = $result->fetch_all(MYSQLI_ASSOC);

    echo json_encode($patientDataList);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error al obtener pacientes']);
}

// Cerrar la conexión a la base de datos
$mysqli->close();

