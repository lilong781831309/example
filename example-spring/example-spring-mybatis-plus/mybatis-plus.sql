/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.24 : Database - mybatis_plus
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybatis_plus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mybatis_plus`;

/*Table structure for table `mg_app` */

DROP TABLE IF EXISTS `mg_app`;

CREATE TABLE `mg_app` (
  `id` bigint NOT NULL COMMENT '主键',
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app_id',
  `app_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app_secret',
  `access_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'access_token',
  `expires_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `extend_info` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '附加信息',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `deleted` bigint NOT NULL DEFAULT '0' COMMENT '是否删除标志,0 未删除,其他 已删除',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_appId_appSecret_deleted` (`app_id`,`app_secret`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mg_app` */

insert  into `mg_app`(`id`,`app_id`,`app_secret`,`access_token`,`expires_time`,`extend_info`,`create_at`,`create_by`,`update_at`,`update_by`,`deleted`,`version`) values (0,'555','555','string','2023-08-06 13:50:29','{}','2023-08-06 13:50:29','system','2023-08-06 18:54:26','system',0,5),(1,'111','111','111','2023-08-01 17:15:44','{}','2023-08-05 18:53:29','','2023-08-05 18:53:29','',0,0),(2,'222','222','222','2023-08-01 17:43:43','{}','2023-08-05 18:53:29','','2023-08-05 18:53:29','',0,0),(3,'333','333','333','2023-08-01 17:48:53','{}','2023-08-05 18:53:29','','2023-08-05 18:53:29','',0,0),(4,'444','444','444','2023-08-01 17:48:53','{}','2023-08-05 18:53:29','','2023-08-05 18:53:29','',0,0),(5,'string','string','string','2023-08-01 18:17:11','{}','2023-08-05 18:53:29','','2023-08-05 18:53:29','',1,0),(1688067574137602049,'666','666','666','2023-08-06 14:00:47','{}','2023-08-06 14:00:47','system','2023-08-07 05:51:54','system',0,7),(1688072417963102210,'777','777','777','2023-08-06 06:11:32','{}','2023-08-06 14:20:02','system','2023-08-06 14:20:02','system',0,0),(1688072580811182081,'888','888','888','2023-08-06 06:11:32','{}','2023-08-06 14:20:41','system','2023-08-06 14:20:41','system',0,0),(1688072687279394817,'999','999','999','2023-08-06 06:11:32','{\"k1\":\"v2\"}','2023-08-06 14:21:06','system','2023-08-06 15:34:02','system',1688072687279394817,1),(1688321370168221698,'aaa','aaa','aaa','2023-08-06 22:43:27','{}','2023-08-07 06:49:17','system','2023-08-07 07:51:20','system',1688321370168221698,6);

/*Table structure for table `mg_user` */

DROP TABLE IF EXISTS `mg_user`;

CREATE TABLE `mg_user` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `age` int NOT NULL DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `gender` int NOT NULL DEFAULT '1' COMMENT '性别',
  `extend_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附加信息',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `deleted` bigint NOT NULL DEFAULT '0' COMMENT '是否删除标志,0 未删除,其他 已删除',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_phone` (`phone`),
  KEY `idx_address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mg_user` */

insert  into `mg_user`(`id`,`name`,`age`,`phone`,`address`,`gender`,`extend_info`,`create_at`,`create_by`,`update_at`,`update_by`,`deleted`,`version`) values (1,'张三',20,'13200001111','aaa',1,'','2023-08-05 22:58:33','','2023-08-05 22:58:33','',0,0),(2,'李四',21,'13200001112','bbb',1,'','2023-08-05 22:58:33','','2023-08-05 22:58:33','',0,0),(3,'王五',22,'13200001113','ccc',1,'','2023-08-05 22:58:33','','2023-08-05 22:58:33','',0,0);

/*Table structure for table `mg_video` */

DROP TABLE IF EXISTS `mg_video`;

