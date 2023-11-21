<?php
require_once 'db_config.php';

header('Content-Type: application/json');

$response = ['success' => false];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

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

    // Insertar en la tabla "pacientes"
    $sql_pacientes = "INSERT INTO pacientes (id_paciente, curp, nombre, apellidos, telefono, domicilio, genero, estatus, derecho_habiendo, afiliacion, tipo_sanguineo) 
            VALUES (NULL, '$curp', '$nombre', '$apellidos', '$telefono', '$domicilio', '$genero', '$estatus', '$derecho_habiendo', '$afiliacion', '$tipo_sanguineo')";

    if ($conexion->query($sql_pacientes) === true) {
        // Obtener el ID del paciente recién insertado
        $id_paciente = $conexion->insert_id;

        //--------------------------------------------------------------------------------
        // Lógica para insertar en "consultasingreso"
        $fecha_creacion_exp = $data['fecha_creacion_exp'];
        $fecha_ingreso = $data['fecha_ingreso'];
        $dxi = $data['dxi'];
        $medico_ingreso = $data['medico_ingreso'];

        $sql_consultasingreso = "INSERT INTO consultasingreso (id_consulta_ingreso, fecha_creacion_exp, fecha_ingreso, dxi, medico_ingreso, id_paciente) 
                                VALUES (NULL, '$fecha_creacion_exp', '$fecha_ingreso', '$dxi', '$medico_ingreso', '$id_paciente')";

        $conexion->query($sql_consultasingreso);

        //--------------------------------------------------------------------------------
        // Lógica para insertar en "diagnosticosembarazadas"
        $fecha_ultima_revision_exp = $data['fecha_ultima_revision_exp'];
        $fecha_primera_revision = $data['fecha_primera_revision'];
        $fecha_ultima_revision = $data['fecha_ultima_revision'];
        $fecha_puerperio = $data['fecha_puerperio'];
        $riesgo = $data['riesgo'];
        $traslado = $data['traslado'];
        $apeo = $data['apeo'];

        $sql_diagnosticosembarazadas = "INSERT INTO diagnosticosembarazadas (id_diagnostico_embarazada, fecha_ultima_revision_exp, fecha_primera_revision, fecha_ultima_revision, fecha_puerperio, riesgo, traslado, apeo, id_paciente) 
                                        VALUES (NULL, '$fecha_ultima_revision_exp', '$fecha_primera_revision', '$fecha_ultima_revision', '$fecha_puerperio', '$riesgo', '$traslado', '$apeo', '$id_paciente')";

        $conexion->query($sql_diagnosticosembarazadas);

        //--------------------------------------------------------------------------------
        // Lógica para insertar en "historial_diagnosticos"
        $diagnostico = $data['diagnostico'];

        $sql_historial_diagnosticos = "INSERT INTO historial_diagnosticos (id_historial_diagnostico, diagnostico, id_paciente) 
                                VALUES (NULL, '$diagnostico', '$id_paciente')";

        $conexion->query($sql_historial_diagnosticos);

        //--------------------------------------------------------------------------------
        // Lógica para insertar en "expedientes"
        $clave_expediente = $data['clave_expediente']; 

        $sql_expedientes = "INSERT INTO expedientes (id_expediente, clave_expediente, id_paciente) 
                   VALUES (NULL, '$clave_expediente', '$id_paciente')";

        $conexion->query($sql_expedientes);
        //IMPORTANTE ME QUEDE EN ELIMINAR LAS TABLAS DE TIPO Y FILE
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $conexion->error]);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Método no permitido']);
}

$conexion->close();
?>

