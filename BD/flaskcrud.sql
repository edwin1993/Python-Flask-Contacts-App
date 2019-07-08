-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2019 a las 19:38:49
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flaskcrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) COLLATE utf8_bin NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `fullname`, `phone`, `email`) VALUES
(7, 'Edwin Avila', 2147483647, 'edwinapol12@hotmail.com'),
(8, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(9, 'Edwin ', 2147483647, 'andres123@gmail.com'),
(10, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(11, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(12, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(13, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(14, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(15, 'Edwin ', 2147483647, 'edwin@gmail.com'),
(16, 'Edwin ', 2147483647, 'edwin@gmail.com'),
(17, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(18, 'Edwin ', 2147483647, 'edwin@gmail.com'),
(19, 'Edwin ', 2147483647, 'edwin@gmail.com'),
(20, 'Edwin Avila', 2147483647, 'andres123@gmail.com'),
(21, 'Edwin Avila', 2147483647, 'edwin@gmail.com'),
(22, 'Edwin Avila', 2147483647, 'edwin@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
