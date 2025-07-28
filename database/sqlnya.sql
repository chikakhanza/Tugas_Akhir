/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 8.0.30 : Database - tugaskelompok
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tugaskelompok` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tugaskelompok`;

/*Table structure for table `booking_homestay` */

DROP TABLE IF EXISTS `booking_homestay`;

CREATE TABLE `booking_homestay` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `homestay_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_homestay_booking_id_foreign` (`booking_id`),
  KEY `booking_homestay_homestay_id_foreign` (`homestay_id`),
  CONSTRAINT `booking_homestay_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_homestay_homestay_id_foreign` FOREIGN KEY (`homestay_id`) REFERENCES `homestays` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `booking_homestay` */

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `homestay_id` bigint unsigned NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `jumlah_kamar` int NOT NULL,
  `total_hari` int NOT NULL,
  `keterlambatan` int NOT NULL DEFAULT '0',
  `denda` int NOT NULL DEFAULT '0',
  `total_bayar` int NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_homestay_id_foreign` (`homestay_id`),
  CONSTRAINT `bookings_homestay_id_foreign` FOREIGN KEY (`homestay_id`) REFERENCES `homestays` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bookings` */

insert  into `bookings`(`id`,`user_id`,`homestay_id`,`check_in`,`check_out`,`jumlah_kamar`,`total_hari`,`keterlambatan`,`denda`,`total_bayar`,`catatan`,`created_at`,`updated_at`) values (1,1,1,'2025-07-02','2025-07-03',5,1,0,0,2500000,NULL,'2025-07-22 10:43:44','2025-07-22 10:43:44'),(2,1,1,'2025-07-24','2025-07-25',5,1,0,0,2500000,NULL,'2025-07-22 10:46:13','2025-07-22 10:46:13'),(5,1,1,'2025-07-26','2025-07-27',1,1,0,0,500000,NULL,'2025-07-25 04:03:20','2025-07-25 04:03:20'),(10,1,1,'2025-07-28','2025-07-29',1,1,2,100000,600000,NULL,'2025-07-27 14:58:15','2025-07-27 14:58:15'),(11,1,2,'2025-07-28','2025-07-29',1,1,0,0,1000000,NULL,'2025-07-27 16:58:10','2025-07-27 16:58:10'),(12,1,2,'2025-07-29','2025-07-30',1,1,0,0,1000000,NULL,'2025-07-27 17:11:01','2025-07-27 17:11:01'),(13,1,1,'2025-07-29','2025-07-30',1,1,0,0,500000,NULL,'2025-07-27 18:08:51','2025-07-27 18:08:51'),(14,1,1,'2025-07-29','2025-07-30',1,1,0,0,500000,NULL,'2025-07-27 18:14:09','2025-07-27 18:14:09'),(15,1,1,'2025-07-29','2025-07-30',1,1,0,0,500000,NULL,'2025-07-27 18:19:09','2025-07-27 18:19:09');

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cache_locks` */

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

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

/*Data for the table `failed_jobs` */

/*Table structure for table `homestays` */

DROP TABLE IF EXISTS `homestays`;

CREATE TABLE `homestays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_sewa_per_hari` int NOT NULL,
  `fasilitas` text COLLATE utf8mb4_unicode_ci,
  `jumlah_kamar` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homestays_kode_unique` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `homestays` */

insert  into `homestays`(`id`,`kode`,`tipe_kamar`,`harga_sewa_per_hari`,`fasilitas`,`jumlah_kamar`,`created_at`,`updated_at`) values (1,'001','Standard',500000,'wifi,tv',0,'2025-07-22 10:43:00','2025-07-27 18:19:09'),(2,'002','Deluxe',1000000,'wifi,tv,bethup',7,'2025-07-22 10:48:18','2025-07-27 17:11:01'),(3,'003','Suite',1500000,'WIFI,AC,TV,KAMAR MANDI+AIR PANAS',5,'2025-07-22 10:48:49','2025-07-27 14:55:53');

