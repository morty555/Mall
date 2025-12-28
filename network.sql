/*
 Navicat Premium Dump SQL

 Source Server         : dataset
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : network

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 27/12/2025 22:47:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (4, 4, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (5, 5, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (6, 6, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (7, 6, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (8, 7, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (9, 8, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (10, 9, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (11, 10, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (12, 11, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (13, 12, 53, 'Apple iPad Air', 599.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (14, 13, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (15, 14, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (16, 15, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (17, 16, 56, 'Apple iPhone SE 3', 429.00, 1);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES (18, 17, 56, 'Apple iPhone SE 3', 429.00, 1);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (4, 1, 429.00, 'pending', NULL, '111', '111', '2025-12-10 23:55:58', '2025-12-12 13:44:23');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (5, 1, 429.00, 'pending', NULL, '1111', '1111', '2025-12-11 00:00:45', '2025-12-11 00:00:45');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (6, 1, 1028.00, 'pending', NULL, '1111', '111', '2025-12-17 10:25:33', '2025-12-17 10:25:33');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (7, 1, 599.00, 'pending', NULL, '111', 'home', '2025-12-17 13:45:07', '2025-12-17 14:02:11');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (8, 1, 599.00, 'pending', NULL, '111', 'home', '2025-12-17 13:46:08', '2025-12-17 14:02:12');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (9, 1, 599.00, 'pending', NULL, '111', 'home', '2025-12-17 13:55:26', '2025-12-17 14:02:13');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (10, 1, 599.00, 'pending', NULL, '111', 'home', '2025-12-17 13:56:08', '2025-12-17 14:02:14');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (11, 1, 599.00, 'pending', NULL, '111', '111', '2025-12-17 13:58:32', '2025-12-17 14:02:18');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (12, 1, 599.00, 'pending', NULL, '111', '111', '2025-12-17 14:02:22', '2025-12-17 14:02:29');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (13, 1, 429.00, 'pending', NULL, '1111', '111', '2025-12-17 14:05:31', '2025-12-17 14:05:31');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (14, 1, 429.00, 'pending', NULL, '1111', '111', '2025-12-17 14:07:44', '2025-12-17 14:07:44');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (15, 1, 429.00, 'pending', NULL, '1111', '111', '2025-12-17 14:11:54', '2025-12-17 14:11:54');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (16, 1, 429.00, 'pending', NULL, '1111', '111', '2025-12-17 14:15:20', '2025-12-17 14:15:20');
INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES (17, 1, 429.00, 'pending', NULL, '111', '531', '2025-12-23 21:19:42', '2025-12-23 21:19:42');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `description` text COMMENT '产品描述',
  `image` varchar(255) DEFAULT NULL COMMENT '产品主图URL',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存数量',
  `category_id` bigint unsigned DEFAULT NULL COMMENT '分类ID',
  `specifications` json DEFAULT NULL COMMENT '规格信息JSON',
  `featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐产品(1: 是, 0: 否)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_featured` (`featured`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品表';

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (1, 'Apple iPhone 15', 899.00, 'Latest iPhone with A17 chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 9, 4, NULL, 0, '2025-12-10 20:53:58', '2025-12-24 14:37:11');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (2, 'Samsung Galaxy S23', 699.00, 'High-end Android smartphone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 20:53:58', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (3, 'Dell XPS 13', 999.00, 'Compact and powerful laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 20:53:58', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (4, 'Sony WH-1000XM5', 349.00, 'Noise cancelling headphones', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 20:53:58', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (5, 'Nintendo Switch', 299.00, 'Popular gaming console', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 20:53:58', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (6, 'Apple MacBook Air M2', 1199.00, 'Lightweight laptop with M2 chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (7, 'Samsung Galaxy Tab S9', 649.00, 'High-end Android tablet', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (8, 'Bose QuietComfort 45', 329.00, 'Premium noise cancelling headphones', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (9, 'PlayStation 5', 499.00, 'Next-gen gaming console', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (10, 'HP Spectre x360', 1099.00, 'Convertible laptop with touch screen', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (11, 'Apple iPad Pro', 799.00, 'Powerful tablet with M2 chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (12, 'Logitech MX Master 3', 99.00, 'Advanced wireless mouse', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (13, 'Canon EOS R6', 2499.00, 'Full-frame mirrorless camera', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (14, 'Samsung Galaxy Buds Pro', 199.00, 'True wireless earbuds', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (15, 'Microsoft Surface Pro 9', 899.00, '2-in-1 detachable tablet', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (16, 'Apple Watch Series 9', 399.00, 'Latest Apple smartwatch', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (17, 'Sony A7 IV', 2499.00, 'Full-frame mirrorless camera', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (18, 'Dell Alienware m15', 1499.00, 'Gaming laptop with high-end GPU', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (19, 'Nintendo Switch OLED', 349.00, 'Switch with OLED screen', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (20, 'Apple AirPods Pro 2', 249.00, 'Noise cancelling wireless earbuds', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (21, 'Samsung Galaxy Watch 6', 299.00, 'Advanced Android smartwatch', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (22, 'Razer Blade 15', 1799.00, 'High-performance gaming laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (23, 'Sony WF-1000XM4', 279.00, 'Premium true wireless earbuds', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (24, 'Apple HomePod mini', 99.00, 'Smart speaker with Siri', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (25, 'Kindle Paperwhite', 149.00, 'E-reader with built-in light', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (26, 'GoPro HERO11', 499.00, 'Action camera with 5.3K video', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (27, 'Samsung Galaxy Z Fold 5', 1799.00, 'Foldable Android phone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (28, 'Apple Mac Mini M2', 699.00, 'Compact desktop with M2 chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (29, 'Logitech C920 Webcam', 79.00, 'HD streaming webcam', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (30, 'Sony SRS-XB33', 149.00, 'Portable Bluetooth speaker', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (31, 'Nintendo Switch Lite', 199.00, 'Compact handheld gaming console', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (32, 'Apple iMac 24', 1299.00, 'All-in-one desktop with M1 chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (33, 'Samsung Odyssey G9', 1399.00, 'Ultra-wide gaming monitor', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (34, 'Canon EOS R5', 3899.00, 'High-end mirrorless camera', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (35, 'Apple Magic Keyboard', 99.00, 'Wireless keyboard for Mac', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (36, 'Dell UltraSharp U2723Q', 499.00, '27-inch 4K monitor', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (37, 'Roku Streaming Stick 4K', 49.00, 'HD/4K streaming device', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (38, 'Samsung T7 SSD 1TB', 129.00, 'Portable external SSD', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (39, 'Apple Pencil 2', 129.00, 'Stylus for iPad', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (40, 'Bose SoundLink Revolve', 199.00, 'Portable Bluetooth speaker', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (41, 'Microsoft Xbox Series X', 499.00, 'Next-gen gaming console', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (42, 'Apple iPhone 15 Pro', 999.00, 'High-end iPhone with A17 Pro chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (43, 'Samsung Galaxy S23 Ultra', 1199.00, 'Flagship Android smartphone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (44, 'Sony WH-1000XM5 Black', 349.00, 'Noise cancelling headphones', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (45, 'Dell XPS 15', 1299.00, 'High-performance laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (46, 'Apple MacBook Pro 14', 1999.00, 'Laptop with M2 Pro chip', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (47, 'Samsung Galaxy Buds2 Pro', 229.00, 'Premium wireless earbuds', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (48, 'PlayStation 5 Digital Edition', 399.00, 'Next-gen console without disc', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (49, 'Canon EOS R3', 5499.00, 'Professional mirrorless camera', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (50, 'Apple AirTag', 29.00, 'Item tracker', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (51, 'Sony Xperia 1 V', 999.00, 'High-end Android phone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (52, 'Nintendo Switch Animal Crossing', 349.00, 'Special edition console', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (53, 'Apple iPad Air', 599.00, 'Lightweight tablet', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 17, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-17 14:02:22');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (54, 'Samsung Galaxy Watch 6 Classic', 349.00, 'Premium smartwatch', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (55, 'Logitech G502 Hero', 79.00, 'Gaming mouse', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (56, 'Apple iPhone SE 3', 429.00, 'Compact iPhone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 18, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-23 21:19:42');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (57, 'Bose QuietComfort Earbuds', 279.00, 'Noise cancelling earbuds', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (58, 'Dell Inspiron 16', 899.00, 'Everyday laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (59, 'Apple MacBook Air M1', 999.00, 'Lightweight MacBook with M1', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (60, 'Samsung Galaxy Tab S8', 599.00, 'Android tablet', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (61, 'Sony HT-A7000', 1299.00, 'Premium soundbar', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (62, 'Nintendo Switch OLED Neon', 349.00, 'Switch OLED Neon Edition', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (63, 'Apple Watch Ultra', 799.00, 'High-end smartwatch', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (64, 'Razer Naga X', 99.00, 'Gaming mouse', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (65, 'Canon RF 50mm F1.2', 2299.00, 'Professional lens', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (66, 'Samsung Odyssey G7', 699.00, 'Curved gaming monitor', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (67, 'Apple iPad Mini', 499.00, 'Compact tablet', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (68, 'Logitech StreamCam', 169.00, 'HD streaming camera', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (69, 'Sony WF-C500', 99.00, 'Wireless earbuds', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 3, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (70, 'HP Omen 16', 1399.00, 'Gaming laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (71, 'Apple AirPods Max', 549.00, 'Over-ear wireless headphones', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (72, 'Samsung Galaxy A54', 449.00, 'Mid-range Android smartphone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (73, 'Dell Latitude 7440', 1199.00, 'Business laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (74, 'Apple Mac Studio', 1999.00, 'Powerful desktop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (75, 'Sony WH-XB910N', 199.00, 'Extra Bass headphones', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (76, 'Nintendo Switch Sports', 299.00, 'Fitness game bundle', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (77, 'Apple iPhone 14', 699.00, 'Previous generation iPhone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (78, 'Samsung Galaxy Note 20', 849.00, 'Large screen smartphone', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (79, 'Dell G15', 1099.00, 'Gaming laptop', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (80, 'Sony SRS-XB23', 99.00, 'Portable Bluetooth speaker', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (81, 'Apple iPad 10', 449.00, 'Latest iPad', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (82, 'Samsung Galaxy Tab A8', 229.00, 'Affordable Android tablet', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 2, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (83, 'Apple Watch Series 8', 399.00, 'Smartwatch with fitness features', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 5, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (84, 'Logitech K780', 79.00, 'Multi-device keyboard', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (85, 'Canon EOS 6D Mark II', 1499.00, 'Full-frame DSLR', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 4, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `stock`, `category_id`, `specifications`, `featured`, `created_at`, `updated_at`) VALUES (86, 'Sony A6400', 899.00, 'Mirrorless camera', 'https://ts4.tc.mm.bing.net/th/id/OIP-C.OZEWv-DlclJI9AFeFEDDjgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3', 10, 1, NULL, 0, '2025-12-10 22:11:37', '2025-12-10 23:04:39');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_username` (`username`),
  UNIQUE KEY `ux_email` (`email`),
  KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (1, 'morty', 'e10adc3949ba59abbe56e057f20f883e', '1650550685@qq.com', NULL, 1, '2025-12-10 11:17:11', '2025-12-10 11:17:11');
COMMIT;

-- ----------------------------
-- Procedure structure for generate_products
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate_products`;
delimiter ;;
CREATE PROCEDURE `generate_products`()
BEGIN
  DECLARE i INT DEFAULT 11;
  WHILE i <= 1000 DO
    INSERT INTO products (title, description, price, image) VALUES (
      CONCAT('商品 ', i),
      CONCAT('这是商品 ', i, ' 的描述，适合购物。'),
      ROUND( RAND() * 3000 + 50, 2),
      CONCAT('https://picsum.photos/seed/', i, '/400/300')
    );
    SET i = i + 1;
  END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
