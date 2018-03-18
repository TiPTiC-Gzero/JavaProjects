/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : new_education_db

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2018-01-03 23:48:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `stu_attendance_record_detail`
-- ----------------------------
DROP TABLE IF EXISTS `stu_attendance_record_detail`;
CREATE TABLE `stu_attendance_record_detail` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `attDate` date NOT NULL COMMENT '考勤日期',
  `userId` varchar(50) NOT NULL COMMENT '用户id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1上课，2下课',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime NOT NULL COMMENT '打卡时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生考勤打卡记录明细表';

-- ----------------------------
-- Records of stu_attendance_record_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_attendance_record_head`
-- ----------------------------
DROP TABLE IF EXISTS `stu_attendance_record_head`;
CREATE TABLE `stu_attendance_record_head` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `attDate` date NOT NULL COMMENT '考勤日期',
  `userId` varchar(50) NOT NULL COMMENT '用户id',
  `startDate` datetime DEFAULT NULL COMMENT '上课第一次打卡时间',
  `endDate` datetime DEFAULT NULL COMMENT '下课最后一次打卡时间',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生考勤打卡记录主表';

-- ----------------------------
-- Records of stu_attendance_record_head
-- ----------------------------
INSERT INTO `stu_attendance_record_head` VALUES ('9359351dc80342bab08d3492b41cb88d', '2018-01-03', '1', '2018-01-03 21:05:41', '2018-01-03 21:05:44', '1', '2018-01-03 21:05:41', '1', '2018-01-03 21:05:45', '');
INSERT INTO `stu_attendance_record_head` VALUES ('c14c278831cd4333b554ee9d6844c45f', '2018-01-02', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 18:47:14', '2018-01-02 18:47:18', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 18:47:14', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 18:47:18', '');
INSERT INTO `stu_attendance_record_head` VALUES ('df89508db9034fd182c273fd30d06f1a', '2017-12-31', 'b5e59bd6e1da4098a28da61121e1d39b', '2017-12-31 17:55:35', '2017-12-31 18:03:51', 'b5e59bd6e1da4098a28da61121e1d39b', '2017-12-31 17:55:35', 'b5e59bd6e1da4098a28da61121e1d39b', '2017-12-31 18:03:51', '');
INSERT INTO `stu_attendance_record_head` VALUES ('e241bbfa30844996a098c7bcb273d31a', '2018-01-01', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-01 17:29:55', '2018-01-01 17:30:11', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-01 17:29:55', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-01 17:30:12', '');

-- ----------------------------
-- Table structure for `stu_college_class`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_class`;
CREATE TABLE `stu_college_class` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `classYear` int(5) NOT NULL COMMENT '班级学年',
  `majorId` varchar(50) NOT NULL DEFAULT '0000' COMMENT '专业id',
  `name` varchar(20) NOT NULL COMMENT '班级名称(分班)',
  `headTeacher` varchar(20) DEFAULT NULL COMMENT '班主任姓名',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校班级信息管理表';