/*Table structure for table `job_batches` */

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2025_06_28_033933_create_personal_access_tokens_table',1),(4,'2025_06_28_042441_create_users_table',1),(5,'2025_06_29_034414_create_homestays_table',1),(6,'2025_06_29_041524_create_bookings_table',1),(7,'2025_06_29_052557_create_payments_table',1),(8,'2025_07_22_195904_create_booking_homestay_table',2),(9,'2025_07_23_084313_create_booking_homestay_table',3);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `metode_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `jumlah_dibayar` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_booking_id_foreign` (`booking_id`),
  CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `payments` */

insert  into `payments`(`id`,`booking_id`,`metode_pembayaran`,`tanggal_pembayaran`,`jumlah_dibayar`,`created_at`,`updated_at`) values (1,1,'qris','2025-07-17',2500000,'2025-07-22 10:44:01','2025-07-22 10:44:01'),(2,10,'qris','2025-07-27',600000,'2025-07-27 14:58:28','2025-07-27 14:58:28');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (1,'App\\Models\\User',1,'token_login','ac97915282e8e493b6be8e194498d06566f7d94ece2933e24578cda2f6409789','[\"*\"]',NULL,NULL,'2025-07-27 07:34:38','2025-07-27 07:34:38'),(2,'App\\Models\\User',1,'token_login','5847ff0e6779f55a211ab324c8f7bc2c667ab1d988bedde7c63270dbeb0155c0','[\"*\"]',NULL,NULL,'2025-07-27 07:35:10','2025-07-27 07:35:10'),(3,'App\\Models\\User',1,'token_login','b797f3c07592cfa236dee22d3990dd4e82d137464e1941a9e9b687f670b9599c','[\"*\"]',NULL,NULL,'2025-07-27 07:36:50','2025-07-27 07:36:50'),(4,'App\\Models\\User',1,'token_login','95acb244f95172128f9e11502997d99a914bd150aed1f5ddab0d5e662b1fdc9e','[\"*\"]',NULL,NULL,'2025-07-27 07:36:51','2025-07-27 07:36:51'),(5,'App\\Models\\User',1,'token_login','574b45529529bbcb8b120307f62ab685ff95886c7b8e0370d7f2e9a27e7b946d','[\"*\"]',NULL,NULL,'2025-07-27 07:36:52','2025-07-27 07:36:52'),(6,'App\\Models\\User',1,'token_login','aaebeb30e6b5aef4e2740dfc9c54fd9e6461eb50c9000a7a73433488deffd499','[\"*\"]',NULL,NULL,'2025-07-27 07:36:53','2025-07-27 07:36:53'),(7,'App\\Models\\User',1,'token_login','7281f4db3ddc0f4393af6a36e39959aa5205789e02d85559990de44ed85d4398','[\"*\"]',NULL,NULL,'2025-07-27 07:36:53','2025-07-27 07:36:53'),(8,'App\\Models\\User',1,'token_login','8cc92ca0c3c5caed87595bb8f995a91e458768dda31d5ece604a4777b07a86b9','[\"*\"]',NULL,NULL,'2025-07-27 07:36:54','2025-07-27 07:36:54'),(9,'App\\Models\\User',1,'token_login','616b3861f46d801f289343396df0c946cfa5c94523b5120c45902f03a981b37d','[\"*\"]',NULL,NULL,'2025-07-27 07:36:55','2025-07-27 07:36:55'),(10,'App\\Models\\User',1,'token_login','e881e010568218d1c416470ba607ef95a40a3eccc958c871adaae5d772472d9a','[\"*\"]',NULL,NULL,'2025-07-27 07:38:48','2025-07-27 07:38:48'),(11,'App\\Models\\User',1,'token_login','09859ed4c770f5f533ad91ba84372f0b85f9d11eb0a03e44f5e7aa4c8ee82a91','[\"*\"]',NULL,NULL,'2025-07-27 07:40:10','2025-07-27 07:40:10'),(12,'App\\Models\\User',1,'token_login','a96a456907d700d17a90ffe788f778a9fa55e822d8e1307697b46d0c4a26a15f','[\"*\"]',NULL,NULL,'2025-07-27 07:45:55','2025-07-27 07:45:55'),(13,'App\\Models\\User',1,'token_login','e604e57b72a4a8205ae49daa3e9f83c883db2019dfa0f0947ceee8082bc39d35','[\"*\"]',NULL,NULL,'2025-07-27 08:07:26','2025-07-27 08:07:26'),(14,'App\\Models\\User',1,'token_login','ab6c44ee100be67d2d7ef681c07861058a7d4e26869530a7e2fd6516202829b2','[\"*\"]',NULL,NULL,'2025-07-27 08:08:06','2025-07-27 08:08:06'),(15,'App\\Models\\User',1,'token_login','021d7c2c80ce105a3f83183fbd4d701b0e76a86c06ada57f2f2b1b3a64728b2f','[\"*\"]',NULL,NULL,'2025-07-27 08:12:37','2025-07-27 08:12:37'),(16,'App\\Models\\User',1,'token_login','f7395cf19fe2dce21cf2091054accf8c656d88d43be61dbac2176d14b55e8717','[\"*\"]',NULL,NULL,'2025-07-27 08:23:53','2025-07-27 08:23:53'),(17,'App\\Models\\User',1,'token_login','75834a529d30bd2a4a138afb5880b3298258ae98b074a64fe2666bde616de3bd','[\"*\"]',NULL,NULL,'2025-07-27 08:28:11','2025-07-27 08:28:11'),(18,'App\\Models\\User',1,'token_login','3308d6e0728af979037b68574aa10eab093ecf32eedf9bb6ddc188694a439107','[\"*\"]',NULL,NULL,'2025-07-27 13:31:20','2025-07-27 13:31:20'),(19,'App\\Models\\User',1,'token_login','50df5ee94fe09e94aa3a62bcfc5bee5e70a1d59fca704a7ad9a02f243efc45f0','[\"*\"]',NULL,NULL,'2025-07-27 14:25:04','2025-07-27 14:25:04'),(20,'App\\Models\\User',1,'token_login','f8b189d3d74d08c968ae9d16c1f13ff0d8c4462e11f811be0b8d1cc5325e4863','[\"*\"]',NULL,NULL,'2025-07-27 14:28:04','2025-07-27 14:28:04'),(21,'App\\Models\\User',1,'token_login','5352bbbb10166dcf38573fdbe2ffa1d8556afbef38b726325940d31da68fb606','[\"*\"]',NULL,NULL,'2025-07-27 14:33:25','2025-07-27 14:33:25'),(22,'App\\Models\\User',1,'token_login','1cb5a5227e99ac45a396017f30669d3e97d52139289ddad2c4ab14841569ccbd','[\"*\"]',NULL,NULL,'2025-07-27 14:57:52','2025-07-27 14:57:52'),(23,'App\\Models\\User',1,'token_login','8fc56fe17d40da1f2c84d7861a06cc32c6acc719926cf6309e0d1136b6bbc077','[\"*\"]',NULL,NULL,'2025-07-27 15:31:32','2025-07-27 15:31:32'),(24,'App\\Models\\User',1,'token_login','313ffd4de0f27721d0473cf1037310908e74527595ca4e7d5de508ff05424307','[\"*\"]',NULL,NULL,'2025-07-27 15:34:46','2025-07-27 15:34:46'),(25,'App\\Models\\User',1,'token_login','4c9f0d6645752b324a8b6076be02ec113c277eec727b0219444984cdbe7f92b5','[\"*\"]',NULL,NULL,'2025-07-27 15:35:18','2025-07-27 15:35:18'),(26,'App\\Models\\User',1,'token_login','decc153b7eb48ee96bbd1c6d1215051c8b6e95d1e9ad18317e34a689037ad165','[\"*\"]',NULL,NULL,'2025-07-27 16:30:07','2025-07-27 16:30:07'),(27,'App\\Models\\User',1,'token_login','1b1aabc0892e38d9643c7335fb38e0776c838e8ac3f3cddda010cedac80c0354','[\"*\"]',NULL,NULL,'2025-07-27 16:30:09','2025-07-27 16:30:09'),(28,'App\\Models\\User',1,'token_login','028b4314181b6489b8c64496e2df1130343f6dea667f74a8c2df2dd89ed95530','[\"*\"]',NULL,NULL,'2025-07-27 16:30:30','2025-07-27 16:30:30'),(29,'App\\Models\\User',1,'token_login','eac4c9300608e88a26520c83241036dba88973ef6122e58d940f5a653e771c07','[\"*\"]',NULL,NULL,'2025-07-27 16:57:39','2025-07-27 16:57:39'),(30,'App\\Models\\User',1,'token_login','21e05d72ef2dbd7ab3e5d6533c861d778957e0987bcca06de048fd3faf627b64','[\"*\"]',NULL,NULL,'2025-07-27 17:01:12','2025-07-27 17:01:12'),(31,'App\\Models\\User',1,'token_login','025fbc9139ba2a6553dfa7ffdd2754dc3b46797bb29b890145963d154e8d946c','[\"*\"]',NULL,NULL,'2025-07-27 17:09:15','2025-07-27 17:09:15'),(32,'App\\Models\\User',1,'token_login','4c9c3bf340fb30cfbd212b1ca8913fedcb909627db6a88e2e448469e6f7e7869','[\"*\"]',NULL,NULL,'2025-07-27 18:08:23','2025-07-27 18:08:23'),(33,'App\\Models\\User',1,'token_login','ac31be5d5332544144bd5494e4496989b65007d67d6a06fe2b1e972c1c72111f','[\"*\"]',NULL,NULL,'2025-07-27 18:13:44','2025-07-27 18:13:44'),(34,'App\\Models\\User',1,'token_login','5695850785551f64a915c2c838018979914490ec212d78dc50ed54e159aed171','[\"*\"]',NULL,NULL,'2025-07-27 18:18:51','2025-07-27 18:18:51');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('ILhMVXPJ0xae4pJTq2YMAxMfGkXVTdz6uNmmJbe3',1,'10.41.30.171','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTUFwbXY1UzI0U2VTRnVUT2oxZHhWMTN2eFpabjN1SFFhZGN6Q0tMMSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI0OiJodHRwOi8vMTAuNDEuMzAuMTcxOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1753665919),('j16V7jAaWI49ha0EIeYvbtg8J3boTZghmMHJcUhv',1,'10.41.30.171','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQWZYOXVQNnJDWEQ2SjB1YngwOUg2MDdidHBCYjgybWZONWwwdmJ0TSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI0OiJodHRwOi8vMTAuNDEuMzAuMTcxOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1753639461),('rqjilQ8wLfV4P8TjgmQFfLmh8GCkTmipb5d4UCeN',1,'192.168.1.206','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU1VNa0dBQ240MktPcDBpZ0p1UEh0YkJvSXh0SHVwSUNhdG9yUGZmYSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vMTkyLjE2OC4xLjIwNjo4MDAwL2Jvb2tpbmdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1753622656);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'Chika','chika@gmail.com','2025-07-19 18:00:49','$2y$12$gV0wTM6dQO4ijHXV4r13qeINHHmeTuVfozQPnEe4gAqehMaM4MUR6','Eag7OoUsqoiHj6EvjA8zQhNS27t7uRFjo2QwuOhHv1pBxCide00zjmqCJmpn','2025-07-19 18:00:50','2025-07-19 18:00:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
