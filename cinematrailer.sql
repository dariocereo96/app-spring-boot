-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2022 a las 17:05:54
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
-- Base de datos: `cinematrailer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL COMMENT 'id',
  `sex_id` int(11) DEFAULT NULL COMMENT 'Sexo',
  `act_nombre` varchar(60) NOT NULL COMMENT 'Nombre',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Apellidos y nombre de los actores';

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`id`, `sex_id`, `act_nombre`, `updated_at`, `created_at`) VALUES
(3, 4, 'Angelina Jolie', '2022-06-24 05:32:22', '2022-06-24 00:32:22'),
(4, 3, 'Davinson Sanchez', '2022-06-24 05:32:31', '2022-06-24 05:32:31'),
(5, 4, 'Marilin Manson', '2022-06-24 09:00:13', '2022-06-24 09:00:13'),
(6, 3, 'Sylvester Stallone', '2022-06-24 09:01:38', '2022-06-24 09:01:38'),
(7, 3, 'Jonny Deph', '2022-06-24 09:02:52', '2022-06-24 09:02:52'),
(8, 4, 'Linda Hamilton', '2022-06-24 09:03:40', '2022-06-24 09:03:40'),
(13, 3, 'Pits Sparrow', '2022-06-24 19:08:37', '2022-06-24 19:08:37'),
(14, 3, 'Jacki Chan', '2022-06-24 19:09:02', '2022-06-24 19:09:02'),
(15, 3, 'Dolph Zigler', '2022-06-24 19:09:21', '2022-06-24 19:09:21'),
(16, 4, 'Antonia Slow', '2022-06-24 19:09:42', '2022-06-24 19:09:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor_pelicula`
--