-- ----------------------------
-- Records of stu_college_class
-- ----------------------------
INSERT INTO `stu_college_class` VALUES ('071b363ec8f74762a0ab960d48a52eef', '2017', 'aceb9a277eab4c83ab6cd6f54ad984fd', '102', '老梁', '第2届102', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:20:34', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:20:34', '');
INSERT INTO `stu_college_class` VALUES ('5335201b263243a881749c1b283fac05', '2017', 'fbe13c0386b7451e946ea4acc1db3aa6', '302', '老李', '第2届302', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:23:19', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:23:19', '');
INSERT INTO `stu_college_class` VALUES ('5dfa7e792460487a9db8eb356ea88884', '2017', 'aceb9a277eab4c83ab6cd6f54ad984fd', '101', '大神', '第2届101', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:19:54', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:19:54', '');
INSERT INTO `stu_college_class` VALUES ('75960aae3ffd4675b3cda251ad49e2ca', '2017', '63f71af9cafd4062a04e052944380c9d', '202', '大M', '第2届202', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:21:46', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:21:56', '');
INSERT INTO `stu_college_class` VALUES ('e6ff041d48c445ee90c3556c9e96d8e7', '2017', 'fbe13c0386b7451e946ea4acc1db3aa6', '301', '老张', '第2届301', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:22:50', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:22:50', '');
INSERT INTO `stu_college_class` VALUES ('ee44b5d59fc543429de9769697215009', '2017', '63f71af9cafd4062a04e052944380c9d', '201', '大N', '第2届201', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:21:28', '22528febe5224b428596260c3caa84d6', '2018-01-01 18:21:28', '');

-- ----------------------------
-- Table structure for `stu_college_class2user`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_class2user`;
CREATE TABLE `stu_college_class2user` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `classId` varchar(50) NOT NULL COMMENT '班级id--stu_college_class.id',
  `userId` varchar(50) NOT NULL DEFAULT '' COMMENT '学生id--user.id',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级与学生关联表';

-- ----------------------------
-- Records of stu_college_class2user
-- ----------------------------
INSERT INTO `stu_college_class2user` VALUES ('302d5c98012c4496bcebeaaa7ac83773', '75960aae3ffd4675b3cda251ad49e2ca', 'e055572b61ed4472863543a15fe88b1b', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:44:21', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:44:21', '');
INSERT INTO `stu_college_class2user` VALUES ('3e58c6b7fa2a4482979071d6bbd99bdc', 'e6ff041d48c445ee90c3556c9e96d8e7', '2bd41a2376cc40afa1a8e2bb540bf0da', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:46:05', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:46:05', '');
INSERT INTO `stu_college_class2user` VALUES ('be4345b8085e4026a41302102311603c', '5dfa7e792460487a9db8eb356ea88884', '9e014f01020842cda14996506fa32538', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:45:48', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:45:48', '');
INSERT INTO `stu_college_class2user` VALUES ('cecf4f155d0d4831b796eca97f63a97c', '5dfa7e792460487a9db8eb356ea88884', 'bc7a582b82524ecdb0fd47e4c832e8d4', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:45:33', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:45:33', '');
INSERT INTO `stu_college_class2user` VALUES ('fc81e5fde740471b9fc39532d1b0e20d', '071b363ec8f74762a0ab960d48a52eef', '2bd41a2376cc40afa1a8e2bb540bf0da', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:44:38', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:44:38', '');

-- ----------------------------
-- Table structure for `stu_college_course`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_course`;
CREATE TABLE `stu_college_course` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `majorId` varchar(50) NOT NULL COMMENT '专业id',
  `name` varchar(30) NOT NULL COMMENT '课程名称',
  `minutes` tinyint(4) NOT NULL DEFAULT '45' COMMENT '课时（分钟）',
  `pptFileUrl` varchar(300) DEFAULT NULL COMMENT '课件地址',
  `gradeScore` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程成绩分数(0不需要考核,>0需要考核)',
  `ratio` float(3,2) NOT NULL DEFAULT '0.00' COMMENT '课程成绩占比数',
  `remark` varchar(350) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息管理表';

-- ----------------------------
-- Records of stu_college_course
-- ----------------------------
INSERT INTO `stu_college_course` VALUES ('0fb179c97ca64a90b1f326463dda2247', '63f71af9cafd4062a04e052944380c9d', 'mysql基础', '18', null, '100', '0.20', '需要考核，成绩占比20%', '22528febe5224b428596260c3caa84d6', '2018-01-03 17:29:25', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:38:20', '');
INSERT INTO `stu_college_course` VALUES ('14b06f3ce28241caa583df1b46e099aa', '63f71af9cafd4062a04e052944380c9d', '学生考勤', '0', null, '0', '0.10', '需要考核，成绩占比10%', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:39:27', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:46:14', '');
INSERT INTO `stu_college_course` VALUES ('180bd7a551d647d6b75d53b1c8a0d4dc', '63f71af9cafd4062a04e052944380c9d', '上机', '120', null, '0', '0.00', '不需要考核', '22528febe5224b428596260c3caa84d6', '2018-01-03 17:28:57', '22528febe5224b428596260c3caa84d6', '2018-01-03 17:28:57', '');
INSERT INTO `stu_college_course` VALUES ('1a88b6c29d564bf69e629c61b0420de1', '63f71af9cafd4062a04e052944380c9d', '项目实践', '20', null, '100', '0.50', '需要考核，成绩占比50%', '22528febe5224b428596260c3caa84d6', '2018-01-03 17:30:18', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:38:13', '');
INSERT INTO `stu_college_course` VALUES ('672ded5f68bb40178316e612977f657b', 'aceb9a277eab4c83ab6cd6f54ad984fd', 'spring', '40', null, '100', '0.20', '需要考核，成绩占比20%', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:11:50', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:37:46', '');
INSERT INTO `stu_college_course` VALUES ('78fdfdc846e74d598817204428276df9', '63f71af9cafd4062a04e052944380c9d', '.net基础', '80', null, '100', '0.20', '需要考核，成绩占比20%', '22528febe5224b428596260c3caa84d6', '2018-01-03 17:29:56', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:38:26', '');
INSERT INTO `stu_college_course` VALUES ('80db719b6cee452e8419a8f5c22e6672', 'aceb9a277eab4c83ab6cd6f54ad984fd', '项目实践', '80', null, '100', '0.50', '需要考核，成绩占比50%', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:32:01', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:38:04', '');
INSERT INTO `stu_college_course` VALUES ('94b992c965274a53b8eff3e3e6fb3585', 'aceb9a277eab4c83ab6cd6f54ad984fd', '上机', '120', null, '0', '0.00', '不需要考核', '22528febe5224b428596260c3caa84d6', '2018-01-03 16:29:42', '22528febe5224b428596260c3caa84d6', '2018-01-03 16:29:42', '');
INSERT INTO `stu_college_course` VALUES ('c288ede04f7f4cdc8d7edfc79b7dc838', 'aceb9a277eab4c83ab6cd6f54ad984fd', '学生考勤', '0', null, '0', '0.10', '需要考核，成绩占比10%', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:40:03', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:45:56', '');
INSERT INTO `stu_college_course` VALUES ('fe5cacef1c0d410d9c38b4796f259cb4', 'aceb9a277eab4c83ab6cd6f54ad984fd', 'mysql基础', '18', null, '100', '0.20', '需要考核，成绩占比20%', '22528febe5224b428596260c3caa84d6', '2018-01-01 19:13:45', '22528febe5224b428596260c3caa84d6', '2018-01-03 21:37:53', '');

-- ----------------------------
-- Table structure for `stu_college_course_file`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_course_file`;
CREATE TABLE `stu_college_course_file` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `fileServerId` varchar(50) DEFAULT NULL COMMENT '文件服务器id',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_college_course_file
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_college_course_notes`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_course_notes`;
CREATE TABLE `stu_college_course_notes` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `courseName` varchar(50) NOT NULL COMMENT '课程id',
  `userId` varchar(50) NOT NULL COMMENT '学生id',
  `noteContent` longtext NOT NULL COMMENT '笔记内容',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程笔记管理表';

-- ----------------------------
-- Records of stu_college_course_notes
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_college_grade`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_grade`;
CREATE TABLE `stu_college_grade` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `majorId` varchar(50) DEFAULT NULL COMMENT '专业id',
  `userId` varchar(50) NOT NULL COMMENT '学生id',
  `courseScore` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程成绩得分',
  `attenScore` float(10,2) NOT NULL DEFAULT '10.00' COMMENT '考勤得分',
  `autoGradeScore` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '汇总成绩(根据算法自动求出)',
  `manualGradeScore` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '汇总成绩(人工录入，暂时不用)',
  `hasCourseScoreFlag` bit(1) DEFAULT b'0' COMMENT '是否已经保存了各课程的成绩',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生成绩汇总管理表';

-- ----------------------------
-- Records of stu_college_grade
-- ----------------------------
INSERT INTO `stu_college_grade` VALUES ('1e5cad8545c14d298843a78673e5aba4', null, '1e5cad8545c14d298843a78673e5aba4', '0.00', '10.00', '0.00', '0.00', '', '1e5cad8545c14d298843a78673e5aba4', '2018-01-03 23:29:32', '1e5cad8545c14d298843a78673e5aba4', '2018-01-03 23:29:32', '');
INSERT INTO `stu_college_grade` VALUES ('2bd41a2376cc40afa1a8e2bb540bf0da', null, '2bd41a2376cc40afa1a8e2bb540bf0da', '0.00', '10.00', '0.00', '0.00', '', '2bd41a2376cc40afa1a8e2bb540bf0da', '2018-01-03 23:28:11', '2bd41a2376cc40afa1a8e2bb540bf0da', '2018-01-03 23:28:11', '');
INSERT INTO `stu_college_grade` VALUES ('9e014f01020842cda14996506fa32538', null, '9e014f01020842cda14996506fa32538', '0.00', '10.00', '0.00', '0.00', '', '9e014f01020842cda14996506fa32538', '2018-01-03 23:32:21', '9e014f01020842cda14996506fa32538', '2018-01-03 23:32:21', '');
INSERT INTO `stu_college_grade` VALUES ('bc7a582b82524ecdb0fd47e4c832e8d4', null, 'bc7a582b82524ecdb0fd47e4c832e8d4', '0.00', '10.00', '0.00', '0.00', '', 'bc7a582b82524ecdb0fd47e4c832e8d4', '2018-01-03 23:33:10', 'bc7a582b82524ecdb0fd47e4c832e8d4', '2018-01-03 23:33:10', '');
INSERT INTO `stu_college_grade` VALUES ('e055572b61ed4472863543a15fe88b1b', null, 'e055572b61ed4472863543a15fe88b1b', '0.00', '10.00', '0.00', '0.00', '', 'e055572b61ed4472863543a15fe88b1b', '2018-01-03 23:25:57', 'e055572b61ed4472863543a15fe88b1b', '2018-01-03 23:25:57', '');

-- ----------------------------
-- Table structure for `stu_college_grade_user2course`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_grade_user2course`;
CREATE TABLE `stu_college_grade_user2course` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '学生id',
  `majorId` varchar(50) DEFAULT NULL COMMENT '专业id',
  `courseId` varchar(50) NOT NULL DEFAULT '0.00' COMMENT '课程id',
  `score` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '成绩分数',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生每门课程成绩管理表';

-- ----------------------------
-- Records of stu_college_grade_user2course
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_college_major`
-- ----------------------------
DROP TABLE IF EXISTS `stu_college_major`;
CREATE TABLE `stu_college_major` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `parentId` varchar(50) DEFAULT '0' COMMENT '父级id',
  `code` varchar(20) DEFAULT NULL COMMENT '标识码',
  `name` varchar(40) NOT NULL COMMENT '专业名称',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校专业管理表';

-- ----------------------------
-- Records of stu_college_major
-- ----------------------------
INSERT INTO `stu_college_major` VALUES ('31d25e7bb77244acbabb145c967742ef', '6fcb98bf76bb472380e0b7fbac8677b3', '006', '人工智能', '人工智能开发', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:57:33', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:57:33', '');
INSERT INTO `stu_college_major` VALUES ('63f71af9cafd4062a04e052944380c9d', '6fcb98bf76bb472380e0b7fbac8677b3', '003', '.Net', '.Net开发', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:56:13', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:56:13', '');
INSERT INTO `stu_college_major` VALUES ('6fcb98bf76bb472380e0b7fbac8677b3', '0', 'IT', '计算机技术', '计算机技术专业', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:54:04', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:54:04', '');
INSERT INTO `stu_college_major` VALUES ('a6842b332eb844f08f7edf9b79b636fc', '6fcb98bf76bb472380e0b7fbac8677b3', '005', '算法', '算法开发', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:57:11', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:57:11', '');
INSERT INTO `stu_college_major` VALUES ('aceb9a277eab4c83ab6cd6f54ad984fd', '6fcb98bf76bb472380e0b7fbac8677b3', '001', 'Java', 'Java开发', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:55:17', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:56:23', '');
INSERT INTO `stu_college_major` VALUES ('f67e4730387746cbab75886ac0e4b434', '6fcb98bf76bb472380e0b7fbac8677b3', '004', '大数据', '大数据开发', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:56:54', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:56:54', '');
INSERT INTO `stu_college_major` VALUES ('fbe13c0386b7451e946ea4acc1db3aa6', '6fcb98bf76bb472380e0b7fbac8677b3', '002', '开源', '开源方向', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:55:47', '22528febe5224b428596260c3caa84d6', '2018-01-01 17:55:47', '');

-- ----------------------------
-- Table structure for `stu_leave_record`
-- ----------------------------
DROP TABLE IF EXISTS `stu_leave_record`;
CREATE TABLE `stu_leave_record` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '用户id',
  `typeId` varchar(50) NOT NULL COMMENT '请假类型--stu_leave_type.id',
  `picFileId` varchar(300) DEFAULT NULL COMMENT '上传的请假条图片地址',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `auditEnum` tinyint(4) NOT NULL DEFAULT '10' COMMENT '审核状态：10待审核,20审核通过,30驳回',
  `auditRemark` varchar(350) DEFAULT NULL COMMENT '审核说明',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假记录表';

-- ----------------------------
-- Records of stu_leave_record
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_leave_record_file`
-- ----------------------------
DROP TABLE IF EXISTS `stu_leave_record_file`;
CREATE TABLE `stu_leave_record_file` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `fileServerId` varchar(50) DEFAULT NULL COMMENT '文件服务器id',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目文件表';

-- ----------------------------
-- Records of stu_leave_record_file
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_leave_type`
-- ----------------------------
DROP TABLE IF EXISTS `stu_leave_type`;
CREATE TABLE `stu_leave_type` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `code` varchar(20) DEFAULT NULL COMMENT '标识码',
  `name` varchar(30) NOT NULL COMMENT '参数名称',
  `remark` varchar(350) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假类型定义表';

-- ----------------------------
-- Records of stu_leave_type
-- ----------------------------
INSERT INTO `stu_leave_type` VALUES ('1f6dd69cd91a493fa26738df277eb83a', '110', '病假', '病假', '21232F297A57A5A743894A0E4A801FC3', '2017-12-31 18:27:44', '21232F297A57A5A743894A0E4A801FC3', '2017-12-31 18:27:44', '');
INSERT INTO `stu_leave_type` VALUES ('ecf449e78f284f3c88ecb9c5fc1a0c29', '100', '事假', '事假', '21232F297A57A5A743894A0E4A801FC3', '2017-12-31 18:27:07', '21232F297A57A5A743894A0E4A801FC3', '2017-12-31 18:27:51', '');

-- ----------------------------
-- Table structure for `stu_project`
-- ----------------------------
DROP TABLE IF EXISTS `stu_project`;
CREATE TABLE `stu_project` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '学生id',
  `courseName` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `projectName` varchar(60) NOT NULL COMMENT '项目名称',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生项目信息表';

-- ----------------------------
-- Records of stu_project
-- ----------------------------
INSERT INTO `stu_project` VALUES ('7e433796f7c544dcab2dd883d6bda2af', 'b5e59bd6e1da4098a28da61121e1d39b', 'java', '教务管理系统', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 19:03:36', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 19:27:19', '');

-- ----------------------------
-- Table structure for `stu_project2file`
-- ----------------------------
DROP TABLE IF EXISTS `stu_project2file`;
CREATE TABLE `stu_project2file` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `projectId` varchar(50) NOT NULL COMMENT '项目id-stu_project.id',
  `projectFileId` varchar(50) NOT NULL COMMENT '上传的文件id-stu_project_file.id',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生项目与上传文件关联表';

-- ----------------------------
-- Records of stu_project2file
-- ----------------------------
INSERT INTO `stu_project2file` VALUES ('1a5fc392042443c6a8d6073b96cc5e61', '7e433796f7c544dcab2dd883d6bda2af', '6a1cdbc73cff495ca221dc82544fce14', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:09', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:09', '');
INSERT INTO `stu_project2file` VALUES ('4e15bbce42044961a64e693c160ce17f', '7e433796f7c544dcab2dd883d6bda2af', 'bdb0a3f817924ed38f32e587bafd4aed', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:23', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:23', '');

-- ----------------------------
-- Table structure for `stu_project_file`
-- ----------------------------
DROP TABLE IF EXISTS `stu_project_file`;
CREATE TABLE `stu_project_file` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `fileServerId` varchar(50) DEFAULT NULL COMMENT '文件服务器id',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目文件表';

-- ----------------------------
-- Records of stu_project_file
-- ----------------------------
INSERT INTO `stu_project_file` VALUES ('6a1cdbc73cff495ca221dc82544fce14', '模板文档199.xlsx', '/upload/project/79c0a5a3a3884dfe99e3a7eb094ef4e7.xlsx', '34024', 'local', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:09', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:09', '');
INSERT INTO `stu_project_file` VALUES ('bdb0a3f817924ed38f32e587bafd4aed', '用户画像PRD.docx', '/upload/project/f124a9a821274dc1a35979b7e8178e65.docx', '62099', 'local', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:23', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-03 14:22:23', '');

-- ----------------------------
-- Table structure for `stu_resume`
-- ----------------------------
DROP TABLE IF EXISTS `stu_resume`;
CREATE TABLE `stu_resume` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '学生id',
  `name` varchar(30) NOT NULL COMMENT '简历主题',
  `resumeFileId` varchar(50) DEFAULT NULL COMMENT '简历文件id--stu_resume_file.id',
  `fileUrl` varchar(300) DEFAULT NULL COMMENT '文件的url地址',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生简历信息表';

-- ----------------------------
-- Records of stu_resume
-- ----------------------------
INSERT INTO `stu_resume` VALUES ('52bf5e5ef5d74349b14df903a309b55f', 'b5e59bd6e1da4098a28da61121e1d39b', '小A简历 - 一个优质的IT男', '7dbdfc6fbdaa4f31ab980d2216e2ce6c', null, 'test', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-01 22:22:40', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 11:46:05', '');
INSERT INTO `stu_resume` VALUES ('fb8e976ed3ca4563b930f806aee4e913', 'b5e59bd6e1da4098a28da61121e1d39b', 'test-A', 'b6e3cc96d5814625a98402c73a9496bc', null, 'test-A22222222', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 01:09:36', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 11:40:44', '');

-- ----------------------------
-- Table structure for `stu_resume_file`
-- ----------------------------
DROP TABLE IF EXISTS `stu_resume_file`;
CREATE TABLE `stu_resume_file` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `fileServerId` varchar(50) DEFAULT NULL COMMENT '文件服务器id',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历文件表';

-- ----------------------------
-- Records of stu_resume_file
-- ----------------------------
INSERT INTO `stu_resume_file` VALUES ('7dbdfc6fbdaa4f31ab980d2216e2ce6c', '新员工必看.docx', '/upload/resume/b15b91ba81184fc48e669a5f2c523ada.docx', '66553', 'local', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 11:46:05', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 11:46:05', '');
INSERT INTO `stu_resume_file` VALUES ('b6e3cc96d5814625a98402c73a9496bc', '教务管理系统需求分析.docx', '/upload/resume/4315119b9dad403a80baceb19b8e46cd.docx', '121755', 'local', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 11:40:44', 'b5e59bd6e1da4098a28da61121e1d39b', '2018-01-02 11:40:44', '');

-- ----------------------------
-- Table structure for `system_base_file_del`
-- ----------------------------
DROP TABLE IF EXISTS `system_base_file_del`;
CREATE TABLE `system_base_file_del` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `beanTableName` varchar(100) DEFAULT NULL COMMENT '主表表名',
  `beanId` varchar(50) DEFAULT NULL COMMENT '主表ID',
  `beanColumn` varchar(50) DEFAULT NULL COMMENT '主表中保存文件ID的字段名',
  `name` varchar(255) DEFAULT NULL COMMENT '原文件名称xxx.jpg',
  `filePath` varchar(255) DEFAULT NULL COMMENT '相对路径/ixtres/customerId/pic/xxx.jpg',
  `size` bigint(11) DEFAULT NULL COMMENT '大小',
  `fileServerId` varchar(50) DEFAULT NULL COMMENT '文件服务器code',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_base_file_del
-- ----------------------------



-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `code` varchar(20) DEFAULT NULL COMMENT '标识码',
  `name` varchar(30) NOT NULL COMMENT '参数名称',
  `remark` varchar(350) NOT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数配置信息表';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('09151cab7d544baba2e1d86ddbd61f66', 'copyright', '版权', 'MX工作室', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:36:22', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:36:22', '');
INSERT INTO `system_config` VALUES ('93099beaabb84b01b998182b725e82dc', 'systemName', '系统名称', 'NEW教务管理系统', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:34:05', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:34:05', '');
INSERT INTO `system_config` VALUES ('c3d9eba4eeb4406883547cfd4dfc9d87', 'test', '测试', '测试数据可删除', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:39:32', '22528febe5224b428596260c3caa84d6', '2018-01-03 22:37:41', '');

-- ----------------------------
-- Table structure for `system_notification`
-- ----------------------------
DROP TABLE IF EXISTS `system_notification`;
CREATE TABLE `system_notification` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '发布人id',
  `message` varchar(1000) NOT NULL COMMENT '公告内容',
  `openFlag` bit(1) NOT NULL DEFAULT b'1' COMMENT '开放状态：1开放，0不开放',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告表';

-- ----------------------------
-- Records of system_notification
-- ----------------------------
INSERT INTO `system_notification` VALUES ('5ab4cd2f282f4e6aaa4089b1d3ad83c9', '22528febe5224b428596260c3caa84d6', '好好学习，做一名合格的IT程序员', '', '22528febe5224b428596260c3caa84d6', '2017-12-31 16:29:33', '22528febe5224b428596260c3caa84d6', '2017-12-31 16:29:33', '');
INSERT INTO `system_notification` VALUES ('b1effa30aac245fd84a4d232c0823464', '21232F297A57A5A743894A0E4A801FC3', '新年好，新年到！老师们祝同学们在新的一年里好好学习，天天向上！', '', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 21:57:46', '22528febe5224b428596260c3caa84d6', '2017-12-31 16:04:16', '');
INSERT INTO `system_notification` VALUES ('b5f74ec03a1f479d9a7385e855e3864d', '21232F297A57A5A743894A0E4A801FC3', '2018年元旦放假3天，2017/12/30 2017/12/31 2018/01/01', '', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:44:26', '21232F297A57A5A743894A0E4A801FC3', '2017-12-30 20:44:26', '');

-- ----------------------------
-- Table structure for `system_server_info`
-- ----------------------------
DROP TABLE IF EXISTS `system_server_info`;
CREATE TABLE `system_server_info` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `code` varchar(50) DEFAULT NULL COMMENT '注记码',
  `rootPath` varchar(150) DEFAULT NULL COMMENT '映射绝对路径前缀：e:/ ,s:/',
  `name` varchar(50) DEFAULT NULL COMMENT '服务器名称(别名)',
  `fileServerIP` varchar(50) DEFAULT NULL COMMENT '文件服务器IP',
  `fileServerUrl` varchar(255) DEFAULT NULL COMMENT '文件服务器访问地址，格式：http://ip:port/',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人ID',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识：0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_server_info
-- ----------------------------
INSERT INTO `system_server_info` VALUES ('develop', 'develop', '/workspace/storage/Webapp/resource/', '文件服务器 - 开发机', '192.168.2.16', 'http://192.168.2.16/', null, '31180215c4104df183b9684f3348e740', '2016-08-13 15:18:14', '31180215c4104df183b9684f3348e740', '2016-08-13 15:20:31', '');
INSERT INTO `system_server_info` VALUES ('final', 'final', '/workspace/storage/Webapp/resource/', '文件服务器 - 生产机', '192.168.2.50', 'http://192.168.2.50/', '', '6be7b999c8814e8d8816a427a78b260f', '2015-07-15 13:58:11', '31180215c4104df183b9684f3348e740', '2016-08-13 15:27:28', '');
INSERT INTO `system_server_info` VALUES ('local', 'local', '/upload/', '文件服务器 - 本地PC机', '127.0.0.1', 'http://localhost/NewEducationalSystem', null, '31180215c4104df183b9684f3348e740', '2016-08-13 14:11:12', '31180215c4104df183b9684f3348e740', '2016-08-13 14:11:12', '');
INSERT INTO `system_server_info` VALUES ('test', 'test', '/workspace/storage/Webapp/resource/', '文件服务器 - 测试机', '192.168.2.20', 'http://192.168.2.20/', null, '31180215c4104df183b9684f3348e740', '2016-08-13 15:25:36', '31180215c4104df183b9684f3348e740', '2016-08-13 15:25:36', '');

-- ----------------------------
-- Table structure for `system_user`
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '主键',
  `code` varchar(15) DEFAULT NULL COMMENT '学号，工号',
  `password` varchar(50) NOT NULL DEFAULT 'E10ADC3949BA59ABBE56E057F20F883E' COMMENT '密码（加密处理，默认123456）',
  `autoPwdFlag` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否为自动生成的密码（1是，0否）',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` bit(1) NOT NULL DEFAULT b'0' COMMENT '性别（0男，1女）',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ号',
  `userType` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户类别：1学生，2老师，9管理员',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(50) DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除：1删除，0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1e5cad8545c14d298843a78673e5aba4', '201709090003', 'e10adc3949ba59abbe56e057f20f883e', '', '李四', '', '1994-03-03', null, 'qqllsky@163.com', null, '1', '密码：123456', null, '2018-01-03 23:29:32', '1e5cad8545c14d298843a78673e5aba4', '2018-01-03 23:35:33', '');
INSERT INTO `system_user` VALUES ('21232F297A57A5A743894A0E4A801FC3', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '系统管理员', '', null, null, null, null, '9', '密码为admin', null, null, null, null, '');
INSERT INTO `system_user` VALUES ('2535fb3d91594facb5578ea24f430064', '5001', 'e10adc3949ba59abbe56e057f20f883e', '', '王老师', '', '1980-01-17', null, 'qqllsky@163.com', null, '2', '密码：123456', null, '2018-01-03 23:30:34', '2535fb3d91594facb5578ea24f430064', '2018-01-03 23:43:01', '');
INSERT INTO `system_user` VALUES ('2bd41a2376cc40afa1a8e2bb540bf0da', '201709090002', 'e10adc3949ba59abbe56e057f20f883e', '', '王二', '', '1995-01-03', null, 'qqllsky@163.com', null, '1', '密码：123456', null, '2018-01-03 23:28:11', null, '2018-01-03 23:28:11', '');
INSERT INTO `system_user` VALUES ('9a8e199858c74f10bbc14fc66b2d9f03', '5002', 'e10adc3949ba59abbe56e057f20f883e', '', '梁老师', '', '1984-01-25', null, 'qqllsky@163.com', null, '2', '密码：123456', null, '2018-01-03 23:31:10', null, '2018-01-03 23:31:10', '');
INSERT INTO `system_user` VALUES ('9aac8ba312cc4482ac22a716329ac5d3', '5003', 'e10adc3949ba59abbe56e057f20f883e', '', '江老师', '', '1985-04-11', null, 'qqllsky@163.com', null, '2', '密码：123456', null, '2018-01-03 23:34:00', null, '2018-01-03 23:34:00', '');
INSERT INTO `system_user` VALUES ('9e014f01020842cda14996506fa32538', '201709090004', 'e10adc3949ba59abbe56e057f20f883e', '', '吴三', '', '1993-01-26', null, 'qqllsky@163.com', null, '1', '密码：123456', null, '2018-01-03 23:32:21', null, '2018-01-03 23:32:21', '');
INSERT INTO `system_user` VALUES ('bc7a582b82524ecdb0fd47e4c832e8d4', '201709090005', 'e10adc3949ba59abbe56e057f20f883e', '', '刘五', '', '1993-01-18', null, 'qqllsky@163.com', null, '1', '密码：123456', null, '2018-01-03 23:33:10', null, '2018-01-03 23:33:10', '');
INSERT INTO `system_user` VALUES ('e055572b61ed4472863543a15fe88b1b', '201709090001', 'e10adc3949ba59abbe56e057f20f883e', '', '张一', '', '1995-01-12', null, '244277971@qq.com', null, '1', '密码：123456', null, '2018-01-03 23:25:57', null, '2018-01-03 23:25:57', '');

-- ----------------------------
-- Table structure for `test_user2file`
-- ----------------------------
DROP TABLE IF EXISTS `test_user2file`;
CREATE TABLE `test_user2file` (
  `id` varchar(50) NOT NULL,
  `dataId` varchar(50) NOT NULL COMMENT '主表id',
  `fileId` varchar(50) NOT NULL COMMENT '文件id',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_user2file
-- ----------------------------

-- ----------------------------
-- Table structure for `test_user_file`
-- ----------------------------
DROP TABLE IF EXISTS `test_user_file`;
CREATE TABLE `test_user_file` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `fileServerId` varchar(50) DEFAULT NULL COMMENT '文件服务器id',
  `createUser` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateUser` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteFlag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_user_file
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_stu_college_grade`;
DELIMITER ;;
CREATE TRIGGER `insert_stu_college_grade` AFTER INSERT ON `system_user` FOR EACH ROW if new.userType=1 then 
insert into stu_college_grade(id, userId, createUser, createDate, updateUser, updateDate) values (new.id, new.id, new.id, now(), new.id, now());
 end if
;;
DELIMITER ;
