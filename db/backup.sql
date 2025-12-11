-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: identity_service
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('61f12e38-c7ec-4630-97e8-da029b05a06a','SaiGon','VietNam','456 Truong Trinh'),('92f99113-38e6-43fb-bdaf-d8c4b2a360bc','DaNang','VietNam','17 Thien Chuu'),('daadc524-1509-426a-a4b6-b7478a212ee2','Hanoi','VietNam','123 Main Street');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `total_cart_price` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9emlp6m95v5er2bcqkjsw48he` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('1b535cb4-dedc-488d-bb90-8c10b3606eb3','eac8d639-f33e-4fc5-bd25-e2299b56ec5a',20),('1e4a4987-51e2-4df9-b9b1-7e53fb2f8874','47854d19-5277-46c0-a190-1b9ef558d65a',0),('517b725a-a010-4aec-a5ee-0a8eb9b45407','c31011de-b3f5-456a-b3fc-42dae9c9ddaa',34752),('5eaedba5-5d60-4d66-978f-440921b9f8c4','a2d4ee56-e5b7-4ac1-b785-13bc96945998',0),('947e3608-c57c-4e74-a3f5-343d2029be4b','e5a963e6-6487-4909-b854-e4017b7f46d6',0),('aa1afaf1-a1ea-4458-9291-a44ff1850b2a','9adfee6e-d038-4594-a721-7f056c42c457',0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `cart_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('21e35e2b-e80e-414b-af56-fc0442d7228b','Shoe'),('2b624121-ad2e-43e3-9dbc-c412ed387a8b','Bag'),('42537973-cbc5-4567-a272-6b049c075a39','Dress'),('50d8d448-b4a6-44c1-bcc1-76ce6d020876','Skirt'),('809a4f3d-e6d4-4e85-b336-7112f5564017','T-shirt'),('814ddfd2-d8ac-4cdc-90ae-a252721fcf1b','Jewelry'),('c1628f2e-067c-4f21-a937-a15c2535cf4d','Trousers'),('cf4258a9-a0a2-4444-a49a-d58b67cca1b7','Watch'),('e8b58486-c984-444b-a25c-fa89736d65b4','shirts'),('ede2982e-2fd5-49ea-8c27-4cc3e5854e35','Jacket'),('ee285831-e78d-43f9-a787-7a02584c4103','Hat'),('f5b3d56d-107f-4bc7-afc3-d027f684bcb4','Sport');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `address_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7smohlsee0sa1n5xfxuifwf5j` (`payment_id`),
  KEY `FKf0hyuyamjo7t2121k1hw1psy0` (`user_id`),
  KEY `FK83an1a9jt6ho0ibawhd5nrsle` (`address_id`),
  CONSTRAINT `FK83an1a9jt6ho0ibawhd5nrsle` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKf0hyuyamjo7t2121k1hw1psy0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKhktmgho7kcbxo4muas3mj0amn` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES ('507c1db9-49ae-4a9c-8da3-b41430ddd68c','2025-03-31 21:29:44.422589','PENDING',20,NULL,NULL,'eac8d639-f33e-4fc5-bd25-e2299b56ec5a','61f12e38-c7ec-4630-97e8-da029b05a06a'),('8f12274d-d695-44a9-8f97-fb9b53dc2743','2025-04-14 11:10:01.795343','PENDING',20,NULL,NULL,'eac8d639-f33e-4fc5-bd25-e2299b56ec5a',NULL);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invalidated_token`
--

