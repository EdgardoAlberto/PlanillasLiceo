-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2026 a las 20:13:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planillas_liceo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(191) NOT NULL,
  `table_name` varchar(191) DEFAULT NULL,
  `record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(1, 1, 'updated', 'deduction_types', 1, '{\"id\":1,\"name\":\"Instituto Hondure\\u00f1o de Seguridad Social\",\"abbreviation\":\"IHS\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":1,\"name\":\"Instituto Hondure\\u00f1o de Seguridad Social\",\"abbreviation\":\"IHSS\",\"is_active\":\"1\",\"sort_order\":\"1\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 05:21:10\"}', '2026-03-19 11:21:10', '2026-03-19 11:21:10'),
(2, 1, 'updated', 'deduction_types', 2, '{\"id\":2,\"name\":\"R\\u00e9gimen de Aportaciones Privadas\",\"abbreviation\":\"RAP\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":2,\"name\":\"R\\u00e9gimen de Aportaciones Privadas\",\"abbreviation\":\"RAP\",\"is_active\":\"1\",\"sort_order\":\"3\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 05:45:34\"}', '2026-03-19 11:45:34', '2026-03-19 11:45:34'),
(3, 1, 'created', 'deduction_types', 8, NULL, '{\"name\":\"Cuota de Prestamo RAP\",\"abbreviation\":\"P. RAP\",\"sort_order\":\"2\",\"is_active\":true,\"updated_at\":\"2026-03-19 05:46:21\",\"created_at\":\"2026-03-19 05:46:21\",\"id\":8}', '2026-03-19 11:46:21', '2026-03-19 11:46:21'),
(4, 1, 'created', 'deduction_types', 9, NULL, '{\"name\":\"Cuota Prestamo ISC\",\"abbreviation\":\"P. ISC\",\"sort_order\":\"4\",\"is_active\":true,\"updated_at\":\"2026-03-19 05:47:47\",\"created_at\":\"2026-03-19 05:47:47\",\"id\":9}', '2026-03-19 11:47:48', '2026-03-19 11:47:48'),
(5, 1, 'created', 'deduction_types', 10, NULL, '{\"name\":\"Anticipo de Sueldo\",\"abbreviation\":\"Ant.\",\"sort_order\":\"5\",\"is_active\":true,\"updated_at\":\"2026-03-19 05:49:49\",\"created_at\":\"2026-03-19 05:49:49\",\"id\":10}', '2026-03-19 11:49:49', '2026-03-19 11:49:49'),
(6, 1, 'created', 'deduction_types', 11, NULL, '{\"name\":\"Prestamo de Banco Tabajadores\",\"abbreviation\":\"P.B,Tra.\",\"sort_order\":\"6\",\"is_active\":true,\"updated_at\":\"2026-03-19 05:57:18\",\"created_at\":\"2026-03-19 05:57:18\",\"id\":11}', '2026-03-19 11:57:19', '2026-03-19 11:57:19'),
(7, 1, 'created', 'deduction_types', 12, NULL, '{\"name\":\"Ahorro de Viaje\",\"abbreviation\":\"A. Via.\",\"sort_order\":\"7\",\"is_active\":true,\"updated_at\":\"2026-03-19 05:58:04\",\"created_at\":\"2026-03-19 05:58:04\",\"id\":12}', '2026-03-19 11:58:04', '2026-03-19 11:58:04'),
(8, 1, 'updated', 'deduction_types', 6, '{\"id\":6,\"name\":\"Cooperativa\",\"abbreviation\":\"COO\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":6,\"name\":\"Cooperativa Maestros\",\"abbreviation\":\"C. Mae\",\"is_active\":\"1\",\"sort_order\":\"8\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:07:29\"}', '2026-03-19 12:07:30', '2026-03-19 12:07:30'),
(9, 1, 'updated', 'deduction_types', 7, '{\"id\":7,\"name\":\"Deducci\\u00f3n Varios\",\"abbreviation\":\"VAR\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":7,\"name\":\"Area Social\",\"abbreviation\":\"A. Social\",\"is_active\":\"1\",\"sort_order\":\"9\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:30:21\"}', '2026-03-19 12:30:21', '2026-03-19 12:30:21'),
(10, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Anticipos\",\"abbreviation\":\"ANT\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones I\",\"abbreviation\":\"Otros 1\",\"is_active\":\"1\",\"sort_order\":\"10\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:33:20\"}', '2026-03-19 12:33:20', '2026-03-19 12:33:20'),
(11, 1, 'updated', 'deduction_types', 3, '{\"id\":3,\"name\":\"Impuesto Vecinal\",\"abbreviation\":\"IMP\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":3,\"name\":\"Otras Deducciones II\",\"abbreviation\":\"Otros II\",\"is_active\":\"1\",\"sort_order\":\"11\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:33:58\"}', '2026-03-19 12:33:58', '2026-03-19 12:33:58'),
(12, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones I\",\"abbreviation\":\"Otros 1\",\"is_active\":1,\"sort_order\":10,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:33:20.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones I\",\"abbreviation\":\"Otros I\",\"is_active\":\"1\",\"sort_order\":\"10\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:34:29\"}', '2026-03-19 12:34:29', '2026-03-19 12:34:29'),
(13, 1, 'updated', 'deduction_types', 5, '{\"id\":5,\"name\":\"Colegio de Profesores\",\"abbreviation\":\"COL\",\"is_active\":1,\"sort_order\":0,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:13:10.000000Z\"}', '{\"id\":5,\"name\":\"Inasistencias\",\"abbreviation\":\"Inas\",\"is_active\":\"1\",\"sort_order\":\"13\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:35:19\"}', '2026-03-19 12:35:19', '2026-03-19 12:35:19'),
(14, 1, 'created', 'deduction_types', 13, NULL, '{\"name\":\"Aportacions INPREMA\",\"abbreviation\":\"A. INP\",\"sort_order\":\"2\",\"is_active\":true,\"updated_at\":\"2026-03-19 06:38:41\",\"created_at\":\"2026-03-19 06:38:41\",\"id\":13}', '2026-03-19 12:38:42', '2026-03-19 12:38:42'),
(15, 1, 'created', 'deduction_types', 14, NULL, '{\"name\":\"Prestamo INPREMA\",\"abbreviation\":\"P. INP\",\"sort_order\":\"3\",\"is_active\":true,\"updated_at\":\"2026-03-19 06:39:54\",\"created_at\":\"2026-03-19 06:39:54\",\"id\":14}', '2026-03-19 12:39:54', '2026-03-19 12:39:54'),
(16, 1, 'created', 'deduction_types', 15, NULL, '{\"name\":\"Prestamo Hipotecario INPREMA\",\"abbreviation\":\"P.H.INP\",\"sort_order\":\"4\",\"is_active\":true,\"updated_at\":\"2026-03-19 06:41:21\",\"created_at\":\"2026-03-19 06:41:21\",\"id\":15}', '2026-03-19 12:41:22', '2026-03-19 12:41:22'),
(17, 1, 'updated', 'deduction_types', 3, '{\"id\":3,\"name\":\"Otras Deducciones II\",\"abbreviation\":\"Otros II\",\"is_active\":1,\"sort_order\":11,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:33:58.000000Z\"}', '{\"id\":3,\"name\":\"Otras Deducciones II\",\"abbreviation\":\"Otros II\",\"is_active\":\"1\",\"sort_order\":\"12\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 06:45:43\"}', '2026-03-19 12:45:43', '2026-03-19 12:45:43'),
(18, 1, 'created', 'deduction_types', 16, NULL, '{\"name\":\"Area Social Preescolar\",\"abbreviation\":\"A.S.Pre\",\"sort_order\":\"9\",\"is_active\":true,\"updated_at\":\"2026-03-19 07:11:07\",\"created_at\":\"2026-03-19 07:11:07\",\"id\":16}', '2026-03-19 13:11:07', '2026-03-19 13:11:07'),
(19, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones I\",\"abbreviation\":\"Otros I\",\"is_active\":1,\"sort_order\":10,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:34:29.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones I\",\"abbreviation\":\"Otros I\",\"is_active\":\"1\",\"sort_order\":\"11\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 07:11:25\"}', '2026-03-19 13:11:25', '2026-03-19 13:11:25'),
(20, 1, 'created', 'deduction_types', 17, NULL, '{\"name\":\"Area Social Primaria\",\"abbreviation\":\"A.S.Pri\",\"sort_order\":\"10\",\"is_active\":true,\"updated_at\":\"2026-03-19 07:12:12\",\"created_at\":\"2026-03-19 07:12:12\",\"id\":17}', '2026-03-19 13:12:13', '2026-03-19 13:12:13'),
(21, 1, 'updated', 'employees', 1, '{\"id\":1,\"employee_code\":\"A0001\",\"dni\":\"0801196306453\",\"first_name\":\"ENA ELOISA\",\"last_name\":\"AVILA RODRIGUEZ\",\"ihss_number\":\"0801196306453\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"20202020202020\",\"email\":\"ena.avila@institutosagradocorazonlh.net\",\"level_id\":1,\"base_salary\":\"11200.00\",\"phone\":\"98347143\",\"status\":\"Activo\",\"hire_date\":\"1989-05-02\",\"created_at\":\"2026-03-19T17:30:42.000000Z\",\"updated_at\":\"2026-03-19T17:30:42.000000Z\"}', '{\"id\":1,\"employee_code\":\"A0001\",\"dni\":\"0801196306453\",\"first_name\":\"ENA ELOISA\",\"last_name\":\"AVILA RODRIGUEZ\",\"ihss_number\":\"0801196306453\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"20202020202020\",\"email\":\"ena.avila@institutosagradocorazonlh.net\",\"level_id\":\"1\",\"base_salary\":\"15000\",\"phone\":\"98347143\",\"status\":\"Activo\",\"hire_date\":\"1989-05-02\",\"created_at\":\"2026-03-19 17:30:42\",\"updated_at\":\"2026-03-19 17:40:56\"}', '2026-03-19 23:40:57', '2026-03-19 23:40:57'),
(22, 1, 'created', 'payrolls', 1, NULL, '{\"month\":\"3\",\"year\":\"2026\",\"level_id\":\"1\",\"status\":\"Borrador\",\"created_by\":1,\"updated_at\":\"2026-03-19 17:45:02\",\"created_at\":\"2026-03-19 17:45:02\",\"id\":1}', '2026-03-19 23:45:02', '2026-03-19 23:45:02'),
(23, 1, 'created', 'payroll_details', 1, NULL, '{\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":0,\"net_salary\":\"15000.00\",\"updated_at\":\"2026-03-19 17:45:02\",\"created_at\":\"2026-03-19 17:45:02\",\"id\":1}', '2026-03-19 23:45:02', '2026-03-19 23:45:02'),
(24, 1, 'updated', 'payroll_details', 1, '{\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":0,\"net_salary\":\"15000.00\",\"updated_at\":\"2026-03-19T17:45:02.000000Z\",\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"id\":1}', '{\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":0,\"net_salary\":15000,\"updated_at\":\"2026-03-19 17:45:02\",\"created_at\":\"2026-03-19 17:45:02\",\"id\":1}', '2026-03-19 23:45:02', '2026-03-19 23:45:02'),
(25, 1, 'updated', 'payroll_details', 1, '{\"id\":1,\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"15000.00\",\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T17:45:02.000000Z\"}', '{\"id\":1,\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":595.16,\"net_salary\":14404.84,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 17:47:23\"}', '2026-03-19 23:47:23', '2026-03-19 23:47:23'),
(26, 1, 'updated', 'deduction_types', 8, '{\"id\":8,\"name\":\"Cuota de Prestamo RAP\",\"abbreviation\":\"P. RAP\",\"is_active\":1,\"sort_order\":2,\"created_at\":\"2026-03-19T05:46:21.000000Z\",\"updated_at\":\"2026-03-19T05:46:21.000000Z\"}', '{\"id\":8,\"name\":\"Cuota de Prestamo RAP\",\"abbreviation\":\"P. RAP\",\"is_active\":\"1\",\"sort_order\":\"3\",\"created_at\":\"2026-03-19 05:46:21\",\"updated_at\":\"2026-03-19 17:51:53\"}', '2026-03-19 23:51:54', '2026-03-19 23:51:54'),
(27, 1, 'updated', 'deduction_types', 2, '{\"id\":2,\"name\":\"R\\u00e9gimen de Aportaciones Privadas\",\"abbreviation\":\"RAP\",\"is_active\":1,\"sort_order\":3,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T05:45:34.000000Z\"}', '{\"id\":2,\"name\":\"R\\u00e9gimen de Aportaciones Privadas\",\"abbreviation\":\"RAP\",\"is_active\":\"1\",\"sort_order\":\"2\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 17:52:12\"}', '2026-03-19 23:52:12', '2026-03-19 23:52:12'),
(28, 1, 'updated', 'deduction_types', 8, '{\"id\":8,\"name\":\"Cuota de Prestamo RAP\",\"abbreviation\":\"P. RAP\",\"is_active\":1,\"sort_order\":3,\"created_at\":\"2026-03-19T05:46:21.000000Z\",\"updated_at\":\"2026-03-19T17:51:53.000000Z\"}', '{\"id\":8,\"name\":\"Cuota de Prestamo RAP\",\"abbreviation\":\"PTMO. RAP\",\"is_active\":\"1\",\"sort_order\":\"3\",\"created_at\":\"2026-03-19 05:46:21\",\"updated_at\":\"2026-03-19 17:53:05\"}', '2026-03-19 23:53:05', '2026-03-19 23:53:05'),
(29, 1, 'updated', 'deduction_types', 9, '{\"id\":9,\"name\":\"Cuota Prestamo ISC\",\"abbreviation\":\"P. ISC\",\"is_active\":1,\"sort_order\":4,\"created_at\":\"2026-03-19T05:47:47.000000Z\",\"updated_at\":\"2026-03-19T05:47:47.000000Z\"}', '{\"id\":9,\"name\":\"Cuota Prestamo ISC\",\"abbreviation\":\"PTMO. ISC\",\"is_active\":\"1\",\"sort_order\":\"4\",\"created_at\":\"2026-03-19 05:47:47\",\"updated_at\":\"2026-03-19 17:53:35\"}', '2026-03-19 23:53:36', '2026-03-19 23:53:36'),
(30, 1, 'updated', 'deduction_types', 10, '{\"id\":10,\"name\":\"Anticipo de Sueldo\",\"abbreviation\":\"Ant.\",\"is_active\":1,\"sort_order\":5,\"created_at\":\"2026-03-19T05:49:49.000000Z\",\"updated_at\":\"2026-03-19T05:49:49.000000Z\"}', '{\"id\":10,\"name\":\"Anticipo de Sueldo\",\"abbreviation\":\"ANT SUELDO\",\"is_active\":\"1\",\"sort_order\":\"5\",\"created_at\":\"2026-03-19 05:49:49\",\"updated_at\":\"2026-03-19 17:54:04\"}', '2026-03-19 23:54:05', '2026-03-19 23:54:05'),
(31, 1, 'updated', 'deduction_types', 11, '{\"id\":11,\"name\":\"Prestamo de Banco Tabajadores\",\"abbreviation\":\"P.B,Tra.\",\"is_active\":1,\"sort_order\":6,\"created_at\":\"2026-03-19T05:57:18.000000Z\",\"updated_at\":\"2026-03-19T05:57:18.000000Z\"}', '{\"id\":11,\"name\":\"Prestamo de Banco Tabajadores\",\"abbreviation\":\"PTMO. CUST.\",\"is_active\":\"1\",\"sort_order\":\"6\",\"created_at\":\"2026-03-19 05:57:18\",\"updated_at\":\"2026-03-19 17:54:58\"}', '2026-03-19 23:54:58', '2026-03-19 23:54:58'),
(32, 1, 'updated', 'deduction_types', 12, '{\"id\":12,\"name\":\"Ahorro de Viaje\",\"abbreviation\":\"A. Via.\",\"is_active\":1,\"sort_order\":7,\"created_at\":\"2026-03-19T05:58:04.000000Z\",\"updated_at\":\"2026-03-19T05:58:04.000000Z\"}', '{\"id\":12,\"name\":\"Ahorro de Viaje\",\"abbreviation\":\"AHO. VIAJE\",\"is_active\":\"1\",\"sort_order\":\"7\",\"created_at\":\"2026-03-19 05:58:04\",\"updated_at\":\"2026-03-19 17:55:40\"}', '2026-03-19 23:55:40', '2026-03-19 23:55:40'),
(33, 1, 'updated', 'deduction_types', 6, '{\"id\":6,\"name\":\"Cooperativa Maestros\",\"abbreviation\":\"C. Mae\",\"is_active\":1,\"sort_order\":8,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:07:29.000000Z\"}', '{\"id\":6,\"name\":\"Cooperativa Maestros\",\"abbreviation\":\"COO. MAES.\",\"is_active\":\"1\",\"sort_order\":\"8\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 17:56:17\"}', '2026-03-19 23:56:17', '2026-03-19 23:56:17'),
(34, 1, 'updated', 'deduction_types', 7, '{\"id\":7,\"name\":\"Area Social\",\"abbreviation\":\"A. Social\",\"is_active\":1,\"sort_order\":9,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:30:21.000000Z\"}', '{\"id\":7,\"name\":\"Area Social\",\"abbreviation\":\"COM. SOC.\",\"is_active\":\"1\",\"sort_order\":\"9\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 17:56:43\"}', '2026-03-19 23:56:43', '2026-03-19 23:56:43'),
(35, 1, 'updated', 'deduction_types', 7, '{\"id\":7,\"name\":\"Area Social\",\"abbreviation\":\"COM. SOC.\",\"is_active\":1,\"sort_order\":9,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T17:56:43.000000Z\"}', '{\"id\":7,\"name\":\"COMITE SOCIAL\",\"abbreviation\":\"COM. SOC.\",\"is_active\":\"1\",\"sort_order\":\"9\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 17:57:44\"}', '2026-03-19 23:57:44', '2026-03-19 23:57:44'),
(36, 1, 'updated', 'deduction_types', 5, '{\"id\":5,\"name\":\"Inasistencias\",\"abbreviation\":\"Inas\",\"is_active\":1,\"sort_order\":13,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:35:19.000000Z\"}', '{\"id\":5,\"name\":\"INASISTENCIAS\",\"abbreviation\":\"INAS.\",\"is_active\":\"1\",\"sort_order\":\"14\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 17:59:18\"}', '2026-03-19 23:59:19', '2026-03-19 23:59:19'),
(37, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones I\",\"abbreviation\":\"Otros I\",\"is_active\":1,\"sort_order\":11,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T07:11:25.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":\"1\",\"sort_order\":\"11\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 18:01:26\"}', '2026-03-20 00:01:27', '2026-03-20 00:01:27'),
(38, 1, 'updated', 'deduction_types', 3, '{\"id\":3,\"name\":\"Otras Deducciones II\",\"abbreviation\":\"Otros II\",\"is_active\":1,\"sort_order\":12,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T06:45:43.000000Z\"}', '{\"id\":3,\"name\":\"Otras Deducciones II\",\"abbreviation\":\"OTROS 2\",\"is_active\":\"1\",\"sort_order\":\"12\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-19 18:02:38\"}', '2026-03-20 00:02:38', '2026-03-20 00:02:38'),
(39, 1, 'created', 'deduction_types', 18, NULL, '{\"name\":\"OTRAS DEDUCCIONES\",\"abbreviation\":\"OTROS 3\",\"sort_order\":\"13\",\"is_active\":true,\"updated_at\":\"2026-03-19 18:05:21\",\"created_at\":\"2026-03-19 18:05:21\",\"id\":18}', '2026-03-20 00:05:22', '2026-03-20 00:05:22'),
(40, 1, 'updated', 'payroll_details', 1, '{\"id\":1,\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":\"595.16\",\"net_salary\":\"14404.84\",\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T17:47:23.000000Z\"}', '{\"id\":1,\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":2468.94,\"net_salary\":12531.06,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 18:07:18\"}', '2026-03-20 00:07:18', '2026-03-20 00:07:18'),
(41, 1, 'updated', 'payroll_details', 1, '{\"id\":1,\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":\"2468.94\",\"net_salary\":\"12531.06\",\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T18:07:18.000000Z\"}', '{\"id\":1,\"payroll_id\":1,\"employee_id\":1,\"base_salary\":\"15000.00\",\"total_deductions\":2493.94,\"net_salary\":12506.06,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 18:07:29\"}', '2026-03-20 00:07:29', '2026-03-20 00:07:29'),
(42, 1, 'updated', 'payrolls', 1, '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T17:45:02.000000Z\"}', '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 18:08:14\"}', '2026-03-20 00:08:14', '2026-03-20 00:08:14'),
(43, 1, 'updated', 'payrolls', 1, '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T18:08:14.000000Z\"}', '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 18:13:18\"}', '2026-03-20 00:13:18', '2026-03-20 00:13:18'),
(44, 1, 'updated', 'payrolls', 1, '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T18:13:18.000000Z\"}', '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 18:13:43\"}', '2026-03-20 00:13:43', '2026-03-20 00:13:43'),
(45, 1, 'updated', 'payrolls', 1, '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-19T17:45:02.000000Z\",\"updated_at\":\"2026-03-19T18:13:43.000000Z\"}', '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Aprobada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":1,\"observations\":null,\"created_at\":\"2026-03-19 17:45:02\",\"updated_at\":\"2026-03-19 18:13:53\"}', '2026-03-20 00:13:53', '2026-03-20 00:13:53'),
(46, 1, 'updated', 'employees', 1, '{\"id\":1,\"employee_code\":\"A0001\",\"dni\":\"0801196306453\",\"first_name\":\"ENA ELOISA\",\"last_name\":\"AVILA RODRIGUEZ\",\"ihss_number\":\"0801196306453\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"20202020202020\",\"email\":\"ena.avila@institutosagradocorazonlh.net\",\"level_id\":1,\"base_salary\":\"15000.00\",\"phone\":\"98347143\",\"status\":\"Activo\",\"hire_date\":\"1989-05-02\",\"created_at\":\"2026-03-19T17:30:42.000000Z\",\"updated_at\":\"2026-03-19T17:40:56.000000Z\"}', '{\"id\":1,\"employee_code\":\"A0001\",\"dni\":\"0801196306453\",\"first_name\":\"ENA ELOISA\",\"last_name\":\"AVILA RODRIGUEZ\",\"ihss_number\":\"0801196306453\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"20202020202020\",\"email\":\"ena.avila@institutosagradocorazonlh.net\",\"level_id\":1,\"base_salary\":\"15000.00\",\"phone\":\"98347143\",\"status\":\"Inactivo\",\"hire_date\":\"1989-05-02\",\"created_at\":\"2026-03-19 17:30:42\",\"updated_at\":\"2026-03-22 16:17:35\"}', '2026-03-22 22:17:35', '2026-03-22 22:17:35'),
(47, 1, 'updated', 'deduction_types', 13, '{\"id\":13,\"name\":\"Aportacions INPREMA\",\"abbreviation\":\"A. INP\",\"is_active\":1,\"sort_order\":2,\"created_at\":\"2026-03-19T06:38:41.000000Z\",\"updated_at\":\"2026-03-19T06:38:41.000000Z\"}', '{\"id\":13,\"name\":\"Aportacions INPREMA\",\"abbreviation\":\"INPREMA\",\"is_active\":\"1\",\"sort_order\":\"2\",\"created_at\":\"2026-03-19 06:38:41\",\"updated_at\":\"2026-03-22 19:19:39\"}', '2026-03-23 01:19:39', '2026-03-23 01:19:39'),
(48, 1, 'updated', 'deduction_types', 14, '{\"id\":14,\"name\":\"Prestamo INPREMA\",\"abbreviation\":\"P. INP\",\"is_active\":1,\"sort_order\":3,\"created_at\":\"2026-03-19T06:39:54.000000Z\",\"updated_at\":\"2026-03-19T06:39:54.000000Z\"}', '{\"id\":14,\"name\":\"Prestamo INPREMA\",\"abbreviation\":\"PTMO. INP\",\"is_active\":\"1\",\"sort_order\":\"3\",\"created_at\":\"2026-03-19 06:39:54\",\"updated_at\":\"2026-03-22 19:21:09\"}', '2026-03-23 01:21:09', '2026-03-23 01:21:09'),
(49, 1, 'updated', 'deduction_types', 15, '{\"id\":15,\"name\":\"Prestamo Hipotecario INPREMA\",\"abbreviation\":\"P.H.INP\",\"is_active\":1,\"sort_order\":4,\"created_at\":\"2026-03-19T06:41:21.000000Z\",\"updated_at\":\"2026-03-19T06:41:21.000000Z\"}', '{\"id\":15,\"name\":\"Prestamo Hipotecario INPREMA\",\"abbreviation\":\"PTMO. HIP.INP.\",\"is_active\":\"1\",\"sort_order\":\"4\",\"created_at\":\"2026-03-19 06:41:21\",\"updated_at\":\"2026-03-22 19:21:58\"}', '2026-03-23 01:21:59', '2026-03-23 01:21:59'),
(50, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":1,\"sort_order\":11,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T18:01:26.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":\"1\",\"sort_order\":\"12\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:35:45\"}', '2026-03-23 01:35:45', '2026-03-23 01:35:45'),
(51, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":1,\"sort_order\":12,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-22T19:35:45.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":\"1\",\"sort_order\":\"13\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:35:55\"}', '2026-03-23 01:35:55', '2026-03-23 01:35:55'),
(52, 1, 'updated', 'deduction_types', 3, '{\"id\":3,\"name\":\"Otras Deducciones II\",\"abbreviation\":\"OTROS 2\",\"is_active\":1,\"sort_order\":12,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T18:02:38.000000Z\"}', '{\"id\":3,\"name\":\"Otras Deducciones 2\",\"abbreviation\":\"OTROS 2\",\"is_active\":\"1\",\"sort_order\":\"12\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:36:29\"}', '2026-03-23 01:36:29', '2026-03-23 01:36:29'),
(53, 1, 'updated', 'deduction_types', 3, '{\"id\":3,\"name\":\"Otras Deducciones 2\",\"abbreviation\":\"OTROS 2\",\"is_active\":1,\"sort_order\":12,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-22T19:36:29.000000Z\"}', '{\"id\":3,\"name\":\"Otras Deducciones 2\",\"abbreviation\":\"OTROS 2\",\"is_active\":\"1\",\"sort_order\":\"13\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:36:42\"}', '2026-03-23 01:36:42', '2026-03-23 01:36:42'),
(54, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":1,\"sort_order\":13,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-22T19:35:55.000000Z\"}', '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":\"1\",\"sort_order\":\"12\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:36:52\"}', '2026-03-23 01:36:52', '2026-03-23 01:36:52'),
(55, 1, 'updated', 'deduction_types', 18, '{\"id\":18,\"name\":\"OTRAS DEDUCCIONES\",\"abbreviation\":\"OTROS 3\",\"is_active\":1,\"sort_order\":13,\"created_at\":\"2026-03-19T18:05:21.000000Z\",\"updated_at\":\"2026-03-19T18:05:21.000000Z\"}', '{\"id\":18,\"name\":\"OTRAS DEDUCCIONES 3\",\"abbreviation\":\"OTROS 3\",\"is_active\":\"1\",\"sort_order\":\"13\",\"created_at\":\"2026-03-19 18:05:21\",\"updated_at\":\"2026-03-22 19:37:19\"}', '2026-03-23 01:37:19', '2026-03-23 01:37:19'),
(56, 1, 'updated', 'deduction_types', 3, '{\"id\":3,\"name\":\"Otras Deducciones 2\",\"abbreviation\":\"OTROS 2\",\"is_active\":1,\"sort_order\":13,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-22T19:36:42.000000Z\"}', '{\"id\":3,\"name\":\"OTRAS DEDUCCIONES 2\",\"abbreviation\":\"OTROS 2\",\"is_active\":\"1\",\"sort_order\":\"13\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:37:29\"}', '2026-03-23 01:37:30', '2026-03-23 01:37:30'),
(57, 1, 'updated', 'deduction_types', 4, '{\"id\":4,\"name\":\"Otras Deducciones 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":1,\"sort_order\":12,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-22T19:36:52.000000Z\"}', '{\"id\":4,\"name\":\"OTRAS DEDUCCIONES 1\",\"abbreviation\":\"OTROS 1\",\"is_active\":\"1\",\"sort_order\":\"12\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:37:56\"}', '2026-03-23 01:37:56', '2026-03-23 01:37:56'),
(58, 1, 'updated', 'deduction_types', 18, '{\"id\":18,\"name\":\"OTRAS DEDUCCIONES 3\",\"abbreviation\":\"OTROS 3\",\"is_active\":1,\"sort_order\":13,\"created_at\":\"2026-03-19T18:05:21.000000Z\",\"updated_at\":\"2026-03-22T19:37:19.000000Z\"}', '{\"id\":18,\"name\":\"OTRAS DEDUCCIONES 3\",\"abbreviation\":\"OTROS 3\",\"is_active\":\"1\",\"sort_order\":\"14\",\"created_at\":\"2026-03-19 18:05:21\",\"updated_at\":\"2026-03-22 19:38:12\"}', '2026-03-23 01:38:12', '2026-03-23 01:38:12'),
(59, 1, 'updated', 'deduction_types', 5, '{\"id\":5,\"name\":\"INASISTENCIAS\",\"abbreviation\":\"INAS.\",\"is_active\":1,\"sort_order\":14,\"created_at\":\"2026-03-19T05:13:10.000000Z\",\"updated_at\":\"2026-03-19T17:59:18.000000Z\"}', '{\"id\":5,\"name\":\"INASISTENCIAS\",\"abbreviation\":\"INASIST.\",\"is_active\":\"1\",\"sort_order\":\"15\",\"created_at\":\"2026-03-19 05:13:10\",\"updated_at\":\"2026-03-22 19:38:36\"}', '2026-03-23 01:38:36', '2026-03-23 01:38:36'),
(60, 1, 'updated', 'deduction_types', 16, '{\"id\":16,\"name\":\"Area Social Preescolar\",\"abbreviation\":\"A.S.Pre\",\"is_active\":1,\"sort_order\":9,\"created_at\":\"2026-03-19T07:11:07.000000Z\",\"updated_at\":\"2026-03-19T07:11:07.000000Z\"}', '{\"id\":16,\"name\":\"Area Social Preescolar\",\"abbreviation\":\"A.S.Pre\",\"is_active\":\"0\",\"sort_order\":\"9\",\"created_at\":\"2026-03-19 07:11:07\",\"updated_at\":\"2026-03-22 19:41:01\"}', '2026-03-23 01:41:01', '2026-03-23 01:41:01'),
(61, 1, 'updated', 'deduction_types', 17, '{\"id\":17,\"name\":\"Area Social Primaria\",\"abbreviation\":\"A.S.Pri\",\"is_active\":1,\"sort_order\":10,\"created_at\":\"2026-03-19T07:12:12.000000Z\",\"updated_at\":\"2026-03-19T07:12:12.000000Z\"}', '{\"id\":17,\"name\":\"Area Social Primaria\",\"abbreviation\":\"A.S.Pri\",\"is_active\":\"0\",\"sort_order\":\"10\",\"created_at\":\"2026-03-19 07:12:12\",\"updated_at\":\"2026-03-22 19:41:11\"}', '2026-03-23 01:41:11', '2026-03-23 01:41:11'),
(62, 1, 'created', 'employees', 1, NULL, '{\"dni\":\"0801198610505\",\"employee_code\":\"A0001\",\"first_name\":\"ALEJANDRA MARIA\",\"last_name\":\"ALMENDARES LOPEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213010112167\",\"email\":\"\",\"level_id\":3,\"base_salary\":19042.04,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":1}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(63, 1, 'created', 'payroll_levels', 6, NULL, '{\"name\":\"ADMINISTRACIONY APOYO\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":6}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(64, 1, 'created', 'employees', 2, NULL, '{\"dni\":\"1210198300048\",\"employee_code\":\"L0001\",\"first_name\":\"ALVA SUYAPA\",\"last_name\":\"LOPEZ GARCIA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220008528\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":2}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(65, 1, 'created', 'employees', 3, NULL, '{\"dni\":\"0801196307898\",\"employee_code\":\"C0001\",\"first_name\":\"ANA ALICIA\",\"last_name\":\"CALIX PAVON\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010120378\",\"email\":\"\",\"level_id\":3,\"base_salary\":21029.32,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":3}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(66, 1, 'created', 'employees', 4, NULL, '{\"dni\":\"0801200411064\",\"employee_code\":\"F0001\",\"first_name\":\"ANA GABRIELA\",\"last_name\":\"FLORES OLIVA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060174751\",\"email\":\"\",\"level_id\":4,\"base_salary\":18589.05,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":4}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(67, 1, 'created', 'employees', 5, NULL, '{\"dni\":\"0801196608347\",\"employee_code\":\"M0001\",\"first_name\":\"ANA MARIA\",\"last_name\":\"MOLINA SALGADO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010120351\",\"email\":\"\",\"level_id\":4,\"base_salary\":19664.68,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":5}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(68, 1, 'created', 'employees', 6, NULL, '{\"dni\":\"0801199103154\",\"employee_code\":\"R0001\",\"first_name\":\"ANGELA CARINA\",\"last_name\":\"RUIZ ALVARADO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213000343492\",\"email\":\"\",\"level_id\":3,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":6}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(69, 1, 'created', 'employees', 7, NULL, '{\"dni\":\"0827198000090\",\"employee_code\":\"A0002\",\"first_name\":\"CARLOS ALFREDO\",\"last_name\":\"AGUILAR MARADIAGA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050129540\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":7}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(70, 1, 'created', 'employees', 8, NULL, '{\"dni\":\"0612199900066\",\"employee_code\":\"P0001\",\"first_name\":\"CESIA GRISEL\",\"last_name\":\"PEREZ FLORES\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213010223279\",\"email\":\"\",\"level_id\":4,\"base_salary\":18589.05,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":8}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(71, 1, 'created', 'employees', 9, NULL, '{\"dni\":\"0801199205697\",\"employee_code\":\"J0001\",\"first_name\":\"CINDY JOSELIN\",\"last_name\":\"JACINTO YANES\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213010143291\",\"email\":\"\",\"level_id\":3,\"base_salary\":18668.2,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":9}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(72, 1, 'created', 'employees', 10, NULL, '{\"dni\":\"0801197405937\",\"employee_code\":\"C0002\",\"first_name\":\"CLAUDIA PATRICIA\",\"last_name\":\"CASTRO MEJIA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213110012610\",\"email\":\"\",\"level_id\":3,\"base_salary\":19416.16,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":10}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(73, 1, 'created', 'employees', 11, NULL, '{\"dni\":\"0801198418090\",\"employee_code\":\"N0001\",\"first_name\":\"CLAUDIA PATRICIA\",\"last_name\":\"NAVAS VELASQUEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050046408\",\"email\":\"\",\"level_id\":3,\"base_salary\":22916.16,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":11}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(74, 1, 'created', 'employees', 12, NULL, '{\"dni\":\"1505198600464\",\"employee_code\":\"M0002\",\"first_name\":\"DANIA ADELINA\",\"last_name\":\"MEDRANO ESCA\\u00d1O\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220004646\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":12}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(75, 1, 'created', 'employees', 13, NULL, '{\"dni\":\"0801199604400\",\"employee_code\":\"S0001\",\"first_name\":\"DANIELA ENEYDA\",\"last_name\":\"SUAZO ANDINO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213010140217\",\"email\":\"\",\"level_id\":4,\"base_salary\":20157.06,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":13}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(76, 1, 'created', 'employees', 14, NULL, '{\"dni\":\"0801200015292\",\"employee_code\":\"P0002\",\"first_name\":\"DAVID ALEJANDRO\",\"last_name\":\"PEREZ VALENZUELA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213080142472\",\"email\":\"\",\"level_id\":4,\"base_salary\":19119.44,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":14}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(77, 1, 'created', 'employees', 15, NULL, '{\"dni\":\"1206198600149\",\"employee_code\":\"G0001\",\"first_name\":\"DELMIS SUYAPA\",\"last_name\":\"GARCIA MEJIA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060062767\",\"email\":\"\",\"level_id\":4,\"base_salary\":21033.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":15}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(78, 1, 'created', 'employees', 16, NULL, '{\"dni\":\"0703197301521\",\"employee_code\":\"V0001\",\"first_name\":\"DELMY LIZETH\",\"last_name\":\"VALLADARES VARELA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213000061586\",\"email\":\"\",\"level_id\":3,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":16}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(79, 1, 'created', 'employees', 17, NULL, '{\"dni\":\"0801199914221\",\"employee_code\":\"S0002\",\"first_name\":\"DIEGO ANDRES\",\"last_name\":\"SIERRA DURON\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213180170710\",\"email\":\"\",\"level_id\":3,\"base_salary\":19091.45,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":17}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(80, 1, 'created', 'employees', 18, NULL, '{\"dni\":\"0801196306453\",\"employee_code\":\"A0003\",\"first_name\":\"ENA ELOISA\",\"last_name\":\"AVILA RODRIGUEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010120459\",\"email\":\"\",\"level_id\":6,\"base_salary\":22530.56,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":18}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(81, 1, 'created', 'employees', 19, NULL, '{\"dni\":\"0801199521125\",\"employee_code\":\"G0002\",\"first_name\":\"ESTEFANY NICOLE\",\"last_name\":\"GALINDO FLORES\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213080089172\",\"email\":\"\",\"level_id\":2,\"base_salary\":17040,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":19}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(82, 1, 'created', 'employees', 20, NULL, '{\"dni\":\"0801200222376\",\"employee_code\":\"M0003\",\"first_name\":\"ETHAN ANDRE\",\"last_name\":\"MARTINEZ HERNANDEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060174760\",\"email\":\"\",\"level_id\":4,\"base_salary\":19196.58,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":20}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(83, 1, 'created', 'employees', 21, NULL, '{\"dni\":\"0801197006339\",\"employee_code\":\"G0003\",\"first_name\":\"FATY YONABEL\",\"last_name\":\"GONZALEZ ALONZO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220023721\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":21}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(84, 1, 'created', 'employees', 22, NULL, '{\"dni\":\"0607196800378\",\"employee_code\":\"C0003\",\"first_name\":\"FRANCISCO\",\"last_name\":\"CRUZ ESCOBAR\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220058754\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":22}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(85, 1, 'created', 'employees', 23, NULL, '{\"dni\":\"0801199216105\",\"employee_code\":\"M0004\",\"first_name\":\"GABRIELA ALEJANDRA\",\"last_name\":\"MARTINEZ ORTEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213120019943\",\"email\":\"\",\"level_id\":4,\"base_salary\":19042.04,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":23}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(86, 1, 'created', 'employees', 24, NULL, '{\"dni\":\"0801199501985\",\"employee_code\":\"V0002\",\"first_name\":\"GABRIELA IVETH\",\"last_name\":\"VILLEDA ZEPEDA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213130064852\",\"email\":\"\",\"level_id\":6,\"base_salary\":17040,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":24}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(87, 1, 'created', 'employees', 25, NULL, '{\"dni\":\"0311199800017\",\"employee_code\":\"A0004\",\"first_name\":\"GENESIS GABRIELA\",\"last_name\":\"AQUINO COREA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213210052362\",\"email\":\"\",\"level_id\":3,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":25}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(88, 1, 'created', 'employees', 26, NULL, '{\"dni\":\"0823198900124\",\"employee_code\":\"Z0001\",\"first_name\":\"GERSON JAVIER\",\"last_name\":\"ZELAYA SALGADO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220039040\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":26}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(89, 1, 'created', 'employees', 27, NULL, '{\"dni\":\"0816198200534\",\"employee_code\":\"C0004\",\"first_name\":\"GLENDA XIOMARA\",\"last_name\":\"CANALES AMADOR\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050018188\",\"email\":\"\",\"level_id\":4,\"base_salary\":18778.72,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":27}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(90, 1, 'created', 'employees', 28, NULL, '{\"dni\":\"0801198614257\",\"employee_code\":\"U0001\",\"first_name\":\"HAROL DAVID\",\"last_name\":\"UMANZOR RIVERA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213010108372\",\"email\":\"\",\"level_id\":4,\"base_salary\":17977.04,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":28}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(91, 1, 'created', 'employees', 29, NULL, '{\"dni\":\"0716199400304\",\"employee_code\":\"R0002\",\"first_name\":\"IHARA NAHOMY\",\"last_name\":\"RODRIGUEZ SANCHEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060072045\",\"email\":\"\",\"level_id\":4,\"base_salary\":18086.64,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":29}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(92, 1, 'created', 'employees', 30, NULL, '{\"dni\":\"0801198615369\",\"employee_code\":\"F0002\",\"first_name\":\"ILIANA YAHAIRA\",\"last_name\":\"FLORES ZELAYA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213000277686\",\"email\":\"\",\"level_id\":6,\"base_salary\":19593.17,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":30}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(93, 1, 'created', 'employees', 31, NULL, '{\"dni\":\"0826199800242\",\"employee_code\":\"B0001\",\"first_name\":\"JAKLIN YOLIBETH\",\"last_name\":\"BUSTILLO CERRATO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220059424\",\"email\":\"\",\"level_id\":3,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":31}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(94, 1, 'created', 'employees', 32, NULL, '{\"dni\":\"1806200100320\",\"employee_code\":\"D0001\",\"first_name\":\"JENIFER MICHELLE\",\"last_name\":\"DUBON DIAZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060158500\",\"email\":\"\",\"level_id\":4,\"base_salary\":20201.4,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":32}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(95, 1, 'created', 'employees', 33, NULL, '{\"dni\":\"0801199407242\",\"employee_code\":\"A0005\",\"first_name\":\"JENNIFER LIZETH\",\"last_name\":\"ANDRADE FLORES\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213090167885\",\"email\":\"\",\"level_id\":4,\"base_salary\":16380.77,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":33}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(96, 1, 'created', 'employees', 34, NULL, '{\"dni\":\"0809198600193\",\"employee_code\":\"R0003\",\"first_name\":\"JENNY MARITZA\",\"last_name\":\"RAMOS MARTINEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213180148120\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":34}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(97, 1, 'created', 'employees', 35, NULL, '{\"dni\":\"1503197401292\",\"employee_code\":\"M0005\",\"first_name\":\"JESSICA YESSENIA\",\"last_name\":\"MORALES SILVA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060158780\",\"email\":\"\",\"level_id\":6,\"base_salary\":17040,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":35}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(98, 1, 'created', 'employees', 36, NULL, '{\"dni\":\"0801199819710\",\"employee_code\":\"M0006\",\"first_name\":\"JOHAN LIZANDRO\",\"last_name\":\"MATAMOROS PINEDA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050096626\",\"email\":\"\",\"level_id\":6,\"base_salary\":19000,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":36}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(99, 1, 'created', 'employees', 37, NULL, '{\"dni\":\"0401197700754\",\"employee_code\":\"L0002\",\"first_name\":\"JOSE AMELIO\",\"last_name\":\"LOPEZ COREA\",\"ihss_number\":\"B1998197700754\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220004638\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":37}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(100, 1, 'created', 'employees', 38, NULL, '{\"dni\":\"0607197000496\",\"employee_code\":\"C0005\",\"first_name\":\"JOSE MANUEL\",\"last_name\":\"CRUZ ESCOBAR\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213090147396\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":38}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(101, 1, 'created', 'employees', 39, NULL, '{\"dni\":\"0801198804809\",\"employee_code\":\"M0007\",\"first_name\":\"JOSE MOISES\",\"last_name\":\"MACHADO GARCIA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220016458\",\"email\":\"\",\"level_id\":6,\"base_salary\":20605.65,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":39}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(102, 1, 'created', 'employees', 40, NULL, '{\"dni\":\"0801199404679\",\"employee_code\":\"F0003\",\"first_name\":\"JOSSELINE ALEXANDRA\",\"last_name\":\"FLORES VARGAS\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220041266\",\"email\":\"\",\"level_id\":2,\"base_salary\":17603.2,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":40}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(103, 1, 'created', 'employees', 41, NULL, '{\"dni\":\"0801199110724\",\"employee_code\":\"M0008\",\"first_name\":\"JOSUE DAVID\",\"last_name\":\"MARTINEZ ORTEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213120012655\",\"email\":\"\",\"level_id\":3,\"base_salary\":18000,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":41}', '2026-03-24 10:59:11', '2026-03-24 10:59:11');
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(104, 1, 'created', 'employees', 42, NULL, '{\"dni\":\"0813197900115\",\"employee_code\":\"A0006\",\"first_name\":\"JUAN RAMON\",\"last_name\":\"ALONZO MARTINEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220070495\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":42}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(105, 1, 'created', 'employees', 43, NULL, '{\"dni\":\"0818199600104\",\"employee_code\":\"M0009\",\"first_name\":\"KATHERINE NOHEMY\",\"last_name\":\"MONTOYA BAUTISTA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213270127075\",\"email\":\"\",\"level_id\":4,\"base_salary\":19593.86,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":43}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(106, 1, 'created', 'employees', 44, NULL, '{\"dni\":\"1317199700087\",\"employee_code\":\"R0004\",\"first_name\":\"KEYLIN MARIELA\",\"last_name\":\"RAMOS DIAZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213130050517\",\"email\":\"\",\"level_id\":3,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":44}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(107, 1, 'created', 'employees', 45, NULL, '{\"dni\":\"0801199602302\",\"employee_code\":\"C0006\",\"first_name\":\"LILIAN NICOLE\",\"last_name\":\"CHAVARRIA BERTOTTI\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213180149398\",\"email\":\"\",\"level_id\":3,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":45}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(108, 1, 'created', 'employees', 46, NULL, '{\"dni\":\"0801196703201\",\"employee_code\":\"M0010\",\"first_name\":\"MARIA ANTONIA\",\"last_name\":\"MONTALVO AMADOR\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010120416\",\"email\":\"\",\"level_id\":3,\"base_salary\":21529.32,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":46}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(109, 1, 'created', 'employees', 47, NULL, '{\"dni\":\"0801199001255\",\"employee_code\":\"S0003\",\"first_name\":\"MARIA JOSE\",\"last_name\":\"SARAVIA MEJIA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213210067270\",\"email\":\"\",\"level_id\":2,\"base_salary\":18105,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":47}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(110, 1, 'created', 'employees', 48, NULL, '{\"dni\":\"0801196604221\",\"employee_code\":\"B0002\",\"first_name\":\"MARTHA MARIA\",\"last_name\":\"BORJAS GALO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050025044\",\"email\":\"\",\"level_id\":4,\"base_salary\":21816.78,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":48}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(111, 1, 'created', 'employees', 49, NULL, '{\"dni\":\"1313198800030\",\"employee_code\":\"V0003\",\"first_name\":\"MARTINA\",\"last_name\":\"VILLEDA VEGA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220043684\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":49}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(112, 1, 'created', 'employees', 50, NULL, '{\"dni\":\"1809199500153\",\"employee_code\":\"H0001\",\"first_name\":\"MICHELLE ALEJANDRA\",\"last_name\":\"HERNANDEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213090117667\",\"email\":\"\",\"level_id\":3,\"base_salary\":18668.2,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":50}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(113, 1, 'created', 'employees', 51, NULL, '{\"dni\":\"0801200110958\",\"employee_code\":\"C0007\",\"first_name\":\"OLGA FABIOLA\",\"last_name\":\"CARRASCO ANDINO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213180187745\",\"email\":\"\",\"level_id\":2,\"base_salary\":17040,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":51}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(114, 1, 'created', 'employees', 52, NULL, '{\"dni\":\"0801199024891\",\"employee_code\":\"F0004\",\"first_name\":\"PABLO ANTOTIO\",\"last_name\":\"FUNEZ ORDO\\u00d1EZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060108562\",\"email\":\"\",\"level_id\":4,\"base_salary\":19334.47,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":52}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(115, 1, 'created', 'employees', 53, NULL, '{\"dni\":\"0801200219821\",\"employee_code\":\"B0003\",\"first_name\":\"PAOLA FERNANDA\",\"last_name\":\"BRACAMONTE FLORES\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213060185133\",\"email\":\"\",\"level_id\":4,\"base_salary\":16579.42,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":53}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(116, 1, 'created', 'employees', 54, NULL, '{\"dni\":\"0801199519985\",\"employee_code\":\"V0004\",\"first_name\":\"PEDRO SAMUEL\",\"last_name\":\"VASQUEZ RODRIGUEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050137098\",\"email\":\"\",\"level_id\":3,\"base_salary\":16579.42,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":54}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(117, 1, 'created', 'employees', 55, NULL, '{\"dni\":\"0801197401221\",\"employee_code\":\"R0005\",\"first_name\":\"RAFAEL RICARDO\",\"last_name\":\"ROSALES MENDEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213050023670\",\"email\":\"\",\"level_id\":4,\"base_salary\":24758.42,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":55}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(118, 1, 'created', 'employees', 56, NULL, '{\"dni\":\"0801199720130\",\"employee_code\":\"Z0002\",\"first_name\":\"RIGOBERTO JOSUE\",\"last_name\":\"ZELAYA RODRIGUEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213130066073\",\"email\":\"\",\"level_id\":4,\"base_salary\":17902,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":56}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(119, 1, 'created', 'employees', 57, NULL, '{\"dni\":\"0801198917495\",\"employee_code\":\"G0004\",\"first_name\":\"RODRIGO JOSUE\",\"last_name\":\"GARCIA DAVILA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213260125746\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":57}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(120, 1, 'created', 'employees', 58, NULL, '{\"dni\":\"0801196806693\",\"employee_code\":\"M0011\",\"first_name\":\"SANDRA BELINDA\",\"last_name\":\"MOLINA SALGADO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010120394\",\"email\":\"\",\"level_id\":4,\"base_salary\":25431.38,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":58}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(121, 1, 'created', 'employees', 59, NULL, '{\"dni\":\"0611199500501\",\"employee_code\":\"G0005\",\"first_name\":\"SAUDY MARIELA\",\"last_name\":\"GARCIA BACA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213270175010\",\"email\":\"\",\"level_id\":4,\"base_salary\":20140.64,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":59}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(122, 1, 'created', 'employees', 60, NULL, '{\"dni\":\"0813197200015\",\"employee_code\":\"G0006\",\"first_name\":\"SILVIA MARINA\",\"last_name\":\"GONZALEZ GONZALEZ\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010120505\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":60}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(123, 1, 'created', 'employees', 61, NULL, '{\"dni\":\"0801199610805\",\"employee_code\":\"O0001\",\"first_name\":\"SIUGAN YASMARY\",\"last_name\":\"OYUELA ESPINAL\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213090087563\",\"email\":\"\",\"level_id\":3,\"base_salary\":19042.04,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":61}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(124, 1, 'created', 'employees', 62, NULL, '{\"dni\":\"1301197000034\",\"employee_code\":\"O0002\",\"first_name\":\"TERESA JACKELINE\",\"last_name\":\"ORTEZ VILLANUEVA\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"210010118950\",\"email\":\"\",\"level_id\":4,\"base_salary\":23699.01,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":62}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(125, 1, 'created', 'employees', 63, NULL, '{\"dni\":\"0809199300384\",\"employee_code\":\"M0012\",\"first_name\":\"WENDY ARACELY\",\"last_name\":\"MARTINEZ RAMOS\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213010178559\",\"email\":\"\",\"level_id\":6,\"base_salary\":15115.31,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":63}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(126, 1, 'created', 'employees', 64, NULL, '{\"dni\":\"0801197607178\",\"employee_code\":\"A0007\",\"first_name\":\"YENI CAROLINA\",\"last_name\":\"AVILA GALO\",\"ihss_number\":\"\",\"bank_name\":\"BANPAIS\",\"bank_account\":\"213220041240\",\"email\":\"\",\"level_id\":6,\"base_salary\":17608.85,\"phone\":\"\",\"hire_date\":\"2026-03-24\",\"status\":\"Activo\",\"updated_at\":\"2026-03-24 04:59:11\",\"created_at\":\"2026-03-24 04:59:11\",\"id\":64}', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(127, 1, 'created', 'payrolls', 1, NULL, '{\"month\":\"3\",\"year\":\"2026\",\"level_id\":\"1\",\"status\":\"Borrador\",\"created_by\":1,\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":1}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(128, 1, 'created', 'payroll_details', 1, NULL, '{\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":1}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(129, 1, 'created', 'payroll_details', 2, NULL, '{\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":2}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(130, 1, 'created', 'payroll_details', 3, NULL, '{\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":3}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(131, 1, 'created', 'payroll_details', 4, NULL, '{\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":0,\"net_salary\":\"22530.56\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":4}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(132, 1, 'created', 'payroll_details', 5, NULL, '{\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":5}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(133, 1, 'created', 'payroll_details', 6, NULL, '{\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":6}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(134, 1, 'created', 'payroll_details', 7, NULL, '{\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":7}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(135, 1, 'updated', 'payroll_details', 7, '{\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"id\":7}', '{\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":17040,\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":7}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(136, 1, 'created', 'payroll_details', 8, NULL, '{\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":8}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(137, 1, 'created', 'payroll_details', 9, NULL, '{\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":0,\"net_salary\":\"19593.17\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":9}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(138, 1, 'created', 'payroll_details', 10, NULL, '{\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":10}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(139, 1, 'created', 'payroll_details', 11, NULL, '{\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":11}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(140, 1, 'updated', 'payroll_details', 11, '{\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"id\":11}', '{\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":17040,\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":11}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(141, 1, 'created', 'payroll_details', 12, NULL, '{\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":0,\"net_salary\":\"19000.00\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":12}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(142, 1, 'updated', 'payroll_details', 12, '{\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":0,\"net_salary\":\"19000.00\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"id\":12}', '{\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":0,\"net_salary\":19000,\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":12}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(143, 1, 'created', 'payroll_details', 13, NULL, '{\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":13}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(144, 1, 'created', 'payroll_details', 14, NULL, '{\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":14}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(145, 1, 'created', 'payroll_details', 15, NULL, '{\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":0,\"net_salary\":\"20605.65\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":15}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(146, 1, 'created', 'payroll_details', 16, NULL, '{\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":16}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(147, 1, 'created', 'payroll_details', 17, NULL, '{\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":17}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(148, 1, 'created', 'payroll_details', 18, NULL, '{\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":18}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(149, 1, 'created', 'payroll_details', 19, NULL, '{\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":19}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(150, 1, 'created', 'payroll_details', 20, NULL, '{\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":\"15115.31\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":20}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(151, 1, 'created', 'payroll_details', 21, NULL, '{\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":0,\"net_salary\":\"17608.85\",\"updated_at\":\"2026-03-24 05:08:05\",\"created_at\":\"2026-03-24 05:08:05\",\"id\":21}', '2026-03-24 11:08:05', '2026-03-24 11:08:05'),
(152, 1, 'updated', 'payroll_details', 1, '{\"id\":1,\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":1,\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(153, 1, 'updated', 'payroll_details', 2, '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(154, 1, 'updated', 'payroll_details', 3, '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(155, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"0.00\",\"net_salary\":\"22530.56\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":0,\"net_salary\":22530.56,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(156, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(157, 1, 'updated', 'payroll_details', 6, '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(158, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17040.00\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":17040,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(159, 1, 'updated', 'payroll_details', 8, '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(160, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"0.00\",\"net_salary\":\"19593.17\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":0,\"net_salary\":19593.17,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(161, 1, 'updated', 'payroll_details', 10, '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(162, 1, 'updated', 'payroll_details', 11, '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17040.00\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":17040,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(163, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"19000.00\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":0,\"net_salary\":19000,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(164, 1, 'updated', 'payroll_details', 13, '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(165, 1, 'updated', 'payroll_details', 14, '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(166, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"0.00\",\"net_salary\":\"20605.65\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":0,\"net_salary\":20605.65,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(167, 1, 'updated', 'payroll_details', 16, '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(168, 1, 'updated', 'payroll_details', 17, '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:14\"}', '2026-03-24 11:08:14', '2026-03-24 11:08:14'),
(169, 1, 'updated', 'payroll_details', 18, '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:15\"}', '2026-03-24 11:08:15', '2026-03-24 11:08:15'),
(170, 1, 'updated', 'payroll_details', 19, '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:15\"}', '2026-03-24 11:08:15', '2026-03-24 11:08:15'),
(171, 1, 'updated', 'payroll_details', 20, '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":0,\"net_salary\":15115.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:15\"}', '2026-03-24 11:08:15', '2026-03-24 11:08:15'),
(172, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"0.00\",\"net_salary\":\"17608.85\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":0,\"net_salary\":17608.85,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 05:08:15\"}', '2026-03-24 11:08:15', '2026-03-24 11:08:15'),
(173, 1, 'created', 'payrolls', 2, NULL, '{\"month\":\"3\",\"year\":\"2026\",\"level_id\":\"2\",\"status\":\"Borrador\",\"created_by\":1,\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":2}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(174, 1, 'created', 'payroll_details', 22, NULL, '{\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":22}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(175, 1, 'updated', 'payroll_details', 22, '{\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"id\":22}', '{\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":17040,\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":22}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(176, 1, 'created', 'payroll_details', 23, NULL, '{\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":0,\"net_salary\":\"17603.20\",\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":23}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(177, 1, 'updated', 'payroll_details', 23, '{\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":0,\"net_salary\":\"17603.20\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"id\":23}', '{\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":0,\"net_salary\":17603.2,\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":23}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(178, 1, 'created', 'payroll_details', 24, NULL, '{\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":24}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(179, 1, 'updated', 'payroll_details', 24, '{\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"id\":24}', '{\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":24}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(180, 1, 'created', 'payroll_details', 25, NULL, '{\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":25}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(181, 1, 'updated', 'payroll_details', 25, '{\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":\"17040.00\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"id\":25}', '{\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":0,\"net_salary\":17040,\"updated_at\":\"2026-03-24 05:08:44\",\"created_at\":\"2026-03-24 05:08:44\",\"id\":25}', '2026-03-24 11:08:44', '2026-03-24 11:08:44'),
(182, 1, 'updated', 'payroll_details', 22, '{\"id\":22,\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17040.00\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\"}', '{\"id\":22,\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":1916.3799999999999,\"net_salary\":15123.62,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:15:28\"}', '2026-03-24 11:15:28', '2026-03-24 11:15:28'),
(183, 1, 'updated', 'payroll_details', 23, '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":\"0.00\",\"net_salary\":\"17603.20\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\"}', '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":297.58,\"net_salary\":17305.62,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:15:28\"}', '2026-03-24 11:15:28', '2026-03-24 11:15:28'),
(184, 1, 'updated', 'payroll_details', 24, '{\"id\":24,\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\"}', '{\"id\":24,\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":297.58,\"net_salary\":17807.42,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:15:28\"}', '2026-03-24 11:15:28', '2026-03-24 11:15:28'),
(185, 1, 'updated', 'payroll_details', 25, '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17040.00\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\"}', '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":297.58,\"net_salary\":16742.42,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:15:28\"}', '2026-03-24 11:15:28', '2026-03-24 11:15:28'),
(186, 1, 'updated', 'payroll_details', 22, '{\"id\":22,\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":\"1916.38\",\"net_salary\":\"15123.62\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:15:28.000000Z\"}', '{\"id\":22,\"payroll_id\":2,\"employee_id\":19,\"base_salary\":\"17040.00\",\"total_deductions\":2151.38,\"net_salary\":14888.619999999999,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:15:56\"}', '2026-03-24 11:15:56', '2026-03-24 11:15:56'),
(187, 1, 'updated', 'payroll_details', 23, '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":\"297.58\",\"net_salary\":\"17305.62\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:15:28.000000Z\"}', '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":532.5799999999999,\"net_salary\":17070.620000000003,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:16:08\"}', '2026-03-24 11:16:08', '2026-03-24 11:16:08'),
(188, 1, 'updated', 'payroll_details', 24, '{\"id\":24,\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":\"297.58\",\"net_salary\":\"17807.42\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:15:28.000000Z\"}', '{\"id\":24,\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17572.42,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:16:08\"}', '2026-03-24 11:16:08', '2026-03-24 11:16:08'),
(189, 1, 'updated', 'payroll_details', 25, '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":\"297.58\",\"net_salary\":\"16742.42\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:15:28.000000Z\"}', '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":532.5799999999999,\"net_salary\":16507.42,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:16:08\"}', '2026-03-24 11:16:08', '2026-03-24 11:16:08'),
(190, 1, 'updated', 'payroll_details', 24, '{\"id\":24,\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17572.42\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:16:08.000000Z\"}', '{\"id\":24,\"payroll_id\":2,\"employee_id\":47,\"base_salary\":\"18105.00\",\"total_deductions\":2252.55,\"net_salary\":15852.45,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:16:33\"}', '2026-03-24 11:16:33', '2026-03-24 11:16:33'),
(191, 1, 'updated', 'payroll_details', 23, '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":\"532.58\",\"net_salary\":\"17070.62\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:16:08.000000Z\"}', '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":3204.88,\"net_salary\":14398.32,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:17:46\"}', '2026-03-24 11:17:46', '2026-03-24 11:17:46'),
(192, 1, 'updated', 'payroll_details', 25, '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"16507.42\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:16:08.000000Z\"}', '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":2151.39,\"net_salary\":14888.61,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:17:46\"}', '2026-03-24 11:17:46', '2026-03-24 11:17:46'),
(193, 1, 'updated', 'payroll_details', 23, '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":\"3204.88\",\"net_salary\":\"14398.32\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:17:46.000000Z\"}', '{\"id\":23,\"payroll_id\":2,\"employee_id\":40,\"base_salary\":\"17603.20\",\"total_deductions\":9489.720000000001,\"net_salary\":8113.48,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:18:13\"}', '2026-03-24 11:18:13', '2026-03-24 11:18:13'),
(194, 1, 'updated', 'payroll_details', 25, '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":\"2151.39\",\"net_salary\":\"14888.61\",\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:17:46.000000Z\"}', '{\"id\":25,\"payroll_id\":2,\"employee_id\":51,\"base_salary\":\"17040.00\",\"total_deductions\":2151.38,\"net_salary\":14888.619999999999,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-24 05:21:21\"}', '2026-03-24 11:21:21', '2026-03-24 11:21:21'),
(195, 1, 'created', 'payrolls', 3, NULL, '{\"month\":\"3\",\"year\":\"2026\",\"level_id\":\"3\",\"status\":\"Borrador\",\"created_by\":1,\"updated_at\":\"2026-03-24 05:22:15\",\"created_at\":\"2026-03-24 05:22:15\",\"id\":3}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(196, 1, 'created', 'payroll_details', 26, NULL, '{\"payroll_id\":3,\"employee_id\":1,\"base_salary\":\"19042.04\",\"total_deductions\":0,\"net_salary\":\"19042.04\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":26}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(197, 1, 'created', 'payroll_details', 27, NULL, '{\"payroll_id\":3,\"employee_id\":3,\"base_salary\":\"21029.32\",\"total_deductions\":0,\"net_salary\":\"21029.32\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":27}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(198, 1, 'created', 'payroll_details', 28, NULL, '{\"payroll_id\":3,\"employee_id\":6,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":28}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(199, 1, 'updated', 'payroll_details', 28, '{\"payroll_id\":3,\"employee_id\":6,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":28}', '{\"payroll_id\":3,\"employee_id\":6,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":28}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(200, 1, 'created', 'payroll_details', 29, NULL, '{\"payroll_id\":3,\"employee_id\":9,\"base_salary\":\"18668.20\",\"total_deductions\":0,\"net_salary\":\"18668.20\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":29}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(201, 1, 'updated', 'payroll_details', 29, '{\"payroll_id\":3,\"employee_id\":9,\"base_salary\":\"18668.20\",\"total_deductions\":0,\"net_salary\":\"18668.20\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":29}', '{\"payroll_id\":3,\"employee_id\":9,\"base_salary\":\"18668.20\",\"total_deductions\":0,\"net_salary\":18668.2,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":29}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(202, 1, 'created', 'payroll_details', 30, NULL, '{\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":0,\"net_salary\":\"19416.16\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":30}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(203, 1, 'created', 'payroll_details', 31, NULL, '{\"payroll_id\":3,\"employee_id\":11,\"base_salary\":\"22916.16\",\"total_deductions\":0,\"net_salary\":\"22916.16\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":31}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(204, 1, 'created', 'payroll_details', 32, NULL, '{\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":32}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(205, 1, 'updated', 'payroll_details', 32, '{\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":32}', '{\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":32}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(206, 1, 'created', 'payroll_details', 33, NULL, '{\"payroll_id\":3,\"employee_id\":17,\"base_salary\":\"19091.45\",\"total_deductions\":0,\"net_salary\":\"19091.45\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":33}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(207, 1, 'created', 'payroll_details', 34, NULL, '{\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":34}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(208, 1, 'updated', 'payroll_details', 34, '{\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":34}', '{\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":34}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(209, 1, 'created', 'payroll_details', 35, NULL, '{\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":35}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(210, 1, 'updated', 'payroll_details', 35, '{\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":35}', '{\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":35}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(211, 1, 'created', 'payroll_details', 36, NULL, '{\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":0,\"net_salary\":\"18000.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":36}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(212, 1, 'updated', 'payroll_details', 36, '{\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":0,\"net_salary\":\"18000.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":36}', '{\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":0,\"net_salary\":18000,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":36}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(213, 1, 'created', 'payroll_details', 37, NULL, '{\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":37}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(214, 1, 'updated', 'payroll_details', 37, '{\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":37}', '{\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":37}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(215, 1, 'created', 'payroll_details', 38, NULL, '{\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":38}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(216, 1, 'updated', 'payroll_details', 38, '{\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":\"18105.00\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":38}', '{\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":0,\"net_salary\":18105,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":38}', '2026-03-24 11:22:16', '2026-03-24 11:22:16');
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(217, 1, 'created', 'payroll_details', 39, NULL, '{\"payroll_id\":3,\"employee_id\":46,\"base_salary\":\"21529.32\",\"total_deductions\":0,\"net_salary\":\"21529.32\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":39}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(218, 1, 'created', 'payroll_details', 40, NULL, '{\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":0,\"net_salary\":\"18668.20\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":40}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(219, 1, 'updated', 'payroll_details', 40, '{\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":0,\"net_salary\":\"18668.20\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"id\":40}', '{\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":0,\"net_salary\":18668.2,\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":40}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(220, 1, 'created', 'payroll_details', 41, NULL, '{\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":0,\"net_salary\":\"16579.42\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":41}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(221, 1, 'created', 'payroll_details', 42, NULL, '{\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":0,\"net_salary\":\"19042.04\",\"updated_at\":\"2026-03-24 05:22:16\",\"created_at\":\"2026-03-24 05:22:16\",\"id\":42}', '2026-03-24 11:22:16', '2026-03-24 11:22:16'),
(222, 1, 'updated', 'payroll_details', 26, '{\"id\":26,\"payroll_id\":3,\"employee_id\":1,\"base_salary\":\"19042.04\",\"total_deductions\":\"0.00\",\"net_salary\":\"19042.04\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":26,\"payroll_id\":3,\"employee_id\":1,\"base_salary\":\"19042.04\",\"total_deductions\":4797.41,\"net_salary\":14244.630000000001,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:35\"}', '2026-03-24 11:33:35', '2026-03-24 11:33:35'),
(223, 1, 'updated', 'payroll_details', 27, '{\"id\":27,\"payroll_id\":3,\"employee_id\":3,\"base_salary\":\"21029.32\",\"total_deductions\":\"0.00\",\"net_salary\":\"21029.32\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":27,\"payroll_id\":3,\"employee_id\":3,\"base_salary\":\"21029.32\",\"total_deductions\":2530.36,\"net_salary\":18498.96,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:35\"}', '2026-03-24 11:33:35', '2026-03-24 11:33:35'),
(224, 1, 'updated', 'payroll_details', 28, '{\"id\":28,\"payroll_id\":3,\"employee_id\":6,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":28,\"payroll_id\":3,\"employee_id\":6,\"base_salary\":\"18105.00\",\"total_deductions\":2252.55,\"net_salary\":15852.45,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:35\"}', '2026-03-24 11:33:35', '2026-03-24 11:33:35'),
(225, 1, 'updated', 'payroll_details', 29, '{\"id\":29,\"payroll_id\":3,\"employee_id\":9,\"base_salary\":\"18668.20\",\"total_deductions\":\"0.00\",\"net_salary\":\"18668.20\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":29,\"payroll_id\":3,\"employee_id\":9,\"base_salary\":\"18668.20\",\"total_deductions\":2306.05,\"net_salary\":16362.150000000001,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:35\"}', '2026-03-24 11:33:35', '2026-03-24 11:33:35'),
(226, 1, 'updated', 'payroll_details', 30, '{\"id\":30,\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":\"0.00\",\"net_salary\":\"19416.16\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":30,\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":532.5799999999999,\"net_salary\":18883.58,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(227, 1, 'updated', 'payroll_details', 31, '{\"id\":31,\"payroll_id\":3,\"employee_id\":11,\"base_salary\":\"22916.16\",\"total_deductions\":\"0.00\",\"net_salary\":\"22916.16\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":31,\"payroll_id\":3,\"employee_id\":11,\"base_salary\":\"22916.16\",\"total_deductions\":532.5799999999999,\"net_salary\":22383.58,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(228, 1, 'updated', 'payroll_details', 32, '{\"id\":32,\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":32,\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17572.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(229, 1, 'updated', 'payroll_details', 33, '{\"id\":33,\"payroll_id\":3,\"employee_id\":17,\"base_salary\":\"19091.45\",\"total_deductions\":\"0.00\",\"net_salary\":\"19091.45\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":33,\"payroll_id\":3,\"employee_id\":17,\"base_salary\":\"19091.45\",\"total_deductions\":532.5799999999999,\"net_salary\":18558.870000000003,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(230, 1, 'updated', 'payroll_details', 34, '{\"id\":34,\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":34,\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17572.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(231, 1, 'updated', 'payroll_details', 35, '{\"id\":35,\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":35,\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17572.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(232, 1, 'updated', 'payroll_details', 36, '{\"id\":36,\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18000.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":36,\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17467.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(233, 1, 'updated', 'payroll_details', 37, '{\"id\":37,\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":37,\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17572.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(234, 1, 'updated', 'payroll_details', 38, '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"18105.00\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":532.5699999999999,\"net_salary\":17572.43,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(235, 1, 'updated', 'payroll_details', 39, '{\"id\":39,\"payroll_id\":3,\"employee_id\":46,\"base_salary\":\"21529.32\",\"total_deductions\":\"0.00\",\"net_salary\":\"21529.32\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":39,\"payroll_id\":3,\"employee_id\":46,\"base_salary\":\"21529.32\",\"total_deductions\":532.5799999999999,\"net_salary\":20996.739999999998,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(236, 1, 'updated', 'payroll_details', 40, '{\"id\":40,\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":\"0.00\",\"net_salary\":\"18668.20\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":40,\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":532.5799999999999,\"net_salary\":18135.620000000003,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(237, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"0.00\",\"net_salary\":\"16579.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":532.5799999999999,\"net_salary\":16046.839999999998,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(238, 1, 'updated', 'payroll_details', 42, '{\"id\":42,\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":\"0.00\",\"net_salary\":\"19042.04\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:22:16.000000Z\"}', '{\"id\":42,\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":532.5799999999999,\"net_salary\":18509.46,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:33:36\"}', '2026-03-24 11:33:36', '2026-03-24 11:33:36'),
(239, 1, 'updated', 'payroll_details', 30, '{\"id\":30,\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":\"532.58\",\"net_salary\":\"18883.58\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":30,\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":2377.11,\"net_salary\":17039.05,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(240, 1, 'updated', 'payroll_details', 31, '{\"id\":31,\"payroll_id\":3,\"employee_id\":11,\"base_salary\":\"22916.16\",\"total_deductions\":\"532.58\",\"net_salary\":\"22383.58\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":31,\"payroll_id\":3,\"employee_id\":11,\"base_salary\":\"22916.16\",\"total_deductions\":2709.61,\"net_salary\":20206.55,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(241, 1, 'updated', 'payroll_details', 32, '{\"id\":32,\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17572.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":32,\"payroll_id\":3,\"employee_id\":16,\"base_salary\":\"18105.00\",\"total_deductions\":6223.45,\"net_salary\":11881.55,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(242, 1, 'updated', 'payroll_details', 33, '{\"id\":33,\"payroll_id\":3,\"employee_id\":17,\"base_salary\":\"19091.45\",\"total_deductions\":\"532.58\",\"net_salary\":\"18558.87\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":33,\"payroll_id\":3,\"employee_id\":17,\"base_salary\":\"19091.45\",\"total_deductions\":2346.26,\"net_salary\":16745.190000000002,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(243, 1, 'updated', 'payroll_details', 34, '{\"id\":34,\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17572.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":34,\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":2252.55,\"net_salary\":15852.45,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(244, 1, 'updated', 'payroll_details', 35, '{\"id\":35,\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17572.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":35,\"payroll_id\":3,\"employee_id\":31,\"base_salary\":\"18105.00\",\"total_deductions\":2252.55,\"net_salary\":15852.45,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(245, 1, 'updated', 'payroll_details', 36, '{\"id\":36,\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17467.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":36,\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":2242.58,\"net_salary\":15757.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(246, 1, 'updated', 'payroll_details', 37, '{\"id\":37,\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17572.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":37,\"payroll_id\":3,\"employee_id\":44,\"base_salary\":\"18105.00\",\"total_deductions\":2252.55,\"net_salary\":15852.45,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(247, 1, 'updated', 'payroll_details', 38, '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":\"532.57\",\"net_salary\":\"17572.43\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":2252.54,\"net_salary\":15852.46,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(248, 1, 'updated', 'payroll_details', 39, '{\"id\":39,\"payroll_id\":3,\"employee_id\":46,\"base_salary\":\"21529.32\",\"total_deductions\":\"532.58\",\"net_salary\":\"20996.74\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":39,\"payroll_id\":3,\"employee_id\":46,\"base_salary\":\"21529.32\",\"total_deductions\":2577.86,\"net_salary\":18951.46,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(249, 1, 'updated', 'payroll_details', 40, '{\"id\":40,\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":\"532.58\",\"net_salary\":\"18135.62\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":40,\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":2306.05,\"net_salary\":16362.150000000001,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(250, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"532.58\",\"net_salary\":\"16046.84\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(251, 1, 'updated', 'payroll_details', 42, '{\"id\":42,\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":\"532.58\",\"net_salary\":\"18509.46\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:36.000000Z\"}', '{\"id\":42,\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":2341.57,\"net_salary\":16700.47,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:40:19\"}', '2026-03-24 11:40:19', '2026-03-24 11:40:19'),
(252, 1, 'updated', 'payroll_details', 27, '{\"id\":27,\"payroll_id\":3,\"employee_id\":3,\"base_salary\":\"21029.32\",\"total_deductions\":\"2530.36\",\"net_salary\":\"18498.96\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:33:35.000000Z\"}', '{\"id\":27,\"payroll_id\":3,\"employee_id\":3,\"base_salary\":\"21029.32\",\"total_deductions\":2630.36,\"net_salary\":18398.96,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:41:13\"}', '2026-03-24 11:41:13', '2026-03-24 11:41:13'),
(253, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"2107.62\",\"net_salary\":\"14471.80\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:41:14\"}', '2026-03-24 11:41:14', '2026-03-24 11:41:14'),
(254, 1, 'updated', 'payroll_details', 34, '{\"id\":34,\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":\"2252.55\",\"net_salary\":\"15852.45\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":34,\"payroll_id\":3,\"employee_id\":25,\"base_salary\":\"18105.00\",\"total_deductions\":2752.55,\"net_salary\":15352.45,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:41:55\"}', '2026-03-24 11:41:55', '2026-03-24 11:41:55'),
(255, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"2107.62\",\"net_salary\":\"14471.80\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:41:14.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:41:55\"}', '2026-03-24 11:41:55', '2026-03-24 11:41:55'),
(256, 1, 'updated', 'payroll_details', 36, '{\"id\":36,\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":\"2242.58\",\"net_salary\":\"15757.42\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":36,\"payroll_id\":3,\"employee_id\":41,\"base_salary\":\"18000.00\",\"total_deductions\":3242.58,\"net_salary\":14757.42,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:42:40\"}', '2026-03-24 11:42:40', '2026-03-24 11:42:40'),
(257, 1, 'updated', 'payroll_details', 38, '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":\"2252.54\",\"net_salary\":\"15852.46\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":2752.54,\"net_salary\":15352.46,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:42:40\"}', '2026-03-24 11:42:40', '2026-03-24 11:42:40'),
(258, 1, 'updated', 'payroll_details', 40, '{\"id\":40,\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":\"2306.05\",\"net_salary\":\"16362.15\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":40,\"payroll_id\":3,\"employee_id\":50,\"base_salary\":\"18668.20\",\"total_deductions\":3306.05,\"net_salary\":15362.150000000001,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:42:40\"}', '2026-03-24 11:42:40', '2026-03-24 11:42:40'),
(259, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"2107.62\",\"net_salary\":\"14471.80\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:41:55.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":3107.62,\"net_salary\":13471.8,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:42:40\"}', '2026-03-24 11:42:40', '2026-03-24 11:42:40'),
(260, 1, 'updated', 'payroll_details', 42, '{\"id\":42,\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":\"2341.57\",\"net_salary\":\"16700.47\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":42,\"payroll_id\":3,\"employee_id\":61,\"base_salary\":\"19042.04\",\"total_deductions\":3841.57,\"net_salary\":15200.470000000001,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:42:40\"}', '2026-03-24 11:42:40', '2026-03-24 11:42:40'),
(261, 1, 'updated', 'payroll_details', 30, '{\"id\":30,\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":\"2377.11\",\"net_salary\":\"17039.05\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:40:19.000000Z\"}', '{\"id\":30,\"payroll_id\":3,\"employee_id\":10,\"base_salary\":\"19416.16\",\"total_deductions\":3128.11,\"net_salary\":16288.05,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:43:18\"}', '2026-03-24 11:43:18', '2026-03-24 11:43:18'),
(262, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"3107.62\",\"net_salary\":\"13471.80\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:42:40.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":3107.62,\"net_salary\":13471.8,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:43:18\"}', '2026-03-24 11:43:18', '2026-03-24 11:43:18'),
(263, 1, 'updated', 'payroll_details', 38, '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":\"2752.54\",\"net_salary\":\"15352.46\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:42:40.000000Z\"}', '{\"id\":38,\"payroll_id\":3,\"employee_id\":45,\"base_salary\":\"18105.00\",\"total_deductions\":2752.55,\"net_salary\":15352.45,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:45:06\"}', '2026-03-24 11:45:06', '2026-03-24 11:45:06'),
(264, 1, 'updated', 'payroll_details', 41, '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":\"3107.62\",\"net_salary\":\"13471.80\",\"created_at\":\"2026-03-24T05:22:16.000000Z\",\"updated_at\":\"2026-03-24T05:43:18.000000Z\"}', '{\"id\":41,\"payroll_id\":3,\"employee_id\":54,\"base_salary\":\"16579.42\",\"total_deductions\":3107.62,\"net_salary\":13471.8,\"created_at\":\"2026-03-24 05:22:16\",\"updated_at\":\"2026-03-24 05:45:06\"}', '2026-03-24 11:45:06', '2026-03-24 11:45:06'),
(265, 1, 'created', 'payrolls', 4, NULL, '{\"month\":\"3\",\"year\":\"2026\",\"level_id\":\"4\",\"status\":\"Borrador\",\"created_by\":1,\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":4}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(266, 1, 'created', 'payroll_details', 43, NULL, '{\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":0,\"net_salary\":\"18589.05\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":43}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(267, 1, 'created', 'payroll_details', 44, NULL, '{\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":0,\"net_salary\":\"19664.68\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":44}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(268, 1, 'created', 'payroll_details', 45, NULL, '{\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":0,\"net_salary\":\"18589.05\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":45}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(269, 1, 'created', 'payroll_details', 46, NULL, '{\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":0,\"net_salary\":\"20157.06\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":46}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(270, 1, 'created', 'payroll_details', 47, NULL, '{\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":0,\"net_salary\":\"19119.44\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":47}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(271, 1, 'created', 'payroll_details', 48, NULL, '{\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":0,\"net_salary\":\"21033.31\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":48}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(272, 1, 'created', 'payroll_details', 49, NULL, '{\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":0,\"net_salary\":\"19196.58\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":49}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(273, 1, 'created', 'payroll_details', 50, NULL, '{\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":0,\"net_salary\":\"19042.04\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":50}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(274, 1, 'created', 'payroll_details', 51, NULL, '{\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":0,\"net_salary\":\"18778.72\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":51}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(275, 1, 'created', 'payroll_details', 52, NULL, '{\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":0,\"net_salary\":\"17977.04\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":52}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(276, 1, 'created', 'payroll_details', 53, NULL, '{\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":0,\"net_salary\":\"18086.64\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":53}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(277, 1, 'created', 'payroll_details', 54, NULL, '{\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":0,\"net_salary\":\"20201.40\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":54}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(278, 1, 'updated', 'payroll_details', 54, '{\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":0,\"net_salary\":\"20201.40\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"id\":54}', '{\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":0,\"net_salary\":20201.4,\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":54}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(279, 1, 'created', 'payroll_details', 55, NULL, '{\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":0,\"net_salary\":\"16380.77\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":55}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(280, 1, 'created', 'payroll_details', 56, NULL, '{\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":0,\"net_salary\":\"19593.86\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":56}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(281, 1, 'created', 'payroll_details', 57, NULL, '{\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":0,\"net_salary\":\"21816.78\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":57}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(282, 1, 'created', 'payroll_details', 58, NULL, '{\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":0,\"net_salary\":\"19334.47\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":58}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(283, 1, 'created', 'payroll_details', 59, NULL, '{\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":0,\"net_salary\":\"16579.42\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":59}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(284, 1, 'created', 'payroll_details', 60, NULL, '{\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":0,\"net_salary\":\"24758.42\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":60}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(285, 1, 'created', 'payroll_details', 61, NULL, '{\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":0,\"net_salary\":\"17902.00\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":61}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(286, 1, 'updated', 'payroll_details', 61, '{\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":0,\"net_salary\":\"17902.00\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"id\":61}', '{\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":0,\"net_salary\":17902,\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":61}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(287, 1, 'created', 'payroll_details', 62, NULL, '{\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":0,\"net_salary\":\"25431.38\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":62}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(288, 1, 'created', 'payroll_details', 63, NULL, '{\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":0,\"net_salary\":\"20140.64\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":63}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(289, 1, 'created', 'payroll_details', 64, NULL, '{\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":0,\"net_salary\":\"23699.01\",\"updated_at\":\"2026-03-24 05:47:01\",\"created_at\":\"2026-03-24 05:47:01\",\"id\":64}', '2026-03-24 11:47:01', '2026-03-24 11:47:01'),
(290, 1, 'updated', 'payroll_details', 43, '{\"id\":43,\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":\"0.00\",\"net_salary\":\"18589.05\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":43,\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":532.5799999999999,\"net_salary\":18056.47,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(291, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"0.00\",\"net_salary\":\"19664.68\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":8388.64,\"net_salary\":11276.04,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(292, 1, 'updated', 'payroll_details', 45, '{\"id\":45,\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":\"0.00\",\"net_salary\":\"18589.05\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":45,\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":532.5799999999999,\"net_salary\":18056.47,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(293, 1, 'updated', 'payroll_details', 46, '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":\"0.00\",\"net_salary\":\"20157.06\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":532.5799999999999,\"net_salary\":19624.480000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(294, 1, 'updated', 'payroll_details', 47, '{\"id\":47,\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":\"0.00\",\"net_salary\":\"19119.44\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":47,\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":532.5799999999999,\"net_salary\":18586.86,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(295, 1, 'updated', 'payroll_details', 48, '{\"id\":48,\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"21033.31\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":48,\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":532.5799999999999,\"net_salary\":20500.730000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(296, 1, 'updated', 'payroll_details', 49, '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":\"0.00\",\"net_salary\":\"19196.58\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":532.5799999999999,\"net_salary\":18664,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(297, 1, 'updated', 'payroll_details', 50, '{\"id\":50,\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":\"0.00\",\"net_salary\":\"19042.04\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":50,\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":532.5799999999999,\"net_salary\":18509.46,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(298, 1, 'updated', 'payroll_details', 51, '{\"id\":51,\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":\"0.00\",\"net_salary\":\"18778.72\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":51,\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":532.5799999999999,\"net_salary\":18246.14,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(299, 1, 'updated', 'payroll_details', 52, '{\"id\":52,\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":\"0.00\",\"net_salary\":\"17977.04\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":52,\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":532.5799999999999,\"net_salary\":17444.46,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(300, 1, 'updated', 'payroll_details', 53, '{\"id\":53,\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":\"0.00\",\"net_salary\":\"18086.64\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":53,\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":532.5799999999999,\"net_salary\":17554.059999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(301, 1, 'updated', 'payroll_details', 54, '{\"id\":54,\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":\"0.00\",\"net_salary\":\"20201.40\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":54,\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":532.5799999999999,\"net_salary\":19668.82,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(302, 1, 'updated', 'payroll_details', 55, '{\"id\":55,\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":\"0.00\",\"net_salary\":\"16380.77\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":55,\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":532.5799999999999,\"net_salary\":15848.19,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(303, 1, 'updated', 'payroll_details', 56, '{\"id\":56,\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":\"0.00\",\"net_salary\":\"19593.86\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":56,\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":532.5799999999999,\"net_salary\":19061.28,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(304, 1, 'updated', 'payroll_details', 57, '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":\"0.00\",\"net_salary\":\"21816.78\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":532.5799999999999,\"net_salary\":21284.199999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(305, 1, 'updated', 'payroll_details', 58, '{\"id\":58,\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":\"0.00\",\"net_salary\":\"19334.47\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":58,\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":532.5799999999999,\"net_salary\":18801.89,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(306, 1, 'updated', 'payroll_details', 59, '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":\"0.00\",\"net_salary\":\"16579.42\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":532.5799999999999,\"net_salary\":16046.839999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(307, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"0.00\",\"net_salary\":\"24758.42\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":532.5799999999999,\"net_salary\":24225.839999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(308, 1, 'updated', 'payroll_details', 61, '{\"id\":61,\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17902.00\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":61,\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":532.5799999999999,\"net_salary\":17369.42,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(309, 1, 'updated', 'payroll_details', 62, '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":\"0.00\",\"net_salary\":\"25431.38\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":532.5799999999999,\"net_salary\":24898.800000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(310, 1, 'updated', 'payroll_details', 63, '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":\"0.00\",\"net_salary\":\"20140.64\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":532.5799999999999,\"net_salary\":19608.059999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(311, 1, 'updated', 'payroll_details', 64, '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":\"0.00\",\"net_salary\":\"23699.01\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":532.5799999999999,\"net_salary\":23166.43,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:52:11\"}', '2026-03-24 11:52:11', '2026-03-24 11:52:11'),
(312, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"8388.64\",\"net_salary\":\"11276.04\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":8688.64,\"net_salary\":10976.04,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:54:39\"}', '2026-03-24 11:54:39', '2026-03-24 11:54:39'),
(313, 1, 'updated', 'payroll_details', 49, '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":\"532.58\",\"net_salary\":\"18664.00\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":532.5799999999999,\"net_salary\":18664,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:54:39\"}', '2026-03-24 11:54:39', '2026-03-24 11:54:39'),
(314, 1, 'updated', 'payroll_details', 57, '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":\"532.58\",\"net_salary\":\"21284.20\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":532.5799999999999,\"net_salary\":21284.199999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:54:40\"}', '2026-03-24 11:54:40', '2026-03-24 11:54:40'),
(315, 1, 'updated', 'payroll_details', 62, '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":\"532.58\",\"net_salary\":\"24898.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":532.5799999999999,\"net_salary\":24898.800000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:54:40\"}', '2026-03-24 11:54:40', '2026-03-24 11:54:40'),
(316, 1, 'updated', 'payroll_details', 49, '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":\"532.58\",\"net_salary\":\"18664.00\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:54:39.000000Z\"}', '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":532.5799999999999,\"net_salary\":18664,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:55:44\"}', '2026-03-24 11:55:44', '2026-03-24 11:55:44'),
(317, 1, 'updated', 'payroll_details', 57, '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":\"532.58\",\"net_salary\":\"21284.20\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:54:40.000000Z\"}', '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":532.5799999999999,\"net_salary\":21284.199999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:55:44\"}', '2026-03-24 11:55:44', '2026-03-24 11:55:44'),
(318, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"532.58\",\"net_salary\":\"24225.84\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":1132.58,\"net_salary\":23625.839999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:55:44\"}', '2026-03-24 11:55:44', '2026-03-24 11:55:44'),
(319, 1, 'updated', 'payroll_details', 62, '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":\"532.58\",\"net_salary\":\"24898.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:54:40.000000Z\"}', '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":1032.58,\"net_salary\":24398.800000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:55:44\"}', '2026-03-24 11:55:44', '2026-03-24 11:55:44'),
(320, 1, 'updated', 'payroll_details', 64, '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":\"532.58\",\"net_salary\":\"23166.43\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":1032.58,\"net_salary\":22666.43,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 05:55:44\"}', '2026-03-24 11:55:44', '2026-03-24 11:55:44');
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(321, 1, 'updated', 'payroll_details', 43, '{\"id\":43,\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":\"532.58\",\"net_salary\":\"18056.47\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":43,\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":1332.58,\"net_salary\":17256.47,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:35\"}', '2026-03-24 12:00:35', '2026-03-24 12:00:35'),
(322, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"8688.64\",\"net_salary\":\"10976.04\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:54:39.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":9088.64,\"net_salary\":10576.04,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:35\"}', '2026-03-24 12:00:35', '2026-03-24 12:00:35'),
(323, 1, 'updated', 'payroll_details', 45, '{\"id\":45,\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":\"532.58\",\"net_salary\":\"18056.47\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":45,\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":2032.58,\"net_salary\":16556.47,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:35\"}', '2026-03-24 12:00:35', '2026-03-24 12:00:35'),
(324, 1, 'updated', 'payroll_details', 47, '{\"id\":47,\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":\"532.58\",\"net_salary\":\"18586.86\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":47,\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":832.5799999999999,\"net_salary\":18286.86,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(325, 1, 'updated', 'payroll_details', 48, '{\"id\":48,\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":\"532.58\",\"net_salary\":\"20500.73\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":48,\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":1032.58,\"net_salary\":20000.730000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(326, 1, 'updated', 'payroll_details', 49, '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":\"532.58\",\"net_salary\":\"18664.00\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:55:44.000000Z\"}', '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":1032.58,\"net_salary\":18164,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(327, 1, 'updated', 'payroll_details', 51, '{\"id\":51,\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":\"532.58\",\"net_salary\":\"18246.14\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":51,\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":1532.58,\"net_salary\":17246.14,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(328, 1, 'updated', 'payroll_details', 52, '{\"id\":52,\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":\"532.58\",\"net_salary\":\"17444.46\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":52,\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":1532.58,\"net_salary\":16444.46,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(329, 1, 'updated', 'payroll_details', 53, '{\"id\":53,\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":\"532.58\",\"net_salary\":\"17554.06\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":53,\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":832.5799999999999,\"net_salary\":17254.059999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(330, 1, 'updated', 'payroll_details', 54, '{\"id\":54,\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":\"532.58\",\"net_salary\":\"19668.82\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":54,\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":1532.58,\"net_salary\":18668.82,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(331, 1, 'updated', 'payroll_details', 55, '{\"id\":55,\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":\"532.58\",\"net_salary\":\"15848.19\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":55,\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":2032.58,\"net_salary\":14348.19,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(332, 1, 'updated', 'payroll_details', 56, '{\"id\":56,\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":\"532.58\",\"net_salary\":\"19061.28\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":56,\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":1532.58,\"net_salary\":18061.28,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(333, 1, 'updated', 'payroll_details', 57, '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":\"532.58\",\"net_salary\":\"21284.20\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:55:44.000000Z\"}', '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":2176.34,\"net_salary\":19640.44,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(334, 1, 'updated', 'payroll_details', 58, '{\"id\":58,\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":\"532.58\",\"net_salary\":\"18801.89\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":58,\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":1532.58,\"net_salary\":17801.89,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(335, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"1132.58\",\"net_salary\":\"23625.84\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:55:44.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":2132.58,\"net_salary\":22625.839999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(336, 1, 'updated', 'payroll_details', 61, '{\"id\":61,\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":\"532.58\",\"net_salary\":\"17369.42\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":61,\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":3032.58,\"net_salary\":14869.42,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(337, 1, 'updated', 'payroll_details', 62, '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":\"1032.58\",\"net_salary\":\"24398.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:55:44.000000Z\"}', '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":2032.58,\"net_salary\":23398.800000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(338, 1, 'updated', 'payroll_details', 63, '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":\"532.58\",\"net_salary\":\"19608.06\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":732.5799999999999,\"net_salary\":19408.059999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(339, 1, 'updated', 'payroll_details', 64, '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":\"1032.58\",\"net_salary\":\"22666.43\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:55:44.000000Z\"}', '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":4032.58,\"net_salary\":19666.43,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:00:36\"}', '2026-03-24 12:00:36', '2026-03-24 12:00:36'),
(340, 1, 'updated', 'payroll_details', 49, '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":\"1032.58\",\"net_salary\":\"18164.00\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":1032.58,\"net_salary\":18164,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:01:21\"}', '2026-03-24 12:01:21', '2026-03-24 12:01:21'),
(341, 1, 'updated', 'payroll_details', 57, '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":\"2176.34\",\"net_salary\":\"19640.44\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":9672.85,\"net_salary\":12143.929999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:01:21\"}', '2026-03-24 12:01:21', '2026-03-24 12:01:21'),
(342, 1, 'updated', 'payroll_details', 62, '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":\"2032.58\",\"net_salary\":\"23398.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":2032.58,\"net_salary\":23398.800000000003,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:01:22\"}', '2026-03-24 12:01:22', '2026-03-24 12:01:22'),
(343, 1, 'updated', 'payroll_details', 43, '{\"id\":43,\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":\"1332.58\",\"net_salary\":\"17256.47\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:35.000000Z\"}', '{\"id\":43,\"payroll_id\":4,\"employee_id\":4,\"base_salary\":\"18589.05\",\"total_deductions\":3098.53,\"net_salary\":15490.519999999999,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(344, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"9088.64\",\"net_salary\":\"10576.04\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:35.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":10956.78,\"net_salary\":8707.9,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(345, 1, 'updated', 'payroll_details', 45, '{\"id\":45,\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":\"2032.58\",\"net_salary\":\"16556.47\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:35.000000Z\"}', '{\"id\":45,\"payroll_id\":4,\"employee_id\":8,\"base_salary\":\"18589.05\",\"total_deductions\":3798.53,\"net_salary\":14790.519999999999,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(346, 1, 'updated', 'payroll_details', 46, '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":\"532.58\",\"net_salary\":\"19624.48\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":2447.5,\"net_salary\":17709.56,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(347, 1, 'updated', 'payroll_details', 47, '{\"id\":47,\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":\"832.58\",\"net_salary\":\"18286.86\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":47,\"payroll_id\":4,\"employee_id\":14,\"base_salary\":\"19119.44\",\"total_deductions\":2648.92,\"net_salary\":16470.519999999997,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(348, 1, 'updated', 'payroll_details', 48, '{\"id\":48,\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":\"1032.58\",\"net_salary\":\"20000.73\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":48,\"payroll_id\":4,\"employee_id\":15,\"base_salary\":\"21033.31\",\"total_deductions\":3030.7400000000002,\"net_salary\":18002.57,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(349, 1, 'updated', 'payroll_details', 49, '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":\"1032.58\",\"net_salary\":\"18164.00\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:01:21.000000Z\"}', '{\"id\":49,\"payroll_id\":4,\"employee_id\":20,\"base_salary\":\"19196.58\",\"total_deductions\":2856.25,\"net_salary\":16340.330000000002,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(350, 1, 'updated', 'payroll_details', 50, '{\"id\":50,\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":\"532.58\",\"net_salary\":\"18509.46\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":50,\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":2341.5600000000004,\"net_salary\":16700.48,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(351, 1, 'updated', 'payroll_details', 51, '{\"id\":51,\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":\"1532.58\",\"net_salary\":\"17246.14\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":51,\"payroll_id\":4,\"employee_id\":27,\"base_salary\":\"18778.72\",\"total_deductions\":3316.55,\"net_salary\":15462.170000000002,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(352, 1, 'updated', 'payroll_details', 52, '{\"id\":52,\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":\"1532.58\",\"net_salary\":\"16444.46\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":52,\"payroll_id\":4,\"employee_id\":28,\"base_salary\":\"17977.04\",\"total_deductions\":3240.39,\"net_salary\":14736.650000000001,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(353, 1, 'updated', 'payroll_details', 53, '{\"id\":53,\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":\"832.58\",\"net_salary\":\"17254.06\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":53,\"payroll_id\":4,\"employee_id\":29,\"base_salary\":\"18086.64\",\"total_deductions\":2550.81,\"net_salary\":15535.83,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(354, 1, 'updated', 'payroll_details', 54, '{\"id\":54,\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":\"1532.58\",\"net_salary\":\"18668.82\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":54,\"payroll_id\":4,\"employee_id\":32,\"base_salary\":\"20201.40\",\"total_deductions\":3451.71,\"net_salary\":16749.690000000002,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(355, 1, 'updated', 'payroll_details', 55, '{\"id\":55,\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":\"2032.58\",\"net_salary\":\"14348.19\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":55,\"payroll_id\":4,\"employee_id\":33,\"base_salary\":\"16380.77\",\"total_deductions\":3588.75,\"net_salary\":12792.02,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(356, 1, 'updated', 'payroll_details', 56, '{\"id\":56,\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":\"1532.58\",\"net_salary\":\"18061.28\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":56,\"payroll_id\":4,\"employee_id\":43,\"base_salary\":\"19593.86\",\"total_deductions\":3393.9900000000002,\"net_salary\":16199.87,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(357, 1, 'updated', 'payroll_details', 57, '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":\"9672.85\",\"net_salary\":\"12143.93\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:01:21.000000Z\"}', '{\"id\":57,\"payroll_id\":4,\"employee_id\":48,\"base_salary\":\"21816.78\",\"total_deductions\":11745.44,\"net_salary\":10071.339999999998,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(358, 1, 'updated', 'payroll_details', 58, '{\"id\":58,\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":\"1532.58\",\"net_salary\":\"17801.89\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":58,\"payroll_id\":4,\"employee_id\":52,\"base_salary\":\"19334.47\",\"total_deductions\":3369.34,\"net_salary\":15965.130000000001,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(359, 1, 'updated', 'payroll_details', 59, '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":\"532.58\",\"net_salary\":\"16046.84\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:52:11.000000Z\"}', '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(360, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"2132.58\",\"net_salary\":\"22625.84\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":4484.62,\"net_salary\":20273.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(361, 1, 'updated', 'payroll_details', 61, '{\"id\":61,\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":\"3032.58\",\"net_salary\":\"14869.42\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":61,\"payroll_id\":4,\"employee_id\":56,\"base_salary\":\"17902.00\",\"total_deductions\":4733.27,\"net_salary\":13168.73,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(362, 1, 'updated', 'payroll_details', 62, '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":\"2032.58\",\"net_salary\":\"23398.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:01:22.000000Z\"}', '{\"id\":62,\"payroll_id\":4,\"employee_id\":58,\"base_salary\":\"25431.38\",\"total_deductions\":4448.5599999999995,\"net_salary\":20982.82,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(363, 1, 'updated', 'payroll_details', 63, '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":\"732.58\",\"net_salary\":\"19408.06\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":2645.94,\"net_salary\":17494.7,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(364, 1, 'updated', 'payroll_details', 64, '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":\"4032.58\",\"net_salary\":\"19666.43\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:00:36.000000Z\"}', '{\"id\":64,\"payroll_id\":4,\"employee_id\":62,\"base_salary\":\"23699.01\",\"total_deductions\":6093.07,\"net_salary\":17605.94,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:05:47\"}', '2026-03-24 12:05:47', '2026-03-24 12:05:47'),
(365, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"10956.78\",\"net_salary\":\"8707.90\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:05:47.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":10956.78,\"net_salary\":8707.9,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:06:41\"}', '2026-03-24 12:06:41', '2026-03-24 12:06:41'),
(366, 1, 'updated', 'payroll_details', 46, '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":\"2447.50\",\"net_salary\":\"17709.56\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:05:47.000000Z\"}', '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":2447.5,\"net_salary\":17709.56,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:06:41\"}', '2026-03-24 12:06:41', '2026-03-24 12:06:41'),
(367, 1, 'updated', 'payroll_details', 50, '{\"id\":50,\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":\"2341.56\",\"net_salary\":\"16700.48\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:05:47.000000Z\"}', '{\"id\":50,\"payroll_id\":4,\"employee_id\":23,\"base_salary\":\"19042.04\",\"total_deductions\":2341.57,\"net_salary\":16700.47,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:06:41\"}', '2026-03-24 12:06:41', '2026-03-24 12:06:41'),
(368, 1, 'updated', 'payroll_details', 59, '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":\"2107.62\",\"net_salary\":\"14471.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:05:47.000000Z\"}', '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:06:41\"}', '2026-03-24 12:06:41', '2026-03-24 12:06:41'),
(369, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"4484.62\",\"net_salary\":\"20273.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:05:47.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":4484.62,\"net_salary\":20273.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:06:41\"}', '2026-03-24 12:06:41', '2026-03-24 12:06:41'),
(370, 1, 'updated', 'payroll_details', 63, '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":\"2645.94\",\"net_salary\":\"17494.70\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:05:47.000000Z\"}', '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":2645.94,\"net_salary\":17494.7,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:06:42\"}', '2026-03-24 12:06:42', '2026-03-24 12:06:42'),
(371, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"10956.78\",\"net_salary\":\"8707.90\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:06:41.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":10956.78,\"net_salary\":8707.9,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:07:06\"}', '2026-03-24 12:07:06', '2026-03-24 12:07:06'),
(372, 1, 'updated', 'payroll_details', 46, '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":\"2447.50\",\"net_salary\":\"17709.56\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:06:41.000000Z\"}', '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":2447.5,\"net_salary\":17709.56,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:07:06\"}', '2026-03-24 12:07:06', '2026-03-24 12:07:06'),
(373, 1, 'updated', 'payroll_details', 59, '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":\"2107.62\",\"net_salary\":\"14471.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:06:41.000000Z\"}', '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:07:06\"}', '2026-03-24 12:07:06', '2026-03-24 12:07:06'),
(374, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"4484.62\",\"net_salary\":\"20273.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:06:41.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":4484.62,\"net_salary\":20273.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:07:06\"}', '2026-03-24 12:07:06', '2026-03-24 12:07:06'),
(375, 1, 'updated', 'payroll_details', 63, '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":\"2645.94\",\"net_salary\":\"17494.70\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:06:42.000000Z\"}', '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":2645.94,\"net_salary\":17494.7,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:07:06\"}', '2026-03-24 12:07:06', '2026-03-24 12:07:06'),
(376, 1, 'updated', 'payroll_details', 44, '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":\"10956.78\",\"net_salary\":\"8707.90\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:07:06.000000Z\"}', '{\"id\":44,\"payroll_id\":4,\"employee_id\":5,\"base_salary\":\"19664.68\",\"total_deductions\":10956.78,\"net_salary\":8707.9,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:08:12\"}', '2026-03-24 12:08:12', '2026-03-24 12:08:12'),
(377, 1, 'updated', 'payroll_details', 46, '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":\"2447.50\",\"net_salary\":\"17709.56\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:07:06.000000Z\"}', '{\"id\":46,\"payroll_id\":4,\"employee_id\":13,\"base_salary\":\"20157.06\",\"total_deductions\":2447.5,\"net_salary\":17709.56,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:08:12\"}', '2026-03-24 12:08:12', '2026-03-24 12:08:12'),
(378, 1, 'updated', 'payroll_details', 59, '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":\"2107.62\",\"net_salary\":\"14471.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:07:06.000000Z\"}', '{\"id\":59,\"payroll_id\":4,\"employee_id\":53,\"base_salary\":\"16579.42\",\"total_deductions\":2107.62,\"net_salary\":14471.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:08:12\"}', '2026-03-24 12:08:13', '2026-03-24 12:08:13'),
(379, 1, 'updated', 'payroll_details', 60, '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":\"4484.62\",\"net_salary\":\"20273.80\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:07:06.000000Z\"}', '{\"id\":60,\"payroll_id\":4,\"employee_id\":55,\"base_salary\":\"24758.42\",\"total_deductions\":4484.62,\"net_salary\":20273.8,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:08:13\"}', '2026-03-24 12:08:13', '2026-03-24 12:08:13'),
(380, 1, 'updated', 'payroll_details', 63, '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":\"2645.94\",\"net_salary\":\"17494.70\",\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T06:07:06.000000Z\"}', '{\"id\":63,\"payroll_id\":4,\"employee_id\":59,\"base_salary\":\"20140.64\",\"total_deductions\":2645.94,\"net_salary\":17494.7,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-24 06:08:13\"}', '2026-03-24 12:08:13', '2026-03-24 12:08:13'),
(381, 1, 'updated', 'payroll_details', 1, '{\"id\":1,\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":1,\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(382, 1, 'updated', 'payroll_details', 2, '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(383, 1, 'updated', 'payroll_details', 3, '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(384, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"0.00\",\"net_salary\":\"22530.56\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":595.16,\"net_salary\":21935.4,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(385, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(386, 1, 'updated', 'payroll_details', 6, '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(387, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17040.00\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":595.16,\"net_salary\":16444.84,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(388, 1, 'updated', 'payroll_details', 8, '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(389, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"0.00\",\"net_salary\":\"19593.17\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":595.16,\"net_salary\":18998.01,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(390, 1, 'updated', 'payroll_details', 10, '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(391, 1, 'updated', 'payroll_details', 11, '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"17040.00\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":595.16,\"net_salary\":16444.84,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(392, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"0.00\",\"net_salary\":\"19000.00\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":595.16,\"net_salary\":18404.84,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(393, 1, 'updated', 'payroll_details', 13, '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(394, 1, 'updated', 'payroll_details', 14, '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(395, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"0.00\",\"net_salary\":\"20605.65\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":595.16,\"net_salary\":20010.49,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(396, 1, 'updated', 'payroll_details', 16, '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(397, 1, 'updated', 'payroll_details', 17, '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:14.000000Z\"}', '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:12\"}', '2026-03-25 03:48:12', '2026-03-25 03:48:12'),
(398, 1, 'updated', 'payroll_details', 18, '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:15.000000Z\"}', '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:13\"}', '2026-03-25 03:48:13', '2026-03-25 03:48:13'),
(399, 1, 'updated', 'payroll_details', 19, '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:15.000000Z\"}', '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:13\"}', '2026-03-25 03:48:13', '2026-03-25 03:48:13'),
(400, 1, 'updated', 'payroll_details', 20, '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":\"0.00\",\"net_salary\":\"15115.31\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:15.000000Z\"}', '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":595.16,\"net_salary\":14520.15,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:13\"}', '2026-03-25 03:48:13', '2026-03-25 03:48:13'),
(401, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"0.00\",\"net_salary\":\"17608.85\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:15.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":595.16,\"net_salary\":17013.69,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:13\"}', '2026-03-25 03:48:13', '2026-03-25 03:48:13'),
(402, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"595.16\",\"net_salary\":\"21935.40\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":595.16,\"net_salary\":21935.4,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:13\"}', '2026-03-25 03:48:13', '2026-03-25 03:48:13'),
(403, 1, 'updated', 'payroll_details', 2, '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:37\"}', '2026-03-25 03:48:37', '2026-03-25 03:48:37'),
(404, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"595.16\",\"net_salary\":\"21935.40\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:13.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":595.16,\"net_salary\":21935.4,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:48:37\"}', '2026-03-25 03:48:37', '2026-03-25 03:48:37'),
(405, 1, 'updated', 'payroll_details', 3, '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(406, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"595.16\",\"net_salary\":\"21935.40\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:37.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":754.5699999999999,\"net_salary\":21775.99,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(407, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(408, 1, 'updated', 'payroll_details', 6, '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(409, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"595.16\",\"net_salary\":\"16444.84\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":671.61,\"net_salary\":16368.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(410, 1, 'updated', 'payroll_details', 8, '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(411, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"595.16\",\"net_salary\":\"18998.01\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:30\"}', '2026-03-25 03:49:30', '2026-03-25 03:49:30'),
(412, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:53\"}', '2026-03-25 03:49:53', '2026-03-25 03:49:53'),
(413, 1, 'updated', 'payroll_details', 10, '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:53\"}', '2026-03-25 03:49:53', '2026-03-25 03:49:53');
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(414, 1, 'updated', 'payroll_details', 11, '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":\"595.16\",\"net_salary\":\"16444.84\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":701.61,\"net_salary\":16338.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:49:53\"}', '2026-03-25 03:49:53', '2026-03-25 03:49:53'),
(415, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:53.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:50:12\"}', '2026-03-25 03:50:12', '2026-03-25 03:50:12'),
(416, 1, 'updated', 'payroll_details', 11, '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":\"701.61\",\"net_salary\":\"16338.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:53.000000Z\"}', '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":672.2099999999999,\"net_salary\":16367.79,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:50:12\"}', '2026-03-25 03:50:12', '2026-03-25 03:50:12'),
(417, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:50:12.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(418, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"595.16\",\"net_salary\":\"18404.84\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":701.61,\"net_salary\":18298.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(419, 1, 'updated', 'payroll_details', 13, '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(420, 1, 'updated', 'payroll_details', 14, '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(421, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"595.16\",\"net_salary\":\"20010.49\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(422, 1, 'updated', 'payroll_details', 16, '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(423, 1, 'updated', 'payroll_details', 17, '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(424, 1, 'updated', 'payroll_details', 18, '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:13.000000Z\"}', '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(425, 1, 'updated', 'payroll_details', 19, '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:13.000000Z\"}', '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(426, 1, 'updated', 'payroll_details', 20, '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":\"595.16\",\"net_salary\":\"14520.15\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:13.000000Z\"}', '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":643.3399999999999,\"net_salary\":14471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(427, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"595.16\",\"net_salary\":\"17013.69\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:13.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":680.74,\"net_salary\":16928.109999999997,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:03\"}', '2026-03-25 03:55:03', '2026-03-25 03:55:03'),
(428, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":3643.34,\"net_salary\":11471.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:23\"}', '2026-03-25 03:55:23', '2026-03-25 03:55:23'),
(429, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:24\"}', '2026-03-25 03:55:24', '2026-03-25 03:55:24'),
(430, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 21:55:24\"}', '2026-03-25 03:55:24', '2026-03-25 03:55:24'),
(431, 1, 'updated', 'payroll_details', 3, '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":743.3399999999999,\"net_salary\":14371.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(432, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"3643.34\",\"net_salary\":\"11471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:23.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8066.6,\"net_salary\":7048.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(433, 1, 'updated', 'payroll_details', 6, '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":4864.360000000001,\"net_salary\":10250.949999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(434, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:24.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(435, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"701.61\",\"net_salary\":\"18298.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":801.61,\"net_salary\":18198.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(436, 1, 'updated', 'payroll_details', 13, '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":743.3399999999999,\"net_salary\":14371.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(437, 1, 'updated', 'payroll_details', 14, '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":4982.92,\"net_salary\":10132.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(438, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:24.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:22\"}', '2026-03-25 04:20:22', '2026-03-25 04:20:22'),
(439, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"754.57\",\"net_salary\":\"21775.99\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":2254.5699999999997,\"net_salary\":20275.99,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:45\"}', '2026-03-25 04:20:45', '2026-03-25 04:20:45'),
(440, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8066.60\",\"net_salary\":\"7048.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8066.6,\"net_salary\":7048.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:45\"}', '2026-03-25 04:20:45', '2026-03-25 04:20:45'),
(441, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:45\"}', '2026-03-25 04:20:45', '2026-03-25 04:20:45'),
(442, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:20:45\"}', '2026-03-25 04:20:45', '2026-03-25 04:20:45'),
(443, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8066.60\",\"net_salary\":\"7048.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:45.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8066.6,\"net_salary\":7048.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:11\"}', '2026-03-25 04:21:11', '2026-03-25 04:21:11'),
(444, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"671.61\",\"net_salary\":\"16368.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":1671.6100000000001,\"net_salary\":15368.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:11\"}', '2026-03-25 04:21:11', '2026-03-25 04:21:11'),
(445, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:45.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:11\"}', '2026-03-25 04:21:11', '2026-03-25 04:21:11'),
(446, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:45.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:11\"}', '2026-03-25 04:21:11', '2026-03-25 04:21:11'),
(447, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"2254.57\",\"net_salary\":\"20275.99\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:45.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":3754.5699999999997,\"net_salary\":18775.99,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:38\"}', '2026-03-25 04:21:38', '2026-03-25 04:21:38'),
(448, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8066.60\",\"net_salary\":\"7048.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:11.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8066.6,\"net_salary\":7048.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:38\"}', '2026-03-25 04:21:38', '2026-03-25 04:21:38'),
(449, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"1671.61\",\"net_salary\":\"15368.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:11.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":2671.61,\"net_salary\":14368.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:38\"}', '2026-03-25 04:21:38', '2026-03-25 04:21:38'),
(450, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:11.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:38\"}', '2026-03-25 04:21:38', '2026-03-25 04:21:38'),
(451, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:11.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:21:38\"}', '2026-03-25 04:21:38', '2026-03-25 04:21:38'),
(452, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"3754.57\",\"net_salary\":\"18775.99\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:38.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":2489.5699999999997,\"net_salary\":20040.99,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:41:42\"}', '2026-03-25 04:41:42', '2026-03-25 04:41:42'),
(453, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8066.60\",\"net_salary\":\"7048.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:38.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:41:42\"}', '2026-03-25 04:41:42', '2026-03-25 04:41:42'),
(454, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"2671.61\",\"net_salary\":\"14368.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:38.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":1906.6100000000001,\"net_salary\":15133.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:41:42\"}', '2026-03-25 04:41:42', '2026-03-25 04:41:42'),
(455, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:38.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":710.27,\"net_salary\":18882.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:41:42\"}', '2026-03-25 04:41:42', '2026-03-25 04:41:42'),
(456, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:21:38.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:41:43\"}', '2026-03-25 04:41:43', '2026-03-25 04:41:43'),
(457, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:41:42.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:42:16\"}', '2026-03-25 04:42:16', '2026-03-25 04:42:16'),
(458, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"710.27\",\"net_salary\":\"18882.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:41:42.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":945.27,\"net_salary\":18647.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:42:16\"}', '2026-03-25 04:42:16', '2026-03-25 04:42:16'),
(459, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:41:43.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":725.6999999999999,\"net_salary\":19879.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:42:16\"}', '2026-03-25 04:42:16', '2026-03-25 04:42:16'),
(460, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:42:16.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:29\"}', '2026-03-25 04:43:29', '2026-03-25 04:43:29'),
(461, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"945.27\",\"net_salary\":\"18647.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:42:16.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":945.27,\"net_salary\":18647.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:29\"}', '2026-03-25 04:43:29', '2026-03-25 04:43:29'),
(462, 1, 'updated', 'payroll_details', 11, '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":\"672.21\",\"net_salary\":\"16367.79\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:50:12.000000Z\"}', '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":907.2099999999999,\"net_salary\":16132.79,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:29\"}', '2026-03-25 04:43:29', '2026-03-25 04:43:29'),
(463, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"801.61\",\"net_salary\":\"18198.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":1036.6100000000001,\"net_salary\":17963.39,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:29\"}', '2026-03-25 04:43:29', '2026-03-25 04:43:29'),
(464, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"725.70\",\"net_salary\":\"19879.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:42:16.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:29\"}', '2026-03-25 04:43:29', '2026-03-25 04:43:29'),
(465, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:29.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:52\"}', '2026-03-25 04:43:52', '2026-03-25 04:43:52'),
(466, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"945.27\",\"net_salary\":\"18647.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:29.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":945.27,\"net_salary\":18647.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:52\"}', '2026-03-25 04:43:52', '2026-03-25 04:43:52'),
(467, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:29.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:52\"}', '2026-03-25 04:43:52', '2026-03-25 04:43:52'),
(468, 1, 'updated', 'payroll_details', 20, '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":878.3399999999999,\"net_salary\":14236.97,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:52\"}', '2026-03-25 04:43:52', '2026-03-25 04:43:52'),
(469, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:52.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:59\"}', '2026-03-25 04:43:59', '2026-03-25 04:43:59'),
(470, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"945.27\",\"net_salary\":\"18647.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:52.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":945.27,\"net_salary\":18647.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:59\"}', '2026-03-25 04:43:59', '2026-03-25 04:43:59'),
(471, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:52.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:43:59\"}', '2026-03-25 04:43:59', '2026-03-25 04:43:59'),
(472, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"680.74\",\"net_salary\":\"16928.11\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":915.74,\"net_salary\":16693.109999999997,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:00\"}', '2026-03-25 04:44:00', '2026-03-25 04:44:00'),
(473, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:59.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:00\"}', '2026-03-25 04:44:00', '2026-03-25 04:44:00'),
(474, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"945.27\",\"net_salary\":\"18647.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:59.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":945.27,\"net_salary\":18647.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:00\"}', '2026-03-25 04:44:00', '2026-03-25 04:44:00'),
(475, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:59.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:00\"}', '2026-03-25 04:44:00', '2026-03-25 04:44:00'),
(476, 1, 'updated', 'payroll_details', 1, '{\"id\":1,\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:12.000000Z\"}', '{\"id\":1,\"payroll_id\":1,\"employee_id\":2,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:28\"}', '2026-03-25 04:44:28', '2026-03-25 04:44:28'),
(477, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:00.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":8301.6,\"net_salary\":6813.709999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:28\"}', '2026-03-25 04:44:28', '2026-03-25 04:44:28'),
(478, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"945.27\",\"net_salary\":\"18647.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:00.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":945.27,\"net_salary\":18647.899999999998,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:28\"}', '2026-03-25 04:44:28', '2026-03-25 04:44:28'),
(479, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:00.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:44:29\"}', '2026-03-25 04:44:29', '2026-03-25 04:44:29'),
(480, 1, 'updated', 'payroll_details', 2, '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:48:37.000000Z\"}', '{\"id\":2,\"payroll_id\":1,\"employee_id\":7,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(481, 1, 'updated', 'payroll_details', 3, '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":\"743.34\",\"net_salary\":\"14371.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":3,\"payroll_id\":1,\"employee_id\":12,\"base_salary\":\"15115.31\",\"total_deductions\":1653.07,\"net_salary\":13462.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(482, 1, 'updated', 'payroll_details', 4, '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":\"2489.57\",\"net_salary\":\"20040.99\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:41:42.000000Z\"}', '{\"id\":4,\"payroll_id\":1,\"employee_id\":18,\"base_salary\":\"22530.56\",\"total_deductions\":2514.5699999999997,\"net_salary\":20015.99,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(483, 1, 'updated', 'payroll_details', 5, '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":\"8301.60\",\"net_salary\":\"6813.71\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:28.000000Z\"}', '{\"id\":5,\"payroll_id\":1,\"employee_id\":21,\"base_salary\":\"15115.31\",\"total_deductions\":9211.33,\"net_salary\":5903.98,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(484, 1, 'updated', 'payroll_details', 6, '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":\"4864.36\",\"net_salary\":\"10250.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":6,\"payroll_id\":1,\"employee_id\":22,\"base_salary\":\"15115.31\",\"total_deductions\":5774.09,\"net_salary\":9341.22,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(485, 1, 'updated', 'payroll_details', 7, '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":\"1906.61\",\"net_salary\":\"15133.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:41:42.000000Z\"}', '{\"id\":7,\"payroll_id\":1,\"employee_id\":24,\"base_salary\":\"17040.00\",\"total_deductions\":2881.36,\"net_salary\":14158.64,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(486, 1, 'updated', 'payroll_details', 8, '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:30.000000Z\"}', '{\"id\":8,\"payroll_id\":1,\"employee_id\":26,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(487, 1, 'updated', 'payroll_details', 9, '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":\"945.27\",\"net_salary\":\"18647.90\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:28.000000Z\"}', '{\"id\":9,\"payroll_id\":1,\"employee_id\":30,\"base_salary\":\"19593.17\",\"total_deductions\":2096.2200000000003,\"net_salary\":17496.949999999997,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(488, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:29.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:46:34\"}', '2026-03-25 04:46:34', '2026-03-25 04:46:34'),
(489, 1, 'updated', 'payroll_details', 10, '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:49:53.000000Z\"}', '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:47:20\"}', '2026-03-25 04:47:20', '2026-03-25 04:47:20'),
(490, 1, 'updated', 'payroll_details', 11, '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":\"907.21\",\"net_salary\":\"16132.79\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:29.000000Z\"}', '{\"id\":11,\"payroll_id\":1,\"employee_id\":35,\"base_salary\":\"17040.00\",\"total_deductions\":1881.96,\"net_salary\":15158.04,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:47:20\"}', '2026-03-25 04:47:20', '2026-03-25 04:47:20'),
(491, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"1036.61\",\"net_salary\":\"17963.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:29.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":2011.3600000000001,\"net_salary\":16988.64,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:47:20\"}', '2026-03-25 04:47:20', '2026-03-25 04:47:20'),
(492, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:46:34.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":960.6999999999999,\"net_salary\":19644.95,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:47:20\"}', '2026-03-25 04:47:20', '2026-03-25 04:47:20'),
(493, 1, 'updated', 'payroll_details', 13, '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":\"743.34\",\"net_salary\":\"14371.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":13,\"payroll_id\":1,\"employee_id\":37,\"base_salary\":\"15115.31\",\"total_deductions\":1653.07,\"net_salary\":13462.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(494, 1, 'updated', 'payroll_details', 14, '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":\"4982.92\",\"net_salary\":\"10132.39\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:20:22.000000Z\"}', '{\"id\":14,\"payroll_id\":1,\"employee_id\":38,\"base_salary\":\"15115.31\",\"total_deductions\":5892.65,\"net_salary\":9222.66,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(495, 1, 'updated', 'payroll_details', 15, '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":\"960.70\",\"net_salary\":\"19644.95\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:47:20.000000Z\"}', '{\"id\":15,\"payroll_id\":1,\"employee_id\":39,\"base_salary\":\"20605.65\",\"total_deductions\":2187.83,\"net_salary\":18417.82,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(496, 1, 'updated', 'payroll_details', 16, '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":16,\"payroll_id\":1,\"employee_id\":42,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(497, 1, 'updated', 'payroll_details', 17, '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":17,\"payroll_id\":1,\"employee_id\":49,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(498, 1, 'updated', 'payroll_details', 18, '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":18,\"payroll_id\":1,\"employee_id\":57,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(499, 1, 'updated', 'payroll_details', 19, '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":\"643.34\",\"net_salary\":\"14471.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T21:55:03.000000Z\"}', '{\"id\":19,\"payroll_id\":1,\"employee_id\":60,\"base_salary\":\"15115.31\",\"total_deductions\":1553.07,\"net_salary\":13562.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(500, 1, 'updated', 'payroll_details', 20, '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":\"878.34\",\"net_salary\":\"14236.97\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:43:52.000000Z\"}', '{\"id\":20,\"payroll_id\":1,\"employee_id\":63,\"base_salary\":\"15115.31\",\"total_deductions\":1788.07,\"net_salary\":13327.24,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(501, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"915.74\",\"net_salary\":\"16693.11\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:44:00.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":1929.75,\"net_salary\":15679.099999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 22:59:53\"}', '2026-03-25 04:59:53', '2026-03-25 04:59:53'),
(502, 1, 'updated', 'payroll_details', 10, '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":\"1553.07\",\"net_salary\":\"13562.24\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:47:20.000000Z\"}', '{\"id\":10,\"payroll_id\":1,\"employee_id\":34,\"base_salary\":\"15115.31\",\"total_deductions\":9409.14,\"net_salary\":5706.17,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 23:00:39\"}', '2026-03-25 05:00:39', '2026-03-25 05:00:39'),
(503, 1, 'updated', 'payroll_details', 12, '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":\"2011.36\",\"net_salary\":\"16988.64\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:47:20.000000Z\"}', '{\"id\":12,\"payroll_id\":1,\"employee_id\":36,\"base_salary\":\"19000.00\",\"total_deductions\":2644.69,\"net_salary\":16355.31,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 23:00:39\"}', '2026-03-25 05:00:39', '2026-03-25 05:00:39'),
(504, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"1929.75\",\"net_salary\":\"15679.10\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T22:59:53.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":1929.75,\"net_salary\":15679.099999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 23:00:39\"}', '2026-03-25 05:00:39', '2026-03-25 05:00:39'),
(505, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"1929.75\",\"net_salary\":\"15679.10\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T23:00:39.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":1929.75,\"net_salary\":15679.099999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 23:01:22\"}', '2026-03-25 05:01:22', '2026-03-25 05:01:22');
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(506, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"1929.75\",\"net_salary\":\"15679.10\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T23:01:22.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":1929.75,\"net_salary\":15679.099999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 23:02:30\"}', '2026-03-25 05:02:30', '2026-03-25 05:02:30'),
(507, 1, 'updated', 'payroll_details', 21, '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":\"1929.75\",\"net_salary\":\"15679.10\",\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T23:02:30.000000Z\"}', '{\"id\":21,\"payroll_id\":1,\"employee_id\":64,\"base_salary\":\"17608.85\",\"total_deductions\":1929.75,\"net_salary\":15679.099999999999,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-24 23:22:24\"}', '2026-03-25 05:22:24', '2026-03-25 05:22:24'),
(508, 1, 'created', 'deduction_types', 19, NULL, '{\"name\":\"PRESTAMO ISC\",\"abbreviation\":\"PTMO ISC\",\"sort_order\":\"11\",\"is_active\":true,\"updated_at\":\"2026-03-24 23:45:45\",\"created_at\":\"2026-03-24 23:45:45\",\"id\":19}', '2026-03-25 05:45:45', '2026-03-25 05:45:45'),
(509, 1, 'updated', 'payrolls', 1, '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-24T05:08:05.000000Z\"}', '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-25 00:24:45\"}', '2026-03-25 06:24:45', '2026-03-25 06:24:45'),
(510, 1, 'updated', 'payrolls', 1, '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:08:05.000000Z\",\"updated_at\":\"2026-03-25T00:24:45.000000Z\"}', '{\"id\":1,\"month\":3,\"year\":2026,\"level_id\":1,\"status\":\"Aprobada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":1,\"observations\":null,\"created_at\":\"2026-03-24 05:08:05\",\"updated_at\":\"2026-03-25 00:24:46\"}', '2026-03-25 06:24:46', '2026-03-25 06:24:46'),
(511, 1, 'updated', 'payrolls', 2, '{\"id\":2,\"month\":3,\"year\":2026,\"level_id\":2,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-24T05:08:44.000000Z\"}', '{\"id\":2,\"month\":3,\"year\":2026,\"level_id\":2,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-25 00:31:16\"}', '2026-03-25 06:31:16', '2026-03-25 06:31:16'),
(512, 1, 'updated', 'payrolls', 2, '{\"id\":2,\"month\":3,\"year\":2026,\"level_id\":2,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:08:44.000000Z\",\"updated_at\":\"2026-03-25T00:31:16.000000Z\"}', '{\"id\":2,\"month\":3,\"year\":2026,\"level_id\":2,\"status\":\"Aprobada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":1,\"observations\":null,\"created_at\":\"2026-03-24 05:08:44\",\"updated_at\":\"2026-03-25 00:31:18\"}', '2026-03-25 06:31:18', '2026-03-25 06:31:18'),
(513, 1, 'updated', 'payrolls', 3, '{\"id\":3,\"month\":3,\"year\":2026,\"level_id\":3,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:22:15.000000Z\",\"updated_at\":\"2026-03-24T05:22:15.000000Z\"}', '{\"id\":3,\"month\":3,\"year\":2026,\"level_id\":3,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24 05:22:15\",\"updated_at\":\"2026-03-25 00:31:35\"}', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(514, 1, 'updated', 'payrolls', 3, '{\"id\":3,\"month\":3,\"year\":2026,\"level_id\":3,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:22:15.000000Z\",\"updated_at\":\"2026-03-25T00:31:35.000000Z\"}', '{\"id\":3,\"month\":3,\"year\":2026,\"level_id\":3,\"status\":\"Aprobada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":1,\"observations\":null,\"created_at\":\"2026-03-24 05:22:15\",\"updated_at\":\"2026-03-25 00:31:38\"}', '2026-03-25 06:31:38', '2026-03-25 06:31:38'),
(515, 1, 'updated', 'payrolls', 4, '{\"id\":4,\"month\":3,\"year\":2026,\"level_id\":4,\"status\":\"Borrador\",\"created_by\":1,\"reviewed_by\":null,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-24T05:47:01.000000Z\"}', '{\"id\":4,\"month\":3,\"year\":2026,\"level_id\":4,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-25 00:31:50\"}', '2026-03-25 06:31:50', '2026-03-25 06:31:50'),
(516, 1, 'updated', 'payrolls', 4, '{\"id\":4,\"month\":3,\"year\":2026,\"level_id\":4,\"status\":\"Revisada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":null,\"observations\":null,\"created_at\":\"2026-03-24T05:47:01.000000Z\",\"updated_at\":\"2026-03-25T00:31:50.000000Z\"}', '{\"id\":4,\"month\":3,\"year\":2026,\"level_id\":4,\"status\":\"Aprobada\",\"created_by\":1,\"reviewed_by\":1,\"approved_by\":1,\"observations\":null,\"created_at\":\"2026-03-24 05:47:01\",\"updated_at\":\"2026-03-25 00:31:52\"}', '2026-03-25 06:31:52', '2026-03-25 06:31:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deduction_types`
--

