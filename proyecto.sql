-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.34-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para proyectocedis
CREATE DATABASE IF NOT EXISTS `proyectocedis` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proyectocedis`;

-- Volcando estructura para tabla proyectocedis.comentarios
CREATE TABLE IF NOT EXISTS `comentarios` (
  `IdComentario` int(11) NOT NULL AUTO_INCREMENT,
  `IdUser` varchar(32) NOT NULL,
  `IdQuery` varchar(32) NOT NULL,
  `Comentarios` varchar(200) NOT NULL,
  `FechaC` datetime NOT NULL,
  PRIMARY KEY (`IdComentario`),
  KEY `FK_comentarios_users` (`IdUser`),
  KEY `FK_comentarios_query` (`IdQuery`),
  CONSTRAINT `FK_comentarios_query` FOREIGN KEY (`IdQuery`) REFERENCES `query` (`IdQuery`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectocedis.comentarios: ~9 rows (aproximadamente)
DELETE FROM `comentarios`;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` (`IdComentario`, `IdUser`, `IdQuery`, `Comentarios`, `FechaC`) VALUES
	(7, '', 'e4da3b7fbbce2345d7772b0674a318d5', 'prueba', '2018-06-28 11:50:19'),
	(8, '', '66b86ab0232f8377c518f27ef9ae4be8', 'este query perjudica al sistema y lo detiende', '2018-06-29 09:32:29'),
	(9, '', '84d62986ff9363eca58f96a7b649cefb', 'problemas', '2018-06-29 11:54:54'),
	(10, '', '84d62986ff9363eca58f96a7b649cefb', 'prueba dos de comentarios', '2018-07-03 17:59:45'),
	(11, '', '84d62986ff9363eca58f96a7b649cefb', 'Falata agregar nombre de dominio a los comentarios', '2018-07-04 12:46:50'),
	(12, '', '84d62986ff9363eca58f96a7b649cefb', 'checar el login ', '2018-07-04 12:47:05'),
	(13, '', 'a87ff679a2f3e71d9181a67b7542122c', 'prueba de comentario', '2018-07-07 10:06:57'),
	(14, 'dolivera', '3ff857db63ccb49f54b36970c64e5549', 'hola', '2018-08-04 12:31:22'),
	(15, 'dolivera', '3ff857db63ccb49f54b36970c64e5549', 'prueba', '2018-08-04 12:37:52');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;

