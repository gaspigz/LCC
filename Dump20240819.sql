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

USE 'bravo';

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
-- Dumping data for table `comentarios_empresas`
--

LOCK TABLES `comentarios_empresas` WRITE;
/*!40000 ALTER TABLE `comentarios_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_empresas` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (43,'Muebles Giménez Miniussi',0.00,2,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,'@gimminmuebles','Este emprendimiento es super groso mal me encanta',11,1,1),(44,'Metrofound',0.00,0,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,'@metrofound','Esta es la empresa de metrofound hacemos ejes bla bla bla bla',12,NULL,NULL),(46,NULL,0.00,0,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,NULL,NULL,13,NULL,NULL),(48,NULL,0.00,0,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,NULL,NULL,14,NULL,NULL),(55,NULL,0.00,0,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,NULL,NULL,21,NULL,NULL),(57,'Prueba Ges',0.00,0,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,'@prueba','A A Aaasd ad  m k v kj k kdkl lskd kl sssssssssssssssssssssssss f f ff s df,smd f,sdm f,ds f,sf,s f,m s,f s,.f ds,fm sd,fm s,m flsdmf sd,mf lsm flsm slme f,lsm dflsmd f,lsm f,,dsm f,sdd , ds f,lds mlsdm flsdf lsk fklw fñlw qkf sñkf slmf eslf ,lsmn f,lsm',22,NULL,NULL),(58,'PReuba',0.00,0,0,0,0,'0','0','0',0.00,0.00,0.00,0.00,0.00,0.00,0,'@yo','Nada',23,NULL,NULL);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_pedidos`
--

LOCK TABLES `imagenes_pedidos` WRITE;
/*!40000 ALTER TABLE `imagenes_pedidos` DISABLE KEYS */;
INSERT INTO `imagenes_pedidos` VALUES (1,31,'/storage/imagenes/4lMWciRk021S3TyobnoGmT7DnPY9C5mOeiR8ynhu.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:51:52','2024-07-07 18:51:52'),(2,31,'/storage/imagenes/9E1r7JLSHFzJEFMlF4rNt6H0U99jj9X8KJyYzjhw.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:53:35','2024-07-07 18:53:35'),(3,31,'/storage/imagenes/713v4aHHihjYVKgyiFGIHTerSpriROYp8MSYcuhf.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:53:46','2024-07-07 18:53:46'),(4,31,'/storage/imagenes/vMZhBeIMjuQmDgFkOsH9OsQMHl1U20e8Ga36n5xq.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:55:13','2024-07-07 18:55:13'),(5,31,'/storage/imagenes/dgMPJPn406bHOmNvFWFhYYEwg9Taw94ak8YIJnJ3.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:57:43','2024-07-07 18:57:43'),(6,31,'/storage/imagenes/pZYUXjbOQIjfOZntTUcRGEFj8GHe9LaxnF7enihM.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:58:19','2024-07-07 18:58:19'),(7,31,'/storage/imagenes/nZ9XTdSzUrqNgGZ1lAfHaYiSz1uq5IXIQNkVKTAX.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:58:37','2024-07-07 18:58:37'),(8,31,'/storage/imagenes/9WX6apThNN2XzVgdfXrX3ogFTrKCDJ5xjuGiLsH5.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 18:59:06','2024-07-07 18:59:06'),(9,31,'/storage/imagenes/guEdsxMOhINSzEpnSKh6w9MYADnmerbURIBrY0AE.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',NULL,'2024-07-07 18:59:40','2024-07-07 18:59:40'),(10,31,'/storage/imagenes/ZIdLp0laWmIEJAAkY5WizX529k991vHUNiF9b6E4.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',NULL,'2024-07-07 19:00:19','2024-07-07 19:00:19'),(11,31,'/storage/imagenes/hDc5HFSjfGNd3yRniIFaYqVrUQmc3OX3Rt9BNYhp.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',NULL,'2024-07-07 19:01:47','2024-07-07 19:01:47'),(12,31,'/storage/imagenes/R57fZNC80wX9KPz1wraH58LXUhnGG0aRVRaI6Izy.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',NULL,'2024-07-07 19:02:18','2024-07-07 19:02:18'),(13,41,'/storage/imagenes/3oRQHgtPBiGfyHVNBZzoV1BaK4Ci7fe533ZiemTH.png','196946','','Captura desde 2024-07-04 22-23-55.png','png',NULL,'2024-07-07 19:21:53','2024-07-07 19:21:53'),(14,42,'/storage/imagenes/QUzO8e6qKOEPQBUxkyGL5jr3HW6eHajQABi5aYyq.png','196946','','Captura desde 2024-07-04 22-23-55.png','png',NULL,'2024-07-07 19:22:13','2024-07-07 19:22:13'),(15,42,'/storage/imagenes/ddthQSTAo9xz106vH26gjRtwSkydKky5MYZTrFF0.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 19:22:13','2024-07-07 19:22:13'),(16,43,'/storage/imagenes_pedidos/xCGz4Yk0UdNgPjCvhYDxY8y3p1MVFQcKt4OGCzP3.png','196946','','Captura desde 2024-07-04 22-23-55.png','png',NULL,'2024-07-07 19:32:25','2024-07-07 19:32:25'),(17,43,'/storage/imagenes_pedidos/QCvbkqHZehkZj94ICs0g0GgWidG8d5B0oXklF9OJ.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 19:32:25','2024-07-07 19:32:25'),(18,44,'/storage/imagenes_pedidos/FJ6WqbOutLlSPNhN9lsftqS6JT9QR3xfBAcMswPb.png','196946','','Captura desde 2024-07-04 22-23-55.png','png',NULL,'2024-07-07 19:34:14','2024-07-07 19:34:14'),(19,44,'/storage/imagenes_pedidos/OUtPH457mYt0WdnuoYHMDtkZJlNwTGpMA3kFQBhl.png','201500','','Captura desde 2024-05-13 17-38-27.png','png',NULL,'2024-07-07 19:34:14','2024-07-07 19:34:14'),(20,45,'/storage/imagenes_pedidos/qHfEmyoQO15HGLkEKNTTfG7FWBb1Zt7SzaKQLuYu.png','42972','','Captura desde 2024-06-17 13-33-02.png','png',NULL,'2024-07-10 21:24:34','2024-07-10 21:24:34'),(21,46,'/storage/imagenes_pedidos/iMcp3gZAHQPO2ucTXRjQb4N2ldaY4bU5t4PDBNRg.png','62760','','Captura desde 2024-07-16 17-08-10.png','png',NULL,'2024-07-17 00:27:31','2024-07-17 00:27:31'),(22,47,'/storage/imagenes_pedidos/XIuo6AUWLhB9jCDpLrbiArONuVHmlClYG3nXQrVZ.png','38735','','Captura desde 2024-07-04 17-52-00.png','png',NULL,'2024-07-17 00:31:13','2024-07-17 00:31:13');
/*!40000 ALTER TABLE `imagenes_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_publicaciones`
--

LOCK TABLES `imagenes_publicaciones` WRITE;
/*!40000 ALTER TABLE `imagenes_publicaciones` DISABLE KEYS */;
INSERT INTO `imagenes_publicaciones` VALUES (7,11,'public/imagenes_publicaciones/D3y6MMICaPkcopScHcYHmpKMaHwbqk20iaydhzH7.png','51802','','img1.png','png',NULL,'2024-07-24 18:39:03','2024-07-24 18:39:03'),(8,11,'public/imagenes_publicaciones/gBwQSm87XKntMSQN5f0QWpOgrGmZo64XNvoXWToj.png','76113','','img4.png','png',NULL,'2024-07-24 18:39:03','2024-07-24 18:39:03'),(9,12,'public/imagenes_publicaciones/QkJrDswhqdwI0wGdDM4YiB8zM8pEWVBVTaDCTraV.png','1103456','','pngtree-wolfs-full-hd-wallpaper-art-wallpaper-1920x1080-1080p-picture-image_2634113.jpg','jpg',NULL,'2024-07-24 19:00:48','2024-07-24 19:00:48'),(10,13,'public/imagenes_publicaciones/pPTq9mp0ggWwqIl91TUx3a7Fm1ipdzXjVVJrPCKn.png','303693','','1367e5a6efd87bc1a2536d466b29d04e_400x400.png','png',NULL,'2024-07-24 19:23:59','2024-07-24 19:23:59'),(11,14,'public/imagenes_publicaciones/ASLQQPBcTxqzV823A7Vx7L6mRSarGl3SBUmuF8yb.png','104839','','ej3.png','png',NULL,'2024-07-24 19:24:42','2024-07-24 19:24:42'),(12,15,'public/imagenes_publicaciones/x9K6QMljHZnJ6tpQexxAIHid2UdQ0Pg4g4zp2hjD.png','228771','','Captura desde 2024-07-24 16-36-00.png','png',NULL,'2024-07-24 19:36:39','2024-07-24 19:36:39'),(13,16,'public/imagenes_publicaciones/8bwiUcCujqPybIv3cn7XTxbhMilZyzMNoW5jjxAu.png','491386','','Captura desde 2023-03-10 17-17-17.png','png',NULL,'2024-07-31 00:14:34','2024-07-31 00:14:34'),(14,16,'public/imagenes_publicaciones/1BWnMWUV20BvR4o212DrLAiwLLT1NL4EQv23jUnf.png','721672','','Captura desde 2023-03-08 16-33-34.png','png',NULL,'2024-07-31 00:14:34','2024-07-31 00:14:34'),(15,17,'public/imagenes_publicaciones/fWMefwO7rhEsXbKwYgMmN7PVvtVG32yrbC4olA9k.png','196946','','Captura desde 2024-07-04 22-23-55.png','png',NULL,'2024-08-07 23:31:53','2024-08-07 23:31:53'),(16,17,'public/imagenes_publicaciones/Xh0Q6dByXoy32uONWtYENMrPNAdJkw3takwaGFyD.png','228771','','Captura desde 2024-07-24 16-36-00.png','png',NULL,'2024-08-07 23:31:53','2024-08-07 23:31:53'),(17,18,'public/imagenes_publicaciones/Rw2UKCfOyccO9UjM26Um9UI4Y9oE8RL5cwAfzPq3.png','123486','','Captura desde 2024-06-02 18-21-07.png','png',NULL,'2024-08-07 23:37:06','2024-08-07 23:37:06'),(18,19,'public/imagenes_publicaciones/tEUZzJa40mIDwWzYyGI9ggDEVhwWGVOCPrJbHPo3.png','42972','','Captura desde 2024-06-17 13-33-02.png','png',NULL,'2024-08-08 00:26:33','2024-08-08 00:26:33'),(19,19,'public/imagenes_publicaciones/152QOf5CMgmWFFWG3tYwcrdXgyqvocxLE9mIUbAT.png','40764','','Captura desde 2024-05-23 22-41-22.png','png',NULL,'2024-08-08 00:26:33','2024-08-08 00:26:33'),(20,19,'public/imagenes_publicaciones/IFZZVb1S53cePHZuGSfMdse3YHBhfZTh2yXeSxOh.png','179587','','Captura desde 2024-06-23 19-08-06.png','png',NULL,'2024-08-08 00:26:33','2024-08-08 00:26:33'),(21,20,'public/imagenes_publicaciones/8bTA28aA1V0x9Ybh8Mgr1LRHSaxAy7ULn8RVkYWf.png','48878','','Captura desde 2024-06-02 17-47-10.png','png',NULL,'2024-08-08 00:27:00','2024-08-08 00:27:00');
/*!40000 ALTER TABLE `imagenes_publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_usuarios`
--

LOCK TABLES `imagenes_usuarios` WRITE;
/*!40000 ALTER TABLE `imagenes_usuarios` DISABLE KEYS */;
INSERT INTO `imagenes_usuarios` VALUES (1,43,'public/imagenes_usuarios/yrtGSPsINYueZYbxpZfvnZ8Vh0eaGqyYhQsRM7WI.png','303693','','1367e5a6efd87bc1a2536d466b29d04e_400x400.png','png',_binary '/tmp/phpSegxWk','2024-07-11 16:14:55','2024-07-23 18:17:10'),(2,43,'public/imagenes_usuarios/gsb30qKuKlIMyAB51qQmKYjNn4s9uo2EdPS2dOmN.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/phpagl7B0','2024-07-11 16:15:18','2024-07-11 16:15:18'),(3,43,'public/imagenes_usuarios/Iz3D0TeYVkNB0xTKUiT588UbP1vHRBhcBDUUTFr6.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/phpNmw0st','2024-07-11 16:15:44','2024-07-11 16:15:44'),(4,43,'public/imagenes_usuarios/NvocuJbSoFiWZLkNmKVBMVhPzUOK8FsXPdvg3TRB.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/php7JwiPK','2024-07-11 16:16:08','2024-07-11 16:16:08'),(5,43,'public/imagenes_usuarios/CiQM5KrxnUuhcYq8E9FdOuWOxOxBEAguLjoLQur6.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/phpapzuja','2024-07-11 16:17:06','2024-07-11 16:17:06'),(6,43,'public/imagenes_usuarios/WOY5p01zphPGNWeqCcmujFikdzSYiI1sshPT3kP1.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/phpLvz3fe','2024-07-11 16:17:17','2024-07-11 16:17:17'),(7,43,'public/imagenes_usuarios/8VDFfwfav0jMf8XlIEUxzxoibrufOU2HaVCed4EU.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/phpaW1o7F','2024-07-11 16:17:26','2024-07-11 16:17:26'),(8,43,'public/imagenes_usuarios/ayoBFGZeakpP3Sn4chR6zcY2y0bG9Z1PtGJswfRh.png','56633','','Captura desde 2024-06-02 17-47-50.png','png',_binary '/tmp/phpkyRJBv','2024-07-11 16:19:58','2024-07-11 16:19:58'),(9,43,'public/imagenes_usuarios/nvCqrz3KdsoissxEU4Urh98FaJU7ejk4yekfxJFZ.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phpIscyDU','2024-07-11 16:21:48','2024-07-11 16:21:48'),(10,43,'public/imagenes_usuarios/CuxzD8EcIt2FKmRsYmeY2I3dB0EEcweZInOS98hv.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phpDjn3Lj','2024-07-11 16:21:56','2024-07-11 16:21:56'),(11,43,'public/imagenes_usuarios/lFYVopUP09dVwJEYT2JzPJt1Qa0DDDu8r4raoUdE.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phpoUbAPz','2024-07-11 16:23:40','2024-07-11 16:23:40'),(12,43,'public/imagenes_usuarios/gGDKLomnXEhXfmN4EUK02zqufyWiPGWj7kJlS2YA.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phphk2N4v','2024-07-11 16:24:02','2024-07-11 16:24:02'),(13,43,'public/imagenes_usuarios/yWWvX5aYUV3MTqyBMY6xAfLlSiiHTy79gSkH181j.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phpAJ487P','2024-07-11 16:26:13','2024-07-11 16:26:13'),(14,43,'public/imagenes_usuarios/fossAKMNQXnlaRQKdPKMOd7GbOQvNwkrYKuva9tA.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phpAYiTqi','2024-07-11 16:27:03','2024-07-11 16:27:03'),(15,43,'public/imagenes_usuarios/40yzrhZTcelWclGUkjAXBK0UzK7qF6m59CUJaU1a.png','11370','','Captura desde 2024-06-02 17-48-53.png','png',_binary '/tmp/phpbTSYa5','2024-07-11 16:28:17','2024-07-11 16:28:17'),(16,43,'public/imagenes_usuarios/3qDFBAy51Sq0upDe86BUmQMEvZcilvnN5PNq6Tks.jpg','4530','','logo_jpeg.jpeg','jpeg',_binary '/tmp/phpH6MCJW','2024-07-11 17:54:24','2024-07-11 17:54:24'),(17,44,'public/imagenes_usuarios/ccsGmHulot1Dj8JhOvornyW1bV6t1i1aPx2qkeP0.png','62760','','Captura desde 2024-07-16 17-08-10.png','png',_binary '/tmp/phpVfwxrA','2024-07-17 00:31:36','2024-07-17 00:32:12'),(18,57,'public/imagenes_usuarios/fgrbBDoH1UEslYHhlNeKdeOpY9v7gz030BCVk2KB.png','348200','','Captura desde 2024-07-14 00-04-46.png','png',_binary '/tmp/php2Tr86k','2024-07-17 00:35:04','2024-07-17 00:36:00');
/*!40000 ALTER TABLE `imagenes_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (16,'1_create_ubicacions_table',1),(17,'2_create_rols_table',2),(18,'3_create_users_table',3),(30,'01_create_ubicacions_table',4),(31,'02_create_rols_table',4),(32,'03_create_users_table',4),(33,'04_create_imagenes_usuarios_table',4),(34,'05_create_imagen_pedidos_table',4),(35,'06_create_rubros_table',4),(36,'07_create_reportes_table',4),(37,'08_create_seguimientos_table',4),(38,'09_create_comentario_empresas_table',4),(39,'10_create_subrubros_table',4),(40,'11_create_empresas_table',4),(41,'12_create_pedidos_table',4),(42,'2014_10_12_100000_create_password_reset_tokens_table',4),(43,'2019_08_19_000000_create_failed_jobs_table',4),(44,'2019_12_14_000001_create_personal_access_tokens_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_solicitante` bigint unsigned NOT NULL,
  `id_empresa_a_cargo` bigint unsigned NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `pedidos_solicitante_id` (`id_solicitante`),
  KEY `pedidos_empresa_id` (`id_empresa_a_cargo`),
  KEY `pedidos_rubro_id` (`id_rubro`),
  CONSTRAINT `pedidos_empresa_id` FOREIGN KEY (`id_empresa_a_cargo`) REFERENCES `users` (`id`),
  CONSTRAINT `pedidos_rubro_id` FOREIGN KEY (`id_rubro`) REFERENCES `rubros` (`id`),
  CONSTRAINT `pedidos_solicitante_id` FOREIGN KEY (`id_solicitante`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,18,16,1,1,0,0,NULL,'prueba','prueba desc','2024-07-05 16:52:42','2024-07-05 16:52:42',0000000000,0000000000),(2,18,16,1,1,0,0,NULL,'Mate de messi','asdsa','2024-07-05 17:01:41','2024-07-05 17:01:41',0000000000,0000000000),(3,18,16,1,1,0,0,NULL,'Mate de messi','asdsa','2024-07-05 17:01:52','2024-07-05 17:01:52',0000000000,0000000000),(4,18,16,1,1,0,0,NULL,'Mate de messi','asdsa','2024-07-05 17:03:01','2024-07-05 17:03:01',0000000000,0000000000),(5,18,16,1,1,0,0,NULL,'Mate de messi','asdsa','2024-07-05 17:06:58','2024-07-05 17:06:58',0000000000,0000000000),(6,18,16,1,1,0,0,NULL,'Mate de messi','asdsa','2024-07-05 17:07:08','2024-07-05 17:07:08',0000000000,0000000000),(7,18,16,1,1,0,0,NULL,'Messi mate','JAJAJAJ','2024-07-05 17:07:49','2024-07-05 17:07:49',0000000000,0000000000),(8,18,16,1,1,0,0,NULL,'Messi mate','JAJAJAJ','2024-07-05 17:08:38','2024-07-05 17:08:38',0000000000,0000000000),(9,18,16,1,1,0,0,NULL,'Messi mate','JAJAJAJ','2024-07-05 17:09:52','2024-07-05 17:09:52',0000000000,0000000000),(10,18,16,1,1,0,0,NULL,'Messi mate','JAJAJAJ','2024-07-05 17:16:59','2024-07-05 17:16:59',0000000000,0000000000),(11,18,16,1,1,0,0,NULL,'Messi mate','JAJAJAJ','2024-07-05 17:19:31','2024-07-05 17:19:31',0000000000,0000000000),(12,18,16,1,1,0,0,NULL,'Preba','Mil','2024-07-05 17:33:06','2024-07-05 17:33:06',0000000000,0000000000),(13,18,16,1,1,0,0,NULL,'Preba','Mil','2024-07-05 17:36:17','2024-07-05 17:36:17',0000000000,0000000000),(14,18,16,1,1,0,0,NULL,'Preba','Mil','2024-07-05 17:36:40','2024-07-05 17:36:40',0000000000,0000000000),(15,18,16,1,1,0,0,NULL,'Preba','Mil','2024-07-05 17:38:15','2024-07-05 17:38:15',0000000000,0000000000),(16,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:12:08','2024-07-07 18:12:08',0000000000,0000000000),(17,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:13:08','2024-07-07 18:13:08',0000000000,0000000000),(18,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:14:07','2024-07-07 18:14:07',0000000000,0000000000),(19,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:14:39','2024-07-07 18:14:39',0000000000,0000000000),(20,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:15:20','2024-07-07 18:15:20',0000000000,0000000000),(21,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:18:17','2024-07-07 18:18:17',0000000000,0000000000),(22,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:18:46','2024-07-07 18:18:46',0000000000,0000000000),(23,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:19:20','2024-07-07 18:19:20',0000000000,0000000000),(24,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:21:02','2024-07-07 18:21:02',0000000000,0000000000),(25,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:23:20','2024-07-07 18:23:20',0000000000,0000000000),(26,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:24:01','2024-07-07 18:24:01',0000000000,0000000000),(27,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:24:32','2024-07-07 18:24:32',0000000000,0000000000),(28,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:25:05','2024-07-07 18:25:05',0000000000,0000000000),(29,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:25:17','2024-07-07 18:25:17',0000000000,0000000000),(30,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:25:34','2024-07-07 18:25:34',0000000000,0000000000),(31,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 18:39:02','2024-07-07 18:39:02',0000000000,0000000000),(32,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 19:06:12','2024-07-07 19:06:12',0000000000,0000000000),(33,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 19:07:00','2024-07-07 19:07:00',0000000000,0000000000),(34,18,16,1,1,0,0,NULL,'prueba','p','2024-07-07 19:07:25','2024-07-07 19:07:25',0000000000,0000000000),(35,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:16:55','2024-07-07 19:16:55',0000000000,0000000000),(36,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:17:12','2024-07-07 19:17:12',0000000000,0000000000),(37,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:17:24','2024-07-07 19:17:24',0000000000,0000000000),(38,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:18:27','2024-07-07 19:18:27',0000000000,0000000000),(39,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:18:58','2024-07-07 19:18:58',0000000000,0000000000),(40,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:19:43','2024-07-07 19:19:43',0000000000,0000000000),(41,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:21:53','2024-07-07 19:21:53',0000000000,0000000000),(42,18,16,1,1,0,0,NULL,'pueba','purbe','2024-07-07 19:22:13','2024-07-07 19:22:13',0000000000,0000000000),(43,18,16,1,1,0,0,NULL,'Mate de messi','Quiero un mate como el de messi en el mundial','2024-07-07 19:32:25','2024-07-07 19:32:25',0000000000,0000000000),(44,18,16,1,1,0,0,NULL,'Mate de messi','Quiero un mate como el de messi en el mundial','2024-07-07 19:34:14','2024-07-07 19:34:14',0000000000,0000000000),(45,18,16,1,1,0,0,NULL,'Taza prueba mil','AHAJ','2024-07-10 21:24:34','2024-07-10 21:24:34',0000000000,0000000000),(46,43,44,0,0,0,0,NULL,'Prueba','pedido prueba','2024-07-17 00:27:31','2024-07-17 00:27:31',0000000000,0000000000),(47,43,44,0,0,0,0,NULL,'a','a','2024-07-17 00:31:13','2024-07-17 00:31:13',0000000000,0000000000);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `publicacion_subrubro`
--

LOCK TABLES `publicacion_subrubro` WRITE;
/*!40000 ALTER TABLE `publicacion_subrubro` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicacion_subrubro` ENABLE KEYS */;
UNLOCK TABLES;

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
  `descripcion` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
