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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (9,'La Palm','brand_images/lapalm.jpg','la-palm'),(10,'Ceriotti','brand_images/lapalm_DGjK5Qw.jpg','ceriotti'),(11,'Meishida','brand_images/lapalm_DNlwvky.jpg','meishida'),(12,'SRS','brand_images/lapalm_l19tfwU.jpg','srs'),(13,'Sincery','brand_images/lapalm_T8AIO58.jpg','sincery'),(14,'Alpeda','brand_images/alpeda.jpg','alpeda'),(15,'Nilo','brand_images/nilo.jpg','nilo'),(16,'Cala','brand_images/cala.jpg','cala'),(17,'Alter Ego','brand_images/alter-ego.jpg','alter-ego'),(18,'American Crew','brand_images/american-crew.jpg','american-crew'),(19,'Andis','brand_images/andis.jpg','andis'),(20,'Ardell','brand_images/ardell.jpg','ardell'),(21,'Argila','brand_images/argila.jpg','argila'),(22,'Artecno','brand_images/artecno.jpg','artecno'),(23,'Babylisspro','brand_images/babylisspro.jpg','babylisspro'),(24,'Btoxx','brand_images/btoxx.jpg','btoxx'),(25,'Cellutec','brand_images/cellutec.jpg','cellutec'),(26,'Elchim','brand_images/elchim.jpg','elchim'),(27,'Enercos','brand_images/enercos.jpg','enercos'),(28,'Footspa','brand_images/footspa.jpg','footspa'),(29,'Gena','brand_images/gena.jpg','gena'),(30,'GHD','brand_images/ghd.jpg','ghd'),(31,'Home Beauty','brand_images/homebeauty.jpg','homebeauty'),(32,'Keratin Complex','brand_images/keratin-complex.jpg','keratin-complex'),(33,'Cover Your Gray','brand_images/cover-your-gray.jpg','cover-your-gray'),(34,'Dare To Wear','brand_images/dare-to-wear.jpg','dare-to-wear'),(35,'Dr. B\'s','brand_images/dr-bs.jpg','dr-bs'),(36,'Ensyline','brand_images/ensyline.jpg','ensyline'),(37,'Gelee','brand_images/gelee.jpg','gelee'),(38,'HSA','brand_images/hsa.jpg','hsa'),(39,'Le Chat','brand_images/lechat.jpg','lechat'),(40,'Maletti','brand_images/maletti.jpg','maletti'),(41,'Marianna','brand_images/marianna.jpg','marianna'),(42,'Moda','brand_images/moda.jpg','moda'),(43,'Nail Architecture','brand_images/nail-architecture.jpg','nail-architecture'),(44,'Nubian Heritage','brand_images/nubian-heritage.jpg','nubian-heritage'),(45,'Olivia Garden','brand_images/olivia-garden.jpg','olivia-garden'),(46,'Organic Keragen','brand_images/organic-keragen.jpg','organic-keragen'),(47,'Oyster','brand_images/oyster.jpg','oyster'),(48,'Pro Nail','brand_images/pro-nail.jpg','pro-nail'),(49,'Pro Sheen','brand_images/prosheen.jpg','pro-sheen'),(50,'Pure Organics','brand_images/pure-organics.jpg','pure-organics'),(51,'Shea Moisture','brand_images/shea-moisture.jpg','shea-moisture'),(52,'Sparedi','brand_images/sparedi.jpg','sparedi'),(53,'Sterex','brand_images/sterex.jpg','sterex'),(54,'The Carlton','brand_images/the-carlton.jpg','the-carlton');
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
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
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `code` (`code`),
  KEY `products_product_79f70305` (`subcategory_id`),
  CONSTRAINT `produc_subcategory_id_ac0596c304aec83_fk_products_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `products_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (5,'Be one mobiletto 2 cassetti',NULL,'product_images/be-one-mobiletto-2-cassetti.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one-mobiletto-2-cassetti','2015-09-23 12:54:53.000000',25),(6,'Be one mobiletto 3 cassetti',NULL,'product_images/be-one-mobiletto-3-cassetti.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one-mobiletto-3-cassetti','2015-09-23 12:54:53.000000',25),(7,'Be one ice',NULL,'product_images/be-one-ice-01.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one-ice','2015-09-23 15:35:10.000000',25),(8,'Be one',NULL,'product_images/be-one-01.jpg','Shopping column, with the possibility of six drawers and sliding all interchangeable or three dresser drawers with all sliding. Offices to accommodate bottles, flasks and hairdryer.','be-one','2015-09-23 15:35:10.000000',25),(9,'Ciak color 01',NULL,'product_images/ciak-color-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-color-01','2015-09-23 15:35:10.000000',25),(10,'Ciak color 02',NULL,'product_images/ciak-color-02.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-color-02','2015-09-23 15:35:10.000000',25),(11,'Ciak Manicure color 01',NULL,'product_images/ciak-manicure-color-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-manicure-color-01','2015-09-23 15:35:10.000000',25),(12,'Ciak high wheels',NULL,'product_images/ciak-high-wheels.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-high-wheels','2015-09-23 15:35:10.000000',25),(13,'Ciak Manicure 01',NULL,'product_images/ciak-manicure-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-manicure-01','2015-09-23 15:35:10.000000',25),(14,'Ciak 01',NULL,'product_images/ciak-01.jpg','Cart with six drawers all interchangeable on one side locations to accommodate bottles and vials.','ciak-01','2015-09-23 15:35:10.000000',25),(15,'SRS Skin Renew (facial cocktail)',NULL,'product_images/srs-skin-renew-facial-cocktail.jpg','Reduces wrinkles. Disappears fine lines, Increases collagen and elastin synthesis. Gives an instant glow. Moisturizes and smoothes the skin. Has an antioxidant action. Brightens the skin','srs-skin-renew-facial-cocktail','2015-09-23 15:59:59.000000',24),(16,'SRS HAIR 2.1',NULL,'product_images/srs-hair-2-1.jpg','Reducing the amount of hair. Faster hair regrowth. Nutrition hair follicles. Moisturizes dry scalp','srs-hair-2-1','2015-09-23 15:59:59.000000',24),(17,'SRS Body Fit',NULL,'product_images/srs-body-fit.jpg','Body Fit is the most effective in reducing fat and cellulite treatment. Its active ingredients ensure a lipolytic action that contributes to shaping and toning the body.','srs-body-fit','2015-09-23 15:59:59.000000',24),(18,'SRS Skin Lift',NULL,'product_images/srs-skin-lift.jpg','Skin Lift is a pre-mixed rich in active ingredients that blur the lines cocktail, reduces wrinkles and regenerates the dermis. Skin Lift provides instant radiant glow to the skin, while providing significant hydration and antioxidant protection against free radicals and aging.','srs-skin-lift','2015-09-23 15:59:59.000000',24),(19,'Artichoke',NULL,'product_images/artichoke.jpg','Artichoke is a natural aid to lower cholesterol that mobilizes the fatty acid stores in the liver.','artichoke','2015-09-23 15:59:59.000000',24),(20,'Ascorbic Acid 20',NULL,'product_images/ascorbic-acid-20.jpg','Ascorbic Acid is a regenerating solution that provides tissue strength.','ascorbic-acid-20','2015-09-23 15:59:59.000000',24),(21,'Biotine',NULL,'product_images/biotine.jpg','Biotine is a regenerating solution that stimulates cellular repair and promote healthy skin cell.','biotine','2015-09-23 15:59:59.000000',24),(22,'Caffeine 20',NULL,'product_images/caffeine-20.jpg','Caffeine helps increase blood flow and stimulate fat cells to release fat into the bloodstream and enable the body\'s metabolism to burn that fat. Caffeine drains fat cells while giving firmness and tone to the skin, helping to reduce the appearance of cellulite. In topical use, caffeine acts as a lipolytic agent, destroying the fatty tissue, located achieving weight loss without any side effects.','caffeine-20','2015-09-23 15:59:59.000000',24),(23,'Centella',NULL,'product_images/centella.jpg','Centella Asiatica helps to stimulate collagen and elastin biosynthesis to improve wound repair.','centella','2015-09-23 15:59:59.000000',24),(24,'Dexpanthenol',NULL,'product_images/dexpanthenol.jpg','Dexpanthenol is a revitalizing solution that maintains skin softness and elasticity.','dexpanthenol','2015-09-23 15:59:59.000000',24),(36,'Acetone','LP001','product_images/acetone-gallon.jpg','Nail Polish Remover','acetone','2015-09-27 23:26:06.000000',21),(37,'Acetone','LP288','product_images/acetone-32-oz.jpg','Nail Polish Remover','acetone-lp288','2015-09-27 23:26:06.000000',21),(38,'Alcohol 70%','LP002','product_images/alcohol-70%-gallon.jpg','Nail Polish Remover','alcohol-70-lp002','2015-09-27 23:26:06.000000',21),(39,'Alcohol 70%','LP289','product_images/alcohol-70%-32-oz.jpg','Nail Polish Remover','alcohol-70-lp289','2015-09-27 23:26:06.000000',21),(40,'Alcohol 100%','LP003','product_images/alcohol-100%-gallon.jpg','Nail Polish Remover','alcohol-100','2015-09-27 23:26:06.000000',21),(41,'Alcohol 100%','LP290','product_images/alcohol-100%-32-oz.jpg','Nail Polish Remover','alcohol-100-lp290','2015-09-27 23:26:06.000000',21),(42,'Cuticle Oil - Clear Pineapple','LP061','product_images/cuticle-oil-clear-pineapple.jpg','Rejuvenate cuticles and promote healthy and strong nail growth with a scent of pineapple','cuticle-oil-clear-pineapple','2015-09-27 23:26:06.000000',22),(43,'Cuticle Oil - Pineapple','LP062','product_images/cuticle-oil-pineapple.jpg','Rejuvenate cuticles and promote healthy and strong nail growth.','cuticle-oil-pineapple','2015-09-27 23:26:06.000000',22),(44,'Non Polish Removr - Acetone','LP006','product_images/non-acetone-polish-remover-gallon.jpg','Nail Polish Remover','non-polish-removr-lp006','2015-09-27 23:26:06.000000',21),(45,'Non Polish Removr - Acetone','LP291','product_images/non-acetone-polish-remover-32-oz.jpg','Nail Polish Remover','non-polish-removr-lp291','2015-09-27 23:26:06.000000',21),(46,'Polish Thinner – All In One','LP013','product_images/polish-thinner.jpg','Polish Thinner','polish-thinner','2015-09-27 23:26:06.000000',23);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-28  0:18:57
