/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 50718
Source Host           : 47.93.101.27:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-07-31 23:22:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `navigation` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认为0，非导航,导航标志',
  `authority_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `authority_mark` varchar(50) NOT NULL COMMENT '权限标识',
  `sort` int(11) DEFAULT NULL COMMENT '用户编号',
  `name` varchar(40) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('0', '1', 'service:edit', '1', '服务指派');
INSERT INTO `authority` VALUES ('0', '2', 'service:insert', '1', '服务创建');
INSERT INTO `authority` VALUES ('0', '3', 'service:delete', '1', '服务销毁');
INSERT INTO `authority` VALUES ('0', '4', 'sale:open', '1', '销售机会开发');
INSERT INTO `authority` VALUES ('0', '5', 'sale:down', '1', '销售机会终止');
INSERT INTO `authority` VALUES ('0', '6', 'sale:edit', '1', '销售机会指派');

-- ----------------------------
-- Table structure for communicate
-- ----------------------------
DROP TABLE IF EXISTS `communicate`;
CREATE TABLE `communicate` (
  `communicate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交往记录编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `dates` date NOT NULL COMMENT '交往日期',
  `address` varchar(35) NOT NULL COMMENT '交往地点',
  `general` varchar(60) NOT NULL COMMENT '概要',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细信息',
  `file` varchar(200) DEFAULT NULL COMMENT '文件',
  PRIMARY KEY (`communicate_id`),
  KEY `FK_COMMUNICATE_CUS` (`customer_id`),
  CONSTRAINT `FK_COMMUNICATE_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communicate
-- ----------------------------
INSERT INTO `communicate` VALUES ('26', '4', '2018-07-31', 'faweg', 'fag', 'faeg', 'afe', 'pages/customer/upload/测试文本1.txt');
INSERT INTO `communicate` VALUES ('27', '4', '2018-07-12', 'faew', 'asefag', 'gasf', 'aewfa', 'pages/customer/upload/测试文本1.txt');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '联系人编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `name` varchar(15) NOT NULL COMMENT '联系人名字',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `job` varchar(17) NOT NULL COMMENT '职位',
  `job_tel` varchar(12) NOT NULL COMMENT '办公电话',
  `calls` varchar(12) DEFAULT NULL COMMENT '称呼',
  `phone` varchar(12) NOT NULL COMMENT '手机',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`contacts_id`),
  KEY `FK_CONTACTS_CUS` (`customer_id`),
  CONSTRAINT `FK_CONTACTS_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=754657 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('754655', '4', 'afa', '男', 'fada', '0168-963536', '', '13414785263', 'afaf');
INSERT INTO `contacts` VALUES ('754656', '4', 'afsdfga', '女', 'faweg', '0168-867452', '', '13464685632', 'fgaew');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `name` varchar(50) DEFAULT NULL COMMENT '公司名字',
  `contacts` varchar(10) NOT NULL COMMENT '联系人',
  `tel` varchar(12) NOT NULL COMMENT '电话',
  `user_id` int(11) NOT NULL COMMENT '用户编号(客户经理)',
  `custcategory_id` int(11) DEFAULT '54' COMMENT '客户分类编号',
  `credit_id` int(11) DEFAULT '6' COMMENT '信用编号(字典)',
  `satisfied_id` int(11) DEFAULT '1' COMMENT '满意度编号(字典)',
  `address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `postal` varchar(20) DEFAULT NULL COMMENT '邮政',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `url` varchar(50) DEFAULT NULL COMMENT '网址',
  `legal_person` varchar(15) DEFAULT NULL COMMENT '法人',
  `license` varchar(30) DEFAULT NULL COMMENT '执照号码',
  `fund` double DEFAULT NULL COMMENT '公司注册资金',
  `turnover` double DEFAULT NULL COMMENT '营业额',
  `bank` varchar(30) DEFAULT NULL COMMENT '银行',
  `bank_number` varchar(30) DEFAULT NULL COMMENT '银行账号',
  `state_tax` varchar(30) DEFAULT NULL COMMENT '国税登记号',
  `land_tax` varchar(30) DEFAULT NULL COMMENT '地税登记号',
  `custfrom_id` int(11) DEFAULT '11' COMMENT '客户来源',
  `changes` int(11) NOT NULL DEFAULT '0' COMMENT '是否他人转移',
  PRIMARY KEY (`customer_id`),
  KEY `FK_CUS_USER` (`user_id`),
  KEY `FK_CUS_WORK_CATE` (`custcategory_id`),
  KEY `FK_CUS_WORK_CRED` (`credit_id`),
  KEY `FK_CUS_WORK_SATI` (`satisfied_id`),
  KEY `FK_CUS_WORK_CUSF` (`custfrom_id`),
  CONSTRAINT `FK_CUS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_CATE` FOREIGN KEY (`custcategory_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_CRED` FOREIGN KEY (`credit_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_CUSF` FOREIGN KEY (`custfrom_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_SATI` FOREIGN KEY (`satisfied_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('4', '淘宝假货有限公司', '张佳慧', '15086133601', '2', '54', '7', '2', 'null', null, null, null, null, null, null, null, null, null, null, null, '11', '0');
INSERT INTO `customer` VALUES ('6', '山峰数码', '张武', '15768494485', '2', '52', '8', '1', null, null, null, null, null, null, null, null, null, null, null, null, '24', '0');
INSERT INTO `customer` VALUES ('9', '龙附地产', '董大龙', '13548798787', '3', '51', '9', '4', null, null, null, null, null, null, null, null, null, null, null, null, '33', '1');
INSERT INTO `customer` VALUES ('26', '昌盛数码', '刘天峰', '17865465464', '2', '53', '7', '4', null, null, null, null, null, null, null, null, null, null, null, null, '15', '0');
INSERT INTO `customer` VALUES ('27', '涵艺服装有限公司', '赵艺涵', '17865465464', '4', '51', '7', '5', null, null, null, null, null, null, null, null, null, null, null, null, '24', '0');
INSERT INTO `customer` VALUES ('30', '金宏有限公司', '吴金宏', '18754654546', '2', '54', '9', '4', null, null, null, null, null, null, null, null, null, null, null, null, '33', '0');
INSERT INTO `customer` VALUES ('56', '鼠哥面包有限公司', '小渣子', '13487548652', '2', '54', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '33', '0');
INSERT INTO `customer` VALUES ('59', '小米抢货有限公司', '喳喳辉', '11400016275', '7', '54', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '119', '0');
INSERT INTO `customer` VALUES ('60', '华为优化有限公司', '喳喳辉', '13898321183', '2', '54', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '119', '0');
INSERT INTO `customer` VALUES ('61', '淘宝假货有限公司', '喳喳辉', '14020912980', '2', '54', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '119', '0');
INSERT INTO `customer` VALUES ('75', '615周杰伦卖唱公司', '喳喳辉', '15426822262', '2', '54', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '119', '0');
INSERT INTO `customer` VALUES ('77', 'fasf', 'fae', '13414852423', '2', '53', '4', '3', 'faf', '525200', 'fax666', 'http://www.wyy.com', 'afaf', '', '500', '1000', '邮政储蓄所', '15263478526', '', '', '24', '0');

