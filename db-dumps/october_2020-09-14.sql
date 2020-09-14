# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.21)
# Database: october
# Generation Time: 2020-09-14 12:11:09 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table backend_access_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_access_log`;

CREATE TABLE `backend_access_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`)
VALUES
	(1,1,'127.0.0.1','2020-09-12 21:35:26','2020-09-12 21:35:26');

/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table backend_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_user_groups`;

CREATE TABLE `backend_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`)
VALUES
	(1,'Owners','2020-09-12 21:35:20','2020-09-12 21:35:20','owners','Default group for website owners.',0);

/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table backend_user_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_user_preferences`;

CREATE TABLE `backend_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table backend_user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_user_roles`;

CREATE TABLE `backend_user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backend_user_roles` WRITE;
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`)
VALUES
	(1,'Publisher','publisher','Site editor with access to publishing tools.','',1,'2020-09-12 21:35:20','2020-09-12 21:35:20'),
	(2,'Developer','developer','Site administrator with access to developer tools.','',1,'2020-09-12 21:35:20','2020-09-12 21:35:20');

/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table backend_user_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_user_throttle`;

CREATE TABLE `backend_user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`)
VALUES
	(1,1,'127.0.0.1',0,NULL,0,NULL,0,NULL);

/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table backend_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_users`;

CREATE TABLE `backend_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`)
VALUES
	(1,'Admin','Person','admin','admin@domain.tld','$2y$10$IS4FU7UnILEE3OgBWc7dd.gWibeU5E3O0qvAMNLbRW/Gix4Lwz6GK',NULL,'$2y$10$ygF42vvd0DwGus/DXEKAdOCYDkPzh/AAkSMTh2/SWEa01N6SoPr5y',NULL,'',1,2,NULL,'2020-09-12 21:35:26','2020-09-12 21:35:20','2020-09-12 21:35:26',NULL,1);

/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table backend_users_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_users_groups`;

CREATE TABLE `backend_users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_theme_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_theme_data`;

CREATE TABLE `cms_theme_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_theme_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_theme_logs`;

CREATE TABLE `cms_theme_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_theme_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_theme_templates`;

CREATE TABLE `cms_theme_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table deferred_bindings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deferred_bindings`;

CREATE TABLE `deferred_bindings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2013_10_01_000001_Db_Deferred_Bindings',1),
	(2,'2013_10_01_000002_Db_System_Files',1),
	(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),
	(4,'2013_10_01_000004_Db_System_Plugin_History',1),
	(5,'2013_10_01_000005_Db_System_Settings',1),
	(6,'2013_10_01_000006_Db_System_Parameters',1),
	(7,'2013_10_01_000007_Db_System_Add_Disabled_Flag',1),
	(8,'2013_10_01_000008_Db_System_Mail_Templates',1),
	(9,'2013_10_01_000009_Db_System_Mail_Layouts',1),
	(10,'2014_10_01_000010_Db_Jobs',1),
	(11,'2014_10_01_000011_Db_System_Event_Logs',1),
	(12,'2014_10_01_000012_Db_System_Request_Logs',1),
	(13,'2014_10_01_000013_Db_System_Sessions',1),
	(14,'2015_10_01_000014_Db_System_Mail_Layout_Rename',1),
	(15,'2015_10_01_000015_Db_System_Add_Frozen_Flag',1),
	(16,'2015_10_01_000016_Db_Cache',1),
	(17,'2015_10_01_000017_Db_System_Revisions',1),
	(18,'2015_10_01_000018_Db_FailedJobs',1),
	(19,'2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),
	(20,'2016_10_01_000020_Db_System_Timestamp_Fix',1),
	(21,'2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session',1),
	(22,'2017_10_01_000021_Db_System_Sessions_Update',1),
	(23,'2017_10_01_000022_Db_Jobs_FailedJobs_Update',1),
	(24,'2017_10_01_000023_Db_System_Mail_Partials',1),
	(25,'2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field',1),
	(26,'2013_10_01_000001_Db_Backend_Users',2),
	(27,'2013_10_01_000002_Db_Backend_User_Groups',2),
	(28,'2013_10_01_000003_Db_Backend_Users_Groups',2),
	(29,'2013_10_01_000004_Db_Backend_User_Throttle',2),
	(30,'2014_01_04_000005_Db_Backend_User_Preferences',2),
	(31,'2014_10_01_000006_Db_Backend_Access_Log',2),
	(32,'2014_10_01_000007_Db_Backend_Add_Description_Field',2),
	(33,'2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),
	(34,'2016_10_01_000009_Db_Backend_Timestamp_Fix',2),
	(35,'2017_10_01_000010_Db_Backend_User_Roles',2),
	(36,'2018_12_16_000011_Db_Backend_Add_Deleted_At',2),
	(37,'2014_10_01_000001_Db_Cms_Theme_Data',3),
	(38,'2016_10_01_000002_Db_Cms_Timestamp_Fix',3),
	(39,'2017_10_01_000003_Db_Cms_Theme_Logs',3),
	(40,'2018_11_01_000001_Db_Cms_Theme_Templates',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rainlab_user_mail_blockers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rainlab_user_mail_blockers`;

CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table system_event_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_event_logs`;

CREATE TABLE `system_event_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`)
VALUES
	(1,'error','ErrorException: Undefined variable: table in /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/profile/updates/add_profile_fields.php:27\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/profile/updates/add_profile_fields.php(27): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined varia...\', \'/Users/abdullah...\', 27, Array)\n#1 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Database/Updater.php(64): Triangon\\Profile\\Updates\\AddNewFields->down()\n#2 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Database/Concerns/ManagesTransactions.php(29): October\\Rain\\Database\\Updater->October\\Rain\\Database\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection))\n#3 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Database/DatabaseManager.php(349): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#4 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(261): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Database/Updater.php(66): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/VersionManager.php(424): October\\Rain\\Database\\Updater->packDown(\'/Users/abdullah...\')\n#7 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/VersionManager.php(192): System\\Classes\\VersionManager->removeDatabaseScript(\'Triangon.Profil...\', \'1.0.1\', \'add_profile_fie...\')\n#8 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/UpdateManager.php(566): System\\Classes\\VersionManager->removePlugin(Object(Triangon\\Profile\\Plugin), NULL, true)\n#9 /Users/abdullah/www/sandbox/valet/oct/modules/system/Console/PluginRefresh.php(52): System\\Classes\\UpdateManager->rollbackPlugin(\'Triangon.Profil...\')\n#10 [internal function]: System\\Console\\PluginRefresh->handle()\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/symfony/console/Application.php(1005): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/symfony/console/Application.php(271): Symfony\\Component\\Console\\Application->doRunCommand(Object(System\\Console\\PluginRefresh), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/symfony/console/Application.php(147): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 /Users/abdullah/www/sandbox/valet/oct/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}',NULL,'2020-09-13 16:58:19','2020-09-13 16:58:19'),
	(2,'error','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Triangon\\Profile\\UsersController\' not found in /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/profile/Plugin.php:29\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/PluginManager.php(317): Triangon\\Profile\\Plugin->boot()\n#1 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/PluginManager.php(299): System\\Classes\\PluginManager->bootPlugin(Object(Triangon\\Profile\\Plugin))\n#2 /Users/abdullah/www/sandbox/valet/oct/modules/system/ServiceProvider.php(105): System\\Classes\\PluginManager->bootAll()\n#3 [internal function]: System\\ServiceProvider->boot()\n#4 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(856): Illuminate\\Container\\Container->call(Array)\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(839): Illuminate\\Foundation\\Application->bootProvider(Object(System\\ServiceProvider))\n#11 [internal function]: Illuminate\\Foundation\\Application->Illuminate\\Foundation\\{closure}(Object(System\\ServiceProvider), 22)\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(840): array_walk(Array, Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/BootProviders.php(17): Illuminate\\Foundation\\Application->boot()\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Application.php(105): Illuminate\\Foundation\\Bootstrap\\BootProviders->bootstrap(Object(October\\Rain\\Foundation\\Application))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(156): October\\Rain\\Foundation\\Application->bootstrapWith(Array)\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(140): Illuminate\\Foundation\\Http\\Kernel->bootstrap()\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#20 {main}',NULL,'2020-09-13 17:04:11','2020-09-13 17:04:11'),
	(3,'error','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined function Triangon\\Profile\\extendUserFormFields() in /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/profile/Plugin.php:34\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/PluginManager.php(317): Triangon\\Profile\\Plugin->boot()\n#1 /Users/abdullah/www/sandbox/valet/oct/modules/system/Classes/PluginManager.php(299): System\\Classes\\PluginManager->bootPlugin(Object(Triangon\\Profile\\Plugin))\n#2 /Users/abdullah/www/sandbox/valet/oct/modules/system/ServiceProvider.php(105): System\\Classes\\PluginManager->bootAll()\n#3 [internal function]: System\\ServiceProvider->boot()\n#4 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Container/Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(856): Illuminate\\Container\\Container->call(Array)\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(839): Illuminate\\Foundation\\Application->bootProvider(Object(System\\ServiceProvider))\n#11 [internal function]: Illuminate\\Foundation\\Application->Illuminate\\Foundation\\{closure}(Object(System\\ServiceProvider), 22)\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(840): array_walk(Array, Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/BootProviders.php(17): Illuminate\\Foundation\\Application->boot()\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Application.php(105): Illuminate\\Foundation\\Bootstrap\\BootProviders->bootstrap(Object(October\\Rain\\Foundation\\Application))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(156): October\\Rain\\Foundation\\Application->bootstrapWith(Array)\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(140): Illuminate\\Foundation\\Http\\Kernel->bootstrap()\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#20 {main}',NULL,'2020-09-13 17:18:19','2020-09-13 17:18:19'),
	(4,'error','Swift_TransportException: Expected response code 250 but got code \"550\", with message \"550 5.7.1 Relaying denied\r\n\" in /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:457\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(341): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'550 5.7.1 Relay...\', Array)\n#1 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(305): Swift_Transport_AbstractSmtpTransport->executeCommand(\'MAIL FROM:<nore...\', Array, Array, false, NULL)\n#2 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(390): Swift_Transport_EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array, Array)\n#3 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(497): Swift_Transport_AbstractSmtpTransport->doDataCommand(Array)\n#4 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(516): Swift_Transport_AbstractSmtpTransport->doMailTransaction(Object(Swift_Message), \'noreply@domain....\', Array, Array)\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(206): Swift_Transport_AbstractSmtpTransport->sendTo(Object(Swift_Message), \'noreply@domain....\', Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(71): Swift_Transport_AbstractSmtpTransport->send(Object(Swift_Message), Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(488): Swift_Mailer->send(Object(Swift_Message), Array)\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Mail/Mailer.php(115): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(261): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#10 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/Traits/CanSendMail.php(20): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#11 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RegisterController.php(103): RLuders\\JWTAuth\\Http\\Controllers\\RegisterController->sendMail(\'demo@domain.tld\', NULL, \'rainlab.user::m...\', Array)\n#12 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RegisterController.php(51): RLuders\\JWTAuth\\Http\\Controllers\\RegisterController->sendActivationEmail(Object(RLuders\\JWTAuth\\Models\\User))\n#13 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RegisterController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\RegisterRequest))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RegisterController), \'__invoke\')\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#24 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#40 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#41 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#42 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#43 {main}',NULL,'2020-09-13 17:27:46','2020-09-13 17:27:46'),
	(5,'error','Swift_TransportException: Expected response code 220 but got code \"500\", with message \"500 Unrecognised command\r\n\" in /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:457\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(341): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'500 Unrecognise...\', Array)\n#1 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(305): Swift_Transport_AbstractSmtpTransport->executeCommand(\'STARTTLS\\r\\n\', Array, Array, false, NULL)\n#2 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(346): Swift_Transport_EsmtpTransport->executeCommand(\'STARTTLS\\r\\n\', Array)\n#3 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(148): Swift_Transport_EsmtpTransport->doHeloCommand()\n#4 /Users/abdullah/www/sandbox/valet/oct/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(488): Swift_Mailer->send(Object(Swift_Message), Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Mail/Mailer.php(115): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(261): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#8 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/Traits/CanSendMail.php(20): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#9 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RegisterController.php(103): RLuders\\JWTAuth\\Http\\Controllers\\RegisterController->sendMail(\'demo@domain.tld\', \'joe\', \'rainlab.user::m...\', Array)\n#10 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RegisterController.php(51): RLuders\\JWTAuth\\Http\\Controllers\\RegisterController->sendActivationEmail(Object(RLuders\\JWTAuth\\Models\\User))\n#11 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RegisterController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\RegisterRequest))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RegisterController), \'__invoke\')\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#22 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#38 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#39 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#40 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#41 {main}',NULL,'2020-09-13 17:40:23','2020-09-13 17:40:23'),
	(6,'error','ErrorException: compact(): Undefined variable:  in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php:178\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'compact(): Unde...\', \'/Users/abdullah...\', 178, Array)\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(178): compact(Array, \'sub\', \'iat\')\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->buildRefreshClaims(Object(Tymon\\JWTAuth\\Payload))\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#4 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#5 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#16 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#34 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#35 {main}',NULL,'2020-09-13 17:55:58','2020-09-13 17:55:58'),
	(7,'error','Tymon\\JWTAuth\\Exceptions\\TokenInvalidException: Token Signature could not be verified. in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Providers/JWT/Lcobucci.php:137\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(101): Tymon\\JWTAuth\\Providers\\JWT\\Lcobucci->decode(\'eyJ0eXAiOiJKV1Q...\')\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->decode(Object(Tymon\\JWTAuth\\Token))\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#4 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#15 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#34 {main}',NULL,'2020-09-13 18:00:18','2020-09-13 18:00:18'),
	(8,'error','Tymon\\JWTAuth\\Exceptions\\TokenInvalidException: Token Signature could not be verified. in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Providers/JWT/Lcobucci.php:137\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(101): Tymon\\JWTAuth\\Providers\\JWT\\Lcobucci->decode(\'eyJ0eXAiOiJKV1Q...\')\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->decode(Object(Tymon\\JWTAuth\\Token))\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#4 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#15 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#34 {main}',NULL,'2020-09-13 18:00:42','2020-09-13 18:00:42'),
	(9,'error','Tymon\\JWTAuth\\Exceptions\\TokenInvalidException: Token Signature could not be verified. in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Providers/JWT/Lcobucci.php:137\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(101): Tymon\\JWTAuth\\Providers\\JWT\\Lcobucci->decode(\'eyJ0eXAiOiJKV1Q...\')\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->decode(Object(Tymon\\JWTAuth\\Token))\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#4 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#15 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#34 {main}',NULL,'2020-09-13 18:00:56','2020-09-13 18:00:56'),
	(10,'error','Tymon\\JWTAuth\\Exceptions\\TokenInvalidException: Token Signature could not be verified. in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Providers/JWT/Lcobucci.php:137\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(101): Tymon\\JWTAuth\\Providers\\JWT\\Lcobucci->decode(\'eyJ0eXAiOiJKV1Q...\')\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->decode(Object(Tymon\\JWTAuth\\Token))\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#4 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#15 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#34 {main}',NULL,'2020-09-13 18:01:13','2020-09-13 18:01:13'),
	(11,'error','Tymon\\JWTAuth\\Exceptions\\TokenInvalidException: Token Signature could not be verified. in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Providers/JWT/Lcobucci.php:137\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(101): Tymon\\JWTAuth\\Providers\\JWT\\Lcobucci->decode(\'eyJ0eXAiOiJKV1Q...\')\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->decode(Object(Tymon\\JWTAuth\\Token))\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#4 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#15 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#34 {main}',NULL,'2020-09-13 18:02:28','2020-09-13 18:02:28'),
	(12,'error','Tymon\\JWTAuth\\Exceptions\\TokenInvalidException: Token Signature could not be verified. in /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Providers/JWT/Lcobucci.php:137\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(101): Tymon\\JWTAuth\\Providers\\JWT\\Lcobucci->decode(\'eyJ0eXAiOiJKV1Q...\')\n#1 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Manager.php(128): Tymon\\JWTAuth\\Manager->decode(Object(Tymon\\JWTAuth\\Token))\n#2 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/JWT.php(106): Tymon\\JWTAuth\\Manager->refresh(Object(Tymon\\JWTAuth\\Token), \'eyJ0eXAiOiJKV1Q...\', false)\n#3 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/Http/Controllers/RefreshTokenController.php(29): Tymon\\JWTAuth\\JWT->refresh(\'eyJ0eXAiOiJKV1Q...\')\n#4 [internal function]: RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController->__invoke(Object(RLuders\\JWTAuth\\Classes\\JWTAuth), Object(RLuders\\JWTAuth\\Http\\Requests\\TokenRequest))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'__invoke\', Array)\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(RLuders\\JWTAuth\\Http\\Controllers\\RefreshTokenController), \'__invoke\')\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#10 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#15 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#22 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#32 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#33 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#34 {main}',NULL,'2020-09-13 18:04:45','2020-09-13 18:04:45'),
	(13,'error','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Triangon\\Vuerentacar\\Models\\Item\' not found in /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/testdata/routes.php:8\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): System\\Classes\\PluginManager->{closure}()\n#1 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(179): Illuminate\\Routing\\Route->runCallable()\n#2 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#3 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#4 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Http/Middleware/Authenticate.php(32): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Tymon\\JWTAuth\\Http\\Middleware\\Authenticate->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#10 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#27 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#29 {main}',NULL,'2020-09-13 18:17:25','2020-09-13 18:17:25'),
	(14,'error','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Triangon\\Vuerentacar\\Models\\Items\' not found in /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/testdata/routes.php:8\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): System\\Classes\\PluginManager->{closure}()\n#1 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(179): Illuminate\\Routing\\Route->runCallable()\n#2 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#3 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#4 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Http/Middleware/Authenticate.php(32): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Tymon\\JWTAuth\\Http\\Middleware\\Authenticate->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#10 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#27 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#29 {main}',NULL,'2020-09-13 18:17:44','2020-09-13 18:17:44'),
	(15,'error','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Triangon\\Vuerentacar\\Models\\items\' not found in /Users/abdullah/www/sandbox/valet/oct/plugins/triangon/testdata/routes.php:8\nStack trace:\n#0 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): System\\Classes\\PluginManager->{closure}()\n#1 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Route.php(179): Illuminate\\Routing\\Route->runCallable()\n#2 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#3 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#4 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/jwtauth/vendor/tymon/jwt-auth/src/Http/Middleware/Authenticate.php(32): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#5 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Tymon\\JWTAuth\\Http\\Middleware\\Authenticate->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#6 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#7 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#8 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Middleware/ThrottleRequests.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#9 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle(Object(Illuminate\\Http\\Request), Object(Closure), 60, \'1\')\n#10 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandleCors.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandleCors->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#12 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#15 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#16 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#17 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#18 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/abdullah/www/sandbox/valet/oct/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /Users/abdullah/www/sandbox/valet/oct/plugins/rluders/cors/vendor/barryvdh/laravel-cors/src/HandlePreflight.php(29): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Barryvdh\\Cors\\HandlePreflight->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Users/abdullah/www/sandbox/valet/oct/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#27 /Users/abdullah/www/sandbox/valet/oct/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#28 /Users/abdullah/.composer/vendor/laravel/valet/server.php(191): require(\'/Users/abdullah...\')\n#29 {main}',NULL,'2020-09-13 18:18:19','2020-09-13 18:18:19'),
	(16,'error','Symfony\\Component\\Debug\\Exception\\FatalErrorException: Uncaught Error: Class \'App\\Models\\Route\' not found in Command line code:2\nStack trace:\n#0 {main}\n  thrown in Command line code:2\nStack trace:\n#0 {main}',NULL,'2020-09-13 20:39:26','2020-09-13 20:39:26'),
	(17,'error','Symfony\\Component\\Debug\\Exception\\FatalErrorException: Uncaught Error: Class \'App\\Models\\Route\' not found in Command line code:2\nStack trace:\n#0 {main}\n  thrown in Command line code:2\nStack trace:\n#0 {main}',NULL,'2020-09-13 20:39:34','2020-09-13 20:39:34');

/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_files`;

