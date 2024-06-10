-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2024 a las 21:21:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `retos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_reto`
--

CREATE TABLE `asignacion_reto` (
  `Id_reto` int(11) NOT NULL,
  `Id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- RELACIONES PARA LA TABLA `asignacion_reto`:
--   `Id_reto`
--       `reto` -> `Id_reto`
--   `Id_equipo`
--       `equipo` -> `Id_equipo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `Id_equipo` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `No_equipo` int(3) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- RELACIONES PARA LA TABLA `equipo`:
--   `Id_usuario`
--       `usuario` -> `Id_usuario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre`
--

CREATE TABLE `nombre` (
  `Id_nombre` int(11) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Apellido_paterno` varchar(15) NOT NULL,
  `Apellido_materno` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- RELACIONES PARA LA TABLA `nombre`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reto`
--

CREATE TABLE `reto` (
  `Id_reto` int(11) NOT NULL,
  `Nombre_empresa` varchar(50) NOT NULL,
  `Giro_empresa` text NOT NULL,
  `Descripcion_empresa` text NOT NULL,
  `Problematica` text NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- RELACIONES PARA LA TABLA `reto`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `Id_nombre` int(11) NOT NULL,
  `No_cuenta` int(8) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Facultad` varchar(60) DEFAULT NULL,
  `Contrasena` varchar(30) NOT NULL,
  `Rol` bit(1) NOT NULL DEFAULT b'0',
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- RELACIONES PARA LA TABLA `usuario`:
--   `Id_nombre`
--       `nombre` -> `Id_nombre`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_reto`
--
ALTER TABLE `asignacion_reto`
  ADD KEY `Id_reto` (`Id_reto`),
  ADD KEY `Id_equipo` (`Id_equipo`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`Id_equipo`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indices de la tabla `nombre`
--
ALTER TABLE `nombre`
  ADD PRIMARY KEY (`Id_nombre`);

--
-- Indices de la tabla `reto`
--
ALTER TABLE `reto`
  ADD PRIMARY KEY (`Id_reto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `Id_nombre` (`Id_nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `Id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nombre`
--
ALTER TABLE `nombre`
  MODIFY `Id_nombre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reto`
--
ALTER TABLE `reto`
  MODIFY `Id_reto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_reto`
--
ALTER TABLE `asignacion_reto`
  ADD CONSTRAINT `asignacion_reto_ibfk_1` FOREIGN KEY (`Id_reto`) REFERENCES `reto` (`Id_reto`),
  ADD CONSTRAINT `asignacion_reto_ibfk_2` FOREIGN KEY (`Id_equipo`) REFERENCES `equipo` (`Id_equipo`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`Id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_nombre`) REFERENCES `nombre` (`Id_nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
