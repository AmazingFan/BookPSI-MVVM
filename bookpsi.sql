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

 Date: 02/05/2020 21:29:10
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES (1, 11, '互联网轻量级框架整合开发', '吴玉生', 119, 89, 4, 594, '8378274234', 154, 10, '编程', '16');
INSERT INTO `book` VALUES (2, 11, '计算机操作系统教程', 'Linus', 34, 20, 2, 29, '98239344', 369, 10, '编程', '16');
INSERT INTO `book` VALUES (3, 3, '企业级应用开发教程', '黑马程序员', 20, 30, 2, 262, '82734', 2, 10, '编程', '12');
INSERT INTO `book` VALUES (4, 5, '轻量级开发面试教程', '金华', 69, 40, 7, 44, '923697', 63, 10, '编程', '16');
INSERT INTO `book` VALUES (5, 6, '深入分析JAVAWeb', '许令波', 79, 30, 6, 82, '52323', 70, 10, '编程', '16');
INSERT INTO `book` VALUES (6, 6, '白鹿原', '陈忠实', 39, 19, 8, 34, '75463', 67, 10, '小说', '32');
INSERT INTO `book` VALUES (7, 3, '漫画', '123', 123, 123, 5, 125, '123', 166, 123, '123', '123');
INSERT INTO `book` VALUES (8, 9, ' c++从入门到精通', '张三', 69, 40, 7, 92, '6252523', 106, 100, '编程', '16');
INSERT INTO `book` VALUES (9, 3, '楷书速成', '吴玉生', 78, 36, 5, 639, '8565', 39, 10, '练字', '16');
INSERT INTO `book` VALUES (13, 5, '编译原理', '345', 3245, 534, 6, 47, '234523', 5235, 5234, '5324', '5234');
INSERT INTO `book` VALUES (14, 2, '算法图解', '234', 234, 34, 3, 3, '234', 2, 44, '34', '234');
INSERT INTO `book` VALUES (34, 6, '漫画算法', '43', 43, 43, 3, 43, '43', 43, 60, '43', '43');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

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
INSERT INTO `order_book` VALUES (126, 111, 1, 1, 89);
INSERT INTO `order_book` VALUES (127, 112, 1, 1, 89);
INSERT INTO `order_book` VALUES (128, 112, 1, 1, 89);
INSERT INTO `order_book` VALUES (129, 113, 1, 2, 178);
INSERT INTO `order_book` VALUES (130, 114, 1, 1, 89);
INSERT INTO `order_book` VALUES (131, 115, 1, 1, 89);
INSERT INTO `order_book` VALUES (132, 116, 1, 1, 89);
INSERT INTO `order_book` VALUES (133, 116, 1, 1, 89);
INSERT INTO `order_book` VALUES (134, 117, 1, 1, 89);
INSERT INTO `order_book` VALUES (135, 118, 1, 1, 89);
INSERT INTO `order_book` VALUES (136, 119, 1, 1, 89);
INSERT INTO `order_book` VALUES (137, 120, 3, 1, 30);
INSERT INTO `order_book` VALUES (138, 121, 1, 1, 89);
INSERT INTO `order_book` VALUES (139, 122, 1, 1, 89);
INSERT INTO `order_book` VALUES (140, 123, 1, 1, 89);
INSERT INTO `order_book` VALUES (141, 124, 8, 1, 40);
INSERT INTO `order_book` VALUES (142, 125, 1, 2, 178);
INSERT INTO `order_book` VALUES (143, 126, 1, 1, 89);
INSERT INTO `order_book` VALUES (144, 127, 1, 1, 89);
INSERT INTO `order_book` VALUES (145, 127, 1, 1, 89);
INSERT INTO `order_book` VALUES (146, 128, 1, 1, 89);
INSERT INTO `order_book` VALUES (147, 130, 1, 1, 89);
INSERT INTO `order_book` VALUES (148, 131, 1, 1, 89);
INSERT INTO `order_book` VALUES (149, 132, 3, 1, 30);
INSERT INTO `order_book` VALUES (150, 133, 1, 1, 89);
INSERT INTO `order_book` VALUES (151, 134, 1, 1, 89);
INSERT INTO `order_book` VALUES (152, 135, 1, 1, 89);
INSERT INTO `order_book` VALUES (153, 136, 4, 1, 40);
INSERT INTO `order_book` VALUES (154, 137, 1, 1, 89);
INSERT INTO `order_book` VALUES (155, 138, 1, 1, 89);
INSERT INTO `order_book` VALUES (156, 139, 2, 1, 20);
INSERT INTO `order_book` VALUES (157, 140, 1, 2, 178);
INSERT INTO `order_book` VALUES (158, 141, 1, 1, 89);
INSERT INTO `order_book` VALUES (159, 142, 1, 1, 89);
INSERT INTO `order_book` VALUES (160, 143, 3, 1, 30);
INSERT INTO `order_book` VALUES (161, 144, 1, 1, 89);
INSERT INTO `order_book` VALUES (162, 145, 1, 1, 89);
INSERT INTO `order_book` VALUES (163, 146, 8, 1, 40);
INSERT INTO `order_book` VALUES (164, 146, 5, 2, 60);
INSERT INTO `order_book` VALUES (165, 147, 1, 1, 89);
INSERT INTO `order_book` VALUES (166, 148, 1, 1, 89);
INSERT INTO `order_book` VALUES (167, 149, 1, 1, 89);
INSERT INTO `order_book` VALUES (168, 150, 3, 1, 30);
INSERT INTO `order_book` VALUES (169, 151, 1, 1, 89);
INSERT INTO `order_book` VALUES (170, 152, 4, 1, 40);
INSERT INTO `order_book` VALUES (171, 153, 4, 1, 40);
INSERT INTO `order_book` VALUES (172, 154, 2, 1, 20);
INSERT INTO `order_book` VALUES (173, 155, 1, 1, 89);
INSERT INTO `order_book` VALUES (174, 156, 1, 1, 89);
INSERT INTO `order_book` VALUES (175, 157, 1, 1, 89);
INSERT INTO `order_book` VALUES (176, 158, 1, 1, 89);
INSERT INTO `order_book` VALUES (177, 159, 1, 1, 89);
INSERT INTO `order_book` VALUES (178, 160, 1, 1, 89);
INSERT INTO `order_book` VALUES (179, 161, 1, 1, 89);
INSERT INTO `order_book` VALUES (180, 162, 1, 1, 89);
INSERT INTO `order_book` VALUES (181, 163, 1, 1, 89);
INSERT INTO `order_book` VALUES (182, 164, 1, 1, 89);
INSERT INTO `order_book` VALUES (183, 165, 4, 1, 40);
INSERT INTO `order_book` VALUES (184, 166, 1, 1, 89);
INSERT INTO `order_book` VALUES (185, 167, 1, 1, 89);
INSERT INTO `order_book` VALUES (186, 168, 1, 1, 89);
INSERT INTO `order_book` VALUES (187, 169, 1, 1, 89);
INSERT INTO `order_book` VALUES (188, 170, 1, 1, 89);
INSERT INTO `order_book` VALUES (189, 171, 1, 1, 89);
INSERT INTO `order_book` VALUES (190, 172, 1, 1, 89);
INSERT INTO `order_book` VALUES (191, 173, 1, 1, 89);
INSERT INTO `order_book` VALUES (192, 174, 1, 1, 89);
INSERT INTO `order_book` VALUES (193, 175, 1, 1, 89);
INSERT INTO `order_book` VALUES (194, 176, 1, 1, 89);
INSERT INTO `order_book` VALUES (195, 177, 2, 1, 20);
INSERT INTO `order_book` VALUES (196, 178, 1, 1, 89);
INSERT INTO `order_book` VALUES (197, 179, 1, 1, 89);
INSERT INTO `order_book` VALUES (198, 181, 1, 1, 89);
INSERT INTO `order_book` VALUES (199, 182, 1, 1, 89);
INSERT INTO `order_book` VALUES (200, 183, 9, 3, 108);
INSERT INTO `order_book` VALUES (201, 184, 1, 1, 89);
INSERT INTO `order_book` VALUES (202, 185, 3, 1, 30);
INSERT INTO `order_book` VALUES (203, 187, 1, 1, 89);
INSERT INTO `order_book` VALUES (204, 188, 3, 1, 30);
INSERT INTO `order_book` VALUES (205, 189, 1, 1, 89);
INSERT INTO `order_book` VALUES (206, 190, 1, 1, 89);
INSERT INTO `order_book` VALUES (207, 191, 1, 1, 89);
INSERT INTO `order_book` VALUES (208, 192, 1, 1, 89);
INSERT INTO `order_book` VALUES (209, 192, 8, 1, 40);
INSERT INTO `order_book` VALUES (210, 194, 1, 1, 89);
INSERT INTO `order_book` VALUES (211, 196, 3, 3, 90);
INSERT INTO `order_book` VALUES (212, 198, 4, 1, 40);
INSERT INTO `order_book` VALUES (213, 200, 1, 1, 89);
INSERT INTO `order_book` VALUES (214, 203, 8, 1, 40);
INSERT INTO `order_book` VALUES (215, 204, 1, 1, 89);
INSERT INTO `order_book` VALUES (216, 207, 7, 1, 123);
INSERT INTO `order_book` VALUES (217, 208, 1, 1, 89);
INSERT INTO `order_book` VALUES (218, 209, 1, 1, 89);
INSERT INTO `order_book` VALUES (219, 210, 1, 1, 89);
INSERT INTO `order_book` VALUES (220, 211, 1, 1, 89);
INSERT INTO `order_book` VALUES (221, 212, 1, 1, 89);
INSERT INTO `order_book` VALUES (222, 213, 8, 1, 40);
INSERT INTO `order_book` VALUES (223, 214, 1, 1, 89);
INSERT INTO `order_book` VALUES (224, 215, 1, 1, 89);
INSERT INTO `order_book` VALUES (225, 216, 2, 1, 20);
INSERT INTO `order_book` VALUES (226, 217, 1, 1, 89);
INSERT INTO `order_book` VALUES (227, 218, 1, 1, 89);
INSERT INTO `order_book` VALUES (228, 219, 1, 1, 89);
INSERT INTO `order_book` VALUES (229, 220, 1, 1, 89);
INSERT INTO `order_book` VALUES (237, 227, 7, 1, 123);
INSERT INTO `order_book` VALUES (238, 228, 2, 1, 20);
INSERT INTO `order_book` VALUES (239, 229, 1, 1, 89);
INSERT INTO `order_book` VALUES (240, 229, 1, 1, 89);
INSERT INTO `order_book` VALUES (241, 230, 1, 1, 89);
INSERT INTO `order_book` VALUES (242, 231, 1, 1, 89);
INSERT INTO `order_book` VALUES (243, 89, 8, 23, 920);
INSERT INTO `order_book` VALUES (244, 89, 2, 2, 40);
INSERT INTO `order_book` VALUES (245, 232, 1, 2, 178);
INSERT INTO `order_book` VALUES (246, 97, 13, 1, 534);
INSERT INTO `order_book` VALUES (247, 233, 2, 1, 20);
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
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
INSERT INTO `orders` VALUES (89, 904690, 40, 0, 1, '2020-02-21 14:26:57.00000');
INSERT INTO `orders` VALUES (90, 161464, 5289, 0, 1, '2020-02-21 14:31:20.00000');
INSERT INTO `orders` VALUES (93, 535891, 178, 0, 0, '2020-02-20 23:25:49.00000');
INSERT INTO `orders` VALUES (94, 880579, 89, 0, 0, '2020-02-20 17:34:40.00000');
INSERT INTO `orders` VALUES (95, 794453, 89, 0, 0, '2020-02-20 17:34:31.00000');
INSERT INTO `orders` VALUES (97, 106481, 534, 0, 1, '2020-02-21 21:59:18.00000');
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
INSERT INTO `orders` VALUES (111, 462569, 89, 1, 1, '2020-04-10 01:15:43.00000');
INSERT INTO `orders` VALUES (112, 916858, 89, 1, 1, '2020-04-10 01:19:40.00000');
INSERT INTO `orders` VALUES (113, 926751, 178, 1, 0, '2020-04-10 01:19:52.00000');
INSERT INTO `orders` VALUES (114, 477365, 89, 1, 1, '2020-04-10 01:20:10.00000');
INSERT INTO `orders` VALUES (115, 558696, 89, 1, 1, '2020-04-10 01:27:45.00000');
INSERT INTO `orders` VALUES (116, 596655, 89, 1, 1, '2020-04-10 01:29:42.00000');
INSERT INTO `orders` VALUES (117, 901383, 89, 1, 1, '2020-04-10 01:32:37.00000');
INSERT INTO `orders` VALUES (118, 967332, 89, 1, 1, '2020-04-10 01:39:43.00000');
INSERT INTO `orders` VALUES (119, 897415, 89, 1, 1, '2020-04-10 01:53:53.00000');
INSERT INTO `orders` VALUES (120, 800581, 30, 1, 1, '2020-04-10 02:48:31.00000');
INSERT INTO `orders` VALUES (121, 232128, 89, 1, 1, '2020-04-10 02:51:42.00000');
INSERT INTO `orders` VALUES (122, 660116, 89, 1, 1, '2020-04-10 02:51:45.00000');
INSERT INTO `orders` VALUES (123, 167783, 89, 1, 1, '2020-04-10 02:52:29.00000');
INSERT INTO `orders` VALUES (124, 410247, 40, 1, 1, '2020-04-10 02:52:47.00000');
INSERT INTO `orders` VALUES (125, 840113, 178, 1, 1, '2020-04-10 03:11:38.00000');
INSERT INTO `orders` VALUES (126, 919161, 89, 1, 1, '2020-04-10 03:18:22.00000');
INSERT INTO `orders` VALUES (127, 566498, 89, 1, 1, '2020-04-10 03:18:48.00000');
INSERT INTO `orders` VALUES (128, 693070, 89, 1, 1, '2020-04-10 03:19:09.00000');
INSERT INTO `orders` VALUES (129, 399086, 0, 1, 1, '2020-04-10 03:19:13.00000');
INSERT INTO `orders` VALUES (130, 764899, 89, 1, 1, '2020-04-10 03:19:20.00000');
INSERT INTO `orders` VALUES (131, 254341, 89, 1, 1, '2020-04-10 03:19:52.00000');
INSERT INTO `orders` VALUES (132, 531802, 30, 1, 1, '2020-04-10 03:20:27.00000');
INSERT INTO `orders` VALUES (133, 713168, 89, 1, 1, '2020-04-10 03:21:21.00000');
INSERT INTO `orders` VALUES (134, 750791, 89, 1, 1, '2020-04-10 03:22:02.00000');
INSERT INTO `orders` VALUES (135, 869788, 89, 1, 1, '2020-04-10 03:23:50.00000');
INSERT INTO `orders` VALUES (136, 955073, 40, 1, 1, '2020-04-10 03:23:59.00000');
INSERT INTO `orders` VALUES (137, 350208, 89, 1, 1, '2020-04-10 03:24:14.00000');
INSERT INTO `orders` VALUES (138, 466532, 89, 1, 1, '2020-04-10 03:25:53.00000');
INSERT INTO `orders` VALUES (139, 853901, 20, 1, 1, '2020-04-10 03:26:41.00000');
INSERT INTO `orders` VALUES (140, 359980, 178, 1, 1, '2020-04-10 03:27:40.00000');
INSERT INTO `orders` VALUES (141, 748286, 89, 1, 1, '2020-04-10 03:33:12.00000');
INSERT INTO `orders` VALUES (142, 691533, 89, 1, 1, '2020-04-10 03:33:19.00000');
INSERT INTO `orders` VALUES (143, 476620, 30, 1, 1, '2020-04-10 03:33:52.00000');
INSERT INTO `orders` VALUES (144, 641761, 89, 1, 1, '2020-04-10 03:34:05.00000');
INSERT INTO `orders` VALUES (145, 383267, 89, 1, 1, '2020-04-10 03:44:48.00000');
INSERT INTO `orders` VALUES (146, 322745, 100, 1, 1, '2020-04-10 03:45:02.00000');
INSERT INTO `orders` VALUES (147, 249420, 89, 1, 1, '2020-04-10 03:47:23.00000');
INSERT INTO `orders` VALUES (148, 150631, 89, 1, 1, '2020-04-10 03:47:45.00000');
INSERT INTO `orders` VALUES (149, 687609, 89, 1, 1, '2020-04-10 03:47:59.00000');
INSERT INTO `orders` VALUES (150, 764311, 30, 1, 1, '2020-04-10 03:53:48.00000');
INSERT INTO `orders` VALUES (151, 961754, 89, 1, 1, '2020-04-10 04:08:24.00000');
INSERT INTO `orders` VALUES (152, 886242, 40, 1, 1, '2020-04-10 04:08:31.00000');
INSERT INTO `orders` VALUES (153, 615236, 40, 1, 1, '2020-04-10 04:08:36.00000');
INSERT INTO `orders` VALUES (154, 593417, 20, 1, 1, '2020-04-10 04:09:01.00000');
INSERT INTO `orders` VALUES (155, 975997, 89, 1, 1, '2020-04-10 04:44:53.00000');
INSERT INTO `orders` VALUES (156, 649290, 89, 1, 1, '2020-04-10 04:44:56.00000');
INSERT INTO `orders` VALUES (157, 800749, 89, 1, 1, '2020-04-10 04:44:56.00000');
INSERT INTO `orders` VALUES (158, 575265, 89, 1, 1, '2020-04-10 04:44:56.00000');
INSERT INTO `orders` VALUES (159, 869747, 89, 1, 1, '2020-04-10 04:44:56.00000');
INSERT INTO `orders` VALUES (160, 388893, 89, 1, 1, '2020-04-10 04:44:57.00000');
INSERT INTO `orders` VALUES (161, 528442, 89, 1, 1, '2020-04-10 04:44:57.00000');
INSERT INTO `orders` VALUES (162, 910361, 89, 1, 1, '2020-04-10 04:44:57.00000');
INSERT INTO `orders` VALUES (163, 182499, 89, 1, 1, '2020-04-10 04:44:57.00000');
INSERT INTO `orders` VALUES (164, 325751, 89, 1, 1, '2020-04-10 04:44:57.00000');
INSERT INTO `orders` VALUES (165, 993284, 40, 1, 1, '2020-04-10 04:45:10.00000');
INSERT INTO `orders` VALUES (166, 377202, 89, 1, 1, '2020-04-10 04:45:37.00000');
INSERT INTO `orders` VALUES (167, 587788, 89, 1, 1, '2020-04-10 04:48:03.00000');
INSERT INTO `orders` VALUES (168, 264090, 89, 1, 1, '2020-04-10 04:52:17.00000');
INSERT INTO `orders` VALUES (169, 585564, 89, 1, 1, '2020-04-10 04:52:44.00000');
INSERT INTO `orders` VALUES (170, 808376, 89, 1, 1, '2020-04-10 04:54:24.00000');
INSERT INTO `orders` VALUES (171, 102789, 89, 1, 1, '2020-04-11 01:37:02.00000');
INSERT INTO `orders` VALUES (172, 517760, 89, 1, 1, '2020-04-11 01:38:38.00000');
INSERT INTO `orders` VALUES (173, 302262, 89, 1, 1, '2020-04-11 01:38:40.00000');
INSERT INTO `orders` VALUES (174, 441486, 89, 1, 1, '2020-04-11 01:39:40.00000');
INSERT INTO `orders` VALUES (175, 221105, 0, 1, 1, '2020-04-11 01:47:46.00000');
INSERT INTO `orders` VALUES (176, 393947, 89, 1, 1, '2020-04-11 02:15:05.00000');
INSERT INTO `orders` VALUES (177, 933657, 20, 1, 1, '2020-04-11 02:15:16.00000');
INSERT INTO `orders` VALUES (178, 751344, 89, 1, 1, '2020-04-11 02:15:41.00000');
INSERT INTO `orders` VALUES (179, 507831, 89, 1, 1, '2020-04-11 02:15:57.00000');
INSERT INTO `orders` VALUES (181, 913796, 89, 1, 1, '2020-04-11 02:17:33.00000');
INSERT INTO `orders` VALUES (182, 373771, 89, 1, 1, '2020-04-11 02:22:56.00000');
INSERT INTO `orders` VALUES (183, 367818, 108, 1, 1, '2020-04-11 02:23:04.00000');
INSERT INTO `orders` VALUES (184, 711239, 89, 1, 1, '2020-04-11 03:15:16.00000');
INSERT INTO `orders` VALUES (185, 806864, 30, 1, 1, '2020-04-11 03:15:49.00000');
INSERT INTO `orders` VALUES (186, 430789, 0, 1, 1, '2020-04-11 03:15:51.00000');
INSERT INTO `orders` VALUES (187, 989733, 89, 1, 1, '2020-04-11 03:17:34.00000');
INSERT INTO `orders` VALUES (188, 867080, 30, 1, 1, '2020-04-11 03:17:46.00000');
INSERT INTO `orders` VALUES (189, 913636, 89, 1, 1, '2020-04-11 03:19:31.00000');
INSERT INTO `orders` VALUES (190, 959872, 89, 1, 1, '2020-04-11 03:24:31.00000');
INSERT INTO `orders` VALUES (191, 325680, 89, 1, 1, '2020-04-11 03:24:33.00000');
INSERT INTO `orders` VALUES (192, 659591, 129, 1, 1, '2020-04-11 03:24:46.00000');
INSERT INTO `orders` VALUES (193, 364165, 0, 1, 1, '2020-04-11 03:25:23.00000');
INSERT INTO `orders` VALUES (194, 201218, 89, 1, 1, '2020-04-11 03:25:33.00000');
INSERT INTO `orders` VALUES (195, 959244, 0, 1, 1, '2020-04-11 03:25:36.00000');
INSERT INTO `orders` VALUES (196, 687409, 90, 1, 1, '2020-04-11 03:25:44.00000');
INSERT INTO `orders` VALUES (197, 136577, 0, 1, 1, '2020-04-11 03:25:45.00000');
INSERT INTO `orders` VALUES (198, 607985, 40, 1, 1, '2020-04-11 03:26:03.00000');
INSERT INTO `orders` VALUES (199, 939097, 0, 1, 1, '2020-04-11 03:26:05.00000');
INSERT INTO `orders` VALUES (200, 132856, 89, 1, 1, '2020-04-11 03:26:11.00000');
INSERT INTO `orders` VALUES (201, 277226, 0, 1, 1, '2020-04-11 03:26:12.00000');
INSERT INTO `orders` VALUES (202, 689054, 0, 1, 1, '2020-04-11 03:26:18.00000');
INSERT INTO `orders` VALUES (203, 683616, 40, 1, 1, '2020-04-11 03:26:59.00000');
INSERT INTO `orders` VALUES (204, 493652, 89, 1, 1, '2020-04-11 03:27:22.00000');
INSERT INTO `orders` VALUES (205, 586422, 0, 1, 1, '2020-04-11 03:27:29.00000');
INSERT INTO `orders` VALUES (206, 351765, 0, 1, 1, '2020-04-11 03:27:30.00000');
INSERT INTO `orders` VALUES (207, 240554, 123, 1, 1, '2020-04-11 03:27:37.00000');
INSERT INTO `orders` VALUES (208, 764287, 89, 1, 1, '2020-04-11 03:29:11.00000');
INSERT INTO `orders` VALUES (209, 195145, 89, 1, 1, '2020-04-11 03:29:26.00000');
INSERT INTO `orders` VALUES (210, 192494, 89, 1, 1, '2020-04-11 03:30:35.00000');
INSERT INTO `orders` VALUES (211, 606584, 89, 1, 1, '2020-04-11 03:32:13.00000');
INSERT INTO `orders` VALUES (212, 128593, 89, 1, 1, '2020-04-11 03:32:42.00000');
INSERT INTO `orders` VALUES (213, 759559, 40, 1, 1, '2020-04-11 03:33:03.00000');
INSERT INTO `orders` VALUES (214, 413939, 89, 1, 1, '2020-04-11 03:34:13.00000');
INSERT INTO `orders` VALUES (215, 722220, 89, 1, 1, '2020-04-11 03:36:31.00000');
INSERT INTO `orders` VALUES (216, 678626, 20, 1, 1, '2020-04-11 03:37:01.00000');
INSERT INTO `orders` VALUES (217, 783153, 89, 1, 1, '2020-04-11 03:38:45.00000');
INSERT INTO `orders` VALUES (218, 899277, 89, 1, 1, '2020-04-11 03:39:25.00000');
INSERT INTO `orders` VALUES (219, 343107, 89, 1, 1, '2020-04-11 03:39:31.00000');
INSERT INTO `orders` VALUES (220, 745747, 89, 1, 1, '2020-04-11 03:42:26.00000');
INSERT INTO `orders` VALUES (227, 600111, 123, 1, 1, '2020-04-11 03:50:32.00000');
INSERT INTO `orders` VALUES (228, 307457, 20, 1, 1, '2020-04-11 13:28:27.00000');
INSERT INTO `orders` VALUES (229, 299971, 89, 0, 1, '2020-04-11 13:35:28.00000');
INSERT INTO `orders` VALUES (230, 503199, 89, 1, 1, '2020-04-13 12:02:53.00000');
INSERT INTO `orders` VALUES (231, 241893, 89, 1, 1, '2020-04-14 09:40:06.00000');
INSERT INTO `orders` VALUES (232, 303444, 178, 1, 1, '2020-04-14 10:23:36.00000');
INSERT INTO `orders` VALUES (233, 736492, 20, 1, 1, '2020-04-15 16:14:38.00000');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
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
INSERT INTO `role_menu` VALUES (193, 2, 2);
INSERT INTO `role_menu` VALUES (194, 2, 9);
INSERT INTO `role_menu` VALUES (195, 2, 14);
INSERT INTO `role_menu` VALUES (196, 2, 18);
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (32, 5, 3);
INSERT INTO `role_permission` VALUES (33, 3, 2);
INSERT INTO `role_permission` VALUES (37, 6, 1);
INSERT INTO `role_permission` VALUES (38, 6, 2);
INSERT INTO `role_permission` VALUES (39, 6, 3);
INSERT INTO `role_permission` VALUES (40, 1, 1);
INSERT INTO `role_permission` VALUES (41, 1, 2);
INSERT INTO `role_permission` VALUES (42, 1, 3);
INSERT INTO `role_permission` VALUES (52, 2, 1);
INSERT INTO `role_permission` VALUES (53, 2, 2);
INSERT INTO `role_permission` VALUES (54, 2, 3);
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

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
INSERT INTO `role_user` VALUES (102, 19, 1);
INSERT INTO `role_user` VALUES (104, 4, 2);
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
INSERT INTO `user` VALUES (4, '2019324', 'b447a977e31ca3d97440870a3f3313d2', 'wos', '小毛', '5324523333', '女', '354235', '广州', NULL, 1, '8VS1GtAg+pjfg30CPrfJDQ==');
INSERT INTO `user` VALUES (5, '2017312', '795028872802935df458eec4a823c136', 'user', '小狗', '34524', '男', '12313143124', '深圳', NULL, 1, 'cTBecpsZuE09Srfx8tD+qw==');
INSERT INTO `user` VALUES (19, '2017434', '868c4d27bc45f6fef364533c378af2b5', 'admin', 'admin', '123', '男', '12322', '2', NULL, 1, 'JaK/1477KwQVaP8yEhaYOA==');
INSERT INTO `user` VALUES (20, '2020473', '3f0ef1add806f8b2aaa4da58f2dfe23d', 'qwe', '123', '123', '123', '123', '123', NULL, 1, 'DTOu9WD8f2OyxfPwS0fbvg==');
INSERT INTO `user` VALUES (21, '2020846', '3a290c993d9ff1b9f5bd26ee65f36a12', '32', '32', '32', '32', '32', '32', NULL, 1, 'h2IryqxnvcIAVgnsSOpu4Q==');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
