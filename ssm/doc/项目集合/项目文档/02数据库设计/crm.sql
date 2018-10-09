/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2018-07-13 03:07:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `authority_mark` varchar(50) NOT NULL COMMENT '权限标识',
  `sort` int(11) DEFAULT NULL COMMENT '用户编号',
  `name` varchar(40) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '/1111.action', '1', '服务创建');
INSERT INTO `authority` VALUES ('2', '/112.action', '2', '销售计划');
INSERT INTO `authority` VALUES ('3', '/1231.action', '3', '客户管理');
INSERT INTO `authority` VALUES ('4', '/321312.action', '4', '字典管理');

-- ----------------------------
-- Table structure for communicate
-- ----------------------------
DROP TABLE IF EXISTS `communicate`;
CREATE TABLE `communicate` (
  `communicate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交往记录编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `date` date NOT NULL COMMENT '交往日期',
  `address` varchar(35) NOT NULL COMMENT '交往地点',
  `general` varchar(60) NOT NULL COMMENT '概要',
  `remark` varchar(12) DEFAULT NULL COMMENT '备注',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细信息',
  `file` varchar(60) DEFAULT NULL COMMENT '文件',
  PRIMARY KEY (`communicate_id`),
  KEY `FK_COMMUNICATE_CUS` (`customer_id`),
  CONSTRAINT `FK_COMMUNICATE_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communicate
-- ----------------------------
INSERT INTO `communicate` VALUES ('1', '1', '2016-10-12', '广州萝岗区火村苏菲咖啡店', '项目合作签订协议意向', null, null, '/file/123');
INSERT INTO `communicate` VALUES ('2', '1', '2016-11-12', '公司', '邀请到公司参观', null, null, '/file/234.pdf');
INSERT INTO `communicate` VALUES ('3', '2', '2017-05-12', '广州市城中村米提茶馆', '有关城中村的手机发展', null, null, '/file/124.png');
INSERT INTO `communicate` VALUES ('4', '2', '2016-12-12', '公司', '2018年中国市场的手机行业展望座谈会', null, null, '/file/ewe');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `contacts_id` int(11) NOT NULL COMMENT '联系人编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `name` varchar(15) NOT NULL COMMENT '联系人名字',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `job` varchar(17) NOT NULL COMMENT '职位',
  `job_tel` varchar(12) NOT NULL COMMENT '办公电话',
  `call` varchar(12) DEFAULT NULL COMMENT '称呼',
  `phone` varchar(12) NOT NULL COMMENT '手机',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`contacts_id`),
  KEY `FK_CONTACTS_CUS` (`customer_id`),
  CONSTRAINT `FK_CONTACTS_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('154684', '2', '木宸', '男', '高管', '0668-6666666', '先生', '15762748867', 'null');
INSERT INTO `contacts` VALUES ('463545', '1', '张斐', '男', '客户经理', '0168-8888888', '先生', '13762742367', 'null');
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
  `custcategory_id` int(11) NOT NULL COMMENT '客户分类编号',
  `credit_id` int(11) NOT NULL COMMENT '信用编号(字典)',
  `satisfied_id` int(11) NOT NULL COMMENT '满意度编号(字典)',
  `address` varchar(50) NOT NULL COMMENT '公司地址',
  `postal` varchar(20) NOT NULL COMMENT '邮政',
  `fax` varchar(20) NOT NULL COMMENT '传真',
  `url` varchar(50) NOT NULL COMMENT '网址',
  `legal_person` varchar(15) NOT NULL COMMENT '法人',
  `license` varchar(30) DEFAULT NULL COMMENT '执照号码',
  `fund` double NOT NULL COMMENT '公司注册资金',
  `turnover` double DEFAULT NULL COMMENT '营业额',
  `bank` varchar(30) NOT NULL COMMENT '银行',
  `bank_number` varchar(30) NOT NULL COMMENT '银行账号',
  `state_tax` varchar(30) DEFAULT NULL COMMENT '国税登记号',
  `land_tax` varchar(30) DEFAULT NULL COMMENT '地税登记号',
  `custfrom_id` int(11) NOT NULL COMMENT '客户来源',
  `change` int(11) NOT NULL COMMENT '是否他人转移',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '广东英特尔股份有限公司', '肖艳', '13748618846', '2', '52', '7', '4', '广州市黄埔铺科峰路108号', '000000', '86-519-85125379', 'www.entel.com', '张权旦', 'null', '6000000', '2500000', '中国工商银行', '620162154', 'null', 'null', '41', '1');
INSERT INTO `customer` VALUES ('2', '浙江大华技术股份有限公司', '林东', '15768474498', '3', '51', '3', '4', '杭州市富阳区33号三新大厦', '000000', '86 545-85987452', 'www.dahua.com', '吴亮', 'null', '8000000', '7500000', '中国农业银行', '61316213455', 'null', 'null', '12', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of develop
-- ----------------------------
INSERT INTO `develop` VALUES ('1', '1', '2016-11-20 00:00:00', '2017-01-13 00:00:00', '初步接触，了解客户意向。', '客户有购买的需求');
INSERT INTO `develop` VALUES ('2', '2', '2017-04-25 00:00:00', '2017-01-12 00:00:00', '将公司最新产品推销给用户', '客户认为产品价格太高导致失败');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loss
-- ----------------------------
INSERT INTO `loss` VALUES ('1', '1', '1', '2000-10-09', '0000-00-00', null, null, '暂缓');
INSERT INTO `loss` VALUES ('3', '2', '5', '2016-12-30', '0000-00-00', '与客户当面交谈', '客户公司厂址迁移', '暂缓');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详细编号',
  `order_id` int(11) NOT NULL COMMENT '订单编号',
  `product_id` int(11) NOT NULL COMMENT '产品编号',
  `count` int(11) NOT NULL COMMENT '产品数量',
  `total` double DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`orderitem_id`),
  KEY `FK_ORDERITEM_ORDER` (`order_id`),
  KEY `FK_ORDERITEM_PRODU` (`product_id`),
  CONSTRAINT `FK_ORDERITEM_ORDER` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ORDERITEM_PRODU` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '1', '1050', '3050000');
