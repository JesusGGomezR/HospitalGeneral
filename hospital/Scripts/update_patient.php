<?php
require_once 'db_config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $id_paciente = $data['id_paciente'];
    $id_patient = $data['id_paciente'];
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
    $diagnostico = $data['diagnostico'];

    try {
        // Comienza la transacción
        $conexion->begin_transaction();

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
            // Lógica para agregar en "historial_diagnosticos"
            $sql_historial_diagnosticos = "INSERT INTO historial_diagnosticos (id_paciente, diagnostico)
                                           VALUES ($id_paciente, '$diagnostico')
                                           ON DUPLICATE KEY UPDATE diagnostico = '$diagnostico'";

            if ($conexion->query($sql_historial_diagnosticos) === true) {
                // Si ambos pasos se completan correctamente, confirma la transacción
                $conexion->commit();
                echo json_encode(['success' => true]);
            } else {
                // Si hay un error en la segunda consulta, realiza un rollback
                $conexion->rollback();
                echo json_encode(['success' => false, 'error' => $conexion->error]);
            }
        } else {
            // Si hay un error en la primera consulta, realiza un rollback
            $conexion->rollback();
            echo json_encode(['success' => false, 'error' => $conexion->error]);
        }
    } catch (Exception $e) {
        // Manejo de excepciones
        $conexion->rollback();
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    } finally {
        // Finaliza la transacción
        $conexion->close();
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Método no permitido']);
}


$conexion->close();
?>



