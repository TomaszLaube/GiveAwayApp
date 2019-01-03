-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: GiveAway
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `gatherings`
--

DROP TABLE IF EXISTS `gatherings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatherings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `city` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `created` datetime NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `street` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telephone` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `time` time NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj35oiru9lvlm07i0l7h6m8rle` (`user_id`),
  CONSTRAINT `FKj35oiru9lvlm07i0l7h6m8rle` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatherings`
--

LOCK TABLES `gatherings` WRITE;
/*!40000 ALTER TABLE `gatherings` DISABLE KEYS */;
/*!40000 ALTER TABLE `gatherings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatherings_goods`
--

DROP TABLE IF EXISTS `gatherings_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatherings_goods` (
  `gathering_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  PRIMARY KEY (`gathering_id`,`goods_id`),
  KEY `FKrpe1d7whjc8hhsqqvst8xpkr` (`goods_id`),
  CONSTRAINT `FKm51dj9a25ywdw1nnjs8x0x11a` FOREIGN KEY (`gathering_id`) REFERENCES `gatherings` (`id`),
  CONSTRAINT `FKrpe1d7whjc8hhsqqvst8xpkr` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatherings_goods`
--

LOCK TABLES `gatherings_goods` WRITE;
/*!40000 ALTER TABLE `gatherings_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `gatherings_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatherings_receivers`
--

DROP TABLE IF EXISTS `gatherings_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatherings_receivers` (
  `gathering_id` bigint(20) NOT NULL,
  `receivers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`gathering_id`,`receivers_id`),
  KEY `FKlnwsueachcdcky9sf833h2gl1` (`receivers_id`),
  CONSTRAINT `FKgubtl8tp05pmhulh8e2mibayl` FOREIGN KEY (`gathering_id`) REFERENCES `gatherings` (`id`),
  CONSTRAINT `FKlnwsueachcdcky9sf833h2gl1` FOREIGN KEY (`receivers_id`) REFERENCES `receivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatherings_receivers`
--

LOCK TABLES `gatherings_receivers` WRITE;
/*!40000 ALTER TABLE `gatherings_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `gatherings_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'Ubrania ponownego użytku'),(2,'Ubrania do przeróbek'),(3,'Zabawki'),(4,'Książki'),(5,'Inne');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Aleksandrów Łódzki'),(2,'Alwernia'),(3,'Andrychów'),(4,'Annopol'),(5,'Babimost'),(6,'Baborów'),(7,'Baranów Sandomierski'),(8,'Barcin'),(9,'Barczewo'),(10,'Bardo'),(11,'Barlinek'),(12,'Barwice'),(13,'Bełżyce'),(14,'Biała'),(15,'Biała Piska'),(16,'Biała Podlaska'),(17,'Biała Rawska'),(18,'Białobrzegi'),(19,'Biały Bór'),(20,'Białystok'),(21,'Biecz'),(22,'Bielsko-Biała'),(23,'Bierutów'),(24,'Bieżuń'),(25,'Biskupiec'),(26,'Bisztynek'),(27,'Blachownia'),(28,'Błaszki'),(29,'Błażowa'),(30,'Błonie'),(31,'Bobolice'),(32,'Bobowa'),(33,'Bodzentyn'),(34,'Bogatynia'),(35,'Boguchwała'),(36,'Bojanowo'),(37,'Bolków'),(38,'Borek Wielkopolski'),(39,'Borne Sulinowo'),(40,'Brok'),(41,'Brusy'),(42,'Brwinów'),(43,'Brzeg Dolny'),(44,'Brzesko'),(45,'Brzeszcze'),(46,'Brześć Kujawski'),(47,'Brzostek'),(48,'Brzozów'),(49,'Buk'),(50,'Busko-Zdrój'),(51,'Bychawa'),(52,'Byczyna'),(53,'Bydgoszcz'),(54,'Bystrzyca Kłodzka'),(55,'Bytom'),(56,'Bytom Odrzański'),(57,'Bytów'),(58,'Cedynia'),(59,'Chełm'),(60,'Chełmek'),(61,'Chęciny'),(62,'Chmielnik'),(63,'Chocianów'),(64,'Chociwel'),(65,'Chocz'),(66,'Chodecz'),(67,'Chojna'),(68,'Choroszcz'),(69,'Chorzele'),(70,'Chorzów'),(71,'Choszczno'),(72,'Chrzanów'),(73,'Ciechanowiec'),(74,'Cieszanów'),(75,'Ciężkowice'),(76,'Cybinka'),(77,'Czaplinek'),(78,'Czarna Białostocka'),(79,'Czarna Woda'),(80,'Czarne'),(81,'Czchów'),(82,'Czechowice-Dziedzice'),(83,'Czempiń'),(84,'Czerniejewo'),(85,'Czersk'),(86,'Czerwieńsk'),(87,'Czerwionka-Leszczyny'),(88,'Częstochowa'),(89,'Człopa'),(90,'Czyżew'),(91,'Ćmielów'),(92,'Daleszyce'),(93,'Dąbie'),(94,'Dąbrowa Białostocka'),(95,'Dąbrowa Górnicza'),(96,'Dąbrowa Tarnowska'),(97,'Debrzno'),(98,'Dębno'),(99,'Dobczyce'),(100,'Dobiegniew'),(101,'Dobra'),(102,'Dobre Miasto'),(103,'Dobrodzień'),(104,'Dobrzany'),(105,'Dobrzyca'),(106,'Dobrzyń nad Wisłą'),(107,'Dolsk'),(108,'Drawno'),(109,'Drawsko Pomorskie'),(110,'Drezdenko'),(111,'Drobin'),(112,'Drohiczyn'),(113,'Drzewica'),(114,'Dukla'),(115,'Działoszyce'),(116,'Działoszyn'),(117,'Dzierzgoń'),(118,'Dziwnów'),(119,'Elbląg'),(120,'Frampol'),(121,'Frombork'),(122,'Gąbin'),(123,'Gdańsk'),(124,'Gdynia'),(125,'Glinojeck'),(126,'Gliwice'),(127,'Głogów Małopolski'),(128,'Głogówek'),(129,'Głubczyce'),(130,'Głuchołazy'),(131,'Głuszyca'),(132,'Gniew'),(133,'Gniewkowo'),(134,'Gogolin'),(135,'Golczewo'),(136,'Goleniów'),(137,'Golina'),(138,'Gołańcz'),(139,'Gołdap'),(140,'Goniądz'),(141,'Gorzów Śląski'),(142,'Gorzów Wielkopolski'),(143,'Gostyń'),(144,'Gościno'),(145,'Góra'),(146,'Góra Kalwaria'),(147,'Górzno'),(148,'Grabów nad Prosną'),(149,'Grodków'),(150,'Grodzisk Mazowiecki'),(151,'Grodzisk Wielkopolski'),(152,'Grójec'),(153,'Grudziądz'),(154,'Gryfice'),(155,'Gryfino'),(156,'Gryfów Śląski'),(157,'Halinów'),(158,'Iłowa'),(159,'Iłża'),(160,'Ińsko'),(161,'Iwonicz-Zdrój'),(162,'Izbica Kujawska'),(163,'Jabłonowo Pomorskie'),(164,'Janikowo'),(165,'Janowiec Wielkopolski'),(166,'Janów Lubelski'),(167,'Jaraczewo'),(168,'Jarocin'),(169,'Jasień'),(170,'Jastarnia'),(171,'Jastrowie'),(172,'Jastrzębie-Zdrój'),(173,'Jaworzno'),(174,'Jaworzyna Śląska'),(175,'Jedlicze'),(176,'Jedwabne'),(177,'Jelcz-Laskowice'),(178,'Jelenia Góra'),(179,'Jeziorany'),(180,'Jędrzejów'),(181,'Józefów'),(182,'Józefów nad Wisłą'),(183,'Jutrosin'),(184,'Kalisz'),(185,'Kalisz Pomorski'),(186,'Kalwaria Zebrzydowska'),(187,'Kałuszyn'),(188,'Kamień Krajeński'),(189,'Kamień Pomorski'),(190,'Kamieńsk'),(191,'Kańczuga'),(192,'Karczew'),(193,'Kargowa'),(194,'Karlino'),(195,'Kartuzy'),(196,'Katowice'),(197,'Kazimierz Dolny'),(198,'Kazimierza Wielka'),(199,'Kąty Wrocławskie'),(200,'Kcynia'),(201,'Kępice'),(202,'Kępno'),(203,'Kęty'),(204,'Kielce'),(205,'Kietrz'),(206,'Kisielice'),(207,'Kleczew'),(208,'Kleszczele'),(209,'Kluczbork'),(210,'Kłecko'),(211,'Kłobuck'),(212,'Kłodawa'),(213,'Knyszyn'),(214,'Kobylin'),(215,'Kock'),(216,'Kolbuszowa'),(217,'Kolonowskie'),(218,'Koluszki'),(219,'Kołaczyce'),(220,'Koniecpol'),(221,'Konin'),(222,'Konstancin-Jeziorna'),(223,'Końskie'),(224,'Koprzywnica'),(225,'Korfantów'),(226,'Koronowo'),(227,'Korsze'),(228,'Kosów Lacki'),(229,'Kostrzyn'),(230,'Koszalin'),(231,'Kowalewo Pomorskie'),(232,'Koziegłowy'),(233,'Kozienice'),(234,'Koźmin Wielkopolski'),(235,'Kożuchów'),(236,'Kórnik'),(237,'Krajenka'),(238,'Kraków'),(239,'Krapkowice'),(240,'Krasnobród'),(241,'Krobia'),(242,'Krosno'),(243,'Krosno Odrzańskie'),(244,'Krośniewice'),(245,'Krotoszyn'),(246,'Kruszwica'),(247,'Krynica-Zdrój'),(248,'Krynki'),(249,'Krzanowice'),(250,'Krzepice'),(251,'Krzeszowice'),(252,'Krzywiń'),(253,'Krzyż Wielkopolski'),(254,'Książ Wielkopolski'),(255,'Kunów'),(256,'Kuźnia Raciborska'),(257,'Lądek-Zdrój'),(258,'Legnica'),(259,'Lesko'),(260,'Leszno'),(261,'Leśna'),(262,'Leśnica'),(263,'Lewin Brzeski'),(264,'Libiąż'),(265,'Lidzbark'),(266,'Lipiany'),(267,'Lipsk'),(268,'Lipsko'),(269,'Lubawka'),(270,'Lubień Kujawski'),(271,'Lublin'),(272,'Lubniewice'),(273,'Lubomierz'),(274,'Lubraniec'),(275,'Lubsko'),(276,'Lubycza Królewska'),(277,'Lwówek'),(278,'Lwówek Śląski'),(279,'Łabiszyn'),(280,'Łagów'),(281,'Łapy'),(282,'Łasin'),(283,'Łask'),(284,'Łaszczów'),(285,'Łazy'),(286,'Łęczna'),(287,'Łobez'),(288,'Łobżenica'),(289,'Łochów'),(290,'Łomianki'),(291,'Łomża'),(292,'Łosice'),(293,'Łódź'),(294,'Maków Podhalański'),(295,'Małogoszcz'),(296,'Małomice'),(297,'Margonin'),(298,'Maszewo'),(299,'Miastko'),(300,'Michałowo'),(301,'Miechów'),(302,'Miejska Górka'),(303,'Mielno'),(304,'Mieroszów'),(305,'Mieszkowice'),(306,'Międzybórz'),(307,'Międzychód'),(308,'Międzylesie'),(309,'Międzyrzecz'),(310,'Międzyzdroje'),(311,'Mikołajki'),(312,'Mikstat'),(313,'Milicz'),(314,'Miłakowo'),(315,'Miłomłyn'),(316,'Miłosław'),(317,'Mirosławiec'),(318,'Mirsk'),(319,'Młynary'),(320,'Modliborzyce'),(321,'Mogielnica'),(322,'Mogilno'),(323,'Mońki'),(324,'Morawica'),(325,'Morąg'),(326,'Mordy'),(327,'Moryń'),(328,'Mosina'),(329,'Mrocza'),(330,'Mrozy'),(331,'Mszczonów'),(332,'Murowana Goślina'),(333,'Muszyna'),(334,'Mysłowice'),(335,'Myszyniec'),(336,'Myślenice'),(337,'Myślibórz'),(338,'Nakło nad Notecią'),(339,'Nałęczów'),(340,'Namysłów'),(341,'Narol'),(342,'Nasielsk'),(343,'Nekla'),(344,'Nidzica'),(345,'Niemcza'),(346,'Niemodlin'),(347,'Niepołomice'),(348,'Nisko'),(349,'Nowa Dęba'),(350,'Nowa Sarzyna'),(351,'Nowe'),(352,'Nowe Brzesko'),(353,'Nowe Miasteczko'),(354,'Nowe Miasto nad Pilicą'),(355,'Nowe Skalmierzyce'),(356,'Nowe Warpno'),(357,'Nowogard'),(358,'Nowogrodziec'),(359,'Nowogród'),(360,'Nowogród Bobrzański'),(361,'Nowy Dwór Gdański'),(362,'Nowy Sącz'),(363,'Nowy Staw'),(364,'Nowy Tomyśl'),(365,'Nowy Wiśnicz'),(366,'Nysa'),(367,'Oborniki'),(368,'Oborniki Śląskie'),(369,'Odolanów'),(370,'Ogrodzieniec'),(371,'Okonek'),(372,'Olecko'),(373,'Olesno'),(374,'Oleszyce'),(375,'Olkusz'),(376,'Olsztyn'),(377,'Olsztynek'),(378,'Olszyna'),(379,'Opalenica'),(380,'Opatów'),(381,'Opatówek'),(382,'Opoczno'),(383,'Opole'),(384,'Opole Lubelskie'),(385,'Orneta'),(386,'Orzysz'),(387,'Osieczna'),(388,'Osiek'),(389,'Ostrołęka'),(390,'Ostroróg'),(391,'Ostrów Lubelski'),(392,'Ostrzeszów'),(393,'Ośno Lubuskie'),(394,'Otmuchów'),(395,'Otyń'),(396,'Ozimek'),(397,'Ożarów'),(398,'Ożarów Mazowiecki'),(399,'Paczków'),(400,'Pajęczno'),(401,'Pakość'),(402,'Parczew'),(403,'Pasłęk'),(404,'Pasym'),(405,'Pelplin'),(406,'Pełczyce'),(407,'Piaseczno'),(408,'Piaski'),(409,'Piekary Śląskie'),(410,'Pieniężno'),(411,'Pieńsk'),(412,'Pieszyce'),(413,'Pilawa'),(414,'Pilica'),(415,'Pilzno'),(416,'Pińczów'),(417,'Piotrków Kujawski'),(418,'Piotrków Trybunalski'),(419,'Pisz'),(420,'Piwniczna-Zdrój'),(421,'Pleszew'),(422,'Płock'),(423,'Płoty'),(424,'Pniewy'),(425,'Pobiedziska'),(426,'Poddębice'),(427,'Pogorzela'),(428,'Polanów'),(429,'Police'),(430,'Polkowice'),(431,'Połaniec'),(432,'Połczyn-Zdrój'),(433,'Poniatowa'),(434,'Poniec'),(435,'Poznań'),(436,'Prabuty'),(437,'Praszka'),(438,'Prochowice'),(439,'Proszowice'),(440,'Prószków'),(441,'Pruchnik'),(442,'Prudnik'),(443,'Prusice'),(444,'Przecław'),(445,'Przedbórz'),(446,'Przedecz'),(447,'Przemków'),(448,'Przemyśl'),(449,'Przysucha'),(450,'Pszczyna'),(451,'Pułtusk'),(452,'Pyrzyce'),(453,'Pyzdry'),(454,'Rabka-Zdrój'),(455,'Radków'),(456,'Radłów'),(457,'Radom'),(458,'Radomyśl Wielki'),(459,'Radoszyce'),(460,'Radzymin'),(461,'Radzyń Chełmiński'),(462,'Rajgród'),(463,'Rakoniewice'),(464,'Raszków'),(465,'Rawicz'),(466,'Recz'),(467,'Rejowiec'),(468,'Resko'),(469,'Reszel'),(470,'Rogoźno'),(471,'Ropczyce'),(472,'Różan'),(473,'Ruciane-Nida'),(474,'Ruda Śląska'),(475,'Rudnik nad Sanem'),(476,'Rybnik'),(477,'Rychwał'),(478,'Rydzyna'),(479,'Ryglice'),(480,'Ryki'),(481,'Rymanów'),(482,'Ryn'),(483,'Rzepin'),(484,'Rzeszów'),(485,'Rzgów'),(486,'Sanniki'),(487,'Serock'),(488,'Sędziszów'),(489,'Sędziszów Małopolski'),(490,'Sępopol'),(491,'Sępólno Krajeńskie'),(492,'Sianów'),(493,'Siechnice'),(494,'Siedlce'),(495,'Siedliszcze'),(496,'Siemianowice Śląskie'),(497,'Sieniawa'),(498,'Sieraków'),(499,'Siewierz'),(500,'Skalbmierz'),(501,'Skała'),(502,'Skarszewy'),(503,'Skaryszew'),(504,'Skawina'),(505,'Skępe'),(506,'Skierniewice'),(507,'Skoczów'),(508,'Skoki'),(509,'Skwierzyna'),(510,'Sława'),(511,'Słomniki'),(512,'Słubice'),(513,'Słupsk'),(514,'Sobótka'),(515,'Sokołów Małopolski'),(516,'Sokółka'),(517,'Solec Kujawski'),(518,'Sompolno'),(519,'Sopot'),(520,'Sosnowiec'),(521,'Sośnicowice'),(522,'Stary Sącz'),(523,'Staszów'),(524,'Stawiski'),(525,'Stawiszyn'),(526,'Stąporków'),(527,'Stepnica'),(528,'Stęszew'),(529,'Stopnica'),(530,'Stronie Śląskie'),(531,'Strumień'),(532,'Stryków'),(533,'Strzegom'),(534,'Strzelce Krajeńskie'),(535,'Strzelce Opolskie'),(536,'Strzelin'),(537,'Strzelno'),(538,'Strzyżów'),(539,'Suchań'),(540,'Suchedniów'),(541,'Suchowola'),(542,'Sulechów'),(543,'Sulejów'),(544,'Sulęcin'),(545,'Sułkowice'),(546,'Supraśl'),(547,'Suraż'),(548,'Susz'),(549,'Suwałki'),(550,'Swarzędz'),(551,'Syców'),(552,'Szadek'),(553,'Szamocin'),(554,'Szamotuły'),(555,'Szczawnica'),(556,'Szczebrzeszyn'),(557,'Szczecin'),(558,'Szczekociny'),(559,'Szczucin'),(560,'Szczuczyn'),(561,'Szczytna'),(562,'Szepietowo'),(563,'Szlichtyngowa'),(564,'Szprotawa'),(565,'Sztum'),(566,'Szubin'),(567,'Szydłowiec'),(568,'Ścinawa'),(569,'Ślesin'),(570,'Śmigiel'),(571,'Śrem'),(572,'Środa Śląska'),(573,'Środa Wielkopolska'),(574,'Świątniki Górne'),(575,'Świebodzin'),(576,'Świecie'),(577,'Świerzawa'),(578,'Świętochłowice'),(579,'Świnoujście'),(580,'Tarczyn'),(581,'Tarnobrzeg'),(582,'Tarnogród'),(583,'Tarnów'),(584,'Tłuszcz'),(585,'Tolkmicko'),(586,'Toruń'),(587,'Torzym'),(588,'Toszek'),(589,'Trzcianka'),(590,'Trzciel'),(591,'Trzcińsko-Zdrój'),(592,'Trzebiatów'),(593,'Trzebinia'),(594,'Trzebnica'),(595,'Trzemeszno'),(596,'Tuchola'),(597,'Tuchów'),(598,'Tuczno'),(599,'Tuliszków'),(600,'Tułowice'),(601,'Tuszyn'),(602,'Twardogóra'),(603,'Tychowo'),(604,'Tychy'),(605,'Tyczyn'),(606,'Tykocin'),(607,'Tyszowce'),(608,'Ujazd'),(609,'Ujście'),(610,'Ulanów'),(611,'Uniejów'),(612,'Urzędów'),(613,'Ustrzyki Dolne'),(614,'Wadowice'),(615,'Wałbrzych'),(616,'Warka'),(617,'Warszawa'),(618,'Warta'),(619,'Wasilków'),(620,'Wąchock'),(621,'Wąsosz'),(622,'Węgliniec'),(623,'Węgorzewo'),(624,'Węgorzyno'),(625,'Wiązów'),(626,'Wieleń'),(627,'Wielichowo'),(628,'Wieliczka'),(629,'Wieluń'),(630,'Wieruszów'),(631,'Więcbork'),(632,'Wilamowice'),(633,'Wiślica'),(634,'Witkowo'),(635,'Witnica'),(636,'Wleń'),(637,'Władysławowo'),(638,'Włocławek'),(639,'Włoszczowa'),(640,'Wojnicz'),(641,'Wolbórz'),(642,'Wolbrom'),(643,'Wolin'),(644,'Wolsztyn'),(645,'Wołczyn'),(646,'Wołomin'),(647,'Wołów'),(648,'Woźniki'),(649,'Wrocław'),(650,'Wronki'),(651,'Września'),(652,'Wschowa'),(653,'Wyrzysk'),(654,'Wysoka'),(655,'Wyszków'),(656,'Wyszogród'),(657,'Wyśmierzyce'),(658,'Zabłudów'),(659,'Zabrze'),(660,'Zagórów'),(661,'Zagórz'),(662,'Zakliczyn'),(663,'Zaklików'),(664,'Zakroczym'),(665,'Zalewo'),(666,'Zamość'),(667,'Zator'),(668,'Zawadzkie'),(669,'Zawichost'),(670,'Ząbkowice Śląskie'),(671,'Zbąszynek'),(672,'Zbąszyń'),(673,'Zduny'),(674,'Zdzieszowice'),(675,'Zelów'),(676,'Zielona Góra'),(677,'Ziębice'),(678,'Złocieniec'),(679,'Złoczew'),(680,'Złoty Stok'),(681,'Zwierzyniec'),(682,'Zwoleń'),(683,'Żabno'),(684,'Żarki'),(685,'Żarów'),(686,'Żelechów'),(687,'Żerków'),(688,'Żmigród'),(689,'Żnin'),(690,'Żory'),(691,'Żukowo'),(692,'Żuromin'),(693,'Żychlin');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `additional_instructions` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `bag_num` bigint(20) NOT NULL,
  `city` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `created` datetime NOT NULL,
  `date` date NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sent` bit(1) NOT NULL,
  `street` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telephone` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `time` time NOT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK584f4isbcq5fjbo9s1950mvsb` (`institution_id`),
  KEY `FK9yilcimbeupq2lyrqr1nlrjyb` (`user_id`),
  CONSTRAINT `FK584f4isbcq5fjbo9s1950mvsb` FOREIGN KEY (`institution_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK9yilcimbeupq2lyrqr1nlrjyb` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_goods`
--

DROP TABLE IF EXISTS `offers_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_goods` (
  `offer_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  PRIMARY KEY (`offer_id`,`goods_id`),
  KEY `FKdxnsgd4tyg5n2h7oo9f8450jt` (`goods_id`),
  CONSTRAINT `FKdxnsgd4tyg5n2h7oo9f8450jt` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `FKj40drf4gvl8p6ndcblbtclc4t` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_goods`
--

LOCK TABLES `offers_goods` WRITE;
/*!40000 ALTER TABLE `offers_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers_receivers`
--

DROP TABLE IF EXISTS `offers_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers_receivers` (
  `offer_id` bigint(20) NOT NULL,
  `receivers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`offer_id`,`receivers_id`),
  KEY `FKw81fcqabfs059ejfb6obgilt` (`receivers_id`),
  CONSTRAINT `FK6mlv95fxr3cbk9tx3j5huq3x8` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  CONSTRAINT `FKw81fcqabfs059ejfb6obgilt` FOREIGN KEY (`receivers_id`) REFERENCES `receivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers_receivers`
--

LOCK TABLES `offers_receivers` WRITE;
/*!40000 ALTER TABLE `offers_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivers`
--

DROP TABLE IF EXISTS `receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivers`
--

LOCK TABLES `receivers` WRITE;
/*!40000 ALTER TABLE `receivers` DISABLE KEYS */;
INSERT INTO `receivers` VALUES (1,'Dzieci'),(2,'Samotne matki'),(3,'Bezdomni'),(4,'Niepełnosprawni'),(5,'Osoby starsze');
/*!40000 ALTER TABLE `receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `org` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `validated` bit(1) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `uuid_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdk0xfnnthbj8afp1ira6sndte` (`location_id`),
  KEY `FKinhjcpukup63uq8nr2cje39j4` (`uuid_id`),
  CONSTRAINT `FKdk0xfnnthbj8afp1ira6sndte` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FKinhjcpukup63uq8nr2cje39j4` FOREIGN KEY (`uuid_id`) REFERENCES `uuid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'N/A','admin@admin.pl',_binary '','Admin','Admin','N/A',_binary '\0','$2a$10$9h9LVV.7InxnzxuchaEy4eIUc8q.VPwgMKlIQnh0dCx3ywMRwLSIK',_binary '',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_org_goods`
--

DROP TABLE IF EXISTS `users_org_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_org_goods` (
  `user_id` bigint(20) NOT NULL,
  `org_goods_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`org_goods_id`),
  KEY `FKr02brq6rai7s60qyor3o46y25` (`org_goods_id`),
  CONSTRAINT `FKn48vpg3j17qneir4fdvjjq78n` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKr02brq6rai7s60qyor3o46y25` FOREIGN KEY (`org_goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_org_goods`
--

LOCK TABLES `users_org_goods` WRITE;
/*!40000 ALTER TABLE `users_org_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_org_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_org_receivers`
--

DROP TABLE IF EXISTS `users_org_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_org_receivers` (
  `user_id` bigint(20) NOT NULL,
  `org_receivers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`org_receivers_id`),
  KEY `FKkjdtk63krkmu9x8jb27kxqpus` (`org_receivers_id`),
  CONSTRAINT `FK52bg3uddnf70h1jrec0wsyoau` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKkjdtk63krkmu9x8jb27kxqpus` FOREIGN KEY (`org_receivers_id`) REFERENCES `receivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_org_receivers`
--

LOCK TABLES `users_org_receivers` WRITE;
/*!40000 ALTER TABLE `users_org_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_org_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKa62j07k5mhgifpp955h37ponj` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuid`
--

DROP TABLE IF EXISTS `uuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pwd_expiry` datetime DEFAULT NULL,
  `pwduuid` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `reg_expiry` datetime DEFAULT NULL,
  `reguuid` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuid`
--

LOCK TABLES `uuid` WRITE;
/*!40000 ALTER TABLE `uuid` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-03 17:04:02
