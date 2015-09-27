-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: nectardb
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_pe_permission_id_d7f80bab2395fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_pe_permission_id_d7f80bab2395fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_36725f021b33fd9c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_5a8e5801d8ae8f0e_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add brand',8,'add_brand'),(23,'Can change brand',8,'change_brand'),(24,'Can delete brand',8,'delete_brand'),(25,'Can add sub category',9,'add_subcategory'),(26,'Can change sub category',9,'change_subcategory'),(27,'Can delete sub category',9,'delete_subcategory'),(28,'Can add product',10,'add_product'),(29,'Can change product',10,'change_product'),(30,'Can delete product',10,'delete_product'),(31,'Can add cart',11,'add_cart'),(32,'Can change cart',11,'change_cart'),(33,'Can delete cart',11,'delete_cart'),(34,'Can add line item',12,'add_lineitem'),(35,'Can change line item',12,'change_lineitem'),(36,'Can delete line item',12,'delete_lineitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_72ebedda41c8cc1c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_72ebedda41c8cc1c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_25a08d734537510f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_14555f5876681383_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_14555f5876681383_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f4b478ffea42110_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(100) NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `contact_email` varchar(254) NOT NULL,
  `delivery_method` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_lineitem`
--

DROP TABLE IF EXISTS `cart_lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_lineitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` smallint(6) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_lineitem_cart_id_42e7ef54551a16e3_fk_cart_cart_id` (`cart_id`),
  KEY `cart_lineitem_product_id_254b121980fe1992_fk_products_product_id` (`product_id`),
  CONSTRAINT `cart_lineitem_cart_id_42e7ef54551a16e3_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `cart_lineitem_product_id_254b121980fe1992_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_lineitem`
--

LOCK TABLES `cart_lineitem` WRITE;
/*!40000 ALTER TABLE `cart_lineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_11aec6e46548e01a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_494a3baafdcd6087_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_11aec6e46548e01a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_494a3baafdcd6087_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_eef1523fe32ad07_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'cart','cart'),(12,'cart','lineitem'),(5,'contenttypes','contenttype'),(8,'products','brand'),(7,'products','category'),(10,'products','product'),(9,'products','subcategory'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-09-23 11:42:43.574251'),(2,'auth','0001_initial','2015-09-23 11:42:45.239430'),(3,'admin','0001_initial','2015-09-23 11:42:45.611184'),(4,'contenttypes','0002_remove_content_type_name','2015-09-23 11:42:46.013062'),(5,'auth','0002_alter_permission_name_max_length','2015-09-23 11:42:46.105163'),(6,'auth','0003_alter_user_email_max_length','2015-09-23 11:42:46.231181'),(7,'auth','0004_alter_user_username_opts','2015-09-23 11:42:46.245691'),(8,'auth','0005_alter_user_last_login_null','2015-09-23 11:42:46.402698'),(9,'auth','0006_require_contenttypes_0002','2015-09-23 11:42:46.404931'),(10,'products','0001_initial','2015-09-23 11:42:47.774932'),(11,'cart','0001_initial','2015-09-23 11:42:48.281509'),(12,'sessions','0001_initial','2015-09-23 11:42:48.528789'),(13,'products','0002_auto_20150923_1152','2015-09-23 11:52:33.096044');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_brand`
--

DROP TABLE IF EXISTS `products_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (9,'La Palm','brand_images/lapalm.jpg','la-palm'),(10,'Ceriotti','brand_images/lapalm_DGjK5Qw.jpg','ceriotti'),(11,'Meishida','brand_images/lapalm_DNlwvky.jpg','meishida'),(12,'SRS','brand_images/lapalm_l19tfwU.jpg','srs'),(13,'Sincery','brand_images/lapalm_T8AIO58.jpg','sincery');
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category`
--

LOCK TABLES `products_category` WRITE;
/*!40000 ALTER TABLE `products_category` DISABLE KEYS */;
INSERT INTO `products_category` VALUES (7,'Beauty Equipment'),(4,'Electrical Products'),(8,'Furniture'),(2,'Nail Care'),(3,'Skin Care');
/*!40000 ALTER TABLE `products_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `slug` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `code` (`code`),
  KEY `products_product_79f70305` (`subcategory_id`),
  CONSTRAINT `produc_subcategory_id_ac0596c304aec83_fk_products_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `products_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (5,'Be one mobiletto 2 cassetti',NULL,'product_images/be-one-mobiletto-2-cassetti.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one-mobiletto-2-cassetti','2015-09-23 12:54:53.000000',25),(6,'Be one mobiletto 3 cassetti',NULL,'product_images/be-one-mobiletto-3-cassetti.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one-mobiletto-3-cassetti','2015-09-23 12:54:53.000000',25),(7,'Be one ice',NULL,'product_images/be-one-ice-01.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one-ice','2015-09-23 15:35:10.000000',25),(8,'Be one',NULL,'product_images/be-one-01.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one','2015-09-23 15:35:10.000000',25),(9,'Ciak color 01',NULL,'product_images/ciak-color-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-color-01','2015-09-23 15:35:10.000000',25),(10,'Ciak color 02',NULL,'product_images/ciak-color-02.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-color-02','2015-09-23 15:35:10.000000',25),(11,'Ciak Manicure color 01',NULL,'product_images/ciak-manicure-color-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-manicure-color-01','2015-09-23 15:35:10.000000',25),(12,'Ciak high wheels',NULL,'product_images/ciak-high-wheels.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-high-wheels','2015-09-23 15:35:10.000000',25),(13,'Ciak Manicure 01',NULL,'product_images/ciak-manicure-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-manicure-01','2015-09-23 15:35:10.000000',25),(14,'Ciak 01',NULL,'product_images/ciak-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-01','2015-09-23 15:35:10.000000',25),(15,'SRS Skin Renew (facial cocktail)',NULL,'product_images/srs-skin-renew-facial-cocktail.jpg','Reduces wrinkles. Disappears fine lines, Increases collagen and elastin synthesis. Gives an instant glow. Moisturizes and smoothes the skin. Has an antioxidant action. Brightens the skin','srs-skin-renew-facial-cocktail','2015-09-23 15:59:59.000000',24),(16,'SRS HAIR 2.1',NULL,'product_images/srs-hair-2-1.jpg','Reducing the amount of hair. Faster hair regrowth. Nutrition hair follicles. Moisturizes dry scalp','srs-hair-2-1','2015-09-23 15:59:59.000000',24),(17,'SRS Body Fit',NULL,'product_images/srs-body-fit.jpg','Body Fit is the most effective in reducing fat and cellulite treatment. Its active ingredients ensure a lipolytic action that contributes to shaping and toning the body.','srs-body-fit','2015-09-23 15:59:59.000000',24),(18,'SRS Skin Lift',NULL,'product_images/srs-skin-lift.jpg','Skin Lift is a pre-mixed rich in active ingredients that blur the lines cocktail, reduces wrinkles and regenerates the dermis. Skin Lift provides instant radiant glow to the skin, while providing significant hydration and antioxidant protection against free radicals and aging.','srs-skin-lift','2015-09-23 15:59:59.000000',24),(19,'Artichoke',NULL,'product_images/artichoke.jpg','Artichoke is a natural aid to lower cholesterol that mobilizes the fatty acid stores in the liver.','artichoke','2015-09-23 15:59:59.000000',24),(20,'Ascorbic Acid 20',NULL,'product_images/ascorbic-acid-20.jpg','Ascorbic Acid is a regenerating solution that provides tissue strength.','ascorbic-acid-20','2015-09-23 15:59:59.000000',24),(21,'Biotine',NULL,'product_images/biotine.jpg','Biotine is a regenerating solution that stimulates cellular repair and promote healthy skin cell.','biotine','2015-09-23 15:59:59.000000',24),(22,'Caffeine 20',NULL,'product_images/caffeine-20.jpg','Caffeine helps increase blood flow and stimulate fat cells to release fat into the bloodstream and enable the body\'s metabolism to burn that fat. Caffeine drains fat cells while giving firmness and tone to the skin, helping to reduce the appearance of cellulite. In topical use, caffeine acts as a lipolytic agent, destroying the fatty tissue, located achieving weight loss without any side effects.','caffeine-20','2015-09-23 15:59:59.000000',24),(23,'Centella',NULL,'product_images/centella.jpg','Centella Asiatica helps to stimulate collagen and elastin biosynthesis to improve wound repair.','centella','2015-09-23 15:59:59.000000',24),(24,'Dexpanthenol',NULL,'product_images/dexpanthenol.jpg','Dexpanthenol is a revitalizing solution that maintains skin softness and elasticity.','dexpanthenol','2015-09-23 15:59:59.000000',24);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_subcategory`
--

DROP TABLE IF EXISTS `products_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `products_subcateg_brand_id_34f551e21e108d2e_fk_products_brand_id` (`brand_id`),
  KEY `products_su_category_id_1df38e96af3bc7c8_fk_products_category_id` (`category_id`),
  CONSTRAINT `products_su_category_id_1df38e96af3bc7c8_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`),
  CONSTRAINT `products_subcateg_brand_id_34f551e21e108d2e_fk_products_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_subcategory`
--

LOCK TABLES `products_subcategory` WRITE;
/*!40000 ALTER TABLE `products_subcategory` DISABLE KEYS */;
INSERT INTO `products_subcategory` VALUES (9,'Vaporizers','vaporizers',10,4),(10,'Wall Arms','wall-arms',10,4),(11,'Thermal Activators','thermal-activators',10,4),(12,'Hand Hairdryers','hand-hairdryers',10,4),(13,'Helmets','helmets',10,4),(14,'Sterilizers','sterilizers',11,7),(15,'Skin Care','skin-care',11,7),(16,'Body Treatment','body-treatment',11,7),(17,'Facial Treatment','facial-treatment',11,7),(18,'Manicure','manicure',11,7),(19,'Pedicure (with Ozone)','pedicure-with-ozone',11,7),(20,'Facial skin analyzer','facial-skin-analyzer',13,7),(21,'Nail Polish Remover','nail-polish-remover',9,2),(22,'Nail Treatment','nail-treatment',9,2),(23,'Polish Thinner','polish-thinner',9,2),(24,'Treatment','treatment',12,3),(25,'Trolleys','trolleys',10,8);
/*!40000 ALTER TABLE `products_subcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-27 20:19:22