CREATE TABLE `deduction_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `abbreviation` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `deduction_types`
--

INSERT INTO `deduction_types` (`id`, `name`, `abbreviation`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Instituto Hondureño de Seguridad Social', 'IHSS', 1, 1, '2026-03-19 11:13:10', '2026-03-19 11:21:10'),
(2, 'Régimen de Aportaciones Privadas', 'RAP', 1, 2, '2026-03-19 11:13:10', '2026-03-19 23:52:12'),
(3, 'OTRAS DEDUCCIONES 2', 'OTROS 2', 1, 13, '2026-03-19 11:13:10', '2026-03-23 01:37:29'),
(4, 'OTRAS DEDUCCIONES 1', 'OTROS 1', 1, 12, '2026-03-19 11:13:10', '2026-03-23 01:37:56'),
(5, 'INASISTENCIAS', 'INASIST.', 1, 15, '2026-03-19 11:13:10', '2026-03-23 01:38:36'),
(6, 'Cooperativa Maestros', 'COO. MAES.', 1, 8, '2026-03-19 11:13:10', '2026-03-19 23:56:17'),
(7, 'COMITE SOCIAL', 'COM. SOC.', 1, 9, '2026-03-19 11:13:10', '2026-03-19 23:57:44'),
(8, 'Cuota de Prestamo RAP', 'PTMO. RAP', 1, 3, '2026-03-19 11:46:21', '2026-03-19 23:53:05'),
(9, 'Cuota Prestamo ISC', 'PTMO. ISC', 1, 4, '2026-03-19 11:47:47', '2026-03-19 23:53:35'),
(10, 'Anticipo de Sueldo', 'ANT SUELDO', 1, 5, '2026-03-19 11:49:49', '2026-03-19 23:54:04'),
(11, 'Prestamo de Banco Tabajadores', 'PTMO. CUST.', 1, 6, '2026-03-19 11:57:18', '2026-03-19 23:54:58'),
(12, 'Ahorro de Viaje', 'AHO. VIAJE', 1, 7, '2026-03-19 11:58:04', '2026-03-19 23:55:40'),
(13, 'Aportacions INPREMA', 'INPREMA', 1, 2, '2026-03-19 12:38:41', '2026-03-23 01:19:39'),
(14, 'Prestamo INPREMA', 'PTMO. INP', 1, 3, '2026-03-19 12:39:54', '2026-03-23 01:21:09'),
(15, 'Prestamo Hipotecario INPREMA', 'PTMO. HIP.INP.', 1, 4, '2026-03-19 12:41:21', '2026-03-23 01:21:58'),
(16, 'Area Social Preescolar', 'A.S.Pre', 0, 9, '2026-03-19 13:11:07', '2026-03-23 01:41:01'),
(17, 'Area Social Primaria', 'A.S.Pri', 0, 10, '2026-03-19 13:12:12', '2026-03-23 01:41:11'),
(18, 'OTRAS DEDUCCIONES 3', 'OTROS 3', 1, 14, '2026-03-20 00:05:21', '2026-03-23 01:38:12'),
(19, 'PRESTAMO ISC', 'PTMO ISC', 1, 11, '2026-03-25 05:45:45', '2026-03-25 05:45:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deduction_type_payroll_level`
--

