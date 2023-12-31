<?php
header('Content-Type: application/json');
//ESTE ES PARA OBTENER LOS DATOS DEL PACIENTE EN EDITAR

// Obtener datos del formulario
$id = isset($_GET['id']) ? $_GET['id'] : null;

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

// Manejar errores de conexión
if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Utilizar consultas preparadas para evitar inyección SQL
$query = "SELECT pacientes.*, consultasegreso.*, diagnosticosembarazadas.*
            FROM pacientes
            LEFT JOIN consultasegreso ON pacientes.id_paciente = consultasegreso.id_paciente
            LEFT JOIN diagnosticosembarazadas ON pacientes.id_paciente = diagnosticosembarazadas.id_paciente
            WHERE pacientes.id_paciente = ?";
$stmt = $mysqli->prepare($query);

if ($stmt) {
    // Solo bind los parámetros no nulos
    $stmt->bind_param('i', $id);
    
    // Ejecutar solo si al menos un campo no es nulo
    $stmt->execute();

    // Obtener resultados de la consulta
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Obtener datos del paciente y otras tablas
        $data = $result->fetch_assoc();
        echo json_encode(['status' => 'success', 'data' => $data]);
    } else {
        // No se encontró al paciente
        echo json_encode(['status' => 'error', 'message' => 'Paciente no encontrado']);
    }

    // Cerrar la conexión a la base de datos
    $stmt->close();
} else {
    // Manejar el caso en que la preparación de la consulta falle
    echo json_encode(['status' => 'error', 'message' => 'Error en la preparación de la consulta']);
}

// Cerrar la conexión a la base de datos
$mysqli->close();
?>

