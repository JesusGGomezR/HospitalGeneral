<?php
require_once 'db_config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $id_paciente = $data['id_paciente'];
    $diagnostico = $data['diagnostico'];

    $sql = "INSERT INTO historial_diagnosticos (id_paciente, diagnostico, fecha_registro)
            VALUES ('$id_paciente', '$diagnostico', CURRENT_TIMESTAMP)";

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
