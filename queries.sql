-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-06-2020 a las 09:40:11
-- Versión del servidor: 8.0.13-4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pq62kb3Ld3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order-products`
--

CREATE TABLE `order-products` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(32) DEFAULT NULL,
  `pay_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `status`, `price`, `pay_method`, `productId`, `createdAt`, `updatedAt`, `userId`) VALUES
(1, 'Pending', 300, 'cash', 1, '2020-06-18 03:17:02', '2020-06-18 03:17:02', 2),
(2, 'Pending', 500, 'cash', 2, '2020-06-18 03:17:02', '2020-06-18 03:17:02', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `createdAt`, `updatedAt`) VALUES
(1, 'Lomo Pizza', 300, 1, '2020-06-18 03:17:02', '2020-06-18 03:17:02'),
(2, 'Burger Queen', 500, 1, '2020-06-18 03:17:02', '2020-06-18 03:17:02'),
(3, 'Tomacco', 800, 1, '2020-06-18 03:17:02', '2020-06-18 03:17:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `lastname`, `email`, `phone`, `direction`, `password`, `admin`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'root', 'babe', 'admin@baberoot.com', '351235', 'holliwood 123', '$2a$08$ei028L/RVtb3oJJQMb.9eeudc1nW9r4mixR0.BO1tNWmLPHWOtj.y', 123123, '2020-06-18 03:17:02', '2020-06-18 03:17:02'),
(2, '2JohnDoe', '2John', '2Doe', '2JohnDoe@baberoot.com', '364235', 'holliwood 123', '$2a$08$bfjiKMcGnjL7pE9WdiJZDe1fj61WDFGbYTKTaz9g6fA40PNg/frx.', NULL, '2020-06-18 03:17:02', '2020-06-18 03:17:02'),
(3, 'JohnDoe', 'John', 'Doe', 'JohnDoe@baberoot.com', '354235', 'holliwood 123', '$2a$08$y9hvr9fdtJd4YAbO1YqYr.mz.JZGRL257L8UPkweYQyW/aPSO74IS', NULL, '2020-06-18 03:17:02', '2020-06-18 03:17:02'),
(4, 'johndoe2', 'john2', 'doe2', 'johndo2e@user.com', '351235', 'holliwood 123', '$2a$08$7vtyneM56hskLGWcUAz7guqBk161PSsbtXaK4.ZwRcBJQxi4.3Xsy', 0, '2020-06-18 03:18:19', '2020-06-18 03:18:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `order-products`
--
ALTER TABLE `order-products`
  ADD PRIMARY KEY (`productId`,`orderId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `order-products`
--
ALTER TABLE `order-products`
  ADD CONSTRAINT `order-products_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order-products_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
