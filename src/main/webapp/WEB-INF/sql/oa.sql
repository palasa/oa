/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 13/10/2018 15:59:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for affair_module
-- ----------------------------
DROP TABLE IF EXISTS `affair_module`;
CREATE TABLE `affair_module`  (
  `affair_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `affair_module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affair_module_producer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`affair_module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of affair_module
-- ----------------------------
INSERT INTO `affair_module` VALUES (6, '出差申请单', 2);
INSERT INTO `affair_module` VALUES (7, '报销申请单', 1);

-- ----------------------------
-- Table structure for affair_module_chain
-- ----------------------------
DROP TABLE IF EXISTS `affair_module_chain`;
CREATE TABLE `affair_module_chain`  (
  `affair_module_chain_id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `approver_id` int(11) DEFAULT NULL,
  `affair_module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`affair_module_chain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of affair_module_chain
-- ----------------------------
INSERT INTO `affair_module_chain` VALUES (5, 1, -1, 6);
INSERT INTO `affair_module_chain` VALUES (6, 2, 3, 6);
INSERT INTO `affair_module_chain` VALUES (7, 3, 2, 6);
INSERT INTO `affair_module_chain` VALUES (8, 4, 11, 6);
INSERT INTO `affair_module_chain` VALUES (9, 1, -1, 7);
INSERT INTO `affair_module_chain` VALUES (10, 2, 3, 7);
INSERT INTO `affair_module_chain` VALUES (11, 3, 2, 7);
INSERT INTO `affair_module_chain` VALUES (12, 4, 11, 7);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE,
  INDEX `fk_10`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '总经理办公室', NULL, 11);
INSERT INTO `department` VALUES (2, '业务集群I-王琰', 1, 8);
INSERT INTO `department` VALUES (3, '业务集群II-余笑', 1, 7);
INSERT INTO `department` VALUES (4, '财务部', 1, 2);
INSERT INTO `department` VALUES (5, '人力资源部', 1, 3);
INSERT INTO `department` VALUES (6, '行政管理部', 1, 3);
INSERT INTO `department` VALUES (7, '市场部', 2, 4);
INSERT INTO `department` VALUES (8, '销售部', 3, 5);
INSERT INTO `department` VALUES (9, '就业部', 2, 6);
INSERT INTO `department` VALUES (10, '教学部', 3, 19);
INSERT INTO `department` VALUES (11, '教务部', 10, 19);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '人力资源', '', NULL);
INSERT INTO `menu` VALUES (2, '公文模块', '', NULL);
INSERT INTO `menu` VALUES (3, '邮箱模块', '', NULL);
INSERT INTO `menu` VALUES (4, '个人办公', '', NULL);
INSERT INTO `menu` VALUES (5, '系统设置', '', NULL);
INSERT INTO `menu` VALUES (6, '考勤管理', 'roster/show', 1);
INSERT INTO `menu` VALUES (7, '公告管理', 'annoucement/show', 1);
INSERT INTO `menu` VALUES (8, '员工管理', 'user/show', 1);
INSERT INTO `menu` VALUES (9, '部门管理', '', 1);
INSERT INTO `menu` VALUES (10, '角色管理', '', 1);
INSERT INTO `menu` VALUES (11, '权限管理', 'permission/show', 1);
INSERT INTO `menu` VALUES (12, '公文设计', 'affair_module/show', 2);
INSERT INTO `menu` VALUES (13, '公文管理', 'affair/show', 2);
INSERT INTO `menu` VALUES (14, '邮箱管理', '', 3);
INSERT INTO `menu` VALUES (15, '工作日志', '', 4);
INSERT INTO `menu` VALUES (16, '行程安排', '', 4);
INSERT INTO `menu` VALUES (17, '菜单管理', '', 5);
INSERT INTO `menu` VALUES (18, '个人设置', '', 5);

