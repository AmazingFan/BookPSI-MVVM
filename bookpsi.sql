/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : bookpsi

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 23/03/2020 18:03:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `auther` varchar(255) DEFAULT NULL,
  `sellprice` int(255) DEFAULT NULL,
  `purchaseprice` int(255) DEFAULT NULL,
  `pressid` int(255) DEFAULT NULL,
  `stock` int(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `sale` int(255) DEFAULT NULL,
  `lowstock` int(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES (1, 11, '互联网轻量级框架整合开发', '吴玉生', 119, 89, 4, 528, '8378274234', 151, 10, '编程', '16');
INSERT INTO `book` VALUES (2, 11, '计算机操作系统教程', 'Linus', 34, 20, 2, 25, '98239344', 367, 10, '编程', '16');
INSERT INTO `book` VALUES (3, 3, '企业级应用开发教程', '黑马程序员', 20, 30, 2, 253, '82734', 2, 10, '编程', '12');
INSERT INTO `book` VALUES (4, 5, '轻量级开发面试教程', '金华', 69, 40, 7, 40, '923697', 63, 10, '编程', '16');
INSERT INTO `book` VALUES (5, 6, '深入分析JAVAWeb', '许令波', 79, 30, 6, 80, '52323', 70, 10, '编程', '16');
INSERT INTO `book` VALUES (6, 6, '白鹿原', '陈忠实', 39, 19, 8, 34, '75463', 67, 10, '小说', '32');
INSERT INTO `book` VALUES (7, 3, '漫画', '123', 123, 123, 5, 123, '123', 166, 123, '123', '123');
INSERT INTO `book` VALUES (8, 9, ' c++从入门到精通', '张三', 69, 40, 7, 110, '6252523', 83, 100, '编程', '16');
INSERT INTO `book` VALUES (9, 3, '练字', '吴玉生', 78, 36, 5, 636, '8565', 39, 10, '练字', '16');
INSERT INTO `book` VALUES (13, 5, '534', '345', 3245, 534, 6, 48, '234523', 5234, 5234, '5324', '5234');
INSERT INTO `book` VALUES (14, 2, '234', '234', 234, 34, 3, 2, '234', 2, 44, '34', '234');
INSERT INTO `book` VALUES (34, 6, '43', '43', 43, 43, 3, 43, '43', 43, 60, '43', '43');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '教育', NULL);
INSERT INTO `category` VALUES (2, '小说', NULL);
INSERT INTO `category` VALUES (3, '文艺', NULL);
INSERT INTO `category` VALUES (4, '青春文学动漫', NULL);
INSERT INTO `category` VALUES (5, '政治', NULL);
INSERT INTO `category` VALUES (6, '童书', NULL);
INSERT INTO `category` VALUES (7, '人文社科', NULL);
INSERT INTO `category` VALUES (8, '经管', NULL);
INSERT INTO `category` VALUES (9, '成功励志', NULL);
INSERT INTO `category` VALUES (10, '生活', NULL);
INSERT INTO `category` VALUES (11, '科技', NULL);
INSERT INTO `category` VALUES (12, '外文原版', NULL);
INSERT INTO `category` VALUES (13, '期刊音像', NULL);
INSERT INTO `category` VALUES (14, '文娱文具', NULL);
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_zh` varchar(255) DEFAULT NULL,
  `keepalive` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `enabled` enum('1','0') DEFAULT '1',
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, NULL, '/index', 'AppIndex', 'Index', '首页', NULL, 0, '1', NULL);
INSERT INTO `menu` VALUES (2, NULL, '/index', 'AppIndex', 'buy', '采购管理', NULL, 0, '1', 'el-icon-s-cooperation\n');
INSERT INTO `menu` VALUES (3, NULL, '/index', 'AppIndex', 'sale', '销售管理', NULL, 0, '1', NULL);
INSERT INTO `menu` VALUES (4, NULL, '/index', 'AppIndex', 'warehouse', '库存管理', NULL, 0, '1', NULL);
INSERT INTO `menu` VALUES (5, NULL, '/index/book', 'Book', 'book', '图书库存', NULL, 4, '1', 'el-icon-takeaway-box\nel-icon-takeaway-box\nel-icon-takeaway-box\nel-icon-takeaway-box\n');
INSERT INTO `menu` VALUES (6, NULL, '/index', 'AppIndex', 'proper', '数据管理', NULL, 0, '1', NULL);
INSERT INTO `menu` VALUES (7, NULL, '/index/user', 'User', 'user', '用户信息', NULL, 6, '1', 'el-icon-user');
INSERT INTO `menu` VALUES (9, NULL, '/index/stock', 'Stock', 'stock', '图书入库', NULL, 2, '1', 'el-icon-s-order');
INSERT INTO `menu` VALUES (10, NULL, '/index/saleorder', 'SaleOrder', 'saleorder', '商品销售', NULL, 3, '1', 'el-icon-shopping-bag-1');
INSERT INTO `menu` VALUES (11, NULL, '/index/press', 'Press', 'press', '出版社', NULL, 6, '1', 'el-icon-office-building');
INSERT INTO `menu` VALUES (12, NULL, '/index/role', 'Role', 'role', '角色管理', NULL, 6, '1', 'el-icon-s-custom');
INSERT INTO `menu` VALUES (13, NULL, '/index/dashboard', 'Dashboard', 'board', '主页', NULL, 1, '1', 'el-icon-s-grid');
INSERT INTO `menu` VALUES (14, NULL, '/index/order', 'OrderIndex', 'orders', '入库订单', NULL, 2, '1', 'el-icon-s-claim');
INSERT INTO `menu` VALUES (15, NULL, '/index/sale', 'Sale', 'sales', '销售订单', NULL, 3, '1', 'el-icon-sell');
INSERT INTO `menu` VALUES (16, NULL, '/index/findorder', 'FindOrder', 'findorder', '订单查找', NULL, 4, '1', 'el-icon-search');
INSERT INTO `menu` VALUES (18, NULL, '/index/return', 'Return', 'return', '入库退货', NULL, 2, '1', 'el-icon-truck');
COMMIT;

-- ----------------------------
-- Table structure for order_book
-- ----------------------------
DROP TABLE IF EXISTS `order_book`;
CREATE TABLE `order_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_book
-- ----------------------------
BEGIN;
INSERT INTO `order_book` VALUES (45, 61, 1, 1, 89);
INSERT INTO `order_book` VALUES (46, 62, 1, 1, 89);
INSERT INTO `order_book` VALUES (47, 63, 1, 1, 89);
INSERT INTO `order_book` VALUES (48, 64, 1, 23, 2047);
INSERT INTO `order_book` VALUES (51, 67, 9, 23, 46);
INSERT INTO `order_book` VALUES (58, 58, 1, 1, 3);
INSERT INTO `order_book` VALUES (59, 71, 1, 2, 178);
INSERT INTO `order_book` VALUES (65, 57, 1, 2, 23);
INSERT INTO `order_book` VALUES (66, 60, 1, 23, 23);
INSERT INTO `order_book` VALUES (67, 73, 1, 123, 10947);
INSERT INTO `order_book` VALUES (68, 73, 3, 233, 6990);
INSERT INTO `order_book` VALUES (69, 74, 1, 1, 89);
INSERT INTO `order_book` VALUES (70, 75, 1, 1, 89);
INSERT INTO `order_book` VALUES (71, 75, 1, 1, 89);
INSERT INTO `order_book` VALUES (72, 76, 8, 2, 80);
INSERT INTO `order_book` VALUES (73, 76, 2, 34, 680);
INSERT INTO `order_book` VALUES (74, 76, 8, 45, 1800);
INSERT INTO `order_book` VALUES (75, 76, 8, 2, 80);
INSERT INTO `order_book` VALUES (76, 76, 2, 34, 680);
INSERT INTO `order_book` VALUES (77, 76, 8, 45, 1800);
INSERT INTO `order_book` VALUES (78, 77, 1, 2, 178);
INSERT INTO `order_book` VALUES (79, 77, 1, 2, 178);
INSERT INTO `order_book` VALUES (80, 78, 1, 23, 2047);
INSERT INTO `order_book` VALUES (81, 79, 1, 23, 2047);
INSERT INTO `order_book` VALUES (82, 80, 1, 2, 178);
INSERT INTO `order_book` VALUES (83, 80, 1, 2, 178);
INSERT INTO `order_book` VALUES (84, 79, 1, 23, 2047);
INSERT INTO `order_book` VALUES (85, 78, 1, 23, 2047);
INSERT INTO `order_book` VALUES (96, 86, 1, 2, 178);
INSERT INTO `order_book` VALUES (98, 86, 1, 2, 178);
INSERT INTO `order_book` VALUES (99, 71, 1, 2, 178);
INSERT INTO `order_book` VALUES (101, 89, 8, 23, 920);
INSERT INTO `order_book` VALUES (102, 89, 2, 2, 40);
INSERT INTO `order_book` VALUES (103, 90, 7, 43, 5289);
INSERT INTO `order_book` VALUES (104, 90, 7, 43, 5289);
INSERT INTO `order_book` VALUES (107, 97, 13, 1, 534);
INSERT INTO `order_book` VALUES (108, 98, 13, 1, 534);
INSERT INTO `order_book` VALUES (109, 99, 13, 1, 534);
INSERT INTO `order_book` VALUES (110, 100, 13, 1, 534);
INSERT INTO `order_book` VALUES (111, 101, 13, 1, 534);
INSERT INTO `order_book` VALUES (112, 102, 1, 1, 89);
INSERT INTO `order_book` VALUES (113, 103, 1, 2, 178);
INSERT INTO `order_book` VALUES (114, 104, 1, 2, 178);
INSERT INTO `order_book` VALUES (115, 104, 1, 0, 0);
INSERT INTO `order_book` VALUES (116, 104, 1, 1, 89);
INSERT INTO `order_book` VALUES (117, 104, 1, 2, 178);
INSERT INTO `order_book` VALUES (118, 104, 1, 0, 0);
INSERT INTO `order_book` VALUES (119, 104, 1, 1, 89);
INSERT INTO `order_book` VALUES (120, 105, 13, 1, 534);
INSERT INTO `order_book` VALUES (121, 106, 1, 1, 89);
INSERT INTO `order_book` VALUES (122, 107, 13, 1, 534);
INSERT INTO `order_book` VALUES (123, 108, 1, 1, 89);
INSERT INTO `order_book` VALUES (124, 109, 1, 1, 89);
INSERT INTO `order_book` VALUES (125, 110, 1, 23, 2047);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialid` int(11) DEFAULT NULL,
  `value` int(255) DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL,
  `type` tinyint(255) DEFAULT NULL,
  `createtime` timestamp(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (54, 297643, 17860, 0, 1, NULL);
INSERT INTO `orders` VALUES (55, 717409, 218, 0, 1, NULL);
INSERT INTO `orders` VALUES (57, 761928, 178, 0, 1, NULL);
INSERT INTO `orders` VALUES (58, 876980, 178, 0, 1, NULL);
INSERT INTO `orders` VALUES (60, 217886, 89, 0, 1, NULL);
INSERT INTO `orders` VALUES (61, 607088, 89, 0, 1, NULL);
INSERT INTO `orders` VALUES (62, 693284, 89, 0, 1, NULL);
INSERT INTO `orders` VALUES (63, 959452, 89, 1, 0, NULL);
INSERT INTO `orders` VALUES (64, 439803, 2047, 1, 0, NULL);
INSERT INTO `orders` VALUES (65, 247239, 0, 0, 1, NULL);
INSERT INTO `orders` VALUES (67, 309039, 46, 1, 0, '2020-02-20 14:41:42.00000');
INSERT INTO `orders` VALUES (71, 726930, 178, 0, 1, '2020-02-20 23:25:38.00000');
INSERT INTO `orders` VALUES (73, 851494, 17937, 0, 1, '2020-02-20 23:53:49.00000');
INSERT INTO `orders` VALUES (74, 955445, 89, 0, 1, '2020-02-20 23:57:31.00000');
INSERT INTO `orders` VALUES (75, 271474, 89, 0, 1, '2020-02-21 00:00:35.00000');
INSERT INTO `orders` VALUES (76, 376359, 2560, 0, 1, '2020-02-21 00:01:23.00000');
INSERT INTO `orders` VALUES (77, 510897, 178, 0, 1, '2020-02-21 00:05:46.00000');
INSERT INTO `orders` VALUES (78, 840704, 2047, 0, 1, '2020-02-21 00:11:38.00000');
INSERT INTO `orders` VALUES (79, 685171, 0, 0, 1, '2020-02-21 00:11:42.00000');
INSERT INTO `orders` VALUES (80, 694719, 178, 0, 1, '2020-02-21 00:11:51.00000');
INSERT INTO `orders` VALUES (86, 232600, 178, 0, 1, '2020-02-21 13:59:44.00000');
INSERT INTO `orders` VALUES (89, 904690, 40, 1, 1, '2020-02-21 14:26:57.00000');
INSERT INTO `orders` VALUES (90, 161464, 5289, 0, 1, '2020-02-21 14:31:20.00000');
INSERT INTO `orders` VALUES (93, 535891, 178, 0, 0, '2020-02-20 23:25:49.00000');
INSERT INTO `orders` VALUES (94, 880579, 89, 0, 0, '2020-02-20 17:34:40.00000');
INSERT INTO `orders` VALUES (95, 794453, 89, 0, 0, '2020-02-20 17:34:31.00000');
INSERT INTO `orders` VALUES (97, 106481, 534, 1, 1, '2020-02-21 21:59:18.00000');
INSERT INTO `orders` VALUES (98, 309000, 534, 1, 1, '2020-02-21 21:59:28.00000');
INSERT INTO `orders` VALUES (99, 169842, 534, 1, 1, '2020-02-21 22:00:06.00000');
INSERT INTO `orders` VALUES (100, 842408, 534, 1, 1, '2020-02-21 22:00:58.00000');
INSERT INTO `orders` VALUES (101, 339690, 534, 1, 1, '2020-02-21 22:01:11.00000');
INSERT INTO `orders` VALUES (102, 397950, 89, 1, 1, '2020-02-21 22:01:35.00000');
INSERT INTO `orders` VALUES (103, 752393, 178, 1, 1, '2020-02-21 22:02:16.00000');
INSERT INTO `orders` VALUES (104, 625977, 89, 0, 1, '2020-02-21 22:02:31.00000');
INSERT INTO `orders` VALUES (105, 387404, 534, 1, 1, '2020-02-21 22:06:57.00000');
INSERT INTO `orders` VALUES (106, 122763, 89, 1, 1, '2020-02-21 22:07:10.00000');
INSERT INTO `orders` VALUES (107, 576534, 534, 1, 1, '2020-02-21 22:23:21.00000');
INSERT INTO `orders` VALUES (108, 247262, 89, 1, 0, '2020-02-22 20:43:41.00000');
INSERT INTO `orders` VALUES (109, 766426, 89, 1, 1, '2020-02-22 23:24:55.00000');
INSERT INTO `orders` VALUES (110, 706100, 2047, 1, 0, '2020-03-15 01:47:59.00000');
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, 'users_management', '用户管理', '/api/user');
INSERT INTO `permission` VALUES (2, 'roles_management', '角色管理', '/api/role');
INSERT INTO `permission` VALUES (3, 'content_management', '图书管理', '/api/book');
COMMIT;

-- ----------------------------
-- Table structure for press
-- ----------------------------
DROP TABLE IF EXISTS `press`;
CREATE TABLE `press` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of press
-- ----------------------------
BEGIN;
INSERT INTO `press` VALUES (1, '商务印书馆', '鸣人', '1132', '木叶村', '123@qq.com');
INSERT INTO `press` VALUES (2, '浙江少年儿童出版社', '大蛇丸', '12312313', '木叶村', '123');
INSERT INTO `press` VALUES (3, '人民文学出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (4, '机械工业出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (5, '电子工业出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (6, '清华大学出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (7, '人民邮电出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (8, '江苏少年儿童出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (9, '北京大学出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (12, '化学工业出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (13, '建筑工业出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (14, '中信出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (15, '少年儿童出版社', NULL, NULL, NULL, NULL);
INSERT INTO `press` VALUES (16, '上海交通大学出版社', '纲手', '11233', '12398', '43848');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `zhname` varchar(255) DEFAULT NULL,
  `enabled` tinyint(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'boss', '老板', 1);
INSERT INTO `role` VALUES (2, 'buyer', '采购员', 1);
INSERT INTO `role` VALUES (3, 'salesmanager', '销售经理', 1);
INSERT INTO `role` VALUES (4, 'warekeeper', '仓库管理员', 1);
INSERT INTO `role` VALUES (5, 'manager', '经理', 1);
INSERT INTO `role` VALUES (6, 'sales', '销售员', 1);
COMMIT;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
INSERT INTO `role_menu` VALUES (19, 2, 1);
INSERT INTO `role_menu` VALUES (20, 2, 2);
INSERT INTO `role_menu` VALUES (21, 2, 9);
INSERT INTO `role_menu` VALUES (22, 2, 3);
INSERT INTO `role_menu` VALUES (23, 2, 10);
INSERT INTO `role_menu` VALUES (24, 2, 4);
INSERT INTO `role_menu` VALUES (25, 2, 5);
INSERT INTO `role_menu` VALUES (26, 2, 7);
INSERT INTO `role_menu` VALUES (27, 2, 12);
INSERT INTO `role_menu` VALUES (121, 5, 3);
INSERT INTO `role_menu` VALUES (122, 5, 10);
INSERT INTO `role_menu` VALUES (123, 5, 4);
INSERT INTO `role_menu` VALUES (124, 5, 5);
INSERT INTO `role_menu` VALUES (125, 3, 2);
INSERT INTO `role_menu` VALUES (126, 3, 9);
INSERT INTO `role_menu` VALUES (138, 8, 2);
INSERT INTO `role_menu` VALUES (139, 8, 9);
INSERT INTO `role_menu` VALUES (140, 8, 14);
INSERT INTO `role_menu` VALUES (141, 6, 1);
INSERT INTO `role_menu` VALUES (142, 6, 13);
INSERT INTO `role_menu` VALUES (143, 6, 2);
INSERT INTO `role_menu` VALUES (144, 6, 9);
INSERT INTO `role_menu` VALUES (145, 6, 14);
INSERT INTO `role_menu` VALUES (146, 6, 18);
INSERT INTO `role_menu` VALUES (147, 6, 3);
INSERT INTO `role_menu` VALUES (148, 6, 10);
INSERT INTO `role_menu` VALUES (149, 6, 15);
INSERT INTO `role_menu` VALUES (150, 6, 4);
INSERT INTO `role_menu` VALUES (151, 6, 5);
INSERT INTO `role_menu` VALUES (152, 6, 16);
INSERT INTO `role_menu` VALUES (153, 6, 6);
INSERT INTO `role_menu` VALUES (154, 6, 7);
INSERT INTO `role_menu` VALUES (155, 6, 11);
INSERT INTO `role_menu` VALUES (156, 6, 12);
INSERT INTO `role_menu` VALUES (157, 1, 1);
INSERT INTO `role_menu` VALUES (158, 1, 13);
INSERT INTO `role_menu` VALUES (159, 1, 2);
INSERT INTO `role_menu` VALUES (160, 1, 9);
INSERT INTO `role_menu` VALUES (161, 1, 14);
INSERT INTO `role_menu` VALUES (162, 1, 18);
INSERT INTO `role_menu` VALUES (163, 1, 3);
INSERT INTO `role_menu` VALUES (164, 1, 10);
INSERT INTO `role_menu` VALUES (165, 1, 15);
INSERT INTO `role_menu` VALUES (166, 1, 4);
INSERT INTO `role_menu` VALUES (167, 1, 5);
INSERT INTO `role_menu` VALUES (168, 1, 16);
INSERT INTO `role_menu` VALUES (169, 1, 6);
INSERT INTO `role_menu` VALUES (170, 1, 7);
INSERT INTO `role_menu` VALUES (171, 1, 11);
INSERT INTO `role_menu` VALUES (172, 1, 12);
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (6, 2, 1);
INSERT INTO `role_permission` VALUES (7, 2, 2);
INSERT INTO `role_permission` VALUES (8, 2, 3);
INSERT INTO `role_permission` VALUES (32, 5, 3);
INSERT INTO `role_permission` VALUES (33, 3, 2);
INSERT INTO `role_permission` VALUES (37, 6, 1);
INSERT INTO `role_permission` VALUES (38, 6, 2);
INSERT INTO `role_permission` VALUES (39, 6, 3);
INSERT INTO `role_permission` VALUES (40, 1, 1);
INSERT INTO `role_permission` VALUES (41, 1, 2);
INSERT INTO `role_permission` VALUES (42, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------
BEGIN;
INSERT INTO `role_user` VALUES (3, 3, 2);
INSERT INTO `role_user` VALUES (36, 2, 4);
INSERT INTO `role_user` VALUES (37, 2, 3);
INSERT INTO `role_user` VALUES (38, 2, 1);
INSERT INTO `role_user` VALUES (39, 2, 6);
INSERT INTO `role_user` VALUES (40, 2, 2);
INSERT INTO `role_user` VALUES (41, 2, 5);
INSERT INTO `role_user` VALUES (81, 5, 1);
INSERT INTO `role_user` VALUES (82, 5, 2);
INSERT INTO `role_user` VALUES (83, 5, 3);
INSERT INTO `role_user` VALUES (84, 5, 5);
INSERT INTO `role_user` VALUES (85, 5, 4);
INSERT INTO `role_user` VALUES (86, 5, 6);
INSERT INTO `role_user` VALUES (87, 6, 5);
INSERT INTO `role_user` VALUES (88, 1, 1);
INSERT INTO `role_user` VALUES (89, 1, 3);
INSERT INTO `role_user` VALUES (90, 1, 2);
INSERT INTO `role_user` VALUES (91, 1, 6);
INSERT INTO `role_user` VALUES (92, 1, 4);
INSERT INTO `role_user` VALUES (93, 1, 5);
INSERT INTO `role_user` VALUES (94, 4, 3);
INSERT INTO `role_user` VALUES (102, 19, 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `idcard` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `workstate` varchar(255) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT '1',
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (2, '2019222', '111', 'manager', '李四', '2534', '男', '32432', '上海', NULL, 1, NULL);
INSERT INTO `user` VALUES (4, '2019324', 'e3bc930db58eb216f54ef52f8698aefe', 'wos', '小毛', '5324523333', '女', '354235', '广州', NULL, 1, '4jQU0n6ehVUMtg+tu+pNDw==');
INSERT INTO `user` VALUES (5, '2017312', '795028872802935df458eec4a823c136', 'user', '小狗', '34524', '男', '12313143124', '深圳', NULL, 1, 'cTBecpsZuE09Srfx8tD+qw==');
INSERT INTO `user` VALUES (19, '2017434', '868c4d27bc45f6fef364533c378af2b5', 'admin', 'admin', '123', '男', '12322', '2', NULL, 1, 'JaK/1477KwQVaP8yEhaYOA==');
INSERT INTO `user` VALUES (20, '2020473', '3f0ef1add806f8b2aaa4da58f2dfe23d', 'qwe', '123', '123', '123', '123', '123', NULL, 1, 'DTOu9WD8f2OyxfPwS0fbvg==');
INSERT INTO `user` VALUES (21, '2020846', '3a290c993d9ff1b9f5bd26ee65f36a12', '32', '32', '32', '32', '32', '32', NULL, 1, 'h2IryqxnvcIAVgnsSOpu4Q==');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
