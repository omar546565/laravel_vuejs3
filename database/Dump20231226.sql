-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: laravel_vuejs3
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `langs`
--

DROP TABLE IF EXISTS `langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langs`
--

LOCK TABLES `langs` WRITE;
/*!40000 ALTER TABLE `langs` DISABLE KEYS */;
INSERT INTO `langs` VALUES (1,'ar','key','مفتاح'),(2,'en','key','key'),(3,'fr','key','key'),(4,'tr','key','key'),(5,'ar','language','اللغة'),(6,'en','language','language'),(7,'fr','language','language'),(8,'tr','language','language'),(9,'ar','Table langs','جدول اللغات'),(10,'en','Table langs','Table langs'),(11,'fr','Table langs','Table langs'),(12,'tr','Table langs','Table langs'),(13,'ar','value','القيمة'),(14,'en','value','value'),(15,'fr','value','value'),(16,'tr','value','value'),(17,'ar','actions','العمليات'),(18,'en','actions','Actions'),(19,'fr','actions','Actions'),(20,'tr','actions','Actions'),(21,'ar','Langs','اللغات'),(22,'en','Langs','Langs'),(23,'fr','Langs','Langs'),(24,'tr','Langs','Langs'),(25,'ar','add','إضافة'),(26,'en','add','add'),(27,'fr','add','add'),(28,'tr','add','add'),(29,'ar','Login In','تسجيل الدخول'),(30,'en','Login In','Login In'),(31,'fr','Login In','Login In'),(32,'tr','Login In','Login In'),(33,'ar','list','قائمة'),(34,'en','list','list'),(35,'fr','list','list'),(36,'tr','list','list'),(37,'ar','users','المستخدمون'),(38,'en','users','users'),(39,'fr','users','users'),(40,'tr','users','users'),(41,'ar','pages','الصفحات'),(42,'en','pages','pages'),(43,'fr','pages','pages'),(44,'tr','pages','pages'),(45,'ar','roles','أدوار النظام'),(46,'en','roles','roles'),(47,'fr','roles','roles'),(48,'tr','roles','roles'),(49,'ar','permissions','الأذونات'),(50,'en','permissions','permissions'),(51,'fr','permissions','permissions'),(52,'tr','permissions','permissions'),(53,'ar','translates','الترجمات'),(54,'en','translates','translates'),(55,'fr','translates','translates'),(56,'tr','translates','translates'),(57,'ar','name','الاسم'),(58,'en','name','name'),(59,'fr','name','name'),(60,'tr','name','name'),(61,'ar','id','الرقم التسلسلي'),(62,'en','id','id'),(63,'fr','id','id'),(64,'tr','id','id'),(65,'ar','table','جدول'),(66,'en','table','table'),(67,'fr','table','table'),(68,'tr','table','table'),(69,'ar','delete','حذف'),(70,'en','delete','delete'),(71,'fr','delete','delete'),(72,'tr','delete','delete'),(73,'ar','read','قراءة'),(74,'en','read','read'),(75,'fr','read','read'),(76,'tr','read','read'),(77,'ar','create','إنشاء'),(78,'en','create','create'),(79,'fr','create','create'),(80,'tr','create','create'),(81,'ar','update','تعديل'),(82,'en','update','update'),(83,'fr','update','update'),(84,'tr','update','update'),(85,'ar','edit','تعديل'),(86,'en','edit','edit'),(87,'fr','edit','edit'),(88,'tr','edit','edit'),(89,'ar','page','الصفحة'),(90,'en','page','page'),(91,'fr','page','page'),(92,'tr','page','page'),(93,'ar','permission','الصلاحية'),(94,'en','permission','permission'),(95,'fr','permission','permission'),(96,'tr','permission','permission'),(97,'ar','Select Role','اختر الدور'),(98,'en','Select Role','Select Role'),(99,'fr','Select Role','Select Role'),(100,'tr','Select Role','Select Role'),(101,'ar','back','عودة'),(102,'en','back','back'),(103,'fr','back','back'),(104,'tr','back','back'),(105,'ar','email','الإيميل'),(106,'en','email','email'),(107,'fr','email','email'),(108,'tr','email','email'),(109,'ar','gender','الجنس'),(110,'en','gender','gender'),(111,'fr','gender','genre'),(112,'tr','gender','cinsiyet'),(113,'ar','date of birth','تاريخ الميلاد'),(114,'en','date of birth','date_of_birth'),(115,'fr','date of birth','date de naissance'),(116,'tr','date of birth','doğum tarihi'),(117,'ar','role','الدور'),(118,'en','role','Role'),(119,'fr','role','Role'),(120,'tr','role','Role'),(121,'ar','mobile','الهاتف المحمول'),(122,'tr','mobile','Mobil'),(123,'en','mobile','Mobile'),(124,'fr','mobile','Mobile'),(125,'ar','father name','اسم الأب'),(126,'en','father name','father name'),(127,'fr','father name','father name'),(128,'tr','father name','father name'),(129,'ar','order','الترتيب'),(130,'en','order','order'),(131,'fr','order','order'),(132,'tr','order','order'),(133,'ar','path','المسار'),(134,'en','path','path'),(135,'fr','path','path'),(136,'tr','path','path'),(137,'ar','icon','الإيقونة'),(138,'en','icon','icon'),(139,'fr','icon','icon'),(140,'tr','icon','icon'),(141,'ar','page_id','القائمة الرئيسية'),(142,'en','page_id','page_id'),(143,'fr','page_id','page_id'),(144,'tr','page_id','page_id'),(145,'ar','profile','الملف الشخصي'),(146,'en','profile','profile'),(147,'fr','profile','profile'),(148,'tr','profile','profile'),(149,'ar','save','حفظ'),(150,'en','save','save'),(151,'fr','save','save'),(152,'tr','save','save'),(153,'ar','change password','تغير كلمة المرور'),(154,'en','change password','change password'),(155,'fr','change password','change password'),(156,'tr','change password','change password'),(157,'ar','photo','الصورة'),(158,'en','photo','photo'),(159,'fr','photo','photo'),(160,'tr','photo','photo');
/*!40000 ALTER TABLE `langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2014_10_12_000000_create_users_table-photo',2),(6,'2014_10_12_000000_create_user_photos_table-copy',3),(7,'2014_10_12_000000_create_users_table-others-copy',4),(8,'2014_10_12_000000_create_users_table-role_id-copy',5),(9,'2023_09_03_075620_create_roles_table',5),(10,'2023_09_03_075748_create_pages_table',5),(11,'2023_09_03_080351_create_permissions_table',5),(13,'2023_09_03_075620_create_langs_table-copy',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa-solid fa-file',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `order` int NOT NULL DEFAULT '1',
  `page_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'users','fa fa-user-circle','/users',2,5,'2023-09-03 05:34:57','2023-09-03 07:48:19'),(2,'pages','fas fa-fw  fa-id-badge','/pages',3,5,'2023-09-03 05:40:01','2023-09-16 06:07:08'),(3,'roles','fas fa-fw  fa-id-badge','/roles',3,0,'2023-09-03 06:20:13','2023-09-16 06:06:54'),(5,'list','fa fa-list-alt','#',1,0,'2023-09-03 07:39:27','2023-09-17 05:41:47'),(6,'permissions','fas fa-fw  fa-id-badge','/permissions',5,0,'2023-09-03 07:45:19','2023-09-03 07:47:32'),(7,'translates','fa fa-language','/translates',7,0,'2023-09-17 03:54:41','2023-09-17 05:42:22');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `page_id` int NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `create` tinyint(1) NOT NULL DEFAULT '0',
  `update` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,5,1,1,1,0,0,'2023-09-03 08:11:34','2023-09-18 16:07:58'),(2,1,1,1,1,1,1,1,'2023-09-03 08:12:52','2023-09-04 16:21:22'),(3,1,3,1,1,1,1,1,'2023-09-03 08:13:28','2023-09-04 16:21:56'),(4,1,6,1,1,1,1,1,'2023-09-03 08:13:28','2023-09-03 09:16:07'),(5,1,2,1,1,1,1,1,'2023-09-03 08:14:47','2023-09-04 16:21:55'),(6,2,5,1,0,0,0,0,'2023-09-03 09:00:50','2023-09-03 09:00:50'),(7,2,1,1,0,0,0,0,'2023-09-03 09:00:51','2023-09-03 09:00:51'),(8,2,2,1,0,0,0,0,'2023-09-03 09:00:52','2023-09-04 16:22:19'),(9,2,3,1,0,0,0,0,'2023-09-03 09:00:54','2023-09-03 09:00:54'),(10,2,6,1,0,0,0,0,'2023-09-03 09:00:54','2023-12-24 15:54:33'),(11,1,7,1,1,1,1,0,'2023-09-17 03:54:51','2023-09-17 03:54:55');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','29a7a48deeb95fcb45fcb5300ce83539d2091d0fb6fca08cfc5d25b3970d3122','[\"*\"]',NULL,NULL,'2023-08-03 17:03:59','2023-08-03 17:03:59'),(2,'App\\Models\\User',2,'auth_token','e681af9fc5b5253e4090a3bab9b8630e2fd6a09e35cd031c1c8553bf79da623f','[\"*\"]','2023-08-07 13:32:17',NULL,'2023-08-03 17:05:47','2023-08-07 13:32:17'),(3,'App\\Models\\User',1,'auth_token','ba3468f9a6e575f7b423c49891700ff34b20a3802c6f76105ad0da69c8bd839d','[\"*\"]',NULL,NULL,'2023-08-04 14:20:01','2023-08-04 14:20:01'),(11,'App\\Models\\User',1,'auth_token','94760fcc1105ec7682ed25bf2e3d8fc507b783dbea32928ba9984ec10f93277a','[\"*\"]','2023-08-06 14:41:24',NULL,'2023-08-06 14:26:47','2023-08-06 14:41:24'),(12,'App\\Models\\User',1,'auth_token','dc134fbbf99af36e9d6e328c4eb58821a9bad8ec116329fe278d15add4f446b2','[\"*\"]','2023-08-09 00:39:41',NULL,'2023-08-08 12:48:11','2023-08-09 00:39:41'),(15,'App\\Models\\User',1,'auth_token','dd277ff2438fa6b1897f6db8ed2b15ac5bb77ad6bdf937cdc104a1de9bc26cf2','[\"*\"]','2023-08-12 03:55:42',NULL,'2023-08-12 03:37:08','2023-08-12 03:55:42'),(16,'App\\Models\\User',1,'auth_token','cc98a9c336eadc473c2316a9ddc09b5e3b36b806381c7e48f479acc5bb7d858f','[\"*\"]','2023-08-25 12:07:47',NULL,'2023-08-25 11:48:38','2023-08-25 12:07:47'),(17,'App\\Models\\User',1,'auth_token','12933bbab1fc92eed731217c3112ffbf7a3683cbb09a42a9f3d1bb4fc735b022','[\"*\"]','2023-08-26 05:30:30',NULL,'2023-08-26 05:16:34','2023-08-26 05:30:30'),(18,'App\\Models\\User',1,'auth_token','6e98951301cecac6743b8ea1941529f23609c40ccdcb35e8b1ab72e191fb7b95','[\"*\"]','2023-08-27 17:12:12',NULL,'2023-08-27 15:46:23','2023-08-27 17:12:12'),(19,'App\\Models\\User',1,'auth_token','1a19e279bd4f86252aebd0c8721d28047842dbcc15d2483b7c3d2eafb3bc9b38','[\"*\"]','2023-09-03 06:31:51',NULL,'2023-09-03 04:27:42','2023-09-03 06:31:51'),(22,'App\\Models\\User',1,'auth_token','3164879e897e7ad693cc5817011d7988b7f4903312fc2858dbf35fe889c3a207','[\"*\"]','2023-09-04 16:22:29',NULL,'2023-09-03 09:08:33','2023-09-04 16:22:29'),(26,'App\\Models\\User',1,'auth_token','f5d0e678bd68cd99d780a5fbda231b8401f02aaa85cad15a1c0031ff1ecf9c9c','[\"*\"]','2023-09-16 14:31:09',NULL,'2023-09-16 11:54:00','2023-09-16 14:31:09'),(27,'App\\Models\\User',1,'auth_token','e2528d1e74f8efb371c95776a53f2287a443d7a225f9594644b7b2f6c4a8b05b','[\"*\"]','2023-09-16 15:13:19',NULL,'2023-09-16 14:31:11','2023-09-16 15:13:19'),(28,'App\\Models\\User',1,'auth_token','7b760804c09b6a1e4253e147838ce574b3c360e38de7692c86929019634831e5','[\"*\"]','2023-09-17 03:45:43',NULL,'2023-09-17 03:20:02','2023-09-17 03:45:43'),(31,'App\\Models\\User',1,'auth_token','902fee36dde9a9e084d1df3d5d6f566984eee55f812a821b99f7092f4057fdd9','[\"*\"]','2023-09-17 11:16:07',NULL,'2023-09-17 07:16:40','2023-09-17 11:16:07'),(33,'App\\Models\\User',1,'auth_token','21624f464bfbd5d4d7d981ced162b28f31fdf2d4b604ceaaeab1284e75cb6dee','[\"*\"]','2023-09-19 13:26:54',NULL,'2023-09-18 16:09:37','2023-09-19 13:26:54'),(38,'App\\Models\\User',1,'auth_token','20323b0062f8f4e7152455bd7123d1b3776f019779a106108fa655ba8578095a','[\"*\"]','2023-12-26 00:50:25',NULL,'2023-12-24 14:44:55','2023-12-26 00:50:25');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2023-09-03 05:56:35','2023-09-03 07:23:54'),(2,'user','2023-09-03 09:00:30','2023-09-03 09:00:30');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_photos`
--

DROP TABLE IF EXISTS `user_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_photos`
--

LOCK TABLES `user_photos` WRITE;
/*!40000 ALTER TABLE `user_photos` DISABLE KEYS */;
INSERT INTO `user_photos` VALUES (2,'1691821542.png',1),(3,'1691822838.png',1),(4,'1691823324.png',1);
/*!40000 ALTER TABLE `user_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `father_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'omar hasan','hasssa22@gma.com',NULL,'$2y$10$Xl941bnzkhrdTgGVev9QEeaNe8yXwg1tcClxaJLevGDS7QNbaoHra',NULL,'2023-08-03 17:03:59','2023-12-25 14:37:18','1691823324.png','ذكر',5567767571,'maher',1990,1),(2,'omar2','safa@kksfsdf.com',NULL,'$2y$10$Eih2DyBqJWMIRW.0o.S4IurD0Yd7WS74UmQYNhLwhvYQqMrmMdc9G',NULL,'2023-08-03 17:05:47','2023-09-18 17:15:20',NULL,'ذكر',90352352353,'gc',1987,2),(3,'ksadasdas','g@safa.com',NULL,'$2y$10$OhiN2GLdQU/eeLYalIdY/uFBDBn8LfvSWCSImd1.x0rwNBWZGymsy',NULL,'2023-08-27 16:08:42','2023-08-27 16:08:42',NULL,'ذكر',903984342,'fdsfasfsaf',1988,NULL);
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

-- Dump completed on 2023-12-26  6:53:32
