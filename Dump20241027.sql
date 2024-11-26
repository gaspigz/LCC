-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: bravo_app
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios_empresas`
--

use bravo;

DROP TABLE IF EXISTS `comentarios_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_comentador` bigint unsigned NOT NULL,
  `id_empresa` bigint unsigned NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_general` int NOT NULL,
  `r_calidad_precio` int NOT NULL,
  `r_atencion` int NOT NULL,
  `r_flexibilidad` int NOT NULL,
  `r_cualidad_1` int NOT NULL,
  `r_cualidad_2` int NOT NULL,
  `r_cualidad_3` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_empresa_comentador_id` (`id_comentador`),
  KEY `comentario_empresa_empresa_id` (`id_empresa`),
  CONSTRAINT `comentario_empresa_comentador_id` FOREIGN KEY (`id_comentador`) REFERENCES `users` (`id`),
  CONSTRAINT `comentario_empresa_empresa_id` FOREIGN KEY (`id_empresa`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id_usuario` bigint unsigned NOT NULL,
  `nombre_empresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `r_general` double(8,2) NOT NULL DEFAULT '0.00',
  `id_rubro` bigint unsigned NOT NULL DEFAULT '0',
  `id_subrubro_1` bigint unsigned NOT NULL DEFAULT '0',
  `id_subrubro_2` bigint unsigned NOT NULL DEFAULT '0',
  `id_subrubro_3` bigint unsigned NOT NULL DEFAULT '0',
  `cualidad_rubro_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cualidad_rubro_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cualidad_rubro_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `r_calidad_precio` double(8,2) NOT NULL DEFAULT '0.00',
  `r_atencion` double(8,2) NOT NULL DEFAULT '0.00',
  `r_flexibilidad` double(8,2) NOT NULL DEFAULT '0.00',
  `r_cualidad_rubro_1` double(8,2) NOT NULL DEFAULT '0.00',
  `r_cualidad_rubro_2` double(8,2) NOT NULL DEFAULT '0.00',
  `r_cualidad_rubro_3` double(8,2) NOT NULL DEFAULT '0.00',
  `trabajos_personalizados` tinyint(1) NOT NULL DEFAULT '0',
  `red_social` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `colaboradores` int unsigned DEFAULT NULL,
  `s_p_a` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_usuario_id` (`id_usuario`),
  KEY `empresa_rubro_id` (`id_rubro`),
  KEY `empresa_subrubro1_id` (`id_subrubro_1`),
  KEY `empresa_subrubro2_id` (`id_subrubro_2`),
  KEY `empresa_subrubro3_id` (`id_subrubro_3`),
  CONSTRAINT `empresa_rubro_id` FOREIGN KEY (`id_rubro`) REFERENCES `rubros` (`id`),
  CONSTRAINT `empresa_subrubro1_id` FOREIGN KEY (`id_subrubro_1`) REFERENCES `subrubros` (`id`),
  CONSTRAINT `empresa_subrubro2_id` FOREIGN KEY (`id_subrubro_2`) REFERENCES `subrubros` (`id`),
  CONSTRAINT `empresa_subrubro3_id` FOREIGN KEY (`id_subrubro_3`) REFERENCES `subrubros` (`id`),
  CONSTRAINT `empresa_usuario_id` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagenes_pedidos`
--

DROP TABLE IF EXISTS `imagenes_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` bigint unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tamaño` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archivo` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagen_pedidos_pedido_id_idx` (`id_pedido`),
  CONSTRAINT `imagen_pedidos_pedido_id` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagenes_publicaciones`
--

