CREATE DATABASE `management` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `age` double NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `addr` varchar(50) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `custom_account` (
  `accountid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `ownerid` varchar(50) NOT NULL,
  `carid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) NOT NULL,
  `dep` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `sell` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `floor` varchar(50) NOT NULL,
  `direction` varchar(50) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `ownerid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `inspection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `itime` date NOT NULL,
  `conductor` varchar(32) NOT NULL,
  `party` varchar(50) NOT NULL,
  `result` varchar(50) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `maintain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thing` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `homesnumber` varchar(50) NOT NULL,
  `sdate` date NOT NULL,
  `rdate` date DEFAULT NULL,
  `tcost` double NOT NULL,
  `scost` double DEFAULT NULL,
  `maintainer` varchar(32) NOT NULL,
  `smemo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `ndate` date NOT NULL,
  `title` varchar(50) NOT NULL,
  `uper` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO admin (ID, NAME, PASSWORD, SEX, AGE, ADDR, MEMO) 
values ('admin', '4QrcOUm6Wau+VuBX8g+IPg==', 'ÄÐ', '21', 'Î÷°²', 'Ä¬ÈÏ');
