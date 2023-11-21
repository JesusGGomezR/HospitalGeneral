<?php
require_once 'db_config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $id_expediente = $data['id_expediente'];
    $clave_expediente = $data['clave_expediente'];
    $id_paciente = $data['id_paciente'];
    $tipo = $data['tipo'];
    $file = $data['file'];

    $sql = "UPDATE expedientes SET 
            id_expediente = '$id_expediente',
            clave_expediente = '$clave_expediente',
            id_paciente = 'id_paciente',
            tipo = '$tipo',
            file = '$file',
            WHERE id_paciente = $id_expediente";

    if ($conexion->query($sql) === true) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $conexion->error]);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Método no permitido']);
}

$conexion->close();
?>