CREATE TABLE `deduction_type_payroll_level` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deduction_type_id` bigint(20) UNSIGNED NOT NULL,
  `payroll_level_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `deduction_type_payroll_level`
--

INSERT INTO `deduction_type_payroll_level` (`id`, `deduction_type_id`, `payroll_level_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 1, 2, NULL, NULL),
(10, 3, 2, NULL, NULL),
(11, 4, 2, NULL, NULL),
(12, 5, 2, NULL, NULL),
(13, 6, 2, NULL, NULL),
(15, 1, 3, NULL, NULL),
(17, 3, 3, NULL, NULL),
(18, 4, 3, NULL, NULL),
(19, 5, 3, NULL, NULL),
(20, 6, 3, NULL, NULL),
(22, 1, 4, NULL, NULL),
(24, 3, 4, NULL, NULL),
(25, 4, 4, NULL, NULL),
(26, 5, 4, NULL, NULL),
(27, 6, 4, NULL, NULL),
(32, 8, 1, NULL, NULL),
(33, 9, 1, NULL, NULL),
(34, 10, 1, NULL, NULL),
(35, 10, 2, NULL, NULL),
(36, 10, 3, NULL, NULL),
(37, 10, 4, NULL, NULL),
(38, 10, 5, NULL, NULL),
(39, 11, 1, NULL, NULL),
(40, 11, 2, NULL, NULL),
(41, 11, 3, NULL, NULL),
(42, 11, 4, NULL, NULL),
(43, 11, 5, NULL, NULL),
(44, 12, 1, NULL, NULL),
(45, 12, 2, NULL, NULL),
(46, 12, 3, NULL, NULL),
(47, 12, 4, NULL, NULL),
(48, 12, 5, NULL, NULL),
(52, 13, 2, NULL, NULL),
(53, 13, 3, NULL, NULL),
(54, 13, 4, NULL, NULL),
(56, 14, 2, NULL, NULL),
(57, 14, 3, NULL, NULL),
(58, 14, 4, NULL, NULL),
(60, 15, 2, NULL, NULL),
(61, 15, 3, NULL, NULL),
(62, 15, 4, NULL, NULL),
(68, 18, 1, NULL, NULL),
(69, 7, 2, NULL, NULL),
(70, 7, 3, NULL, NULL),
(71, 7, 4, NULL, NULL),
(72, 19, 2, NULL, NULL),
(73, 19, 3, NULL, NULL),
(74, 19, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_code` varchar(191) NOT NULL,
  `dni` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `ihss_number` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_account` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `status` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `hire_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `employee_code`, `dni`, `first_name`, `last_name`, `ihss_number`, `bank_name`, `bank_account`, `email`, `level_id`, `base_salary`, `phone`, `status`, `hire_date`, `created_at`, `updated_at`) VALUES
