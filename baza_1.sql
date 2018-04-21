-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: cms_test
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

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
-- Current Database: `cms_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cms_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `cms_test`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Autorzy');
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,19),(2,1,20),(3,1,21),(4,1,22),(5,1,23),(6,1,24),(7,1,25),(8,1,26),(9,1,27),(10,1,28),(11,1,29),(12,1,30);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add Użytkownik',6,'add_user'),(17,'Can change Użytkownik',6,'change_user'),(18,'Can delete Użytkownik',6,'delete_user'),(19,'Can add Dokument',7,'add_document'),(20,'Can change Dokument',7,'change_document'),(21,'Can delete Dokument',7,'delete_document'),(22,'Can add Wydanie',8,'add_edition'),(23,'Can change Wydanie',8,'change_edition'),(24,'Can delete Wydanie',8,'delete_edition'),(25,'Can add Gość',9,'add_guest'),(26,'Can change Gość',9,'change_guest'),(27,'Can delete Gość',9,'delete_guest'),(28,'Can add Prowadzący',10,'add_host'),(29,'Can change Prowadzący',10,'change_host'),(30,'Can delete Prowadzący',10,'delete_host');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_document`
--

DROP TABLE IF EXISTS `cms_body_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `topic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lead` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `edition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_body_document_author_id_c6da8652_fk_cms_body_user_id` (`author_id`),
  KEY `cms_body_document_edition_id_fee237b5` (`edition_id`),
  CONSTRAINT `cms_body_document_author_id_c6da8652_fk_cms_body_user_id` FOREIGN KEY (`author_id`) REFERENCES `cms_body_user` (`id`),
  CONSTRAINT `cms_body_document_edition_id_fee237b5_fk_cms_body_edition_id` FOREIGN KEY (`edition_id`) REFERENCES `cms_body_edition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_document`
--

LOCK TABLES `cms_body_document` WRITE;
/*!40000 ALTER TABLE `cms_body_document` DISABLE KEYS */;
INSERT INTO `cms_body_document` VALUES (1,1,'Wszyscy goście dojadą sami','Fundacje zbierają 1% - zostało tylko kilka dni!','Rozliczając roczny podatek, również możesz pomagać. Podziel się tym, co i tak oddajesz i przekaż 1% swojego podatku dla organizacji użytku publicznego.','<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><span style=\"text-decoration: underline;\"><strong>WOŚP: </strong></span></p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">Celem zbi&oacute;rki 1% podatku dla organizacji pożytku publicznego&nbsp;w roku 2018 prowadzonej przez WOŚP będzie&nbsp;<strong>podnoszenie standardu opieki na oddziałach psychiatrycznych dla dzieci i młodzieży.&nbsp;</strong></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">W 2017 roku zbieraliśmy pieniądze na rzecz hospicj&oacute;w dziecięcych</p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-left: 0.25in; margin-bottom: 0.11in; line-height: 108%;\">Na ten cel przekazaliście nam <strong>7 386 754,15 PLN</strong></p>\r\n<p style=\"margin-left: 0.25in; margin-bottom: 0.11in; line-height: 108%;\">Dziękujemy!</p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">Dzięki Waszemu wsparciu w ramach 1% do tej pory Fundacja WOŚP mogła:</p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">uruchomić Krajowy Program Leczenia Wad Ubytkowych i Wydłużania Kończyn u Dzieci</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">kupić rezonans magnetyczny Instytutu &bdquo;Pomnik-Centrum Zdrowia Dziecka&rdquo; w Warszawie</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">przeprowadzić akcję zakupu defibrylator&oacute;w do plac&oacute;wek publicznych w całej Polsce (przekazaliśmy ich 220)</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">prowadzić Program Edukacyjny &bdquo;Ratujemy i Uczymy Ratować&rdquo;</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">wspom&oacute;c Program Leczenia Osobistymi Pompami Insulinowymi Dzieci z Cukrzycą</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">przekazać wsparcie wszystkim hospicjom dziecięcym w Polsce w postaci samochod&oacute;w osobowych oraz sprzętu medycznego niezbędnego w opiece paliatywnej (m.in.: ssaki, inhalatory, koncentratory tlenu, asy story kaszlu, pompy strzykawkowe, pulsoksymetry oraz ł&oacute;żka rehabilitacyjne z materacami przeciwodleżynowymi). Więcej informacji na temat naszego wsparcia dla hospicj&oacute;w dziecięcych znajdziesz na naszej stronie.</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">uzupełnić zakupy w ramach Narodowego Programu Wczesnej Diagnostyki Onkologicznej Dzieci, podnosząc standard opieki medycznej we wszystkich dziecięcych klinikach onkologicznych w Polsce</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">zakupić najnowocześniejszy sprzęt medyczny dla ratowania życia i zdrowia dzieci: dwa cytometry przepływowe, monitor do pracy w środowisku rezonansu magnetycznego, laser diodowy do leczenia retinopatii wcześniak&oacute;w, inkubator zamknięty do opieki intensywnej, 7 aparat&oacute;w USG wysokiej klasy.</p>\r\n</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><br /> </p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><span style=\"text-decoration: underline;\"><strong>Akogo?:</strong></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\">Dzięki dotychczasowym wpływom z 1% udało nam się m.in.: ukończyć budowę i stworzyć pierwszą w Polsce Klinikę \"Budzik\" dla dzieci w śpiączce (gdzie do końca 2017 roku wybudziło się 39 dzieci).</p>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><br /> </p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><strong>TVN &bdquo;nie jesteś sam&rdquo; </strong></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0.19in; line-height: 100%;\"><strong>Warto pomagać<br /> </strong>Założeniem fundacji jest niesienie pomocy osobom czekającym na trudne bądź drogie zabiegi medyczne, udzielamy pomocy szpitalom i plac&oacute;wkom medycznym. Niesiemy pomoc osobom biednym i instytucjom o ważnym znaczeniu społecznym, będącym w trudnej sytuacji materialnej. Naszym podopiecznym finansujemy turnusy rehabilitacyjne, kupujemy w&oacute;zki inwalidzkie, protezy kończyn.</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%;\"><strong>Jak wykorzystamy 1%<br /> </strong>Fundacja realizuje swoje cele m.in. poprzez:&nbsp;</p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 115%;\">wyposażanie poradni i ośrodk&oacute;w specjalistycznych w sprzęt rehabilitacyjny;</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 115%;\">zakup lek&oacute;w i środk&oacute;w medycznych;</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 115%;\">finansowanie i organizowanie kolonii i wycieczek dla dzieci i młodzieży;</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 115%;\">finansowanie i organizowanie zakupu specjalistycznego sprzętu medycznego</p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><br /> </p>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><br /> </p>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><span style=\"text-decoration: underline;\"><strong>Pytania: </strong></span></p>\r\n<ol>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">Czy z 1% Fundacje faktycznie otrzymują realną pomoc? Czy kwoty przekazywane z 1% są w stanie zasilać konta Fundacji tak, że jest to odczuwane w budżecie?</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">Czy w mentalności Polak&oacute;w, na przestrzeni lat, zmieniało się coś w podejściu do kwestii 1%? Czy świadomie wybieramy cel i przekazujemy pieniądze?</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">Czy Fundacje i organizacje pożytku publicznego się wspierają czy raczej ze sobą rywalizują? I czy w kwestii tego 1% nie jest to pole walki?</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">Czy macie kwotowe zestawienia? Np. Ile w zeszłym roku (2017) nasza Fundacja zostawała pieniędzy dzięki wpłatom na 1%? I czy widać zmiany na przestrzeni lat?</p>\r\n</li>\r\n</ol>\r\n<p style=\"margin-bottom: 0.11in; line-height: 108%;\"><br /> </p>',1,1),(2,1,'8.15 Dworzec Centralny','Robert Biedroń i jego książka o byciu obywatelem','Choć Robert Biedroń nie może narzekać na brak zajęć - tym bardziej, że będzie po raz kolejny ubiegał się o fotel prezydenta Słupska - to jakoś znalazł czas, aby napisać książkę dla dzieci. \"Włącz DEMOkrację\" miała swoją premierę 18 kwietnia. Biedroń opowiada w niej, czym jest demokracja i jak powinna działać.','<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><strong>W opisie książki możemy przeczytać, że \"Włącz DEMOkrację\" to \"wyjątkowa rozgrywka ukryta w interaktywnej książce. Samodzielnie lub całą rodziną zbierz elementy budujące państwo obywatelskie. Poznaj ustroje polityczne i zdobywaj punkty postawy obywatelskiej. Stawiaj czoła przeciwnościom, nie dopuść do anarchii oraz odblokuj postać świadomego obywatela. Bo państwo to r&oacute;wnież Ty i Twoja wiedza o nim oraz Twoje codzienne działania\". </strong></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><strong>\"Włącz DEMOkrację\" nie jest pierwszą książką na koncie Biedronia. Jest r&oacute;wnież autorem \"Tęczowego elementu: czyli (prawie) wszystko, co chcielibyście wiedzieć o gejach i lesbijkach\", kt&oacute;ra ukazała się w 2007 roku. Dwa lata temu ukazał się z nim wywiad rzeka \"Pod prąd\" z 2016 roku. Jego teksty można znaleźć także m.in. w książce \"Homofobia po polsku\", kt&oacute;ra ukazała się w 2004 roku.</strong></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em><strong>Z wywiadu dla Onet.rano</strong></em></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em><strong>Napisałem książkę o demokracji, żeby pokazać, że polityka jest fajna, że może inaczej wyglądać, że nie jest mi wszystko jedno. Nam nie może być wszystko jedno. Demokracja jest instrumentem, kt&oacute;ry może nam dać fajne miasto, fajny kraj, na podstawie wartości, z kt&oacute;rych wszyscy skorzystamy.</strong></em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em><strong>Jak przychodzą matury to najgorsze oceny są nie z matematyki czy polskiego, tylko z WOSu! Cholera jasna!</strong></em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em><strong>Młode pokolenie ma większe perspektywy i więcej odwagi w podejmowaniu takich decyzji, kt&oacute;re niekoniecznie będą partyjne, tylko prospołeczne.</strong></em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em><strong>Dzisiaj w sejmie jest potrzebna partia alternatywna.</strong></em></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><span style=\"text-decoration: underline;\">Ostatni wywiad Biedronia dla polskiego Vogue\'a z lutego 2018r.</span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">(&hellip;) Mieszkacie panowie razem w Słupsku?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Mieszkamy i w Słupsku, i w Warszawie, i w Gdyni. Mamy w tych trzech miejscach nasze rzeczy. Ważne książki, pamiątki. Ale widujemy się rzadko.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Co to znaczy &ndash; rzadko? </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Średnio raz w tygodniu. Jeszcze trzy lata temu, jak zaczynałem kadencję, to nie tęskniłem tak bardzo. Ale teraz, po trzech latach rozłąki, jest to coraz trudniejsze do zniesienia. Nie wiem, czy to wynika z rosnącego przywiązania, czy ze starości, czy też z tego, że zbyt rzadko się spotykamy, ale to dla mnie coraz większy problem. Kiedyś było mi z tym łatwiej. Krzysztof bardzo się o mnie martwi. Przeżywa, jak nie odbieram telefonu przez p&oacute;ł godziny. W moim życiu dużo się dzieje medialnie. Przez to chyba Krzysztof ma poczucie, że nie ma nad tym kontroli, obawia się, że może mi się stać krzywda, że ktoś mnie zaatakuje. Ale w polityce to jest normalne, że jest się ciągle pod obstrzałem. Myśleliśmy, żeby Krzysztof przeprowadził się do Słupska i pewnie tak się stanie, jak będę kandydował</em></span><span style=\"font-family: Arial, serif;\"> na kolejną kadencję. Bo nie wyobrażam sobie, żeby tak żyć na dłuższą metę.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Chce pan kandydować na drugą kadencję w Słupsku?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Zapowiedziałem już, że tak.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czyli nie będzie pan kandydował na prezydenta Polski?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Wybory na prezydenta Słupska są przed wyborami prezydenckimi.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Dlatego musiałby pan wybrać wcześniej.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Już wybrałem. Wybory prezydenckie w Słupsku. Dzisiaj nie mam plan&oacute;w kandydować na urząd prezydenta Polski. Dopiero co miałem zebranie ścisłego kierownictwa w ratuszu i rozmawialiśmy o strategii rozwoju Słupska.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">I jaka jest ta strategia?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Słupsk jako zielone miasto nowej generacji. To nie jest łatwe, bo społeczeństwo dopiero się uczy myślenia obywatelskiego. Ale Słupsk już zbudował sobie markę miasta progresywnego, otwartego. Jestem z tego bardzo dumny. Zastanawiamy się, jak to rozwijać. Jeżeli chodzi o wizję rozwoju społeczeństwa, to Słupsk idzie pod prąd og&oacute;lnopolskiej polityki. Chcemy udowodnić, że można budować wsp&oacute;lnotę na innych wartościach niż te, kt&oacute;re oferuje rząd.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Ale Słupsk to nie jest pana rodzinne miasto. Pochodzi pan z Rymanowa w Podkarpackiem.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Tak, ale w Rymanowie urodziłem się przez przypadek. Po prostu oddział położniczy w szpitalu w Krośnie był zamknięty, bo mieli dezynsekcję, a moja mama musiała gdzieś urodzić. I najbliższy szpital, oddalony o jakieś 20 kilometr&oacute;w, był właśnie w Rymanowie. W Krośnie wychowywałem się do piętnastego roku życia. P&oacute;źniej wyjechałem do Ustrzyk Dolnych do szkoły średniej, ponieważ chciałem i rodzice też chcieli, abym uczył się język&oacute;w obcych. A w latach 90. jedynymi szkołami, gdzie można się było uczyć język&oacute;w, były technika hotelarskie. Uczyłem się tam trzech język&oacute;w obcych: rosyjskiego, angielskiego i francuskiego. A języki to moja pasja. Miałem do nich talent. Więc w zasadzie przez przypadek skończyłem to technikum w Ustrzykach Dolnych. Ale dzięki temu zakochałem się w g&oacute;rach. Każdy weekend spędzałem na wyprawach. Zrobiłem uprawnienia przewodnika g&oacute;rskiego.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">To dlaczego jest pan prezydentem nadmorskiego Słupska?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Bo moją gł&oacute;wną pasją jest życie publiczne. Od dziecka byłem liderem, w sensie &ndash; przyw&oacute;dcą bunt&oacute;w. Już w szkole podstawowej organizowałem protesty przeciwko naszej wychowawczyni.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">(...) </span><span style=\"font-family: Arial, serif;\"><em>Zawsze staram się być szczery. P&oacute;źniej miałem też problemy w szkole średniej. Wyrzucono mnie i z internatu, i ze szkoły. Zorganizowałem bunt przeciwko jednemu naszemu nauczycielowi, r&oacute;wnież za to, że był niesprawiedliwy. A w internacie, kt&oacute;rego byłem przewodniczącym &ndash; zawsze byłem liderem struktur i organizacji, zawsze się angażowałem &ndash; zakumplowałem się z lokalnym środowiskiem ze szkoły z Ustrzyk Dolnych. Często wracałem bardzo p&oacute;źno, a z internatu można było wychodzić i wracać jedynie w określonych godzinach. A ja wracałem o drugiej, trzeciej w nocy. I to niestety pod wpływem alkoholu.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czyli podw&oacute;jnie łamał pan regulamin. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>W ten spos&oacute;b znalazłem się w ośrodku szkolno-wychowawczym. Mieszkałem tam przez niemal dwa lata. Trafiłem tam dlatego, że w Ustrzykach Dolnych były dwa ośrodki z internatem. Z jednego mnie wyrzucono, więc mogłem p&oacute;jść tylko do tego drugiego. I byłem jedynym mieszkańcem ośrodka, kt&oacute;ry chodził do szkoły średniej. W związku z tym, nikt się mną specjalnie nie interesował. Nikt mnie nie kontrolował. Mogłem wracać, o kt&oacute;rej chciałem, robić, co chciałem. Ale też poznałem dużo dzieciak&oacute;w, kt&oacute;re doświadczyły przemocy. Poznałem problemy, kt&oacute;re może znałem z życia osobistego, ale nie w takiej skali.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Chodziło o przemoc, kt&oacute;rej te dzieci doświadczyły jeszcze w domu?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>I w internacie, i w domu. Tam były dzieci po gwałtach, molestowane, chore, porzucone przez rodzic&oacute;w. Był chłopiec, kt&oacute;rego inne dzieciaki nazywały &bdquo;kurczak&rdquo;, bo jego rodzice połamali mu wszystkie paluszki i nie leczyli tego. Więc te palce mu się tak zrosły, że miał je kompletnie wykrzywione. Nie był w stanie tymi rękoma nic zrobić. Była dziewczynka, kt&oacute;ra była chyba niepełnosprawna intelektualnie. Pamiętam, że ciągle uciekała z internatu. Biegała na działki, na kt&oacute;rych zadawała się z r&oacute;żnymi panami, oni ją wykorzystywali seksualnie. Pamiętam, że pr&oacute;bowano ją zatrzymać, a ona wrzeszczała, żeby ją puścić, że ona chce tam iść.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Chciałabym się tutaj na chwilę zatrzymać. Powiedział pan, że spotkał dzieci, kt&oacute;re miały problemy, kt&oacute;re znał pan z życia osobistego. R&oacute;wnocześnie nie poświęcił pan w swojej opowieści praktycznie ani zdania temu, co się działo w Krośnie. Dlaczego?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Przed tą rozmową zastanawiałem się, czy będzie mnie pani o to pytać. Bo nie zawsze mam siłę, aby o tym m&oacute;wić, ale też wiem, że o tym m&oacute;wić trzeba. Mimo to nie jest to łatwe. Łatwiej mi się opowiada o szkole. Może jakby pani zrobiła jakąś atmosferę, byłoby mi prościej.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Staram się. Zam&oacute;wiłam nawet śnieg, kt&oacute;ry tak ładnie pr&oacute;szy za oknem. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>To tym bardziej jest mi ciężko. Pamiętam ze dwie, może trzy Wigilie, jak czekaliśmy z rodzeństwem i matką na ojca. Matka wszystko przygotowywała. A jego nie było. Wreszcie przychodził kompletnie pijany i nas bił.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Raz w Wigilię musieliśmy uciekać wszyscy z domu, ale nie wiedzieliśmy, dokąd. Nikt z sąsiad&oacute;w nie chciał nam otworzyć drzwi. Śnieg wtedy też tak padał. I staliśmy w tym sypiącym śniegu na dworcu PKS i czekaliśmy na autobus &ndash; moja mama pochodziła z Brzozowa, to jest wieś oddalona 20 kilometr&oacute;w od Krosna &ndash; żeby pojechać do jej rodzic&oacute;w i tam się przespać. I choć oczywiście przeżywam za każdym razem, gdy o tym m&oacute;wię, to uważam, że powinienem. Ojciec już nie żyje. Szkoda, bo to on powinien to usłyszeć w pierwszej kolejności. Ale moja matka ma Facebooka, a ja tę rozmowę na pewno tam umieszczę i ona to przeczyta. Proszę sobie pomyśleć, co ona czuje, gdy ja o tym opowiadam?!</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Myślę, że przez takie doświadczenia pana wrażliwość społeczna, wrażliwość na krzywdę innych są tak duże.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Pewnie tak. Pytanie tylko, czy warto płacić taką cenę, aby mieć dużą wrażliwość? Czy warto przechodzić przez to wszystko? Musiałem bardzo dużo pracować nad sobą, żeby nie reprodukować tego, co robił ojciec. Moi bracia i moja siostra też, wszyscy musieliśmy to wewnętrznie przepracować.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Ma pan dziś kontakt z rodzeństwem?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Oczywiście. Najmniejszy z siostrą, bo jak ona się urodziła, to miałem 18 lat i już nie mieszkałem w domu. Szedłem na studia, a rodzice wyjeżdżali do Stan&oacute;w Zjednoczonych i moja siostra tam się wychowywała. Więc nie mieliśmy dużego kontaktu.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">A jakoś się potem ta relacja poukładała?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Słabo, mieszkałem daleko od domu i praktycznie w nim nie bywałem. Gł&oacute;wnie ze względu na ojca. On wtedy już był grzeczniejszy, spokorniał, ale nadal sprawiał problemy. P&oacute;źniej zachorował na raka płuc. Wtedy się nim opiekowałem. A ponieważ leczył się w Centrum Onkologii w Warszawie, dwa razy w tygodniu przemierzałem z nim trasę z Krosna do Warszawy, a potem z Warszawy do Krosna. Na chemię, na badania. Miałem straszną pokusę rozmawiać z nim o sprawach z przeszłości, ale nigdy nie znalazłem w sobie odwagi. A spędzaliśmy ze sobą w tym okresie naprawdę bardzo dużo czasu. A gdy już było wiadomo, że ojciec umiera&hellip; Nawet wtedy nie dałem rady z nim porozmawiać.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Żałuję, że nigdy nie napisałem do niego chociażby listu &ndash; są rzeczy, kt&oacute;rych się nigdy nie odwr&oacute;ci. Zostałem z tym sam po jego śmierci. I choć rozmawiam dziś z ojcem, czasem nawet w snach, to to nie jest to samo. Nigdy mu już nie powiem tego, co chciałbym mu naprawdę powiedzieć.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Dzisiaj &ndash; jako prezydent miasta &ndash; wiem, jak dużo jest takich historii. W Słupsku prowadzimy schronisko dla ofiar przemocy i każdego dnia uciekają do niego kobiety z dziećmi. Każdego dnia! W ubiegłym tygodniu wręczałem nagrody pracownicom, kt&oacute;re prowadzą to schronisko. Podczas gali przedstawiły statystyki, z kt&oacute;rych wynika, że w samym Słupsku mają kilka tysięcy interwencji rocznie. I nie zdarzyło im się jeszcze &ndash; a to schronisko prowadzą od 20 lat &ndash; żeby do tego schroniska uciekł mężczyzna.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Statystyki nie kłamią.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Ale faceci często je wyśmiewają, m&oacute;wiąc, że przecież mężczyźni też są ofiarami przemocy. Są, ale skala zjawiska jest inna. Wychowałem się na ulicy Kolejowej w Krośnie &ndash; więc może pani sobie wyobrazić, jakie to było podw&oacute;rko. Praktycznie w każdej rodzinie był ojciec, kt&oacute;ry był alkoholikiem i lał żonę. Widok ojca, kt&oacute;ry leżał pijany w krzakach był normalny. Wstydziłem się tego, ale z drugiej strony wiedziałem, że kolega też tak ma. Ciekawe było r&oacute;wnież to, że matki nie były solidarne. Przychodziły do pracy z podbitym okiem, a i tak wciskały kit, że się uderzyły, potknęły. Wszyscy wiedzieli. A nikt z tym nic nie robił. I to trzeba zmienić.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">(...) Bierność i znieczulica to straszne choroby. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Miałem więcej sytuacji bezpośredniej przemocy. Kiedyś na Ostrobramskiej w Warszawie szedłem z Krzyśkiem do kina &ndash; dw&oacute;ch facet&oacute;w, to pedały na pewno&hellip; Mijała nas grupa bandyt&oacute;w. I oni z czystej nienawiści zaczęli nas bić. Wbiegliśmy na jezdnię i prosiliśmy o pomoc. Samochody na nas trąbiły i nikt się nie zatrzymał. Wtedy wylądowałem w szpitalu, tak mnie pobili. Ale to była cena, kt&oacute;rą zapłaciłem, bo chciałem żyć na własnych zasadach.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Co pan ma na myśli?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Zanim pojechałem na studia, miałem plany, żeby jeździć w wakacje stopem po Europie. Wcześniej jeździłem tak z bratem, ale wtedy pojechałem sam. Daleko nie zajechałem. Moja przygoda zakończyła się w Berlinie. Bo poznałem tam pierwszego w życiu chłopaka i się zakochałem. Okazało się, że bez wzajemności. Ja traktowałem to jako największą przygodę życia, a on nie. Ale przy okazji zobaczyłem, że inny świat jest możliwy. To, o czym do tej pory tylko czytałem, zobaczyłem na własne oczy. Przekonałem się, że można żyć inaczej. To dodało mi skrzydeł.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Po roku studi&oacute;w w Olsztynie wyjechałem do Londynu. Tam kontynuowałem przez rok, na Open University, nauki polityczne. To właśnie Londyn był dla mnie miejscem emancypacji. Wkręciłem się w organizacje pozarządowe. Skumałem z Peterem Tatchellem, najbardziej znanym aktywistą gejowskim w Wielkiej Brytanii, odznaczonym przez kr&oacute;lową, i tam działałem z nim w organizacji OutRage! (brytyjska grupa walcząca o prawa os&oacute;b LGBTQ, w latach 1991-2011 &ndash; przyp. red.). I wr&oacute;ciłem do Polski kompletnie odmieniony. Doskonale już wiedziałem, czego chcę. Wiedziałem, że już nigdy &bdquo;nie wr&oacute;cę do szafy&rdquo;. Że nawet, jakby spotykały mnie tylko złe rzeczy, to mam tylko jedno życie i szkoda by go było zmarnować, więc muszę je przeżyć na własnych zasadach. W Olsztynie zaangażowałem się w pracę w organizacji Lambola Olsztyn &ndash; (grupa skupiająca osoby LGBTQ &ndash; przypis red.), zaangażowałem się też w życie polityczne, zapisałem się do frakcji młodych SDRP i zacząłem działać. I tak się wszystko w tym Olsztynie zaczęło. Potem poznałem chłopaka, z kt&oacute;rym przenieśliśmy się do Warszawy. W 2000 roku zacząłem pracować w agencji reklamowej. A rok p&oacute;źniej zostałem wybrany posłem z Gdyni i Słupska.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czemu właśnie stamtąd?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Gdynię i Słupsk odziedziczyłem po Izie Jarudze-Nowackiej. Iza była posłanką właśnie z tamtego okręgu. Kiedy zginęła w katastrofie pod Smoleńskiem, ktoś musiał kontynuować jej dzieło.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">(&hellip;) </span><span style=\"font-family: Arial, serif;\"><em>To była wspaniała i odważna kobieta. Pamiętam, jak kiedyś szliśmy pod Wawelem na przedzie w marszu r&oacute;wności. Kibole i chuligani z Młodzieży Wszechpolskiej rzucali w nas butelkami i kamieniami. Bałem się. Szczeg&oacute;lnie, że jako organizator czułem odpowiedzialność za ludzi, kt&oacute;rzy brali udział w tym marszu. A Iza powiedziała wtedy: Robert, nie b&oacute;j się. Zobacz, oni mają tylko kamienie, a my mamy ludzi. Obejrzałem się. I zobaczyłem, że za nami idzie nieprawdopodobny tłum ludzi. Iza jest dla mnie ikoną. Więc to było naturalne, że powinienem startować na prezydenta Słupska. I choć nie miałem wcześniej nic wsp&oacute;lnego z Gdynią i Słupskiem, to zamieszkałem w Gdyni. Do dziś jestem tam zameldowany. Nie w Słupsku, choć to w nim płacę podatki.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Byłam w Słupsku rok temu i jestem zachwycona. Zadbane trawniki, ładne kamienice, r&oacute;wne chodniki. Piękny ratusz.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>To teraz musi pani przyjechać, jak jeszcze więcej się zmieniło. Przez dwa lata to gł&oacute;wnie zaciskaliśmy pasa i niewiele inwestowaliśmy, trzeba było ratować miasto. Teraz jest dużo, dużo więcej inwestycji i jest dużo ładniej. Jak będzie pani teraz, to zapraszam do mnie, do ratusza.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Byłam i jadłam na dole w restauracji pierogi. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Mamy teraz wegetariańskie i wegańskie menu. Musi pani spr&oacute;bować. Trzeba było też wejść do mnie do gabinetu i zobaczyć.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Nie mogłam przecież tak z ulicy wejść do pana.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Dlaczego? Ludzie tak robią. Zapraszam.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Pan zawsze był taki otwarty na ludzi?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Zawsze. Jako młody chłopak chciałem p&oacute;jść na italianistykę i rozwijać pasję do język&oacute;w. Ale moi przyjaciele się z tego śmiali, m&oacute;wili: Robert, przecież ty jesteś urodzonym społecznikiem. Musisz zostać politykiem albo dziennikarzem. Nie możesz studiować italianistyki. I w ostatnim momencie przeniosłem dokumenty. Było już trochę za p&oacute;źno, żeby kombinować, to były czasy, kiedy się zdawało na studia. Jedyne studia, gdzie na egzaminach nie było historii &ndash; a z niej bym się już po prostu nie zdążył przygotować &ndash; to były nauki polityczne w Olsztynie. Dzisiaj, jakbym miał głęboko analizować, to może specjalnie wyjechałem tak daleko od domu. Ale wtedy tak nie myślałem. Nigdy wcześniej nie byłem w Olsztynie. Pojechałem tam pierwszy raz na egzaminy. Co się dla mnie skończyło bardzo źle osobiście.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">To znaczy?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Dostałem się bez problem&oacute;w, zdałem z bardzo dobrymi stopniami. Ale w Olsztynie poznałem chłopaka, kt&oacute;ry mnie wyautował przed rodzicami.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Jak to?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Zadzwonił do mojej matki i powiedział, że mnie kocha. Nie było jeszcze kom&oacute;rek i zadzwonił na stacjonarny. Ja do niego nic nie czułem, ale on się zakochał. Nie wiem, jak to było możliwe, ale tak się stało. Miałem osiemnaście lat. A on mojej matce powiedział przez telefon, że mnie kocha i chce być ze mną. Moja matka w og&oacute;le nie zrozumiała, o co chodzi. Ale zadzwonił jeszcze raz, bo się nie poddawał. I za drugim razem zrozumiała. Miała widocznie czas na przemyślenie sprawy.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">I co?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>To był pierwszy raz z dw&oacute;ch, kiedy widziałem matkę w takiej histerii. Raz &ndash; jak umarł m&oacute;j ojciec, a drugi raz &ndash; jak się dowiedziała, że jestem gejem. To była rozpacz. Ona nie była kompletnie na to przygotowana. Czy pani kiedyś widziała kogoś, kto się dowiedział, że umiera mu najbliższa osoba? Ona tego dnia straciła syna.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Przeszło jej to?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Oczywiście. Dziś biega z tęczową flagą. Przyjeżdża do nas w odwiedziny, kocha Krzyśka. Ale wtedy to był dla niej koniec świata, wpadła w czarną rozpacz. W latach 90. funkcjonował stereotyp geja albo z filmu &bdquo;Philadelphia&rdquo;, gdzie jeden się opiekuje drugim, bo ten umiera na AIDS, albo Stephena z &bdquo;Dynastii&rdquo;.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Stereotyp, że geje są samotni, że molestują dzieci i umierają na AIDS &ndash; moja matka dokładnie tak mnie widziała. Miałem 18 lat, jeszcze nie wiedziałem wiele, a obraz, kt&oacute;ry kreśliła przede mną matka, był straszny. Ale dla mojej matki straszne było jeszcze jedno: co ludzie powiedzą? Nieważne, że ojciec alkoholik, kt&oacute;ry nas leje, najważniejsze, żebym o tym nikomu nie m&oacute;wił. Na szczęście to były wakacje i wyjechałem na studia do Olsztyna, a moi rodzice wyjechali do Stan&oacute;w.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Ten okres separacji pom&oacute;gł?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Pozwolił na pewne przemyślenia i na szczęście, uwaga, moi rodzice zamieszkali tam obok pary lesbijek &ndash; w New Jersey koło Nowego Jorku, kt&oacute;re wprowadziło jako pierwsze małżeństwa homoseksualne. Moja matka zaprzyjaźniła się z tymi lesbijkami. I po p&oacute;ł roku dostałem od niej poczt&oacute;wkę na dzień dziecka: Robercie, co u ciebie, dlaczego się nie odzywasz?</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>To był sygnał, że coś się zmieniło i poukładało. Do Polski matka wr&oacute;ciła odmieniona, poznała mojego Krzyśka. Wszystko, co ona wie o mnie, jest związane z Krzyśkiem. Jesteśmy razem już 15 lat. Więc wie, że nie jestem samotny, nie molestuję dzieci i nie umieram na AIDS, a ludzie już nic nie powiedzą, bo wszyscy wiedzą.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Dla niej było to też trudne, bo musiała konfrontować się z synem, kt&oacute;ry m&oacute;wił o tym nie tylko rodzinie i znajomym, ale całemu światu. Dostawała listy, że powinna mnie utopić w jeziorze &ndash; pokazywała mi je czasami. Dziś ludzie do niej podchodzą i gratulują syna. Na początku płakała, co ja jej narobiłem, ale dziś płacze ze szczęścia. Jak ona przeczyta ten wywiad w &bdquo;Vogue&rsquo;u&rdquo;, to będzie płakała. Ze szczęścia. Jest ze mnie dumna.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>',1,1),(3,1,'z rodziną','Dzieci z domu dziecka pojadą do Barcelony','• Wychowawca z łódzkiego Domu Dziecka nr 7 chce zabrać grupę swoich podopiecznych do Barcelony. Nie będzie to jednak zwykły wyjazd, a wyjazd rolkarski. Dzieci już od jakiegoś czasu uczą się jeździć na rolkach, traktując sport jako źródło radości i sposób na poradzenie sobie z niełatwą sytuacją życiową.','<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><strong>Żeby zebrać odpowiednie fundusze na wyjazd pan Artur prowadzi zbi&oacute;rkę na platformie polakpotrafi.pl. Do końca został tylko tydzień. Pom&oacute;żmy Roller Pack zrealizować ich plan! </strong></span><span style=\"font-family: Wingdings, serif;\"><strong></strong></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><a href=\"https://polakpotrafi.pl/projekt/roller-pack-chce-zwiedzac-swiat\"><span style=\"font-family: Arial, serif;\"><strong>https://polakpotrafi.pl/projekt/roller-pack-chce-zwiedzac-swiat</strong></span></a></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><span style=\"text-decoration: underline;\">Artur Bryński &ndash; wychowawca, pomysłodawca wycieczki i zbi&oacute;rki pieniędzy na polakpotrafi.pl</span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Chciałem pomagać dzieciom i młodzieży odkąd zobaczyłem film \"Młodzi gniewni\". Po latach stało się to moją pasją pracą. Pierwsze doświadczenia w resocjalizacji nabyłem podczas studi&oacute;w licencjackich. Pierwszy staż okazał się prawie dwuletnim wolontariatem w pogotowiu opiekuńczym, gdzie następnie zostałem zatrudniony jako młodszy wychowawca. P&oacute;źniej zaangażowałem się w wolontariat w Monarze w Łodzi. Przez rok pracowałem z osobami uzależnionymi od substancji psychoaktywnych. Ćwiczyliśmy muay thai, organizowaliśmy biegi w maratonach, uczestniczyłem jako terapeuta w spływach kajakowych i wyprawach g&oacute;rskich podczas wakacji. Moja edukacja zakończyła się na tytule magistra pedagogiki i resocjalizacji. Od czterech lat jestem wychowawcą w Domu Dziecka w Łodzi. </em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Przygoda z rolkami zaczęła się dzięki moim podopiecznym. Dzięki pomocy wielu ludzi kupiliśmy dużo używanych rolek i zbudowaliśmy prawdziwą \"rolkową bandę\". W pracę włączyli się wolontariusze i instruktorzy. Jedna z firm zaopatrzyła nas w nowy sprzęt. Coraz więcej się dzieje. Umiejętności moich podopiecznych są na tyle wystarczające, by brać udział w imprezach \"night skating\", razem z ok. 200 osobami. Jeżdżenie opr&oacute;cz zabawy ma r&oacute;wnież funkcje terapeutyczne. Pozwala uwolnić się od smutku, frustracji czy złości. Uczy wzajemnego dbania o sobie, odpowiedzialności za innych. Dzieci przyswajają i utrwalają zasady ruchu drogowego.</em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Wyzwaniem jakie sobie postawiłem jest zorganizowanie wycieczki do Barcelony dla mnie i moich podopiecznych. Powod&oacute;w jest wiele. Ostatecznie zadecydowało to, że dzieciaki są fanami hiszpańskich klub&oacute;w piłki nożnej. Sam wylot zapewni dzieciom niesamowite wrażenia, a zetknięcie z odmienną kulturą, konieczność porozumiewania się w języku innym, niż ojczysty, może zachęcić dzieciaki do nauki język&oacute;w obcych. </em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Moja Dyrekcja dała mi pozwolenie na akcję, mało tego - bardzo mnie w tym wspiera i wkłada dużo wysiłku w dopinanie akcji pod względem formalnym.</em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Byłem w Barcelonie w 2016 roku, moją misją było zwiedzanie miasta rolkowo. Mimo, że zostałem okradziony i miałem na przetrwanie 5-7 Euro dziennie (nocleg był opłacony) to dałem radę. Teraz czas na przygodę z dzieciakami!</em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Roller Pack to grupa pięciorga dzieciak&oacute;w oraz dw&oacute;ch wychowawc&oacute;w. Podopieczni będą wybrani ze względu na swoje umiejętności jeździeckie oraz sytuację prawną (chcę zabrać dzieci, kt&oacute;re mają uregulowaną sytuację prawną). Opiekować się będę nimi ja oraz moja koleżanka z pracy, Natalia Jurkiewicz.</em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Dzieci rywalizują o miejsce w ekipie. Kiedyś był podział na trzy kategorie rolkarskie : wilki - grupa najlepsza, gąski - średnio zaawansowana oraz gapcie. Dziś w tym całym amoku projektowym jeszcze grupy nie są jasno ogłoszone. Do Barcelony jadą najlepsi rolkarze i najbardziej zaangażowani pr&oacute;cz Martynki. Martynka jest wyjątkiem. Będzie ona wsparciem dla swojej wychowawczyni, kt&oacute;ra nie jeździ tak sprawnie jak pozostała grupa ;-)</em></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Bardzo chciałbym pr&oacute;bować nowych rzeczy i działać dalej. Tak naprawdę pierwszy raz jest to coś tak dużego. Jestem fanem aktywności. Chciałbym rozwijać nudne wychowywanie i resocjalizację i wejść na inny poziom. Podr&oacute;żować z dzieciakami i pokazywać im świat, spr&oacute;bować surfingu, popływać kajakami, nurkować.... Na razie skupię się jednak na rolkach.....Tak jak piszę w projekcie - stacja pierwsza to Barcelona....kolejna może Włochy, może Czechy....kto wie;-)</em></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><span style=\"text-decoration: underline;\">Wioleta Kawczyńska &ndash; </span></span><span style=\"font-family: Arial, serif;\">r&oacute;wnież wychowawczyni w DD nr 7. Wspiera Artura &ndash; pomaga mu propagować zbi&oacute;rkę w mediach społecznościowych i nie tylko, zna dobrze dzieciaki. Nie jedzie, niestety, do Barcelony, ale jest bardzo zaangażowana w projekt.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><span style=\"text-decoration: underline;\">Dzieci:</span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Adam Smoczyński - lat 12. Uczeń piątej klasy. Lider wśr&oacute;d swojej grupy r&oacute;wieśniczej i świetny pomocnik podczas wypraw rolkarskich. Uczy się dbania o grupę i każdego z członk&oacute;w. Pracujemy by zmienił spos&oacute;b komunikowania się z ludźmi na mniej złośliwy i bardziej grzecznościowy. Prawdziwy rozrabiaka tak więc nuda przy nim jest \"niedostępna\". Jego trudny charakter nie przykrywa wielkość jego serducha. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Kuba Smoczyński - brat Adama. Lat 10. Jest uczniem klasy czwartej. Jest adwokatem swoich koleg&oacute;w. Zawsze ma coś do powiedzenia podczas tutejszych rozm&oacute;w i dyskusji. Uzależniony od przytulania się i łapania mnie za uszy. Kiedy się uprze, chodzi za tobą niczym cień. Prawdziwa maskotka. Poszukuje swojego własnego miejsca w grupie. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Martyna Kruk - lat 10. Także uczennica klasy czwartej. Chodzący słodziak. Jej umiejętności rolkarskie są umiarkowane, ale posiada niesamowity zapał do jazdy. Robi ogromne postępy i myślę, że niedługo dorośli będą mieli problem by ją dogonić;-) </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Oliwier Bem - lat 12. Uczeń klasy piątej. Swoimi żartami i wygłupami doprowadza do łez. Każdego dnia uśmiecha się i dba by dookoła nie było szaro. Dobry bajerant i sztukmistrz podrywania. Jeden z najdłużej jeżdżących ze mną dzieci. Sport pozwala mu się wyciszać i wypocić smutki. </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Kinga Łuczak - lat 17. Pierwsza klasa licealna. Najbardziej zaangażowana osoba wśr&oacute;d nas. Do szkoły pędzi na rolkach, uczestniczy regularnie w wydarzeniach społecznych typu NIGHT SKATING, czyści rolki, porządkuje, wymienia k&oacute;łka. Rolki pozwoliły jej się przełamać w kontakcie z innymi osobami i r&oacute;wieśnikami. Jest ekspresyjna a przy tym wyjątkowa.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><span style=\"text-decoration: underline;\">Fundusze zbieramy na jednej z platform crowdfundingowych</span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Koszt wyjazdu: </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Atrakcje i zwiedzanie: 1725 pln </span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Noclegi - 8 nocy - około 9000 pln</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Bilety lotnicze - od 2800 do 5600 pln (cena zależna od linii lotniczych)</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Żywność - 5800 pln</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Opłata dla polakpotrafi.pl - ok 2300</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Suma 19700 - 25300 pln</span></p>',1,1),(4,1,'9.20','Temat: Od dziś można pić alkohol na Bulwarach Nadwiślańskich','• Pod koniec stycznia zostały znowelizowane przepisy ustawy o wychowaniu w trzeźwości. Wprowadzony został \"generalny zakaz picia alkoholu w miejscach publicznych z wyłączeniem miejsc do tego przeznaczonych\". Decyzję co do tego, w jakich obszarach będzie można spożywać alkohol, pozostawiono w kompetencjach samorządów.','<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><strong>W połowie marca Rada Warszawy zgodnie zadecydowała, że picie alkoholu na Bulwarach Wiślanych nie będzie zakazane. Oznacza to, że legalnie spożywać trunki będzie można na terenie Flotylli Wiślanej, czyli od początku bulwaru, Grzymały Siedleckiego, gen. Pattona, J.Karskiego oraz Z.Religi, na szerokości od linii brzegu rzeki do wschodniej granicy drogi rowerowej lub chodnika. Uchwała wchodzi w życie w piątek, 20 kwietnia. </strong></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><strong>Z ustawy o wychowaniu w trzeźwości: Osoba, kt&oacute;ra będzie pić alkohol w miejscu publicznym, popełnia wykroczenie, kt&oacute;re karane jest grzywną. Jej wysokość wynosi ok. 100 zł. Co warte podkreślenia, kwotę należy uiścić w ciągu 7 dni od daty otrzymania mandatu. Jeśli go nie przyjmiemy, sprawa zostanie przekazana do sądu. </strong></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><span style=\"text-decoration: underline;\"><strong>Mariusz Frankowski &ndash; p.o. dyrektora Mazowieckiej Jednostki Wdrażania Program&oacute;w Unijnych </strong></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Co do mojej roli w tej sprawie to dyskutowaliśmy na ten temat zar&oacute;wno na posiedzeniu Komisji Rozwoju Gospodarczego, kt&oacute;rej przewodniczę, jak i wsp&oacute;lnej Komisji Bezpieczeństwa i Porządku Publicznego w Radzie Miasta. Od początku zwracałem uwagę na kwestie ryzyk z tym związanych, ale jednocześnie podkreślałem, że to najlepsze miejsce do zniesienia zakazu na obszarze Warszawy.</em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Jakie czynniki brał pod uwagę samorząd, wyłączając z zakazu picia w miejscach publicznych akurat te, a nie inne miejsca Warszawy? Czym się Państwo kierowaliście?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Wyremontowane przez miasto bulwary wiślane słały się jednym z najpopularniejszych miejsc w Warszawie. W każdy ciepły weekend przyciągają tysiące mieszkańc&oacute;w i turyst&oacute;w, kt&oacute;rzy chcą odpocząć nad rzeką. W ramach całościowej modernizacji bulwary zostały wyposażone w niezbędną infrastrukturę: toalety, kosze na śmieci czy system monitoringu miejskiego. Biorąc pod uwagę właśnie te dwa czynniki, czyli popularność tego miejsca i odpowiednie zaplecze techniczne radni uznali, że jeżeli mamy brać pod uwagę skorzystanie z nowych przepis&oacute;w, kt&oacute;re pozwalają wskazać miejsca, gdzie można spożywać alkohol, to bulwary są do tego najlepiej przygotowane. </em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czy straż miejska będzie częściej patrolować okolice miejsc, w kt&oacute;rych można spożywać alkohol?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Oczywiście dodatkowym środkiem zapewniającym bezpieczeństwo są działania straży miejskiej prowadzone na bulwarach. Patrole reagują i będą reagowały na wszelkie pr&oacute;by zakł&oacute;cania porządku lub śmiecenia. Kwestie bezpieczeństwa i ewentualnie zapewnienia dodatkowych patroli były jednym z wyraźnie podkreślanych element&oacute;w w czasie dyskusji na ten temat na posiedzeniach Komisji w Radzie Miasta, jak r&oacute;wnież w czasie samej sesji Rady. Dodatkowo na czwartkowej (19 kwietnia) sesji Rady Miasta będzie r&oacute;wnież głosowany projekt uchwały wprowadzający podobne odstępstwo na słynnej &bdquo;Poniat&oacute;wce&rdquo; a więc na terenach prawobrzeżnej strony Wisły w pobliżu Stadionu Narodowego. Myślę, że r&oacute;wnież znajdzie poparcie radnych miejskich. </em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czy miejsca, w kt&oacute;rych picie alkoholu jest dozwolone, będą jasno wydzielone, wyraźnie oznaczone?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Traktujemy to rozwiązanie jako program pilotażowy. Dlatego urząd miasta będzie obserwował, jakie dodatkowe działania należy podejmować, aby możliwość spożywania alkoholu nie odbiła się np. na bezpieczeństwie. Jeżeli pojawi się konieczność dodatkowych oznaczeń, to oczywiście będą one zamontowane. Zgodnie z wymogami ustawy, jak r&oacute;wnież z zapisami uchwały teren na kt&oacute;rym wprowadza się takie odstępstwo został wyraźnie oznaczony na mapach i będzie w tym zakresie prowadzone akcje informacyjne. </em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czy za zgodą idą fundusze na zakup dodatkowych śmietnik&oacute;w, toalet lub opłacenie służb, kt&oacute;re odpowiedzialne będą za usunięcie śmieci, kt&oacute;re zostawią pijący?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Koszty te i tak są ponoszone ze względu na popularność bulwar&oacute;w, bez względu na wprowadzone odstępstwo od reguły. W przypadku konieczności poniesienia dodatkowych koszt&oacute;w poza tymi już zaplanowanymi na ten cel (chociażby w zakresie toalet, dodatkowych koszy na śmieci czy też akcji informacyjnych) Miasto jest gotowe do ich zwiększenia. Nie sądzę aby te koszty mogły drastycznie wzrosnąć. </em></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\">Czy samorządy innych miast idą za Państwa przykładem?</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 100%;\"><span style=\"font-family: Arial, serif;\"><em>Według mojej wiedzy inne miasta sondują możliwość wprowadzenia takich stref. Zawsze uważaliśmy, że powinno się przekazywać samorządom większe uprawnienia do decydowania o sobie. Ta zmiana w przepisach ustawy o wychowaniu w trzeźwości daje właśnie możliwość, aby rozwiązania przyjmowane przez samorządy były dopasowane do ich specyfiki a nie narzucane z g&oacute;ry z poziomu rządowego. To przede wszystkim lokalne społeczności powinny mieć prawo decydowania o wprowadzaniu zakaz&oacute;w, lub jak w tym przypadku ich zdejmowaniu.</em></span></p>',1,1);
/*!40000 ALTER TABLE `cms_body_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_document_guests`
--

DROP TABLE IF EXISTS `cms_body_document_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_document_guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_body_document_guests_document_id_guest_id_e257c33a_uniq` (`document_id`,`guest_id`),
  KEY `cms_body_document_guests_guest_id_ceb439cd_fk_cms_body_guest_id` (`guest_id`),
  CONSTRAINT `cms_body_document_gu_document_id_9747c94f_fk_cms_body_` FOREIGN KEY (`document_id`) REFERENCES `cms_body_document` (`id`),
  CONSTRAINT `cms_body_document_guests_guest_id_ceb439cd_fk_cms_body_guest_id` FOREIGN KEY (`guest_id`) REFERENCES `cms_body_guest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_document_guests`
--

LOCK TABLES `cms_body_document_guests` WRITE;
/*!40000 ALTER TABLE `cms_body_document_guests` DISABLE KEYS */;
INSERT INTO `cms_body_document_guests` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(6,3,5),(7,4,6);
/*!40000 ALTER TABLE `cms_body_document_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_edition`
--

DROP TABLE IF EXISTS `cms_body_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_edition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `editor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`),
  KEY `cms_body_edition_editor_id_813deddb_fk_cms_body_user_id` (`editor_id`),
  CONSTRAINT `cms_body_edition_editor_id_813deddb_fk_cms_body_user_id` FOREIGN KEY (`editor_id`) REFERENCES `cms_body_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_edition`