INSERT INTO `orderitem` VALUES ('2', '2', '3', '340', '345000');
INSERT INTO `orderitem` VALUES ('3', '4', '2', '1440', '5640000');
INSERT INTO `orderitem` VALUES ('4', '5', '3', '17851', '78650000');
INSERT INTO `orderitem` VALUES ('5', '3', '2', '4543', '86790000');
INSERT INTO `orderitem` VALUES ('6', '6', '2', '14564', '84650000');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL COMMENT '订单编号',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `address` varchar(30) NOT NULL COMMENT '送货地址',
  `date` datetime DEFAULT NULL COMMENT '签约日期',
  `state` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`order_id`),
  KEY `FK_ORDER_CUS` (`customer_id`),
  CONSTRAINT `FK_ORDER_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '广州中山街357号', '2016-04-15 00:00:00', '回款');
INSERT INTO `orders` VALUES ('2', '1', '广州萝岗区15号', '2017-02-15 00:00:00', '回款');
INSERT INTO `orders` VALUES ('3', '1', '广州白云山区开源街576号', '2018-04-15 00:00:00', '未回款');
INSERT INTO `orders` VALUES ('4', '2', '杭州市富阳区134号', '2015-04-11 00:00:00', '回款');
INSERT INTO `orders` VALUES ('5', '2', '杭州市下城区杭州大厦', '2016-10-07 00:00:00', '回款');
INSERT INTO `orders` VALUES ('6', '2', '杭州上城区定安路第14号', '2017-11-16 00:00:00', '未回款');
INSERT INTO `orders` VALUES ('7', '2', '杭州市上城区西湖大道米苏咖啡馆', '2018-04-20 00:00:00', '未回款');
INSERT INTO `orders` VALUES ('8', '1', '广州天河区天府路15号', '2017-10-15 00:00:00', '未回款');

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
INSERT INTO `role_authority` VALUES ('2', '2');
INSERT INTO `role_authority` VALUES ('3', '2');
INSERT INTO `role_authority` VALUES ('4', '4');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('1', '山峰数码', '需要一批手机', '网上获取', '0.78', '张武先生', '15768494485', '需要一批手机用于手机软件的开发和研究', '1', '2016-11-12', '1', '2', '2017-01-13', '1');
INSERT INTO `sale` VALUES ('2', '蜀国桃园三兄弟集团', '有购买一批空调的意向', '电话获取', '0.56', '曹梦先生', '13426789946', '有购买一批空调的意向', '5', '2017-04-12', '0', '3', '2017-06-14', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('1', '59', '63', '询问手机的价格', '1', '最新一批的手机价格能够优惠多少', '3', '2017-12-05', '72', '2', '2018-01-13', '问电话给林经理:根据相关的优惠政策，5894元/台，购买10000台以上的可以优惠到5688元/台', '5', '2018-01-13', '林经理已经提供出相关的优惠', '3');
INSERT INTO `service` VALUES ('2', '59', '65', '询问有关空调运送的费用承担方式', '2', '购买的空调运送费用如何承担?', '3', '2016-10-05', '74', '1', '2016-12-13', '在微信上询问楚经理：根据相关优惠：买够1000台以上的卖方承担，低于1000台的买方承担。', '2', '2016-12-13', '楚经理以及给出相关的优惠方式。', '4');
INSERT INTO `service` VALUES ('3', '55', '63', '发射点发射点', '1', '第三方收到 ', '6', '2018-07-05', '73', '6', null, null, '4', null, null, null);
INSERT INTO `service` VALUES ('4', '59', '66', '范德萨范德萨', '2', '范德萨范德萨', '6', '2018-07-05', '72', '6', null, '对方的身份阿斯顿', '6', '2018-07-12', null, null);
INSERT INTO `service` VALUES ('5', '55', '64', '的说法都是', '1', '房贷首付大撒犯得上 ', '6', '2018-07-05', '73', '6', null, null, '5', null, null, null);
INSERT INTO `service` VALUES ('6', '60', '65', '打发士大夫', '1', '范德萨范德萨', '6', '2018-07-05', '73', '6', null, null, '4', null, null, null);
INSERT INTO `service` VALUES ('7', '58', '65', '但是犯得上犯得上发生f', '2', '房贷首付大撒 ', '6', '2018-07-05', '73', '6', null, null, '6', null, null, null);
INSERT INTO `service` VALUES ('8', '55', '65', '热望热望热望率v', '1', '饿温热温热', '6', '2018-06-28', '72', '6', null, null, '4', null, '法大师傅大师傅', '5');
INSERT INTO `service` VALUES ('9', '55', '65', '我去撒打算', '1', '大撒大撒', '6', '2018-07-04', '72', '6', null, null, '6', '2015-08-03', '大苏打', null);
INSERT INTO `service` VALUES ('10', '55', '65', '大撒大撒', '2', '大撒大撒', '6', '2018-07-04', '73', '6', null, null, '6', null, null, null);
INSERT INTO `service` VALUES ('11', '55', '66', '现在财政学财政学', '2', '大撒大撒', '6', '2018-06-24', '71', null, null, null, null, null, null, null);

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
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_USER_ACCOUNT` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李嘉图', '13423534277', '/head/000.jpg', '123456');
INSERT INTO `user` VALUES ('2', '楚子航', '13511467831', '/head/111.jpg', '123456');
INSERT INTO `user` VALUES ('3', '苏茜', '13543354375', '/head/222.jpg', '123456');
INSERT INTO `user` VALUES ('4', '陈墨瞳', '13546781546', '/head/333.jpg', '123456');
INSERT INTO `user` VALUES ('5', '夏弥', '15713681654', '/head/444.jpg', '123456');
INSERT INTO `user` VALUES ('6', '林动', '16421684165', '/head/555.jpg', '123456');

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
INSERT INTO `user_role` VALUES ('2', '1');
INSERT INTO `user_role` VALUES ('3', '4');
INSERT INTO `user_role` VALUES ('4', '3');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('6', '3');

