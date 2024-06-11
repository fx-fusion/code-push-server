/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39)
 Source Host           : localhost:3306
 Source Schema         : codepush

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39)
 File Encoding         : 65001

 Date: 12/06/2024 00:36:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apps
-- ----------------------------
DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `os` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `platform` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_use_diff_text` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(12))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apps
-- ----------------------------
BEGIN;
INSERT INTO `apps` (`id`, `name`, `uid`, `os`, `platform`, `is_use_diff_text`, `updated_at`, `created_at`, `deleted_at`) VALUES (1, 'wzcm', 1, 2, 1, 0, '2024-06-11 22:43:11', '2024-06-11 22:43:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for collaborators
-- ----------------------------
DROP TABLE IF EXISTS `collaborators`;
CREATE TABLE `collaborators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `roles` varchar(20) NOT NULL DEFAULT '',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_appid` (`appid`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collaborators
-- ----------------------------
BEGIN;
INSERT INTO `collaborators` (`id`, `appid`, `uid`, `roles`, `updated_at`, `created_at`, `deleted_at`) VALUES (1, 1, 1, 'Owner', '2024-06-11 22:43:11', '2024-06-11 22:43:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for deployments
-- ----------------------------
DROP TABLE IF EXISTS `deployments`;
CREATE TABLE `deployments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `deployment_key` varchar(64) NOT NULL,
  `last_deployment_version_id` int(10) unsigned NOT NULL DEFAULT '0',
  `label_id` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_appid` (`appid`),
  KEY `idx_deploymentkey` (`deployment_key`(40))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deployments
-- ----------------------------
BEGIN;
INSERT INTO `deployments` (`id`, `appid`, `name`, `description`, `deployment_key`, `last_deployment_version_id`, `label_id`, `updated_at`, `created_at`, `deleted_at`) VALUES (1, 1, 'Production', '', '1tPncxPVgGCZeQCu7KaMDafzXgYV4ksvOXqog', 0, 0, '2024-06-12 00:36:03', '2024-06-11 22:43:11', NULL);
INSERT INTO `deployments` (`id`, `appid`, `name`, `description`, `deployment_key`, `last_deployment_version_id`, `label_id`, `updated_at`, `created_at`, `deleted_at`) VALUES (2, 1, 'Staging', '', 'Iwlb2xyGPwujHfgqQLCOsxM7F29V4ksvOXqog', 0, 0, '2024-06-11 22:43:11', '2024-06-11 22:43:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for deployments_history
-- ----------------------------
DROP TABLE IF EXISTS `deployments_history`;
CREATE TABLE `deployments_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deployment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_deployment_id` (`deployment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deployments_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for deployments_versions
-- ----------------------------
DROP TABLE IF EXISTS `deployments_versions`;
CREATE TABLE `deployments_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deployment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `app_version` varchar(100) NOT NULL DEFAULT '',
  `current_package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `min_version` bigint(20) unsigned NOT NULL DEFAULT '0',
  `max_version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_did_minversion` (`deployment_id`,`min_version`),
  KEY `idx_did_maxversion` (`deployment_id`,`max_version`),
  KEY `idx_did_appversion` (`deployment_id`,`app_version`(30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deployments_versions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for log_report_deploy
-- ----------------------------
DROP TABLE IF EXISTS `log_report_deploy`;
CREATE TABLE `log_report_deploy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `client_unique_id` varchar(100) NOT NULL DEFAULT '',
  `previous_label` varchar(20) NOT NULL DEFAULT '',
  `previous_deployment_key` varchar(64) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_report_deploy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for log_report_download
-- ----------------------------
DROP TABLE IF EXISTS `log_report_download`;
CREATE TABLE `log_report_download` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `client_unique_id` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_report_download
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for packages
-- ----------------------------
DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deployment_version_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deployment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL DEFAULT '',
  `package_hash` varchar(64) NOT NULL DEFAULT '',
  `blob_url` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `manifest_blob_url` varchar(255) NOT NULL DEFAULT '',
  `release_method` varchar(20) NOT NULL DEFAULT '',
  `label` varchar(20) NOT NULL DEFAULT '',
  `original_label` varchar(20) NOT NULL DEFAULT '',
  `original_deployment` varchar(20) NOT NULL DEFAULT '',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `released_by` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_mandatory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rollout` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_deploymentid_label` (`deployment_id`,`label`(8)),
  KEY `idx_versions_id` (`deployment_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of packages
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for packages_diff
-- ----------------------------
DROP TABLE IF EXISTS `packages_diff`;
CREATE TABLE `packages_diff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(11) unsigned NOT NULL DEFAULT '0',
  `diff_against_package_hash` varchar(64) NOT NULL DEFAULT '',
  `diff_blob_url` varchar(255) NOT NULL DEFAULT '',
  `diff_size` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_packageid_hash` (`package_id`,`diff_against_package_hash`(40))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of packages_diff
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for packages_metrics
-- ----------------------------
DROP TABLE IF EXISTS `packages_metrics`;
CREATE TABLE `packages_metrics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `active` int(10) unsigned NOT NULL DEFAULT '0',
  `downloaded` int(10) unsigned NOT NULL DEFAULT '0',
  `failed` int(10) unsigned NOT NULL DEFAULT '0',
  `installed` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_packageid` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of packages_metrics
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE `user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `tokens` varchar(64) NOT NULL DEFAULT '',
  `created_by` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `is_session` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_tokens` (`tokens`) KEY_BLOCK_SIZE=16
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_tokens
-- ----------------------------
BEGIN;
INSERT INTO `user_tokens` (`id`, `uid`, `name`, `tokens`, `created_by`, `description`, `is_session`, `expires_at`, `created_at`, `deleted_at`) VALUES (1, 1, 'Login-1718116807121', '4LKxApNPRMKSJbeNx4TPYU11wOPF4ksvOXqog', 'Login-1718116807121', 'Login-1718116807121', 0, '2024-07-11 22:40:07', '2024-06-11 22:40:07', NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `identical` varchar(10) NOT NULL DEFAULT '',
  `ack_code` varchar(10) NOT NULL DEFAULT '',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx_identical` (`identical`),
  KEY `udx_username` (`username`),
  KEY `idx_email` (`email`) KEY_BLOCK_SIZE=20
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `username`, `password`, `email`, `identical`, `ack_code`, `updated_at`, `created_at`) VALUES (1, 'wzcm', '$2a$12$EWbHBufwrzec.3UvLODaju0U5CNjDxhkh.VCTyDI3GiNK79Y.Vmb6', 'wzcm@gmail.com', '4ksvOXqog', 'iwZsp', '2024-06-11 20:59:17', '2016-02-29 21:24:49');
COMMIT;

-- ----------------------------
-- Table structure for versions
-- ----------------------------
DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1.DBversion',
  `version` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of versions
-- ----------------------------
BEGIN;
INSERT INTO `versions` (`id`, `type`, `version`) VALUES (1, 1, '0.5.0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
