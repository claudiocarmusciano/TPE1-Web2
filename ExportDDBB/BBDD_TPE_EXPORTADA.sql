-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-11-2021 a las 14:14:38
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

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
(31, 'Notebook'),
(36, 'Discos Rígidos'),
(37, 'Discos SSD'),
(39, 'Fuentes de Alimentación'),
(41, 'Gamers'),
(46, 'Monitores'),
(48, 'Mouses'),
(51, 'Teclados'),
(52, 'Varios auxiliar'),
(53, 'Categoria 21-11-21'),
(54, 'nueva cat'),
(55, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `puntuacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_producto`, `comentario`, `puntuacion`) VALUES
(5, 23, 'comentario 23', 3),
(6, 33, 'comentario 33', 4),
(7, 34, 'comentario 34', 4),
(15, 22, 'erwqrwqrwe', 5),
(17, 23, 'mas o menos', 2),
(18, 23, 'buen producto', 3),
(21, 22, 'comentario feriado', 2),
(22, 23, 'comentario feriado 2', 3),
(24, 23, 'coment prod 23', 3),
(25, 23, 'coment prod 23 bis', 1),
(26, 22, 'coment prod 22', 2),
(27, 29, 'coemnt nuevo', 1),
(28, 33, 'coment nuevo', 1),
(29, 33, 'aaaaaaaaa', 4),
(31, 22, 'qqqqqq', 1),
(34, 22, 'wwww22', 1),
(35, 27, 'qqq27', 1),
(40, 22, '123123123123', 1),
(41, 22, 'mnbmnbv', 1),
(42, 26, 'nuevo 2', 1),
(43, 22, 'dsfasfsadf', 3),
(46, 89, '55555', 5),
(47, 91, 'werwrwer', 1);

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
  `stock` int(11) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `sku`, `descripcion`, `precio`, `stock`, `imagen`) VALUES