CREATE TABLE `mg_video` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` bigint NOT NULL COMMENT '小程序id',
  `drama_id` bigint NOT NULL COMMENT '微信剧目id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信剧目名称',
  `comment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `extend_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附加信息',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `deleted` bigint NOT NULL DEFAULT '0' COMMENT '是否删除标志,0 未删除,其他 已删除',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_pid_dramaId_deleted` (`pid`,`drama_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mg_video` */

insert  into `mg_video`(`id`,`pid`,`drama_id`,`name`,`comment`,`extend_info`,`create_at`,`create_by`,`update_at`,`update_by`,`deleted`,`version`) values (10,1,11,'视频1 pid=10 drama_id=1','12345','{}','2023-08-05 22:54:37','','2023-08-06 18:41:46','system',0,0),(11,1,2,'视频1 pid=2 drama_id=2','string','','2023-08-05 22:54:37','','2023-08-05 22:54:37','',0,0);

/*Table structure for table `mg_video_num` */

DROP TABLE IF EXISTS `mg_video_num`;

CREATE TABLE `mg_video_num` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` bigint NOT NULL COMMENT '小程序id',
  `video_id` bigint NOT NULL COMMENT '所属视频id',
  `video_num` int NOT NULL DEFAULT '0' COMMENT '第几集',
  `media_id` bigint NOT NULL COMMENT '微信视频素材id',
  `mp4_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信视频素材url',
  `expires_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频链接过期时间',
  `extend_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附加信息',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `deleted` bigint NOT NULL DEFAULT '0' COMMENT '是否删除标志,0 未删除,其他 已删除',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_pid_videoId_mediaId_deleted` (`pid`,`video_id`,`media_id`,`deleted`),
  KEY `idx_videoId` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mg_video_num` */

insert  into `mg_video_num`(`id`,`pid`,`video_id`,`video_num`,`media_id`,`mp4_url`,`expires_time`,`extend_info`,`create_at`,`create_by`,`update_at`,`update_by`,`deleted`,`version`) values (61,1,10,1,1690928831063000,'http://16909291206870001','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(62,1,10,2,1690928831063001,'http://16909291206870005','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(63,1,10,3,1690928831063002,'http://16909291206870004','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(64,1,10,4,1690928831063003,'http://1690928831063','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(65,1,10,5,1690928831063004,'http://16909291206870002','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(66,1,10,6,1690928831063005,'http://16909291206870000','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(67,1,10,7,1690928831063006,'http://16909291207020006','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(68,1,10,8,1690928831063007,'http://16909291207020007','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(69,1,10,9,1690928831063008,'http://16909291207030008','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(70,1,10,10,1690928831063009,'http://16909291207030009','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(71,1,10,11,1690928831063010,'http://169092912070500016','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(72,1,10,12,1690928831063011,'http://169092912070400013','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(73,1,10,13,1690928831063012,'http://169092912070500015','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(74,1,10,14,1690928831063013,'http://169092912070400012','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(75,1,10,15,1690928831063014,'http://169092912070400010','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(76,1,10,16,1690928831063015,'http://169092912070400011','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(77,1,10,17,1690928831063016,'http://169092912070800017','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(78,1,10,18,1690928831063017,'http://169092912070800019','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(79,1,10,19,1690928831063018,'http://169092912070500014','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(80,1,10,20,1690928831063019,'http://169092912070800018','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(81,2,10,1,1690928831063000,'http://16909291206870001','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(82,2,10,2,1690928831063001,'http://16909291206870005','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(83,2,10,3,1690928831063002,'http://16909291206870004','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(84,2,10,4,1690928831063003,'http://1690928831063','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(85,2,10,5,1690928831063004,'http://16909291206870002','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(86,2,10,6,1690928831063005,'http://16909291206870000','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(87,2,10,7,1690928831063006,'http://16909291207020006','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(88,2,10,8,1690928831063007,'http://16909291207020007','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(89,2,10,9,1690928831063008,'http://16909291207030008','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(90,2,10,10,1690928831063009,'http://16909291207030009','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(91,2,10,11,1690928831063010,'http://169092912070500016','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(92,2,10,12,1690928831063011,'http://169092912070400013','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(93,2,10,13,1690928831063012,'http://169092912070500015','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(94,2,10,14,1690928831063013,'http://169092912070400012','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(95,2,10,15,1690928831063014,'http://169092912070400010','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(96,2,10,16,1690928831063015,'http://169092912070400011','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(97,2,10,17,1690928831063016,'http://169092912070800017','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(98,2,10,18,1690928831063017,'http://169092912070800019','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(99,2,10,19,1690928831063018,'http://169092912070500014','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(100,2,10,20,1690928831063019,'http://169092912070800018','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(101,3,10,1,1690928831063000,'http://16909291206870001','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(102,3,10,2,1690928831063001,'http://16909291206870005','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(103,3,10,3,1690928831063002,'http://16909291206870004','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(104,3,10,4,1690928831063003,'http://1690928831063','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(105,3,10,5,1690928831063004,'http://16909291206870002','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(106,3,10,6,1690928831063005,'http://16909291206870000','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(107,3,10,7,1690928831063006,'http://16909291207020006','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(108,3,10,8,1690928831063007,'http://16909291207020007','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(109,3,10,9,1690928831063008,'http://16909291207030008','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(110,3,10,10,1690928831063009,'http://16909291207030009','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(111,3,10,11,1690928831063010,'http://169092912070500016','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(112,3,10,12,1690928831063011,'http://169092912070400013','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(113,3,10,13,1690928831063012,'http://169092912070500015','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(114,3,10,14,1690928831063013,'http://169092912070400012','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(115,3,10,15,1690928831063014,'http://169092912070400010','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(116,3,10,16,1690928831063015,'http://169092912070400011','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(117,3,10,17,1690928831063016,'http://169092912070800017','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(118,3,10,18,1690928831063017,'http://169092912070800019','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(119,3,10,19,1690928831063018,'http://169092912070500014','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(120,3,10,20,1690928831063019,'http://169092912070800018','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(121,4,10,1,1690928831063000,'http://16909291206870001','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(122,4,10,2,1690928831063001,'http://16909291206870005','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(123,4,10,3,1690928831063002,'http://16909291206870004','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(124,4,10,4,1690928831063003,'http://1690928831063','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(125,4,10,5,1690928831063004,'http://16909291206870002','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(126,4,10,6,1690928831063005,'http://16909291206870000','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(127,4,10,7,1690928831063006,'http://16909291207020006','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(128,4,10,8,1690928831063007,'http://16909291207020007','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(129,4,10,9,1690928831063008,'http://16909291207030008','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(130,4,10,10,1690928831063009,'http://16909291207030009','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(131,4,10,11,1690928831063010,'http://169092912070500016','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(132,4,10,12,1690928831063011,'http://169092912070400013','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(133,4,10,13,1690928831063012,'http://169092912070500015','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(134,4,10,14,1690928831063013,'http://169092912070400012','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(135,4,10,15,1690928831063014,'http://169092912070400010','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(136,4,10,16,1690928831063015,'http://169092912070400011','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(137,4,10,17,1690928831063016,'http://169092912070800017','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(138,4,10,18,1690928831063017,'http://169092912070800019','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(139,4,10,19,1690928831063018,'http://169092912070500014','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(140,4,10,20,1690928831063019,'http://169092912070800018','2023-08-02 08:27:11','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(141,1,11,21,1690929224464020,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(142,1,11,22,1690929224464021,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(143,1,11,23,1690929224464022,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(144,1,11,24,1690929224464023,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(145,1,11,25,1690929224464024,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(146,1,11,26,1690929224464025,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(147,1,11,27,1690929224464026,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(148,1,11,28,1690929224464027,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(149,1,11,29,1690929224464028,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(150,1,11,30,1690929224464029,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(151,1,11,31,1690929224464030,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(152,1,11,32,1690929224464031,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(153,1,11,33,1690929224464032,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(154,1,11,34,1690929224464033,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(155,1,11,35,1690929224464034,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(156,1,11,36,1690929224464035,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(157,1,11,37,1690929224464036,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(158,1,11,38,1690929224464037,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(159,1,11,39,1690929224464038,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(160,1,11,40,1690929224464039,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(161,2,11,21,1690929224464020,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(162,2,11,22,1690929224464021,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(163,2,11,23,1690929224464022,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(164,2,11,24,1690929224464023,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(165,2,11,25,1690929224464024,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(166,2,11,26,1690929224464025,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(167,2,11,27,1690929224464026,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(168,2,11,28,1690929224464027,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(169,2,11,29,1690929224464028,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(170,2,11,30,1690929224464029,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(171,2,11,31,1690929224464030,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(172,2,11,32,1690929224464031,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(173,2,11,33,1690929224464032,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(174,2,11,34,1690929224464033,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(175,2,11,35,1690929224464034,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(176,2,11,36,1690929224464035,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(177,2,11,37,1690929224464036,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(178,2,11,38,1690929224464037,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(179,2,11,39,1690929224464038,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(180,2,11,40,1690929224464039,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(181,3,11,21,1690929224464020,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(182,3,11,22,1690929224464021,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(183,3,11,23,1690929224464022,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(184,3,11,24,1690929224464023,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(185,3,11,25,1690929224464024,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(186,3,11,26,1690929224464025,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(187,3,11,27,1690929224464026,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(188,3,11,28,1690929224464027,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(189,3,11,29,1690929224464028,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(190,3,11,30,1690929224464029,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(191,3,11,31,1690929224464030,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(192,3,11,32,1690929224464031,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(193,3,11,33,1690929224464032,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(194,3,11,34,1690929224464033,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(195,3,11,35,1690929224464034,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(196,3,11,36,1690929224464035,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(197,3,11,37,1690929224464036,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(198,3,11,38,1690929224464037,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(199,3,11,39,1690929224464038,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(200,3,11,40,1690929224464039,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(201,4,11,21,1690929224464020,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(202,4,11,22,1690929224464021,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(203,4,11,23,1690929224464022,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(204,4,11,24,1690929224464023,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(205,4,11,25,1690929224464024,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(206,4,11,26,1690929224464025,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(207,4,11,27,1690929224464026,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(208,4,11,28,1690929224464027,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(209,4,11,29,1690929224464028,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(210,4,11,30,1690929224464029,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(211,4,11,31,1690929224464030,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(212,4,11,32,1690929224464031,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(213,4,11,33,1690929224464032,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(214,4,11,34,1690929224464033,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(215,4,11,35,1690929224464034,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(216,4,11,36,1690929224464035,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(217,4,11,37,1690929224464036,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(218,4,11,38,1690929224464037,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(219,4,11,39,1690929224464038,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0),(220,4,11,40,1690929224464039,'http://1690929224464','2023-08-02 08:33:44','','2023-08-05 22:55:37','','2023-08-05 22:55:37','',0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