(1, 'A0001', '0801198610505', 'ALEJANDRA MARIA', 'ALMENDARES LOPEZ', '', 'BANPAIS', '213010112167', '', 3, 19042.04, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(2, 'L0001', '1210198300048', 'ALVA SUYAPA', 'LOPEZ GARCIA', '', 'BANPAIS', '213220008528', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(3, 'C0001', '0801196307898', 'ANA ALICIA', 'CALIX PAVON', '', 'BANPAIS', '210010120378', '', 3, 21029.32, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(4, 'F0001', '0801200411064', 'ANA GABRIELA', 'FLORES OLIVA', '', 'BANPAIS', '213060174751', '', 4, 18589.05, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(5, 'M0001', '0801196608347', 'ANA MARIA', 'MOLINA SALGADO', '', 'BANPAIS', '210010120351', '', 4, 19664.68, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(6, 'R0001', '0801199103154', 'ANGELA CARINA', 'RUIZ ALVARADO', '', 'BANPAIS', '213000343492', '', 3, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(7, 'A0002', '0827198000090', 'CARLOS ALFREDO', 'AGUILAR MARADIAGA', '', 'BANPAIS', '213050129540', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(8, 'P0001', '0612199900066', 'CESIA GRISEL', 'PEREZ FLORES', '', 'BANPAIS', '213010223279', '', 4, 18589.05, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(9, 'J0001', '0801199205697', 'CINDY JOSELIN', 'JACINTO YANES', '', 'BANPAIS', '213010143291', '', 3, 18668.20, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(10, 'C0002', '0801197405937', 'CLAUDIA PATRICIA', 'CASTRO MEJIA', '', 'BANPAIS', '213110012610', '', 3, 19416.16, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(11, 'N0001', '0801198418090', 'CLAUDIA PATRICIA', 'NAVAS VELASQUEZ', '', 'BANPAIS', '213050046408', '', 3, 22916.16, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(12, 'M0002', '1505198600464', 'DANIA ADELINA', 'MEDRANO ESCAÑO', '', 'BANPAIS', '213220004646', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(13, 'S0001', '0801199604400', 'DANIELA ENEYDA', 'SUAZO ANDINO', '', 'BANPAIS', '213010140217', '', 4, 20157.06, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(14, 'P0002', '0801200015292', 'DAVID ALEJANDRO', 'PEREZ VALENZUELA', '', 'BANPAIS', '213080142472', '', 4, 19119.44, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(15, 'G0001', '1206198600149', 'DELMIS SUYAPA', 'GARCIA MEJIA', '', 'BANPAIS', '213060062767', '', 4, 21033.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(16, 'V0001', '0703197301521', 'DELMY LIZETH', 'VALLADARES VARELA', '', 'BANPAIS', '213000061586', '', 3, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(17, 'S0002', '0801199914221', 'DIEGO ANDRES', 'SIERRA DURON', '', 'BANPAIS', '213180170710', '', 3, 19091.45, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(18, 'A0003', '0801196306453', 'ENA ELOISA', 'AVILA RODRIGUEZ', '', 'BANPAIS', '210010120459', '', 1, 22530.56, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(19, 'G0002', '0801199521125', 'ESTEFANY NICOLE', 'GALINDO FLORES', '', 'BANPAIS', '213080089172', '', 2, 17040.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(20, 'M0003', '0801200222376', 'ETHAN ANDRE', 'MARTINEZ HERNANDEZ', '', 'BANPAIS', '213060174760', '', 4, 19196.58, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(21, 'G0003', '0801197006339', 'FATY YONABEL', 'GONZALEZ ALONZO', '', 'BANPAIS', '213220023721', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(22, 'C0003', '0607196800378', 'FRANCISCO', 'CRUZ ESCOBAR', '', 'BANPAIS', '213220058754', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(23, 'M0004', '0801199216105', 'GABRIELA ALEJANDRA', 'MARTINEZ ORTEZ', '', 'BANPAIS', '213120019943', '', 4, 19042.04, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(24, 'V0002', '0801199501985', 'GABRIELA IVETH', 'VILLEDA ZEPEDA', '', 'BANPAIS', '213130064852', '', 1, 17040.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(25, 'A0004', '0311199800017', 'GENESIS GABRIELA', 'AQUINO COREA', '', 'BANPAIS', '213210052362', '', 3, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(26, 'Z0001', '0823198900124', 'GERSON JAVIER', 'ZELAYA SALGADO', '', 'BANPAIS', '213220039040', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(27, 'C0004', '0816198200534', 'GLENDA XIOMARA', 'CANALES AMADOR', '', 'BANPAIS', '213050018188', '', 4, 18778.72, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(28, 'U0001', '0801198614257', 'HAROL DAVID', 'UMANZOR RIVERA', '', 'BANPAIS', '213010108372', '', 4, 17977.04, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(29, 'R0002', '0716199400304', 'IHARA NAHOMY', 'RODRIGUEZ SANCHEZ', '', 'BANPAIS', '213060072045', '', 4, 18086.64, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(30, 'F0002', '0801198615369', 'ILIANA YAHAIRA', 'FLORES ZELAYA', '', 'BANPAIS', '213000277686', '', 1, 19593.17, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(31, 'B0001', '0826199800242', 'JAKLIN YOLIBETH', 'BUSTILLO CERRATO', '', 'BANPAIS', '213220059424', '', 3, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(32, 'D0001', '1806200100320', 'JENIFER MICHELLE', 'DUBON DIAZ', '', 'BANPAIS', '213060158500', '', 4, 20201.40, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(33, 'A0005', '0801199407242', 'JENNIFER LIZETH', 'ANDRADE FLORES', '', 'BANPAIS', '213090167885', '', 4, 16380.77, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(34, 'R0003', '0809198600193', 'JENNY MARITZA', 'RAMOS MARTINEZ', '', 'BANPAIS', '213180148120', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(35, 'M0005', '1503197401292', 'JESSICA YESSENIA', 'MORALES SILVA', '', 'BANPAIS', '213060158780', '', 1, 17040.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(36, 'M0006', '0801199819710', 'JOHAN LIZANDRO', 'MATAMOROS PINEDA', '', 'BANPAIS', '213050096626', '', 1, 19000.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(37, 'L0002', '0401197700754', 'JOSE AMELIO', 'LOPEZ COREA', 'B1998197700754', 'BANPAIS', '213220004638', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(38, 'C0005', '0607197000496', 'JOSE MANUEL', 'CRUZ ESCOBAR', '', 'BANPAIS', '213090147396', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(39, 'M0007', '0801198804809', 'JOSE MOISES', 'MACHADO GARCIA', '', 'BANPAIS', '213220016458', '', 1, 20605.65, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(40, 'F0003', '0801199404679', 'JOSSELINE ALEXANDRA', 'FLORES VARGAS', '', 'BANPAIS', '213220041266', '', 2, 17603.20, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(41, 'M0008', '0801199110724', 'JOSUE DAVID', 'MARTINEZ ORTEZ', '', 'BANPAIS', '213120012655', '', 3, 18000.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(42, 'A0006', '0813197900115', 'JUAN RAMON', 'ALONZO MARTINEZ', '', 'BANPAIS', '213220070495', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(43, 'M0009', '0818199600104', 'KATHERINE NOHEMY', 'MONTOYA BAUTISTA', '', 'BANPAIS', '213270127075', '', 4, 19593.86, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(44, 'R0004', '1317199700087', 'KEYLIN MARIELA', 'RAMOS DIAZ', '', 'BANPAIS', '213130050517', '', 3, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(45, 'C0006', '0801199602302', 'LILIAN NICOLE', 'CHAVARRIA BERTOTTI', '', 'BANPAIS', '213180149398', '', 3, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(46, 'M0010', '0801196703201', 'MARIA ANTONIA', 'MONTALVO AMADOR', '', 'BANPAIS', '210010120416', '', 3, 21529.32, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(47, 'S0003', '0801199001255', 'MARIA JOSE', 'SARAVIA MEJIA', '', 'BANPAIS', '213210067270', '', 2, 18105.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(48, 'B0002', '0801196604221', 'MARTHA MARIA', 'BORJAS GALO', '', 'BANPAIS', '213050025044', '', 4, 21816.78, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(49, 'V0003', '1313198800030', 'MARTINA', 'VILLEDA VEGA', '', 'BANPAIS', '213220043684', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(50, 'H0001', '1809199500153', 'MICHELLE ALEJANDRA', 'HERNANDEZ', '', 'BANPAIS', '213090117667', '', 3, 18668.20, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(51, 'C0007', '0801200110958', 'OLGA FABIOLA', 'CARRASCO ANDINO', '', 'BANPAIS', '213180187745', '', 2, 17040.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(52, 'F0004', '0801199024891', 'PABLO ANTOTIO', 'FUNEZ ORDOÑEZ', '', 'BANPAIS', '213060108562', '', 4, 19334.47, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(53, 'B0003', '0801200219821', 'PAOLA FERNANDA', 'BRACAMONTE FLORES', '', 'BANPAIS', '213060185133', '', 4, 16579.42, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(54, 'V0004', '0801199519985', 'PEDRO SAMUEL', 'VASQUEZ RODRIGUEZ', '', 'BANPAIS', '213050137098', '', 3, 16579.42, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(55, 'R0005', '0801197401221', 'RAFAEL RICARDO', 'ROSALES MENDEZ', '', 'BANPAIS', '213050023670', '', 4, 24758.42, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(56, 'Z0002', '0801199720130', 'RIGOBERTO JOSUE', 'ZELAYA RODRIGUEZ', '', 'BANPAIS', '213130066073', '', 4, 17902.00, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(57, 'G0004', '0801198917495', 'RODRIGO JOSUE', 'GARCIA DAVILA', '', 'BANPAIS', '213260125746', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(58, 'M0011', '0801196806693', 'SANDRA BELINDA', 'MOLINA SALGADO', '', 'BANPAIS', '210010120394', '', 4, 25431.38, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(59, 'G0005', '0611199500501', 'SAUDY MARIELA', 'GARCIA BACA', '', 'BANPAIS', '213270175010', '', 4, 20140.64, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(60, 'G0006', '0813197200015', 'SILVIA MARINA', 'GONZALEZ GONZALEZ', '', 'BANPAIS', '210010120505', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(61, 'O0001', '0801199610805', 'SIUGAN YASMARY', 'OYUELA ESPINAL', '', 'BANPAIS', '213090087563', '', 3, 19042.04, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(62, 'O0002', '1301197000034', 'TERESA JACKELINE', 'ORTEZ VILLANUEVA', '', 'BANPAIS', '210010118950', '', 4, 23699.01, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 10:59:11'),
(63, 'M0012', '0809199300384', 'WENDY ARACELY', 'MARTINEZ RAMOS', '', 'BANPAIS', '213010178559', '', 1, 15115.31, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30'),
(64, 'A0007', '0801197607178', 'YENI CAROLINA', 'AVILA GALO', '', 'BANPAIS', '213220041240', '', 1, 17608.85, '', 'Activo', '2026-03-24', '2026-03-24 10:59:11', '2026-03-24 11:06:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_11_000000_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2026_03_18_190423_create_payroll_levels_table', 1),
(7, '2026_03_18_190424_create_deduction_types_table', 1),
(8, '2026_03_18_190424_create_employees_table', 1),
(9, '2026_03_18_190425_create_payrolls_table', 1),
(10, '2026_03_18_190426_create_payroll_details_table', 1),
(11, '2026_03_18_190427_create_audit_logs_table', 1),
(12, '2026_03_18_190427_create_settings_table', 1),
(13, '2026_03_18_190428_create_deduction_type_payroll_level_table', 1),
(14, '2026_03_18_190429_create_payroll_detail_deductions_table', 1),
(15, '2026_03_18_200000_alter_deduction_types_abbreviation', 1),
(16, '2026_03_18_210000_add_sort_order_to_deduction_types_table', 1),
(17, '2026_03_22_132013_update_payroll_levels_names', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Borrador','Revisada','Aprobada','Enviada') NOT NULL DEFAULT 'Borrador',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `observations` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payrolls`
--

INSERT INTO `payrolls` (`id`, `month`, `year`, `level_id`, `status`, `created_by`, `reviewed_by`, `approved_by`, `observations`, `created_at`, `updated_at`) VALUES
(1, 3, 2026, 1, 'Aprobada', 1, 1, 1, NULL, '2026-03-24 11:08:05', '2026-03-25 06:24:46'),
(2, 3, 2026, 2, 'Aprobada', 1, 1, 1, NULL, '2026-03-24 11:08:44', '2026-03-25 06:31:18'),
(3, 3, 2026, 3, 'Aprobada', 1, 1, 1, NULL, '2026-03-24 11:22:15', '2026-03-25 06:31:38'),
(4, 3, 2026, 4, 'Aprobada', 1, 1, 1, NULL, '2026-03-24 11:47:01', '2026-03-25 06:31:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_details`
--

CREATE TABLE `payroll_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `total_deductions` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payroll_details`
--

INSERT INTO `payroll_details` (`id`, `payroll_id`, `employee_id`, `base_salary`, `total_deductions`, `net_salary`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:44:28'),
(2, 1, 7, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(3, 1, 12, 15115.31, 1653.07, 13462.24, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(4, 1, 18, 22530.56, 2514.57, 20015.99, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(5, 1, 21, 15115.31, 9211.33, 5903.98, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(6, 1, 22, 15115.31, 5774.09, 9341.22, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(7, 1, 24, 17040.00, 2881.36, 14158.64, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(8, 1, 26, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(9, 1, 30, 19593.17, 2096.22, 17496.95, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(10, 1, 34, 15115.31, 9409.14, 5706.17, '2026-03-24 11:08:05', '2026-03-25 05:00:39'),
(11, 1, 35, 17040.00, 1881.96, 15158.04, '2026-03-24 11:08:05', '2026-03-25 04:47:20'),
(12, 1, 36, 19000.00, 2644.69, 16355.31, '2026-03-24 11:08:05', '2026-03-25 05:00:39'),
(13, 1, 37, 15115.31, 1653.07, 13462.24, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(14, 1, 38, 15115.31, 5892.65, 9222.66, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(15, 1, 39, 20605.65, 2187.83, 18417.82, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(16, 1, 42, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(17, 1, 49, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(18, 1, 57, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(19, 1, 60, 15115.31, 1553.07, 13562.24, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(20, 1, 63, 15115.31, 1788.07, 13327.24, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(21, 1, 64, 17608.85, 1929.75, 15679.10, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(22, 2, 19, 17040.00, 2151.38, 14888.62, '2026-03-24 11:08:44', '2026-03-24 11:15:56'),
(23, 2, 40, 17603.20, 9489.72, 8113.48, '2026-03-24 11:08:44', '2026-03-24 11:18:13'),
(24, 2, 47, 18105.00, 2252.55, 15852.45, '2026-03-24 11:08:44', '2026-03-24 11:16:33'),
(25, 2, 51, 17040.00, 2151.38, 14888.62, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(26, 3, 1, 19042.04, 4797.41, 14244.63, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(27, 3, 3, 21029.32, 2630.36, 18398.96, '2026-03-24 11:22:16', '2026-03-24 11:41:13'),
(28, 3, 6, 18105.00, 2252.55, 15852.45, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(29, 3, 9, 18668.20, 2306.05, 16362.15, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(30, 3, 10, 19416.16, 3128.11, 16288.05, '2026-03-24 11:22:16', '2026-03-24 11:43:18'),
(31, 3, 11, 22916.16, 2709.61, 20206.55, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(32, 3, 16, 18105.00, 6223.45, 11881.55, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(33, 3, 17, 19091.45, 2346.26, 16745.19, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(34, 3, 25, 18105.00, 2752.55, 15352.45, '2026-03-24 11:22:16', '2026-03-24 11:41:55'),
(35, 3, 31, 18105.00, 2252.55, 15852.45, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(36, 3, 41, 18000.00, 3242.58, 14757.42, '2026-03-24 11:22:16', '2026-03-24 11:42:40'),
(37, 3, 44, 18105.00, 2252.55, 15852.45, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(38, 3, 45, 18105.00, 2752.55, 15352.45, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(39, 3, 46, 21529.32, 2577.86, 18951.46, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(40, 3, 50, 18668.20, 3306.05, 15362.15, '2026-03-24 11:22:16', '2026-03-24 11:42:40'),
(41, 3, 54, 16579.42, 3107.62, 13471.80, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(42, 3, 61, 19042.04, 3841.57, 15200.47, '2026-03-24 11:22:16', '2026-03-24 11:42:40'),
(43, 4, 4, 18589.05, 3098.53, 15490.52, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(44, 4, 5, 19664.68, 10956.78, 8707.90, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(45, 4, 8, 18589.05, 3798.53, 14790.52, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(46, 4, 13, 20157.06, 2447.50, 17709.56, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(47, 4, 14, 19119.44, 2648.92, 16470.52, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(48, 4, 15, 21033.31, 3030.74, 18002.57, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(49, 4, 20, 19196.58, 2856.25, 16340.33, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(50, 4, 23, 19042.04, 2341.57, 16700.47, '2026-03-24 11:47:01', '2026-03-24 12:06:41'),
(51, 4, 27, 18778.72, 3316.55, 15462.17, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(52, 4, 28, 17977.04, 3240.39, 14736.65, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(53, 4, 29, 18086.64, 2550.81, 15535.83, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(54, 4, 32, 20201.40, 3451.71, 16749.69, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(55, 4, 33, 16380.77, 3588.75, 12792.02, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(56, 4, 43, 19593.86, 3393.99, 16199.87, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(57, 4, 48, 21816.78, 11745.44, 10071.34, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(58, 4, 52, 19334.47, 3369.34, 15965.13, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(59, 4, 53, 16579.42, 2107.62, 14471.80, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(60, 4, 55, 24758.42, 4484.62, 20273.80, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(61, 4, 56, 17902.00, 4733.27, 13168.73, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(62, 4, 58, 25431.38, 4448.56, 20982.82, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(63, 4, 59, 20140.64, 2645.94, 17494.70, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(64, 4, 62, 23699.01, 6093.07, 17605.94, '2026-03-24 11:47:01', '2026-03-24 12:05:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_detail_deductions`
--

CREATE TABLE `payroll_detail_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_detail_id` bigint(20) UNSIGNED NOT NULL,
  `deduction_type_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payroll_detail_deductions`
--

INSERT INTO `payroll_detail_deductions` (`id`, `payroll_detail_id`, `deduction_type_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(2, 1, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(3, 1, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(4, 1, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(5, 1, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(6, 1, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(7, 1, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(8, 1, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(9, 1, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(10, 1, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(11, 1, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(12, 1, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(13, 1, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:44:28'),
(14, 2, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(15, 2, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:48:37'),
(16, 2, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(17, 2, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(18, 2, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(19, 2, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(20, 2, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(21, 2, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(22, 2, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(23, 2, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(24, 2, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(25, 2, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(26, 2, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(27, 3, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(28, 3, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(29, 3, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(30, 3, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(31, 3, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(32, 3, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(33, 3, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(34, 3, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(35, 3, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(36, 3, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(37, 3, 11, 100.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(38, 3, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(39, 3, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(40, 4, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(41, 4, 2, 159.41, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(42, 4, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(43, 4, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(44, 4, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(45, 4, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(46, 4, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(47, 4, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(48, 4, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(49, 4, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(50, 4, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(51, 4, 12, 1500.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(52, 4, 18, 25.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(53, 5, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(54, 5, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(55, 5, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(56, 5, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(57, 5, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(58, 5, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(59, 5, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(60, 5, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(61, 5, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(62, 5, 10, 3000.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(63, 5, 11, 4423.26, '2026-03-24 11:08:05', '2026-03-25 04:20:22'),
(64, 5, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(65, 5, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(66, 6, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(67, 6, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(68, 6, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(69, 6, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(70, 6, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(71, 6, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(72, 6, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(73, 6, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(74, 6, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(75, 6, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(76, 6, 11, 4221.02, '2026-03-24 11:08:05', '2026-03-25 04:20:22'),
(77, 6, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(78, 6, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(79, 7, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(80, 7, 2, 76.45, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(81, 7, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(82, 7, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(83, 7, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(84, 7, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(85, 7, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(86, 7, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(87, 7, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(88, 7, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(89, 7, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(90, 7, 12, 1000.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(91, 7, 18, 974.75, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(92, 8, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(93, 8, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(94, 8, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(95, 8, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(96, 8, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(97, 8, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(98, 8, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(99, 8, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(100, 8, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(101, 8, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(102, 8, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(103, 8, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(104, 8, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(105, 9, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(106, 9, 2, 115.11, '2026-03-24 11:08:05', '2026-03-25 03:49:30'),
(107, 9, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(108, 9, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(109, 9, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(110, 9, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(111, 9, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(112, 9, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(113, 9, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(114, 9, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(115, 9, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(116, 9, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(117, 9, 18, 1150.95, '2026-03-24 11:08:05', '2026-03-25 04:46:34'),
(118, 10, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(119, 10, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:49:53'),
(120, 10, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(121, 10, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(122, 10, 5, 7856.07, '2026-03-24 11:08:05', '2026-03-25 05:00:39'),
(123, 10, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(124, 10, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(125, 10, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(126, 10, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(127, 10, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(128, 10, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(129, 10, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(130, 10, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:47:20'),
(131, 11, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(132, 11, 2, 77.05, '2026-03-24 11:08:05', '2026-03-25 03:50:12'),
(133, 11, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(134, 11, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(135, 11, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(136, 11, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(137, 11, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(138, 11, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(139, 11, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(140, 11, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(141, 11, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(142, 11, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(143, 11, 18, 974.75, '2026-03-24 11:08:05', '2026-03-25 04:47:20'),
(144, 12, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(145, 12, 2, 106.45, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(146, 12, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(147, 12, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(148, 12, 5, 633.33, '2026-03-24 11:08:05', '2026-03-25 05:00:39'),
(149, 12, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(150, 12, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(151, 12, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(152, 12, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(153, 12, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(154, 12, 11, 100.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(155, 12, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(156, 12, 18, 974.75, '2026-03-24 11:08:05', '2026-03-25 04:47:20'),
(157, 13, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(158, 13, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(159, 13, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(160, 13, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(161, 13, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(162, 13, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(163, 13, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(164, 13, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(165, 13, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(166, 13, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(167, 13, 11, 100.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(168, 13, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(169, 13, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(170, 14, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(171, 14, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(172, 14, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(173, 14, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(174, 14, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(175, 14, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(176, 14, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(177, 14, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(178, 14, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(179, 14, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(180, 14, 11, 4339.58, '2026-03-24 11:08:05', '2026-03-25 04:20:22'),
(181, 14, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(182, 14, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(183, 15, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(184, 15, 2, 130.54, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(185, 15, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(186, 15, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(187, 15, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(188, 15, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(189, 15, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(190, 15, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(191, 15, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(192, 15, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(193, 15, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(194, 15, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(195, 15, 18, 1227.13, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(196, 16, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(197, 16, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(198, 16, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(199, 16, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(200, 16, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(201, 16, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(202, 16, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(203, 16, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(204, 16, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(205, 16, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(206, 16, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(207, 16, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(208, 16, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(209, 17, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(210, 17, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(211, 17, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(212, 17, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(213, 17, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(214, 17, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(215, 17, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(216, 17, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(217, 17, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(218, 17, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(219, 17, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:23'),
(220, 17, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(221, 17, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(222, 18, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:12'),
(223, 18, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(224, 18, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(225, 18, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(226, 18, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(227, 18, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(228, 18, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(229, 18, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(230, 18, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(231, 18, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(232, 18, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(233, 18, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(234, 18, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(235, 19, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:13'),
(236, 19, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(237, 19, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(238, 19, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(239, 19, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(240, 19, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(241, 19, 7, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(242, 19, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(243, 19, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(244, 19, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(245, 19, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(246, 19, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(247, 19, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(248, 20, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:13'),
(249, 20, 2, 48.18, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(250, 20, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(251, 20, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(252, 20, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(253, 20, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(254, 20, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(255, 20, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(256, 20, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(257, 20, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(258, 20, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(259, 20, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(260, 20, 18, 909.73, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(261, 21, 1, 595.16, '2026-03-24 11:08:05', '2026-03-25 03:48:13'),
(262, 21, 2, 85.58, '2026-03-24 11:08:05', '2026-03-25 03:55:03'),
(263, 21, 3, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(264, 21, 4, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(265, 21, 5, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(266, 21, 6, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(267, 21, 7, 235.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(268, 21, 8, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(269, 21, 9, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(270, 21, 10, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(271, 21, 11, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(272, 21, 12, 0.00, '2026-03-24 11:08:05', '2026-03-25 05:22:24'),
(273, 21, 18, 1014.01, '2026-03-24 11:08:05', '2026-03-25 04:59:53'),
(274, 22, 1, 297.58, '2026-03-24 11:08:44', '2026-03-24 11:15:28'),
(275, 22, 3, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(276, 22, 4, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(277, 22, 5, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(278, 22, 6, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(279, 22, 10, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(280, 22, 11, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(281, 22, 12, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(282, 22, 13, 1618.80, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(283, 22, 14, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(284, 22, 15, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(285, 22, 16, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:13'),
(286, 22, 17, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:13'),
(287, 22, 7, 235.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(288, 23, 1, 297.58, '2026-03-24 11:08:44', '2026-03-24 11:15:28'),
(289, 23, 3, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(290, 23, 4, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(291, 23, 5, 6284.84, '2026-03-24 11:08:44', '2026-03-24 11:18:13'),
(292, 23, 6, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(293, 23, 10, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(294, 23, 11, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(295, 23, 12, 1000.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(296, 23, 13, 1672.30, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(297, 23, 14, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(298, 23, 15, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(299, 23, 16, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:13'),
(300, 23, 17, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:13'),
(301, 23, 7, 235.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(302, 24, 1, 297.58, '2026-03-24 11:08:44', '2026-03-24 11:15:28'),
(303, 24, 3, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(304, 24, 4, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(305, 24, 5, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(306, 24, 6, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(307, 24, 10, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(308, 24, 11, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(309, 24, 12, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(310, 24, 13, 1719.97, '2026-03-24 11:08:44', '2026-03-24 11:16:33'),
(311, 24, 14, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(312, 24, 15, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(313, 24, 16, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:14'),
(314, 24, 17, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:14'),
(315, 24, 7, 235.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(316, 25, 1, 297.58, '2026-03-24 11:08:44', '2026-03-24 11:15:28'),
(317, 25, 3, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(318, 25, 4, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(319, 25, 5, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(320, 25, 6, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(321, 25, 10, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(322, 25, 11, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(323, 25, 12, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(324, 25, 13, 1618.80, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(325, 25, 14, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(326, 25, 15, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(327, 25, 16, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:14'),
(328, 25, 17, 0.00, '2026-03-24 11:08:44', '2026-03-24 11:18:14'),
(329, 25, 7, 235.00, '2026-03-24 11:08:44', '2026-03-24 11:21:21'),
(330, 26, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(331, 26, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(332, 26, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(333, 26, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(334, 26, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(335, 26, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(336, 26, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(337, 26, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(338, 26, 13, 1808.99, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(339, 26, 14, 2455.84, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(340, 26, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(341, 26, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(342, 27, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(343, 27, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(344, 27, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(345, 27, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(346, 27, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(347, 27, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(348, 27, 11, 100.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(349, 27, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(350, 27, 13, 1997.78, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(351, 27, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(352, 27, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(353, 27, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(354, 28, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(355, 28, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(356, 28, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(357, 28, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(358, 28, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(359, 28, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(360, 28, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(361, 28, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(362, 28, 13, 1719.97, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(363, 28, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(364, 28, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(365, 28, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(366, 29, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(367, 29, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(368, 29, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(369, 29, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(370, 29, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(371, 29, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(372, 29, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(373, 29, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(374, 29, 13, 1773.47, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(375, 29, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(376, 29, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(377, 29, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(378, 30, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:35'),
(379, 30, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(380, 30, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(381, 30, 5, 751.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(382, 30, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(383, 30, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(384, 30, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(385, 30, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(386, 30, 13, 1844.53, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(387, 30, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(388, 30, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(389, 30, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(390, 31, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(391, 31, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(392, 31, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(393, 31, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(394, 31, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(395, 31, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(396, 31, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(397, 31, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(398, 31, 13, 2177.03, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(399, 31, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(400, 31, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(401, 31, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(402, 32, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(403, 32, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(404, 32, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(405, 32, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(406, 32, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(407, 32, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(408, 32, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(409, 32, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(410, 32, 13, 1719.97, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(411, 32, 14, 3970.90, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(412, 32, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(413, 32, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(414, 33, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(415, 33, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(416, 33, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(417, 33, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(418, 33, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(419, 33, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(420, 33, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(421, 33, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(422, 33, 13, 1813.68, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(423, 33, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(424, 33, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(425, 33, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(426, 34, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(427, 34, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(428, 34, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(429, 34, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(430, 34, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(431, 34, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(432, 34, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(433, 34, 12, 500.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(434, 34, 13, 1719.97, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(435, 34, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(436, 34, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(437, 34, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(438, 35, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(439, 35, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(440, 35, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(441, 35, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(442, 35, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(443, 35, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(444, 35, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(445, 35, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(446, 35, 13, 1719.97, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(447, 35, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(448, 35, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(449, 35, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(450, 36, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(451, 36, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(452, 36, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(453, 36, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(454, 36, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(455, 36, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(456, 36, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(457, 36, 12, 1000.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(458, 36, 13, 1710.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(459, 36, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(460, 36, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(461, 36, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(462, 37, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(463, 37, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(464, 37, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(465, 37, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(466, 37, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(467, 37, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(468, 37, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(469, 37, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(470, 37, 13, 1719.97, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(471, 37, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(472, 37, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(473, 37, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(474, 38, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(475, 38, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(476, 38, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(477, 38, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(478, 38, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(479, 38, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(480, 38, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(481, 38, 12, 500.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(482, 38, 13, 1719.97, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(483, 38, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(484, 38, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(485, 38, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(486, 39, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(487, 39, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(488, 39, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(489, 39, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(490, 39, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(491, 39, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(492, 39, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(493, 39, 12, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(494, 39, 13, 2045.28, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(495, 39, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(496, 39, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(497, 39, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(498, 40, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(499, 40, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(500, 40, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(501, 40, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(502, 40, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(503, 40, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(504, 40, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(505, 40, 12, 1000.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(506, 40, 13, 1773.47, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(507, 40, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(508, 40, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(509, 40, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(510, 41, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(511, 41, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(512, 41, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(513, 41, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(514, 41, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(515, 41, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(516, 41, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(517, 41, 12, 1000.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(518, 41, 13, 1575.04, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(519, 41, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(520, 41, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(521, 41, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(522, 42, 1, 297.58, '2026-03-24 11:22:16', '2026-03-24 11:33:36'),
(523, 42, 3, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(524, 42, 4, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(525, 42, 5, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(526, 42, 6, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(527, 42, 10, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(528, 42, 11, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(529, 42, 12, 1500.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(530, 42, 13, 1808.99, '2026-03-24 11:22:16', '2026-03-24 11:40:19'),
(531, 42, 14, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(532, 42, 15, 0.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(533, 42, 7, 235.00, '2026-03-24 11:22:16', '2026-03-24 11:45:06'),
(534, 43, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(535, 43, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(536, 43, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(537, 43, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(538, 43, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(539, 43, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(540, 43, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(541, 43, 12, 800.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(542, 43, 13, 1765.95, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(543, 43, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(544, 43, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(545, 43, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(546, 44, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(547, 44, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(548, 44, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(549, 44, 5, 7856.06, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(550, 44, 6, 300.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(551, 44, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(552, 44, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(553, 44, 12, 400.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(554, 44, 13, 1868.14, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(555, 44, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(556, 44, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(557, 44, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(558, 45, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(559, 45, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(560, 45, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(561, 45, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(562, 45, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(563, 45, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(564, 45, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(565, 45, 12, 1500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(566, 45, 13, 1765.95, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(567, 45, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(568, 45, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(569, 45, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(570, 46, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(571, 46, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(572, 46, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(573, 46, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(574, 46, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(575, 46, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(576, 46, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(577, 46, 12, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(578, 46, 13, 1914.92, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(579, 46, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(580, 46, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(581, 46, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(582, 47, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(583, 47, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(584, 47, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(585, 47, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(586, 47, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(587, 47, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(588, 47, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(589, 47, 12, 300.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(590, 47, 13, 1816.34, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(591, 47, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(592, 47, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(593, 47, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(594, 48, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(595, 48, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(596, 48, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(597, 48, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(598, 48, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(599, 48, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(600, 48, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(601, 48, 12, 500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(602, 48, 13, 1998.16, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(603, 48, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(604, 48, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(605, 48, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(606, 49, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(607, 49, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(608, 49, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(609, 49, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(610, 49, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(611, 49, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(612, 49, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(613, 49, 12, 500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(614, 49, 13, 1823.67, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(615, 49, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(616, 49, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(617, 49, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(618, 50, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(619, 50, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(620, 50, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(621, 50, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(622, 50, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(623, 50, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(624, 50, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(625, 50, 12, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(626, 50, 13, 1808.99, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(627, 50, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(628, 50, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(629, 50, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(630, 51, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(631, 51, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(632, 51, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(633, 51, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(634, 51, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(635, 51, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(636, 51, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(637, 51, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(638, 51, 13, 1783.97, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(639, 51, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(640, 51, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(641, 51, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(642, 52, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(643, 52, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(644, 52, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(645, 52, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(646, 52, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(647, 52, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(648, 52, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(649, 52, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(650, 52, 13, 1707.81, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(651, 52, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(652, 52, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(653, 52, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(654, 53, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(655, 53, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(656, 53, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(657, 53, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(658, 53, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(659, 53, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(660, 53, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(661, 53, 12, 300.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(662, 53, 13, 1718.23, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(663, 53, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(664, 53, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(665, 53, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(666, 54, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(667, 54, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(668, 54, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(669, 54, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(670, 54, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(671, 54, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(672, 54, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(673, 54, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(674, 54, 13, 1919.13, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(675, 54, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(676, 54, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(677, 54, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(678, 55, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(679, 55, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(680, 55, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(681, 55, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(682, 55, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(683, 55, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(684, 55, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(685, 55, 12, 1500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(686, 55, 13, 1556.17, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(687, 55, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(688, 55, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(689, 55, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(690, 56, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(691, 56, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(692, 56, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(693, 56, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(694, 56, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(695, 56, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(696, 56, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(697, 56, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(698, 56, 13, 1861.41, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(699, 56, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(700, 56, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(701, 56, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(702, 57, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(703, 57, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(704, 57, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(705, 57, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(706, 57, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(707, 57, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(708, 57, 11, 1643.76, '2026-03-24 11:47:01', '2026-03-24 12:00:36'),
(709, 57, 12, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(710, 57, 13, 2072.59, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(711, 57, 14, 7496.51, '2026-03-24 11:47:01', '2026-03-24 12:01:21'),
(712, 57, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(713, 57, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(714, 58, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(715, 58, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(716, 58, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(717, 58, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(718, 58, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(719, 58, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(720, 58, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(721, 58, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(722, 58, 13, 1836.76, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(723, 58, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(724, 58, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(725, 58, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(726, 59, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(727, 59, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(728, 59, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(729, 59, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(730, 59, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(731, 59, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(732, 59, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(733, 59, 12, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(734, 59, 13, 1575.04, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(735, 59, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(736, 59, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(737, 59, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:12'),
(738, 60, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(739, 60, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(740, 60, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(741, 60, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(742, 60, 6, 600.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(743, 60, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(744, 60, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(745, 60, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(746, 60, 13, 2352.04, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(747, 60, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(748, 60, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(749, 60, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(750, 61, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(751, 61, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(752, 61, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(753, 61, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(754, 61, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(755, 61, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(756, 61, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(757, 61, 12, 2500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(758, 61, 13, 1700.69, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(759, 61, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(760, 61, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(761, 61, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(762, 62, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(763, 62, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(764, 62, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(765, 62, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(766, 62, 6, 500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(767, 62, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(768, 62, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(769, 62, 12, 1000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13');
INSERT INTO `payroll_detail_deductions` (`id`, `payroll_detail_id`, `deduction_type_id`, `amount`, `created_at`, `updated_at`) VALUES
(770, 62, 13, 2415.98, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(771, 62, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(772, 62, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(773, 62, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(774, 63, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(775, 63, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(776, 63, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(777, 63, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(778, 63, 6, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(779, 63, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(780, 63, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(781, 63, 12, 200.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(782, 63, 13, 1913.36, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(783, 63, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(784, 63, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(785, 63, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(786, 64, 1, 297.58, '2026-03-24 11:47:01', '2026-03-24 11:52:11'),
(787, 64, 3, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(788, 64, 4, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(789, 64, 5, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(790, 64, 6, 500.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(791, 64, 10, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(792, 64, 11, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(793, 64, 12, 3000.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(794, 64, 13, 2060.49, '2026-03-24 11:47:01', '2026-03-24 12:05:47'),
(795, 64, 14, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(796, 64, 15, 0.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13'),
(797, 64, 7, 235.00, '2026-03-24 11:47:01', '2026-03-24 12:08:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_levels`
--

CREATE TABLE `payroll_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payroll_levels`
--

INSERT INTO `payroll_levels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ADMINISTRACION Y APOYO', '2026-03-19 11:13:10', '2026-03-19 11:13:10'),
(2, 'PRE-BASICA', '2026-03-19 11:13:10', '2026-03-19 11:13:10'),
(3, 'BÁSICA', '2026-03-19 11:13:10', '2026-03-19 11:13:10'),
(4, 'SECUNDARIA', '2026-03-19 11:13:10', '2026-03-19 11:13:10'),
(5, 'Otro Personal', '2026-03-19 11:13:10', '2026-03-19 11:13:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2026-03-19 11:13:09', '2026-03-19 11:13:09'),
(2, 'Contadora', '2026-03-19 11:13:09', '2026-03-19 11:13:09'),
(3, 'Religiosa', '2026-03-19 11:13:09', '2026-03-19 11:13:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'institution_name', 'Instituto Sagrado Corazón (Liceo Hondureño)', '2026-03-19 11:13:10', '2026-03-20 00:10:01'),
(2, 'signature_religious', 'SOR ARGENTINA MEJIA GONZALEZ', '2026-03-19 11:13:10', '2026-03-20 00:10:01'),
(3, 'signature_accountant', 'ENA ELOISA AVILA R.', '2026-03-19 11:13:10', '2026-03-20 00:10:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@liceo.test', NULL, '$2y$12$9veY0xj6qnlnQs4Tuda3Z.Ma84.TS6pftAvlQjsf64bxRL8dW7dd2', 1, NULL, '2026-03-19 11:13:10', '2026-03-19 11:13:10'),
(2, 'Ena Eloisa Avila', 'enaavila@liceo.test', NULL, '$2y$12$4zvzQ2Fby2nH7qyqE/svuu5p9MOkx6sEuO5qPxhQlpjQWVEtlNWKe', 2, NULL, '2026-03-19 11:55:08', '2026-03-25 10:03:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `deduction_types`
--
ALTER TABLE `deduction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deduction_type_payroll_level`
--
ALTER TABLE `deduction_type_payroll_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deduction_type_payroll_level_deduction_type_id_foreign` (`deduction_type_id`),
  ADD KEY `deduction_type_payroll_level_payroll_level_id_foreign` (`payroll_level_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_employee_code_unique` (`employee_code`),
  ADD UNIQUE KEY `employees_dni_unique` (`dni`),
  ADD KEY `employees_level_id_foreign` (`level_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payrolls_month_year_level_id_unique` (`month`,`year`,`level_id`),
  ADD KEY `payrolls_level_id_foreign` (`level_id`),
  ADD KEY `payrolls_created_by_foreign` (`created_by`),
  ADD KEY `payrolls_reviewed_by_foreign` (`reviewed_by`),
  ADD KEY `payrolls_approved_by_foreign` (`approved_by`);

--
-- Indices de la tabla `payroll_details`
--
ALTER TABLE `payroll_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_details_payroll_id_foreign` (`payroll_id`),
  ADD KEY `payroll_details_employee_id_foreign` (`employee_id`);

--
-- Indices de la tabla `payroll_detail_deductions`
--
ALTER TABLE `payroll_detail_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_detail_deductions_payroll_detail_id_foreign` (`payroll_detail_id`),
  ADD KEY `payroll_detail_deductions_deduction_type_id_foreign` (`deduction_type_id`);

--
-- Indices de la tabla `payroll_levels`
--
ALTER TABLE `payroll_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_levels_name_unique` (`name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

--
-- AUTO_INCREMENT de la tabla `deduction_types`
--
ALTER TABLE `deduction_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `deduction_type_payroll_level`
--
ALTER TABLE `deduction_type_payroll_level`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payroll_details`
--
ALTER TABLE `payroll_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `payroll_detail_deductions`
--
ALTER TABLE `payroll_detail_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=798;

--
-- AUTO_INCREMENT de la tabla `payroll_levels`
--
ALTER TABLE `payroll_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `deduction_type_payroll_level`
--
ALTER TABLE `deduction_type_payroll_level`
  ADD CONSTRAINT `deduction_type_payroll_level_deduction_type_id_foreign` FOREIGN KEY (`deduction_type_id`) REFERENCES `deduction_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deduction_type_payroll_level_payroll_level_id_foreign` FOREIGN KEY (`payroll_level_id`) REFERENCES `payroll_levels` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `payroll_levels` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payrolls_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payrolls_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `payroll_levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payrolls_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `payroll_details`
--
ALTER TABLE `payroll_details`
  ADD CONSTRAINT `payroll_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payroll_details_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payroll_detail_deductions`
--
ALTER TABLE `payroll_detail_deductions`
  ADD CONSTRAINT `payroll_detail_deductions_deduction_type_id_foreign` FOREIGN KEY (`deduction_type_id`) REFERENCES `deduction_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payroll_detail_deductions_payroll_detail_id_foreign` FOREIGN KEY (`payroll_detail_id`) REFERENCES `payroll_details` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