-- ----------------------------
-- Table structure for wordbook
-- ----------------------------
DROP TABLE IF EXISTS `wordbook`;
CREATE TABLE `wordbook` (
  `id` int(11) NOT NULL COMMENT '类型编号',
  `category` int(11) NOT NULL COMMENT '类别',
  `title` varchar(20) NOT NULL COMMENT '条目',
  `value` varchar(20) NOT NULL COMMENT '值',
  `editable` varchar(4) NOT NULL COMMENT '是否可编辑',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `wordbook` VALUES ('11', '3', '客户来源', '来自广东工业科技大学', '0');
INSERT INTO `wordbook` VALUES ('12', '3', '客户来源', '来自中山科技大学', '0');
INSERT INTO `wordbook` VALUES ('13', '3', '客户来源', '来自华清大学', '0');
INSERT INTO `wordbook` VALUES ('14', '3', '客户来源', '来自京都大学', '0');
INSERT INTO `wordbook` VALUES ('15', '3', '客户来源', '来自哈尔滨佛系大学', '0');
INSERT INTO `wordbook` VALUES ('21', '3', '客户来源', '来自奇瑞有限公司', '0');
INSERT INTO `wordbook` VALUES ('22', '3', '客户来源', '来自蜀国三兄弟有限公司', '0');
INSERT INTO `wordbook` VALUES ('23', '3', '客户来源', '来自汉国若晓有限公司', '0');
INSERT INTO `wordbook` VALUES ('24', '3', '客户来源', '来自东吴娱乐有限公司', '0');
INSERT INTO `wordbook` VALUES ('25', '3', '客户来源', '来自大魏曹氏开发有限公司', '0');
INSERT INTO `wordbook` VALUES ('31', '3', '客户来源', '来自广州市政府', '0');
INSERT INTO `wordbook` VALUES ('32', '3', '客户来源', '来自北京市政府', '0');
INSERT INTO `wordbook` VALUES ('33', '3', '客户来源', '来自南京市政府', '0');
INSERT INTO `wordbook` VALUES ('34', '3', '客户来源', '来自上海市政府', '0');
INSERT INTO `wordbook` VALUES ('35', '3', '客户来源', '来自杭州市政府', '0');
INSERT INTO `wordbook` VALUES ('41', '3', '客户来源', '来自蜀中刘关张集团', '0');
INSERT INTO `wordbook` VALUES ('42', '3', '客户来源', '来自魏国曹氏企业', '0');
INSERT INTO `wordbook` VALUES ('43', '3', '客户来源', '来自东软有限企业', '0');
INSERT INTO `wordbook` VALUES ('44', '3', '客户来源', '来自嬴氏企业', '0');
INSERT INTO `wordbook` VALUES ('45', '3', '客户来源', '来自大唐企业', '0');
INSERT INTO `wordbook` VALUES ('51', '4', '客户等级', '合作伙伴', '0');
INSERT INTO `wordbook` VALUES ('52', '4', '客户等级', '大客户', '0');
INSERT INTO `wordbook` VALUES ('53', '4', '客户等级', '重点开发客户', '0');
INSERT INTO `wordbook` VALUES ('54', '4', '客户等级', '普通客户', '0');
INSERT INTO `wordbook` VALUES ('55', '5', '客户等级', '战略合作伙伴', '1');
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

-- ----------------------------
-- View structure for list_authority
-- ----------------------------
DROP VIEW IF EXISTS `list_authority`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `list_authority` AS SELECT
authority.authority_mark,
authority.sort,
authority.`name`,
role.role_name,
role_authority.authority_id,
`user`.id,
user_role.role_id,
`user`.account
FROM
`user`
LEFT JOIN user_role ON user_role.user_id = `user`.id
LEFT JOIN role ON user_role.role_id = role.role_id
LEFT JOIN role_authority ON role_authority.role_id = role.role_id
LEFT JOIN authority ON role_authority.authority_id = authority.authority_id ;

-- ----------------------------
-- View structure for servicevo
-- ----------------------------
DROP VIEW IF EXISTS `servicevo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `servicevo` AS select s.service_id,s.summary,s.service_style ,s.servicecategory_id,s.deal_id,
s.create_date,s.status_id,u.account,c.name,w1.value servicestyle,w2.value servicecategory,w3.value status
from service s,customer c,user u,wordbook w1,wordbook w2,wordbook w3 
where s.create_id = u.id
and s.customer_id = c.customer_id
and s.service_style = w1.id
and s.servicecategory_id = w2.id
and s.status_id = w3.id ;

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
-- Event structure for evwarn
-- ----------------------------
DROP EVENT IF EXISTS `evwarn`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `evwarn` ON SCHEDULE EVERY 7 DAY STARTS '2018-07-07 02:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
CALL evsartwarn_on_order();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_on_sale`;
DELIMITER ;;
CREATE TRIGGER `update_on_sale` AFTER UPDATE ON `sale` FOR EACH ROW BEGIN
	if (new.status=1) then
		insert into customer(`customer_id`,`name`,`contacts`,`tel`,`change`) values (0,new.customer_name,new.contacts,new.tel,0);
	end if;
END
;;
DELIMITER ;
