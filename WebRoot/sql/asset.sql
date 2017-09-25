/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 100126
Source Host           : localhost:3306
Source Database       : asset

Target Server Type    : MYSQL
Target Server Version : 100126
File Encoding         : 65001

Date: 2017-09-26 00:50:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '资产公示', '10000000', '/home/shushu/filedata2/log/ce220e7a-8fe6-44b8-aa20-1baac8be3660.md', '2017-09-20 14:20:11', '1', '刘姚', 'user/avatars/5abcff46-52ec-41b5-9162-21ebd8a50741.jpg');
INSERT INTO `article` VALUES ('2', '梵蒂冈的', '10000000', '/home/shushu/filedata2/log/f59787c5-f4f0-45b7-bf51-f9c10a96162c.md', '2017-09-22 15:22:23', '1', '刘姚', 'user/avatars/5abcff46-52ec-41b5-9162-21ebd8a50741.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `fileid` int(11) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `avatarpath` varchar(100) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '梵蒂冈的', '2', '10000000', 'user/avatars/5abcff46-52ec-41b5-9162-21ebd8a50741.jpg', '2017-09-22 15:22:50', '刘姚');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `descr` text,
  `parentid` int(11) DEFAULT '0',
  `leaf` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('4', '大连大学', '', '0', '2', null);
INSERT INTO `department` VALUES ('7', '财务部', '', '4', null, '30');
INSERT INTO `department` VALUES ('8', '宿管部', '', '4', null, '30');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('2', '2017-09-21_225810.png', '6', '大是大非工时费', '152854', '撒打发斯蒂芬', '', '', '', '', '1', '刘姚', '2017-09-24 20:24:11', '/upload/daebb4ac-6aa4-4af2-950a-db77a2358e77.png', '0', '第三方', '1');
INSERT INTO `file` VALUES ('3', '100.jpg', '7', '范德萨发的', '797', '当时的发生', '佛山市的', '双方的发生', '沙发斯蒂芬', '发顺丰是', '1', '刘姚', '2017-09-25 13:25:50', '/upload/fd953a3a-8287-4807-a04a-e30c64fb59a7.jpg', '0', '是的冯绍峰', '1');

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名',
  `descr` varchar(255) DEFAULT NULL COMMENT '父分类id',
  `parentid` int(10) DEFAULT '0',
  `leaf` int(10) DEFAULT '1' COMMENT '1-叶子 2-非叶子',
  `grade` int(10) DEFAULT '10' COMMENT '第几级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES ('1', '电脑', '', '21', '2', '10');
INSERT INTO `kind` VALUES ('2', '华硕', '', '1', '2', '40');
INSERT INTO `kind` VALUES ('4', '部门', '', '21', '2', '10');
INSERT INTO `kind` VALUES ('5', '第三方', '', '4', '2', '40');
INSERT INTO `kind` VALUES ('6', '第三方', '', '5', '1', '70');
INSERT INTO `kind` VALUES ('7', '是的冯绍峰', '是的冯绍峰', '21', '1', '10');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '资产审核通知', '班', '10000000', '10000000', '2017-09-22 15:22:10', '1', '1', '1', '0', '0', '刘姚', '刘姚', 'user/avatars/5abcff46-52ec-41b5-9162-21ebd8a50741.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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
  `department` varchar(100) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kindid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000000', '刘姚', 'aaa', '男', '18340861899', 'lyshushu1234@qq.com', '1', 'N', 'user/avatars/5abcff46-52ec-41b5-9162-21ebd8a50741.jpg', '21', '0', null, '宿管部', '主任');
INSERT INTO `user` VALUES ('92675957', '飒飒的', 'aaa', '男', '12312312311', '3458057175@qq.com', '0', 'N', 'user/avatars/136be201-bf6a-41d9-bb83-0c15e961de5b.png', '23', '0', '', '财务部', null);
INSERT INTO `user` VALUES ('15638615', 'shushu', 'aaa', '男', '14422002121', 'lyshushu1234@gmail.com', '0', 'Y', 'user/avatars/9c5edaf6-c8a5-4123-9622-38b5cf9153f3.jpg', '24', '0', '', null, null);