-- ----------------------------
-- Table structure for develop
-- ----------------------------
DROP TABLE IF EXISTS `develop`;
CREATE TABLE `develop` (
  `develop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '计划编号',
  `sale_id` int(11) NOT NULL COMMENT '销售机会编号',
  `start_date` datetime NOT NULL COMMENT '开始计划日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束计划日期',
  `content` varchar(60) DEFAULT NULL COMMENT '计划内容',
  `result` varchar(30) DEFAULT NULL COMMENT '执行效果',
  PRIMARY KEY (`develop_id`),
  KEY `FK_DEV_SALE` (`sale_id`),
  CONSTRAINT `FK_DEV_SALE` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of develop
-- ----------------------------
INSERT INTO `develop` VALUES ('2', '2', '2017-04-25 00:00:00', '2017-01-12 00:00:00', '将公司最新产品推销给用户', '客户认为产品价格太高导致失败');
INSERT INTO `develop` VALUES ('17', '106', '2018-07-17 10:19:19', null, '开始工作了', '');
INSERT INTO `develop` VALUES ('18', '104', '2018-07-17 10:19:47', null, '开始干活了', '搞定');
INSERT INTO `develop` VALUES ('20', '106', '2018-07-18 00:00:00', null, '完成更改', null);
INSERT INTO `develop` VALUES ('25', '109', '2018-07-17 14:35:53', null, '姐姐家基金基金基金', null);
INSERT INTO `develop` VALUES ('26', '117', '2018-07-17 15:53:52', null, '开始接触', '接触不良');
INSERT INTO `develop` VALUES ('28', '119', '2018-07-17 22:46:38', null, '接触客户', '斤斤计较');
INSERT INTO `develop` VALUES ('31', '111', '2018-07-17 22:51:32', null, '接触客户', '客户同意采购产品');
INSERT INTO `develop` VALUES ('32', '108', '2018-07-17 23:46:56', null, '接触客户', '等等');
INSERT INTO `develop` VALUES ('33', '127', '2018-07-17 23:53:13', null, '地地道道的', '等等');
INSERT INTO `develop` VALUES ('34', '119', '2018-07-18 01:23:42', null, '地地道道的', '滴答滴答');
INSERT INTO `develop` VALUES ('35', '199', '2018-07-26 10:13:37', null, '到底多大的事', '等等等等等等');
INSERT INTO `develop` VALUES ('37', '107', '2018-07-26 15:30:15', null, 'dddddd', 'sfsfsfsfsf');
INSERT INTO `develop` VALUES ('39', '120', '2018-07-28 20:03:33', null, 'ddddd', 'ddljljljl');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `account` varchar(40) DEFAULT NULL COMMENT '用户',
  `date` datetime DEFAULT NULL COMMENT '修改日期',
  `action` varchar(40) DEFAULT NULL COMMENT '修改地址',
  `explains` varchar(200) DEFAULT NULL COMMENT '修改描述',
  `tel` varchar(20) DEFAULT NULL COMMENT '用户电话'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('xxx', '2018-07-16 14:41:24', 'deal', '中国兴盛', 'ddd');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 14:45:48', 'delService', '进行了删除服务操作!', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 19:53:24', 'delService.action', '进行了删除服务的操作!', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 19:53:28', 'delService.action', '进行了删除服务的操作!', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 19:53:31', 'delService.action', '进行了删除服务的操作!', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 19:53:33', 'delService.action', '进行了删除服务的操作!', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 19:53:42', 'delService.action', '进行了删除服务的操作!', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-16 20:00:48', 'delService.action', 'ddd对服务id为11进行了删除', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-19 10:02:02', 'editService.action', 'ddd对服务id为:17 进行了更新', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-19 10:02:05', 'editService.action', 'ddd对服务id为:18 进行了更新', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-19 10:02:08', 'editService.action', 'ddd对服务id为:16 进行了更新', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-19 10:02:10', 'editService.action', 'ddd对服务id为:20 进行了更新', '12345678911');
INSERT INTO `log` VALUES ('ddd', '2018-07-19 10:02:14', 'editService.action', 'ddd对服务id为:21 进行了更新', '12345678911');
INSERT INTO `log` VALUES ('楚子航', '2018-07-21 10:51:18', 'dodel.action', '楚子航对销售id为:153 进行了删除', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-21 11:07:33', 'dodel.action', '楚子航对销售id为:155 进行了删除', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-21 11:07:37', 'dodel.action', '楚子航对销售id为:154 进行了删除', '13511467831');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-25 11:20:49', 'editService.action', '陈墨瞳对服务id为:25 进行了更新', null);
INSERT INTO `log` VALUES ('ddd', '2018-07-25 11:29:21', 'editService.action', 'ddd对服务id为:33 进行了更新', '12345678914');
INSERT INTO `log` VALUES ('夏弥', '2018-07-25 15:15:49', 'editService.action', '夏弥对服务id为:34 进行了更新', '15713681654');
INSERT INTO `log` VALUES ('ddd', '2018-07-25 19:49:21', 'editService.action', 'ddd对服务id为:15 进行了更新', '12345678914');
INSERT INTO `log` VALUES ('ddd', '2018-07-25 20:30:11', 'editService.action', 'ddd对服务id为:18 进行了更新', '12345678914');
INSERT INTO `log` VALUES ('ddd', '2018-07-25 20:30:23', 'editService.action', 'ddd对服务id为:17 进行了更新', '12345678914');
INSERT INTO `log` VALUES ('楚子航', '2018-07-25 21:33:14', 'dodel.action', '楚子航对销售id为:141 进行了删除', '13511467831');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-26 10:55:11', 'edit.action', '陈墨瞳对销售id为:108 进行了更改', null);
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 13:05:13', 'editService.action', '楚子航对服务id为:35 进行了更新', '13511467831');
INSERT INTO `log` VALUES ('李嘉图', '2018-07-28 13:36:26', 'delService.action', '李嘉图对服务id为:34 进行了删除', '13423534277');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 16:46:23', 'dodel.action', '楚子航对销售id为:207 进行了删除', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 17:02:27', 'edit.action', '楚子航对销售id为:208 进行了更改', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 17:04:31', 'edit.action', '楚子航对销售id为:208 进行了更改', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 17:09:21', 'dodel.action', '楚子航对销售id为:208 进行了删除', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 19:55:57', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 19:56:18', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 19:59:57', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:05:37', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:07:25', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:07:47', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:08:13', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:16:49', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:19:26', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:21:29', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:22:09', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:56:25', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:56:25', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 20:57:14', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('楚子航', '2018-07-28 21:02:07', 'doedit.action', '进行了更新客户的操作!', '13511467831');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-29 17:06:31', 'doeditContacts.action', '进行了更新客户联系人的操作!', '13546781547');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-30 08:48:00', 'delContacts.action', '进行了删除客户联系人的操作!', '13546781547');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-30 14:48:03', 'editService.action', '陈墨瞳对服务id为:43 进行了更新', '13546781547');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-30 14:48:27', 'delService.action', '陈墨瞳对服务id为:43 进行了删除', '13546781547');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-30 14:48:56', 'editService.action', '陈墨瞳对服务id为:44 进行了更新', '13546781547');
INSERT INTO `log` VALUES ('陈墨瞳', '2018-07-30 14:52:28', 'delService.action', '陈墨瞳对服务id为:46 进行了删除', '13546781547');
INSERT INTO `log` VALUES ('楚子航', '2018-07-30 15:13:25', 'editService.action', '楚子航对服务id为:25 进行了更新', '13511467831');
INSERT INTO `log` VALUES ('sale', '2018-07-31 14:33:21', 'delService.action', 'sale对服务id为:47 进行了删除', '13265114255');
INSERT INTO `log` VALUES ('sale', '2018-07-31 14:35:58', 'delService.action', 'sale对服务id为:48 进行了删除', '13265114255');
INSERT INTO `log` VALUES ('customer', '2018-07-31 23:08:50', 'doedit.action', '进行了更新客户的操作!', '15768172275');
INSERT INTO `log` VALUES ('customer', '2018-07-31 23:09:12', 'doedit.action', '进行了更新客户的操作!', '15768172275');

-- ----------------------------
-- Table structure for loss
-- ----------------------------
DROP TABLE IF EXISTS `loss`;
CREATE TABLE `loss` (
  `loss_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户流失表编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `user_id` int(11) NOT NULL COMMENT '处理人员编号',
  `orderdate` date NOT NULL COMMENT '最后订单日期',
  `confirmdate` date DEFAULT NULL COMMENT '确认流失日期',
  `measure` varchar(50) DEFAULT NULL COMMENT '暂缓措施',
  `reason` varchar(50) DEFAULT NULL COMMENT '流失原因',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`loss_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `FK_LOSS_CUS` (`customer_id`),
  KEY `FK_LOSS_USER` (`user_id`),
  CONSTRAINT `FK_LOSS_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_LOSS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loss
-- ----------------------------
INSERT INTO `loss` VALUES ('5', '4', '2', '2017-02-01', null, null, null, '0');
INSERT INTO `loss` VALUES ('7', '6', '2', '2017-11-16', null, null, null, '0');
INSERT INTO `loss` VALUES ('9', '9', '3', '2017-07-18', null, null, null, '0');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详细编号',
  `order_id` int(11) NOT NULL COMMENT '订单编号',
  `product_id` int(11) NOT NULL COMMENT '产品编号',
  `count` int(11) NOT NULL COMMENT '产品数量',
  `total` double NOT NULL COMMENT '总金额',
  PRIMARY KEY (`orderitem_id`),
  KEY `FK_ORDERITEM_ORDER` (`order_id`),
  KEY `FK_ORDERITEM_PRODU` (`product_id`),
  CONSTRAINT `FK_ORDERITEM_ORDER` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ORDERITEM_PRODU` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('76', '16', '10', '1651', '4951349');
INSERT INTO `orderitem` VALUES ('77', '16', '11', '2116', '6345884');
INSERT INTO `orderitem` VALUES ('78', '16', '13', '1651', '11738610');
INSERT INTO `orderitem` VALUES ('79', '16', '15', '1644', '7231956');
INSERT INTO `orderitem` VALUES ('80', '16', '9', '2116', '6699256');
INSERT INTO `orderitem` VALUES ('81', '17', '11', '834', '2501166');
INSERT INTO `orderitem` VALUES ('82', '17', '6', '1696', '5562880');
INSERT INTO `orderitem` VALUES ('83', '17', '9', '1039', '3289474');
INSERT INTO `orderitem` VALUES ('84', '17', '14', '1527', '5801073');
INSERT INTO `orderitem` VALUES ('85', '17', '15', '511', '2247889');
INSERT INTO `orderitem` VALUES ('86', '18', '1', '2478', '15854244');
INSERT INTO `orderitem` VALUES ('87', '18', '8', '1784', '6420616');
INSERT INTO `orderitem` VALUES ('88', '18', '10', '2036', '6105964');
INSERT INTO `orderitem` VALUES ('89', '18', '7', '1571', '8796029');
INSERT INTO `orderitem` VALUES ('90', '18', '5', '2399', '9111402');
INSERT INTO `orderitem` VALUES ('91', '19', '2', '671', '3891129');
INSERT INTO `orderitem` VALUES ('92', '19', '13', '847', '6022170');
INSERT INTO `orderitem` VALUES ('93', '19', '4', '2052', '11694348');
INSERT INTO `orderitem` VALUES ('94', '19', '9', '1898', '6009068');
INSERT INTO `orderitem` VALUES ('95', '19', '12', '2146', '12442508');
INSERT INTO `orderitem` VALUES ('96', '20', '8', '662', '2382538');
INSERT INTO `orderitem` VALUES ('97', '20', '4', '1132', '6451268');
INSERT INTO `orderitem` VALUES ('98', '20', '5', '1003', '3809394');
INSERT INTO `orderitem` VALUES ('99', '20', '2', '1839', '10664361');
INSERT INTO `orderitem` VALUES ('100', '20', '14', '1671', '6348129');
INSERT INTO `orderitem` VALUES ('126', '26', '5', '883', '3353634');
INSERT INTO `orderitem` VALUES ('127', '26', '11', '1312', '3934688');
INSERT INTO `orderitem` VALUES ('128', '26', '10', '1269', '3805731');
INSERT INTO `orderitem` VALUES ('129', '26', '8', '992', '3570208');
INSERT INTO `orderitem` VALUES ('130', '26', '1', '1286', '8227828');
INSERT INTO `orderitem` VALUES ('131', '27', '2', '1460', '8466540');
INSERT INTO `orderitem` VALUES ('132', '27', '9', '1389', '4397574');
INSERT INTO `orderitem` VALUES ('133', '27', '3', '807', '4034193');
INSERT INTO `orderitem` VALUES ('134', '27', '7', '1292', '7233908');
INSERT INTO `orderitem` VALUES ('135', '27', '12', '1741', '10094318');
INSERT INTO `orderitem` VALUES ('136', '28', '11', '1227', '3679773');
INSERT INTO `orderitem` VALUES ('137', '28', '5', '1650', '6266700');
INSERT INTO `orderitem` VALUES ('138', '28', '15', '1580', '6950420');
INSERT INTO `orderitem` VALUES ('139', '28', '14', '1087', '4129513');
INSERT INTO `orderitem` VALUES ('140', '28', '4', '942', '5368458');
INSERT INTO `orderitem` VALUES ('141', '29', '13', '819', '5823090');
INSERT INTO `orderitem` VALUES ('142', '29', '8', '1657', '5963543');
INSERT INTO `orderitem` VALUES ('143', '29', '2', '733', '4250667');
INSERT INTO `orderitem` VALUES ('144', '29', '10', '1926', '5776074');
INSERT INTO `orderitem` VALUES ('145', '29', '4', '1097', '6251803');
INSERT INTO `orderitem` VALUES ('146', '30', '10', '1585', '4753415');
INSERT INTO `orderitem` VALUES ('147', '30', '6', '683', '2240240');
INSERT INTO `orderitem` VALUES ('148', '30', '7', '989', '5537411');
INSERT INTO `orderitem` VALUES ('149', '30', '11', '1559', '4675441');
INSERT INTO `orderitem` VALUES ('150', '30', '1', '1553', '9936094');
INSERT INTO `orderitem` VALUES ('201', '41', '3', '2088', '10437912');
INSERT INTO `orderitem` VALUES ('202', '41', '14', '1136', '4315664');
INSERT INTO `orderitem` VALUES ('203', '41', '4', '1773', '10104327');
INSERT INTO `orderitem` VALUES ('204', '41', '9', '1593', '5043438');
INSERT INTO `orderitem` VALUES ('205', '41', '7', '663', '3712137');
INSERT INTO `orderitem` VALUES ('206', '42', '8', '1411', '5078189');
INSERT INTO `orderitem` VALUES ('207', '42', '2', '531', '3079269');
INSERT INTO `orderitem` VALUES ('208', '42', '6', '1476', '4841280');
INSERT INTO `orderitem` VALUES ('209', '42', '12', '1181', '6847438');
INSERT INTO `orderitem` VALUES ('210', '42', '10', '536', '1607464');
INSERT INTO `orderitem` VALUES ('211', '43', '2', '1370', '7944630');
INSERT INTO `orderitem` VALUES ('212', '43', '12', '1416', '8209968');
INSERT INTO `orderitem` VALUES ('213', '43', '7', '1592', '8913608');
INSERT INTO `orderitem` VALUES ('214', '43', '5', '1738', '6600924');
INSERT INTO `orderitem` VALUES ('215', '43', '11', '2349', '7044651');
INSERT INTO `orderitem` VALUES ('216', '44', '1', '1073', '6865054');
INSERT INTO `orderitem` VALUES ('217', '44', '9', '1765', '5587990');
INSERT INTO `orderitem` VALUES ('218', '44', '14', '1200', '4558800');
INSERT INTO `orderitem` VALUES ('219', '44', '13', '555', '3946050');
INSERT INTO `orderitem` VALUES ('220', '44', '8', '888', '3195912');
INSERT INTO `orderitem` VALUES ('221', '45', '3', '865', '4324135');
INSERT INTO `orderitem` VALUES ('222', '45', '15', '2221', '9770179');
INSERT INTO `orderitem` VALUES ('223', '45', '4', '1528', '8708072');
INSERT INTO `orderitem` VALUES ('224', '45', '5', '752', '2856096');
INSERT INTO `orderitem` VALUES ('225', '45', '10', '1965', '5893035');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL COMMENT '订单编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `address` varchar(30) NOT NULL COMMENT '送货地址',
  `date` datetime NOT NULL COMMENT '签约日期',
  `state` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`order_id`),
  KEY `FK_ORDER_CUS` (`customer_id`),
  CONSTRAINT `FK_ORDER_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('16', '4', '北京市西城区新风街2号天成科技大厦', '2015-06-13 15:18:23', '回款');
INSERT INTO `orders` VALUES ('17', '4', '南京市江宁区104国道万安东路86号', '2016-01-04 15:23:21', '未回款');
INSERT INTO `orders` VALUES ('18', '4', '南京市江宁区高桥工业园润发路59号', '2016-11-26 15:24:11', '回款');
INSERT INTO `orders` VALUES ('19', '4', '南京市玄武区汇景佳园104号', '2017-02-01 15:25:55', '回款');
INSERT INTO `orders` VALUES ('20', '4', '沈阳市和平区南六马路90号', '2016-06-17 15:26:49', '回款');
INSERT INTO `orders` VALUES ('26', '6', '上海市普陀区中宁路128号', '2016-05-31 10:28:31', '回款');
INSERT INTO `orders` VALUES ('27', '6', '上海市浦东新区德堡路38号', '2016-05-16 10:39:44', '回款');
INSERT INTO `orders` VALUES ('28', '6', '上海市宝山区罗店镇富锦路3159号', '2016-12-18 10:28:48', '回款');
INSERT INTO `orders` VALUES ('29', '6', '上海市长宁区空港一路300号', '2017-02-18 10:29:00', '回款');
INSERT INTO `orders` VALUES ('30', '6', '上海市青浦区沪青平公路3938号1号楼', '2017-11-16 10:29:14', '未回款');
INSERT INTO `orders` VALUES ('41', '9', '武汉市洪山区操场西路与西一路交叉口西150米', '2016-02-18 10:32:54', '回款');
INSERT INTO `orders` VALUES ('42', '9', '武汉市武昌区徐家棚街办事处群星城-汇金中心k3-22401', '2016-06-17 10:33:05', '回款');
INSERT INTO `orders` VALUES ('43', '9', '武汉市武昌区武珞路628号亚洲贸易广场B座14层1488', '2016-11-09 10:33:22', '回款');
INSERT INTO `orders` VALUES ('44', '9', '武汉市江汉区新华路186福星国际商会大厦16层1611', '2017-02-18 10:33:35', '回款');
INSERT INTO `orders` VALUES ('45', '9', '武汉市武昌区中南路7中商广场写字楼B座27层2701', '2017-07-18 10:33:48', '回款');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `name` varchar(20) NOT NULL COMMENT '产品名字',
  `type` varchar(10) NOT NULL COMMENT '产品型号',
  `grade` varchar(15) NOT NULL COMMENT '等级/批次',
  `unit` varchar(5) NOT NULL COMMENT '单位',
  `price` double NOT NULL COMMENT '单价',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Apple MacBook Air', 'Core i5', '1', '台', '6398', '8GB内存/128GB闪存 MQD32CH/A');
INSERT INTO `product` VALUES ('2', '武极 i7 8700', 'Surface-i6', '1', '台', '5799', '三合一4256G储存/16G内存');
INSERT INTO `product` VALUES ('3', '联想拯救者R720', 'i5-7300HQ', '1', '台', '4999', '15.6英寸大屏游戏笔记本电脑');
INSERT INTO `product` VALUES ('4', '华硕 灵耀U4000UQ', 'i5-7200U', '1', '台', '5699', '8G 256GSSD 940MX 2G独显');
INSERT INTO `product` VALUES ('5', '荣耀MagicBook', 'i5-8250U', '1', '台', '3798', '8G 256GSSD FHD银色');
INSERT INTO `product` VALUES ('6', '三星 Galaxy A9', 'SM-G8850', '2', '台', '3280', '4GB+64GB版 极夜黑');
INSERT INTO `product` VALUES ('7', 'Apple iPhone 8', 'iPhone 8', '2', '台', '5599', '64GB移动联通电信4G手机');
INSERT INTO `product` VALUES ('8', '一加手机', 'ONEPLUS 6', '2', '台', '3599', '全面屏双摄游戏手机 全网通4G 双卡双待');
INSERT INTO `product` VALUES ('9', '华为 Mate 9', 'LON-AL00', '2', '台', '3166', '6GB+128GB版移动联通电信4G手机 双卡双待');
INSERT INTO `product` VALUES ('10', 'OPPO R15', 'R12', '2', '台', '2999', '全面屏双摄拍照手机 6G+128G 双卡双待');
INSERT INTO `product` VALUES ('11', '奥克斯KFR-35GW', 'BpTYC1+1', '3', '台', '2999', ' 一级能效 变频冷暖 ');
INSERT INTO `product` VALUES ('12', '美的KFR-35GW', 'WDHN8A2', '3', '台', '5798', '1.5匹省电星 二级能效 变频 冷暖');
INSERT INTO `product` VALUES ('13', '海尔KFR-35GW', '21GAA23AU1', '3', '台', '7110', '专利自清洁 智能操控 静音 独立除湿');
INSERT INTO `product` VALUES ('14', '格力KFR-35GW', 'FNhDa-A3', '3', '台', '3799', '变频 品圆 冷暖 壁挂式空调');
INSERT INTO `product` VALUES ('15', '长虹KFR-72LW', 'ZDHIF+A3', '3', '台', '4399', '变频 0.1度控温 立柜式冷暖空调柜机');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(20) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UNI_ROLE_NAME` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '客户经理');
INSERT INTO `role` VALUES ('1', '系统管理员');
INSERT INTO `role` VALUES ('2', '销售经理');
INSERT INTO `role` VALUES ('4', '高管');

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `authority_id` int(11) NOT NULL COMMENT '权限编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  KEY `FK_AUTHORITY_ID` (`authority_id`),
  KEY `FK_ROLE_ID` (`role_id`),
  CONSTRAINT `FK_AUTHORITY_ID` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`authority_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES ('1', '2');
INSERT INTO `role_authority` VALUES ('3', '2');
INSERT INTO `role_authority` VALUES ('4', '3');
INSERT INTO `role_authority` VALUES ('5', '3');
INSERT INTO `role_authority` VALUES ('2', '3');
INSERT INTO `role_authority` VALUES ('1', '1');
INSERT INTO `role_authority` VALUES ('2', '1');
INSERT INTO `role_authority` VALUES ('3', '1');
INSERT INTO `role_authority` VALUES ('4', '1');
INSERT INTO `role_authority` VALUES ('5', '1');
INSERT INTO `role_authority` VALUES ('6', '2');
INSERT INTO `role_authority` VALUES ('6', '1');
INSERT INTO `role_authority` VALUES ('1', '3');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机会编号',
  `customer_name` varchar(50) NOT NULL COMMENT '客户名称',
  `summary` varchar(20) NOT NULL COMMENT '机会概要',
  `source` varchar(20) NOT NULL COMMENT '机会来源',
  `probability` double DEFAULT NULL COMMENT '成功几率',
  `contacts` varchar(10) NOT NULL COMMENT '联系人',
  `tel` varchar(12) NOT NULL COMMENT '电话',
  `description` varchar(50) DEFAULT NULL COMMENT '机会描述',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL COMMENT '服务状态',
  `deal_id` int(11) DEFAULT NULL COMMENT '负责人(用户表)',
  `assign_date` datetime DEFAULT NULL COMMENT '指派时间',
  `state` int(11) NOT NULL COMMENT '开发成功与否',
  PRIMARY KEY (`sale_id`),
  KEY `FK_SALE_CREATE` (`create_id`),
  KEY `FK_SALE_DEAL` (`deal_id`),
  CONSTRAINT `FK_SALE_CREATE` FOREIGN KEY (`create_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALE_DEAL` FOREIGN KEY (`deal_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('2', '蜀国桃园三兄弟集团', '有购买一批空调的意向', '电话沟通', '0.8', '曹梦先生', '13426789946', '有购买一批空调的意向', '5', '2017-04-12 00:00:00', '1', '3', '2017-06-14 00:00:00', '-1');
INSERT INTO `sale` VALUES ('103', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '15138010665', '买买买', '1', '2018-07-16 00:00:00', '1', '10', '2018-07-16 00:00:00', '0');
INSERT INTO `sale` VALUES ('104', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '13588538383', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-16 00:00:00', '-1');
INSERT INTO `sale` VALUES ('105', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.4', '喳喳辉', '15283827909', '买买买', '1', '2018-07-16 00:00:00', '1', '10', '2018-07-16 00:00:00', '0');
INSERT INTO `sale` VALUES ('106', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '13898321183', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-16 00:00:00', '1');
INSERT INTO `sale` VALUES ('107', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '9999999999', '买买买', '5', '2018-07-16 00:00:00', '1', '2', '2018-07-26 02:29:44', '1');
INSERT INTO `sale` VALUES ('108', '615周杰伦卖唱公司', '小组有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '11249141490', '买买买', '1', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('109', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '16218351388', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '-1');
INSERT INTO `sale` VALUES ('110', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '15474612753', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '1');
INSERT INTO `sale` VALUES ('111', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '11116239574', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '1');
INSERT INTO `sale` VALUES ('112', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '14863537702', '买买买', '5', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('113', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '16255320367', '买买买', '1', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('115', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '14840823344', '买买买', '5', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('116', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.8', '喳喳辉', '16333359686', '买买买', '1', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('117', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '16484939662', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '-1');
INSERT INTO `sale` VALUES ('118', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.8', '喳喳辉', '12053360008', '买买买', '2', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '1');
INSERT INTO `sale` VALUES ('119', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.7', '喳喳辉', '14665328258', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '0');
INSERT INTO `sale` VALUES ('120', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '11400016275', '买买买', '2', '2018-07-16 00:00:00', '1', '7', '2018-07-17 00:00:00', '1');
INSERT INTO `sale` VALUES ('121', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.5', '喳喳辉', '11679342664', '买买买', '2', '2018-07-16 00:00:00', '1', '7', '2018-07-17 00:00:00', '0');
INSERT INTO `sale` VALUES ('122', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '12570046680', '买买买', '2', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('125', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '12777151177', '买买买', '5', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '0');
INSERT INTO `sale` VALUES ('127', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '14020912980', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-17 00:00:00', '1');
INSERT INTO `sale` VALUES ('128', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '16539718588', '买买买', '2', '2018-07-16 00:00:00', '1', '2', '2018-07-25 20:58:56', '0');
INSERT INTO `sale` VALUES ('129', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '16252054005', '买买买', '2', '2018-07-16 00:00:00', '1', '10', '2018-07-17 00:00:00', '0');
INSERT INTO `sale` VALUES ('130', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.4', '喳喳辉', '14728253900', '买买买', '1', '2018-07-16 00:00:00', '1', '10', '2018-07-17 00:00:00', '0');
INSERT INTO `sale` VALUES ('131', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '15045158539', '买买买', '1', '2018-07-16 00:00:00', '1', '10', '2018-07-25 21:00:24', '0');
INSERT INTO `sale` VALUES ('132', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.4', '喳喳辉', '12646223666', '买买买', '1', '2018-07-16 00:00:00', '1', '7', '2018-07-25 21:26:32', '0');
INSERT INTO `sale` VALUES ('135', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '15110041700', '买买买', '2', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('136', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.8', '喳喳辉', '15278834025', '买买买', '2', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('137', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '15629733742', '买买买', '2', '2018-07-16 00:00:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('139', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '16207050628', '买买买', '5', '2018-07-16 00:00:00', '1', '7', '2018-07-25 13:57:26', '0');
INSERT INTO `sale` VALUES ('142', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '13899129118', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-20 00:00:00', '0');
INSERT INTO `sale` VALUES ('143', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '14400856725', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-25 21:32:21', '0');
INSERT INTO `sale` VALUES ('145', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '13325936957', '买买买', '1', '2018-07-16 00:00:00', '1', '10', '2018-07-20 00:00:00', '0');
INSERT INTO `sale` VALUES ('148', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.7', '喳喳辉', '13310341842', '买买买', '2', '2018-07-16 00:00:00', '1', '10', '2018-07-20 00:00:00', '0');
INSERT INTO `sale` VALUES ('150', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.5', '喳喳辉', '12113814604', '买买买', '1', '2018-07-16 00:00:00', '1', '7', '2018-07-20 00:00:00', '0');
INSERT INTO `sale` VALUES ('151', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '1', '喳喳辉', '14862643120', '买买买', '2', '2018-07-16 00:00:00', '1', '10', '2018-07-20 00:00:00', '0');
INSERT INTO `sale` VALUES ('152', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '14853130552', '买买买', '1', '2018-07-16 00:00:00', '1', '2', '2018-07-20 00:00:00', '0');
INSERT INTO `sale` VALUES ('157', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '13048629885', '买买买', '2', '2018-07-26 02:33:53', '0', null, null, '0');
INSERT INTO `sale` VALUES ('158', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.6', '喳喳辉', '12086024019', '买买买', '1', '2018-07-26 02:33:53', '0', null, null, '0');
INSERT INTO `sale` VALUES ('159', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.4', '喳喳辉', '13099425776', '买买买', '5', '2018-07-26 02:33:53', '0', null, null, '0');
INSERT INTO `sale` VALUES ('160', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '12462553298', '买买买', '2', '2018-07-26 02:33:54', '0', null, null, '0');
INSERT INTO `sale` VALUES ('161', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.9', '喳喳辉', '14708531429', '买买买', '1', '2018-07-26 02:33:54', '0', null, null, '0');
INSERT INTO `sale` VALUES ('162', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.4', '喳喳辉', '11600524599', '买买买', '2', '2018-07-26 02:33:54', '0', null, null, '0');
INSERT INTO `sale` VALUES ('163', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '15604657342', '买买买', '1', '2018-07-26 02:33:54', '0', null, null, '0');
INSERT INTO `sale` VALUES ('164', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '13808162469', '买买买', '5', '2018-07-26 02:33:54', '0', null, null, '0');
INSERT INTO `sale` VALUES ('165', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '15199955389', '买买买', '5', '2018-07-26 02:33:55', '0', null, null, '0');
INSERT INTO `sale` VALUES ('166', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.7', '喳喳辉', '15895741625', '买买买', '1', '2018-07-26 02:33:55', '0', null, null, '0');
INSERT INTO `sale` VALUES ('167', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '14856335378', '买买买', '1', '2018-07-26 02:33:55', '0', null, null, '0');
INSERT INTO `sale` VALUES ('168', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '13413363757', '买买买', '1', '2018-07-26 02:33:55', '0', null, null, '0');
INSERT INTO `sale` VALUES ('169', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.4', '喳喳辉', '15468664359', '买买买', '1', '2018-07-26 02:33:55', '0', null, null, '0');
INSERT INTO `sale` VALUES ('170', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.4', '喳喳辉', '11405417842', '买买买', '2', '2018-07-26 02:33:56', '0', null, null, '0');
INSERT INTO `sale` VALUES ('171', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.9', '喳喳辉', '15181145214', '买买买', '1', '2018-07-26 02:33:56', '0', null, null, '0');
INSERT INTO `sale` VALUES ('172', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '1', '喳喳辉', '13780410229', '买买买', '2', '2018-07-26 02:33:56', '0', null, null, '0');
INSERT INTO `sale` VALUES ('173', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.5', '喳喳辉', '11079527164', '买买买', '2', '2018-07-26 02:33:56', '0', null, null, '0');
INSERT INTO `sale` VALUES ('174', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '11213535900', '买买买', '2', '2018-07-26 02:33:56', '0', null, null, '0');
INSERT INTO `sale` VALUES ('175', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '14116545394', '买买买', '1', '2018-07-26 02:33:57', '0', null, null, '0');
INSERT INTO `sale` VALUES ('176', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.4', '喳喳辉', '12409349688', '买买买', '5', '2018-07-26 02:33:57', '0', null, null, '0');
INSERT INTO `sale` VALUES ('177', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.5', '喳喳辉', '11824110671', '买买买', '2', '2018-07-26 02:33:57', '0', null, null, '0');
INSERT INTO `sale` VALUES ('178', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.6', '喳喳辉', '11047734778', '买买买', '2', '2018-07-26 02:33:57', '0', null, null, '0');
INSERT INTO `sale` VALUES ('179', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.4', '喳喳辉', '13758951853', '买买买', '2', '2018-07-26 02:33:57', '0', null, null, '0');
INSERT INTO `sale` VALUES ('180', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.8', '喳喳辉', '12470941464', '买买买', '1', '2018-07-26 02:33:57', '0', null, null, '0');
INSERT INTO `sale` VALUES ('181', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.7', '喳喳辉', '13283560127', '买买买', '1', '2018-07-26 02:33:58', '0', null, null, '0');
INSERT INTO `sale` VALUES ('182', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '14718220752', '买买买', '1', '2018-07-26 02:33:58', '0', null, null, '0');
INSERT INTO `sale` VALUES ('183', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.5', '喳喳辉', '11425533621', '买买买', '1', '2018-07-26 02:33:58', '0', null, null, '0');
INSERT INTO `sale` VALUES ('184', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '13393651464', '买买买', '1', '2018-07-26 02:33:58', '0', null, null, '0');
INSERT INTO `sale` VALUES ('185', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '11921328880', '买买买', '1', '2018-07-26 02:33:58', '0', null, null, '0');
INSERT INTO `sale` VALUES ('186', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.8', '喳喳辉', '14099149200', '买买买', '1', '2018-07-26 02:33:59', '0', null, null, '0');
INSERT INTO `sale` VALUES ('187', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.6', '喳喳辉', '15229813061', '买买买', '1', '2018-07-26 02:33:59', '0', null, null, '0');
INSERT INTO `sale` VALUES ('188', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.7', '喳喳辉', '15742334115', '买买买', '1', '2018-07-26 02:33:59', '0', null, null, '0');
INSERT INTO `sale` VALUES ('189', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '13950263751', '买买买', '2', '2018-07-26 02:33:59', '0', null, null, '0');
INSERT INTO `sale` VALUES ('190', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.9', '喳喳辉', '13891711241', '买买买', '1', '2018-07-26 02:33:59', '0', null, null, '0');
INSERT INTO `sale` VALUES ('191', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '15630122197', '买买买', '1', '2018-07-26 02:34:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('192', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.5', '喳喳辉', '14756435386', '买买买', '1', '2018-07-26 02:34:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('193', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '12562623552', '买买买', '2', '2018-07-26 02:34:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('194', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.4', '喳喳辉', '11868059485', '买买买', '2', '2018-07-26 02:34:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('195', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.7', '喳喳辉', '15900444923', '买买买', '5', '2018-07-26 02:34:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('196', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.7', '喳喳辉', '15430153907', '买买买', '5', '2018-07-26 02:34:00', '0', null, null, '0');
INSERT INTO `sale` VALUES ('197', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.9', '喳喳辉', '13255250865', '买买买', '1', '2018-07-26 02:34:01', '1', '2', '2018-07-26 10:20:47', '0');
INSERT INTO `sale` VALUES ('198', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '14555354755', '买买买', '1', '2018-07-26 02:34:01', '0', null, null, '0');
INSERT INTO `sale` VALUES ('199', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.9', '喳喳辉', '15426822262', '买买买', '5', '2018-07-26 02:34:01', '1', '2', '2018-07-26 02:34:48', '1');
INSERT INTO `sale` VALUES ('200', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.4', '喳喳辉', '15988456432', '买买买', '1', '2018-07-26 02:34:01', '0', null, null, '0');
INSERT INTO `sale` VALUES ('201', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '11707918625', '买买买', '1', '2018-07-26 02:34:01', '1', '10', '2018-07-26 02:34:56', '0');
INSERT INTO `sale` VALUES ('202', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '13334017040', '买买买', '2', '2018-07-26 02:34:02', '0', null, null, '0');
INSERT INTO `sale` VALUES ('203', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '12431913006', '买买买', '1', '2018-07-26 02:34:02', '1', '10', '2018-07-28 16:25:24', '0');
INSERT INTO `sale` VALUES ('204', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '15382331203', '买买买', '1', '2018-07-26 02:34:02', '1', '7', '2018-07-26 02:34:35', '0');
INSERT INTO `sale` VALUES ('205', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.5', '喳喳辉', '14126621560', '买买买', '1', '2018-07-26 02:34:02', '0', null, null, '0');
INSERT INTO `sale` VALUES ('206', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '当面商谈', '0.6', '喳喳辉', '14220664478', '买买买', '2', '2018-07-26 02:34:02', '1', '7', '2018-07-30 09:35:05', '0');
INSERT INTO `sale` VALUES ('209', '鼠哥小说有限公司', '小渣子有购入大批小说的想法', '当面商谈', '0.5', '老董', '13456758342', '该客户上门讲诉需求', '2', '2018-07-28 18:16:04', '1', '2', '2018-07-28 18:16:12', '-1');
INSERT INTO `sale` VALUES ('210', '鼠哥面包有限公司', '小董子有购入大批面包做早餐的想法', '客户介绍', '0.5', '小渣子', '13487548652', '该客户提出早上起床晚不想去饭堂，进而想购入大批面包的打算', '2', '2018-07-28 18:23:44', '1', '2', '2018-07-28 18:23:52', '1');
INSERT INTO `sale` VALUES ('211', '校舍有限公司', '的撒旦', '网络沟通', '0.5', '渣', '13265114255', '发生大事', '15', '2018-07-31 01:23:56', '0', null, null, '0');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务编号',
  `servicecategory_id` int(11) NOT NULL COMMENT '服务类型',
  `service_style` int(11) NOT NULL COMMENT '服务方式',
  `summary` varchar(100) NOT NULL COMMENT '服务概要',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `request` varchar(100) DEFAULT NULL COMMENT '服务请求内容',
  `create_id` int(11) NOT NULL COMMENT '创建人',
  `create_date` date NOT NULL COMMENT '创建时间',
  `status_id` int(11) DEFAULT NULL COMMENT '服务状态',
  `principal_id` int(11) DEFAULT NULL COMMENT '分配人',
  `principal_date` date DEFAULT NULL COMMENT '分配时间',
  `deal_content` varchar(200) DEFAULT NULL COMMENT '服务处理内容',
  `deal_id` int(11) DEFAULT NULL COMMENT '负责人',
  `deal_date` date DEFAULT NULL COMMENT '处理时间',
  `result` varchar(100) DEFAULT NULL COMMENT '处理结果',
  `evaluate_id` int(11) DEFAULT NULL COMMENT '评价等级',
  PRIMARY KEY (`service_id`),
  KEY `FK_SERCATE_WORK` (`servicecategory_id`),
  KEY `FK_SERCATE_CUS` (`customer_id`),
  KEY `FK_SERCATE_USER_CRE` (`create_id`),
  KEY `FK_SERCATE_WORK_STAS` (`status_id`),
  KEY `FK_SERCATE_USER_PRI` (`principal_id`),
  KEY `FK_SERCATE_USER_DEA` (`deal_id`),
  KEY `FK_SERCATE_WORK_EVAL` (`evaluate_id`),
  KEY `FK_SERCATE_WORK_STYLES` (`service_style`),
  CONSTRAINT `FK_SERCATE_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_USER_CRE` FOREIGN KEY (`create_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_USER_DEA` FOREIGN KEY (`deal_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_USER_PRI` FOREIGN KEY (`principal_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK` FOREIGN KEY (`servicecategory_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK_EVAL` FOREIGN KEY (`evaluate_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK_STAS` FOREIGN KEY (`status_id`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK_STYLES` FOREIGN KEY (`service_style`) REFERENCES `wordbook` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('41', '59', '66', 'dddddddddddddddddd', '6', 'aaaaaaaaaaaaaaaa', '2', '2018-07-28', '71', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存编号',
  `depository` varchar(20) NOT NULL COMMENT '仓库',
  `stock_position` varchar(20) NOT NULL COMMENT '货位',
  `count` int(11) NOT NULL COMMENT '件数',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', '广州萝岗区第10号仓库', '第5个柜台', '15720', '小心轻放');
INSERT INTO `stock` VALUES ('2', '广州天河区第5号仓库', '第3个柜台', '15734', '小心轻放');
INSERT INTO `stock` VALUES ('3', '广州白云区第13号仓库', '第12个柜台', '1572', '小心轻放');
INSERT INTO `stock` VALUES ('4', '广州中山街第10号仓库', '第15个柜台', '15230', '小心轻放');
INSERT INTO `stock` VALUES ('5', '广州市区第1号仓库', '第1个柜台', '25700', '小心轻放');
INSERT INTO `stock` VALUES ('6', '杭州市富阳区第2号仓库', '第2个柜台', '16443', 'null');
INSERT INTO `stock` VALUES ('7', '杭州市余杭区第13号仓库', '第13个柜台', '1444', 'null');
INSERT INTO `stock` VALUES ('8', '杭州市拱野区第14号仓库', '第14个柜台', '1655', 'null');
INSERT INTO `stock` VALUES ('9', '杭州市柯桥区第17号仓库', '第22个柜台', '165', 'null');
INSERT INTO `stock` VALUES ('10', '杭州市萧山区第23号仓库', '第25个柜台', '16222', 'null');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `account` varchar(20) NOT NULL COMMENT '用户名字',
  `tel` varchar(12) DEFAULT NULL COMMENT '联系方式',
  `head` varchar(190) DEFAULT NULL COMMENT '头像',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_USER_ACCOUNT` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李嘉图', '13423534277', 'statics/uploads/head/head.jpg', '4d81be66826d9e394efb885d097047a2');
INSERT INTO `user` VALUES ('2', '楚子航', '13511467831', 'statics/uploads/head/head.jpg', '6d663ea2c387371588a79f49055f7173');
INSERT INTO `user` VALUES ('3', '苏茜', '13543354375', 'statics/uploads/head/head.jpg', '49a56e0caf6451d7c1bc6d911a8b8eeb');
INSERT INTO `user` VALUES ('4', '陈墨瞳', '13546781547', 'statics/uploads/head/201807/e3bb5ad0fd24464db6f0ab352975aaa4.png', '36b38317d2a5fdc1a43da6c8fa73c3a0');
INSERT INTO `user` VALUES ('5', '夏弥', '15713681654', 'statics/uploads/head/head.jpg', '64b5577e5c326cfe4bdf1fa0b07757ed');
INSERT INTO `user` VALUES ('6', '林动', '16421684165', 'statics/uploads/head/head.jpg', '6d055793f51a0def7a8e6c6630335b7d');
INSERT INTO `user` VALUES ('7', 'ddd', '12345678914', 'statics/uploads/head/head.jpg', '7b6b42be6c44b379888e97cdd2ef0297');
INSERT INTO `user` VALUES ('9', 'ccc', '13265114255', 'statics/uploads/head/head.jpg', '88dbbd5f05868f9fea331917cb2ffcaa');
INSERT INTO `user` VALUES ('10', 'dong', '15016', 'statics/uploads/head/head.jpg', '8180bf522cdc8fc9df953ba82ae8cdc0');
INSERT INTO `user` VALUES ('11', 'admin', '1326511411', 'statics/uploads/head/201807/9d7f2c714f0247fe98372ae407ff096e.', 'b9d11b3be25f5a1a7dc8ca04cd310b28');
INSERT INTO `user` VALUES ('14', 'customer', '15768172275', 'statics/uploads/head/head.jpg', '35a96c31bf5864c4bd842e42b77c284b');
INSERT INTO `user` VALUES ('15', 'sale', '13265114255', 'statics/uploads/head/head.jpg', 'dd7c455682b973f8a04086116123399f');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FK_USERROLE_USER` (`user_id`),
  KEY `FK_USERROLE_ROLE` (`role_id`),
  CONSTRAINT `FK_USERROLE_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USERROLE_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '2');
INSERT INTO `user_role` VALUES ('2', '3');
INSERT INTO `user_role` VALUES ('3', '4');
INSERT INTO `user_role` VALUES ('4', '1');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('6', '4');
INSERT INTO `user_role` VALUES ('7', '3');
INSERT INTO `user_role` VALUES ('10', '3');
INSERT INTO `user_role` VALUES ('9', '1');
INSERT INTO `user_role` VALUES ('11', '1');
INSERT INTO `user_role` VALUES ('14', '3');
INSERT INTO `user_role` VALUES ('15', '2');

-- ----------------------------
-- Table structure for wordbook
-- ----------------------------
DROP TABLE IF EXISTS `wordbook`;
CREATE TABLE `wordbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `category` int(11) NOT NULL COMMENT '类别,其中分类编号为0的记录代表分类信息',
  `title` varchar(20) NOT NULL COMMENT '条目',
  `value` varchar(20) NOT NULL COMMENT '值',
  `editable` varchar(4) NOT NULL COMMENT '是否可编辑',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wordbook
-- ----------------------------
INSERT INTO `wordbook` VALUES ('1', '1', '满意度', '1', '1');
INSERT INTO `wordbook` VALUES ('2', '1', '满意度', '2', '1');
INSERT INTO `wordbook` VALUES ('3', '1', '满意度', '3', '1');
INSERT INTO `wordbook` VALUES ('4', '1', '满意度', '4', '1');
INSERT INTO `wordbook` VALUES ('5', '1', '满意度', '5', '1');
INSERT INTO `wordbook` VALUES ('6', '2', '信用度', '1', '1');
INSERT INTO `wordbook` VALUES ('7', '2', '信用度', '2', '1');
INSERT INTO `wordbook` VALUES ('8', '2', '信用度', '3', '1');
INSERT INTO `wordbook` VALUES ('9', '2', '信用度', '4', '1');
INSERT INTO `wordbook` VALUES ('10', '2', '信用度', '5', '1');
INSERT INTO `wordbook` VALUES ('11', '3', '客户来源', '网络沟通', '0');
INSERT INTO `wordbook` VALUES ('15', '3', '客户来源', '电话沟通', '0');
INSERT INTO `wordbook` VALUES ('24', '3', '客户来源', '客户介绍', '0');
INSERT INTO `wordbook` VALUES ('33', '3', '客户来源', '当面洽谈', '0');
INSERT INTO `wordbook` VALUES ('51', '4', '客户等级', '合作伙伴', '0');
INSERT INTO `wordbook` VALUES ('52', '4', '客户等级', '大客户', '0');
INSERT INTO `wordbook` VALUES ('53', '4', '客户等级', '重点开发客户', '0');
INSERT INTO `wordbook` VALUES ('54', '4', '客户等级', '普通客户', '0');
INSERT INTO `wordbook` VALUES ('55', '4', '客户等级', '战略合作伙伴', '0');
INSERT INTO `wordbook` VALUES ('58', '5', '服务类型', '建议', '1');
INSERT INTO `wordbook` VALUES ('59', '5', '服务类型', '咨询', '1');
INSERT INTO `wordbook` VALUES ('60', '5', '服务类型', '投诉', '1');
INSERT INTO `wordbook` VALUES ('63', '7', '服务方式', '电话服务', '1');
INSERT INTO `wordbook` VALUES ('64', '7', '服务方式', '短信邮箱服务', '1');
INSERT INTO `wordbook` VALUES ('65', '7', '服务方式', '微信QQ服务', '1');
INSERT INTO `wordbook` VALUES ('66', '7', '服务方式', '外网服务', '1');
INSERT INTO `wordbook` VALUES ('71', '6', '服务状态', '新创建', '1');
INSERT INTO `wordbook` VALUES ('72', '6', '服务状态', '已处理', '1');
INSERT INTO `wordbook` VALUES ('73', '6', '服务状态', '已分配', '1');
INSERT INTO `wordbook` VALUES ('74', '6', '服务状态', '已归档', '1');
INSERT INTO `wordbook` VALUES ('75', '0', '服务状态', '6', '1');
INSERT INTO `wordbook` VALUES ('76', '0', '服务方式', '7', '1');
INSERT INTO `wordbook` VALUES ('77', '0', '服务类型', '5', '1');
INSERT INTO `wordbook` VALUES ('78', '0', '客户等级', '4', '0');
INSERT INTO `wordbook` VALUES ('79', '0', '客户来源', '3', '0');
INSERT INTO `wordbook` VALUES ('80', '0', '满意度', '1', '1');
INSERT INTO `wordbook` VALUES ('81', '0', '信用度', '2', '1');
INSERT INTO `wordbook` VALUES ('119', '3', '客户来源', '开发机会获得', '0');
INSERT INTO `wordbook` VALUES ('120', '3', '客户来源', '机会', '0');

-- ----------------------------
-- View structure for custAverage
-- ----------------------------
DROP VIEW IF EXISTS `custAverage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `custAverage` AS select `customer`.`customer_id` AS `customer_id`,`customer`.`name` AS `cus_name`,`orders`.`order_id` AS `order_id`,`orderitem`.`orderitem_id` AS `orderitem_id`,`orderitem`.`count` AS `count`,`orderitem`.`total` AS `total`,`orders`.`date` AS `date`,`orderitem`.`product_id` AS `product_id`,`product`.`name` AS `name` from (((`orderitem` join `orders` on((`orderitem`.`order_id` = `orders`.`order_id`))) join `customer` on((`orders`.`customer_id` = `customer`.`customer_id`))) join `product` on((`orderitem`.`product_id` = `product`.`product_id`))) ;

-- ----------------------------
-- View structure for list_authority
-- ----------------------------
DROP VIEW IF EXISTS `list_authority`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_authority` AS select `authority`.`authority_mark` AS `authority_mark`,`authority`.`sort` AS `sort`,`authority`.`name` AS `name`,`role`.`role_name` AS `role_name`,`role_authority`.`authority_id` AS `authority_id`,`user`.`id` AS `id`,`user_role`.`role_id` AS `role_id`,`user`.`account` AS `account`,`authority`.`navigation` AS `navigation` from ((((`user` left join `user_role` on((`user_role`.`user_id` = `user`.`id`))) left join `role` on((`user_role`.`role_id` = `role`.`role_id`))) left join `role_authority` on((`role_authority`.`role_id` = `role`.`role_id`))) left join `authority` on((`role_authority`.`authority_id` = `authority`.`authority_id`))) ;

-- ----------------------------
-- View structure for sale_info
-- ----------------------------
DROP VIEW IF EXISTS `sale_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sale_info` AS select `s`.`sale_id` AS `sale_id`,`s`.`customer_name` AS `customer_name`,`s`.`summary` AS `summary`,`s`.`source` AS `source`,`s`.`probability` AS `probability`,`s`.`contacts` AS `contacts`,`s`.`tel` AS `tel`,`s`.`description` AS `description`,`s`.`create_id` AS `create_id`,`s`.`create_date` AS `create_date`,`s`.`status` AS `status`,`s`.`deal_id` AS `deal_id`,`s`.`assign_date` AS `assign_date`,`s`.`state` AS `state`,`u1`.`account` AS `create_man`,`u2`.`account` AS `deal_man` from ((`sale` `s` left join `user` `u1` on((`s`.`create_id` = `u1`.`id`))) left join `user` `u2` on((`s`.`deal_id` = `u2`.`id`))) ;

-- ----------------------------
-- View structure for servicevo
-- ----------------------------
DROP VIEW IF EXISTS `servicevo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicevo` AS select `s`.`service_id` AS `service_id`,`s`.`summary` AS `summary`,`s`.`service_style` AS `service_style`,`s`.`servicecategory_id` AS `servicecategory_id`,`s`.`deal_id` AS `deal_id`,`s`.`create_date` AS `create_date`,`s`.`status_id` AS `status_id`,`u`.`account` AS `account`,`c`.`name` AS `name`,`w1`.`value` AS `servicestyle`,`w2`.`value` AS `servicecategory`,`w3`.`value` AS `status` from (((((`service` `s` join `customer` `c`) join `user` `u`) join `wordbook` `w1`) join `wordbook` `w2`) join `wordbook` `w3`) where ((`s`.`create_id` = `u`.`id`) and (`s`.`customer_id` = `c`.`customer_id`) and (`s`.`service_style` = `w1`.`id`) and (`s`.`servicecategory_id` = `w2`.`id`) and (`s`.`status_id` = `w3`.`id`)) ;

-- ----------------------------
-- Procedure structure for evsartwarn_on_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `evsartwarn_on_order`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `evsartwarn_on_order`()
BEGIN
	
	declare var int;
	declare i int;
	declare dat datetime;
	declare ins int;
	declare cusid int;
	declare userid int;
	declare losid int;

	set i=0;
	select count(distinct customer_id) into var from orders;
	while(i<var) do
		select distinct customer_id into cusid from orders limit i,1;
		select user_id into userid from customer where customer_id = cusid;
		select date into dat from orders where customer_id = cusid order by date desc limit 1;
		SELECT TIMESTAMPDIFF(MONTH,dat,now()) into ins;
		if(ins >= 6) then
			select count(loss_id) into losid from loss where customer_id = cusid;
			if(losid = 0) then
				insert into loss(loss_id,customer_id,user_id,orderdate,state) values (0,cusid,userid,dat,0);
			end if;
			commit;
		end if;
		set i = i + 1;
	end while;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertloss
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertloss`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertloss`()
begin
declare d datetime;
declare a long;
declare b long;
declare x long;
set d=(select date from `orders` order by `date` desc limit 1);

set a=date_format(d,'%Y%m');

set b=date_format(now(),'%Y%m');

set x = b - a;
select x;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for money
-- ----------------------------
DROP PROCEDURE IF EXISTS `money`;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `money`()
BEGIN

declare pid int;
declare oiid int;
declare count1 int;
declare price1 DOUBLE ;
declare i int default 1;
while i <= 375
do
set count1 = (select count  from orderitem where orderitem_id = i);
set pid = (select product_id from orderitem where orderitem_id = i);
set oiid = (select orderitem_id from orderitem where orderitem_id = i);
set price1 =(select price from product where product_id = pid);
select pid,oiid,count1,price1,count1*price1;
update orderitem set total = (count1*price1) where orderitem_id = oiid;
COMMIT;
set i = i +1;
end while;

END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for evwarn
-- ----------------------------
DROP EVENT IF EXISTS `evwarn`;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` EVENT `evwarn` ON SCHEDULE EVERY 7 DAY STARTS '2018-07-14 02:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
CALL evsartwarn_on_order();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_on_sale`;
DELIMITER ;;
CREATE TRIGGER `update_on_sale` AFTER UPDATE ON `sale` FOR EACH ROW BEGIN
	if (new.state=1) then
		insert into customer(`customer_id`,`name`,`contacts`,`tel`,`changes`,`user_id`,`custfrom_id`,`custcategory_id`) values (0,new.customer_name,new.contacts,new.tel,0,new.deal_id,119,54);
	end if;
END
;;
DELIMITER ;
