-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2021 a las 21:29:42
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`) VALUES
(31, 'Notebooks'),
(36, 'Discos Rígidos'),
(37, 'Discos SSD'),
(39, 'Fuentes de Alimentación'),
(41, 'Gamers'),
(46, 'Monitores'),
(48, 'Mouses'),
(51, 'Teclados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `sku` varchar(20) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `sku`, `descripcion`, `precio`, `stock`) VALUES
(22, 31, '41356', 'Notebook LENOVO 14\' S340', 82875, 8),
(23, 31, '15680', 'Notebook ENOVA Intel Celeron n3350', 37999, 3),
(24, 31, '25810', 'Notebook EXO C19 N3350', 38500, 4),
(25, 31, '26300', 'Notebook HP 348 G7', 83999, 7),
(26, 31, '15898', 'Notebook ASUS N4020', 51000, 5),
(27, 36, '8388', 'HD SEAGATE External 1TB USB 3.0 BACK UP PLUS ULTRA', 8695, 6),
(28, 36, '4522', 'HD SEAGATE External 2TB USB 3.0 BACK UP PLUS SLIM ', 11565, 3),
(29, 36, '9333', 'HD SEAGATE External 2TB USB 3.0 GAME DRIVE para PS', 12175, 7),
(30, 36, '7477', 'HD SEAGATE External 4TB USB 3.0 Expansion Black', 14157, 5),
(31, 36, '55332', 'ESN HD WD Element Externo 1TB USB 3.0', 6485, 6),
(32, 36, '8388', 'HD Toshiba 4TB N300 NAS SATA III', 20614, 7),
(33, 36, '8322', 'HD SEAGATE 4TB SATA III 64Mb Barracuda', 14490, 2),
(34, 36, '83578', 'HD SEAGATE 1 TB SATA III SkyHawk', 6980, 4),
(35, 37, '18839', 'GP-GSTFS31480GNTDDisco SSD GIGABYTE 480GB SATA Int', 7460, 4),
(36, 37, '38890', 'Disco SSD KINGSTON A400 960 GB SATA Interno 7 mm', 14107, 5),
(37, 37, '12799', 'Disco SSD Markvision 490GB Sata Interno BULK', 7320, 6),
(38, 37, '7399', 'Disco SSD Corsair 1TB MP400 M.2 PCIe NVMe Gen3 x4', 19431, 6),
(39, 37, '9388', 'Disco SSD GIGABYTE 500GB M.2 x4 AORUS Gen4', 14136, 8),
(40, 37, '48983', 'Disco SSD KINGSTON SNVS 1000GB M.2 NVMe PCIe', 14273, 4),
(41, 37, '1289', 'Disco SSD M.2 KINGSTON A400 480 GB (3506)', 9221, 8),
(42, 39, '4789', 'Fuente AZZA 650W Bronze 80 Plus', 5976, 4),
(43, 39, '89832', 'Fuente Corsair CV550 550W 80 Plus Bronze', 7113, 8),
(44, 39, '7873', 'Fuente Gigabyte 550W 80 plus Bronze', 7313, 10),
(45, 39, '78298', 'Fuente Thermaltake Smart 500W White 80 Plus', 5662, 7),
(46, 41, '24566', 'Auricular Corsair HS60 PRO Surround Black/Yellow', 11105, 6),
(47, 41, '9378', 'Auricular Corsair Virtuoso Wireless RGB HiFi Gamin', 29267, 4),
(48, 41, '8332', 'Accesorio p/Microfono Elgato Wave Pop Filter', 5100, 3),
(49, 41, '64332', 'Auriculares Gigabyte Aorus H1 Virtual 7.1 Surround', 9200, 5),
(50, 41, '8277', 'Auricular GX/Genius HS-G710V Gaming Black', 4647, 2),
(51, 41, '8366', 'Auricular Lenovo Legion headset H500 Pro 7.1', 10425, 5),
(52, 41, '13564', 'Microfono Blue/Logitech Yeti Profesional USB ', 23640, 4),
(53, 41, '3866', 'Mouse Corsair Gaming KATAR PRO Wireless', 5028, 6),
(54, 41, '56223', 'Mouse GX/Genius Scorpion M6-400 Gaming', 3687, 9),
(55, 41, '7388', 'Teclado Gigabyte Aorus K9 Mecanico RGB Red', 16628, 2),
(56, 41, '42556', 'Teclado Logitech G413 Mechanical Carbon', 10145, 4),
(57, 41, '5266', 'Teclado TT eSports Neptune Pro', 9544, 6),
(58, 46, '56323', 'Monitor LG 27´27QN880-B QHD', 78600, 3),
(59, 46, '89329', 'Monitor LG 16:9 27´ 27UL500-W 4K', 58156, 2),
(60, 46, '57899', 'Monitor LG LCD 22 22BK55WY-B WIDE', 21819, 1),
(61, 48, '56789', 'Mouse Genius NX 7010 BlueEye White/Blue', 1056, 4),
(62, 48, '25566', 'Mouse Lenovo Wireless 600 plateado silencioso', 1562, 3),
(63, 48, '6732', 'Mouse Logitech Wir M280 Grey', 1280, 3),
(64, 51, '8299', 'Teclado Genius KB-118 Black USB SP CB', 729, 2),
(65, 51, '83467', 'Teclado Logitech Wireless K780 Grey', 7086, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`) VALUES
(1, 'juanclaudio@gmail.com', '$2y$10$ZdIctmZ/9y32AtGIBXc9D.KwHfXB4yM3zf0202WdT1hu0C.L2Vmj2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