-- Volcando estructura para tabla proyectocedis.ocurrencia
CREATE TABLE IF NOT EXISTS `ocurrencia` (
  `IdOcurrencia` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuery` varchar(32) NOT NULL,
  `cpu` int(11) DEFAULT NULL,
  `usedmemory` int(11) NOT NULL,
  `sqlcommand` longtext NOT NULL,
  `wait` float NOT NULL,
  `FechaO` datetime NOT NULL,
  PRIMARY KEY (`IdOcurrencia`),
  KEY `FK_ocurrencia_query` (`IdQuery`),
  CONSTRAINT `FK_ocurrencia_query` FOREIGN KEY (`IdQuery`) REFERENCES `query` (`IdQuery`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectocedis.ocurrencia: ~7 rows (aproximadamente)
DELETE FROM `ocurrencia`;
/*!40000 ALTER TABLE `ocurrencia` DISABLE KEYS */;
INSERT INTO `ocurrencia` (`IdOcurrencia`, `IdQuery`, `cpu`, `usedmemory`, `sqlcommand`, `wait`, `FechaO`) VALUES
	(1, '84d62986ff9363eca58f96a7b649cefb', 250, 51, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = float, @get_outer_command = float, @get_transaction_info = float;', 0, '2018-06-28 00:00:00'),
	(2, 'a87ff679a2f3e71d9181a67b7542122c', 125, 210, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = boolean, @get_transaction_info = boolean;', 0, '2018-05-23 00:00:00'),
	(3, '84d62986ff9363eca58f96a7b649cefb', 152, 110, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = int, @get_transaction_info = int;', 0, '2018-06-25 00:00:00'),
	(7, '3ff857db63ccb49f54b36970c64e5549', 235, 36, 'SELECT * FROM prueba2;                            ', 0.0352, '2018-07-25 12:14:10'),
	(8, '3ff857db63ccb49f54b36970c64e5549', 235, 36, 'SELECT * FROM prueba2;                            ', 0.0352, '2018-07-25 12:15:12'),
	(9, '3ff857db63ccb49f54b36970c64e5549', 235, 36, 'SELECT * FROM prueba2;                            ', 0.0352, '2018-08-04 12:25:53'),
	(10, '7385840bf59a6a34160898390ac4407d', 233, 34, 'SELECT * FROM prueba;                             ', 0.035, '2018-08-04 12:41:14');
/*!40000 ALTER TABLE `ocurrencia` ENABLE KEYS */;

-- Volcando estructura para tabla proyectocedis.query
CREATE TABLE IF NOT EXISTS `query` (
  `IdQuery` varchar(32) NOT NULL,
  `cpu` int(11) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `databasename` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `usedmemory` int(11) NOT NULL,
  `sqlcommand` longtext NOT NULL,
  `wait` float unsigned NOT NULL,
  `FechaQ` datetime NOT NULL,
  PRIMARY KEY (`IdQuery`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectocedis.query: ~8 rows (aproximadamente)
DELETE FROM `query`;
/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` (`IdQuery`, `cpu`, `hostname`, `databasename`, `status`, `usedmemory`, `sqlcommand`, `wait`, `FechaQ`) VALUES
	('3ff857db63ccb49f54b36970c64e5549', 235, 'salas                                             ', 'prueba2                                           ', 'run2                                              ', 36, 'SELECT * FROM prueba2;                            ', 0.0352, '2018-08-04 12:25:53'),
	('66b86ab0232f8377c518f27ef9ae4be8', 47, '45', 'qaq', 'runnable', 323, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = int, @get_transaction_info = int;', 0, '2018-06-09 00:00:00'),
	('7385840bf59a6a34160898390ac4407d', 233, 'salas                                             ', 'prueba                                            ', 'run                                               ', 34, 'SELECT * FROM prueba;                             ', 0.035, '2018-08-04 12:41:14'),
	('84d62986ff9363eca58f96a7b649cefb', 31, '53', 'sa', 'runnable', 223, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = int, @get_transaction_info = int;', 0, '2018-06-20 00:00:00'),
	('a87ff679a2f3e71d9181a67b7542122c', 43, '13', 'tz', 'runnable', 310, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = int, @get_transaction_info = int;', 0, '2018-06-18 00:00:00'),
	('c4ca4238a0b923820dcc509a6f75849b', 30, '55', 'aa', 'runnable\r\n', 203, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = int, @get_transaction_info = int;', 0, '2018-06-18 00:00:00'),
	('e4da3b7fbbce2345d7772b0674a318d5', 34, '45', 'pip', 'runnable', 298, 'SELECT * INTO #Bicycles FROM AdventureWorks2012.Production.Product WHERE ProductNumber LIKE \'BK%\';', 0, '2018-06-13 00:00:00'),
	('eccbc87e4b5ce2fe28308fd9f2a7baf3', 54, '25', 'lil', 'runnable', 245, 'EXEC master.dbo.sp_WhoIsActive @show_own_spid = int, @get_outer_command = int, @get_transaction_info = int;', 0, '2018-05-22 00:00:00');
/*!40000 ALTER TABLE `query` ENABLE KEYS */;

-- Volcando estructura para tabla proyectocedis.users
CREATE TABLE IF NOT EXISTS `users` (
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  `numEmpleado` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(250) NOT NULL,
  `authKey` varchar(250) NOT NULL,
  `accessToken` varchar(250) NOT NULL,
  `activate` tinyint(1) NOT NULL DEFAULT '0',
  `verification_code` varchar(250) NOT NULL,
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectocedis.users: ~3 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`IdUser`, `area`, `numEmpleado`, `username`, `email`, `password`, `authKey`, `accessToken`, `activate`, `verification_code`) VALUES
	(6, 'DataCenter', 1234567, 'David', 'davidxrl81@gmail.com', 'jkw.AmpEWmFZ.', '53984da47d5122cec82540fe94b06c7a9488ed1f2648c6bc9a5c089834b6f1adea790c846aaf2933847f16dcd734ee41ffd40af34ca7cd4fae5d5ce0dee770632cb779ed021c1580275879284ee347963070aed045c031303320a13a415e8a45529ea127', 'd7986e170c41a2d6c9bebfb26b115b497b767874ffaeefeba20ea3efc41ecefffd50ab0db13d44e8c32d5f9624f3df7ae7741b013a9d8fa6e41e3b3822feca94083d53e27c520a944849fee6e89cd58b77b660ef02cd5fc9b14c7ae3e8f7de1e21bb0316', 1, '3a3885a5'),
	(8, 'Desarrollo', 7654321, 'Daes', 'davidxrl8@hotmail.com', 'jkdur87720HGA', '684d71d6206d02d24d056b33687e8f55e1fe57d55e03bd10813442219beef08328dbdb07cd76ffcddb55ca12c61cb788dbd57e59e528e27d0bdd0ae1dcaff6d07f1c5b05716b8167683ceb88d670328d7369cc7a179b1ee91e835044a7e213eb121dbb29', '08ee2a4ab80425e551dccdd8ef08a4a6ca55d611760bc180c8d2158f43d3e0c4cc3de3650ce7f15dadbdb718be755cd5a9176337906e45cc3d4516150dbe2565756ba5eb401c000f2be1e14c435036082454eb86843f2ed40be36cfd87ea09e35717b4e5', 1, ''),
	(13, 'DataCenter', 1234568, 'Esaemy', 'daesolan@gmail.com', 'jkzAA5kBZTUvI', 'afb1ea134f5407338a978380a779f75229ac6916f58ae398b12b9f32e4b753409a241cca4b36f9accdc5ace4af513e40ad2aa3940fa5be6e80a293981f24792215cc54518ec44833a51ce95ab9f01d9d6fcd16af4880b36d2fcb53fccb3d7743d63f4a31', '6f17bbf9c29bc3cc1ada206883479a97dea244cc5f99912d14653c018fa6e700811594e270c11f12a273f45e20ad6bd8383a707a59dcc51fc2f631d69a1a0b207681abb7c90a83087cfdf3eff00c8e8b9eda01f02fac8571252daac50859424d86d7e70b', 1, 'f2b08216');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