CREATE TABLE `actor_pelicula` (
  `id` int(11) NOT NULL COMMENT 'id',
  `act_id` int(11) DEFAULT NULL COMMENT 'Actor',
  `pel_id` int(11) DEFAULT NULL COMMENT 'Película',
  `apl_papel` varchar(60) NOT NULL COMMENT 'Papel',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de Papel en la Pelicula Actor Principal-&#';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id` int(11) NOT NULL COMMENT 'id',
  `soc_id` int(11) DEFAULT NULL COMMENT 'Socio',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Usuario',
  `alq_fecha_desde` date NOT NULL COMMENT 'Fecha Inicial',
  `alq_valor` decimal(10,2) NOT NULL COMMENT 'Valor',
  `alq_fecha_entrega` date DEFAULT NULL COMMENT 'Fecha Entrega',
  `pelicula_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos de Alquiler de la Pelicula al Socio';

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id`, `soc_id`, `user_id`, `alq_fecha_desde`, `alq_valor`, `alq_fecha_entrega`, `pelicula_id`) VALUES
(12, NULL, 7, '2022-08-17', '12.00', '2022-09-30', 21),
(13, NULL, 7, '2022-08-17', '2.00', '2022-08-26', 18),
(14, NULL, 7, '2022-08-17', '4.00', '2022-08-25', 28),
(15, NULL, 7, '2022-08-17', '2.00', '2022-08-18', 29),
(19, NULL, 21, '2022-08-17', '12.00', '2022-08-18', 19),
(20, NULL, 18, '2022-08-17', '12.00', '2022-08-30', 20),
(21, NULL, 14, '2022-08-17', '2.00', '2022-08-23', 29),
(22, NULL, 8, '2022-08-17', '2.00', '2022-08-18', 18),
(24, NULL, 18, '2022-08-17', '15.00', '2022-08-18', 24),
(25, NULL, 16, '2022-08-17', '2.00', '2022-08-18', 18),
(26, NULL, 17, '2022-08-17', '2.00', '2022-08-17', 18),
(28, NULL, 18, '2022-08-17', '2.00', '2022-11-24', 18),
(34, NULL, 8, '2022-08-17', '8.00', '2022-11-17', 17),
(35, NULL, 22, '2022-08-17', '2.00', '2022-08-31', 18),
(36, NULL, 23, '2022-08-17', '8.00', '2022-10-17', 17),
(37, NULL, 23, '2022-08-17', '2.00', '2022-08-25', 18),
(38, NULL, 24, '2022-08-17', '2.00', '2022-12-22', 18),
(39, NULL, 24, '2022-08-17', '7.00', '2022-10-20', 27),
(40, NULL, 25, '2022-08-17', '7.00', '2023-01-26', 27),
(41, NULL, 26, '2022-08-17', '7.00', '2022-12-22', 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL COMMENT 'Id',
  `dir_nombre` varchar(60) NOT NULL COMMENT 'Nombre',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Nombre del director de la pelicula';

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`id`, `dir_nombre`, `updated_at`, `created_at`) VALUES
(2, 'Eugenio Derbez', '2022-06-24 08:56:40', '2022-06-24 03:56:40'),
(3, 'Dwayne Johnson', '2022-06-24 08:55:52', '2022-06-24 03:55:52'),
(4, 'Antonio Baptista', '2022-06-24 18:45:50', '2022-06-24 18:45:50'),
(5, 'Pandora Steph', '2022-06-24 18:49:14', '2022-06-24 18:49:14'),
(6, 'Peter Parket', '2022-06-24 18:49:27', '2022-06-24 18:49:27'),
(7, 'Mary Jany', '2022-06-24 18:49:38', '2022-06-24 18:49:38'),
(8, 'Vin Diesel', '2022-06-24 18:49:54', '2022-06-24 18:49:54'),
(9, 'Sam Raimy', '2022-06-24 19:15:46', '2022-06-24 19:15:46'),
(10, 'Random Jein', '2022-06-24 19:20:36', '2022-06-24 19:20:36'),
(11, 'La Roca', '2022-06-24 19:20:46', '2022-06-24 19:20:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato`
--

CREATE TABLE `formato` (
  `id` int(11) NOT NULL COMMENT 'Id',
  `for_nombre` varchar(60) NOT NULL COMMENT 'Nombre',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CD DVD VHS';

--
-- Volcado de datos para la tabla `formato`
--

INSERT INTO `formato` (`id`, `for_nombre`, `updated_at`, `created_at`) VALUES
(1, 'mp4', '2022-06-05 18:52:10', '2022-06-05 18:52:10'),
(2, 'mov', '2022-06-05 18:52:33', '2022-06-05 18:52:33'),
(3, 'avi', '2022-06-05 18:52:47', '2022-06-05 18:52:47'),
(4, 'mp3', '2022-06-24 09:43:15', '2022-06-24 09:43:15'),
(5, 'AVI ', '2022-06-24 09:44:36', '2022-06-24 09:44:36'),
(6, 'MOV', '2022-06-24 09:45:15', '2022-06-24 09:45:15'),
(7, 'FLV', '2022-06-24 09:46:21', '2022-06-24 09:46:21'),
(8, 'RM', '2022-06-24 09:46:36', '2022-06-24 09:46:36'),
(9, 'FLAC', '2022-06-24 09:47:07', '2022-06-24 09:47:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL COMMENT 'Id',
  `gen_nombre` varchar(60) NOT NULL COMMENT 'Nombre',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idgenero` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Romantica Comico Ciencia Ficcion Deportes';

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `gen_nombre`, `updated_at`, `created_at`, `idgenero`, `titulo`) VALUES
(1, 'Terror', '2022-08-13 21:11:20', '2022-08-13 21:11:20', 0, 'Terror'),
(2, 'Accion', '2022-08-13 21:11:25', '2022-08-13 21:11:25', 0, 'Accion'),
(3, 'Fantasia', '2022-08-13 21:11:29', '2022-08-13 21:11:29', 0, 'Fantasia'),
(4, 'Comedia', '2022-08-13 21:11:35', '2022-08-13 21:11:35', 0, 'Comedia'),
(9, 'Drama', '2022-08-13 21:11:58', '2022-08-13 21:11:58', 0, 'Drama'),
(11, 'Chistes', '2022-08-13 21:12:02', '2022-08-13 21:12:02', 0, 'Chistes'),
(12, 'Anime', '2022-08-13 21:12:06', '2022-08-13 21:12:06', 0, 'Anime'),
(16, 'Amor', '2022-08-13 21:12:11', '2022-08-13 21:12:11', 0, 'Amor'),
(17, 'Increible', '2022-08-13 21:12:15', '2022-08-13 21:12:15', 0, 'Increible'),
(18, 'Vida', '2022-08-17 03:05:58', '2022-08-17 03:06:00', 0, 'Vida'),
(19, 'Guerra', '2022-08-17 03:06:40', '2022-08-17 03:06:38', 0, 'Guerra'),
(20, 'Ciencia Ficcion', '2022-08-17 03:07:33', '2022-08-17 03:07:33', 0, 'Ciencia Ficcion'),
(21, 'Documental', '2022-08-17 03:07:19', '2022-08-17 03:07:20', 0, 'Documental');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generopelicula`
--

CREATE TABLE `generopelicula` (
  `idpelicula` int(11) NOT NULL,
  `idgenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `generopelicula`
--

INSERT INTO `generopelicula` (`idpelicula`, `idgenero`) VALUES
(12, 16),
(12, 12),
(12, 11),
(12, 3),
(14, 16),
(14, 9),
(14, 18),
(15, 20),
(15, 9),
(15, 19),
(15, 17),
(17, 16),
(17, 20),
(17, 19),
(17, 17),
(18, 12),
(18, 20),
(18, 4),
(18, 3),
(18, 18),
(19, 12),
(19, 20),
(19, 4),
(19, 3),
(19, 17),
(20, 16),
(20, 9),
(20, 18),
(21, 12),
(24, 12),
(24, 20),
(24, 4),
(24, 3),
(25, 9),
(25, 18),
(26, 20),
(26, 17),
(26, 1),
(27, 20),
(27, 3),
(27, 1),
(13, 2),
(13, 20),
(13, 9),
(13, 18),
(28, 3),
(28, 1),
(29, 16),
(29, 9),
(29, 18),
(22, 2),
(22, 20),
(22, 9),
(22, 3),
(22, 17),
(16, 16),
(16, 20),
(16, 9),
(16, 3),
(16, 17),
(30, 2),
(30, 20),
(30, 9),
(30, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `fecha_estreno` date DEFAULT NULL,
  `pel_costo` double NOT NULL,
  `ruta_portada` varchar(255) DEFAULT NULL,
  `sinopsis` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `youtube_trailer_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `fecha_estreno`, `pel_costo`, `ruta_portada`, `sinopsis`, `titulo`, `youtube_trailer_id`) VALUES
(12, '1998-07-16', 2, 'all-disney-movie-posters-49.jpg', 'El ejército de los Hunos, encabezado por el malvado Shun Yiu, quiere conquistar China. El emperador obliga a todos los varones a alistarse en el Ejército para proteger el imperio. Por otra parte, Mulán es una chica joven y valiente que vive en una aldea.', 'Mulan', '1dnaQjFL67k'),
(13, '2016-02-16', 5, '10346626_260153840835091_3121210337900902159_n1-600x889.jpg', 'Los X-Men unen fuerzas con sus versiones más jóvenes con el fin de cambiar el pasado y salvar su futuro y el de la humanidad.', 'x men dias del futuro pasado', '-fzkF-oOKS8'),
(14, '2018-06-07', 6, '127803_600x870.jpg', 'Un joven de familia humilde que vive en Miami en la época en que los cárteles de la droga libran en la ciudad una auténtica batalla, tiene problemas para aceptar su homosexualidad. Mientras madura en un ambiente hostil, experimenta la alegría, la ira,', 'Luz de luna', 'aPKEcfZ61bU'),
(15, '2016-02-18', 14, '67469dafb63acdbf14aabb51a726e125.jpg', 'Un expolicía en la Australia posapocalíptica defiende a productores de petróleo de unos nómadas sádicos.', 'Mad Max 2', 'j_UtDuZaeZo'),
(16, '2011-06-16', 11, '1366_2000.jpg', 'En un exuberante planeta llamado Pandora viven los Na\'vi, seres que aparentan ser primitivos pero que en realidad son muy evolucionados. Debido a que el ambiente de Pandora es venenoso, los híbridos humanos/Na\'vi, llamados Avatares,', 'avatar', 'jYRtFFa4hT8'),
(17, '2018-12-16', 8, '711OskNJSJL._AC_SY679_.jpg', 'Aquaman debe recuperar el legendario Tridente de Atlan para salvar a la ciudad subacuática de Atlantis, y al mundo de la superficie, de su hermano hambriento de poder.', 'aquaman', 'mR0FHXJlpxg'),
(18, '2022-04-07', 2, '15e18e1aa97f2195e5e715268cce6dfe.jpg', 'ShangChi debe enfrentar a su pasado cuando se ve envuelto en la red de la misteriosa organización de los Diez Anillos.', 'shang chi', 'HjzATzdlN2A'),
(19, '2021-06-16', 12, 'OFFQIVE6KZHX5JVFIDZ2C2HDFU.jpg', 'Helen debe luchar contra un cibercriminal que planea hipnotizar al mundo a través de las pantallas de las computadoras. Eso enfrenta a Mr. Increíble con uno de sus mayores desafíos', 'increibles 2', 'a2VGFKs8mVE'),
(20, '2014-07-16', 12, 'Mad_Max_Furia_en_la_carretera-171270143-large.jpg', 'Mad Max, el guerrero de la carretera', 'Mad Max, el guerrero de la carretera', '1dUWrgT0Tq0'),
(21, '2007-07-16', 12, 'LJKXRZZNW5FFNLS75F5YQY3CSA.jpg', 'Luego de pasar años limpiando la Tierra desierta, el robot Wall-E conoce a EVA y la sigue por toda la galaxia.', 'WALLE', 'asXu54U-Wmg'),
(22, '2018-09-16', 12, 'images.jpeg', 'Apocalipsis, el mutante más poderoso, despierta tras miles de años de letargo y pretende destruir a toda la humanidad. Para lograrlo, recluta a un equipo de peligrosos mutantes, encabezados por Magneto.', 'Apocalipsis', 'TBZjPqYty8E'),
(24, '2021-11-17', 15, 'fl0u5uixwaazev7_cphe.jpg', 'Sonic intenta atravesar las complejidades de la vida en la Tierra con su nuevo mejor amigo, un humano llamado Tom Wachowski. Deberán unir sus fuerzas para evitar que el malvado Dr. Robotnik ', 'sonic', 'nBqu8GNPGWw'),
(25, '2009-06-17', 12, 'Flore-Maquin-movie-posters-illustration-fight-club-.jpg', 'Un empleado de oficina insomne, harto de su vida, se cruza con un vendedor peculiar. Ambos crean un club de lucha clandestino como forma de terapia y, poco a poco-', 'El club de la pelea', 'anOJjqQb8x0'),
(26, '2002-06-17', 4, 'fd82c1116eb734b625552241e00e2a20.png', 'La saga de Alien es una saga cinematográfica de ciencia ficción y terror que relata la historia de la teniente Ellen Ripley  y su lucha contra una forma de vida alienígena', 'alien', '1KTSh01RvJM'),
(27, '2012-06-17', 7, 'ebd4d6217e59bb9068013adbf8b1e841.jpg', 'En 1873, en el viejo Oeste, los colonos y los nativos se enfrentan en una batalla salvaje por el control de las tierras, pero cuando llegan unos seres de otro planeta', 'cowboy vs aliens', 'oFwPkkEX9TU'),
(28, '2016-07-17', 4, 'e8bd618f35f46cc595ea90b30aaa40c7.jpg', 'Ed y Lorraine Warren, renombrados demonólogos e investigadores de lo paranormal, se enfrentan de nuevo a las fuerzas infernales. En esta ocasión, viajan hasta el norte de Londres para tratar de ayudar.', 'El conjuro 2', 'ryR7u8Owr04'),
(29, '2016-06-17', 2, 'CISNE-NEGRO.jpg', 'Una bailarina empieza a perder el frágil sentido de la realidad cuando una compañera recién llegada amenaza con usurpar su posición en el papel principal de \"El lago de los cisnes\".', 'Cisne Negro', 'zINZItoXF4Q'),
(30, '2022-08-15', 6, 'ae742248e0a07248a541a6c47544a24e.jpg', 'Han pasado mas de 20 años desde la ultima peliculas y ha reaparecido un descendiente de los Jedi, ahora mujer.', 'Start War El Ultimo Jeddi', '2347');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id` int(11) NOT NULL COMMENT 'id',
  `sex_nombre` varchar(60) NOT NULL COMMENT 'Nombre',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maculino Femenino';

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id`, `sex_nombre`, `updated_at`, `created_at`) VALUES
(3, 'Masculino', '2022-06-05 18:48:33', '2022-06-05 18:48:33'),
(4, 'Femenino', '2022-06-05 18:49:05', '2022-06-05 13:49:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id` int(11) NOT NULL COMMENT 'id',
  `soc_cedula` char(10) NOT NULL COMMENT 'Cédula',
  `soc_nombre` varchar(60) NOT NULL COMMENT 'Nombre',
  `soc_direccion` varchar(60) NOT NULL COMMENT 'Dirección',
  `soc_telefono` char(10) NOT NULL COMMENT 'Teléfono',
  `soc_correo` varchar(60) NOT NULL COMMENT 'Correo',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id`, `soc_cedula`, `soc_nombre`, `soc_direccion`, `soc_telefono`, `soc_correo`, `updated_at`, `created_at`) VALUES
(1, '050164789', 'Juan', 'Latacunga', '09631475', 'juan@gmail.com', '2022-06-24 05:31:58', '2022-06-24 00:31:58'),
(3, '123456', 'Lucas', 'Ambato', '2697046', 'lucas@gmail.com', '2022-06-24 09:11:35', '2022-06-24 09:11:35'),
(5, '175264789', 'Maria Fernanda', 'Riobamba', '23456789', 'mariafernanda@gmail.com', '2022-06-24 18:35:33', '2022-06-24 13:35:33'),
(6, '2457890214', 'Benito Juarez', 'Zamora Chinchipe', '06789410', 'benito@gmail.com', '2022-06-24 18:36:43', '2022-06-24 18:36:43'),
(7, '14578046', 'Luis ', 'Pujili', '025479123', 'luis@gmail.com', '2022-06-26 04:30:40', '2022-06-26 04:30:40'),
(8, '1214578920', 'Martha', 'Alpamalag', '0987456021', 'martha@gmail.com', '2022-06-26 04:31:56', '2022-06-26 04:31:56'),
(9, '023145678', 'Laico', 'San Rafael', '02364789', 'laico@gmail.com', '2022-06-26 04:32:46', '2022-06-26 04:32:46'),
(10, '3214567809', 'Santiago', 'Ibarra', '2354678', 'santiago@hotmail.com', '2022-06-26 04:33:52', '2022-06-26 04:33:52'),
(11, '123401248', 'Maria', 'Carchi', '0678945120', 'maria@hotmail.com', '2022-06-26 04:34:56', '2022-06-26 04:34:56'),
(12, '12478905', 'Mario', 'Napo', '069742015', 'mario@gmail.com', '2022-06-26 04:35:48', '2022-06-26 04:35:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `tipo`) VALUES
(4, 'Administrador del Sistema', 'admin', 'admin', 'administrador'),
(7, 'Mathias Cerezo', 'pablodariocerezo@outlook.com', 'admin', 'socio'),
(8, 'Pedrito', 'pedro@gmail.com', '12345', 'socio'),
(9, 'Julio Ocaña', 'julio@gmail.com', '12345', 'socio'),
(10, 'Mathias Cerezo', 'pedrito@gmail.com', '1234', 'socio'),
(11, 'Tomas Parra', 'parra@gmail.com', 'admin', 'socio'),
(12, 'pepito@gmail.com', 'admin@admin.com', '12345', 'socio'),
(13, 'Luisa Ocaña', 'ruiz@gmai.com', '12345', 'socio'),
(14, 'Mathias Cerezo', 'pablo@gmail.com', 'admin', 'socio'),
(15, 'Pedrito', 'pablodariocerezo@gmail.co', 'admin', 'socio'),
(16, 'Margoth', 'margoth@gmai.com', '12345', 'socio'),
(17, 'Pedrito', 'a@gmail.com', 'admin', 'socio'),
(18, 'Skks', 'pablotorrez@gmail.com', 'admin', 'socio'),
(19, 'Julio Ocaña', 'admir@jffj', 'admin', 'socio'),
(20, 'Julio Ocaña', 'p@xn--ocaoa-qta.com', '12345', 'socio'),
(21, 'Pepe', 'pe@gmai.com', 'admin', 'socio'),
(22, 'Pepo', 'admin@gmal.com', 'admin', 'socio'),
(23, 'pepe', 'admin@gmail.com', '12345', 'socio'),
(24, 'Pablo Coello', 'gsnow2798@gmail.com', 'admin', 'socio'),
(25, 'Tomas', 'pedro@gmail', '1234', 'socio'),
(26, 'torrez', 'p@gmail.com', '12345', 'socio');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fn_SEXO_ACTOR` (`sex_id`);

--
-- Indices de la tabla `actor_pelicula`
--
ALTER TABLE `actor_pelicula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fn_ACTOR_actor_pelicula` (`act_id`),
  ADD KEY `Fn_PELICULA_actor_pelicula` (`pel_id`);

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_alquiler_users` (`user_id`),
  ADD KEY `FK_alquiler_pelicula` (`pelicula_id`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `formato`
--
ALTER TABLE `formato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generopelicula`
--
ALTER TABLE `generopelicula`
  ADD KEY `FKm6e8wqbrrt6ta2g1vkc6mkl1j` (`idgenero`),
  ADD KEY `FK1d6303kncgghu7m1iesqgicv9` (`idpelicula`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `actor_pelicula`
--
ALTER TABLE `actor_pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `formato`
--
ALTER TABLE `formato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `Fn_SEXO_ACTOR` FOREIGN KEY (`sex_id`) REFERENCES `sexo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `actor_pelicula`
--
ALTER TABLE `actor_pelicula`
  ADD CONSTRAINT `Fn_ACTOR_actor_pelicula` FOREIGN KEY (`act_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fn_PELICULA_actor_pelicula` FOREIGN KEY (`pel_id`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `FK_alquiler_pelicula` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_alquiler_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `generopelicula`
--
ALTER TABLE `generopelicula`
  ADD CONSTRAINT `FK1d6303kncgghu7m1iesqgicv9` FOREIGN KEY (`idpelicula`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `FKm6e8wqbrrt6ta2g1vkc6mkl1j` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
