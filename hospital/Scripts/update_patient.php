<?php
require_once 'db_config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $id_paciente = $data['id_paciente'];
    $curp = $data['curp'];
    $nombre = $data['nombre'];
    $apellidos = $data['apellidos'];
    $telefono = $data['telefono'];
    $domicilio = $data['domicilio'];
    $genero = $data['genero'];
    $estatus = $data['estatus'];
    $derecho_habiendo = $data['derecho_habiendo'];
    $afiliacion = $data['afiliacion'];
    $tipo_sanguineo = $data['tipo_sanguineo'];
    //$diagnostico = $data['diagnostico'];

    // Lógica para actualizar en "pacientes"
    $sql_pacientes = "UPDATE pacientes SET 
            curp = '$curp',
            nombre = '$nombre',
            apellidos = '$apellidos',
            telefono = '$telefono',
            domicilio = '$domicilio',
            genero = '$genero',
            estatus = '$estatus',
            derecho_habiendo = '$derecho_habiendo',
            afiliacion = '$afiliacion',
            tipo_sanguineo = '$tipo_sanguineo'
            WHERE id_paciente = $id_paciente";

    if ($conexion->query($sql_pacientes) === true) {
        // Lógica para actualizar en "historial_diagnosticos"
        $diagnostico = $data['diagnostico'];

        $sql_historial_diagnosticos = "UPDATE historial_diagnosticos SET 
                diagnostico = '$diagnostico'
                WHERE id_paciente = $id_paciente";

        $conexion->query($sql_historial_diagnosticos);

        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $conexion->error]);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Método no permitido']);
}

$conexion->close();
?>


