-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 06:50:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital-tarimoro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `activity_log`
--

INSERT INTO `activity_log` (`id`, `message`, `timestamp`) VALUES
(1, 'Que locura hermano', '2023-11-17 03:02:22'),
(5, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-18 02:13:31'),
(6, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-18 02:19:04'),
(7, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-18 03:06:33'),
(8, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 03:51:11'),
(9, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 04:29:17'),
(10, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 04:32:05'),
(11, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 05:12:44'),
(12, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 05:13:46'),
(13, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 05:16:26'),
(14, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 06:03:39'),
(15, 'Inicio de sesión exitoso para el usuario GORJ010109HGTMNSA2', '2023-11-18 17:18:14'),
(16, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-18 20:25:21'),
(17, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-18 21:45:57'),
(18, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-19 15:25:58'),
(19, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-19 17:52:02'),
(20, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-19 19:19:18'),
(21, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-19 19:22:31'),
(22, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 00:05:11'),
(23, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 01:02:20'),
(24, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 03:18:56'),
(25, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 04:42:29'),
(26, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 23:15:43'),
(27, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 23:29:39'),
(28, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-20 23:31:27'),
(29, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 00:11:33'),
(30, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 00:17:17'),
(31, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 01:22:54'),
(32, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 01:26:56'),
(33, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 02:56:37'),
(34, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 02:58:50'),
(35, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 03:03:12'),
(36, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 03:22:22'),
(37, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 03:32:55'),
(38, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 04:22:48'),
(39, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 04:32:31'),
(40, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 05:21:55'),
(41, 'Inicio de sesión exitoso para el usuario MENO000914HGTNTRA1', '2023-11-21 05:31:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultasegreso`
--

CREATE TABLE `consultasegreso` (
  `id_consulta_egreso` int(11) NOT NULL,
  `dxe` varchar(200) NOT NULL,
  `fecha_egreso` date NOT NULL,
  `medico_egreso` varchar(100) NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultasingreso`
--

CREATE TABLE `consultasingreso` (
  `id_consulta_ingreso` int(11) NOT NULL,
  `fecha_creacion_exp` date NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `dxi` varchar(200) NOT NULL,
  `medico_ingreso` varchar(100) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultasingreso`
--

INSERT INTO `consultasingreso` (`id_consulta_ingreso`, `fecha_creacion_exp`, `fecha_ingreso`, `dxi`, `medico_ingreso`, `id_paciente`) VALUES
(2, '2023-11-19', '2023-11-19 10:31:00', 'Solo es un rasguño', 'Dr. Octavio', 51),
(3, '0000-00-00', '0000-00-00 00:00:00', '', '', 52),
(4, '2023-11-19', '2023-11-19 13:52:00', 'Prueba', 'Prueba', 54),
(5, '2023-11-19', '2023-11-19 21:24:00', 'awd', 'awd', 56),
(6, '2023-11-19', '2023-11-19 21:28:00', 'sef', 'sef', 57),
(7, '2023-11-20', '2023-11-20 18:17:00', '123', '123', 58),
(8, '2023-11-20', '2023-11-20 18:22:00', '345', '345', 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticosembarazadas`
--

CREATE TABLE `diagnosticosembarazadas` (
  `id_diagnostico_embarazada` int(11) NOT NULL,
  `fecha_ultima_revision_exp` date NOT NULL,
  `fecha_primera_revision` datetime DEFAULT NULL,
  `fecha_ultima_revision` datetime DEFAULT NULL,
  `fecha_puerperio` datetime DEFAULT NULL,
  `riesgo` varchar(100) DEFAULT NULL,
  `traslado` varchar(100) NOT NULL,
  `apeo` varchar(100) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnosticosembarazadas`
--

INSERT INTO `diagnosticosembarazadas` (`id_diagnostico_embarazada`, `fecha_ultima_revision_exp`, `fecha_primera_revision`, `fecha_ultima_revision`, `fecha_puerperio`, `riesgo`, `traslado`, `apeo`, `id_paciente`) VALUES
(2, '2023-11-19', '2023-11-19 10:31:00', '2023-11-19 10:31:00', '2023-11-19 10:31:00', 'Ninguno', 'Ninguno', 'Ninguno', 51),
(3, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 52),
(4, '2023-11-19', '2023-11-19 13:52:00', '2023-11-19 13:52:00', '2023-11-19 13:52:00', 'Prueba', 'Prueba', 'Prueba', 54),
(5, '2023-11-19', '2023-11-19 21:28:00', '2023-11-19 21:28:00', '2023-11-19 21:28:00', 'sef', 'sef', 'sef', 57),
(6, '2023-11-20', '2023-11-20 18:17:00', '2023-11-20 18:17:00', '2023-11-20 18:17:00', '123', '123', '123', 58),
(7, '2023-11-20', '2023-11-20 18:22:00', '2023-11-20 18:22:00', '2023-11-20 18:22:00', '345', '345', '345', 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes`
--

CREATE TABLE `expedientes` (
  `id_expediente` int(11) NOT NULL,
  `clave_expediente` varchar(20) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`file`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expedientes`
--

INSERT INTO `expedientes` (`id_expediente`, `clave_expediente`, `id_paciente`, `tipo`, `file`) VALUES
(1, 'M000000001', 1, 'Historial Médico', '{\"fecha_inicio\": \"2023-01-01\", \"notas\": \"Primera consulta\"}'),
(2, 'L000000001', 22, 'Historial Médico', '{\"fecha_inicio\": \"2022-12-15\", \"notas\": \"Tratamiento anterior\"}'),
(3, 'G000000001', 23, 'Informes de Laboratorio', '{\"tipo_analisis\": \"Hematología\", \"resultados\": \"Dentro de rangos normales\"}'),
(4, 'H000000001', 24, 'Historial Médico', '{\"fecha_inicio\": \"2023-02-01\", \"notas\": \"Consulta de seguimiento\"}'),
(5, 'R000000001', 25, 'Radiografías', '{\"tipo_radiografia\": \"Torácica\", \"observaciones\": \"Sin hallazgos anormales\"}'),
(6, 'S000000001', 26, 'Historial Médico', '{\"fecha_inicio\": \"2022-11-20\", \"notas\": \"Problemas gastrointestinales crónicos\"}'),
(7, 'EXPEDIENTE007', 27, 'Presión Arterial', '{\"lecturas\": [{\"fecha\": \"2022-10-15\", \"presion\": \"120/80\"}, {\"fecha\": \"2022-11-01\", \"presion\": \"130/85\"}]}'),
(8, 'EXPEDIENTE008', 28, 'Historial Médico', '{\"fecha_inicio\": \"2022-09-05\", \"notas\": \"Migrañas recurrentes\"}'),
(9, 'EXPEDIENTE009', 29, 'Dermatología', '{\"diagnostico\": \"Dermatitis\", \"tratamiento\": \"Crema tópica\"}'),
(10, 'EXPEDIENTE010', 30, 'Lesiones Musculares', '{\"tipo_lesion\": \"Rodilla\", \"tratamiento\": \"Fisioterapia\"}'),
(11, 'EXPEDIENTE011', 31, 'Historial Psicológico', '{\"notas\": \"Tratamiento por ansiedad\"}'),
(12, 'EXPEDIENTE012', 32, 'Digestivo', '{\"sintomas\": \"Malestar estomacal, acidez\", \"tratamiento\": \"Antiácidos\"}'),
(13, 'EXPEDIENTE013', 33, 'Lesiones Deportivas', '{\"tipo_lesion\": \"Esguince\", \"tratamiento\": \"Reposo y fisioterapia\"}'),
(14, 'EXPEDIENTE014', 34, 'Endocrinología', '{\"tipo_examen\": \"TSH\", \"resultados\": \"Dentro de rangos normales\"}'),
(15, 'EXPEDIENTE015', 35, 'Audiometría', '{\"resultado\": \"Pérdida leve de audición en oído izquierdo\"}'),
(16, 'EXPEDIENTE016', 36, 'Neurología', '{\"sintomas\": \"Dolor de cabeza constante\", \"diagnostico\": \"Migraña\"}'),
(17, 'EXPEDIENTE017', 37, 'Alergias', '{\"alergenos\": [\"Polen\", \"Ácaros\"], \"tratamiento\": \"Antihistamínicos\"}'),
(18, 'EXPEDIENTE018', 38, 'Ortopedia', '{\"diagnostico\": \"Desviación de columna\", \"tratamiento\": \"Fisioterapia\"}'),
(19, 'EXPEDIENTE019', 39, 'General', '{\"observaciones\": \"Consulta de rutina\"}'),
(20, 'EXPEDIENTE020', 40, 'Trastornos del Sueño', '{\"sintomas\": \"Insomnio\", \"recomendaciones\": \"Higiene del sueño\"}'),
(21, 'EXPEDIENTE021', 41, 'General', '{\"observaciones\": \"Consulta de rutina\"}'),
(22, 'EXPEDIENTE022', 47, 'General', '{\"observaciones\": \"Consulta de rutina\"}'),
(23, 'EXPEDIENTE023', 48, 'General', '{\"observaciones\": \"Consulta de rutina\"}'),
(24, 'EXPEDIENTE024', 49, 'Cardiología', '{\"presion_arterial\": \"130/80\", \"frecuencia_cardiaca\": \"75\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_diagnosticos`
--

CREATE TABLE `historial_diagnosticos` (
  `id_historial_diagnostico` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `diagnostico` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_diagnosticos`
--

INSERT INTO `historial_diagnosticos` (`id_historial_diagnostico`, `id_paciente`, `diagnostico`, `fecha_registro`) VALUES
(1, NULL, 'sef', '2023-11-20 03:28:29'),
(2, NULL, '123', '2023-11-21 00:18:04'),
(3, 59, 'awdaw123123', '2023-11-21 00:22:23'),
(4, 1, 'awdawdwad', '2023-11-21 01:22:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `domicilio` varchar(200) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `estatus` varchar(20) NOT NULL,
  `derecho_habiendo` varchar(50) NOT NULL,
  `afiliacion` varchar(50) NOT NULL,
  `tipo_sanguineo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `curp`, `nombre`, `apellidos`, `telefono`, `domicilio`, `genero`, `estatus`, `derecho_habiendo`, `afiliacion`, `tipo_sanguineo`) VALUES
(1, 'MENO000914HGTNTRA1', 'Orlando', 'Mendoza Nieto', '4661110909', 'Durazno', 'Masculino', 'Activo', 'Ninguno', 'Ninguno', 'A+'),
(22, 'LOPE010622HGTNTRA3', 'Elena', 'Lopez', '5557891234', 'Calle Flores', 'Femenino', 'Inactivo', 'Alguno', 'Seguro Popular', 'B-'),
(23, 'GARC890531HGTNTRA2', 'Juan', 'Garcia', '4771234567', 'Av. Principal', 'Masculino', 'Activo', 'Ninguno', 'Particular', 'O+'),
(24, 'HERN751214HGTNTRA4', 'Maria', 'Hernandez', '8449876543', 'Col. Nueva', 'Femenino', 'Inactivo', 'Alguno', 'IMSS', 'AB+'),
(25, 'RODR980725HGTNTRA5', 'Roberto', 'Rodriguez', '6628901234', 'Callejón', 'Masculino', 'Activo', 'Ninguno', 'Ninguno', 'A-'),
(26, 'SANC800307HGTNTRA6', 'Laura', 'Sanchez', '7228765432', 'Río Bravo', 'Femenino', 'Inactivo', 'Ninguno', 'ISSSTE', 'O-'),
(27, 'GOME950810HGTNTRA7', 'Carlos', 'Gomez', '9995678901', 'Avenida Reforma', 'Masculino', 'Activo', 'Alguno', 'Particular', 'B+'),
(28, 'MART900601HGTNTRA8', 'Ana', 'Martinez', '3336789012', 'Paseo de la Reforma', 'Femenino', 'Inactivo', 'Alguno', 'Ninguno', 'AB-'),
(29, 'JIME871020HGTNTRA9', 'Luis', 'Jimenez', '8112345678', 'Callejón de los Suspiros', 'Masculino', 'Activo', 'Ninguno', 'IMSS', 'O+'),
(30, 'TORR841231HGTNTRA1', 'Diana', 'Torres', '7223456789', 'Calle Principal', 'Femenino', 'Inactivo', 'Alguno', 'Ninguno', 'A+'),
(31, 'RUIZ960403HGTNTRA1', 'Ricardo', 'Ruiz', '4778765432', 'Avenida Juarez', 'Masculino', 'Activo', 'Ninguno', 'ISSSTE', 'O-'),
(32, 'GOME931115HGTNTRA1', 'Sofia', 'Gomez', '5551112233', 'Col. Obrera', 'Femenino', 'Inactivo', 'Alguno', 'Seguro Popular', 'B+'),
(33, 'FERN871208HGTNTRA1', 'Mario', 'Fernandez', '6623456789', 'Calle Olmo', 'Masculino', 'Activo', 'Ninguno', 'Ninguno', 'AB-'),
(34, 'CAST940519HGTNTRA1', 'Laura', 'Castro', '8119876543', 'Paseo de la Montaña', 'Femenino', 'Inactivo', 'Ninguno', 'Particular', 'A-'),
(35, 'PERE911201HGTNTRA1', 'Javier', 'Perez', '7225678901', 'Callejón de las Flores', 'Masculino', 'Activo', 'Alguno', 'IMSS', 'O+'),
(36, 'TORR950804HGTNTRA1', 'Monica', 'Torres', '8443456789', 'Av. Hidalgo', 'Femenino', 'Inactivo', 'Alguno', 'Ninguno', 'B-'),
(37, 'RAMI920427HGTNTRA1', 'Pedro', 'Ramirez', '5558901234', 'Calle del Sol', 'Masculino', 'Activo', 'Ninguno', 'ISSSTE', 'AB+'),
(38, 'ALVA911210HGTNTRA1', 'Martha', 'Alvarez', '6624321098', 'Col. Nueva', 'Femenino', 'Inactivo', 'Ninguno', 'Seguro Popular', 'O-'),
(39, 'HERN950615HGTNTRA1', 'Gabriel', 'Hernandez', '8119876543', 'Calle Principal', 'Masculino', 'Activo', 'Alguno', 'Particular', 'B+'),
(40, 'SERR900104HGTNTRA2', 'Isabel', 'Serrano', '9992345678', 'Av. Reforma', 'Femenino', 'Inactivo', 'Alguno', 'Ninguno', 'A+'),
(41, 'AC', 'AC', 'AC', '1', 'AC', 'AC ', 'AC ', 'AC ', 'AC ', 'AC '),
(47, 'AD', 'AD', 'AD', '1', 'AD', 'AD', 'Ad', 'AD', 'AD', 'AD'),
(48, 'CURP123', 'Pablo', 'Perez Mendoza', '1', 'El Terrero', 'Sajajin', 'Activo', 'No', 'No', 'O++'),
(49, 'GORJ090101HGTMNSA2', 'Jose Guadalupe', 'Gomez Rangel', '4171080718', 'Rancho grande', 'Masculino', 'Activo', 'Ninguno', 'IMSS', 'O+'),
(51, 'CURPDEEJEMPLO67890', 'Ejemplo', 'Apellido ejemplo', '1112223333', 'Ejemplo domicilio', '', 'Activo', 'No tiene', 'No tiene', 'A+'),
(52, 'CURPDEEJEMPLO22222', 'eje', '', '', '', '', '', '', '', ''),
(54, 'CURPDEEJEMPLO11111', 'Prueba', 'Prueba', '1231231231', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'A-'),
(56, 'CURPDEEJEMPLO55555', 'awd', 'awd', '1231231231', 'awd', 'awd', 'awd', 'awd', 'awd', 'awd'),
(57, 'CURPDEEJEMPLO66666', 'sef', 'sef', '9999999999', 'sef', 'sef', 'sef', 'sef', 'sef', 'sef'),
(58, '123123123123123123', '123', '123', '1231231231', '123', '123', '123', '123', '123', '123'),
(59, '345345345345345345', '345', '345', '3453453453', '345', '345', '345', '345', '345', '345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Doctor'),
(3, 'Enfermero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `curp` varchar(18) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `estado_cuenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_completo`, `id_rol`, `curp`, `correo`, `password`, `estado_cuenta`) VALUES
(1, 'Orlando Mendoza Nieto', 1, 'MENO000914HGTNTRA1', 'omn76231@gmail.com', 'efe8564971192c24d29c7aedb7c5230aeaf13dbac7815bb7bd2206bdcc483350', 1),
(2, 'Jesus Guadalupe Gomez Rangel', 2, 'GORJ010109HGTMNSA2', 'jesusito123@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 1),
(3, 'Rafael Ramirez Rosillo', 2, 'RARR', 'rafael.rr@irapuato.tecnm.mx', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consultasegreso`
--
ALTER TABLE `consultasegreso`
  ADD PRIMARY KEY (`id_consulta_egreso`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `consultasingreso`
--
ALTER TABLE `consultasingreso`
  ADD PRIMARY KEY (`id_consulta_ingreso`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `diagnosticosembarazadas`
--
ALTER TABLE `diagnosticosembarazadas`
  ADD PRIMARY KEY (`id_diagnostico_embarazada`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD PRIMARY KEY (`id_expediente`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `historial_diagnosticos`
--
ALTER TABLE `historial_diagnosticos`
  ADD PRIMARY KEY (`id_historial_diagnostico`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `curp` (`curp`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `curp` (`curp`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `consultasegreso`
--
ALTER TABLE `consultasegreso`
  MODIFY `id_consulta_egreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultasingreso`
--
ALTER TABLE `consultasingreso`
  MODIFY `id_consulta_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `diagnosticosembarazadas`
--
ALTER TABLE `diagnosticosembarazadas`
  MODIFY `id_diagnostico_embarazada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `historial_diagnosticos`
--
ALTER TABLE `historial_diagnosticos`
  MODIFY `id_historial_diagnostico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultasegreso`
--
ALTER TABLE `consultasegreso`
  ADD CONSTRAINT `consultasegreso_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `consultasingreso`
--
ALTER TABLE `consultasingreso`
  ADD CONSTRAINT `consultasingreso_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `consultasingreso_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `diagnosticosembarazadas`
--
ALTER TABLE `diagnosticosembarazadas`
  ADD CONSTRAINT `diagnosticosembarazadas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `diagnosticosembarazadas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD CONSTRAINT `expedientes_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `historial_diagnosticos`
--
ALTER TABLE `historial_diagnosticos`
  ADD CONSTRAINT `fk_historial_diagnosticos_pacientes` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
