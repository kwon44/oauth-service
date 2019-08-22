/*
 Navicat MySQL Data Transfer

 Source Server         : docker_mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 127.0.0.1:3306
 Source Schema         : demo_account

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 12/06/2019 14:47:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `be_account_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `account_role_account_fk`(`be_account_id`) USING BTREE,
  INDEX `account_role_role_fk`(`role_id`) USING BTREE,
  CONSTRAINT `account_role_account_fk` FOREIGN KEY (`be_account_id`) REFERENCES `be_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_role_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帳號角色映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_role
-- ----------------------------
INSERT INTO `account_role` VALUES (1, '4eac1fd189a34602bcd2083252aafac8', 'admin123', 1, 1, 'admin123', '2019-06-03 09:04:34', NULL, NULL);

-- ----------------------------
-- Table structure for be_account
-- ----------------------------
DROP TABLE IF EXISTS `be_account`;
CREATE TABLE `be_account`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工號',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帳戶名稱',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密碼',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '電子郵件',
  `be_department_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '部門代碼',
  `locked` tinyint(1) NULL DEFAULT 1 COMMENT '是否鎖定 1:是 0:否',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '邏輯刪除 1:是 0:否',
  `failed_count` tinyint(1) NOT NULL DEFAULT 0 COMMENT '登入錯誤次數',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '語系',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `employee_number_unique`(`employee_number`) USING BTREE,
  INDEX `be_account_be_department`(`be_department_id`) USING BTREE,
  CONSTRAINT `be_account_be_department` FOREIGN KEY (`be_department_id`) REFERENCES `be_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '使用者帳號' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of be_account
-- ----------------------------
INSERT INTO `be_account` VALUES (1, '19f1832077cd11e986e70050569be129', '111111', '管理员', 'admin123', '$2a$10$4Fdnzw5PDg8jlLXV/hrtdOZEedNFQ26fqgvjjIhaFPqUnQc0qNUN2', 'admin123@oauth2.com', 7, 0, 0, 1, NULL, 'sys', '2019-05-16 11:23:59', 'admin123', '2019-06-03 09:04:34');

-- ----------------------------
-- Table structure for be_department
-- ----------------------------
DROP TABLE IF EXISTS `be_department`;
CREATE TABLE `be_department`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部門名稱',
  `seq` int(11) NOT NULL COMMENT '順序',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部門資料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of be_department
-- ----------------------------
INSERT INTO `be_department` VALUES (1, 'b4a45c21028811e9a047024f55c31b9e', '客服部', 1, 'sys', '2018-12-18 13:50:18', 'admin123', '2019-01-05 16:15:09');
INSERT INTO `be_department` VALUES (7, '2deb80ed028911e9a047024f55c31b9e', '开发部', 7, 'sys', '2018-12-18 13:53:12', NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_detail
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_detail`;
CREATE TABLE `oauth_client_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'pk',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'oauth2 client id',
  `client_secret` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'oauth2 client secret',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服務端pre-established的跳轉URI',
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT 'accesstoken存活時間',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT 'refreshtoken的有效時間',
  `auto_approve` bit(1) NOT NULL COMMENT '是否自動授權',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `client_id`(`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客戶端授權資料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_detail
-- ----------------------------
INSERT INTO `oauth_client_detail` VALUES (1, 'ca9db465027b11e9a047024f55c31b9e', 'beclient', '$2a$10$z5ZZ6tVJ1MxHNAaQ.JqELu4UNXG21B0y6BXkVQln.VS0EvmsO.wQu', NULL, 36000, 54000, b'1', 'sys', '2018-12-18 12:19:32', NULL, NULL);
INSERT INTO `oauth_client_detail` VALUES (2, 'e8d4f9d88b5a11e988200242ac110002', 'messageclient', '$2a$10$z5ZZ6tVJ1MxHNAaQ.JqELu4UNXG21B0y6BXkVQln.VS0EvmsO.wQu', NULL, 36000, 54000, b'0', 'sys', '2018-12-18 12:19:32', NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_grant
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_grant`;
CREATE TABLE `oauth_client_grant`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'pk',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oauth_client_detail_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `grant_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'accesstoken的授權的類型',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `oauth_client_grant_oauth_client_detail_id_fk`(`oauth_client_detail_id`) USING BTREE,
  CONSTRAINT `oauth_client_grant_oauth_client_detail_id_fk` FOREIGN KEY (`oauth_client_detail_id`) REFERENCES `oauth_client_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客戶端可用授權方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_grant
-- ----------------------------
INSERT INTO `oauth_client_grant` VALUES (1, '52103b07028611e9a047024f55c31b9e', 1, 'refresh_token', 'sys', '2018-12-18 13:33:25', NULL, NULL);
INSERT INTO `oauth_client_grant` VALUES (2, '8ad78cac028611e9a047024f55c31b9e', 1, 'password', 'sys', '2018-12-18 13:34:44', NULL, NULL);
INSERT INTO `oauth_client_grant` VALUES (3, '183003b88b5b11e988200242ac110002', 2, 'client_credentials', 'sys', '2018-12-18 13:34:44', NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_resource
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_resource`;
CREATE TABLE `oauth_client_resource`  (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oauth_client_detail_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `resource_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `oauth_client_resource_oauth_client_detail_fk`(`oauth_client_detail_id`) USING BTREE,
  INDEX `oauth_client_resource_resource_fk`(`resource_id`) USING BTREE,
  CONSTRAINT `oauth_client_resource_oauth_client_detail_fk` FOREIGN KEY (`oauth_client_detail_id`) REFERENCES `oauth_client_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `oauth_client_resource_resource_fk` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客戶端可存取資源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_resource
-- ----------------------------
INSERT INTO `oauth_client_resource` VALUES (1, 'e7fc9ad7028611e9a047024f55c31b9e', 1, 1, 'sys', '2018-12-18 13:37:19', NULL, NULL);
INSERT INTO `oauth_client_resource` VALUES (2, 'b038e88d25d711e98d87005056a11995', 1, 2, 'sys', '2019-02-01 12:14:17', NULL, NULL);
INSERT INTO `oauth_client_resource` VALUES (3, '1b119dc48b5b11e988200242ac110002', 2, 2, 'sys', '2019-02-01 12:14:17', NULL, NULL);
INSERT INTO `oauth_client_resource` VALUES (4, 'ad986bb38b6511e988200242ac110002', 2, 1, 'sys', '2019-02-01 12:14:17', NULL, NULL);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '資源代碼',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '資源標籤',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `resource_code`(`resource_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '資源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, 'caa02fd5028611e9a047024f55c31b9e', 'beaccount', '权限设置', 'sys', '2018-12-18 13:36:39', NULL, NULL);
INSERT INTO `resource` VALUES (2, '8144921b25d711e98d87005056a11995', 'infomessage', '消息管理', 'sys', '2019-02-01 12:13:15', NULL, NULL);

-- ----------------------------
-- Table structure for resource_scope
-- ----------------------------
DROP TABLE IF EXISTS `resource_scope`;
CREATE TABLE `resource_scope`  (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `scope_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '權限代碼',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '權限標籤',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `scope_code`(`scope_code`) USING BTREE,
  INDEX `resource_scope_resource_fk`(`resource_id`) USING BTREE,
  CONSTRAINT `resource_scope_resource_fk` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '資源權限資料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_scope
-- ----------------------------
INSERT INTO `resource_scope` VALUES (101, '781c9356784911e9a5740050569be129', 1, 'berole.read', '权限表_列表', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (102, '781d8de5784911e9a5740050569be129', 1, 'bedepartment.write', '权限表_新增部门', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (103, '781e67f4784911e9a5740050569be129', 1, 'bedepartment.edit', '权限表_編輯部門', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (104, '781f59e5784911e9a5740050569be129', 1, 'bedepartment.delete', '权限表_刪除部門', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (105, '78203963784911e9a5740050569be129', 1, 'berole.write', '权限表_新增权限', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (106, '78212582784911e9a5740050569be129', 1, 'berole.edit', '权限表_編輯权限', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (107, '782208a5784911e9a5740050569be129', 1, 'berole.delete', '权限表_刪除權限', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (108, '7822fdec784911e9a5740050569be129', 1, 'berole.readinfo', '权限表_權限詳情', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (109, '782405b5784911e9a5740050569be129', 1, 'beaccount.read', '成員表_列表/搜尋', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (110, '7824dc87784911e9a5740050569be129', 1, 'beaccount.delete', '成員表_删除', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (111, '7825afa9784911e9a5740050569be129', 1, 'beaccount.edit', '成員表_编辑', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (112, '7826a4df784911e9a5740050569be129', 1, 'beaccount.write', '成員表_新增', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (201, '78277409784911e9a5740050569be129', 2, 'infomessage.2c.marquee.read', '讯息表-用户_列表/搜寻', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (202, '78285736784911e9a5740050569be129', 2, 'infomessage.2c.marquee.create', '讯息表-用户_新增', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (203, '78292fb5784911e9a5740050569be129', 2, 'infomessage.2c.marquee.update', '讯息表-用户_编辑', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (204, '782a02f4784911e9a5740050569be129', 2, 'infomessage.2a.marquee.read', '讯息表-代理_列表/搜寻', 'sys', '2019-05-17 02:14:15', NULL, NULL);
INSERT INTO `resource_scope` VALUES (205, '782adfa1784911e9a5740050569be129', 2, 'infomessage.2a.marquee.create', '讯息表-代理_新增', 'sys', '2019-05-17 02:14:15', NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位標籤',
  `be_department_id` bigint(20) NULL DEFAULT NULL COMMENT ' 部門',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '備註',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_code`(`role_code`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `label`(`label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色資料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'd30a80df77ba11e986e70050569be129', 'ROLE_ADMIN', '管理员', 7, NULL, 'sys', '2019-05-16 09:13:09', NULL, NULL);

-- ----------------------------
-- Table structure for role_scope
-- ----------------------------
DROP TABLE IF EXISTS `role_scope`;
CREATE TABLE `role_scope`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `resource_scope_id` bigint(20) UNSIGNED NOT NULL COMMENT 'fk',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `role_scope_role_fk`(`role_id`) USING BTREE,
  INDEX `role_scope_resource_scope_fk`(`resource_scope_id`) USING BTREE,
  CONSTRAINT `role_scope_resource_scope_fk` FOREIGN KEY (`resource_scope_id`) REFERENCES `resource_scope` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_scope_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3403 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色權限對應表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_scope
-- ----------------------------
INSERT INTO `role_scope` VALUES (122, 'ca383b2d784911e9a5740050569be129', 1, 201, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (123, 'ca397044784911e9a5740050569be129', 1, 202, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (124, 'ca3a66c5784911e9a5740050569be129', 1, 203, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (125, 'ca3b42e2784911e9a5740050569be129', 1, 204, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (126, 'ca3c3d34784911e9a5740050569be129', 1, 205, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (224, 'caa4d800784911e9a5740050569be129', 1, 101, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (225, 'caa5d4da784911e9a5740050569be129', 1, 102, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (226, 'caa6a08f784911e9a5740050569be129', 1, 103, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (227, 'caa77085784911e9a5740050569be129', 1, 104, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (228, 'caa865b2784911e9a5740050569be129', 1, 105, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (229, 'caa962bc784911e9a5740050569be129', 1, 106, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (230, 'caaa2ae1784911e9a5740050569be129', 1, 107, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (231, 'caab0646784911e9a5740050569be129', 1, 108, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (232, 'caabcfd1784911e9a5740050569be129', 1, 109, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (233, 'caaca287784911e9a5740050569be129', 1, 110, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (234, 'caadb296784911e9a5740050569be129', 1, 111, 'sys', '2019-05-17 02:16:33', NULL, NULL);
INSERT INTO `role_scope` VALUES (235, 'caaeb21f784911e9a5740050569be129', 1, 112, 'sys', '2019-05-17 02:16:33', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
