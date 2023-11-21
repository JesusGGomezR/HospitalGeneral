<?php
require_once 'db_config.php';

header('Content-Type: application/json');

$response = ['success' => false];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $message = $data['message'];

    $sql = "INSERT INTO activity_log ( message) 
            VALUES ('$message')";

        if ($conexion->query($sql) === true) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $conexion->error]);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Metodo no permitido']);
}

$conexion->close();
?>