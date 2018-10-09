/*
Navicat MySQL Data Transfer

Source Server         : aliyun3306
Source Server Version : 50718
Source Host           : 47.93.101.27:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-07-19 00:37:41
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '1', 'pages/sale/salelist.jsp', '1', '销售机会管理');
INSERT INTO `authority` VALUES ('1', '2', 'pages/sale/develop_mysale.jsp', '1', '客户开发计划');
INSERT INTO `authority` VALUES ('1', '3', 'pages/customer/listCustomer.jsp', '2', '客户查看');
INSERT INTO `authority` VALUES ('1', '4', 'pages/service/listService.jsp', '3', '服务查看');
INSERT INTO `authority` VALUES ('1', '5', 'pages/service/dealService.jsp', '3', '服务处理');
INSERT INTO `authority` VALUES ('1', '6', 'pages/service/onFileService.jsp', '3', '服务归档');
INSERT INTO `authority` VALUES ('1', '7', 'pages/log/listLog.jsp', '4', '日志查看');

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
  `remark` varchar(12) DEFAULT NULL COMMENT '备注',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细信息',
  `file` varchar(60) DEFAULT NULL COMMENT '文件',
  PRIMARY KEY (`communicate_id`),
  KEY `FK_COMMUNICATE_CUS` (`customer_id`),
  CONSTRAINT `FK_COMMUNICATE_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communicate
-- ----------------------------
INSERT INTO `communicate` VALUES ('1', '1', '2016-10-12', '广州萝岗区火村苏菲咖啡店', '项目合作签订协议意向', '', '经过协商最终签订了合同', '');
INSERT INTO `communicate` VALUES ('2', '1', '2016-11-12', '公司', '邀请到公司参观', null, null, '/file/234.pdf');
INSERT INTO `communicate` VALUES ('3', '2', '2017-05-12', '广州市城中村米提茶馆', '有关城中村的手机发展', null, null, '/file/124.png');
INSERT INTO `communicate` VALUES ('4', '2', '2016-12-12', '公司', '2018年中国市场的手机行业展望座谈会', null, null, '/file/ewe');

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
  CONSTRAINT `FK_CONTACTS_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=754650 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('154684', '2', '木宸', '男', '高管', '0668-6666666', '先生', '15762748867', 'null');
INSERT INTO `contacts` VALUES ('463545', '1', '张斐', '男', '客户经理', '0168-8888888', '', '13762742367', '备注');
INSERT INTO `contacts` VALUES ('546165', '2', '罗璃', '女', '高管', '0668-6666662', '小姐', '15762748862', 'null');
INSERT INTO `contacts` VALUES ('754646', '1', '刘贝', '女', '销售经理', '0168-6666666', '小姐', '13862742362', 'null');

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
  `custcategory_id` int(11) DEFAULT NULL COMMENT '客户分类编号',
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
  `custfrom_id` int(11) DEFAULT NULL COMMENT '客户来源',
  `changes` int(11) NOT NULL DEFAULT '0' COMMENT '是否他人转移',
  PRIMARY KEY (`customer_id`),
  KEY `FK_CUS_USER` (`user_id`),
  KEY `FK_CUS_WORK_CATE` (`custcategory_id`),
  KEY `FK_CUS_WORK_CRED` (`credit_id`),
  KEY `FK_CUS_WORK_SATI` (`satisfied_id`),
  KEY `FK_CUS_WORK_CUSF` (`custfrom_id`),
  CONSTRAINT `FK_CUS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_CATE` FOREIGN KEY (`custcategory_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_CRED` FOREIGN KEY (`credit_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_CUSF` FOREIGN KEY (`custfrom_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CUS_WORK_SATI` FOREIGN KEY (`satisfied_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '广东英特尔股份有限公司', '肖艳', '13748618846', '2', '52', '7', '4', '广州市黄埔铺科峰路108号', '000000', '86-519-85125379', 'www.entel.com', '张权旦', 'null', '6000000', '2500000', '中国工商银行', '620162154', 'null', 'null', '41', '1');
INSERT INTO `customer` VALUES ('2', '浙江大华技术股份有限公司', '林东', '15768474498', '3', '51', '8', '4', '杭州市富阳区33号三新大厦', '000000', '86 545-85987452', 'http://www.dahua.com', '吴亮', 'null', '8000000', '7500000', '中国农业银行', '16131621345', 'null', 'null', '12', '1');
INSERT INTO `customer` VALUES ('3', '关东长运有限公司', '张莉', '13547954845', '7', '53', '9', '4', '广州白云山区开源街5号', '510000', '86 135-15646465', 'www.guandong.com', '莫言', 'null', '54100000', '98213000', '中国建设银行', '45668754646', null, null, '34', '0');
INSERT INTO `customer` VALUES ('4', '淘宝假货有限公司', '张佳慧', '15086133601', '2', '54', '7', '2', null, null, null, null, null, null, null, null, null, null, null, null, '11', '0');
INSERT INTO `customer` VALUES ('5', '鼠哥薯条有限公司', '喳喳辉', '12414358998', '7', '51', '6', '5', null, null, null, null, null, null, null, null, null, null, null, null, '13', '0');
INSERT INTO `customer` VALUES ('6', '山峰数码', '张武', '15768494485', '2', '52', '8', '1', null, null, null, null, null, null, null, null, null, null, null, null, '24', '0');
INSERT INTO `customer` VALUES ('7', '管阀缝纫', '刘明', '15679875466', '7', '54', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '22', '1');
INSERT INTO `customer` VALUES ('8', '扬国服饮食产业', '叶非凡', '13478797879', '7', '53', '8', '5', null, null, null, null, null, null, null, null, null, null, null, null, '31', '0');
INSERT INTO `customer` VALUES ('9', '龙附地产', '董大龙', '13548798787', '3', '51', '9', '4', null, null, null, null, null, null, null, null, null, null, null, null, '33', '1');
INSERT INTO `customer` VALUES ('10', '华威手机', '吴玉莹', '17854646535', '7', '53', '10', '2', null, null, null, null, null, null, null, null, null, null, null, null, '35', '0');
INSERT INTO `customer` VALUES ('11', '华为优化有限公司', '喳喳辉', '13898321183', '2', '54', '8', '4', null, null, null, null, null, null, null, null, null, null, null, null, '41', '0');
INSERT INTO `customer` VALUES ('12', '鼠哥薯条有限公司', '喳喳辉', '13588538383', '2', '52', '10', '2', null, null, null, null, null, null, null, null, null, null, null, null, '43', '0');
INSERT INTO `customer` VALUES ('13', '鼠哥薯条有限公司', '喳喳辉', '13588538383', '2', '53', '7', '4', null, null, null, null, null, null, null, null, null, null, null, null, '22', '0');
INSERT INTO `customer` VALUES ('14', '鼠哥薯条有限公司', '喳喳辉', '13588538383', '2', '52', '8', '1', null, null, null, null, null, null, null, null, null, null, null, null, '13', '0');
INSERT INTO `customer` VALUES ('15', '京东二手有限公司', '喳喳辉', '15474612753', '2', '51', '9', '5', null, null, null, null, null, null, null, null, null, null, null, null, '25', '0');
INSERT INTO `customer` VALUES ('16', '华为优化有限公司', '喳喳辉', '11116239574', '2', '51', '9', '5', null, null, null, null, null, null, null, null, null, null, null, null, '25', '0');
INSERT INTO `customer` VALUES ('17', '淘宝假货有限公司', '喳喳辉', '14020912980', '2', '51', '9', '5', null, null, null, null, null, null, null, null, null, null, null, null, '25', '0');
INSERT INTO `customer` VALUES ('18', '魅族洗牌有限公司', '喳喳辉', '12053360008', '2', '51', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '25', '0');
INSERT INTO `customer` VALUES ('19', '酷奇山药', '李明', '13454643213', '7', '53', '6', '3', null, null, null, null, null, null, null, null, null, null, null, null, '35', '0');
INSERT INTO `customer` VALUES ('20', '农夫山泉', '张大全', '15765488448', '3', '54', '6', '2', null, null, null, null, null, null, null, null, null, null, null, null, '34', '0');
INSERT INTO `customer` VALUES ('21', '三海经服务有限公司', '龙奥', '17846849849', '3', '51', '7', '4', null, null, null, null, null, null, null, null, null, null, null, null, '43', '0');
INSERT INTO `customer` VALUES ('22', '天南地产', '李天南', '18765464654', '7', '52', '9', '5', null, null, null, null, null, null, null, null, null, null, null, null, '42', '0');
INSERT INTO `customer` VALUES ('23', '紫府酒家', '陈丽', '15946548354', '2', '51', '10', '5', null, null, null, null, null, null, null, null, null, null, null, null, '12', '0');
INSERT INTO `customer` VALUES ('24', '江南药业', '百起', '16754683465', '3', '52', '7', '3', null, null, null, null, null, null, null, null, null, null, null, null, '13', '0');
INSERT INTO `customer` VALUES ('25', '旺利有限公司', '李华', '15746546865', '3', '53', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, '45', '0');
INSERT INTO `customer` VALUES ('26', '昌盛数码', '刘天峰', '17865465464', '2', '53', '7', '4', null, null, null, null, null, null, null, null, null, null, null, null, '15', '0');
INSERT INTO `customer` VALUES ('27', '涵艺服装有限公司', '赵艺涵', '17865465464', '4', '51', '7', '5', null, null, null, null, null, null, null, null, null, null, null, null, '24', '0');
INSERT INTO `customer` VALUES ('28', '立法南有限公司', '孙法', '14868498465', '2', '54', '6', '5', null, null, null, null, null, null, null, null, null, null, null, null, '25', '0');
INSERT INTO `customer` VALUES ('29', '龙能集团', '龙家能', '13464654894', '7', '52', '9', '5', null, null, null, null, null, null, null, null, null, null, null, null, '34', '0');
INSERT INTO `customer` VALUES ('30', '金宏有限公司', '吴金宏', '18754654546', '2', '54', '9', '4', null, null, null, null, null, null, null, null, null, null, null, null, '33', '0');

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
  CONSTRAINT `FK_DEV_SALE` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `account` varchar(40) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `explains` varchar(200) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL
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
  CONSTRAINT `FK_LOSS_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_LOSS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loss
-- ----------------------------
INSERT INTO `loss` VALUES ('1', '1', '1', '2000-10-09', '0000-00-00', null, null, '0');
INSERT INTO `loss` VALUES ('2', '2', '5', '2016-12-30', '0000-00-00', '与客户当面交谈', '客户公司厂址迁移', '0');
INSERT INTO `loss` VALUES ('3', '3', '7', '2017-10-19', null, null, null, '0');

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
  CONSTRAINT `FK_ORDERITEM_ORDER` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ORDERITEM_PRODU` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '1', '1050', '6717900');
INSERT INTO `orderitem` VALUES ('2', '1', '3', '340', '1699660');
INSERT INTO `orderitem` VALUES ('3', '1', '4', '1440', '8206560');
INSERT INTO `orderitem` VALUES ('4', '1', '5', '4', '15192');
INSERT INTO `orderitem` VALUES ('5', '1', '6', '4543', '14901040');
INSERT INTO `orderitem` VALUES ('6', '2', '2', '14564', '84456636');
INSERT INTO `orderitem` VALUES ('7', '2', '5', '136', '516528');
INSERT INTO `orderitem` VALUES ('8', '2', '7', '4646', '26012954');
INSERT INTO `orderitem` VALUES ('9', '2', '8', '1364', '4909036');
INSERT INTO `orderitem` VALUES ('10', '2', '3', '1164', '5818836');
INSERT INTO `orderitem` VALUES ('11', '3', '1', '4450', '28471100');
INSERT INTO `orderitem` VALUES ('12', '3', '3', '21301', '106483699');
INSERT INTO `orderitem` VALUES ('13', '3', '4', '1340', '7636660');
INSERT INTO `orderitem` VALUES ('14', '3', '6', '15420', '50577600');
INSERT INTO `orderitem` VALUES ('15', '3', '7', '1445', '8090555');
INSERT INTO `orderitem` VALUES ('16', '4', '7', '1000', '5599000');
INSERT INTO `orderitem` VALUES ('17', '4', '8', '1200', '4318800');
INSERT INTO `orderitem` VALUES ('18', '4', '9', '1510', '4780660');
INSERT INTO `orderitem` VALUES ('19', '4', '6', '120', '393600');
INSERT INTO `orderitem` VALUES ('20', '4', '10', '1233', '3697767');
INSERT INTO `orderitem` VALUES ('21', '5', '1', '1400', '8957200');
INSERT INTO `orderitem` VALUES ('22', '5', '2', '1288', '7469112');
INSERT INTO `orderitem` VALUES ('23', '5', '3', '1755', '8773245');
INSERT INTO `orderitem` VALUES ('24', '5', '5', '1244', '4724712');
INSERT INTO `orderitem` VALUES ('25', '5', '7', '1500', '8398500');
INSERT INTO `orderitem` VALUES ('26', '5', '8', '1722', '6197478');
INSERT INTO `orderitem` VALUES ('27', '6', '11', '1766', '5296234');
INSERT INTO `orderitem` VALUES ('28', '6', '13', '4520', '32137200');
INSERT INTO `orderitem` VALUES ('29', '6', '12', '1230', '7131540');
INSERT INTO `orderitem` VALUES ('30', '6', '14', '1357', '5155243');
INSERT INTO `orderitem` VALUES ('31', '6', '11', '1574', '4720426');
INSERT INTO `orderitem` VALUES ('32', '6', '15', '17221', '75755179');
INSERT INTO `orderitem` VALUES ('33', '7', '5', '2100', '7975800');
INSERT INTO `orderitem` VALUES ('34', '7', '6', '131', '6810000');
INSERT INTO `orderitem` VALUES ('35', '7', '1', '1116', '7546040');
INSERT INTO `orderitem` VALUES ('36', '7', '2', '156', '1640000');
INSERT INTO `orderitem` VALUES ('37', '7', '1', '6464', '12548000');
INSERT INTO `orderitem` VALUES ('38', '7', '3', '1516', '464600');
INSERT INTO `orderitem` VALUES ('39', '8', '4', '444', '6465490');
INSERT INTO `orderitem` VALUES ('40', '8', '6', '3165', '4654812');
INSERT INTO `orderitem` VALUES ('41', '8', '8', '15165', '9689400');
INSERT INTO `orderitem` VALUES ('42', '8', '7', '1111', '54968200');
INSERT INTO `orderitem` VALUES ('43', '8', '4', '11650', '498489');
INSERT INTO `orderitem` VALUES ('44', '9', '1', '164', '316516');
INSERT INTO `orderitem` VALUES ('45', '9', '5', '1654', '9165160');
INSERT INTO `orderitem` VALUES ('46', '9', '7', '13516', '4668870');
INSERT INTO `orderitem` VALUES ('47', '9', '10', '1313', '6465100');
INSERT INTO `orderitem` VALUES ('48', '9', '12', '2165', '646540');
INSERT INTO `orderitem` VALUES ('49', '10', '11', '1112', '46548');
INSERT INTO `orderitem` VALUES ('50', '10', '15', '1651', '1654600');
INSERT INTO `orderitem` VALUES ('51', '10', '10', '2116', '4654800');
INSERT INTO `orderitem` VALUES ('52', '10', '1', '1213', '646654');
INSERT INTO `orderitem` VALUES ('53', '10', '9', '168', '1656410');
INSERT INTO `orderitem` VALUES ('54', '10', '7', '1651', '646600');
INSERT INTO `orderitem` VALUES ('55', '11', '14', '164', '468200');
INSERT INTO `orderitem` VALUES ('56', '11', '2', '654', '46541');
INSERT INTO `orderitem` VALUES ('57', '11', '8', '1616', '654877');
INSERT INTO `orderitem` VALUES ('58', '11', '7', '8745', '1656411');
INSERT INTO `orderitem` VALUES ('59', '11', '6', '854', '645448');
INSERT INTO `orderitem` VALUES ('60', '12', '7', '612', '615672');
INSERT INTO `orderitem` VALUES ('61', '12', '9', '951', '16554');
INSERT INTO `orderitem` VALUES ('62', '12', '10', '745', '165700');
INSERT INTO `orderitem` VALUES ('63', '12', '12', '164', '65462');
INSERT INTO `orderitem` VALUES ('64', '12', '2', '1644', '416510');
INSERT INTO `orderitem` VALUES ('65', '12', '3', '1158', '1516711');

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
  CONSTRAINT `FK_ORDER_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '广州中山街357号', '2016-02-09 13:15:12', '回款');
INSERT INTO `orders` VALUES ('2', '1', '广州萝岗区15号', '2016-06-22 15:12:12', '回款');
INSERT INTO `orders` VALUES ('3', '1', '广州白云山区开源街576号', '2017-10-15 12:11:12', '未回款');
INSERT INTO `orders` VALUES ('4', '1', '杭州市富阳区134号', '2018-03-01 12:45:55', '回款');
INSERT INTO `orders` VALUES ('5', '2', '杭州市下城区杭州大厦', '2016-03-16 14:45:55', '回款');
INSERT INTO `orders` VALUES ('6', '2', '杭州上城区定安路第14号', '2017-04-01 20:45:37', '回款');
INSERT INTO `orders` VALUES ('7', '2', '杭州市上城区西湖大道米苏咖啡馆', '2017-11-20 12:12:12', '回款');
INSERT INTO `orders` VALUES ('8', '2', '广州天河区天府路15号', '2018-01-11 16:44:13', '未回款');
INSERT INTO `orders` VALUES ('9', '2', '广东沙河市蓝白街长管14号', '2018-06-01 11:17:48', '未回款');
INSERT INTO `orders` VALUES ('10', '3', '广东茂名市化州林晨书店', '2016-12-21 10:41:58', '回款');
INSERT INTO `orders` VALUES ('11', '3', '北京市长城区安云路15号', '2017-05-01 10:44:17', '回款');
INSERT INTO `orders` VALUES ('12', '3', '上海市静安区阜阳区44号', '2017-11-01 10:45:59', '回款');
INSERT INTO `orders` VALUES ('13', '3', '广东深圳市上城区天府路明轩书店', '2017-11-22 10:47:22', '未回款');
INSERT INTO `orders` VALUES ('14', '3', '广东湛江市赤坎区京康路15号', '2018-03-01 10:48:48', '回款');
INSERT INTO `orders` VALUES ('15', '4', '湖南省长沙市开罗区上阳街1号', '2014-12-15 10:50:27', '回款');
INSERT INTO `orders` VALUES ('16', '4', '北京市西城区新风街2号天成科技大厦', '2015-06-13 15:18:23', '回款');
INSERT INTO `orders` VALUES ('17', '4', '南京市江宁区104国道万安东路86号', '2016-01-04 15:23:21', '未回款');
INSERT INTO `orders` VALUES ('18', '4', '南京市江宁区高桥工业园润发路59号', '2016-11-26 15:24:11', '回款');
INSERT INTO `orders` VALUES ('19', '4', '南京市玄武区汇景佳园104号', '2017-02-01 15:25:55', '回款');
INSERT INTO `orders` VALUES ('20', '5', '沈阳市和平区南六马路90号', '2016-06-17 15:26:49', '回款');
INSERT INTO `orders` VALUES ('21', '5', '上海市上城区云桥南路13号', '2017-04-01 10:26:44', '回款');
INSERT INTO `orders` VALUES ('22', '5', '北京市西城区德外新风街3号\r\n', '2015-11-18 10:27:30', '回款');
INSERT INTO `orders` VALUES ('23', '5', '北京市海淀区北清路68号院用友软件园中区10号楼', '2016-05-23 10:27:44', '回款');
INSERT INTO `orders` VALUES ('24', '5', '北京市昌平区昌平科技园区昌盛路18号', '2016-09-24 10:27:56', '回款');
INSERT INTO `orders` VALUES ('25', '6', '北京市海淀区丹棱街3中国电子大厦5层', '2016-01-01 10:28:12', '回款');
INSERT INTO `orders` VALUES ('26', '6', '上海市普陀区中宁路128号', '2016-05-31 10:28:31', '回款');
INSERT INTO `orders` VALUES ('28', '6', '上海市宝山区罗店镇富锦路3159号', '2016-12-18 10:28:48', '回款');
INSERT INTO `orders` VALUES ('29', '6', '上海市长宁区空港一路300号', '2017-02-18 10:29:00', '回款');
INSERT INTO `orders` VALUES ('30', '6', '上海市青浦区沪青平公路3938号1号楼', '2017-11-16 10:29:14', '未回款');
INSERT INTO `orders` VALUES ('31', '7', '南京市江宁区七彩路商业区B区', '2015-01-18 10:29:46', '回款');
INSERT INTO `orders` VALUES ('32', '7', '南京市江宁区众彩物流B区121-122号', '2015-05-18 10:30:06', '回款');
INSERT INTO `orders` VALUES ('33', '7', '南京市江宁区东麒路68号附近', '2015-11-16 10:31:16', '未回款');
INSERT INTO `orders` VALUES ('34', '7', '南京市江宁区七彩路与虹彩路16号', '2016-04-18 10:31:26', '回款');
INSERT INTO `orders` VALUES ('35', '7', '南京市玄武区小卫街218号6号楼2楼', '2016-10-18 10:31:36', '回款');
INSERT INTO `orders` VALUES ('36', '8', '沈阳市大东区东茂路43号农业银行', '2018-07-18 10:31:54', '回款');
INSERT INTO `orders` VALUES ('37', '8', '沈阳市沈北新区辉山农业高新技术开发区佳阳路18号', '2016-01-18 10:32:05', '回款');
INSERT INTO `orders` VALUES ('38', '8', '沈阳市浑南区市浑南区沈阳棋盘山风景名胜区内', '2016-05-18 10:32:16', '回款');
INSERT INTO `orders` VALUES ('39', '8', '沈阳市沈河区小西路375号附近', '2016-10-18 10:32:30', '回款');
INSERT INTO `orders` VALUES ('40', '8', '沈阳市皇姑区宁山中路1号', '2017-02-18 10:32:43', '未回款');
INSERT INTO `orders` VALUES ('41', '9', '武汉市洪山区操场西路与西一路交叉口西150米', '2016-02-18 10:32:54', '回款');
INSERT INTO `orders` VALUES ('42', '9', '武汉市武昌区徐家棚街办事处群星城-汇金中心k3-22401', '2016-06-17 10:33:05', '回款');
INSERT INTO `orders` VALUES ('43', '9', '武汉市武昌区武珞路628号亚洲贸易广场B座14层1488', '2016-11-09 10:33:22', '回款');
INSERT INTO `orders` VALUES ('44', '9', '武汉市江汉区新华路186福星国际商会大厦16层1611', '2017-02-18 10:33:35', '回款');
INSERT INTO `orders` VALUES ('45', '9', '武汉市武昌区中南路7中商广场写字楼B座27层2701', '2017-07-18 10:33:48', '回款');
INSERT INTO `orders` VALUES ('46', '10', '上海市浦东新区青云路14号', '2017-01-18 10:34:01', '回款');
INSERT INTO `orders` VALUES ('47', '10', '上海市浦东新区长运街俯瞰路15号', '2017-04-14 10:34:20', '回款');
INSERT INTO `orders` VALUES ('48', '10', '上海市浦东新区德堡路38号', '2017-09-18 10:34:31', '回款');
INSERT INTO `orders` VALUES ('49', '10', '上海市浦东新区福翰路名扬街16号', '2017-12-28 10:34:41', '回款');
INSERT INTO `orders` VALUES ('50', '10', '上海市宝山区罗店镇富锦路39号', '2018-01-05 10:34:52', '未回款');
INSERT INTO `orders` VALUES ('51', '11', '北京市海淀区北清路68号院用友软件园三期16C4层', '2017-01-11 10:35:02', '回款');
INSERT INTO `orders` VALUES ('52', '11', '北京市海淀区北清路68号用友软件园中区9号楼', '2017-05-01 10:35:14', '回款');
INSERT INTO `orders` VALUES ('53', '11', '北京市海淀区北清路68号院用友软件园北区17号楼3层', '2017-08-05 10:35:23', '回款');
INSERT INTO `orders` VALUES ('54', '11', '北京市朝阳区酒仙桥北路甲10号电子城IT产业园107楼6层', '2017-12-18 10:35:32', '回款');
INSERT INTO `orders` VALUES ('55', '11', '北京市昌平区昌盛路18号CEC中国电子基地B1座', '2018-01-04 10:35:46', '未回款');
INSERT INTO `orders` VALUES ('56', '12', '南京市玄武区小卫街218号6号楼2楼', '2016-01-18 10:35:56', '回款');
INSERT INTO `orders` VALUES ('57', '12', '南京市江宁区104国道万安东路86号', '2017-04-18 10:36:13', '回款');
INSERT INTO `orders` VALUES ('58', '12', '南京市江宁区高桥工业园润发路59号', '2017-07-07 10:36:26', '回款');
INSERT INTO `orders` VALUES ('59', '12', '南京市栖霞区燕尧路100号', '2017-11-12 10:36:35', '回款');
INSERT INTO `orders` VALUES ('60', '12', '南京市玄武区汇景佳园104号', '2018-01-09 10:36:47', '未回款');

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
  CONSTRAINT `FK_AUTHORITY_ID` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`authority_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES ('1', '2');
INSERT INTO `role_authority` VALUES ('4', '2');
INSERT INTO `role_authority` VALUES ('2', '3');
INSERT INTO `role_authority` VALUES ('1', '3');
INSERT INTO `role_authority` VALUES ('3', '3');
INSERT INTO `role_authority` VALUES ('4', '3');
INSERT INTO `role_authority` VALUES ('5', '3');
INSERT INTO `role_authority` VALUES ('6', '3');
INSERT INTO `role_authority` VALUES ('7', '2');
INSERT INTO `role_authority` VALUES ('7', '3');

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
  `create_date` date NOT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL COMMENT '服务状态',
  `deal_id` int(11) DEFAULT NULL COMMENT '负责人(用户表)',
  `assign_date` date DEFAULT NULL COMMENT '指派时间',
  `state` int(11) NOT NULL COMMENT '开发成功与否',
  PRIMARY KEY (`sale_id`),
  KEY `FK_SALE_CREATE` (`create_id`),
  KEY `FK_SALE_DEAL` (`deal_id`),
  CONSTRAINT `FK_SALE_CREATE` FOREIGN KEY (`create_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SALE_DEAL` FOREIGN KEY (`deal_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('2', '蜀国桃园三兄弟集团', '有购买一批空调的意向', '电话沟通', '0.8', '曹梦先生', '13426789946', '有购买一批空调的意向', '5', '2017-04-12', '1', '3', '2017-06-14', '-1');
INSERT INTO `sale` VALUES ('103', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '15138010665', '买买买', '1', '2018-07-16', '1', '10', '2018-07-16', '0');
INSERT INTO `sale` VALUES ('104', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.6', '喳喳辉', '13588538383', '买买买', '3', '2018-07-16', '1', '2', '2018-07-16', '-1');
INSERT INTO `sale` VALUES ('105', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.4', '喳喳辉', '15283827909', '买买买', '4', '2018-07-16', '1', '10', '2018-07-16', '0');
INSERT INTO `sale` VALUES ('106', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '13898321183', '买买买', '4', '2018-07-16', '1', '2', '2018-07-16', '1');
INSERT INTO `sale` VALUES ('107', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '13632840484', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('108', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '11249141490', '买买买', '4', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('109', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.6', '喳喳辉', '16218351388', '买买买', '3', '2018-07-16', '1', '2', '2018-07-17', '-1');
INSERT INTO `sale` VALUES ('110', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '15474612753', '买买买', '1', '2018-07-16', '1', '2', '2018-07-17', '1');
INSERT INTO `sale` VALUES ('111', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '11116239574', '买买买', '1', '2018-07-16', '1', '2', '2018-07-17', '1');
INSERT INTO `sale` VALUES ('112', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '14863537702', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('113', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '16255320367', '买买买', '3', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('114', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '1', '喳喳辉', '14260760923', '买买买', '2', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('115', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '14840823344', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('116', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.8', '喳喳辉', '16333359686', '买买买', '3', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('117', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '16484939662', '买买买', '1', '2018-07-16', '1', '2', '2018-07-17', '-1');
INSERT INTO `sale` VALUES ('118', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.8', '喳喳辉', '12053360008', '买买买', '6', '2018-07-16', '1', '2', '2018-07-17', '1');
INSERT INTO `sale` VALUES ('119', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.7', '喳喳辉', '14665328258', '买买买', '4', '2018-07-16', '1', '2', '2018-07-17', '0');
INSERT INTO `sale` VALUES ('120', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '11400016275', '买买买', '6', '2018-07-16', '1', '7', '2018-07-17', '0');
INSERT INTO `sale` VALUES ('121', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.5', '喳喳辉', '11679342664', '买买买', '6', '2018-07-16', '1', '7', '2018-07-17', '0');
INSERT INTO `sale` VALUES ('122', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '12570046680', '买买买', '6', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('123', '魅族洗牌有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.7', '喳喳辉', '13605650586', '买买买', '6', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('124', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.6', '喳喳辉', '11414764748', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('125', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '12777151177', '买买买', '5', '2018-07-16', '1', '2', '2018-07-17', '0');
INSERT INTO `sale` VALUES ('126', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.8', '喳喳辉', '11238859257', '买买买', '3', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('127', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '14020912980', '买买买', '3', '2018-07-16', '1', '2', '2018-07-17', '1');
INSERT INTO `sale` VALUES ('128', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.6', '喳喳辉', '16539718588', '买买买', '2', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('129', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '16252054005', '买买买', '6', '2018-07-16', '1', '10', '2018-07-17', '0');
INSERT INTO `sale` VALUES ('130', '华为优化有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.4', '喳喳辉', '14728253900', '买买买', '1', '2018-07-16', '1', '10', '2018-07-17', '0');
INSERT INTO `sale` VALUES ('131', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '15045158539', '买买买', '1', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('132', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.4', '喳喳辉', '12646223666', '买买买', '3', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('133', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.4', '喳喳辉', '12654941556', '买买买', '1', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('134', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.8', '喳喳辉', '15875361880', '买买买', '4', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('135', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '15110041700', '买买买', '2', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('136', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.8', '喳喳辉', '15278834025', '买买买', '2', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('137', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '15629733742', '买买买', '2', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('138', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.7', '喳喳辉', '12035751842', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('139', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.6', '喳喳辉', '16207050628', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('140', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.9', '喳喳辉', '13761442809', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('141', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.5', '喳喳辉', '11370425314', '买买买', '1', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('142', '淘宝假货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.5', '喳喳辉', '13899129118', '买买买', '4', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('143', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.9', '喳喳辉', '14400856725', '买买买', '1', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('144', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.7', '喳喳辉', '14030554438', '买买买', '6', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('145', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.6', '喳喳辉', '13325936957', '买买买', '1', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('146', '京东二手有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.4', '喳喳辉', '16308547890', '买买买', '5', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('147', '老巫在线卖唱公司', '小渣子有购入大批量薯条的想法', '网络沟通', '0.4', '喳喳辉', '13944130928', '买买买', '3', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('148', '鼠哥薯条有限公司', '小渣子有购入大批量薯条的想法', '电话沟通', '0.7', '喳喳辉', '13310341842', '买买买', '6', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('149', 'CEO制造器有限公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.5', '喳喳辉', '16079017812', '买买买', '4', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('150', '美帝联想有限公司', '小渣子有购入大批量薯条的想法', '当面洽谈', '0.5', '喳喳辉', '12113814604', '买买买', '4', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('151', '小米抢货有限公司', '小渣子有购入大批量薯条的想法', '网络沟通', '1', '喳喳辉', '14862643120', '买买买', '2', '2018-07-16', '0', null, null, '0');
INSERT INTO `sale` VALUES ('152', '615周杰伦卖唱公司', '小渣子有购入大批量薯条的想法', '客户介绍', '0.7', '喳喳辉', '14853130552', '买买买', '4', '2018-07-16', '0', null, null, '0');

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
  CONSTRAINT `FK_SERCATE_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_USER_CRE` FOREIGN KEY (`create_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_USER_DEA` FOREIGN KEY (`deal_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_USER_PRI` FOREIGN KEY (`principal_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK` FOREIGN KEY (`servicecategory_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK_EVAL` FOREIGN KEY (`evaluate_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK_STAS` FOREIGN KEY (`status_id`) REFERENCES `wordbook` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SERCATE_WORK_STYLES` FOREIGN KEY (`service_style`) REFERENCES `wordbook` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('12', '58', '64', '大萨达撒多', '1', '大萨达', '1', '2018-07-06', '72', '1', null, '大萨达撒多', '2', '2018-07-12', null, null);
INSERT INTO `service` VALUES ('15', '58', '63', '大萨达撒多', '2', '大额', '1', '2018-07-06', '73', '7', null, null, '7', null, null, null);
INSERT INTO `service` VALUES ('16', '59', '66', '大萨达', '2', '大萨达', '1', '2018-07-12', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('17', '59', '63', '的撒旦', '5', '大撒大撒', '7', '2018-07-12', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('18', '58', '63', '大撒大撒大撒', '3', '的撒大苏打', '7', '2018-07-03', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('19', '58', '63', 'dsadsa', '1', 'dasda', '1', '2018-07-05', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('20', '58', '63', 'dsad', '1', 'dsad', '7', '2018-07-06', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('21', '58', '63', 'dsadas', '1', 'dsad', '7', '2018-07-07', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('22', '58', '63', 'dsadasd', '1', 'dsadasd', '7', '2018-07-07', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('23', '58', '63', 'dsadas', '1', 'dsadasd', '7', '2018-07-07', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('24', '60', '66', 'qqqqqqqqqqqqqqqqq', '1', 'qqqqqqqqqqqqqqqqqqqq', '7', '2018-07-06', '71', null, null, null, null, null, null, null);
INSERT INTO `service` VALUES ('25', '59', '65', 'qqqqqqqqqqqq', '1', 'qqqqqqqqqqqqqqq', '7', '2018-07-07', '71', null, null, null, null, null, null, null);

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
  `head` varchar(20) DEFAULT NULL COMMENT '头像',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_USER_ACCOUNT` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李嘉图', '13423534277', '/head/000.jpg', '4d81be66826d9e394efb885d097047a2');
INSERT INTO `user` VALUES ('2', '楚子航', '13511467831', '/head/111.jpg', '6d663ea2c387371588a79f49055f7173');
INSERT INTO `user` VALUES ('3', '苏茜', '13543354375', '/head/222.jpg', '49a56e0caf6451d7c1bc6d911a8b8eeb');
INSERT INTO `user` VALUES ('4', '陈墨瞳', '13546781546', '/head/333.jpg', '36b38317d2a5fdc1a43da6c8fa73c3a0');
INSERT INTO `user` VALUES ('5', '夏弥', '15713681654', '/head/444.jpg', '64b5577e5c326cfe4bdf1fa0b07757ed');
INSERT INTO `user` VALUES ('6', '林动', '16421684165', '/head/555.jpg', '6d055793f51a0def7a8e6c6630335b7d');
INSERT INTO `user` VALUES ('7', 'ddd', '12345678911', null, '7b6b42be6c44b379888e97cdd2ef0297');
INSERT INTO `user` VALUES ('9', 'ccc', '13265114255', null, '88dbbd5f05868f9fea331917cb2ffcaa');
INSERT INTO `user` VALUES ('10', 'dong', '15016627424', null, '8180bf522cdc8fc9df953ba82ae8cdc0');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FK_USERROLE_USER` (`user_id`),
  KEY `FK_USERROLE_ROLE` (`role_id`),
  CONSTRAINT `FK_USERROLE_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_USERROLE_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
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
INSERT INTO `user_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for wordbook
-- ----------------------------
DROP TABLE IF EXISTS `wordbook`;
CREATE TABLE `wordbook` (
  `id` int(11) NOT NULL COMMENT '类型编号',
  `category` int(11) NOT NULL COMMENT '类别,其中分类编号为65535的记录代表分类信息',
  `title` varchar(20) NOT NULL COMMENT '条目',
  `value` varchar(20) NOT NULL COMMENT '值',
  `editable` varchar(4) NOT NULL COMMENT '是否可编辑',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wordbook
-- ----------------------------
INSERT INTO `wordbook` VALUES ('0', '2', '信用度', 'ddd', '1');
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
INSERT INTO `wordbook` VALUES ('12', '3', '客户来源', '网络沟通', '0');
INSERT INTO `wordbook` VALUES ('13', '3', '客户来源', '网络沟通', '0');
INSERT INTO `wordbook` VALUES ('14', '3', '客户来源', '网络沟通', '0');
INSERT INTO `wordbook` VALUES ('15', '3', '客户来源', '电话沟通', '0');
INSERT INTO `wordbook` VALUES ('21', '3', '客户来源', '电话沟通', '0');
INSERT INTO `wordbook` VALUES ('22', '3', '客户来源', '电话沟通', '0');
INSERT INTO `wordbook` VALUES ('23', '3', '客户来源', '电话沟通', '0');
INSERT INTO `wordbook` VALUES ('24', '3', '客户来源', '客户介绍', '0');
INSERT INTO `wordbook` VALUES ('25', '3', '客户来源', '客户介绍', '0');
INSERT INTO `wordbook` VALUES ('31', '3', '客户来源', '客户介绍', '0');
INSERT INTO `wordbook` VALUES ('32', '3', '客户来源', '客户介绍', '0');
INSERT INTO `wordbook` VALUES ('33', '3', '客户来源', '当面洽谈', '0');
INSERT INTO `wordbook` VALUES ('34', '3', '客户来源', '当面洽谈', '0');
INSERT INTO `wordbook` VALUES ('35', '3', '客户来源', '当面洽谈', '0');
INSERT INTO `wordbook` VALUES ('41', '3', '客户来源', '当面洽谈', '0');
INSERT INTO `wordbook` VALUES ('42', '3', '客户来源', '当面洽谈', '0');
INSERT INTO `wordbook` VALUES ('43', '3', '客户来源', '客户介绍', '0');
INSERT INTO `wordbook` VALUES ('44', '3', '客户来源', '电话沟通', '0');
INSERT INTO `wordbook` VALUES ('45', '3', '客户来源', '网络沟通', '0');
INSERT INTO `wordbook` VALUES ('51', '4', '客户等级', '合作伙伴', '0');
INSERT INTO `wordbook` VALUES ('52', '4', '客户等级', '大客户', '0');
INSERT INTO `wordbook` VALUES ('53', '4', '客户等级', '重点开发客户', '0');
INSERT INTO `wordbook` VALUES ('54', '4', '客户等级', '普通客户', '0');
INSERT INTO `wordbook` VALUES ('55', '4', '客户等级', '战略合作伙伴', '1');
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
INSERT INTO `wordbook` VALUES ('75', '65535', '服务状态', '6', '1');
INSERT INTO `wordbook` VALUES ('76', '65535', '服务方式', '7', '1');
INSERT INTO `wordbook` VALUES ('77', '65535', '服务类型', '5', '1');
INSERT INTO `wordbook` VALUES ('78', '65535', '客户等级', '4', '0');
INSERT INTO `wordbook` VALUES ('79', '65535', '客户来源', '3', '0');
INSERT INTO `wordbook` VALUES ('80', '65535', '满意度', '1', '1');
INSERT INTO `wordbook` VALUES ('81', '65535', '信用度', '2', '1');

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
while i <= 32
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
		insert into customer(`customer_id`,`name`,`contacts`,`tel`,`changes`,`user_id`) values (0,new.customer_name,new.contacts,new.tel,0,new.deal_id);
	end if;
END
;;
DELIMITER ;