DROP TABLE IF EXISTS `imagenes_publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_publicaciones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_publicacion` bigint unsigned NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `archivo` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imagenes_publicaciones_publicacion_idx` (`id_publicacion`),
  CONSTRAINT `fk_imagenes_publicaciones_publicacion` FOREIGN KEY (`id_publicacion`) REFERENCES `publicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagenes_usuarios`
--

DROP TABLE IF EXISTS `imagenes_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_usuarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamaño` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archivo` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagen_usuario_id` (`id_usuario`),
  CONSTRAINT `imagen_usuario_id` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_solicitante` bigint unsigned NOT NULL,
  `id_empresa_a_cargo` bigint unsigned DEFAULT NULL,
  `id_rubro` bigint unsigned NOT NULL,
  `id_subrubro_1` bigint unsigned DEFAULT NULL,
  `id_subrubro_2` bigint unsigned DEFAULT NULL,
  `id_subrubro_3` bigint unsigned DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fue_confirmado` int(10) unsigned zerofill DEFAULT NULL,
  `esta_finalizado` int(10) unsigned zerofill DEFAULT NULL,
  `ubicacion` bigint unsigned DEFAULT NULL,
  `precio_min` decimal(18,2) DEFAULT NULL,
  `precio_max` decimal(18,2) DEFAULT NULL,
  `visitas` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_solicitante_id` (`id_solicitante`),
  KEY `pedidos_empresa_id_idx` (`id_empresa_a_cargo`),
  KEY `pedidos_rubro_id` (`id_rubro`),
  KEY `fk_pedido_ubicacion` (`ubicacion`),
  CONSTRAINT `fk_pedido_ubicacion` FOREIGN KEY (`ubicacion`) REFERENCES `ubicaciones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pedidos_empresa_id` FOREIGN KEY (`id_empresa_a_cargo`) REFERENCES `empresas` (`id`),
  CONSTRAINT `pedidos_rubro_id` FOREIGN KEY (`id_rubro`) REFERENCES `rubros` (`id`),
  CONSTRAINT `pedidos_solicitante_id` FOREIGN KEY (`id_solicitante`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicacion_subrubro`
--

DROP TABLE IF EXISTS `publicacion_subrubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion_subrubro` (
  `id` bigint unsigned NOT NULL,
  `id_publicacion` bigint unsigned DEFAULT NULL,
  `id_subrubro` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_publicacion_subrubro_publi_idx` (`id_publicacion`),
  KEY `fk_publicacion_subrubro_subr_idx` (`id_subrubro`),
  CONSTRAINT `fk_publicacion_subrubro_publi` FOREIGN KEY (`id_publicacion`) REFERENCES `publicaciones` (`id`),
  CONSTRAINT `fk_publicacion_subrubro_subr` FOREIGN KEY (`id_subrubro`) REFERENCES `subrubros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_empresa_a_cargo` bigint unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_tipo` bigint unsigned NOT NULL,
  `precio` float unsigned zerofill DEFAULT NULL,
  `ofrecer_retiro` int(1) unsigned zerofill DEFAULT NULL,
  `estado_producto` varchar(45) DEFAULT NULL,
  `entrega` varchar(45) DEFAULT NULL,
  `cantidad` int(10) unsigned zerofill DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_publicaciones_empresa_idx` (`id_empresa_a_cargo`),
  KEY `fk_publicaciones_tipo_idx` (`id_tipo`),
  CONSTRAINT `fk_publicaciones_empresa` FOREIGN KEY (`id_empresa_a_cargo`) REFERENCES `empresas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_publicaciones_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `publicaciones_tipos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicaciones_tipos`
--

DROP TABLE IF EXISTS `publicaciones_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones_tipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_reportante` bigint unsigned NOT NULL,
  `id_reportado` bigint unsigned NOT NULL,
  `mensaje` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corroborado` tinyint(1) NOT NULL DEFAULT '0',
  `accion` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reporte_reportante_id` (`id_reportante`),
  KEY `reporte_reportado_id` (`id_reportado`),
  CONSTRAINT `reporte_reportado_id` FOREIGN KEY (`id_reportado`) REFERENCES `users` (`id`),
  CONSTRAINT `reporte_reportante_id` FOREIGN KEY (`id_reportante`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cualidad_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cualidad_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cualidad_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguimientos`
--

DROP TABLE IF EXISTS `seguimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimientos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_follower` bigint unsigned NOT NULL,
  `id_following` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seguimientos_follower_id` (`id_follower`),
  KEY `seguimientos_following_id` (`id_following`),
  CONSTRAINT `seguimientos_follower_id` FOREIGN KEY (`id_follower`) REFERENCES `users` (`id`),
  CONSTRAINT `seguimientos_following_id` FOREIGN KEY (`id_following`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subrubros`
--

DROP TABLE IF EXISTS `subrubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subrubros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_rubro_asocioado` bigint unsigned NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subrubro_rubro_id` (`id_rubro_asocioado`),
  CONSTRAINT `subrubro_rubro_id` FOREIGN KEY (`id_rubro_asocioado`) REFERENCES `rubros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `latitud` double(8,2) DEFAULT NULL,
  `longitud` double(8,2) DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opcionales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ubicaciones_1_idx` (`user_id`),
  CONSTRAINT `fk_ubicaciones_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_subrubro`
--

DROP TABLE IF EXISTS `user_subrubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subrubro` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint unsigned NOT NULL,
  `id_subrubro` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_subrubro_user_idx` (`id_user`),
  KEY `fk_user_subrubro_subrubro_idx` (`id_subrubro`),
  CONSTRAINT `fk_user_subrubro_subrubro` FOREIGN KEY (`id_subrubro`) REFERENCES `subrubros` (`id`),
  CONSTRAINT `fk_user_subrubro_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '-1',
  `descripcion` varchar(240) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion_id` bigint unsigned DEFAULT NULL,
  `rol_id` bigint unsigned DEFAULT '0',
  `strike_1` tinyint(1) NOT NULL DEFAULT '0',
  `strike_2` tinyint(1) NOT NULL DEFAULT '0',
  `dado_baja` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genero` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'NO DEFINIDO',
  `fecha_nacimiento` date DEFAULT NULL,
  `google_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_correo_unique` (`correo`),
  KEY `user_ubicacion_id` (`ubicacion_id`),
  CONSTRAINT `user_ubicacion_id` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_codigo`
--

DROP TABLE IF EXISTS `users_codigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_codigo` (
  `id_user` bigint unsigned NOT NULL,
  `current_code` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  CONSTRAINT `fk_users_codigo_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_publicaciones_guardadas`
--

DROP TABLE IF EXISTS `usuarios_publicaciones_guardadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_publicaciones_guardadas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publicacion_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `publicacion_id_idx` (`publicacion_id`),
  CONSTRAINT `publicacion_id` FOREIGN KEY (`publicacion_id`) REFERENCES `publicaciones` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27 22:02:48
