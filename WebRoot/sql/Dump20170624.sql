-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: filedata
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `articlepath` varchar(100) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `userpath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `fileid` int(11) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `avatarpath` varchar(100) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `kindid` varchar(10) DEFAULT NULL COMMENT '分类id',
  `remark` text COMMENT '摘要',
  `filesize` bigint(20) DEFAULT NULL COMMENT '文件大小,以k为单位',
  `authorname1` varchar(20) DEFAULT NULL COMMENT '第1作者姓名',
  `authorname2` varchar(20) DEFAULT NULL COMMENT '第2作者姓名',
  `authorname3` varchar(20) DEFAULT NULL COMMENT '第3作者姓名',
  `authorname4` varchar(20) DEFAULT NULL COMMENT '第4作者姓名',
  `authorname5` varchar(20) DEFAULT NULL COMMENT '第5作者姓名',
  `open` int(1) DEFAULT '1' COMMENT '1-公开 0-非公开',
  `userid` varchar(8) DEFAULT NULL COMMENT '上传人',
  `uploaddate` varchar(100) DEFAULT NULL COMMENT '上传日期',
  `filepath` varchar(100) CHARACTER SET big5 DEFAULT NULL,
  `downcount` int(11) DEFAULT '0',
  `kind` varchar(255) DEFAULT NULL,
  `privatefile` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kind`
--

DROP TABLE IF EXISTS `kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名',
  `descr` varchar(255) DEFAULT NULL COMMENT '父分类id',
  `parentid` int(10) DEFAULT '0',
  `leaf` int(10) DEFAULT '1' COMMENT '1-叶子 2-非叶子',
  `grade` int(10) DEFAULT '10' COMMENT '第几级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kind`
--

LOCK TABLES `kind` WRITE;
/*!40000 ALTER TABLE `kind` DISABLE KEYS */;
/*!40000 ALTER TABLE `kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `sender` varchar(8) NOT NULL DEFAULT '' COMMENT '发送人id',
  `receiver` varchar(8) NOT NULL DEFAULT '' COMMENT '接收人id',
  `sendtime` varchar(50) DEFAULT NULL COMMENT '发送时间',
  `senderdisable` tinyint(4) DEFAULT '1' COMMENT '发送人删除标志1-未删除 2-删除',
  `receiverdisable` tinyint(4) DEFAULT '1' COMMENT '接收人删除标志1-未删除 2-删除',
  `hasread` tinyint(4) DEFAULT '1' COMMENT '阅读标志 1-未读 2-已读',
  `parentId` bigint(20) DEFAULT '0' COMMENT '父id',
  `level` tinyint(3) DEFAULT '0' COMMENT '0-一般消息, 1-专业级消息 2-院级消息 3-校级消\n息',
  `sendername` varchar(20) DEFAULT NULL,
  `receivername` varchar(20) DEFAULT NULL,
  `senderpath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(8) NOT NULL COMMENT 'id-学号或工号',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `pwd` varchar(20) NOT NULL COMMENT '密码',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `role` int(1) DEFAULT NULL COMMENT '角色 0-普通用户 1-管理员',
  `defunct` char(1) DEFAULT 'N' COMMENT '删除标志 Y-删除 N-未删除',
  `avatarpath` varchar(100) DEFAULT NULL,
  `kindid` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT '1',
  `activecode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kindid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('10000000','刘姚','aaaaaa','男','18340861899','lyshushu1234@qq.com',1,'N','user/avatars/baeca374-3199-4afe-9b28-19cf6fd05c98.jpg',21,2,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-24 15:16:49
