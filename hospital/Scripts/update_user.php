<?php
require_once 'db_config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $id = $data['id'];
    $nombre_completo = $data['nombre_completo'];
    $curp = $data['curp'];
    $correo = $data['correo'];
    $contrasena = $data['password']; // Ajuste aquí

    $sql = "UPDATE usuarios SET 
            nombre_completo = '$nombre_completo',
            curp = '$curp',
            correo = '$correo',
            password = '$contrasena'  -- Ajuste aquí
            WHERE id = $id";

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