INSERT INTO `publicaciones` VALUES (11,11,'','Prueba',1,000000000000,0,'','',0000000000,'2024-07-24 18:39:03','2024-07-24 18:39:03'),(12,11,'Lobo','Capo total',2,000000001000,1,'Nuevo','Envio gratis',0000000300,'2024-07-24 19:00:47','2024-07-24 19:00:47'),(13,11,'Dolar USA','Dolar',2,000000001400,1,'Nuevo','Envio gratis',0000010000,'2024-07-24 19:23:59','2024-07-24 19:23:59'),(14,11,'TEOREMA MAESTRO','Es el mismisimo',2,000000001000,1,'Nuevo','Envio gratis',0000000030,'2024-07-24 19:24:42','2024-07-24 19:24:42'),(15,11,'Paisaje','hermoso',2,000000001000,0,'Nuevo','Envio gratis',0000000010,'2024-07-24 19:36:39','2024-07-24 19:36:39'),(16,11,'','a',1,000000000000,0,'','',0000000000,'2024-07-31 00:14:34','2024-07-31 00:14:34'),(17,11,'','Prueba',1,000000000000,0,'','',0000000000,'2024-08-07 23:31:53','2024-08-07 23:31:53'),(18,11,'Codigo','En c',2,000000001000,1,'Nuevo','Envio gratis',0000000010,'2024-08-07 23:37:06','2024-08-07 23:37:06'),(19,11,'','Purbea',1,000000000000,0,'','',0000000000,'2024-08-08 00:26:33','2024-08-08 00:26:33'),(20,11,'','dos',1,000000000000,0,'','',0000000000,'2024-08-08 00:27:00','2024-08-08 00:27:00');
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `publicaciones_tipos`
--

