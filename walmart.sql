SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `walmart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`, `nombre`, `direccion`, `numero`, `edad`) VALUES
(1, 'Sorina', 'Puebla', 11, 0),
(2, 'Abarotero', 'Durango', 12, 0),
(3, 'Aurrera', 'Monterrey', 15, 0),
(4, 'Samborns', 'Veracruz', 14, 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detallesprecios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detallesprecios` (
`producto_nombre` char(40)
,`precio` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalles_precios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalles_precios` (
`producto_nombre` char(40)
,`precio` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalles_preciosbajos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalles_preciosbajos` (
`producto_nombre` char(40)
,`precio` float
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `EnvioID` int(11) NOT NULL,
  `EnvioNumero` int(11) NOT NULL,
  `EnviosID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`EnvioID`, `EnvioNumero`, `EnviosID`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `OrdenID` int(11) NOT NULL,
  `OrdenNumero` int(11) NOT NULL,
  `ordenfecha` datetime NOT NULL DEFAULT current_timestamp(),
  `clienteID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`OrdenID`, `OrdenNumero`, `ordenfecha`, `clienteID`) VALUES
(0, 4, '2022-05-27 18:21:02', 1),
(1, 1, '2022-05-02 18:18:48', 1),
(2, 2, '2022-05-10 18:18:58', 2),
(3, 3, '2022-05-27 18:19:08', 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `otra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `otra` (
`producto_nombre` char(40)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `ID_persona` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `edad` int(11) NOT NULL CHECK (`edad` >= 18),
  `ciudad` varchar(255) DEFAULT NULL,
  `salario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`ID_persona`, `nombre`, `edad`, `ciudad`, `salario`) VALUES
(1, 'Carlos Lopez Huh', 19, 'CDMX', 4500),
(2, 'Carla Lopez Ramirez', 19, 'CDMX', 4500),
(3, 'Maria Sanchez Ovidio', 18, 'NL', 4200),
(4, 'Omar Sanchez Ovidio', 22, 'NL', 4200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `producto_nombre` char(40) NOT NULL,
  `cantidad` char(20) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `marca` int(80) NOT NULL,
  `categoria_id` varchar(200) NOT NULL,
  `rastreo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `producto_nombre`, `cantidad`, `precio`, `marca`, `categoria_id`, `rastreo`) VALUES
(1, 'pantalon', '20', 1200, 0, 'caballeros', 0),
(2, 'blusa', '50', 1000, 0, 'damas', 0),
(3, 'pijama', '20', 900, 0, 'caballeros', 0),
(4, 'zapatos', '60', 1510, 0, 'caballeros', 0),
(5, 'zapatillas', '50', 1250, 0, 'damas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `IDsucursal` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`IDsucursal`, `name`, `direccion`) VALUES
(1, 'Roma', 'Acapulco 23'),
(2, 'Roma', 'Acapulco 23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `creado` bigint(20) DEFAULT current_timestamp(),
  `actulizado` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `creado`, `actulizado`, `nombre`, `correo`, `image`) VALUES
(1, 20220530, 20220530, 'Armando', '', 'https://gravatar.com/avatar/8ff56ed0f8edcddd0ff979b499b63a4e');

-- --------------------------------------------------------

--
-- Estructura para la vista `detallesprecios`
--
DROP TABLE IF EXISTS `detallesprecios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detallesprecios`  AS SELECT `productos`.`producto_nombre` AS `producto_nombre`, `productos`.`precio` AS `precio` FROM `productos` WHERE `productos`.`precio` > (select min(`productos`.`precio`) from `productos`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalles_precios`
--
DROP TABLE IF EXISTS `detalles_precios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalles_precios`  AS SELECT `productos`.`producto_nombre` AS `producto_nombre`, `productos`.`precio` AS `precio` FROM `productos` WHERE `productos`.`precio` > (select avg(`productos`.`precio`) from `productos`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalles_preciosbajos`
--
DROP TABLE IF EXISTS `detalles_preciosbajos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalles_preciosbajos`  AS SELECT `productos`.`producto_nombre` AS `producto_nombre`, `productos`.`precio` AS `precio` FROM `productos` WHERE `productos`.`precio` > (select min(`productos`.`precio`) from `productos`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `otra`
--
DROP TABLE IF EXISTS `otra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `otra`  AS SELECT `productos`.`producto_nombre` AS `producto_nombre` FROM `productos` WHERE `productos`.`precio` > (select max(`productos`.`precio`) from `productos`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`EnvioID`),
  ADD KEY `EnviosID` (`EnviosID`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`OrdenID`),
  ADD KEY `clienteID` (`clienteID`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`ID_persona`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD UNIQUE KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`IDsucursal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `ID_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `IDsucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`EnviosID`) REFERENCES `clientes` (`ID`),
  ADD CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`EnviosID`) REFERENCES `ordenes` (`OrdenID`);

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
