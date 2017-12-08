/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50711
Source Host           : 127.0.0.1:3306
Source Database       : shiro_demo

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-12-09 00:43:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for u_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_permission
-- ----------------------------
INSERT INTO `u_permission` VALUES ('4', '/permission/index.shtml', '权限列表');
INSERT INTO `u_permission` VALUES ('6', '/permission/addPermission.shtml', '权限添加');
INSERT INTO `u_permission` VALUES ('7', '/permission/deletePermissionById.shtml', '权限删除');
INSERT INTO `u_permission` VALUES ('8', '/member/list.shtml', '用户列表');
INSERT INTO `u_permission` VALUES ('9', '/member/online.shtml', '在线用户');
INSERT INTO `u_permission` VALUES ('10', '/member/changeSessionStatus.shtml', '用户Session踢出');
INSERT INTO `u_permission` VALUES ('11', '/member/forbidUserById.shtml', '用户激活&禁止');
INSERT INTO `u_permission` VALUES ('12', '/member/deleteUserById.shtml', '用户删除');
INSERT INTO `u_permission` VALUES ('13', '/permission/addPermission2Role.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('14', '/role/clearRoleByUserIds.shtml', '用户角色分配清空');
INSERT INTO `u_permission` VALUES ('15', '/role/addRole2User.shtml', '角色分配保存');
INSERT INTO `u_permission` VALUES ('16', '/role/deleteRoleById.shtml', '角色列表删除');
INSERT INTO `u_permission` VALUES ('17', '/role/addRole.shtml', '角色列表添加');
INSERT INTO `u_permission` VALUES ('18', '/role/index.shtml', '角色列表');
INSERT INTO `u_permission` VALUES ('19', '/permission/allocation.shtml', '权限分配列表');
INSERT INTO `u_permission` VALUES ('20', '/role/allocation.shtml', '角色分配');

-- ----------------------------
-- Table structure for u_role
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '系统管理员', '888888');
INSERT INTO `u_role` VALUES ('3', '权限角色', '100003');
INSERT INTO `u_role` VALUES ('4', '用户中心', '100002');

-- ----------------------------
-- Table structure for u_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_permission
-- ----------------------------
INSERT INTO `u_role_permission` VALUES ('1', '4');
INSERT INTO `u_role_permission` VALUES ('1', '6');
INSERT INTO `u_role_permission` VALUES ('1', '7');
INSERT INTO `u_role_permission` VALUES ('1', '8');
INSERT INTO `u_role_permission` VALUES ('1', '9');
INSERT INTO `u_role_permission` VALUES ('1', '10');
INSERT INTO `u_role_permission` VALUES ('1', '11');
INSERT INTO `u_role_permission` VALUES ('1', '12');
INSERT INTO `u_role_permission` VALUES ('1', '13');
INSERT INTO `u_role_permission` VALUES ('1', '14');
INSERT INTO `u_role_permission` VALUES ('1', '15');
INSERT INTO `u_role_permission` VALUES ('1', '16');
INSERT INTO `u_role_permission` VALUES ('1', '17');
INSERT INTO `u_role_permission` VALUES ('1', '18');
INSERT INTO `u_role_permission` VALUES ('1', '19');
INSERT INTO `u_role_permission` VALUES ('1', '20');
INSERT INTO `u_role_permission` VALUES ('3', '6');
INSERT INTO `u_role_permission` VALUES ('3', '7');

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `identityNumber` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', '我是大帅哥2', 'admin', '57eb72e6b78a87a12d46a7f5e9315138', '1', '123', '123', '123', '350322199312031531', '布鲁斯·维恩', '11', '13774545206', '2017-12-08 16:07:53', '2016-06-16 11:15:33', '2017-12-08 16:07:53');
INSERT INTO `u_user` VALUES ('11', 'soso', '8446666@qq.com', 'd57ffbe486910dd5b26d0167d034f9ad', '0', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-26 20:50:54', '2016-06-16 11:24:35');
INSERT INTO `u_user` VALUES ('12', '8446666', '8446666', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('13', '121212', '212', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('14', '212', '123123', '4afdc875a67a55528c224ce088be2ab8', '0', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('15', '21212', '12321', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('16', 'soso', '8446666@qq.com', 'd57ffbe486910dd5b26d0167d034f9ad', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-26 20:50:54', '2016-06-16 11:24:35');
INSERT INTO `u_user` VALUES ('17', '212', '3123', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('18', '21', '1231', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('19', '81236', '1231231', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('20', 'ewfw', '212', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('21', '123', '12321', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('22', 'soso', '8446666@qq.com', 'd57ffbe486910dd5b26d0167d034f9ad', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-26 20:50:54', '2016-06-16 11:24:35');
INSERT INTO `u_user` VALUES ('23', 'fwef23', '3123', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('24', 'fwef', '1231', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('25', 'gweg', '1231231', '4afdc875a67a55528c224ce088be2ab8', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2016-05-27 22:34:19', '2016-06-15 17:03:16');
INSERT INTO `u_user` VALUES ('26', 'admin123', 'admin@admin.com', '904739ac025247bfe15c990e6ec190d1', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2017-12-06 09:01:30', '2017-12-06 09:01:30');
INSERT INTO `u_user` VALUES ('27', 'test', 'test@test.com', '9bc1c9830b6f3c37e9ebdb819887fd70', '1', null, null, null, null, null, null, null, '0000-00-00 00:00:00', '2017-12-06 21:48:28', '2017-12-06 21:48:49');
INSERT INTO `u_user` VALUES ('28', 'admin11', 'admin11', '2884fd0a6880f2dc01cf36dfec438b0f', '1', null, null, null, null, null, null, null, '2017-12-07 19:08:42', '2017-12-07 19:08:42', '2017-12-07 19:08:42');

-- ----------------------------
-- Table structure for u_user_role
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO `u_user_role` VALUES ('12', '4');
INSERT INTO `u_user_role` VALUES ('11', '3');
INSERT INTO `u_user_role` VALUES ('11', '4');
INSERT INTO `u_user_role` VALUES ('1', '1');