DROP TABLE IF EXISTS `invalidated_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invalidated_token` (
  `id` varchar(255) NOT NULL,
  `expiry_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invalidated_token`
--

LOCK TABLES `invalidated_token` WRITE;
/*!40000 ALTER TABLE `invalidated_token` DISABLE KEYS */;
INSERT INTO `invalidated_token` VALUES ('25bf43be-0098-4478-b4dd-f43ffad37ef9','2024-10-30 21:51:43.000000'),('3e8e4396-e856-47f8-a077-f35998103684','2024-11-19 13:23:57.000000'),('cebfb665-b4b3-4e10-ae82-001716f7d7ce','2025-03-12 22:30:20.000000'),('ecfc9889-3de9-4233-b8fb-3771682989ba','2024-10-30 21:51:14.000000'),('f1f2da14-ae0e-4574-bf7c-fc7a9e91284a','2024-11-18 13:58:55.000000');
/*!40000 ALTER TABLE `invalidated_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  KEY `FKgv4bnmo7cbib2nh0b2rw9yvir` (`order_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKgv4bnmo7cbib2nh0b2rw9yvir` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES ('adc95f7e-8c4c-403d-a149-de4116133619',20,1,20,'8f12274d-d695-44a9-8f97-fb9b53dc2743','14691d3d-d286-4fa3-8077-a90c4ccd1125'),('de8a1602-196a-49e0-b1ff-6887087e8093',20,2,40,'507c1db9-49ae-4a9c-8da3-b41430ddd68c','06e1305a-6891-42cc-9ee4-5a3de79d6092');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `status` enum('FAILED','PENDING','SUCCESS') DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmf7n8wo2rwrxsd6f3t9ub2mep` (`order_id`),
  UNIQUE KEY `UKtacis04bqalsngo46yvxlo7yb` (`transaction_id`),
  CONSTRAINT `FKjb82tm1s8qg4mx6eqog4fsctj` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('835bfd2f-536f-45eb-bc09-1f46a28ce5a4','PAYPAL','507c1db9-49ae-4a9c-8da3-b41430ddd68c',0,'2025-03-31 21:32:00.849291',NULL,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('APROVE_POST','aprove post'),('CREATE_POST','create post'),('DELETE_POST','delete post'),('READ_POST','read post'),('REJECT_POST','reject post'),('UPDATE_POST','update post');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `release_date` date DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('06e1305a-6891-42cc-9ee4-5a3de79d6092','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158190/products/rzmllaqvkh6rnyxtr5r5.jpg','Watch7',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('11834350-36bf-4add-8277-fb74c6dffcb4','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158330/products/z2ab0iaqtfcxfpyjgvqr.jpg','Jacket2',20,10,'2024-11-29','ede2982e-2fd5-49ea-8c27-4cc3e5854e35'),('14691d3d-d286-4fa3-8077-a90c4ccd1125','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157729/products/hudfk53kighei7mf9rgj.jpg','skirt3',20,10,'2024-11-29','50d8d448-b4a6-44c1-bcc1-76ce6d020876'),('17da03a0-0af0-4e35-87bc-c224b9692fb9','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158457/products/ogaf6bjoh5stscvszkem.jpg','Hat4',20,10,'2024-11-29','ee285831-e78d-43f9-a787-7a02584c4103'),('1a033e15-bb10-4c30-b214-241ffda07753','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158130/products/ebx4vw5cxbgnymzzt2hc.jpg','Watch4',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('1b9c9896-a5f3-42f0-9b34-c2198a5a63da','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157535/products/by7i06gqk0ws1x8gubkn.jpg','shoe3',20,10,'2024-11-29','21e35e2b-e80e-414b-af56-fc0442d7228b'),('1f61f78a-ef23-4129-a420-06514d050767','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158500/products/vkezo7y99qyd63k3rajf.jpg','Sport1',20,10,'2024-11-29','f5b3d56d-107f-4bc7-afc3-d027f684bcb4'),('222c8e4a-77b5-4206-9d08-70c2f92bbde6','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158083/products/uh71jygo1lvnxzrx37v1.jpg','Watch2',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('2345138f-db31-431d-87a9-e198ad859f09','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157637/products/goirbtjr9ejhrnznjxll.jpg','dress4',20,10,'2024-11-29','42537973-cbc5-4567-a272-6b049c075a39'),('2faf84c8-c6dc-4124-a63c-fc632f2bbd33','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158513/products/dfwh6fyg4uhuzjfar9lu.jpg','Sport2',20,10,'2024-11-29','f5b3d56d-107f-4bc7-afc3-d027f684bcb4'),('32e32093-686e-45f1-9e08-ff9651228b1f','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157783/products/bcqfict5751n3fmykhyv.jpg','T-shirt1',20,10,'2024-11-29','809a4f3d-e6d4-4e85-b336-7112f5564017'),('3e04d1d2-0695-4662-bc88-d6e656d5f2ad','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157513/products/bmq1ubpzu5ubk65axiyy.jpg','shoe2',20,10,'2024-11-29','21e35e2b-e80e-414b-af56-fc0442d7228b'),('3ffc47e4-0b4b-40e9-b57d-c2543f6c2375','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157966/products/lds3y9qstofkkxumpeed.jpg','Trouser1',20,10,'2024-11-29','c1628f2e-067c-4f21-a937-a15c2535cf4d'),('4d1b0d17-5164-4e95-86b0-30324c1a872e','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158061/products/mevmsscjiwv3ibxfdn2y.jpg','Watch1',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('4e7180ff-6418-432b-b5c2-7f39b340cd38','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158542/products/g9lvynqwyrmm6fiqdwpz.jpg','Sport4',20,10,'2024-11-29','f5b3d56d-107f-4bc7-afc3-d027f684bcb4'),('4f7a1d09-f123-419d-aadc-4d298b2ada61','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157392/products/u8evtp4liz7l1xkxjztn.jpg','bag2',20,10,'2024-11-29','2b624121-ad2e-43e3-9dbc-c412ed387a8b'),('555ae991-1e43-439d-8ed1-c9f8222a9972','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157355/products/ug0h8xvf6cz0sguuhqku.jpg','bag1',20,10,'2024-11-29','2b624121-ad2e-43e3-9dbc-c412ed387a8b'),('56680f50-301e-4799-8fd4-04071eab273d','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157996/products/zcsgvnfhxfgnmgq0hwrn.jpg','Trouser3',20,10,'2024-11-29','c1628f2e-067c-4f21-a937-a15c2535cf4d'),('598bfd8a-38ae-4ac8-8667-5299890f91e9','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158468/products/j5fkmrikk06ugx5sz8vj.jpg','Hat5',20,10,'2024-11-29','ee285831-e78d-43f9-a787-7a02584c4103'),('59baa38a-bc1f-437b-a4bd-7d0c7edaf137','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157820/products/vmclkl0zi2ei4mmx2dj3.jpg','T-shirt3',20,10,'2024-11-29','809a4f3d-e6d4-4e85-b336-7112f5564017'),('59c44cd7-4af4-4dea-ac31-1c86e80fc2af','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157981/products/qswf2bxwk2l0dgmpwk0k.jpg','Trouser2',20,10,'2024-11-29','c1628f2e-067c-4f21-a937-a15c2535cf4d'),('6530ba3e-106e-412b-8151-4c6cd6af3ede','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158379/products/f5tvikeg0voz0gktbr8e.jpg','Jacket5',20,10,'2024-11-29','ede2982e-2fd5-49ea-8c27-4cc3e5854e35'),('6de979b6-f432-4269-a0c1-811a96424343','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158429/products/iss71y2n9zmr2knylzs5.jpg','Hat2',20,10,'2024-11-29','ee285831-e78d-43f9-a787-7a02584c4103'),('6e75529e-164e-4621-a45a-57cecd561d92','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158166/products/noqd4r6fg4nlnsvzshjv.jpg','Watch6',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('6fbcdad5-f164-4a1b-9154-7342e6319959','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158398/products/s8jgf5m3byygnuxyqveq.jpg','Hat1',20,10,'2024-11-29','ee285831-e78d-43f9-a787-7a02584c4103'),('74ea47f6-8f80-422b-962e-d6fb8ccf1465','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158528/products/jyjckfua3f6rz8yulbwf.jpg','Sport3',20,10,'2024-11-29','f5b3d56d-107f-4bc7-afc3-d027f684bcb4'),('829e6b7a-09bf-487a-b5b9-6e6fd903bd61','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157650/products/qyfoonnd0qmtp5fa88d6.jpg','dress5',20,10,'2024-11-29','42537973-cbc5-4567-a272-6b049c075a39'),('90f5bbb1-4cce-44d1-9b7d-7076862daac2','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158319/products/aaahtu6z70vygzdyjvj9.jpg','Jacket1',20,10,'2024-11-29','ede2982e-2fd5-49ea-8c27-4cc3e5854e35'),('940efbea-cf10-4b49-92aa-97367a0d0270','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157414/products/lbehtfq4v0xnzrwunrqn.jpg','bag3',20,10,'2024-11-29','2b624121-ad2e-43e3-9dbc-c412ed387a8b'),('94157374-f7f4-42d4-a487-cb19eee217c5','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157588/products/ypr2srirvl1gzb99uj1c.jpg','dress1',20,10,'2024-11-29','42537973-cbc5-4567-a272-6b049c075a39'),('94e1fdd3-a4bc-43c8-b2cf-42042f9de2d8','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158242/products/jq6vlhietq6aojnaztdq.jpg','Shirt1',20,10,'2024-11-29','e8b58486-c984-444b-a25c-fa89736d65b4'),('9fb54624-9ac4-4285-b837-2ad4c17d4965','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157929/products/ut47jqavlpeodwzmn8bu.jpg','Jewelry5',20,10,'2024-11-29','814ddfd2-d8ac-4cdc-90ae-a252721fcf1b'),('a1e81cc0-174c-4926-9892-191a39945b98','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157881/products/tjaxprqybuqa9hdzgi0u.jpg','Jewelry2',20,10,'2024-11-29','814ddfd2-d8ac-4cdc-90ae-a252721fcf1b'),('a2d0bfdd-00bc-4457-9933-c137c780f644','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158443/products/mhln7otvmmib6hiviia5.jpg','Hat3',20,10,'2024-11-29','ee285831-e78d-43f9-a787-7a02584c4103'),('b3e7753f-743b-42d1-aad2-897deb89f8e7','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158147/products/txpyjkqq5idtcwetqjkc.jpg','Watch5',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('b57576fe-4bd9-43b6-a184-cb0b4c4f0e2a','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157900/products/pu6pllywdkdu09neu9pw.jpg','Jewelry3',20,10,'2024-11-29','814ddfd2-d8ac-4cdc-90ae-a252721fcf1b'),('bedfc42f-fece-465c-80a3-285f4281f457','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158108/products/rhxlrahia8yjuadbryqd.jpg','Watch3',20,10,'2024-11-29','cf4258a9-a0a2-4444-a49a-d58b67cca1b7'),('c754f815-6b88-44f6-8766-6fb1cd85c486','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157622/products/au85fckz2krxazes0nmp.jpg','dress3',20,10,'2024-11-29','42537973-cbc5-4567-a272-6b049c075a39'),('ca88d1f8-e93e-4546-9588-fc68b18b8efd','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157690/products/xyevezqfz4rcyt6pdzd7.jpg','skirt1',20,10,'2024-11-29','50d8d448-b4a6-44c1-bcc1-76ce6d020876'),('d08a436c-559b-4efb-b5dd-cf0145597a1e','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157609/products/c3naqds18ryuqxldoxjg.jpg','dress2',20,10,'2024-11-29','42537973-cbc5-4567-a272-6b049c075a39'),('d8712e07-0787-4286-aab5-fda81e4c50dd','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158259/products/hips957n0edlaebo6qqq.jpg','Shirt2',20,10,'2024-11-29','e8b58486-c984-444b-a25c-fa89736d65b4'),('d9bbac7b-1c28-41be-ad49-e341fb79890a','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157804/products/yy0kvqxocstjndzx2ik2.jpg','T-shirt2',20,10,'2024-11-29','809a4f3d-e6d4-4e85-b336-7112f5564017'),('da228849-8587-405b-b7e7-9de673aaa849','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157713/products/kdjywmy8ucd37atjes5r.jpg','skirt2',20,10,'2024-11-29','50d8d448-b4a6-44c1-bcc1-76ce6d020876'),('dcb2d7ce-80f2-41ff-a013-ae5b7efb3d4c','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157914/products/vggydle5rchvsu1orlm6.jpg','Jewelry4',20,10,'2024-11-29','814ddfd2-d8ac-4cdc-90ae-a252721fcf1b'),('e7779db0-c109-4fab-ab89-1f12737efeca','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158341/products/pjaxfnhlfa5tukxdhfnj.jpg','Jacket3',20,10,'2024-11-29','ede2982e-2fd5-49ea-8c27-4cc3e5854e35'),('e8c95cc1-cda0-4ca3-bca3-a9dd39b87874','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158356/products/viwsytrcbemghnc7azt6.jpg','Jacket4',20,10,'2024-11-29','ede2982e-2fd5-49ea-8c27-4cc3e5854e35'),('eb87311d-e2d5-48fe-82eb-c1fbc06d49bb','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157482/products/n1t3mdf2jdk1prkudhel.jpg','shoe1',20,10,'2024-11-29','21e35e2b-e80e-414b-af56-fc0442d7228b'),('f05baf33-0ff9-4723-a3a8-8030dc1f5ea2','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733157867/products/zrobbxms9f0il0n8ppeh.jpg','Jewelry1',20,10,'2024-11-29','814ddfd2-d8ac-4cdc-90ae-a252721fcf1b'),('fddddb57-55fc-4e49-b808-e1c2a884c1a0','','https://res.cloudinary.com/dcwz2asxe/image/upload/v1733158012/products/ra4i8cylexshb9edh6dl.jpg','Trouser4',20,10,'2024-11-29','c1628f2e-067c-4f21-a937-a15c2535cf4d');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ADMIN','admin role'),('USER','user role');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `role_name` varchar(255) NOT NULL,
  `permissions_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_name`,`permissions_name`),
  KEY `FKf5aljih4mxtdgalvr7xvngfn1` (`permissions_name`),
  CONSTRAINT `FKcppvu8fk24eqqn6q4hws7ajux` FOREIGN KEY (`role_name`) REFERENCES `role` (`name`),
  CONSTRAINT `FKf5aljih4mxtdgalvr7xvngfn1` FOREIGN KEY (`permissions_name`) REFERENCES `permission` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES ('ADMIN','APROVE_POST'),('ADMIN','CREATE_POST'),('ADMIN','READ_POST'),('USER','READ_POST'),('ADMIN','REJECT_POST'),('ADMIN','UPDATE_POST');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('47854d19-5277-46c0-a190-1b9ef558d65a','2000-12-02','abc','xyz','$2a$10$40KG387JqnikOUAv.e9BcuioDMw1/JxvRt2roLJmsE8Pdg0Nbbm1m','tranlehuu'),('4a8effa6-a102-4e1b-aee2-bfb2a2ce220c',NULL,NULL,NULL,'$2a$10$tTeN.ynFwbtWK2EDNOo67.tb2QnUUfdKnzO6aOlnxMthiCgqfGL/a','admin'),('9adfee6e-d038-4594-a721-7f056c42c457',NULL,NULL,NULL,'$2a$10$ZGdWgEhYywTfH6bEXXy2dOTjDEHOxJo/24KZWsDtsmv0CiqGNnxRK','nguyenducvu'),('a2d4ee56-e5b7-4ac1-b785-13bc96945998','2000-12-02','abc','xyz','$2a$10$KXc5iGlSN8RewW6bY5ca8.IhxkKXiSBnyrHkxTtACDsucqX1aJpQW','abcdef1234'),('c31011de-b3f5-456a-b3fc-42dae9c9ddaa','2000-12-02','abc','xyz','$2a$10$BBvXkBIDCz0Zmd5oF5WYNeQ1cirP7Nj3wjsGboy7wQRzAAUz4xDNa','kanekiken'),('e5a963e6-6487-4909-b854-e4017b7f46d6',NULL,NULL,NULL,'$2a$10$y3YWCUyoy/qmOh7Ye./.0.tpZb9hk68VyKK7cVN35KE98LDxgwN3q','hieutv123456'),('eac8d639-f33e-4fc5-bd25-e2299b56ec5a','2000-12-02','abc','xyz','$2a$10$MqKubg2C9zijfcfY31nV/OjDsi.4BCHhp6rXgUpEfTKR7nyYfjWxe','vunguyenduc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_name`),
  KEY `FK6pmbiap985ue1c0qjic44pxlc` (`roles_name`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK6pmbiap985ue1c0qjic44pxlc` FOREIGN KEY (`roles_name`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('4a8effa6-a102-4e1b-aee2-bfb2a2ce220c','ADMIN'),('47854d19-5277-46c0-a190-1b9ef558d65a','USER'),('9adfee6e-d038-4594-a721-7f056c42c457','USER'),('a2d4ee56-e5b7-4ac1-b785-13bc96945998','USER'),('c31011de-b3f5-456a-b3fc-42dae9c9ddaa','USER'),('e5a963e6-6487-4909-b854-e4017b7f46d6','USER'),('eac8d639-f33e-4fc5-bd25-e2299b56ec5a','USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 22:51:02