LOCK TABLES `publicaciones_tipos` WRITE;
/*!40000 ALTER TABLE `publicaciones_tipos` DISABLE KEYS */;
INSERT INTO `publicaciones_tipos` VALUES (1,'Galeria'),(2,'Producto'),(3,'Servicio');
/*!40000 ALTER TABLE `publicaciones_tipos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Cliente'),(2,'Empresa');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `rubros`
--

LOCK TABLES `rubros` WRITE;
/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
INSERT INTO `rubros` VALUES (0,'No tiene',NULL,NULL,NULL),(1,'Belleza y cuidado personal',NULL,NULL,NULL),(2,'Textil',NULL,NULL,NULL),(3,'Construcción y herramientas',NULL,NULL,NULL),(4,'Hogar e interiores',NULL,NULL,NULL),(5,'Entretenimiento y cultura',NULL,NULL,NULL),(6,'Mascotas',NULL,NULL,NULL),(7,'Transporte',NULL,NULL,NULL),(8,'Articulos personales',NULL,NULL,NULL),(9,'Servicios',NULL,NULL,NULL),(10,'Otros',NULL,NULL,NULL);
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `seguimientos`
--

LOCK TABLES `seguimientos` WRITE;
/*!40000 ALTER TABLE `seguimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimientos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `subrubros`
--

LOCK TABLES `subrubros` WRITE;
/*!40000 ALTER TABLE `subrubros` DISABLE KEYS */;
INSERT INTO `subrubros` VALUES (0,0,'No tiene',NULL,NULL),(2,1,'Spa',NULL,NULL),(3,1,'Peluqueria Femenina',NULL,NULL),(4,1,'Peluqueria masculina',NULL,NULL),(5,1,'Maquillaje',NULL,NULL),(6,1,'Uñas',NULL,NULL),(7,1,'Fitness y entrenamiento',NULL,NULL),(8,1,'Terapia en agua',NULL,NULL),(9,1,'Kinesiologia',NULL,NULL),(10,1,'Cejas y pestañas',NULL,NULL),(11,1,'Manicura',NULL,NULL),(12,1,'Pedicura',NULL,NULL),(13,1,'Acupuntura',NULL,NULL),(14,2,'Ropa formal',NULL,NULL),(15,2,'Ropa deportiva',NULL,NULL),(16,2,'Ropa informal',NULL,NULL),(17,2,'Manteles y ropa de cama',NULL,NULL),(18,2,'Cuero',NULL,NULL),(19,2,'zapatos',NULL,NULL),(20,2,'Calzado deportivo',NULL,NULL),(21,2,'Tintoreria',NULL,NULL),(22,2,'Sastreria',NULL,NULL),(23,2,'Diseño de indumentaria',NULL,NULL),(24,3,'Carpinteria',NULL,NULL),(25,3,'Servicio de torno (matriceria)',NULL,NULL),(26,3,'Herrería',NULL,NULL),(27,3,'metalurgia',NULL,NULL),(28,3,'Ferreteria',NULL,NULL),(29,4,'Mueblería',NULL,NULL),(30,4,'Bazar',NULL,NULL),(31,4,'Electrodomesticos',NULL,NULL),(32,4,'Diseño de interiores',NULL,NULL),(33,4,'Pinturería',NULL,NULL),(34,4,'Adornos y decoraciones',NULL,NULL),(35,5,'Jugueteria',NULL,NULL),(36,5,'Deportes',NULL,NULL),(37,5,'Librería',NULL,NULL),(38,6,'Peluqueria',NULL,NULL),(39,6,'Alimentos',NULL,NULL),(40,6,'Juguetes e indumentaria',NULL,NULL),(41,6,'Veterinaria',NULL,NULL),(42,7,'Motos y accesorios',NULL,NULL),(43,7,'Bicicleteria',NULL,NULL),(44,7,'Neumáticos',NULL,NULL),(45,7,'Concesionaria',NULL,NULL),(46,8,'Farmacia',NULL,NULL),(47,8,'Perfumeria',NULL,NULL),(48,9,'Mantenimiento',NULL,NULL),(49,9,'Asesoría profesional',NULL,NULL),(50,9,'Limpieza',NULL,NULL),(51,10,'Supermercado',NULL,NULL),(52,10,'Imprenta',NULL,NULL),(53,10,'Repuestos',NULL,NULL);
/*!40000 ALTER TABLE `subrubros` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,-32.96,-60.64,31,'Rosario','Argentina','Rodriguez','3351','',NULL,NULL),(2,NULL,NULL,31,NULL,NULL,'','','',NULL,NULL),(3,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(4,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(5,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(6,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(7,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(8,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(9,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(10,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(11,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(12,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(13,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(14,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(15,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(16,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(17,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(18,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(19,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(20,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(21,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(22,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(23,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(24,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(25,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(26,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(27,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(28,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(29,-26.82,-65.22,31,'San Miguel de Tucumán','Argentina','Rodriguez','3351','',NULL,NULL),(30,-34.58,-60.95,33,'Junín','Argentina','Rpd','3620','Piso 2',NULL,NULL),(31,-32.96,-60.64,16,'Rosario','Argentina','','','',NULL,NULL),(32,-31.42,-64.18,34,'Córdoba','Argentina','Rod','3351','',NULL,NULL),(33,-31.42,-64.18,36,'Córdoba','Argentina','2w','23','',NULL,NULL),(34,-34.92,-57.95,35,'La Plata','Argentina','Rod','210','',NULL,NULL),(35,-45.86,-67.48,18,'Comodoro Rivadavia','Argentina','San Juan','2050','',NULL,NULL),(36,-31.58,-63.53,38,'Villa del Rosario','Argentina','Rodri','3005','3',NULL,NULL),(37,-36.62,-64.28,43,'Santa Rosa','Argentina','Rodriguez','335','Nada',NULL,NULL),(38,-32.96,-60.64,44,'Rosario','Argentina','Ovidio Lagos','3222','Prueba',NULL,NULL),(39,-34.60,-58.38,57,'Buenos Aires','Argentina','','','',NULL,NULL),(40,-32.96,-60.64,58,'Rosario','Argentina','2000','','',NULL,NULL);
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subrubro`
--

LOCK TABLES `user_subrubro` WRITE;
/*!40000 ALTER TABLE `user_subrubro` DISABLE KEYS */;
INSERT INTO `user_subrubro` VALUES (32,43,15),(33,43,14),(34,43,17),(35,43,22);
/*!40000 ALTER TABLE `user_subrubro` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_correo_unique` (`correo`),
  KEY `user_ubicacion_id` (`ubicacion_id`),
  CONSTRAINT `user_ubicacion_id` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'gaspar.gdddimenez8@gmail.com','$2y$10$d5jydWAwuM5gEa44U5ncz.AVS748ixB1pb8R8qjNBMpQ2TGq7sx/u','Ernestina','Miniussi',-1,NULL,31,2,0,0,0,NULL,NULL,'2024-04-16 13:02:20','2024-06-23 21:33:54','+54 3413732594','2000','2','2003-09-19'),(17,'gaspar.gimeaanez8@gmail.com','$2y$10$aPmxbCmZofcW/I5DaBqLMuEGHXa9upid8CoCSktjettudSzepVP4O',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-04-20 23:39:50','2024-04-20 23:39:50',NULL,NULL,'NO DEFINIDO',NULL),(18,'gaspar@gmail.com','$2y$10$auzN/HDkqyXU/DsR9pQkiuW3GxEUQH79wqSSbJR.GnsjVUtqE8.5G','Pedro','Giménez',-1,NULL,35,2,0,0,0,'2024-07-13 22:35:13',NULL,'2024-04-28 16:25:35','2024-07-13 22:35:13','+ 543416852224','2001','1','2006-07-15'),(19,'gaspiknt@gmail.com','$2y$10$rdTetv2K5FYZZBTwl9abge996IIK9cFhd07.UbfUkmfkrdCe1GyRW',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-04-29 12:48:34','2024-04-29 12:48:34',NULL,NULL,'NO DEFINIDO',NULL),(20,'gaspix@gmail.com','$2y$10$0Ty1zTPp2rw/Y851hWnCD.XtafYLWuYTHcnrJ0EXC.QZPl/.vvdGa',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-05-09 17:27:59','2024-05-09 17:27:59',NULL,NULL,'NO DEFINIDO',NULL),(31,'alejo.gimenez.gs@gmail.com','$2y$10$EHOxSWzjnDuwMnjR1xuSh.cXpKrJZQKj7MmwOzfqfUrfD0ASO5aVq','Alejo','Gimenez',-1,NULL,29,2,0,0,0,NULL,NULL,'2024-05-24 22:44:22','2024-05-25 06:52:49','+ 543416924442','2000','1','1991-02-22'),(33,'cpngustavogimenez@gmail.com','$2y$10$Xnjm0sj7JEmxhepm0CX4FOTvlMyLE6A.sjvs3x4ygjxxFtrRSLYtK','Gus','Gimenez',-1,NULL,30,1,0,0,0,NULL,NULL,'2024-05-25 06:56:49','2024-05-25 06:58:00','+54','300','1','2024-04-17'),(34,'prueba1@gmail.com','$2y$10$UXv5NmeTArHvIRr7i41ZC.NMXZNy06JOzLcShDHd8DcasfjRPgxge','Prueba','Prueba',-1,NULL,32,1,0,0,0,NULL,NULL,'2024-05-30 21:46:11','2024-05-30 22:33:44','+ 54341694442','2000','1','2024-04-18'),(35,'gasp@gmail.com','$2y$10$VLTdtBxa72GNZzCd0U8/A.5E2RNCpTkektkoEJuIpnpaBrxmW1fgS','Gaspar','G',-1,NULL,34,2,0,0,0,NULL,NULL,'2024-05-30 22:37:06','2024-05-30 22:50:00','+ 6722000','3000','1','2024-04-10'),(36,'gg@gmail.com','$2y$10$QFZUbbLkfLIV6qwBfEmhbuBa0posJ/YYr5MW7C9hYzJKxuLkrrTYy','2000','3000',-1,NULL,33,2,0,0,0,NULL,NULL,'2024-05-30 22:37:35','2024-05-30 22:41:00','+ 543416','233','1','2024-04-09'),(37,'ggg@gmail.com','$2y$10$C1A/Fe/czgHYAVg.A0R6JeMY2w4EiP9JxTAi7ynARzxIYXrFxfXqe',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-06-12 15:39:07','2024-06-12 15:39:07',NULL,NULL,'NO DEFINIDO',NULL),(38,'g1@gmail.com','$2y$10$xR7877mHMqa3jkqAy9uQ3unRjdTDK.Cv762H7VhyOVPyhgnDuZ26S','Prueba','Milllll',-1,NULL,36,2,0,0,0,NULL,NULL,'2024-06-12 16:14:18','2024-06-12 16:15:49','+ 5434160','2000','1','2024-05-14'),(39,'gaspar.gimenez82@gmail.com','$2y$10$uUoL0o25SH0CkFbJTkR2FOGxK/y1msWJcj1T3SDVtu5JL/WqZ9u/q',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-07-10 22:02:19','2024-07-10 22:02:19',NULL,NULL,'NO DEFINIDO',NULL),(40,'gaspar.gimensez8@gmail.com','$2y$10$r7nnxgYNnfM4yH8slsDI3eqW7DjYyLcKGDWuSrTmRh40wlkYm8lyy',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-07-10 22:02:49','2024-07-10 22:02:49',NULL,NULL,'NO DEFINIDO',NULL),(41,'asadsd','$2y$10$DL3nGvhYjnDrNVHoEMo8euN.HaAHDpF8K.zVPUeCo15KaFY3Nvfm.',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-07-10 22:05:24','2024-07-10 22:05:24',NULL,NULL,'NO DEFINIDO',NULL),(43,'gaspar.gimenez8@gmail.com','$2y$10$vfxFvdEwCD0xvpzJQplYQect9pDZmOEblGNntmT0i86ng7.H2Dguy','Gaspar','Giménez Miniussi',-1,NULL,37,2,0,0,0,NULL,NULL,'2024-07-10 22:11:27','2024-07-11 17:53:09','+ 543416924442','2000','1','1959-07-24'),(44,'mfgiardina@gmail.com','$2y$10$yO8Mm3/pbvlcFq.WK.SKuuxM8miVM0Zs50tkgIldL3BwHEoB6siUm','Marcela','Giardina',-1,NULL,38,2,0,0,0,NULL,NULL,'2024-07-10 22:13:47','2024-07-10 22:15:02','+ 543416925555','2000','2','1903-07-24'),(46,'gaspar.gimenezaaaa@gmail.com','$2y$10$jXIcG8AYs/dUbtV9IGTjpOaWrnpL.vnxm1XSs2bMpg6UVQ8JZR6n.',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-07-11 17:51:43','2024-07-11 17:51:43',NULL,NULL,'NO DEFINIDO',NULL),(48,'gaspar2@gmail.com','$2y$10$dEbHRUAmgEmd5V4qhgOFXunDQagzyyaWqMa3jQPksVQ9vLYrIhGEa',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-07-13 22:19:56','2024-07-13 22:19:56',NULL,NULL,'NO DEFINIDO',NULL),(53,'gasparetigaspareti@gmail.com','$2y$10$WUaWIlhvG/GBRquk/9P.mOYpd9l9YblKcUF/LWYAsxzSzTBHATeTi',NULL,NULL,-1,NULL,NULL,2,0,0,0,NULL,NULL,'2024-07-13 22:48:15','2024-07-13 22:48:15',NULL,NULL,'NO DEFINIDO',NULL),(55,'gesparticularedsds@gmail.com','$2y$10$txH3D6ESHhGWeyTOLkPqbumURTpaBWyVDdGWZUFTd9BmxIMyQ.u6O',NULL,NULL,-1,NULL,NULL,2,0,0,0,'2024-07-13 22:53:15',NULL,'2024-07-13 22:52:38','2024-07-13 22:53:15',NULL,NULL,'NO DEFINIDO',NULL),(57,'gesparticulares@gmail.com','$2y$10$PjS1hpVcIQslu96MB6SROuIG8uIElgEJc2vonECrEaEFw.wfQkvsy','Ges','Part',-1,NULL,39,2,0,0,0,'2024-07-16 23:21:08',NULL,'2024-07-16 23:20:38','2024-07-17 00:34:56','+ 543416924442','2000','1','2024-06-11'),(58,'gaspar.gimenez@gmail.com','$2y$10$kU4oHgXsmodIqPEbtiDikuKrcIfzB93.iwPXmkLY6ab1034JIPcV.','Gaspi','Dos',-1,NULL,40,1,0,0,0,NULL,NULL,'2024-08-07 23:40:05','2024-08-07 23:41:07','+ 543416924442','3000','1','2024-07-17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 18:11:54
