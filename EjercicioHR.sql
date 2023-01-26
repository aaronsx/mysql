-- LDTS Academy. https://academy.ldts.us
-- All Rights Reserved

-- Curso DB123
-- Ejercicio HR -Script de partida.


-- MySQL dump 10.14  Distrib 5.5.35-MariaDB, for Linux (x86_64)
--
-- Host: mysecretserver.ru    Database: ejercicio1
-- ------------------------------------------------------
-- Server version	5.0.45

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

DROP DATABASE IF EXISTS ejercicio1;
CREATE DATABASE ejercicio1;
USE ejercicio1;

--
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `COUNTRIES`
--

DROP TABLE IF EXISTS `COUNTRIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRIES` (
  `COUNTRY_ID` varchar(255) NOT NULL,
  `COUNTRY_NAME` varchar(255) default NULL,
  `REGION_ID` smallint(6) default NULL,
  PRIMARY KEY  (`COUNTRY_ID`),
  KEY `pais_region_FK` (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRIES`
--

LOCK TABLES `COUNTRIES` WRITE;
/*!40000 ALTER TABLE `COUNTRIES` DISABLE KEYS */;
INSERT INTO `COUNTRIES` VALUES ('AR','Argentina',2),('AU','Australia',3),('BE','Belgium',1),('BR','Brazil',2),('CA','Canada',2),('CH','Switzerland',8),('CN','China',3),('DE','Germany',1),('DK','Denmark',1),('EG','Egypt',4),('FR','France',1),('HK','HongKong',3),('IL','Israel',4),('IN','India',3),('IT','Italy',1),('JP','Japan',3),('KW','Kuwait',4),('MX','Mexico',2),('NG','Nigeria',4),('NL','Netherlands',1),('SG','Singapore',3),('UK','United Kingdom',1),('US','United States of America',2),('ZM','Zambia',4),('ZW','Zimbabwe',4);
/*!40000 ALTER TABLE `COUNTRIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENTS`
--

DROP TABLE IF EXISTS `DEPARTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENTS` (
  `DEPARTMENT_ID` smallint(6) NOT NULL auto_increment,
  `DEPARTMENT_NAME` varchar(255) default NULL,
  `MANAGER_ID` smallint(6) default NULL,
  `LOCATION_ID` smallint(6) default NULL,
  PRIMARY KEY  (`DEPARTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTS`
--

LOCK TABLES `DEPARTMENTS` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTS` DISABLE KEYS */;
INSERT INTO `DEPARTMENTS` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',9108,1700),(110,'Accounting',205,1700),(120,'Treasury',NULL,1700),(130,'Corporate Tax',NULL,1700),(140,'Control And Credit',NULL,1700),(150,'Shareholder Services',NULL,1700),(160,'Benefits',NULL,1700),(170,'Manufacturing',NULL,1700),(180,'Construction',NULL,1700),(190,'Contracting',NULL,1700),(200,'Operations',NULL,1700),(210,'IT Support',NULL,1700),(220,'NOC',NULL,1700),(230,'IT Helpdesk',NULL,1700),(240,'Government Sales',NULL,1700),(250,'Retail Sales',NULL,1700),(260,'Recruiting',NULL,1700),(270,'Payroll',NULL,1700);
/*!40000 ALTER TABLE `DEPARTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEES` (
  `EMPLOYEE_ID` smallint(6) default NULL,
  `FIRST_NAME` varchar(255) default NULL,
  `LAST_NAME` varchar(255) default NULL,
  `EMAIL` varchar(255) default NULL,
  `PHONE_NUMBER` varchar(255) default NULL,
  `HIRE_DATE` datetime default NULL,
  `JOB_ID` varchar(255) default NULL,
  `SALARY` double default NULL,
  `COMMISSION_PCT` double default NULL,
  `EQUIPO` smallint(6) default NULL,
  `DEPARTMENT_ID` smallint(6) default NULL,
  KEY `dptoid_FK` (`DEPARTMENT_ID`),
  CONSTRAINT `dptoid_FK` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `DEPARTMENTS` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (100,'Steven','King','SKING','5.151.234.567','1987-06-17 00:00:00','AD_PRES',24000,NULL,NULL,90),(101,'Neena','Kochhar','NKOCHHAR','5.151.234.568','1989-09-21 00:00:00','AD_VP',17000,NULL,100,90),(102,'Lex','De Haan','LDEHAAN','5.151.234.569','1993-01-13 00:00:00','AD_VP',17000,NULL,100,90),(103,'Alexander','Hunold','AHUNOLD','5.904.234.567','1990-01-03 00:00:00','IT_PROG',9000,NULL,102,60),(104,'Bruce','Ernst','BERNST','5.904.234.568','1991-05-21 00:00:00','IT_PROG',6000,NULL,103,60),(105,'David','Austin','DAUSTIN','5.904.234.569','1997-06-25 00:00:00','IT_PROG',4800,NULL,103,60),(106,'Valli','Pataballa','VPATABAL','5.904.234.560','1998-02-05 00:00:00','IT_PROG',4800,NULL,103,60),(107,'Diana','Lorentz','DLORENTZ','5.904.235.567','1999-02-07 00:00:00','IT_PROG',4200,NULL,103,60),(108,'Nancy','Greenberg','NGREENBE','5.151.244.569','1994-08-17 00:00:00','FI_MGR',12000,NULL,101,100),(109,'Daniel','Faviet','DFAVIET','5.151.244.169','1994-08-16 00:00:00','FI_ACCOUNT',9000,NULL,108,100),(110,'John','Chen','JCHEN','5.151.244.269','1997-09-28 00:00:00','FI_ACCOUNT',8200,NULL,108,100),(111,'Ismael','Sciarra','ISCIARRA','5.151.244.369','1997-09-30 00:00:00','FI_ACCOUNT',7700,NULL,108,100),(112,'Jose Manuel','Urman','JMURMAN','5.151.244.469','1998-03-07 00:00:00','FI_ACCOUNT',7800,NULL,108,100),(113,'Luis','Popp','LPOPP','5.151.244.567','1999-12-07 00:00:00','FI_ACCOUNT',6900,NULL,108,100),(114,'Den','Raphaely','DRAPHEAL','5.151.274.561','1994-12-07 00:00:00','PU_MAN',11000,NULL,100,30),(115,'Alexander','Khoo','AKHOO','5.151.274.562','1995-05-18 00:00:00','PU_CLERK',3100,NULL,114,30),(116,'Shelli','Baida','SBAIDA','5.151.274.563','1997-12-24 00:00:00','PU_CLERK',2900,NULL,114,30),(117,'Sigal','Tobias','STOBIAS','5.151.274.564','1997-07-24 00:00:00','PU_CLERK',2800,NULL,114,30),(118,'Guy','Himuro','GHIMURO','5.151.274.565','1998-11-15 00:00:00','PU_CLERK',2600,NULL,114,30),(119,'Karen','Colmenares','KCOLMENA','5.151.274.566','1999-08-10 00:00:00','PU_CLERK',2500,NULL,114,30),(120,'Matthew','Weiss','MWEISS','6.501.231.234','1996-07-18 00:00:00','ST_MAN',8000,NULL,100,50),(121,'Adam','Fripp','AFRIPP','6.501.232.234','1997-04-10 00:00:00','ST_MAN',8200,NULL,100,50),(122,'Payam','Kaufling','PKAUFLIN','6.501.233.234','1995-05-01 00:00:00','ST_MAN',7900,NULL,100,50),(123,'Shanta','Vollman','SVOLLMAN','6.501.234.234','1997-10-10 00:00:00','ST_MAN',6500,NULL,100,50),(124,'Kevin','Mourgos','KMOURGOS','6.501.235.234','1999-11-16 00:00:00','ST_MAN',5800,NULL,100,50),(125,'Julia','Nayer','JNAYER','6.501.241.214','1997-07-16 00:00:00','ST_CLERK',3200,NULL,120,50),(126,'Irene','Mikkilineni','IMIKKILI','6.501.241.224','1998-09-28 00:00:00','ST_CLERK',2700,NULL,120,50),(127,'James','Landry','JLANDRY','6.501.241.334','1999-01-14 00:00:00','ST_CLERK',2400,NULL,120,50),(128,'Steven','Markle','SMARKLE','6.501.241.434','2000-03-08 00:00:00','ST_CLERK',2200,NULL,120,50),(129,'Laura','Bissot','LBISSOT','6.501.245.234','1997-08-20 00:00:00','ST_CLERK',3300,NULL,121,50),(130,'Mozhe','Atkinson','MATKINSO','6.501.246.234','1997-10-30 00:00:00','ST_CLERK',2800,NULL,121,50),(131,'James','Marlow','JAMRLOW','6.501.247.234','1997-02-16 00:00:00','ST_CLERK',2500,NULL,121,50),(132,'TJ','Olson','TJOLSON','6.501.248.234','1999-04-10 00:00:00','ST_CLERK',2100,NULL,121,50),(133,'Jason','Mallin','JMALLIN','6.501.271.934','1996-06-14 00:00:00','ST_CLERK',3300,NULL,122,50),(134,'Michael','Rogers','MROGERS','6.501.271.834','1998-08-26 00:00:00','ST_CLERK',2900,NULL,122,50),(135,'Ki','Gee','KGEE','6.501.271.734','1999-12-12 00:00:00','ST_CLERK',2400,NULL,122,50),(136,'Hazel','Philtanker','HPHILTAN','6.501.271.634','2000-02-06 00:00:00','ST_CLERK',2200,NULL,122,50),(137,'Renske','Ladwig','RLADWIG','6.501.211.234','1995-07-14 00:00:00','ST_CLERK',3600,NULL,123,50),(138,'Stephen','Stiles','SSTILES','6.501.212.034','1997-10-26 00:00:00','ST_CLERK',3200,NULL,123,50),(139,'John','Seo','JSEO','6.501.212.019','1998-02-12 00:00:00','ST_CLERK',2700,NULL,123,50),(140,'Joshua','Patel','JPATEL','6.501.211.834','1998-04-06 00:00:00','ST_CLERK',2500,NULL,123,50),(141,'Trenna','Rajs','TRAJS','6.501.218.009','1995-10-17 00:00:00','ST_CLERK',3500,NULL,124,50),(142,'Curtis','Davies','CDAVIES','6.501.212.994','1997-01-29 00:00:00','ST_CLERK',3100,NULL,124,50),(143,'Randall','Matos','RMATOS','6.501.212.874','1998-03-15 00:00:00','ST_CLERK',2600,NULL,124,50),(144,'Peter','Vargas','PVARGAS','6.501.212.004','1998-07-09 00:00:00','ST_CLERK',2500,NULL,124,50),(145,'John','Russell','JRUSSEL','011.44.1344.429268','1996-10-01 00:00:00','SA_MAN',14000,0.4,100,80),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','1997-01-05 00:00:00','SA_MAN',13500,0.3,100,80),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1997-03-10 00:00:00','SA_MAN',12000,0.3,100,80),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1999-10-15 00:00:00','SA_MAN',11000,0.3,100,80),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29 00:00:00','SA_MAN',10500,0.2,100,80),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','1997-01-30 00:00:00','SA_REP',10000,0.3,145,80),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','1997-03-24 00:00:00','SA_REP',9500,0.25,145,80),(152,'Peter','Hall','PHALL','011.44.1344.478968','1997-08-20 00:00:00','SA_REP',9000,0.25,145,80),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','1998-03-30 00:00:00','SA_REP',8000,0.2,145,80),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1998-12-09 00:00:00','SA_REP',7500,0.2,145,80),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1999-11-23 00:00:00','SA_REP',7000,0.15,145,80),(156,'Janette','King','JKING','011.44.1345.429268','1996-01-30 00:00:00','SA_REP',10000,0.35,146,80),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','1996-03-04 00:00:00','SA_REP',9500,0.35,146,80),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','1996-08-01 00:00:00','SA_REP',9000,0.35,146,80),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','1997-03-10 00:00:00','SA_REP',8000,0.3,146,80),(160,'Louise','Doran','LDORAN','011.44.1345.629268','1997-12-15 00:00:00','SA_REP',7500,0.3,146,80),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','1998-11-03 00:00:00','SA_REP',7000,0.25,146,80),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','1997-11-11 00:00:00','SA_REP',10500,0.25,147,80),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','1999-03-19 00:00:00','SA_REP',9500,0.15,147,80),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','2000-01-24 00:00:00','SA_REP',7200,0.1,147,80),(165,'David','Lee','DLEE','011.44.1346.529268','2000-02-23 00:00:00','SA_REP',6800,0.1,147,80),(166,'Sundar','Ande','SANDE','011.44.1346.629268','2000-03-24 00:00:00','SA_REP',6400,0.1,147,80),(167,'Amit','Banda','ABANDA','011.44.1346.729268','2000-04-21 00:00:00','SA_REP',6200,0.1,147,80),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','1997-03-11 00:00:00','SA_REP',11500,0.25,148,80),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1998-03-23 00:00:00','SA_REP',10000,0.2,148,80),(170,'Tayler','Fox','TFOX','011.44.1343.729268','1998-01-24 00:00:00','SA_REP',9600,0.2,148,80),(171,'William','Smith','WSMITH','011.44.1343.629268','1999-02-23 00:00:00','SA_REP',7400,0.15,148,80),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','1999-03-24 00:00:00','SA_REP',7300,0.15,148,80),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','2000-04-21 00:00:00','SA_REP',6100,0.1,148,80),(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11 00:00:00','SA_REP',11000,0.3,149,80),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','1997-03-19 00:00:00','SA_REP',8800,0.25,149,80),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24 00:00:00','SA_REP',8600,0.2,149,80),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','1998-04-23 00:00:00','SA_REP',8400,0.2,149,80),(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-24 00:00:00','SA_REP',7000,0.15,149,NULL),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','2000-01-04 00:00:00','SA_REP',6200,0.1,149,80),(180,'Winston','Taylor','WTAYLOR','6.505.079.876','1998-01-24 00:00:00','SH_CLERK',3200,NULL,120,50),(181,'Jean','Fleaur','JFLEAUR','6.505.079.877','1998-02-23 00:00:00','SH_CLERK',3100,NULL,120,50),(182,'Martha','Sullivan','MSULLIVA','6.505.079.878','1999-06-21 00:00:00','SH_CLERK',2500,NULL,120,50),(183,'Girard','Geoni','GGEONI','6.505.079.879','2000-02-03 00:00:00','SH_CLERK',2800,NULL,120,50),(184,'Nandita','Sarchand','NSARCHAN','6.505.091.876','1996-01-27 00:00:00','SH_CLERK',4200,NULL,121,50),(185,'Alexis','Bull','ABULL','6.505.092.876','1997-02-20 00:00:00','SH_CLERK',4100,NULL,121,50),(186,'Julia','Dellinger','JDELLING','6.505.093.876','1998-06-24 00:00:00','SH_CLERK',3400,NULL,121,50),(187,'Anthony','Cabrio','ACABRIO','6.505.094.876','1999-02-07 00:00:00','SH_CLERK',3000,NULL,121,50),(188,'Kelly','Chung','KCHUNG','6.505.051.876','1997-06-14 00:00:00','SH_CLERK',3800,NULL,122,50),(189,'Jennifer','Dilly','JDILLY','6.505.052.876','1997-08-13 00:00:00','SH_CLERK',3600,NULL,122,50),(190,'Timothy','Gates','TGATES','6.505.053.876','1998-07-11 00:00:00','SH_CLERK',2900,NULL,122,50),(191,'Randall','Perkins','RPERKINS','6.505.054.876','1999-12-19 00:00:00','SH_CLERK',2500,NULL,122,50),(192,'Sarah','Bell','SBELL','6.505.011.876','1996-02-04 00:00:00','SH_CLERK',4000,NULL,123,50),(193,'Britney','Everett','BEVERETT','6.505.012.876','1997-03-03 00:00:00','SH_CLERK',3900,NULL,123,50),(194,'Samuel','McCain','SMCCAIN','6.505.013.876','1998-07-01 00:00:00','SH_CLERK',3200,NULL,123,50),(195,'Vance','Jones','VJONES','6.505.014.876','1999-03-17 00:00:00','SH_CLERK',2800,NULL,123,50),(196,'Alana','Walsh','AWALSH','6.505.079.811','1998-04-24 00:00:00','SH_CLERK',3100,NULL,124,50),(197,'Kevin','Feeney','KFEENEY','6.505.079.822','1998-05-23 00:00:00','SH_CLERK',3000,NULL,124,50),(198,'Donald','OConnell','DOCONNEL','6.505.079.833','1999-06-21 00:00:00','SH_CLERK',2600,NULL,124,50),(199,'Douglas','Grant','DGRANT','6.505.079.844','2000-01-13 00:00:00','SH_CLERK',2600,NULL,124,50),(200,'Jennifer','Whalen','JWHALEN','5.151.234.444','1987-09-17 00:00:00','AD_ASST',4400,NULL,101,10),(201,'Michael','Hartstein','MHARTSTE','5.151.235.555','1996-02-17 00:00:00','MK_MAN',13000,NULL,100,20),(202,'Pat','Fay','PFAY','6.031.236.666','1997-08-17 00:00:00','MK_REP',6000,NULL,201,20),(203,'Susan','Mavris','SMAVRIS','5.151.237.777','1994-06-07 00:00:00','HR_REP',6500,NULL,101,40),(204,'Hermann','Baer','HBAER','5.151.238.888','1994-06-07 00:00:00','PR_REP',10000,NULL,101,70),(205,'Shelley','Higgins','SHIGGINS','5.151.238.080','1994-06-07 00:00:00','AC_MGR',12000,NULL,101,110),(206,'William','Gietz','WGIETZ','5.151.238.181','1994-06-07 00:00:00','AC_ACCOUNT',8300,NULL,205,110);
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOBS`
--

DROP TABLE IF EXISTS `JOBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JOBS` (
  `JOB_ID` varchar(255) default NULL,
  `JOB_TITLE` varchar(255) default NULL,
  `MIN_SALARY` double default NULL,
  `MAX_SALARY` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
INSERT INTO `JOBS` VALUES ('AD_PRES','President',20000,40000),('AD_VP','Administration Vice President',15000,30000),('AD_ASST','Administration Assistant',3000,6000),('FI_MGR','Finance Manager',8200,16000),('FI_ACCOUNT','Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AC_ACCOUNT','Public Accountant',4200,9000),('SA_MAN','Sales Manager',10000,20000),('SA_REP','Sales Representative',6000,12000),('PU_MAN','Purchasing Manager',8000,15000),('PU_CLERK','Purchasing Clerk',2500,5500),('ST_MAN','Stock Manager',5500,8500),('ST_CLERK','Stock Clerk',2000,5000),('SH_CLERK','Shipping Clerk',2500,5500),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('HR_REP','Human Resources Representative',4000,9000),('PR_REP','Public Relations Representative',4500,10500);
/*!40000 ALTER TABLE `JOBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATIONS`
--

DROP TABLE IF EXISTS `LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCATIONS` (
  `LOCATION_ID` smallint(6) default NULL,
  `STREET_ADDRESS` varchar(255) default NULL,
  `POSTAL_CODE` varchar(255) default NULL,
  `CITY` varchar(255) default NULL,
  `STATE_PROVINCE` varchar(255) default NULL,
  `COUNTRY_ID` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATIONS`
--

LOCK TABLES `LOCATIONS` WRITE;
/*!40000 ALTER TABLE `LOCATIONS` DISABLE KEYS */;
INSERT INTO `LOCATIONS` VALUES (1000,'1297 Via Cola di Rie','989','Roma',NULL,'IT'),(1100,'93091 Calle della Testa','10934','Venice',NULL,'IT'),(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),(1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),(2300,'198 Clementi North','540198','Singapore',NULL,'SG'),(2400,'8204 Arthur St','-','London',NULL,'UK'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),(2600,'9702 Chester Road','9629850293','Stretford','Manchester','UK'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),(2800,'Rua Frei Caneca 1360','01307-002','Sao Paulo','Sao Paulo','BR'),(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),(3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
/*!40000 ALTER TABLE `LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGIONS`
--

DROP TABLE IF EXISTS `REGIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGIONS` (
  `REGION_ID` smallint(6) NOT NULL,
  `REGION_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGIONS`
--

LOCK TABLES `REGIONS` WRITE;
/*!40000 ALTER TABLE `REGIONS` DISABLE KEYS */;
INSERT INTO `REGIONS` VALUES (1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle East and Africa');
/*!40000 ALTER TABLE `REGIONS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-14 10:09:56