--

LOCK TABLES `cms_body_edition` WRITE;
/*!40000 ALTER TABLE `cms_body_edition` DISABLE KEYS */;
INSERT INTO `cms_body_edition` VALUES (1,'2018-04-22',4),(2,'2018-04-21',3),(3,'2018-04-20',2);
/*!40000 ALTER TABLE `cms_body_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_edition_hosts`
--

DROP TABLE IF EXISTS `cms_body_edition_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_edition_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `edition_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_body_edition_hosts_edition_id_host_id_3d16d31b_uniq` (`edition_id`,`host_id`),
  KEY `cms_body_edition_hosts_host_id_e0869c7b_fk_cms_body_host_id` (`host_id`),
  CONSTRAINT `cms_body_edition_hos_edition_id_cd518023_fk_cms_body_` FOREIGN KEY (`edition_id`) REFERENCES `cms_body_edition` (`id`),
  CONSTRAINT `cms_body_edition_hosts_host_id_e0869c7b_fk_cms_body_host_id` FOREIGN KEY (`host_id`) REFERENCES `cms_body_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_edition_hosts`
--

LOCK TABLES `cms_body_edition_hosts` WRITE;
/*!40000 ALTER TABLE `cms_body_edition_hosts` DISABLE KEYS */;
INSERT INTO `cms_body_edition_hosts` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,4),(5,3,2),(6,3,3);
/*!40000 ALTER TABLE `cms_body_edition_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_guest`
--

DROP TABLE IF EXISTS `cms_body_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `ocena` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_guest`
--

LOCK TABLES `cms_body_guest` WRITE;
/*!40000 ALTER TABLE `cms_body_guest` DISABLE KEYS */;
INSERT INTO `cms_body_guest` VALUES (1,'Katarzyna','Kolenda-Zaleska','45234623','5626265','prezes Fundacji TVN „nie jesteś sam”',6),(2,'Ewa','Błaszczyk','2256562','562356256','prezes Fundacji „Akogo?”',5),(3,'Lidia','Niedźwiedzka-Owsiak','xxx','Krzysztof Dobies 695870013','wiceprezes zarządu Fundacji „WOŚP”',3),(4,'Robert','Biedroń','xxx','kontakt Rafał Czech z wyd. Znak 723-635-772, asystent Igor 796 616 161','prezydent Słupska',2),(5,'Artur','Bryński','534 900 041','xxx','Wioleta Kawczyńska  i dzieci : Adam Soczyński, Jakub Soczyński, Oliwier Bem, Martyna Kruk oraz Kinga Łuczak',4),(6,'Mariusz','Frankowski','324352656','xxx','Radny Miasta Stołec',2);
/*!40000 ALTER TABLE `cms_body_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_host`
--

DROP TABLE IF EXISTS `cms_body_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_host`
--

LOCK TABLES `cms_body_host` WRITE;
/*!40000 ALTER TABLE `cms_body_host` DISABLE KEYS */;
INSERT INTO `cms_body_host` VALUES (1,'Roman','Piękny','123444321'),(2,'Kazimiera','Szuka','0789698'),(3,'Ryszard','Pierwszy','09759659'),(4,'Jolanta','Pięknowska','0896078509');
/*!40000 ALTER TABLE `cms_body_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_user`
--

DROP TABLE IF EXISTS `cms_body_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_user`
--

LOCK TABLES `cms_body_user` WRITE;
/*!40000 ALTER TABLE `cms_body_user` DISABLE KEYS */;
INSERT INTO `cms_body_user` VALUES (1,'pbkdf2_sha256$100000$4ek2oHX49q3s$3+9a90CTanW0FITctj8SnAv0lBuxcvmVFZJmBMYKCHU=','2018-04-21 19:08:06.811289',1,'satq','Bartek','Węgrzyn','bart3k1@gmail.com',1,1,'2018-04-21 17:03:50.000000','501602273'),(2,'pbkdf2_sha256$100000$eY9OKou6BZ7g$fK8CAdMUSV8tBdzZ7W4Ab3oqNlDqBxom6UC6Hcz9cgE=','2018-04-21 19:05:28.216842',0,'Jola','Jola','Marat','jola@wp.pl',0,1,'2018-04-21 17:09:38.000000','1234321'),(3,'pbkdf2_sha256$100000$15MLpu9Q6Zb5$93q8+C5DhtMNSry48jLl+ErvKUzTZgmQneDBTBywbgw=',NULL,0,'Kazik','Kazimierz','Szczególny','k.szczeg@tvn.pl',0,1,'2018-04-21 17:35:35.000000','345543'),(4,'pbkdf2_sha256$100000$oFl6cyp9LwJD$KEr9DzHpsD0EDpisWTtGbPuFLrm5VmSuVZ46IARWgrE=',NULL,0,'Madzia','Magdalena','Niemożliwa','mn@tvn.pl',0,1,'2018-04-21 17:36:15.000000','123455543');
/*!40000 ALTER TABLE `cms_body_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_user_groups`
--

DROP TABLE IF EXISTS `cms_body_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_body_user_groups_user_id_group_id_acd8a171_uniq` (`user_id`,`group_id`),
  KEY `cms_body_user_groups_group_id_cefa67aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `cms_body_user_groups_group_id_cefa67aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_body_user_groups_user_id_457e63c4_fk_cms_body_user_id` FOREIGN KEY (`user_id`) REFERENCES `cms_body_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_user_groups`
--

LOCK TABLES `cms_body_user_groups` WRITE;
/*!40000 ALTER TABLE `cms_body_user_groups` DISABLE KEYS */;
INSERT INTO `cms_body_user_groups` VALUES (3,2,1),(2,3,1),(1,4,1);
/*!40000 ALTER TABLE `cms_body_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_body_user_user_permissions`
--

DROP TABLE IF EXISTS `cms_body_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_body_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_body_user_user_permi_user_id_permission_id_f1351af6_uniq` (`user_id`,`permission_id`),
  KEY `cms_body_user_user_p_permission_id_d794e705_fk_auth_perm` (`permission_id`),
  CONSTRAINT `cms_body_user_user_p_permission_id_d794e705_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `cms_body_user_user_p_user_id_7deaa91d_fk_cms_body_` FOREIGN KEY (`user_id`) REFERENCES `cms_body_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_body_user_user_permissions`
--

LOCK TABLES `cms_body_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `cms_body_user_user_permissions` DISABLE KEYS */;
INSERT INTO `cms_body_user_user_permissions` VALUES (3,2,19),(4,2,20),(5,2,21),(2,4,19);
/*!40000 ALTER TABLE `cms_body_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_cms_body_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_cms_body_user_id` FOREIGN KEY (`user_id`) REFERENCES `cms_body_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-21 17:13:04.274386','1','satq',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"phone\"]}}]',6,1),(2,'2018-04-21 18:52:45.387182','4','Madzia',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',6,1),(3,'2018-04-21 18:54:01.338163','1','Autorzy',1,'[{\"added\": {}}]',3,1),(4,'2018-04-21 18:54:35.915380','4','Madzia',2,'[{\"changed\": {\"fields\": [\"groups\", \"user_permissions\"]}}]',6,1),(5,'2018-04-21 18:54:41.728189','3','Kazik',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',6,1),(6,'2018-04-21 18:54:47.541186','2','Jola',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',6,1),(7,'2018-04-21 19:01:39.584477','2','Jola',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',6,1),(8,'2018-04-21 19:05:15.288603','2','Jola',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',6,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'cms_body','document'),(8,'cms_body','edition'),(9,'cms_body','guest'),(10,'cms_body','host'),(6,'cms_body','user'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-21 16:59:21.687379'),(2,'contenttypes','0002_remove_content_type_name','2018-04-21 16:59:21.729596'),(3,'auth','0001_initial','2018-04-21 16:59:21.854418'),(4,'auth','0002_alter_permission_name_max_length','2018-04-21 16:59:21.880187'),(5,'auth','0003_alter_user_email_max_length','2018-04-21 16:59:21.890111'),(6,'auth','0004_alter_user_username_opts','2018-04-21 16:59:21.897980'),(7,'auth','0005_alter_user_last_login_null','2018-04-21 16:59:21.910088'),(8,'auth','0006_require_contenttypes_0002','2018-04-21 16:59:21.912268'),(9,'auth','0007_alter_validators_add_error_messages','2018-04-21 16:59:21.919136'),(10,'auth','0008_alter_user_username_max_length','2018-04-21 16:59:21.930474'),(11,'auth','0009_alter_user_last_name_max_length','2018-04-21 16:59:21.942183'),(12,'cms_body','0001_initial','2018-04-21 16:59:22.238096'),(13,'admin','0001_initial','2018-04-21 16:59:22.303117'),(14,'admin','0002_logentry_remove_auto_add','2018-04-21 16:59:22.320678'),(15,'sessions','0001_initial','2018-04-21 16:59:22.339516');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('glswwn403fb4hv8floz1ynpma0ivu856','OTJhMjg2OWI5ZWNlODk0NDY3OTkxOWE2OGQ4NzFlMWIwMmU3MTEyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMWI2NGViZjViYjJjNzA2YjI2MzM1ODE4ZmZiNjMyOGYyODdiMzhiIn0=','2018-05-05 19:08:06.813983');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-21 21:14:59