CREATE TABLE `system_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table system_mail_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_mail_layouts`;

CREATE TABLE `system_mail_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2020-09-12 21:35:20','2020-09-12 21:35:20'),
	(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2020-09-12 21:35:20','2020-09-12 21:35:20');

/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_mail_partials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_mail_partials`;

CREATE TABLE `system_mail_partials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_mail_partials` WRITE;
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;

INSERT INTO `system_mail_partials` (`id`, `name`, `code`, `content_html`, `content_text`, `is_custom`, `created_at`, `updated_at`)
VALUES
	(1,'Header','header','<tr>\n    <td class=\"header\">\n        {% if url %}\n            <a href=\"{{ url }}\">\n                {{ body }}\n            </a>\n        {% else %}\n            <span>\n                {{ body }}\n            </span>\n        {% endif %}\n    </td>\n</tr>','*** {{ body|trim }} <{{ url }}>',0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(2,'Footer','footer','<tr>\n    <td>\n        <table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n            <tr>\n                <td class=\"content-cell\" align=\"center\">\n                    {{ body|md_safe }}\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>','-------------------\n{{ body|trim }}',0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(3,'Button','button','<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td align=\"center\">\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                            <tr>\n                                <td>\n                                    <a href=\"{{ url }}\" class=\"button button-{{ type ?: \'primary\' }}\" target=\"_blank\">\n                                        {{ body }}\n                                    </a>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>','{{ body|trim }} <{{ url }}>',0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(4,'Panel','panel','<table class=\"panel break-all\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td class=\"panel-content\">\n            <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td class=\"panel-item\">\n                        {{ body|md_safe }}\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>','{{ body|trim }}',0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(5,'Table','table','<div class=\"table\">\n    {{ body|md_safe }}\n</div>','{{ body|trim }}',0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(6,'Subcopy','subcopy','<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            {{ body|md_safe }}\n        </td>\n    </tr>\n</table>','-----\n{{ body|trim }}',0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(7,'Promotion','promotion','<table class=\"promotion break-all\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            {{ body|md_safe }}\n        </td>\n    </tr>\n</table>','{{ body|trim }}',0,'2020-09-13 17:39:55','2020-09-13 17:39:55');

/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_mail_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_mail_templates`;

CREATE TABLE `system_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;

INSERT INTO `system_mail_templates` (`id`, `code`, `subject`, `description`, `content_html`, `content_text`, `layout_id`, `is_custom`, `created_at`, `updated_at`)
VALUES
	(1,'rainlab.user::mail.activate',NULL,'Activate a new user',NULL,NULL,1,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(2,'rainlab.user::mail.welcome',NULL,'User confirmed their account',NULL,NULL,1,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(3,'rainlab.user::mail.restore',NULL,'User requests a password reset',NULL,NULL,1,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(4,'rainlab.user::mail.new_user',NULL,'Notify admins of a new sign up',NULL,NULL,2,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(5,'rainlab.user::mail.reactivate',NULL,'User has reactivated their account',NULL,NULL,1,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(6,'rainlab.user::mail.invite',NULL,'Invite a new user to the website',NULL,NULL,1,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(7,'backend::mail.invite',NULL,'Invite new admin to the site',NULL,NULL,2,0,'2020-09-13 17:39:55','2020-09-13 17:39:55'),
	(8,'backend::mail.restore',NULL,'Reset an admin password',NULL,NULL,2,0,'2020-09-13 17:39:55','2020-09-13 17:39:55');

/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_parameters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_parameters`;

CREATE TABLE `system_parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`)
VALUES
	(1,'system','update','count','0'),
	(2,'system','update','retry','1600032928');

/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_plugin_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_plugin_history`;

CREATE TABLE `system_plugin_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`)
VALUES
	(1,'RainLab.User','script','1.0.1','create_users_table.php','2020-09-13 16:27:28'),
	(2,'RainLab.User','script','1.0.1','create_throttle_table.php','2020-09-13 16:27:28'),
	(3,'RainLab.User','comment','1.0.1','Initialize plugin.','2020-09-13 16:27:28'),
	(4,'RainLab.User','comment','1.0.2','Seed tables.','2020-09-13 16:27:28'),
	(5,'RainLab.User','comment','1.0.3','Translated hard-coded text to language strings.','2020-09-13 16:27:28'),
	(6,'RainLab.User','comment','1.0.4','Improvements to user-interface for Location manager.','2020-09-13 16:27:28'),
	(7,'RainLab.User','comment','1.0.5','Added contact details for users.','2020-09-13 16:27:28'),
	(8,'RainLab.User','script','1.0.6','create_mail_blockers_table.php','2020-09-13 16:27:28'),
	(9,'RainLab.User','comment','1.0.6','Added Mail Blocker utility so users can block specific mail templates.','2020-09-13 16:27:28'),
	(10,'RainLab.User','comment','1.0.7','Add back-end Settings page.','2020-09-13 16:27:28'),
	(11,'RainLab.User','comment','1.0.8','Updated the Settings page.','2020-09-13 16:27:28'),
	(12,'RainLab.User','comment','1.0.9','Adds new welcome mail message for users and administrators.','2020-09-13 16:27:28'),
	(13,'RainLab.User','comment','1.0.10','Adds administrator-only activation mode.','2020-09-13 16:27:28'),
	(14,'RainLab.User','script','1.0.11','users_add_login_column.php','2020-09-13 16:27:28'),
	(15,'RainLab.User','comment','1.0.11','Users now have an optional login field that defaults to the email field.','2020-09-13 16:27:28'),
	(16,'RainLab.User','script','1.0.12','users_rename_login_to_username.php','2020-09-13 16:27:28'),
	(17,'RainLab.User','comment','1.0.12','Create a dedicated setting for choosing the login mode.','2020-09-13 16:27:28'),
	(18,'RainLab.User','comment','1.0.13','Minor fix to the Account sign in logic.','2020-09-13 16:27:28'),
	(19,'RainLab.User','comment','1.0.14','Minor improvements to the code.','2020-09-13 16:27:28'),
	(20,'RainLab.User','script','1.0.15','users_add_surname.php','2020-09-13 16:27:28'),
	(21,'RainLab.User','comment','1.0.15','Adds last name column to users table (surname).','2020-09-13 16:27:28'),
	(22,'RainLab.User','comment','1.0.16','Require permissions for settings page too.','2020-09-13 16:27:28'),
	(23,'RainLab.User','comment','1.1.0','!!! Profile fields and Locations have been removed.','2020-09-13 16:27:28'),
	(24,'RainLab.User','script','1.1.1','create_user_groups_table.php','2020-09-13 16:27:28'),
	(25,'RainLab.User','script','1.1.1','seed_user_groups_table.php','2020-09-13 16:27:28'),
	(26,'RainLab.User','comment','1.1.1','Users can now be added to groups.','2020-09-13 16:27:28'),
	(27,'RainLab.User','comment','1.1.2','A raw URL can now be passed as the redirect property in the Account component.','2020-09-13 16:27:28'),
	(28,'RainLab.User','comment','1.1.3','Adds a super user flag to the users table, reserved for future use.','2020-09-13 16:27:28'),
	(29,'RainLab.User','comment','1.1.4','User list can be filtered by the group they belong to.','2020-09-13 16:27:28'),
	(30,'RainLab.User','comment','1.1.5','Adds a new permission to hide the User settings menu item.','2020-09-13 16:27:28'),
	(31,'RainLab.User','script','1.2.0','users_add_deleted_at.php','2020-09-13 16:27:28'),
	(32,'RainLab.User','comment','1.2.0','Users can now deactivate their own accounts.','2020-09-13 16:27:28'),
	(33,'RainLab.User','comment','1.2.1','New feature for checking if a user is recently active/online.','2020-09-13 16:27:28'),
	(34,'RainLab.User','comment','1.2.2','Add bulk action button to user list.','2020-09-13 16:27:28'),
	(35,'RainLab.User','comment','1.2.3','Included some descriptive paragraphs in the Reset Password component markup.','2020-09-13 16:27:28'),
	(36,'RainLab.User','comment','1.2.4','Added a checkbox for blocking all mail sent to the user.','2020-09-13 16:27:28'),
	(37,'RainLab.User','script','1.2.5','update_timestamp_nullable.php','2020-09-13 16:27:28'),
	(38,'RainLab.User','comment','1.2.5','Database maintenance. Updated all timestamp columns to be nullable.','2020-09-13 16:27:28'),
	(39,'RainLab.User','script','1.2.6','users_add_last_seen.php','2020-09-13 16:27:28'),
	(40,'RainLab.User','comment','1.2.6','Add a dedicated last seen column for users.','2020-09-13 16:27:28'),
	(41,'RainLab.User','comment','1.2.7','Minor fix to user timestamp attributes.','2020-09-13 16:27:29'),
	(42,'RainLab.User','comment','1.2.8','Add date range filter to users list. Introduced a logout event.','2020-09-13 16:27:29'),
	(43,'RainLab.User','comment','1.2.9','Add invitation mail for new accounts created in the back-end.','2020-09-13 16:27:29'),
	(44,'RainLab.User','script','1.3.0','users_add_guest_flag.php','2020-09-13 16:27:29'),
	(45,'RainLab.User','script','1.3.0','users_add_superuser_flag.php','2020-09-13 16:27:29'),
	(46,'RainLab.User','comment','1.3.0','Introduced guest user accounts.','2020-09-13 16:27:29'),
	(47,'RainLab.User','comment','1.3.1','User notification variables can now be extended.','2020-09-13 16:27:29'),
	(48,'RainLab.User','comment','1.3.2','Minor fix to the Auth::register method.','2020-09-13 16:27:29'),
	(49,'RainLab.User','comment','1.3.3','Allow prevention of concurrent user sessions via the user settings.','2020-09-13 16:27:29'),
	(50,'RainLab.User','comment','1.3.4','Added force secure protocol property to the account component.','2020-09-13 16:27:29'),
	(51,'RainLab.User','comment','1.4.0','!!! The Notifications tab in User settings has been removed.','2020-09-13 16:27:29'),
	(52,'RainLab.User','comment','1.4.1','Added support for user impersonation.','2020-09-13 16:27:29'),
	(53,'RainLab.User','comment','1.4.2','Fixes security bug in Password Reset component.','2020-09-13 16:27:29'),
	(54,'RainLab.User','comment','1.4.3','Fixes session handling for AJAX requests.','2020-09-13 16:27:29'),
	(55,'RainLab.User','comment','1.4.4','Fixes bug where impersonation touches the last seen timestamp.','2020-09-13 16:27:29'),
	(56,'RainLab.User','comment','1.4.5','Added token fallback process to Account / Reset Password components when parameter is missing.','2020-09-13 16:27:29'),
	(57,'RainLab.User','comment','1.4.6','Fixes Auth::register method signature mismatch with core OctoberCMS Auth library','2020-09-13 16:27:29'),
	(58,'RainLab.User','comment','1.4.7','Fixes redirect bug in Account component / Update translations and separate user and group management.','2020-09-13 16:27:29'),
	(59,'RainLab.User','comment','1.4.8','Fixes a bug where calling MailBlocker::removeBlock could remove all mail blocks for the user.','2020-09-13 16:27:29'),
	(60,'RainLab.User','comment','1.5.0','!!! Required password length is now a minimum of 8 characters. Previous passwords will not be affected until the next password change.','2020-09-13 16:27:29'),
	(61,'RainLab.User','script','1.5.1','users_add_ip_address.php','2020-09-13 16:27:29'),
	(62,'RainLab.User','comment','1.5.1','User IP addresses are now logged. Introduce registration throttle.','2020-09-13 16:27:29'),
	(63,'RainLab.User','comment','1.5.2','Whitespace from usernames is now trimmed, allowed for username to be added to Reset Password mail templates.','2020-09-13 16:27:29'),
	(64,'RainLab.User','comment','1.5.3','Fixes a bug in the user update functionality if password is not changed. Added highlighting for banned users in user list.','2020-09-13 16:27:29'),
	(65,'RainLab.Builder','comment','1.0.1','Initialize plugin.','2020-09-13 16:27:37'),
	(66,'RainLab.Builder','comment','1.0.2','Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.','2020-09-13 16:27:37'),
	(67,'RainLab.Builder','comment','1.0.3','Improved handling of the enum data type.','2020-09-13 16:27:37'),
	(68,'RainLab.Builder','comment','1.0.4','Added user permissions to work with the Builder.','2020-09-13 16:27:37'),
	(69,'RainLab.Builder','comment','1.0.5','Fixed permissions registration.','2020-09-13 16:27:37'),
	(70,'RainLab.Builder','comment','1.0.6','Fixed front-end record ordering in the Record List component.','2020-09-13 16:27:37'),
	(71,'RainLab.Builder','comment','1.0.7','Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.','2020-09-13 16:27:37'),
	(72,'RainLab.Builder','comment','1.0.8','Added the Reorder Controller behavior.','2020-09-13 16:27:37'),
	(73,'RainLab.Builder','comment','1.0.9','Minor API and UI updates.','2020-09-13 16:27:37'),
	(74,'RainLab.Builder','comment','1.0.10','Minor styling update.','2020-09-13 16:27:37'),
	(75,'RainLab.Builder','comment','1.0.11','Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.','2020-09-13 16:27:37'),
	(76,'RainLab.Builder','comment','1.0.12','Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.','2020-09-13 16:27:37'),
	(77,'RainLab.Builder','comment','1.0.13','Minor styling fix on the database editor.','2020-09-13 16:27:37'),
	(78,'RainLab.Builder','comment','1.0.14','Added support for published_at timestamp field','2020-09-13 16:27:37'),
	(79,'RainLab.Builder','comment','1.0.15','Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.','2020-09-13 16:27:37'),
	(80,'RainLab.Builder','comment','1.0.16','Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.','2020-09-13 16:27:37'),
	(81,'RainLab.Builder','comment','1.0.17','Added support Trigger attribute support for RecordFinder and Repeater form widgets.','2020-09-13 16:27:37'),
	(82,'RainLab.Builder','comment','1.0.18','Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.','2020-09-13 16:27:37'),
	(83,'RainLab.Builder','comment','1.0.19','Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.','2020-09-13 16:27:37'),
	(84,'RainLab.Builder','comment','1.0.20','Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.','2020-09-13 16:27:37'),
	(85,'RainLab.Builder','comment','1.0.21','Back-end navigation sort order updated.','2020-09-13 16:27:37'),
	(86,'RainLab.Builder','comment','1.0.22','Added scopeValue property to the RecordList component.','2020-09-13 16:27:37'),
	(87,'RainLab.Builder','comment','1.0.23','Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs','2020-09-13 16:27:37'),
	(88,'RainLab.Builder','comment','1.0.24','Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces','2020-09-13 16:27:37'),
	(89,'RainLab.Builder','comment','1.0.25','Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.','2020-09-13 16:27:37'),
	(90,'RainLab.Builder','comment','1.0.26','Allow special default values for columns and added new \"Add ID column\" button to database editor.','2020-09-13 16:27:37'),
	(91,'RLuders.JWTAuth','comment','1.0.0','First version of JWTAuth','2020-09-13 16:27:46'),
	(92,'RLuders.JWTAuth','comment','1.1.0','Settings support added','2020-09-13 16:27:46'),
	(93,'RLuders.JWTAuth','comment','1.1.1','Ads JWTAuth Facade','2020-09-13 16:27:46'),
	(94,'RLuders.JWTAuth','comment','1.1.1','Ads JWTFactory Facade','2020-09-13 16:27:46'),
	(95,'RLuders.JWTAuth','comment','1.1.1','Tested with October CMS build 428 (Laravel 5.5 and last RainLab.User 1.4.3)','2020-09-13 16:27:46'),
	(96,'RLuders.JWTAuth','comment','1.1.2','Some email URL fixes','2020-09-13 16:27:46'),
	(97,'RLuders.JWTAuth','comment','1.1.3','Adding the token refresh route','2020-09-13 16:27:46'),
	(98,'RLuders.JWTAuth','comment','1.1.4','Small fix for the refresh route','2020-09-13 16:27:46'),
	(99,'RLuders.JWTAuth','comment','1.1.4','Adding the user to the refresh route response','2020-09-13 16:27:46'),
	(100,'RLuders.JWTAuth','comment','1.1.5','Using the loginAttribute from RainLab.User','2020-09-13 16:27:46'),
	(101,'RLuders.JWTAuth','comment','1.1.5','Adding support to Brazilian Portuguese','2020-09-13 16:27:46'),
	(102,'RLuders.JWTAuth','comment','1.1.6','Handling with Blacklisted tokens','2020-09-13 16:27:46'),
	(103,'RLuders.JWTAuth','comment','1.2.0','!!! Upgrading the plugin and adding new features','2020-09-13 16:27:46'),
	(104,'RLuders.JWTAuth','comment','1.2.1','Dependencies hotfix','2020-09-13 16:27:46'),
	(105,'RLuders.JWTAuth','comment','1.2.2','License changes to GPLv3','2020-09-13 16:27:46'),
	(106,'RLuders.JWTAuth','comment','1.2.3','Fix get user endpoint','2020-09-13 16:27:46'),
	(107,'RLuders.JWTAuth','comment','1.2.4','!!! Refresh token changes from PATCH to POST and now requires an data form parameter. Please, check the documentation or the UPDATED Postman collection.','2020-09-13 16:27:46'),
	(108,'RLuders.JWTAuth','comment','1.2.5','Fix the validations issues','2020-09-13 16:27:46'),
	(109,'RLuders.JWTAuth','comment','1.2.5','Fix issues when using RLuders.Cors Plugin','2020-09-13 16:27:46'),
	(110,'RLuders.JWTAuth','comment','1.3.0','The AuthController was removed and splited into Single Action Controllers','2020-09-13 16:27:46'),
	(111,'RLuders.JWTAuth','comment','1.3.0','Added some Traits to keep the code simple','2020-09-13 16:27:46'),
	(112,'RLuders.JWTAuth','comment','1.3.0','Activate user by email is now working','2020-09-13 16:27:46'),
	(113,'RLuders.JWTAuth','comment','1.3.0','Inactive users can\'t reset they passwords','2020-09-13 16:27:46'),
	(114,'RLuders.JWTAuth','comment','1.3.0','German language','2020-09-13 16:27:46'),
	(115,'RLuders.JWTAuth','comment','1.3.1','Small hotfix to fix the Carbon 2 incompatibility','2020-09-13 16:27:46'),
	(116,'RLuders.JWTAuth','comment','1.3.2','Fix typo on JsonValidationException','2020-09-13 16:27:46'),
	(117,'RLuders.Cors','comment','1.0.0','First version of RLuders.Cors','2020-09-13 16:31:21'),
	(118,'RLuders.Cors','comment','1.0.1','Fix the icon','2020-09-13 16:31:21'),
	(119,'RLuders.Cors','comment','1.0.2','Fix plugin dependencies','2020-09-13 16:31:21'),
	(120,'RLuders.Cors','comment','1.0.2','Fix English language','2020-09-13 16:31:21'),
	(121,'RLuders.Cors','comment','1.0.2','Adds Brazilian Portuguese language','2020-09-13 16:31:21'),
	(122,'RLuders.Cors','comment','1.0.2','Replace the namespace RLuders\\CORS to RLuders\\Cors','2020-09-13 16:31:21'),
	(123,'RLuders.Cors','comment','1.0.3','Adds the middleware to the api Middleware Group','2020-09-13 16:31:21'),
	(125,'Triangon.Profile','script','1.0.1','add_profile_fields.php','2020-09-13 16:52:08'),
	(127,'Triangon.Testdata','comment','1.0.1','Initialize plugin.','2020-09-13 18:09:06'),
	(128,'Triangon.Testdata','script','1.0.2','builder_table_create_triangon_testdata_item.php','2020-09-13 18:09:58'),
	(129,'Triangon.Testdata','comment','1.0.2','Created table triangon_testdata_item','2020-09-13 18:09:58'),
	(130,'Triangon.Testdata','script','1.0.3','builder_table_update_triangon_testdata_item.php','2020-09-13 18:10:31'),
	(131,'Triangon.Testdata','comment','1.0.3','Updated table triangon_testdata_item','2020-09-13 18:10:31');

/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_plugin_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_plugin_versions`;

CREATE TABLE `system_plugin_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`)
VALUES
	(1,'RainLab.User','1.5.3','2020-09-13 16:27:29',0,0),
	(2,'RainLab.Builder','1.0.26','2020-09-13 16:27:37',0,0),
	(3,'RLuders.JWTAuth','1.3.2','2020-09-13 16:27:46',0,0),
	(4,'RLuders.Cors','1.0.3','2020-09-13 16:31:21',0,0),
	(6,'Triangon.Profile','1.0.1','2020-09-13 16:58:19',0,0),
	(7,'Triangon.Testdata','1.0.3','2020-09-13 18:10:31',0,0);

/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_request_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_request_logs`;

CREATE TABLE `system_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table system_revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_revisions`;

CREATE TABLE `system_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table system_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_settings`;

CREATE TABLE `system_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;

INSERT INTO `system_settings` (`id`, `item`, `value`)
VALUES
	(1,'rainlab_builder_settings','{\"author_name\":\"Triangon\",\"author_namespace\":\"Triangon\"}'),
	(2,'user_settings','{\"require_activation\":\"1\",\"activate_mode\":\"user\",\"use_throttle\":\"1\",\"block_persistence\":\"0\",\"allow_registration\":\"1\",\"login_attribute\":\"email\",\"remember_login\":\"always\",\"use_register_throttle\":\"1\"}'),
	(3,'system_mail_settings','{\"send_mode\":\"smtp\",\"sender_name\":\"OctoberCMS\",\"sender_email\":\"noreply@domain.tld\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"smtp_address\":\"localhost\",\"smtp_port\":\"1025\",\"smtp_user\":\"null\",\"smtp_password\":\"null\",\"smtp_authorization\":\"0\",\"smtp_encryption\":\"\",\"mailgun_domain\":\"\",\"mailgun_secret\":\"\",\"mandrill_secret\":\"\",\"ses_key\":\"\",\"ses_secret\":\"\",\"ses_region\":\"\",\"sparkpost_secret\":\"\"}'),
	(4,'rluders_jwtauth_settings','{\"algo\":\"HS256\",\"secret\":\"mysecretkey\",\"keys_public\":\"\",\"keys_private\":\"\",\"keys_passphrase\":\"\",\"ttl\":60,\"refresh_ttl\":20160,\"required_claims\":\"iss iat exp nbf sub jti\",\"persistent_claims\":\"iss\",\"lock_subject\":\"1\",\"leeway\":0,\"blacklist_enabled\":\"1\",\"blacklist_grace_period\":0,\"encrypt_cookies\":false,\"activation_url\":\"\\/#\\/auth\\/activation\\/{code}\",\"reset_password_url\":\"\\/#\\/auth\\/reset-password\\/{code}\",\"decrypt_cookies\":\"0\"}');

/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table triangon_testdata_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `triangon_testdata_item`;

CREATE TABLE `triangon_testdata_item` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `triangon_testdata_item` WRITE;
/*!40000 ALTER TABLE `triangon_testdata_item` DISABLE KEYS */;

INSERT INTO `triangon_testdata_item` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'test123RRR','2020-09-13 18:13:41','2020-09-13 18:13:48');

/*!40000 ALTER TABLE `triangon_testdata_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_groups`;

CREATE TABLE `user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_groups_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;

INSERT INTO `user_groups` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Guest','guest','Default group for guest users.','2020-09-13 16:27:28','2020-09-13 16:27:28'),
	(2,'Registered','registered','Default group for registered users.','2020-09-13 16:27:28','2020-09-13 16:27:28'),
	(3,'Front End User','front_end_user','User who registered through front end website','2020-09-13 17:14:44','2020-09-13 17:14:57');

/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_throttle`;

CREATE TABLE `user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_throttle_user_id_index` (`user_id`),
  KEY `user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_throttle` WRITE;
/*!40000 ALTER TABLE `user_throttle` DISABLE KEYS */;

INSERT INTO `user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`)
VALUES
	(1,1,NULL,0,NULL,0,NULL,0,NULL),
	(2,2,NULL,0,NULL,0,NULL,0,NULL),
	(3,3,NULL,0,NULL,0,NULL,0,NULL),
	(4,4,NULL,0,NULL,0,NULL,0,NULL),
	(5,5,NULL,0,NULL,0,NULL,0,NULL),
	(6,6,NULL,0,NULL,0,NULL,0,NULL),
	(7,7,NULL,0,NULL,0,NULL,0,NULL),
	(8,9,NULL,0,NULL,0,NULL,0,NULL),
	(9,10,NULL,0,NULL,0,NULL,0,NULL),
	(10,11,NULL,0,NULL,0,NULL,0,NULL);

/*!40000 ALTER TABLE `user_throttle` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `created_ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_residence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_institution_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reasons_for_accessing_form` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_research_partner_or_stakeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_within_project` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreed_to_terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`username`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_login_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `username`, `surname`, `deleted_at`, `last_seen`, `is_guest`, `is_superuser`, `created_ip_address`, `last_ip_address`, `phone`, `country_of_residence`, `occupation`, `organization_institution_name`, `organization_type`, `reasons_for_accessing_form`, `already_research_partner_or_stakeholder`, `role_within_project`, `agreed_to_terms`)
VALUES
	(11,'joe','demo@domain.tld','$2y$10$abSSCjixyuPP.vswKbtj0ucgFTpENSrKgYQJnCtumkXO7hXC4CVAS',NULL,NULL,NULL,NULL,1,'2020-09-13 20:55:20',NULL,'2020-09-13 20:54:31','2020-09-13 20:55:20','demo','doe',NULL,NULL,0,0,NULL,NULL,'4343434343','Aruba','dev','Nasa','Space','Work','1','dev','1');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;

INSERT INTO `users_groups` (`user_id`, `user_group_id`)
VALUES
	(11,3);

/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