-- ----------------------------
-- Table structure for module_option
-- ----------------------------
DROP TABLE IF EXISTS `module_option`;
CREATE TABLE `module_option`  (
  `module_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `affair_module_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `option_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `option_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`module_option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module_option
-- ----------------------------
INSERT INTO `module_option` VALUES (14, 6, 3, 1, '出差事由', '开会,业务交流,参观学习');
INSERT INTO `module_option` VALUES (15, 6, 2, 2, '出差具体事由', '');
INSERT INTO `module_option` VALUES (16, 6, 1, 3, '出差地点', '');
INSERT INTO `module_option` VALUES (17, 6, 8, 4, '出差开始时间', '');
INSERT INTO `module_option` VALUES (18, 6, 8, 5, '出差结束时间', '');
INSERT INTO `module_option` VALUES (19, 7, 3, 1, '报销事由', '住宿费用,交通费用,其他费用');
INSERT INTO `module_option` VALUES (20, 7, 1, 2, '单据名称', '');

-- ----------------------------
-- Table structure for operate
-- ----------------------------
DROP TABLE IF EXISTS `operate`;
CREATE TABLE `operate`  (
  `operate_id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`operate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operate
-- ----------------------------
INSERT INTO `operate` VALUES (1, '博为峰OA办公自动化系统', 'OA', '', NULL);
INSERT INTO `operate` VALUES (6, '考勤管理', 'roster/show', '', 1);
INSERT INTO `operate` VALUES (7, '公告管理', 'News', '', 1);
INSERT INTO `operate` VALUES (8, '员工管理', 'user/show', '', 1);
INSERT INTO `operate` VALUES (9, '部门管理', 'Department', '', 1);
INSERT INTO `operate` VALUES (10, '角色管理', 'Role', '', 1);
INSERT INTO `operate` VALUES (11, '权限管理', 'permission/show', '', 1);
INSERT INTO `operate` VALUES (12, '公文设计', 'affair_module/show', '', 1);
INSERT INTO `operate` VALUES (13, '公文管理', 'affair/show', '', 1);
INSERT INTO `operate` VALUES (14, '邮箱管理', 'Email', '', 1);
INSERT INTO `operate` VALUES (15, '工作日志', 'Daily', '', 1);
INSERT INTO `operate` VALUES (16, '行程安排', 'Schedule', '', 1);
INSERT INTO `operate` VALUES (17, '菜单管理', 'Menu', '', 1);
INSERT INTO `operate` VALUES (18, '个人设置', 'Setting', '', 1);
INSERT INTO `operate` VALUES (19, '添加公告', 'NewsAdd', '', 1);
INSERT INTO `operate` VALUES (20, '修改公告', 'NewsUpdate', '', 1);
INSERT INTO `operate` VALUES (21, '删除公告', 'NewsDelete', '', 1);
INSERT INTO `operate` VALUES (22, '添加考勤', 'RosterAdd', '', 1);
INSERT INTO `operate` VALUES (23, '修改考勤', 'RosterUpdate', '', 1);
INSERT INTO `operate` VALUES (24, '删除考勤', 'RosterDelete', '', 1);
INSERT INTO `operate` VALUES (25, '新增员工', 'user/add', '', 1);
INSERT INTO `operate` VALUES (26, '修改员工', 'user/edit', '', 1);
INSERT INTO `operate` VALUES (27, '删除员工', 'user/delete', '', 1);
INSERT INTO `operate` VALUES (28, '新增部门', 'DepartmentAdd', '', 1);
INSERT INTO `operate` VALUES (29, '修改部门', 'DepartmentUpdate', '', 1);
INSERT INTO `operate` VALUES (30, '删除部门', 'DepartmentDelete', '', 1);
INSERT INTO `operate` VALUES (31, '新增角色', 'RoleAdd', '', 1);
INSERT INTO `operate` VALUES (32, '修改角色', 'RoleUpdate', '', 1);
INSERT INTO `operate` VALUES (33, '删除角色', 'RoleDelete', '', 1);
INSERT INTO `operate` VALUES (34, '新增公文模板', 'affair_module/add', '', 1);
INSERT INTO `operate` VALUES (35, '修改公文模板', 'affair_module/edit', '', 1);
INSERT INTO `operate` VALUES (36, '删除公文模板', 'affair_module/delete', '', 1);
INSERT INTO `operate` VALUES (37, '添加公告保存', 'NewsSave', '', 1);
INSERT INTO `operate` VALUES (38, '修改公告保存', 'NewsAlter', '', 1);
INSERT INTO `operate` VALUES (39, '添加考勤保存', 'RosterSave', '', 1);
INSERT INTO `operate` VALUES (40, '修改考勤保存', 'RosterAlter', '', 1);
INSERT INTO `operate` VALUES (41, '新增员工保存', 'user/doAdd', '', 1);
INSERT INTO `operate` VALUES (42, '修改员工保存', 'user/doEdit', '', 1);
INSERT INTO `operate` VALUES (43, '新增部门保存', 'DepartmentSave', '', 1);
INSERT INTO `operate` VALUES (44, '修改部门保存', 'DepartmentAlter', '', 1);
INSERT INTO `operate` VALUES (45, '新增角色保存', 'RoleSave', '', 1);
INSERT INTO `operate` VALUES (46, '修改角色保存', 'RoleAlter', '', 1);
INSERT INTO `operate` VALUES (47, '新增公文模板保存', 'affair_module/doAdd', '', 1);
INSERT INTO `operate` VALUES (48, '修改公文模板保存', 'AffairModuleAlter', '', 1);
INSERT INTO `operate` VALUES (49, '权限管理保存', 'permission/save', ' ', 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '人力资源', '', NULL);
INSERT INTO `permission` VALUES (2, '公文模块', NULL, NULL);
INSERT INTO `permission` VALUES (3, '邮箱模块', NULL, NULL);
INSERT INTO `permission` VALUES (4, '个人办公', NULL, NULL);
INSERT INTO `permission` VALUES (5, '系统设置', NULL, NULL);
INSERT INTO `permission` VALUES (6, '考勤管理', NULL, 1);
INSERT INTO `permission` VALUES (7, '公告管理', NULL, 1);
INSERT INTO `permission` VALUES (8, '员工管理', NULL, 1);
INSERT INTO `permission` VALUES (9, '部门管理', NULL, 1);
INSERT INTO `permission` VALUES (10, '角色管理', NULL, 1);
INSERT INTO `permission` VALUES (11, '权限管理', NULL, 1);
INSERT INTO `permission` VALUES (12, '公文设计', NULL, 2);
INSERT INTO `permission` VALUES (13, '公文管理', NULL, 2);
INSERT INTO `permission` VALUES (14, '邮箱管理', NULL, 3);
INSERT INTO `permission` VALUES (15, '工作日志', NULL, 4);
INSERT INTO `permission` VALUES (16, '行程安排', NULL, 4);
INSERT INTO `permission` VALUES (17, '菜单管理', NULL, 5);
INSERT INTO `permission` VALUES (18, '个人设置', NULL, 5);
INSERT INTO `permission` VALUES (19, '添加公告', NULL, 7);
INSERT INTO `permission` VALUES (20, '修改公告', NULL, 7);
INSERT INTO `permission` VALUES (21, '删除公告', NULL, 7);
INSERT INTO `permission` VALUES (22, '添加考勤', NULL, 6);
INSERT INTO `permission` VALUES (23, '修改考勤', NULL, 6);
INSERT INTO `permission` VALUES (24, '删除考勤', NULL, 6);
INSERT INTO `permission` VALUES (25, '新增员工', NULL, 8);
INSERT INTO `permission` VALUES (26, '修改员工', NULL, 8);
INSERT INTO `permission` VALUES (27, '删除员工', NULL, 8);
INSERT INTO `permission` VALUES (28, '新增部门', NULL, 9);
INSERT INTO `permission` VALUES (29, '修改部门', NULL, 9);
INSERT INTO `permission` VALUES (30, '删除部门', NULL, 9);
INSERT INTO `permission` VALUES (31, '新增角色', NULL, 10);
INSERT INTO `permission` VALUES (32, '修改角色', NULL, 10);
INSERT INTO `permission` VALUES (33, '删除角色', NULL, 10);
INSERT INTO `permission` VALUES (34, '新增公文模板', NULL, 12);
INSERT INTO `permission` VALUES (35, '修改公文模板', NULL, 12);
INSERT INTO `permission` VALUES (36, '删除公文模板', NULL, 12);

-- ----------------------------
-- Table structure for permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu`;
CREATE TABLE `permission_menu`  (
  `permission_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  INDEX `pk_1`(`permission_id`) USING BTREE,
  INDEX `pk_2`(`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_menu
-- ----------------------------
INSERT INTO `permission_menu` VALUES (1, 1);
INSERT INTO `permission_menu` VALUES (2, 2);
INSERT INTO `permission_menu` VALUES (3, 3);
INSERT INTO `permission_menu` VALUES (4, 4);
INSERT INTO `permission_menu` VALUES (5, 5);
INSERT INTO `permission_menu` VALUES (6, 6);
INSERT INTO `permission_menu` VALUES (7, 7);
INSERT INTO `permission_menu` VALUES (8, 8);
INSERT INTO `permission_menu` VALUES (9, 9);
INSERT INTO `permission_menu` VALUES (10, 10);
INSERT INTO `permission_menu` VALUES (11, 11);
INSERT INTO `permission_menu` VALUES (12, 12);
INSERT INTO `permission_menu` VALUES (13, 13);
INSERT INTO `permission_menu` VALUES (14, 14);
INSERT INTO `permission_menu` VALUES (15, 15);
INSERT INTO `permission_menu` VALUES (16, 16);
INSERT INTO `permission_menu` VALUES (17, 17);
INSERT INTO `permission_menu` VALUES (18, 18);

-- ----------------------------
-- Table structure for permission_operate
-- ----------------------------
DROP TABLE IF EXISTS `permission_operate`;
CREATE TABLE `permission_operate`  (
  `permission_id` int(11) NOT NULL,
  `operate_id` int(11) NOT NULL,
  INDEX `pk_7`(`permission_id`) USING BTREE,
  INDEX `pk_8`(`operate_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_operate
-- ----------------------------
INSERT INTO `permission_operate` VALUES (6, 6);
INSERT INTO `permission_operate` VALUES (7, 7);
INSERT INTO `permission_operate` VALUES (8, 8);
INSERT INTO `permission_operate` VALUES (9, 9);
INSERT INTO `permission_operate` VALUES (10, 10);
INSERT INTO `permission_operate` VALUES (11, 11);
INSERT INTO `permission_operate` VALUES (12, 12);
INSERT INTO `permission_operate` VALUES (13, 13);
INSERT INTO `permission_operate` VALUES (14, 14);
INSERT INTO `permission_operate` VALUES (15, 15);
INSERT INTO `permission_operate` VALUES (16, 16);
INSERT INTO `permission_operate` VALUES (17, 17);
INSERT INTO `permission_operate` VALUES (18, 18);
INSERT INTO `permission_operate` VALUES (19, 19);
INSERT INTO `permission_operate` VALUES (20, 20);
INSERT INTO `permission_operate` VALUES (21, 21);
INSERT INTO `permission_operate` VALUES (22, 22);
INSERT INTO `permission_operate` VALUES (23, 23);
INSERT INTO `permission_operate` VALUES (24, 24);
INSERT INTO `permission_operate` VALUES (25, 25);
INSERT INTO `permission_operate` VALUES (26, 26);
INSERT INTO `permission_operate` VALUES (27, 27);
INSERT INTO `permission_operate` VALUES (28, 28);
INSERT INTO `permission_operate` VALUES (29, 29);
INSERT INTO `permission_operate` VALUES (30, 30);
INSERT INTO `permission_operate` VALUES (31, 31);
INSERT INTO `permission_operate` VALUES (32, 32);
INSERT INTO `permission_operate` VALUES (33, 33);
INSERT INTO `permission_operate` VALUES (34, 34);
INSERT INTO `permission_operate` VALUES (35, 35);
INSERT INTO `permission_operate` VALUES (36, 36);
INSERT INTO `permission_operate` VALUES (19, 37);
INSERT INTO `permission_operate` VALUES (20, 38);
INSERT INTO `permission_operate` VALUES (22, 39);
INSERT INTO `permission_operate` VALUES (23, 40);
INSERT INTO `permission_operate` VALUES (25, 41);
INSERT INTO `permission_operate` VALUES (26, 42);
INSERT INTO `permission_operate` VALUES (28, 43);
INSERT INTO `permission_operate` VALUES (29, 44);
INSERT INTO `permission_operate` VALUES (31, 45);
INSERT INTO `permission_operate` VALUES (32, 46);
INSERT INTO `permission_operate` VALUES (34, 47);
INSERT INTO `permission_operate` VALUES (35, 48);
INSERT INTO `permission_operate` VALUES (11, 49);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `fk_11`(`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, '超级管理员', NULL);
INSERT INTO `role` VALUES (3, '总经理', 1);
INSERT INTO `role` VALUES (4, '副总经理', 1);
INSERT INTO `role` VALUES (5, '财务经理', 4);
INSERT INTO `role` VALUES (6, '出纳', 4);
INSERT INTO `role` VALUES (7, '会计', 4);
INSERT INTO `role` VALUES (8, '人力资源经理', 5);
INSERT INTO `role` VALUES (9, '招聘主管', 5);
INSERT INTO `role` VALUES (10, '薪酬主管', 5);
INSERT INTO `role` VALUES (11, '招聘专员', 5);
INSERT INTO `role` VALUES (12, '薪酬专员', 5);
INSERT INTO `role` VALUES (13, '行政经理', 6);
INSERT INTO `role` VALUES (14, '行政专员', 6);
INSERT INTO `role` VALUES (15, '前台', 6);
INSERT INTO `role` VALUES (16, '法务', 6);
INSERT INTO `role` VALUES (17, '市场经理', 7);
INSERT INTO `role` VALUES (18, '网络推广', 7);
INSERT INTO `role` VALUES (19, '广告宣传', 7);
INSERT INTO `role` VALUES (20, '销售经理', 8);
INSERT INTO `role` VALUES (21, '电话销售', 8);
INSERT INTO `role` VALUES (22, '产品顾问', 8);
INSERT INTO `role` VALUES (23, '就业经理', 9);
INSERT INTO `role` VALUES (24, '就业主管', 9);
INSERT INTO `role` VALUES (25, '就业顾问', 9);
INSERT INTO `role` VALUES (26, '教学经理', 10);
INSERT INTO `role` VALUES (27, '讲师', 10);
INSERT INTO `role` VALUES (28, '班主任', 11);
INSERT INTO `role` VALUES (29, '分管业务副总I-王琰', 2);
INSERT INTO `role` VALUES (30, '分管业务副总II-余笑', 3);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  INDEX `pk_5`(`role_id`) USING BTREE,
  INDEX `pk_6`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (2, 3);
INSERT INTO `role_permission` VALUES (2, 4);
INSERT INTO `role_permission` VALUES (2, 5);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (2, 7);
INSERT INTO `role_permission` VALUES (2, 8);
INSERT INTO `role_permission` VALUES (2, 9);
INSERT INTO `role_permission` VALUES (2, 10);
INSERT INTO `role_permission` VALUES (2, 11);
INSERT INTO `role_permission` VALUES (2, 12);
INSERT INTO `role_permission` VALUES (2, 13);
INSERT INTO `role_permission` VALUES (2, 14);
INSERT INTO `role_permission` VALUES (2, 15);
INSERT INTO `role_permission` VALUES (2, 16);
INSERT INTO `role_permission` VALUES (2, 17);
INSERT INTO `role_permission` VALUES (2, 18);
INSERT INTO `role_permission` VALUES (2, 19);
INSERT INTO `role_permission` VALUES (2, 20);
INSERT INTO `role_permission` VALUES (2, 21);
INSERT INTO `role_permission` VALUES (2, 22);
INSERT INTO `role_permission` VALUES (2, 23);
INSERT INTO `role_permission` VALUES (2, 24);
INSERT INTO `role_permission` VALUES (2, 25);
INSERT INTO `role_permission` VALUES (2, 26);
INSERT INTO `role_permission` VALUES (2, 27);
INSERT INTO `role_permission` VALUES (2, 28);
INSERT INTO `role_permission` VALUES (2, 29);
INSERT INTO `role_permission` VALUES (2, 30);
INSERT INTO `role_permission` VALUES (2, 31);
INSERT INTO `role_permission` VALUES (2, 32);
INSERT INTO `role_permission` VALUES (2, 33);
INSERT INTO `role_permission` VALUES (2, 34);
INSERT INTO `role_permission` VALUES (2, 35);
INSERT INTO `role_permission` VALUES (2, 36);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (3, 3);
INSERT INTO `role_permission` VALUES (3, 4);
INSERT INTO `role_permission` VALUES (3, 5);
INSERT INTO `role_permission` VALUES (3, 6);
INSERT INTO `role_permission` VALUES (3, 7);
INSERT INTO `role_permission` VALUES (3, 8);
INSERT INTO `role_permission` VALUES (3, 9);
INSERT INTO `role_permission` VALUES (3, 10);
INSERT INTO `role_permission` VALUES (3, 11);
INSERT INTO `role_permission` VALUES (3, 12);
INSERT INTO `role_permission` VALUES (3, 13);
INSERT INTO `role_permission` VALUES (3, 14);
INSERT INTO `role_permission` VALUES (3, 15);
INSERT INTO `role_permission` VALUES (3, 16);
INSERT INTO `role_permission` VALUES (3, 17);
INSERT INTO `role_permission` VALUES (3, 18);
INSERT INTO `role_permission` VALUES (3, 19);
INSERT INTO `role_permission` VALUES (3, 20);
INSERT INTO `role_permission` VALUES (3, 21);
INSERT INTO `role_permission` VALUES (3, 22);
INSERT INTO `role_permission` VALUES (3, 23);
INSERT INTO `role_permission` VALUES (3, 24);
INSERT INTO `role_permission` VALUES (3, 25);
INSERT INTO `role_permission` VALUES (3, 26);
INSERT INTO `role_permission` VALUES (3, 27);
INSERT INTO `role_permission` VALUES (3, 28);
INSERT INTO `role_permission` VALUES (3, 29);
INSERT INTO `role_permission` VALUES (3, 30);
INSERT INTO `role_permission` VALUES (3, 31);
INSERT INTO `role_permission` VALUES (3, 32);
INSERT INTO `role_permission` VALUES (3, 33);
INSERT INTO `role_permission` VALUES (3, 34);
INSERT INTO `role_permission` VALUES (3, 35);
INSERT INTO `role_permission` VALUES (3, 36);
INSERT INTO `role_permission` VALUES (26, 2);
INSERT INTO `role_permission` VALUES (26, 3);
INSERT INTO `role_permission` VALUES (26, 4);
INSERT INTO `role_permission` VALUES (26, 5);
INSERT INTO `role_permission` VALUES (26, 13);
INSERT INTO `role_permission` VALUES (26, 14);
INSERT INTO `role_permission` VALUES (26, 15);
INSERT INTO `role_permission` VALUES (26, 16);
INSERT INTO `role_permission` VALUES (26, 18);
INSERT INTO `role_permission` VALUES (27, 2);
INSERT INTO `role_permission` VALUES (27, 3);
INSERT INTO `role_permission` VALUES (27, 4);
INSERT INTO `role_permission` VALUES (27, 5);
INSERT INTO `role_permission` VALUES (27, 13);
INSERT INTO `role_permission` VALUES (27, 14);
INSERT INTO `role_permission` VALUES (27, 15);
INSERT INTO `role_permission` VALUES (27, 16);
INSERT INTO `role_permission` VALUES (27, 18);
INSERT INTO `role_permission` VALUES (28, 2);
INSERT INTO `role_permission` VALUES (28, 3);
INSERT INTO `role_permission` VALUES (28, 4);
INSERT INTO `role_permission` VALUES (28, 5);
INSERT INTO `role_permission` VALUES (28, 13);
INSERT INTO `role_permission` VALUES (28, 14);
INSERT INTO `role_permission` VALUES (28, 15);
INSERT INTO `role_permission` VALUES (28, 16);
INSERT INTO `role_permission` VALUES (28, 18);
INSERT INTO `role_permission` VALUES (8, 1);
INSERT INTO `role_permission` VALUES (8, 2);
INSERT INTO `role_permission` VALUES (8, 3);
INSERT INTO `role_permission` VALUES (8, 4);
INSERT INTO `role_permission` VALUES (8, 5);
INSERT INTO `role_permission` VALUES (8, 6);
INSERT INTO `role_permission` VALUES (8, 7);
INSERT INTO `role_permission` VALUES (8, 8);
INSERT INTO `role_permission` VALUES (8, 9);
INSERT INTO `role_permission` VALUES (8, 10);
INSERT INTO `role_permission` VALUES (8, 11);
INSERT INTO `role_permission` VALUES (8, 12);
INSERT INTO `role_permission` VALUES (8, 13);
INSERT INTO `role_permission` VALUES (8, 14);
INSERT INTO `role_permission` VALUES (8, 15);
INSERT INTO `role_permission` VALUES (8, 16);
INSERT INTO `role_permission` VALUES (8, 17);
INSERT INTO `role_permission` VALUES (8, 18);
INSERT INTO `role_permission` VALUES (8, 19);
INSERT INTO `role_permission` VALUES (8, 20);
INSERT INTO `role_permission` VALUES (8, 21);
INSERT INTO `role_permission` VALUES (8, 22);
INSERT INTO `role_permission` VALUES (8, 23);
INSERT INTO `role_permission` VALUES (8, 24);
INSERT INTO `role_permission` VALUES (8, 25);
INSERT INTO `role_permission` VALUES (8, 26);
INSERT INTO `role_permission` VALUES (8, 27);
INSERT INTO `role_permission` VALUES (8, 28);
INSERT INTO `role_permission` VALUES (8, 29);
INSERT INTO `role_permission` VALUES (8, 30);
INSERT INTO `role_permission` VALUES (8, 31);
INSERT INTO `role_permission` VALUES (8, 32);
INSERT INTO `role_permission` VALUES (8, 33);
INSERT INTO `role_permission` VALUES (8, 34);
INSERT INTO `role_permission` VALUES (8, 35);
INSERT INTO `role_permission` VALUES (8, 36);
INSERT INTO `role_permission` VALUES (13, 2);
INSERT INTO `role_permission` VALUES (13, 3);
INSERT INTO `role_permission` VALUES (13, 4);
INSERT INTO `role_permission` VALUES (13, 5);
INSERT INTO `role_permission` VALUES (13, 13);
INSERT INTO `role_permission` VALUES (13, 14);
INSERT INTO `role_permission` VALUES (13, 15);
INSERT INTO `role_permission` VALUES (13, 16);
INSERT INTO `role_permission` VALUES (13, 18);
INSERT INTO `role_permission` VALUES (6, 2);
INSERT INTO `role_permission` VALUES (6, 12);
INSERT INTO `role_permission` VALUES (6, 13);
INSERT INTO `role_permission` VALUES (6, 3);
INSERT INTO `role_permission` VALUES (6, 14);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `avater` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `FK__leader_id__user_id`(`leader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '202CB962AC59075B964B07152D234B70', 'admin', NULL, '1.jpg');
INSERT INTO `user` VALUES (2, 'maxuemei', '202CB962AC59075B964B07152D234B70', '马雪梅', 11, '2.jpg');
INSERT INTO `user` VALUES (3, 'nixiaoyu', '202CB962AC59075B964B07152D234B70', '倪笑宇', 11, '3.jpg');
INSERT INTO `user` VALUES (4, 'zhangming', '202CB962AC59075B964B07152D234B70', '张明', 11, '4.jpg');
INSERT INTO `user` VALUES (5, 'huofang', '202CB962AC59075B964B07152D234B70', '霍芳', 7, '5.jpg');
INSERT INTO `user` VALUES (6, 'sunlirui', '202CB962AC59075B964B07152D234B70', '孙丽睿', 8, '6.jpg');
INSERT INTO `user` VALUES (7, 'yuxiao', '202CB962AC59075B964B07152D234B70', '余笑', 11, '7.jpg');
INSERT INTO `user` VALUES (8, 'wangyan', '202CB962AC59075B964B07152D234B70', '王琰', 11, '8.jpg');
INSERT INTO `user` VALUES (9, 'zhoufeng', '202CB962AC59075B964B07152D234B70', '周峰', 11, '9.jpg');
INSERT INTO `user` VALUES (10, 'wangwei', '202CB962AC59075B964B07152D234B70', '王威', 11, '10.jpg');
INSERT INTO `user` VALUES (11, 'libo', '202CB962AC59075B964B07152D234B70', '李波', NULL, '11.jpg');
INSERT INTO `user` VALUES (12, 'zhuminghua', '202CB962AC59075B964B07152D234B70', '朱明华', 2, '12.jpg');
INSERT INTO `user` VALUES (13, 'kangshanshan', '202CB962AC59075B964B07152D234B70', '康珊珊', 3, '13.jpg');
INSERT INTO `user` VALUES (14, 'xujiayao', '202CB962AC59075B964B07152D234B70', '徐佳瑶', 13, '14.jpg');
INSERT INTO `user` VALUES (15, 'lipingran', '202CB962AC59075B964B07152D234B70', '李品然', 5, '15.jpg');
INSERT INTO `user` VALUES (16, 'wanglixia', '202CB962AC59075B964B07152D234B70', '王丽霞', 5, '16.jpg');
INSERT INTO `user` VALUES (17, 'donghuanhuan', '202CB962AC59075B964B07152D234B70', '董欢欢', 6, '17.jpg');
INSERT INTO `user` VALUES (18, 'zhuqiong', '202CB962AC59075B964B07152D234B70', '朱琼', 17, '18.jpg');
INSERT INTO `user` VALUES (19, 'gongweibin', '202CB962AC59075B964B07152D234B70', '龚玮斌', 7, '19.jpg');
INSERT INTO `user` VALUES (20, 'fengrui', '202CB962AC59075B964B07152D234B70', '冯瑞', 19, '20.jpg');
INSERT INTO `user` VALUES (21, 'chenchen', '202CB962AC59075B964B07152D234B70', '陈晨', 19, '21.jpg');
INSERT INTO `user` VALUES (22, 'zhaokai', '202CB962AC59075B964B07152D234B70', '赵凯', 19, '22.jpg');
INSERT INTO `user` VALUES (23, 'caigenrong', '202CB962AC59075B964B07152D234B70', '蔡根荣', 19, '23.jpg');
INSERT INTO `user` VALUES (24, 'wenshuqing', '202CB962AC59075B964B07152D234B70', '闻书晴', 19, '24.jpg');
INSERT INTO `user` VALUES (25, 'chengfengjiao', '202CB962AC59075B964B07152D234B70', '陈凤娇', 3, '25.jpg');
INSERT INTO `user` VALUES (26, 'test', '202CB962AC59075B964B07152D234B70', '测试1234', 1, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  INDEX `pk_3`(`user_id`) USING BTREE,
  INDEX `pk_4`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 2);
INSERT INTO `user_role` VALUES (2, 5);
INSERT INTO `user_role` VALUES (3, 8);
INSERT INTO `user_role` VALUES (3, 13);
INSERT INTO `user_role` VALUES (4, 17);
INSERT INTO `user_role` VALUES (5, 20);
INSERT INTO `user_role` VALUES (6, 23);
INSERT INTO `user_role` VALUES (7, 30);
INSERT INTO `user_role` VALUES (8, 29);
INSERT INTO `user_role` VALUES (9, 4);
INSERT INTO `user_role` VALUES (10, 4);
INSERT INTO `user_role` VALUES (11, 3);
INSERT INTO `user_role` VALUES (12, 6);
INSERT INTO `user_role` VALUES (13, 10);
INSERT INTO `user_role` VALUES (14, 12);
INSERT INTO `user_role` VALUES (15, 21);
INSERT INTO `user_role` VALUES (16, 22);
INSERT INTO `user_role` VALUES (17, 24);
INSERT INTO `user_role` VALUES (18, 25);
INSERT INTO `user_role` VALUES (19, 26);
INSERT INTO `user_role` VALUES (20, 27);
INSERT INTO `user_role` VALUES (21, 27);
INSERT INTO `user_role` VALUES (22, 27);
INSERT INTO `user_role` VALUES (23, 27);
INSERT INTO `user_role` VALUES (24, 28);
INSERT INTO `user_role` VALUES (25, 15);

SET FOREIGN_KEY_CHECKS = 1;
