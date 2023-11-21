<?php
header('Content-Type: application/json');

// Obtener datos del formulario
$curp = isset($_POST['curp']) ? $_POST['curp'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';

// Conexión a la base de datos (ajusta según tu configuración)
$mysqli = new mysqli('localhost', 'root', '', 'hospital-tarimoro');

// Manejar errores de conexión
if ($mysqli->connect_error) {
    die('Error de conexión: ' . $mysqli->connect_error);
}

// Utilizar consultas preparadas para evitar inyección SQL
$query = "SELECT * FROM usuarios WHERE curp = ? AND password = ?";
$stmt = $mysqli->prepare($query);

if ($stmt) {
    $stmt->bind_param('ss', $curp, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Usuario autenticado
        $userData = $result->fetch_assoc();
        echo json_encode(['status' => 'success', 'userData' => $userData]);
    } else {
        // Autenticación fallida
        echo json_encode(['status' => 'error', 'message' => 'Error de autenticación']);
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