(22, 31, '41356', 'Notebook LENOVO 14\' S340 MODIFICADO', 800, 8, 'imgs/articles/619ee968d2cae.png'),
(23, 31, '1568', 'Notebook ENOVA Intel Celeron n3350', 37999, 3, 'imgs/articles/619ed55f02161.jpg'),
(26, 31, '15', 'Notebook ASUS N4020 xxx', 51000, 5, NULL),
(27, 36, '8388', 'HD SEAGATE External 1TB USB 3.0 BACK UP PLUS ULTRA', 8695, 6, 'imgs/articles/619ed5a6b8bc0.jpg'),
(28, 36, '4522', 'HD SEAGATE External 2TB USB 3.0 BACK UP PLUS SLIM ', 11565, 3, 'imgs/articles/619ed884540f5.jpg'),
(29, 36, '9333', 'HD SEAGATE External 2TB USB 3.0 GAME DRIVE para PS', 12175, 7, 'imgs/articles/619edce252a98.png'),
(30, 36, '7477', 'HD SEAGATE External 4TB USB 3.0 Expansion Black', 14157, 5, 'imgs/articles/619edd4e11253.png'),
(31, 36, '55332', 'ESN HD WD Element Externo 1TB USB 3.0', 6485, 6, 'imgs/articles/619edd5ea4db1.png'),
(32, 36, '8388', 'HD Toshiba 4TB N300 NAS SATA III', 20614, 7, NULL),
(33, 36, '8322', 'HD SEAGATE 4TB SATA III 64Mb Barracuda', 6700, 2, NULL),
(34, 36, '83578', 'HD SEAGATE 1 TB SATA III SkyHawk', 6980, 4, NULL),
(35, 37, '18839', 'GP-GSTFS31480GNTDDisco SSD GIGABYTE 480GB SATA Int', 7460, 4, NULL),
(36, 37, '38890', 'Disco SSD KINGSTON A400 960 GB SATA Interno 7 mm', 14107, 5, NULL),
(37, 37, '12799', 'Disco SSD Markvision 490GB Sata Interno BULK', 7320, 6, NULL),
(38, 37, '7399', 'Disco SSD Corsair 1TB MP400 M.2 PCIe NVMe Gen3 x4', 19431, 6, NULL),
(39, 37, '9388', 'Disco SSD GIGABYTE 500GB M.2 x4 AORUS Gen4', 14136, 8, NULL),
(40, 37, '48983', 'Disco SSD KINGSTON SNVS 1000GB M.2 NVMe PCIe', 14273, 4, NULL),
(41, 37, '1289', 'Disco SSD M.2 KINGSTON A400 480 GB (3506)', 9221, 8, NULL),
(42, 39, '4789', 'Fuente AZZA 650W Bronze 80 Plus', 5976, 4, NULL),
(43, 39, '89832', 'Fuente Corsair CV550 550W 80 Plus Bronze', 7113, 8, NULL),
(44, 39, '7873', 'Fuente Gigabyte 550W 80 plus Bronze', 7313, 10, NULL),
(45, 39, '78298', 'Fuente Thermaltake Smart 500W White 80 Plus', 5662, 7, NULL),
(46, 41, '24566', 'Auricular Corsair HS60 PRO Surround Black/Yellow', 11105, 6, NULL),
(47, 41, '9378', 'Auricular Corsair Virtuoso Wireless RGB HiFi Gamin', 29267, 4, NULL),
(48, 41, '8332', 'Accesorio p/Microfono Elgato Wave Pop Filter', 5100, 3, NULL),
(49, 41, '64332', 'Auriculares Gigabyte Aorus H1 Virtual 7.1 Surround', 9200, 5, NULL),
(50, 41, '8277', 'Auricular GX/Genius HS-G710V Gaming Black', 4647, 2, NULL),
(51, 41, '8366', 'Auricular Lenovo Legion headset H500 Pro 7.1', 10425, 5, NULL),
(52, 41, '13564', 'Microfono Blue/Logitech Yeti Profesional USB ', 23640, 4, NULL),
(53, 41, '3866', 'Mouse Corsair Gaming KATAR PRO Wireless', 5028, 6, NULL),
(54, 41, '56223', 'Mouse GX/Genius Scorpion M6-400 Gaming', 3687, 9, NULL),
(55, 41, '7388', 'Teclado Gigabyte Aorus K9 Mecanico RGB Red', 16628, 2, NULL),
(56, 41, '42556', 'Teclado Logitech G413 Mechanical Carbon', 10145, 4, NULL),
(57, 41, '5266', 'Teclado TT eSports Neptune Pro', 9544, 6, NULL),
(58, 46, '56323', 'Monitor LG 27´27QN880-B QHD', 78600, 3, NULL),
(59, 46, '89329', 'Monitor LG 16:9 27´ 27UL500-W 4K', 58156, 2, NULL),
(60, 46, '57899', 'Monitor LG LCD 22 22BK55WY-B WIDE', 21819, 1, NULL),
(61, 48, '56789', 'Mouse Genius NX 7010 BlueEye White/Blue', 1056, 4, NULL),
(62, 48, '25566', 'Mouse Lenovo Wireless 600 plateado silencioso', 1562, 3, NULL),
(63, 48, '6732', 'Mouse Logitech Wir M280 Grey', 1280, 3, NULL),
(64, 51, '8299', 'Teclado Genius KB-118 Black USB SP CB', 729, 2, NULL),
(65, 51, '83467', 'Teclado Logitech Wireless K780 Grey', 7086, 3, NULL),
(86, 31, '2', '2', 2, 2, 'imgs/articles/619eb300990e9.jpg'),
(89, 31, '5', '5', 5, 5, 'imgs/articles/619eb8d675dea.jpg'),
(90, 31, '6', '6', 6, 6, 'imgs/articles/619e6fc82e47b.jpg'),
(91, 31, '7', '7', 7, 7, 'imgs/articles/619ea2c8cb2e4.jpg'),
(92, 31, '23524', '234231412342134', 234, 23, 'imgs/articles/619eac5b09064.jpg'),
(93, 41, '1234567890', 'nuevo producto de prueba', 123456, 12, 'imgs/articles/619ed8977be73.jpg'),
(95, 31, '3', '3', 3, 3, 'imgs/articles/619ed5789ea2b.jpg'),
(96, 31, '4', '4', 4, 4, 'imgs/articles/619ed779669de.jpg'),
(97, 31, '1', '1', 1, 1, 'imgs/articles/619ede201c7b6.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `rol` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`, `rol`) VALUES
(13, 'admin@gmail.com', '$2a$12$R2P0P5MkpWECfbCuC6WcA.aL4vUMWzOljas9Axa8ire4yEhjPZNWa', 'A'),
(15, 'claudio@gmail.com', '$2y$10$dBWQaAlmS8Q0fBAlYXJ6iOXgmTAEbWe7rlzllu.2Vk1fBAoW8RdE6', 'N'),
(16, 'juan@gmail.com', '$2y$10$vdWHlaHz4yVyoQumlFEzBegf9Rr3ZmXlJEmU0WIcfQFKJ47bltYje', 'N'),
(17, 'lucas@gmail.com', '$2y$10$08QbXoSkQnOqxHFPXAw4YuLQxbXjBKupmhy6rWfB0AuKQkCZgv9va', 'N');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
