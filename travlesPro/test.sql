/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-03-08 22:20:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mmm_ad
-- ----------------------------
DROP TABLE IF EXISTS `mmm_ad`;
CREATE TABLE `mmm_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '广告位id，对应mmm_ad_type的id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '广告名字',
  `detail` varchar(128) DEFAULT NULL COMMENT '广告描述',
  `url` varchar(256) DEFAULT NULL COMMENT '链接地址',
  `image` varchar(256) DEFAULT NULL COMMENT '广告图片',
  `hits` int(11) DEFAULT '0' COMMENT '点击次数',
  `sort` tinyint(2) DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '广告状态：0-不启用，1-启用',
  `is_del` int(11) DEFAULT '0' COMMENT '0不删除，1删除',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of mmm_ad
-- ----------------------------
INSERT INTO `mmm_ad` VALUES ('2', '1', '温泉', '手机端首页轮播图', 'www.baiu.cm', '/Public/Upload/ad/58a6f6e219c97.jpg', '0', '7', '1', '0');
INSERT INTO `mmm_ad` VALUES ('3', '1', '', '地方', 'www.baidu.co', '/Public/Upload/lunbo/583bc497db95a.png', '0', '3', '0', '1');
INSERT INTO `mmm_ad` VALUES ('4', '1', '城市旅行家', '手机端首页轮播', 'www.123.ne', '/Public/Upload/ad/58a6f77565d19.jpeg', '0', '4', '1', '0');
INSERT INTO `mmm_ad` VALUES ('5', '1', '节后', '手机端首页轮播', 'www.baidu.cdsf', '/Public/Upload/ad/58a6f74c365e5.jpg', '0', '5', '1', '0');
INSERT INTO `mmm_ad` VALUES ('6', '2', '周边1', '周边1', 'www.baidu.com', '/Public/Upload/ad/58aeefc29f437.jpg', '0', '1', '1', '0');
INSERT INTO `mmm_ad` VALUES ('7', '2', '周边2', '周边2', 'www.123.ne', '/Public/Upload/ad/58aeefd95abbb.jpg', '0', '2', '1', '0');
INSERT INTO `mmm_ad` VALUES ('8', '1', '赏花', '手机端首页轮播', 'www.123.ne', '/Public/Upload/ad/58a6f7f444ad9.jpg', '0', '2', '1', '0');
INSERT INTO `mmm_ad` VALUES ('10', '2', '周边3', '周边3', 'www.163.com', '/Public/Upload/ad/58aeeff522f7f.jpg', '0', '3', '1', '0');
INSERT INTO `mmm_ad` VALUES ('11', '3', '国内1', '国内1', 'www.163.com', '/Public/Upload/ad/58aef01d787e3.jpg', '0', '1', '1', '0');
INSERT INTO `mmm_ad` VALUES ('12', '3', '国内2', '国内2', 'm.lvmama.com', '/Public/Upload/ad/58aef0452a6f1.jpg', '0', '2', '1', '0');
INSERT INTO `mmm_ad` VALUES ('13', '3', '国内3', '国内3', 'www.baidu.com', '/Public/Upload/ad/58aef09a79819.jpg', '0', '3', '1', '0');
INSERT INTO `mmm_ad` VALUES ('14', '4', '出境1', '出境1', 'ww', '/Public/Upload/ad/58aef0bf0f924.jpg', '0', '1', '1', '0');
INSERT INTO `mmm_ad` VALUES ('15', '4', '出境2', '出境2', 'www.c.c', '/Public/Upload/ad/58aef0dcdc16f.jpg', '0', '2', '1', '0');
INSERT INTO `mmm_ad` VALUES ('16', '4', '出境3', '出境3', 'www.163.ccc', '/Public/Upload/ad/58aef0f0cc413.jpg', '0', '3', '1', '0');

-- ----------------------------
-- Table structure for mmm_ad_type
-- ----------------------------
DROP TABLE IF EXISTS `mmm_ad_type`;
CREATE TABLE `mmm_ad_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告位主键id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '广告位状态 0不启用 1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告位置表';

-- ----------------------------
-- Records of mmm_ad_type
-- ----------------------------
INSERT INTO `mmm_ad_type` VALUES ('1', '首页轮播图', '1');
INSERT INTO `mmm_ad_type` VALUES ('2', '手机端周边游轮播图', '1');
INSERT INTO `mmm_ad_type` VALUES ('3', '手机端国内游轮播图', '1');
INSERT INTO `mmm_ad_type` VALUES ('4', '手机端出境游轮播图', '1');
INSERT INTO `mmm_ad_type` VALUES ('5', '手机端港澳游轮播图', '0');

-- ----------------------------
-- Table structure for mmm_countries
-- ----------------------------
DROP TABLE IF EXISTS `mmm_countries`;
CREATE TABLE `mmm_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '国家名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '国家简称字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='世界国家表';

-- ----------------------------
-- Records of mmm_countries
-- ----------------------------
INSERT INTO `mmm_countries` VALUES ('1', '中国', '1');
INSERT INTO `mmm_countries` VALUES ('2', '阿尔巴尼亚', 'ALB');
INSERT INTO `mmm_countries` VALUES ('3', '阿尔及利亚', 'DZA');
INSERT INTO `mmm_countries` VALUES ('4', '阿富汗', 'AFG');
INSERT INTO `mmm_countries` VALUES ('5', '阿根廷', 'ARG');
INSERT INTO `mmm_countries` VALUES ('6', '阿拉伯联合酋长国', 'ARE');
INSERT INTO `mmm_countries` VALUES ('7', '阿鲁巴', 'ABW');
INSERT INTO `mmm_countries` VALUES ('8', '阿曼', 'OMN');
INSERT INTO `mmm_countries` VALUES ('9', '阿塞拜疆', 'AZE');
INSERT INTO `mmm_countries` VALUES ('10', '阿森松岛', 'ASC');
INSERT INTO `mmm_countries` VALUES ('11', '埃及', 'EGY');
INSERT INTO `mmm_countries` VALUES ('12', '埃塞俄比亚', 'ETH');
INSERT INTO `mmm_countries` VALUES ('13', '爱尔兰', 'IRL');
INSERT INTO `mmm_countries` VALUES ('14', '爱沙尼亚', 'EST');
INSERT INTO `mmm_countries` VALUES ('15', '安道尔', 'AND');
INSERT INTO `mmm_countries` VALUES ('16', '安哥拉', 'AGO');
INSERT INTO `mmm_countries` VALUES ('17', '安圭拉', 'AIA');
INSERT INTO `mmm_countries` VALUES ('18', '安提瓜岛和巴布达', 'ATG');
INSERT INTO `mmm_countries` VALUES ('19', '奥地利', 'AUT');
INSERT INTO `mmm_countries` VALUES ('20', '奥兰群岛', 'ALA');
INSERT INTO `mmm_countries` VALUES ('21', '澳大利亚', 'AUS');
INSERT INTO `mmm_countries` VALUES ('22', '巴巴多斯岛', 'BRB');
INSERT INTO `mmm_countries` VALUES ('23', '巴布亚新几内亚', 'PNG');
INSERT INTO `mmm_countries` VALUES ('24', '巴哈马', 'BHS');
INSERT INTO `mmm_countries` VALUES ('25', '巴基斯坦', 'PAK');
INSERT INTO `mmm_countries` VALUES ('26', '巴拉圭', 'PRY');
INSERT INTO `mmm_countries` VALUES ('27', '巴勒斯坦', 'PSE');
INSERT INTO `mmm_countries` VALUES ('28', '巴林', 'BHR');
INSERT INTO `mmm_countries` VALUES ('29', '巴拿马', 'PAN');
INSERT INTO `mmm_countries` VALUES ('30', '巴西', 'BRA');
INSERT INTO `mmm_countries` VALUES ('31', '白俄罗斯', 'BLR');
INSERT INTO `mmm_countries` VALUES ('32', '百慕大', 'BMU');
INSERT INTO `mmm_countries` VALUES ('33', '保加利亚', 'BGR');
INSERT INTO `mmm_countries` VALUES ('34', '北马里亚纳群岛', 'MNP');
INSERT INTO `mmm_countries` VALUES ('35', '贝宁', 'BEN');
INSERT INTO `mmm_countries` VALUES ('36', '比利时', 'BEL');
INSERT INTO `mmm_countries` VALUES ('37', '冰岛', 'ISL');
INSERT INTO `mmm_countries` VALUES ('38', '波多黎各', 'PRI');
INSERT INTO `mmm_countries` VALUES ('39', '波兰', 'POL');
INSERT INTO `mmm_countries` VALUES ('40', '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `mmm_countries` VALUES ('41', '玻利维亚', 'BOL');
INSERT INTO `mmm_countries` VALUES ('42', '伯利兹', 'BLZ');
INSERT INTO `mmm_countries` VALUES ('43', '博茨瓦纳', 'BWA');
INSERT INTO `mmm_countries` VALUES ('44', '不丹', 'BTN');
INSERT INTO `mmm_countries` VALUES ('45', '布基纳法索', 'BFA');
INSERT INTO `mmm_countries` VALUES ('46', '布隆迪', 'BDI');
INSERT INTO `mmm_countries` VALUES ('47', '布韦岛', 'BVT');
INSERT INTO `mmm_countries` VALUES ('48', '朝鲜', 'PRK');
INSERT INTO `mmm_countries` VALUES ('49', '丹麦', 'DNK');
INSERT INTO `mmm_countries` VALUES ('50', '德国', 'DEU');
INSERT INTO `mmm_countries` VALUES ('51', '东帝汶', 'TLS');
INSERT INTO `mmm_countries` VALUES ('52', '多哥', 'TGO');
INSERT INTO `mmm_countries` VALUES ('53', '多米尼加', 'DMA');
INSERT INTO `mmm_countries` VALUES ('54', '多米尼加共和国', 'DOM');
INSERT INTO `mmm_countries` VALUES ('55', '俄罗斯', 'RUS');
INSERT INTO `mmm_countries` VALUES ('56', '厄瓜多尔', 'ECU');
INSERT INTO `mmm_countries` VALUES ('57', '厄立特里亚', 'ERI');
INSERT INTO `mmm_countries` VALUES ('58', '法国', 'FRA');
INSERT INTO `mmm_countries` VALUES ('59', '法罗群岛', 'FRO');
INSERT INTO `mmm_countries` VALUES ('60', '法属波利尼西亚', 'PYF');
INSERT INTO `mmm_countries` VALUES ('61', '法属圭亚那', 'GUF');
INSERT INTO `mmm_countries` VALUES ('62', '法属南部领地', 'ATF');
INSERT INTO `mmm_countries` VALUES ('63', '梵蒂冈', 'VAT');
INSERT INTO `mmm_countries` VALUES ('64', '菲律宾', 'PHL');
INSERT INTO `mmm_countries` VALUES ('65', '斐济', 'FJI');
INSERT INTO `mmm_countries` VALUES ('66', '芬兰', 'FIN');
INSERT INTO `mmm_countries` VALUES ('67', '佛得角', 'CPV');
INSERT INTO `mmm_countries` VALUES ('68', '弗兰克群岛', 'FLK');
INSERT INTO `mmm_countries` VALUES ('69', '冈比亚', 'GMB');
INSERT INTO `mmm_countries` VALUES ('70', '刚果', 'COG');
INSERT INTO `mmm_countries` VALUES ('71', '刚果民主共和国', 'COD');
INSERT INTO `mmm_countries` VALUES ('72', '哥伦比亚', 'COL');
INSERT INTO `mmm_countries` VALUES ('73', '哥斯达黎加', 'CRI');
INSERT INTO `mmm_countries` VALUES ('74', '格恩西岛', 'GGY');
INSERT INTO `mmm_countries` VALUES ('75', '格林纳达', 'GRD');
INSERT INTO `mmm_countries` VALUES ('76', '格陵兰', 'GRL');
INSERT INTO `mmm_countries` VALUES ('77', '古巴', 'CUB');
INSERT INTO `mmm_countries` VALUES ('78', '瓜德罗普', 'GLP');
INSERT INTO `mmm_countries` VALUES ('79', '关岛', 'GUM');
INSERT INTO `mmm_countries` VALUES ('80', '圭亚那', 'GUY');
INSERT INTO `mmm_countries` VALUES ('81', '哈萨克斯坦', 'KAZ');
INSERT INTO `mmm_countries` VALUES ('82', '海地', 'HTI');
INSERT INTO `mmm_countries` VALUES ('83', '韩国', 'KOR');
INSERT INTO `mmm_countries` VALUES ('84', '荷兰', 'NLD');
INSERT INTO `mmm_countries` VALUES ('85', '荷属安地列斯', 'ANT');
INSERT INTO `mmm_countries` VALUES ('86', '赫德和麦克唐纳群岛', 'HMD');
INSERT INTO `mmm_countries` VALUES ('87', '洪都拉斯', 'HND');
INSERT INTO `mmm_countries` VALUES ('88', '基里巴斯', 'KIR');
INSERT INTO `mmm_countries` VALUES ('89', '吉布提', 'DJI');
INSERT INTO `mmm_countries` VALUES ('90', '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `mmm_countries` VALUES ('91', '几内亚', 'GIN');
INSERT INTO `mmm_countries` VALUES ('92', '几内亚比绍', 'GNB');
INSERT INTO `mmm_countries` VALUES ('93', '加拿大', 'CAN');
INSERT INTO `mmm_countries` VALUES ('94', '加纳', 'GHA');
INSERT INTO `mmm_countries` VALUES ('95', '加蓬', 'GAB');
INSERT INTO `mmm_countries` VALUES ('96', '柬埔寨', 'KHM');
INSERT INTO `mmm_countries` VALUES ('97', '捷克共和国', 'CZE');
INSERT INTO `mmm_countries` VALUES ('98', '津巴布韦', 'ZWE');
INSERT INTO `mmm_countries` VALUES ('99', '喀麦隆', 'CMR');
INSERT INTO `mmm_countries` VALUES ('100', '卡塔尔', 'QAT');
INSERT INTO `mmm_countries` VALUES ('101', '开曼群岛', 'CYM');
INSERT INTO `mmm_countries` VALUES ('102', '科科斯群岛', 'CCK');
INSERT INTO `mmm_countries` VALUES ('103', '科摩罗', 'COM');
INSERT INTO `mmm_countries` VALUES ('104', '科特迪瓦', 'CIV');
INSERT INTO `mmm_countries` VALUES ('105', '科威特', 'KWT');
INSERT INTO `mmm_countries` VALUES ('106', '克罗地亚', 'HRV');
INSERT INTO `mmm_countries` VALUES ('107', '肯尼亚', 'KEN');
INSERT INTO `mmm_countries` VALUES ('108', '库克群岛', 'COK');
INSERT INTO `mmm_countries` VALUES ('109', '拉脱维亚', 'LVA');
INSERT INTO `mmm_countries` VALUES ('110', '莱索托', 'LSO');
INSERT INTO `mmm_countries` VALUES ('111', '老挝', 'LAO');
INSERT INTO `mmm_countries` VALUES ('112', '黎巴嫩', 'LBN');
INSERT INTO `mmm_countries` VALUES ('113', '立陶宛', 'LTU');
INSERT INTO `mmm_countries` VALUES ('114', '利比里亚', 'LBR');
INSERT INTO `mmm_countries` VALUES ('115', '利比亚', 'LBY');
INSERT INTO `mmm_countries` VALUES ('116', '列支敦士登', 'LIE');
INSERT INTO `mmm_countries` VALUES ('117', '留尼旺岛', 'REU');
INSERT INTO `mmm_countries` VALUES ('118', '卢森堡', 'LUX');
INSERT INTO `mmm_countries` VALUES ('119', '卢旺达', 'RWA');
INSERT INTO `mmm_countries` VALUES ('120', '罗马尼亚', 'ROU');
INSERT INTO `mmm_countries` VALUES ('121', '马达加斯加', 'MDG');
INSERT INTO `mmm_countries` VALUES ('122', '马尔代夫', 'MDV');
INSERT INTO `mmm_countries` VALUES ('123', '马耳他', 'MLT');
INSERT INTO `mmm_countries` VALUES ('124', '马拉维', 'MWI');
INSERT INTO `mmm_countries` VALUES ('125', '马来西亚', 'MYS');
INSERT INTO `mmm_countries` VALUES ('126', '马里', 'MLI');
INSERT INTO `mmm_countries` VALUES ('127', '马其顿', 'MKD');
INSERT INTO `mmm_countries` VALUES ('128', '马绍尔群岛', 'MHL');
INSERT INTO `mmm_countries` VALUES ('129', '马提尼克', 'MTQ');
INSERT INTO `mmm_countries` VALUES ('130', '马约特岛', 'MYT');
INSERT INTO `mmm_countries` VALUES ('131', '曼岛', 'IMN');
INSERT INTO `mmm_countries` VALUES ('132', '毛里求斯', 'MUS');
INSERT INTO `mmm_countries` VALUES ('133', '毛里塔尼亚', 'MRT');
INSERT INTO `mmm_countries` VALUES ('134', '美国', 'USA');
INSERT INTO `mmm_countries` VALUES ('135', '美属萨摩亚', 'ASM');
INSERT INTO `mmm_countries` VALUES ('136', '美属外岛', 'UMI');
INSERT INTO `mmm_countries` VALUES ('137', '蒙古', 'MNG');
INSERT INTO `mmm_countries` VALUES ('138', '蒙特塞拉特', 'MSR');
INSERT INTO `mmm_countries` VALUES ('139', '孟加拉', 'BGD');
INSERT INTO `mmm_countries` VALUES ('140', '秘鲁', 'PER');
INSERT INTO `mmm_countries` VALUES ('141', '密克罗尼西亚', 'FSM');
INSERT INTO `mmm_countries` VALUES ('142', '缅甸', 'MMR');
INSERT INTO `mmm_countries` VALUES ('143', '摩尔多瓦', 'MDA');
INSERT INTO `mmm_countries` VALUES ('144', '摩洛哥', 'MAR');
INSERT INTO `mmm_countries` VALUES ('145', '摩纳哥', 'MCO');
INSERT INTO `mmm_countries` VALUES ('146', '莫桑比克', 'MOZ');
INSERT INTO `mmm_countries` VALUES ('147', '墨西哥', 'MEX');
INSERT INTO `mmm_countries` VALUES ('148', '纳米比亚', 'NAM');
INSERT INTO `mmm_countries` VALUES ('149', '南非', 'ZAF');
INSERT INTO `mmm_countries` VALUES ('150', '南极洲', 'ATA');
INSERT INTO `mmm_countries` VALUES ('151', '南乔治亚和南桑德威奇群岛', 'SGS');
INSERT INTO `mmm_countries` VALUES ('152', '瑙鲁', 'NRU');
INSERT INTO `mmm_countries` VALUES ('153', '尼泊尔', 'NPL');
INSERT INTO `mmm_countries` VALUES ('154', '尼加拉瓜', 'NIC');
INSERT INTO `mmm_countries` VALUES ('155', '尼日尔', 'NER');
INSERT INTO `mmm_countries` VALUES ('156', '尼日利亚', 'NGA');
INSERT INTO `mmm_countries` VALUES ('157', '纽埃', 'NIU');
INSERT INTO `mmm_countries` VALUES ('158', '挪威', 'NOR');
INSERT INTO `mmm_countries` VALUES ('159', '诺福克', 'NFK');
INSERT INTO `mmm_countries` VALUES ('160', '帕劳群岛', 'PLW');
INSERT INTO `mmm_countries` VALUES ('161', '皮特凯恩', 'PCN');
INSERT INTO `mmm_countries` VALUES ('162', '葡萄牙', 'PRT');
INSERT INTO `mmm_countries` VALUES ('163', '乔治亚', 'GEO');
INSERT INTO `mmm_countries` VALUES ('164', '日本', 'JPN');
INSERT INTO `mmm_countries` VALUES ('165', '瑞典', 'SWE');
INSERT INTO `mmm_countries` VALUES ('166', '瑞士', 'CHE');
INSERT INTO `mmm_countries` VALUES ('167', '萨尔瓦多', 'SLV');
INSERT INTO `mmm_countries` VALUES ('168', '萨摩亚', 'WSM');
INSERT INTO `mmm_countries` VALUES ('169', '塞尔维亚,黑山', 'SCG');
INSERT INTO `mmm_countries` VALUES ('170', '塞拉利昂', 'SLE');
INSERT INTO `mmm_countries` VALUES ('171', '塞内加尔', 'SEN');
INSERT INTO `mmm_countries` VALUES ('172', '塞浦路斯', 'CYP');
INSERT INTO `mmm_countries` VALUES ('173', '塞舌尔', 'SYC');
INSERT INTO `mmm_countries` VALUES ('174', '沙特阿拉伯', 'SAU');
INSERT INTO `mmm_countries` VALUES ('175', '圣诞岛', 'CXR');
INSERT INTO `mmm_countries` VALUES ('176', '圣多美和普林西比', 'STP');
INSERT INTO `mmm_countries` VALUES ('177', '圣赫勒拿', 'SHN');
INSERT INTO `mmm_countries` VALUES ('178', '圣基茨和尼维斯', 'KNA');
INSERT INTO `mmm_countries` VALUES ('179', '圣卢西亚', 'LCA');
INSERT INTO `mmm_countries` VALUES ('180', '圣马力诺', 'SMR');
INSERT INTO `mmm_countries` VALUES ('181', '圣皮埃尔和米克隆群岛', 'SPM');
INSERT INTO `mmm_countries` VALUES ('182', '圣文森特和格林纳丁斯', 'VCT');
INSERT INTO `mmm_countries` VALUES ('183', '斯里兰卡', 'LKA');
INSERT INTO `mmm_countries` VALUES ('184', '斯洛伐克', 'SVK');
INSERT INTO `mmm_countries` VALUES ('185', '斯洛文尼亚', 'SVN');
INSERT INTO `mmm_countries` VALUES ('186', '斯瓦尔巴和扬马廷', 'SJM');
INSERT INTO `mmm_countries` VALUES ('187', '斯威士兰', 'SWZ');
INSERT INTO `mmm_countries` VALUES ('188', '苏丹', 'SDN');
INSERT INTO `mmm_countries` VALUES ('189', '苏里南', 'SUR');
INSERT INTO `mmm_countries` VALUES ('190', '所罗门群岛', 'SLB');
INSERT INTO `mmm_countries` VALUES ('191', '索马里', 'SOM');
INSERT INTO `mmm_countries` VALUES ('192', '塔吉克斯坦', 'TJK');
INSERT INTO `mmm_countries` VALUES ('193', '泰国', 'THA');
INSERT INTO `mmm_countries` VALUES ('194', '坦桑尼亚', 'TZA');
INSERT INTO `mmm_countries` VALUES ('195', '汤加', 'TON');
INSERT INTO `mmm_countries` VALUES ('196', '特克斯和凯克特斯群岛', 'TCA');
INSERT INTO `mmm_countries` VALUES ('197', '特里斯坦达昆哈', 'TAA');
INSERT INTO `mmm_countries` VALUES ('198', '特立尼达和多巴哥', 'TTO');
INSERT INTO `mmm_countries` VALUES ('199', '突尼斯', 'TUN');
INSERT INTO `mmm_countries` VALUES ('200', '图瓦卢', 'TUV');
INSERT INTO `mmm_countries` VALUES ('201', '土耳其', 'TUR');
INSERT INTO `mmm_countries` VALUES ('202', '土库曼斯坦', 'TKM');
INSERT INTO `mmm_countries` VALUES ('203', '托克劳', 'TKL');
INSERT INTO `mmm_countries` VALUES ('204', '瓦利斯和福图纳', 'WLF');
INSERT INTO `mmm_countries` VALUES ('205', '瓦努阿图', 'VUT');
INSERT INTO `mmm_countries` VALUES ('206', '危地马拉', 'GTM');
INSERT INTO `mmm_countries` VALUES ('207', '维尔京群岛，美属', 'VIR');
INSERT INTO `mmm_countries` VALUES ('208', '维尔京群岛，英属', 'VGB');
INSERT INTO `mmm_countries` VALUES ('209', '委内瑞拉', 'VEN');
INSERT INTO `mmm_countries` VALUES ('210', '文莱', 'BRN');
INSERT INTO `mmm_countries` VALUES ('211', '乌干达', 'UGA');
INSERT INTO `mmm_countries` VALUES ('212', '乌克兰', 'UKR');
INSERT INTO `mmm_countries` VALUES ('213', '乌拉圭', 'URY');
INSERT INTO `mmm_countries` VALUES ('214', '乌兹别克斯坦', 'UZB');
INSERT INTO `mmm_countries` VALUES ('215', '西班牙', 'ESP');
INSERT INTO `mmm_countries` VALUES ('216', '希腊', 'GRC');
INSERT INTO `mmm_countries` VALUES ('217', '新加坡', 'SGP');
INSERT INTO `mmm_countries` VALUES ('218', '新喀里多尼亚', 'NCL');
INSERT INTO `mmm_countries` VALUES ('219', '新西兰', 'NZL');
INSERT INTO `mmm_countries` VALUES ('220', '匈牙利', 'HUN');
INSERT INTO `mmm_countries` VALUES ('221', '叙利亚', 'SYR');
INSERT INTO `mmm_countries` VALUES ('222', '牙买加', 'JAM');
INSERT INTO `mmm_countries` VALUES ('223', '亚美尼亚', 'ARM');
INSERT INTO `mmm_countries` VALUES ('224', '也门', 'YEM');
INSERT INTO `mmm_countries` VALUES ('225', '伊拉克', 'IRQ');
INSERT INTO `mmm_countries` VALUES ('226', '伊朗', 'IRN');
INSERT INTO `mmm_countries` VALUES ('227', '以色列', 'ISR');
INSERT INTO `mmm_countries` VALUES ('228', '意大利', 'ITA');
INSERT INTO `mmm_countries` VALUES ('229', '印度', 'IND');
INSERT INTO `mmm_countries` VALUES ('230', '印度尼西亚', 'IDN');
INSERT INTO `mmm_countries` VALUES ('231', '英国', 'GBR');
INSERT INTO `mmm_countries` VALUES ('232', '英属印度洋领地', 'IOT');
INSERT INTO `mmm_countries` VALUES ('233', '约旦', 'JOR');
INSERT INTO `mmm_countries` VALUES ('234', '越南', 'VNM');
INSERT INTO `mmm_countries` VALUES ('235', '赞比亚', 'ZMB');
INSERT INTO `mmm_countries` VALUES ('236', '泽西岛', 'JEY');
INSERT INTO `mmm_countries` VALUES ('237', '乍得', 'TCD');
INSERT INTO `mmm_countries` VALUES ('238', '直布罗陀', 'GIB');
INSERT INTO `mmm_countries` VALUES ('239', '智利', 'CHL');
INSERT INTO `mmm_countries` VALUES ('240', '中非共和国', 'CAF');

-- ----------------------------
-- Table structure for mmm_employee
-- ----------------------------
DROP TABLE IF EXISTS `mmm_employee`;
CREATE TABLE `mmm_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '管理员名字',
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号',
  `qq` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'QQ号码',
  `weixin` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '微信号码',
  `email` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `department` int(11) NOT NULL DEFAULT '0' COMMENT '部门id，关联myz_admin_depa主键id：1-OP，2-财务部',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别：1-男，2-女',
  `nativeplace` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '籍贯',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '现住址',
  `entrytime` datetime NOT NULL COMMENT '入职日期',
  `addtime` datetime NOT NULL COMMENT '登记时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0-启用，1-禁用',
  `note` text CHARACTER SET utf8 COMMENT '备注',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除：0-未删除，1-已删除',
  `loginip` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '登录ip',
  `lastlogintime` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台管理员表';

-- ----------------------------
-- Records of mmm_employee
-- ----------------------------
INSERT INTO `mmm_employee` VALUES ('1', 'zzz1', '13425157493', 'q', 'w', 'e', 'fb90043904c92d0e3c2981d02cb6487f', '1', '1', '籍贯', '住址', '2016-10-06 15:26:16', '0000-00-00 00:00:00', '0', '备注', '0', '127.0.0.1', '2017-01-11 18:41:50');
INSERT INTO `mmm_employee` VALUES ('2', '周文静', '13316959225', '1316746345', 'W13316959225', '1316746345@123.com', '123456', '1', '2', '广东', '深圳市龙岗区', '2015-06-10 00:00:00', '0000-00-00 00:00:00', '0', '', '0', '', '0000-00-00 00:00:00');
INSERT INTO `mmm_employee` VALUES ('3', '胡肖霞', '18012345678', '44', '', '2@123.com', '123456', '5', '2', '他', '退货', '2016-09-28 00:00:00', '2015-02-25 15:25:39', '0', '第三方', '0', '', '0000-00-00 00:00:00');
INSERT INTO `mmm_employee` VALUES ('4', '陈雪珍', '13425157492', '', '', '', '123456', '5', '1', '的双方各', '放心吃v', '2016-11-10 00:00:00', '0000-00-00 00:00:00', '0', '', '0', '', '0000-00-00 00:00:00');
INSERT INTO `mmm_employee` VALUES ('5', ' 辅导费', '13545457878', '456789', '22222', '1@123.com', '123456', '2', '2', '刚好', '大锅饭 ', '0000-00-00 00:00:00', '2016-10-20 15:25:57', '0', '地方好', '0', '', '0000-00-00 00:00:00');
INSERT INTO `mmm_employee` VALUES ('6', '大是大', '13425157494', '123', '', '1@123.com', 'fb90043904c92d0e3c2981d02cb6487f', '3', '1', '广东', '暗室逢灯', '2016-09-12 00:00:00', '2016-10-28 15:25:52', '0', ' 的双方各', '0', '127.0.0.1', '2017-02-27 20:14:45');
INSERT INTO `mmm_employee` VALUES ('7', '张三', '13425157492', '5444', '11111111111', '2@123.com', '', '1', '2', '美国', '暗室逢灯', '2016-10-04 00:00:00', '0000-00-00 00:00:00', '0', 'opiopiopop', '0', '', '0000-00-00 00:00:00');
INSERT INTO `mmm_employee` VALUES ('8', '富商大贾发', '165656565', '546646', '1221', '1@123.com', '8224a4b9f14159a7caf050405c76f94d', '3', '2', '豆腐干', '大丰收 ', '2017-01-17 00:00:00', '0000-00-00 00:00:00', '0', '是东方红是东方红都是废话', '0', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for mmm_employee_depa
-- ----------------------------
DROP TABLE IF EXISTS `mmm_employee_depa`;
CREATE TABLE `mmm_employee_depa` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '部门名称',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '功能描述',
  `rules` text COMMENT '部门权限id， 多个权限","隔开。关联myz_menu表主键id',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='管理员部门表';

-- ----------------------------
-- Records of mmm_employee_depa
-- ----------------------------
INSERT INTO `mmm_employee_depa` VALUES ('1', 'OP部', '网站技术维护', '17,28', '2017-01-20 10:28:10', '0');
INSERT INTO `mmm_employee_depa` VALUES ('2', '财务部', '人事管理', null, '2016-10-12 10:37:27', '0');
INSERT INTO `mmm_employee_depa` VALUES ('3', '技术部', '规范', '15,16,8,12,9,11,13,21,22,26,27,25,2,5,6,1,18,3,4,7,14,23,24,17,19,20,28', '2017-01-20 10:28:20', '0');
INSERT INTO `mmm_employee_depa` VALUES ('4', '行政部', '公司日常运作管理', '15,16,1,18,3,4,7', '2017-01-03 11:16:56', '0');
INSERT INTO `mmm_employee_depa` VALUES ('5', '豆腐干2', '大商股份2', '2,5,6', '2016-10-18 09:24:52', '0');
INSERT INTO `mmm_employee_depa` VALUES ('13', '销售部', '推广，销售', '13,2,5,6', '2016-11-03 09:29:43', '1');

-- ----------------------------
-- Table structure for mmm_employee_salary
-- ----------------------------
DROP TABLE IF EXISTS `mmm_employee_salary`;
CREATE TABLE `mmm_employee_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `employee_id` int(11) NOT NULL DEFAULT '0' COMMENT '员工id',
  `salary` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工资',
  `note` text NOT NULL COMMENT '备注',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登记时间',
  `add_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT '登记人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工工资表';

-- ----------------------------
-- Records of mmm_employee_salary
-- ----------------------------

-- ----------------------------
-- Table structure for mmm_id_type
-- ----------------------------
DROP TABLE IF EXISTS `mmm_id_type`;
CREATE TABLE `mmm_id_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '证件类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='证件类别表';

-- ----------------------------
-- Records of mmm_id_type
-- ----------------------------
INSERT INTO `mmm_id_type` VALUES ('1', '居民身份证');
INSERT INTO `mmm_id_type` VALUES ('2', '港澳通行证');
INSERT INTO `mmm_id_type` VALUES ('3', '台胞证');
INSERT INTO `mmm_id_type` VALUES ('4', '护照');

-- ----------------------------
-- Table structure for mmm_line
-- ----------------------------
DROP TABLE IF EXISTS `mmm_line`;
CREATE TABLE `mmm_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `line_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '线路类型：1-跟团游，2-自由行',
  `des_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '目的地类型：1-周边，2-国内，3-出境，4-港澳台',
  `title` text COMMENT '线路标题，主标题和副标题之间•分割',
  `day_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '出游天数',
  `start_palce` varchar(255) NOT NULL DEFAULT '' COMMENT '出发城市id，如果是多地出发的，id逗号隔开',
  `des` varchar(255) NOT NULL DEFAULT '' COMMENT '目的地id，多个目的地id用逗号分隔',
  `labelid` varchar(255) NOT NULL DEFAULT '' COMMENT '标签id集合，多个标签id之间用逗号分隔',
  `special` text COMMENT '线路特色，推荐理由',
  `include` text COMMENT '费用包含',
  `not_include` text COMMENT '费用不包含',
  `notice` text COMMENT '购买须知',
  `reference` text COMMENT '参考项目（推荐活动）',
  `counselor` int(11) NOT NULL DEFAULT '0' COMMENT '专属旅游顾问，关联员工表',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '线路状态：1-编辑，2-上线，3-下线，4-删除',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键词',
  `supplier_title` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商线路标题',
  `supplier_op` int(11) NOT NULL DEFAULT '0' COMMENT '供应商op操作员id',
  `add_by` int(11) NOT NULL DEFAULT '0' COMMENT '线路添加人',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `edittime` datetime DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NOT NULL DEFAULT '0' COMMENT '线路最后一次编辑人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100012 DEFAULT CHARSET=utf8 COMMENT='线路表';

-- ----------------------------
-- Records of mmm_line
-- ----------------------------
INSERT INTO `mmm_line` VALUES ('100001', '1', '1', '河源两日游•万绿湖游船', '2', '7', '44', '5', '&lt;p&gt;多少个个好&lt;/p&gt;', null, null, null, null, '7', '2', '河源两日游•万绿湖游船', '河源两日游', '3', '1', null, '2017-02-17 22:40:25', '6');
INSERT INTO `mmm_line` VALUES ('100002', '1', '3', '香港直飞往返【越南】胡志明-头顿•美奈5天纯玩团', '5', '7', '110', '11,9,8', '&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;【&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;参考航班&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;】：&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;★ 乘坐香港捷星太平洋航空，香港直飞往返，正点航班；&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;【&lt;strong&gt;星级体验&lt;/strong&gt;】：&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;★ 全程入住精品酒店，方便出街游玩，头顿1晚4星+美奈2晚海边4星+胡志明1晚5星；&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;【&lt;strong&gt;精选产品&lt;/strong&gt;】：&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;★ 越南著名度假圣地——&lt;/span&gt;&lt;strong style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;【美奈】&lt;/strong&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;：迷人的渔村，一边沙丘一边海，醉人红白沙丘；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;【&lt;strong&gt;美食享受&lt;/strong&gt;】&lt;/span&gt;：&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;★ 全程享受越南风味餐与特色餐，让您充分感受越南美食；&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;【&lt;strong&gt;特别安排&lt;/strong&gt;】：&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;★ 赠送滴壶咖啡；&lt;/span&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;★ 全程豪华旅游大巴接待，赠送每天每人一瓶矿泉水；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;【增值服务】：&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;★ &lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;全程无购物，无自费。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'a:9:{s:7:\"traffic\";a:14:{s:5:\"plane\";s:1:\"1\";s:6:\"交通\";s:189:\"往返经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）、当地旅游巴士、去程船票，出境港口至香港机场去程交通船票\";s:10:\"plane_type\";s:6:\"往返\";s:9:\"plane_fee\";s:99:\"经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）\";s:5:\"train\";i:0;s:3:\"bus\";i:0;s:9:\"local_bus\";s:1:\"1\";s:13:\"local_bus_fee\";s:18:\"当地旅游巴士\";s:4:\"ship\";s:1:\"1\";s:9:\"ship_type\";s:6:\"去程\";s:8:\"ship_fee\";s:6:\"船票\";s:9:\"ship_note\";s:45:\"出境港口至香港机场去程交通船票\";s:13:\"traffic_other\";i:0;s:12:\"united_plane\";i:0;}s:13:\"small_traffic\";a:3:{s:6:\"scenic\";i:0;s:9:\"小交通\";s:0:\"\";s:7:\"shuttle\";i:0;}s:5:\"hotel\";a:4:{s:5:\"hotel\";s:1:\"1\";s:6:\"住宿\";s:24:\"行程所列酒店费用\";s:9:\"hotel_fee\";s:24:\"行程所列酒店费用\";s:6:\"hotel1\";i:0;}s:4:\"food\";a:4:{s:4:\"food\";s:1:\"1\";s:6:\"用餐\";s:18:\"行程所列餐食\";s:8:\"food_fee\";s:18:\"行程所列餐食\";s:5:\"food1\";i:0;}s:6:\"ticket\";a:4:{s:6:\"ticket\";s:1:\"1\";s:6:\"门票\";s:76:\"行程中所列景点首道大门票，不含园中园门票,景区电瓶车\";s:10:\"ticket_fee\";s:36:\"行程中所列景点首道大门票\";s:11:\"ticket_note\";s:37:\"不含园中园门票,景区电瓶车\";}s:7:\"service\";a:6:{s:8:\"service1\";i:0;s:6:\"导服\";s:30:\"全程陪同中文导游服务\";s:8:\"service2\";s:1:\"1\";s:12:\"service2_fee\";s:30:\"全程陪同中文导游服务\";s:8:\"service3\";i:0;s:8:\"service4\";i:0;}s:9:\"insurance\";a:3:{s:9:\"insurance\";s:1:\"1\";s:6:\"保险\";s:15:\"旅游意外险\";s:13:\"insurance_fee\";s:15:\"旅游意外险\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:12:\"其它费用\";s:0:\"\";}s:5:\"child\";a:9:{s:5:\"child\";s:1:\"1\";s:15:\"儿童价标准\";s:76:\"年龄0~12周岁（不含），不占床，含半价机票，餐食，门票\";s:3:\"age\";s:6:\"年龄\";s:7:\"age_min\";s:1:\"0\";s:4:\"age1\";s:1:\"~\";s:7:\"age_max\";s:2:\"12\";s:4:\"age2\";s:21:\"周岁（不含），\";s:8:\"age_type\";s:9:\"不占床\";s:8:\"age_note\";s:33:\"含半价机票，餐食，门票\";}}', 'a:4:{s:7:\"foreign\";a:7:{s:7:\"foreign\";i:0;s:15:\"外宾附加费\";s:127:\"外宾（包括港澳台地区）需要支付500元/人的差价，请在后续附加产品页面中选择外宾附加费选项\";s:8:\"foreign1\";s:1:\"1\";s:12:\"foreign1_fee\";s:45:\"外宾（包括港澳台地区）需要支付\";s:13:\"foreign1_note\";s:10:\"500元/人\";s:13:\"foreign1_fee1\";s:72:\"的差价，请在后续附加产品页面中选择外宾附加费选项\";s:8:\"foreign2\";i:0;}s:4:\"room\";a:4:{s:4:\"room\";s:1:\"1\";s:9:\"单房差\";s:9:\"单房差\";s:8:\"room_fee\";s:9:\"单房差\";s:9:\"room_note\";s:0:\"\";}s:5:\"other\";a:3:{s:5:\"other\";s:1:\"1\";s:6:\"其它\";s:131:\"越南-胡志明旅游落地签证费￥250/人；全程小费￥250；国内到出境港口码头交通及香港机场回程交通\";s:9:\"other_fee\";s:131:\"越南-胡志明旅游落地签证费￥250/人；全程小费￥250；国内到出境港口码头交通及香港机场回程交通\";}s:5:\"extra\";a:10:{s:6:\"extra5\";s:1:\"1\";s:6:\"补充\";s:348:\"出入境个人物品海关征税，超重行李的托运费、保管费、因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用、酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费、“费用包含”中不包含的其它项目\";s:10:\"extra5_fee\";s:72:\"出入境个人物品海关征税，超重行李的托运费、保管费\";s:6:\"extra1\";s:1:\"1\";s:10:\"extra1_fee\";s:132:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用\";s:6:\"extra2\";s:1:\"1\";s:10:\"extra2_fee\";s:90:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费\";s:6:\"extra3\";s:1:\"1\";s:10:\"extra3_fee\";s:45:\"“费用包含”中不包含的其它项目\";s:6:\"extra4\";i:0;}}', '&lt;p style=&quot;margin-bottom:0;margin-bottom:0;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;;color:red&quot;&gt;签证说明：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:21px&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●&lt;/span&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt; 在团队出发前至少提前10个工作日向我社提供游客办理越南落地签资料半年有效期以上的护照信息；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;● 过关资料，2张2寸白底照片；公文（我社将会在出发前一天或当天把落地签公文提供给贵公司，需将公文打印，或者发给游客，游客需要凭越南落地签公文方才能出中国关及入越南关）；入境表（客人根据表格姓名贴一张照片，入越南关口需要用到）；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;;color:red&quot;&gt;温馨提示：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:21px&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;● 按照航空公司条例：提前7个工作日出团队机票，一旦误机或出票后因客人个人问题不能参团机票款及机场税均不允许退税；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:21px&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;● 2岁周岁以下婴儿1000元全含；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;● 有高血压，心脏病，恐高症以及脊椎，腰椎，关节本身有伤病的客人，孕妇，小孩以及50岁以上的老人等不适于乘船过岛，如坚持要过岛者若发生意外事件，一切后果请自行负责。在出海乘坐快艇中出现的受伤，生命危险或者死亡的情况，我们会尽力协助客人，但所有产生的费用由客人承担，同时就此我社不承担赔偿责任；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;strong style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 13px; font-family: 微软雅黑, sans-serif; color: red;&quot;&gt;注意事项：&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;text-align: justify; font-size: 13px; font-family: 微软雅黑, sans-serif;&quot;&gt;●&lt;/span&gt;&lt;span style=&quot;text-align: justify; font-size: 13px; font-family: 微软雅黑, sans-serif;&quot;&gt;如遇不可抗力原因（包括地震、台风、雷击、水灾、火山爆发等自然原因,以及战争、政府行为、罢工、爆炸、疫情、堵车等不能预见）或旅行社已尽合理注意义务后仍不能避免的情况，我公司有权合理调整行程，由此减少的费用退还旅游者，由此增加的费用由旅游者承担!&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●由于路程是相对固定的，若前一站的景点观光时间有拖延或途中遇到塞车等不可抗拒的原因，势必会影响到下一个景点的观光时间，可能造成下一个景点游玩时间的缩短，不便之处，敬请谅解！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●班机若因航空公司或不可抗力因素而变动航班时间，造成团体行程前后顺序变更增加餐食本公司不另行加价，如减少餐食，不退费用，敬请谅解。在不减少景点的情况下我社有可能根据实际情况调整行程及餐食前后顺序。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●最终确定住的酒店为此行程所列酒店中的一家，由旅行社按照实际预订情况进行安排，具体按签旅游合同时所附行程中的酒店为准&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●由于境外酒店与国内酒店星级评定标准有所不同，合同所附行程中所列酒店的标准不标注星级。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●境外住宿安排两人一间，因当地酒店和VILLA以大床房为主，房型不可指定，敬请谅解。请在报名时书面告知我社，游客拼房的情况。如未事先说明，我社均根据“同性别拼房”原则分配房间。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●房间如出现单男或单女情况，请安排该客人拼房，本公司将于出发前两天通知是否可以拼房，可拼房游客，未事先说明，我社均根据“同性别拼房”原则分配房间。如未能拼房者，可选择与同行亲友共享双人房并加床（加床者按占半房收费，即三人一房）；如客人不愿意与同行亲友共享三人房，就需支付单人房附加费，享用单人房间。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●境外行程期间，游客不得随意离团，离团必须签署离团切结书。离团期间出现人身安全、财产损失，在旅行社尽到安全提示及救助义务的前提下，由旅游者自行承担相应责任。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●自由活动当天，如客人需自己安排行程，请注意财务与人身安全。千万不可与当地非正规旅行社私自接洽活动项目，若由此发生人身伤害或者财产损失，在旅行社尽到安全提示及救助义务的前提下，由旅游者自行承担相应责任。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●根据境外服务业惯例，境外服务人员有收取服务小费的习惯，出于国际礼节，对于漂流工作人员、SPA服务人员、酒店服&lt;/span&gt;&lt;span style=&quot;font-family: 微软雅黑, sans-serif; font-size: 13px; text-align: justify;&quot;&gt;务人员，以及其他服务人员，您可以自愿给予其相当于人民币10元左右的小费&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●境外spa服务标准，限制12周岁以下的儿童报名。行程中的水上活动谢绝12周岁以下和65周岁以上游客参加，如果游客要求参与的，必须现场签写切结书。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●根据当地法律规定，导游和司机每天工作时间不得超过10小时。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●部分国家和地区出于节能考虑，对旅游大巴车辆启动空调的时间有明确要求，旅游者可能结束游览进入旅游大巴时温度不太适宜。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●请不要将贵重物品及自用应急药品放在托运行李中，以免丢失。 旅游过程中，也请妥善保存。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●酒店房间有可能出现两张床尺寸不一致情况，请您理解。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●如客人系港澳台人士，或持外籍护照，请于出发前确认是否有再次进入中国的有效证件。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●凡持公务护照，请让客人自行到外事办公室或相关部门开具出国申请表或相关出国证明。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●贵社有客人持非中国籍护照，请一定核实客人所做的中国签证是否为多次往返，否则将无法正常返回中国。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-align: justify;text-justify:inter-ideograph;line-height:normal&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●明确提示：孕妇不适合长途旅游，建议不要参团，如隐瞒或执意参团出现任何问题将自行负责；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;●票为团队票，一旦出票就不得签转、不得更改、不得改期或退票。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;;color:white&quot;&gt;注意&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;', null, '2', '2', '香港直飞往返【越南】胡志明-头顿•美奈5天纯玩团', '【越南】胡志明•头顿-美奈5天纯玩团', '3', '1', null, '2017-02-23 11:36:39', '6');
INSERT INTO `mmm_line` VALUES ('100003', '1', '1', '惠州特惠三日游•三角洲-出海捕鱼，放飞自我', '3', '7', '36', '2,1', '&lt;p&gt;1、双方都官方；&lt;/p&gt;&lt;p&gt;2、好回来开会。&lt;/p&gt;', 'a:9:{s:7:\"traffic\";a:20:{s:5:\"plane\";s:1:\"1\";s:6:\"交通\";s:248:\"去程经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）、去程、去程旅游巴士、当地旅游巴士、去程船票，发送到、sdsd 、往返出发地到出行集合地的联运航班机票\";s:10:\"plane_type\";s:6:\"去程\";s:9:\"plane_fee\";s:99:\"经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）\";s:5:\"train\";s:1:\"1\";s:10:\"train_type\";s:6:\"去程\";s:15:\"train_seat_type\";s:0:\"\";s:3:\"bus\";s:1:\"1\";s:8:\"bus_type\";s:6:\"去程\";s:7:\"bus_fee\";s:12:\"旅游巴士\";s:9:\"local_bus\";s:1:\"1\";s:13:\"local_bus_fee\";s:18:\"当地旅游巴士\";s:4:\"ship\";s:1:\"1\";s:9:\"ship_type\";s:6:\"去程\";s:8:\"ship_fee\";s:6:\"船票\";s:9:\"ship_note\";s:9:\"发送到\";s:13:\"traffic_other\";s:1:\"1\";s:14:\"traffic_other1\";s:5:\"sdsd \";s:12:\"united_plane\";s:1:\"1\";s:16:\"united_plane_fee\";s:54:\"往返出发地到出行集合地的联运航班机票\";}s:13:\"small_traffic\";a:9:{s:6:\"scenic\";s:1:\"1\";s:9:\"小交通\";s:60:\"景区内用车，艾瑞网、发的机场去程送机服务\";s:10:\"scenic_fee\";s:15:\"景区内用车\";s:11:\"scenic_note\";s:9:\"艾瑞网\";s:7:\"shuttle\";s:1:\"1\";s:13:\"shuttle_where\";s:6:\"发的\";s:11:\"shuttle_fee\";s:6:\"机场\";s:12:\"shuttle_type\";s:12:\"去程送机\";s:15:\"shuttle_service\";s:6:\"服务\";}s:5:\"hotel\";a:5:{s:5:\"hotel\";s:1:\"1\";s:6:\"住宿\";s:42:\"行程所列酒店费用、收到电风扇\";s:9:\"hotel_fee\";s:24:\"行程所列酒店费用\";s:6:\"hotel1\";s:1:\"1\";s:10:\"hotel_note\";s:15:\"收到电风扇\";}s:4:\"food\";a:5:{s:4:\"food\";s:1:\"1\";s:6:\"用餐\";s:33:\"行程所列餐食、放电饭锅\";s:8:\"food_fee\";s:18:\"行程所列餐食\";s:5:\"food1\";s:1:\"1\";s:9:\"food_note\";s:12:\"放电饭锅\";}s:6:\"ticket\";a:4:{s:6:\"ticket\";s:1:\"1\";s:6:\"门票\";s:36:\"行程中所列景点首道大门票\";s:10:\"ticket_fee\";s:36:\"行程中所列景点首道大门票\";s:11:\"ticket_note\";s:0:\"\";}s:7:\"service\";a:9:{s:8:\"service1\";s:1:\"1\";s:6:\"导服\";s:102:\"全陪和当地中文导游服务、全程陪同中文导游服务、当地中文导游服务、发的\";s:12:\"service1_fee\";s:33:\"全陪和当地中文导游服务\";s:8:\"service2\";s:1:\"1\";s:12:\"service2_fee\";s:30:\"全程陪同中文导游服务\";s:8:\"service3\";s:1:\"1\";s:12:\"service3_fee\";s:24:\"当地中文导游服务\";s:8:\"service4\";s:1:\"1\";s:12:\"service4_fee\";s:6:\"发的\";}s:9:\"insurance\";a:3:{s:9:\"insurance\";s:1:\"1\";s:6:\"保险\";s:6:\"导服\";s:13:\"insurance_fee\";s:6:\"导服\";}s:5:\"other\";a:3:{s:5:\"other\";s:1:\"1\";s:12:\"其它费用\";s:6:\"导服\";s:9:\"other_fee\";s:6:\"导服\";}s:5:\"child\";a:3:{s:5:\"child\";s:1:\"3\";s:15:\"儿童价标准\";s:12:\"想   发给\";s:10:\"child_note\";s:12:\"想   发给\";}}', 'a:4:{s:7:\"foreign\";a:7:{s:7:\"foreign\";s:1:\"1\";s:15:\"外宾附加费\";s:135:\"外宾（不包括港澳台地区）需要支付人民币200元的差价，请在后续附加产品页面中选择外宾附加费选项\";s:11:\"foreign_fee\";s:48:\"外宾（不包括港澳台地区）需要支付\";s:12:\"foreign_note\";s:15:\"人民币200元\";s:12:\"foreign_fee1\";s:72:\"的差价，请在后续附加产品页面中选择外宾附加费选项\";s:8:\"foreign1\";i:0;s:8:\"foreign2\";i:0;}s:4:\"room\";a:4:{s:4:\"room\";s:1:\"1\";s:9:\"单房差\";s:39:\"单房差，酒店不提供自然单间\";s:8:\"room_fee\";s:9:\"单房差\";s:9:\"room_note\";s:27:\"酒店不提供自然单间\";}s:5:\"other\";a:3:{s:5:\"other\";s:1:\"1\";s:6:\"其它\";s:15:\"园中园门票\";s:9:\"other_fee\";s:15:\"园中园门票\";}s:5:\"extra\";a:7:{s:6:\"extra1\";i:0;s:6:\"补充\";s:138:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费、“费用包含”中不包含的其它项目\";s:6:\"extra2\";s:1:\"1\";s:10:\"extra2_fee\";s:90:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费\";s:6:\"extra3\";s:1:\"1\";s:10:\"extra3_fee\";s:45:\"“费用包含”中不包含的其它项目\";s:6:\"extra4\";i:0;}}', '&lt;p&gt;1、第三方导服 等等是否；&lt;/p&gt;&lt;p&gt;2、第三方电风扇发给；&lt;/p&gt;', '&lt;p&gt;1、十大四大法；&lt;/p&gt;&lt;p&gt;2、三分电饭锅。&lt;/p&gt;', '2', '2', '惠州特惠三日游•三角洲-出海捕鱼，放飞自我', '惠州特惠三日游', '4', '1', '2017-01-04 10:47:13', '2017-02-17 22:37:17', '6');
INSERT INTO `mmm_line` VALUES ('100004', '2', '2', '云南5天4晚游•香格里拉彩云之南', '5', '7', '47', '5,6,11', '&lt;p&gt;到发货的方式&lt;/p&gt;', null, null, null, null, '2', '2', '云南5天4晚游•香格里拉彩云之南', '云南6天5晚游爱粉底霜粉底膏', '5', '6', '2017-01-05 22:09:32', '2017-02-17 22:42:25', '6');
INSERT INTO `mmm_line` VALUES ('100005', '2', '1', '英德赏花一日游•踏青节赏花', '1', '7', '41', '1,4,7,10', '', null, null, null, null, '0', '2', '英德赏花一日游•踏青节赏花', '', '0', '1', '2017-02-17 22:50:27', '2017-02-17 22:54:44', '6');
INSERT INTO `mmm_line` VALUES ('100006', '1', '1', '清远漂流2日游•新银盏温泉-古龙峡漂流', '2', '7', '37', '2,10,11', '', null, null, null, null, '0', '2', '清远漂流2日游•新银盏温泉-古龙峡漂流', '', '0', '11', '2017-02-17 22:50:32', '2017-02-17 22:52:32', '6');
INSERT INTO `mmm_line` VALUES ('100007', '2', '1', '珠海两日游•畅游长隆海洋世界', '2', '7', '42', '6,10,11', '', null, null, null, null, '2', '2', '珠海两日游•畅游长隆海洋世界', '', '0', '1', '2017-02-17 22:56:39', '2017-02-17 22:58:43', '6');
INSERT INTO `mmm_line` VALUES ('100008', '1', '2', '醉美阳朔三日游•银子岩，原始部落，漓江', '3', '7', '45', '6,10', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;1、费用全含，一票玩遍阳朔；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;2、主民居，体验当地特色风情；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;3、20元景点，体验不一样的漓江山水&lt;/span&gt;&lt;/p&gt;', 'a:9:{s:7:\"traffic\";a:10:{s:5:\"plane\";i:0;s:6:\"交通\";s:18:\"往返旅游巴士\";s:5:\"train\";i:0;s:3:\"bus\";s:1:\"1\";s:8:\"bus_type\";s:6:\"往返\";s:7:\"bus_fee\";s:12:\"旅游巴士\";s:9:\"local_bus\";i:0;s:4:\"ship\";i:0;s:13:\"traffic_other\";i:0;s:12:\"united_plane\";i:0;}s:13:\"small_traffic\";a:3:{s:6:\"scenic\";i:0;s:9:\"小交通\";s:0:\"\";s:7:\"shuttle\";i:0;}s:5:\"hotel\";a:4:{s:5:\"hotel\";s:1:\"1\";s:6:\"住宿\";s:24:\"行程所列酒店费用\";s:9:\"hotel_fee\";s:24:\"行程所列酒店费用\";s:6:\"hotel1\";i:0;}s:4:\"food\";a:4:{s:4:\"food\";s:1:\"1\";s:6:\"用餐\";s:18:\"行程所列餐食\";s:8:\"food_fee\";s:18:\"行程所列餐食\";s:5:\"food1\";i:0;}s:6:\"ticket\";a:4:{s:6:\"ticket\";s:1:\"1\";s:6:\"门票\";s:36:\"行程中所列景点首道大门票\";s:10:\"ticket_fee\";s:36:\"行程中所列景点首道大门票\";s:11:\"ticket_note\";s:0:\"\";}s:7:\"service\";a:6:{s:8:\"service1\";i:0;s:6:\"导服\";s:30:\"全程陪同中文导游服务\";s:8:\"service2\";s:1:\"1\";s:12:\"service2_fee\";s:30:\"全程陪同中文导游服务\";s:8:\"service3\";i:0;s:8:\"service4\";i:0;}s:9:\"insurance\";a:2:{s:9:\"insurance\";i:0;s:6:\"保险\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:12:\"其它费用\";s:0:\"\";}s:5:\"child\";a:2:{s:5:\"child\";i:0;s:15:\"儿童价标准\";s:0:\"\";}}', 'a:4:{s:7:\"foreign\";a:4:{s:7:\"foreign\";i:0;s:15:\"外宾附加费\";s:0:\"\";s:8:\"foreign1\";i:0;s:8:\"foreign2\";i:0;}s:4:\"room\";a:4:{s:4:\"room\";s:1:\"1\";s:9:\"单房差\";s:9:\"单房差\";s:8:\"room_fee\";s:9:\"单房差\";s:9:\"room_note\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:6:\"其它\";s:0:\"\";}s:5:\"extra\";a:9:{s:6:\"extra5\";i:0;s:6:\"补充\";s:273:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用、酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费、“费用包含”中不包含的其它项目\";s:6:\"extra1\";s:1:\"1\";s:10:\"extra1_fee\";s:132:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用\";s:6:\"extra2\";s:1:\"1\";s:10:\"extra2_fee\";s:90:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费\";s:6:\"extra3\";s:1:\"1\";s:10:\"extra3_fee\";s:45:\"“费用包含”中不包含的其它项目\";s:6:\"extra4\";i:0;}}', '&lt;p&gt;1、注意安全&lt;/p&gt;&lt;p&gt;2、注意个人财物，以防丢失&lt;/p&gt;', null, '7', '2', '醉美阳朔三日游•银子岩，原始部落，漓江', '', '0', '6', '2017-02-27 20:19:14', null, '0');
INSERT INTO `mmm_line` VALUES ('100009', '1', '2', '厦门鼓浪屿3日2晚•一趟玩遍厦门~ 畅游鼓浪屿~邂逅风情街', '3', '7', '120', '9,10', '', 'a:9:{s:7:\"traffic\";a:10:{s:5:\"plane\";i:0;s:6:\"交通\";s:21:\"往返动车二等座\";s:5:\"train\";s:1:\"1\";s:10:\"train_type\";s:6:\"往返\";s:15:\"train_seat_type\";s:15:\"动车二等座\";s:3:\"bus\";i:0;s:9:\"local_bus\";i:0;s:4:\"ship\";i:0;s:13:\"traffic_other\";i:0;s:12:\"united_plane\";i:0;}s:13:\"small_traffic\";a:3:{s:6:\"scenic\";i:0;s:9:\"小交通\";s:0:\"\";s:7:\"shuttle\";i:0;}s:5:\"hotel\";a:4:{s:5:\"hotel\";s:1:\"1\";s:6:\"住宿\";s:24:\"行程所列酒店费用\";s:9:\"hotel_fee\";s:24:\"行程所列酒店费用\";s:6:\"hotel1\";i:0;}s:4:\"food\";a:4:{s:4:\"food\";s:1:\"1\";s:6:\"用餐\";s:18:\"行程所列餐食\";s:8:\"food_fee\";s:18:\"行程所列餐食\";s:5:\"food1\";i:0;}s:6:\"ticket\";a:4:{s:6:\"ticket\";s:1:\"1\";s:6:\"门票\";s:36:\"行程中所列景点首道大门票\";s:10:\"ticket_fee\";s:36:\"行程中所列景点首道大门票\";s:11:\"ticket_note\";s:0:\"\";}s:7:\"service\";a:6:{s:8:\"service1\";i:0;s:6:\"导服\";s:24:\"当地中文导游服务\";s:8:\"service2\";i:0;s:8:\"service3\";s:1:\"1\";s:12:\"service3_fee\";s:24:\"当地中文导游服务\";s:8:\"service4\";i:0;}s:9:\"insurance\";a:2:{s:9:\"insurance\";i:0;s:6:\"保险\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:12:\"其它费用\";s:0:\"\";}s:5:\"child\";a:3:{s:5:\"child\";s:1:\"3\";s:15:\"儿童价标准\";s:259:\"只含当地车费、导服费、半正餐费用；（早餐、动车票及其余费用自理，儿童动车票：1.2米以下儿童免票（不占座位），1.2-1.5米儿童二等车厢半价车票(票面79.5元)，1.5米以上儿童二等车票全票。）\";s:10:\"child_note\";s:259:\"只含当地车费、导服费、半正餐费用；（早餐、动车票及其余费用自理，儿童动车票：1.2米以下儿童免票（不占座位），1.2-1.5米儿童二等车厢半价车票(票面79.5元)，1.5米以上儿童二等车票全票。）\";}}', 'a:4:{s:7:\"foreign\";a:5:{s:7:\"foreign\";i:0;s:15:\"外宾附加费\";s:150:\"本产品的起价适用持中国居民身份证或中国护照的游客，持其他国家或地区证件的游客请选择对应的选项补足差额\";s:8:\"foreign1\";i:0;s:8:\"foreign2\";s:1:\"1\";s:12:\"foreign2_fee\";s:150:\"本产品的起价适用持中国居民身份证或中国护照的游客，持其他国家或地区证件的游客请选择对应的选项补足差额\";}s:4:\"room\";a:4:{s:4:\"room\";s:1:\"1\";s:9:\"单房差\";s:9:\"单房差\";s:8:\"room_fee\";s:9:\"单房差\";s:9:\"room_note\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:6:\"其它\";s:0:\"\";}s:5:\"extra\";a:9:{s:6:\"extra5\";i:0;s:6:\"补充\";s:273:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用、酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费、“费用包含”中不包含的其它项目\";s:6:\"extra1\";s:1:\"1\";s:10:\"extra1_fee\";s:132:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用\";s:6:\"extra2\";s:1:\"1\";s:10:\"extra2_fee\";s:90:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费\";s:6:\"extra3\";s:1:\"1\";s:10:\"extra3_fee\";s:45:\"“费用包含”中不包含的其它项目\";s:6:\"extra4\";i:0;}}', '&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size: 14px;&quot;&gt;为了您人身、财产的安全，请您避免在公开场合暴露贵重物品及大量现金。上街时需时刻看管好首饰、相机等随身物品。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;游泳、漂流、潜水、滑雪、溜冰、戏雪等活动项目，均存在危险。参与前请根据自身条件，并充分参考当地相关部门及其它专业机构的相关公告和建议后量力而行。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 从出行常识、旅游活动（风险性项目）和特殊人群三方面为您提供旅游安全指南，请您仔细阅读,&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt; 安全指南及警示&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;为普及旅游安全知识及旅游文明公约，使您的旅程顺利圆满完成，特制定&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt; 《携程旅游告游客注意事项》&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;，请您认真阅读并切实遵守。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;为确保锂电池的安全运输，避免发生不安全事件，我们友情提醒您，民航局将对旅客携带锂电池乘机进行严格检查。详情请参考&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt; 民航局关于旅客行李中携带“锂电池、充电宝”乘机规定的公告&lt;/span&gt;。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', null, '2', '2', '厦门鼓浪屿3日2晚•一趟玩遍厦门~ 畅游鼓浪屿~邂逅风情街', '', '0', '6', '2017-02-27 21:00:51', null, '0');
INSERT INTO `mmm_line` VALUES ('100010', '1', '2', '海南三亚4日3晚游•【海岛之旅】西岛+天涯海角+万泉河纯玩全景', '4', '7', '121', '11,12', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;★ 资深全陪全程陪同服务，已含往返轮渡85元/人费用，含海南政府调节基金&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;★ 绝不更换景点（不可抗力因素除外）、不减少景点、不压缩游览时间。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;★ 赠送每人价值30元的潜水优惠券（不做现金使用，不潜水不退现金）&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'a:9:{s:7:\"traffic\";a:10:{s:5:\"plane\";i:0;s:6:\"交通\";s:18:\"往返旅游巴士\";s:5:\"train\";i:0;s:3:\"bus\";s:1:\"1\";s:8:\"bus_type\";s:6:\"往返\";s:7:\"bus_fee\";s:12:\"旅游巴士\";s:9:\"local_bus\";i:0;s:4:\"ship\";i:0;s:13:\"traffic_other\";i:0;s:12:\"united_plane\";i:0;}s:13:\"small_traffic\";a:3:{s:6:\"scenic\";i:0;s:9:\"小交通\";s:0:\"\";s:7:\"shuttle\";i:0;}s:5:\"hotel\";a:4:{s:5:\"hotel\";s:1:\"1\";s:6:\"住宿\";s:24:\"行程所列酒店费用\";s:9:\"hotel_fee\";s:24:\"行程所列酒店费用\";s:6:\"hotel1\";i:0;}s:4:\"food\";a:4:{s:4:\"food\";s:1:\"1\";s:6:\"用餐\";s:18:\"行程所列餐食\";s:8:\"food_fee\";s:18:\"行程所列餐食\";s:5:\"food1\";i:0;}s:6:\"ticket\";a:4:{s:6:\"ticket\";s:1:\"1\";s:6:\"门票\";s:36:\"行程中所列景点首道大门票\";s:10:\"ticket_fee\";s:36:\"行程中所列景点首道大门票\";s:11:\"ticket_note\";s:0:\"\";}s:7:\"service\";a:6:{s:8:\"service1\";i:0;s:6:\"导服\";s:30:\"全程陪同中文导游服务\";s:8:\"service2\";s:1:\"1\";s:12:\"service2_fee\";s:30:\"全程陪同中文导游服务\";s:8:\"service3\";i:0;s:8:\"service4\";i:0;}s:9:\"insurance\";a:2:{s:9:\"insurance\";i:0;s:6:\"保险\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:12:\"其它费用\";s:0:\"\";}s:5:\"child\";a:3:{s:5:\"child\";s:1:\"3\";s:15:\"儿童价标准\";s:275:\"1.1米以下的小童：498元/人：含车座位、半价餐，不占床位、超高1.1米门票自理；\r\n1.1米--1.4米儿童：798元/人：含车座、不占床（不含酒店早餐）、半餐、半价门票（此半价为门市半价）；\r\n1.4米以上大小同价。\";s:10:\"child_note\";s:275:\"1.1米以下的小童：498元/人：含车座位、半价餐，不占床位、超高1.1米门票自理；\r\n1.1米--1.4米儿童：798元/人：含车座、不占床（不含酒店早餐）、半餐、半价门票（此半价为门市半价）；\r\n1.4米以上大小同价。\";}}', 'a:4:{s:7:\"foreign\";a:5:{s:7:\"foreign\";i:0;s:15:\"外宾附加费\";s:150:\"本产品的起价适用持中国居民身份证或中国护照的游客，持其他国家或地区证件的游客请选择对应的选项补足差额\";s:8:\"foreign1\";i:0;s:8:\"foreign2\";s:1:\"1\";s:12:\"foreign2_fee\";s:150:\"本产品的起价适用持中国居民身份证或中国护照的游客，持其他国家或地区证件的游客请选择对应的选项补足差额\";}s:4:\"room\";a:4:{s:4:\"room\";s:1:\"1\";s:9:\"单房差\";s:9:\"单房差\";s:8:\"room_fee\";s:9:\"单房差\";s:9:\"room_note\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:6:\"其它\";s:0:\"\";}s:5:\"extra\";a:9:{s:6:\"extra5\";i:0;s:6:\"补充\";s:273:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用、酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费、“费用包含”中不包含的其它项目\";s:6:\"extra1\";s:1:\"1\";s:10:\"extra1_fee\";s:132:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用\";s:6:\"extra2\";s:1:\"1\";s:10:\"extra2_fee\";s:90:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费\";s:6:\"extra3\";s:1:\"1\";s:10:\"extra3_fee\";s:45:\"“费用包含”中不包含的其它项目\";s:6:\"extra4\";i:0;}}', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 本产品行程中所列时间仅供参考，在不减少景点且征得客人同意的前提下，导游、司机可能会根据天气、交通等情况，对您的行程进行适当调整（如调整景点游览顺序等），以确保行程顺利进行。如因不可抗力等因素确实无法执行原行程计划，对于因此而造成的费用变更，我社实行多退少补，敬请配合。。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 出游过程中，如遇人力不可抗拒因素所造成的景点未去，导游将根据实际情况取消或更换该景点，或由导游现场按旅行社折扣价退还门票费用，退费不以景区挂牌价为准，敬请谅解。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 行程中的赠送项目，如因交通、天气等不可抗因素导致不能赠送的、或因您个人原因不能参观的，费用不退，敬请谅解。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 本产品门票为团队优惠联票，持老年证、军官证、学生证等优惠证件的人群均不再享受门票优惠。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 行程有售卖当地特色产品的购物店，请配合团进团出，不强制购物，请您谨慎消费，保留好票据。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', null, '7', '2', '海南三亚4日3晚游•【海岛之旅】西岛+天涯海角+万泉河纯玩全景', '', '0', '6', '2017-02-27 21:39:56', '2017-02-27 21:41:41', '6');
INSERT INTO `mmm_line` VALUES ('100011', '1', '3', '日本6日5晚游•畅游东京+大阪+京都+富士山+樱花唯美季', '6', '7', '27', '4,8,9', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;★ 保证入住1晚露天温泉酒店, 穿日式和服泡展望露天温泉难忘体验&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;★ 全程尽享丰富日式美食，温泉宴会料理、至尊和牛黑豚一品海鲜锅；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;★ 日本最早绽放河津樱, 给你先睹为快, 著名河津樱花祭&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'a:9:{s:7:\"traffic\";a:10:{s:5:\"plane\";s:1:\"1\";s:6:\"交通\";s:105:\"往返经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）\";s:10:\"plane_type\";s:6:\"往返\";s:9:\"plane_fee\";s:99:\"经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）\";s:5:\"train\";i:0;s:3:\"bus\";i:0;s:9:\"local_bus\";i:0;s:4:\"ship\";i:0;s:13:\"traffic_other\";i:0;s:12:\"united_plane\";i:0;}s:13:\"small_traffic\";a:3:{s:6:\"scenic\";i:0;s:9:\"小交通\";s:0:\"\";s:7:\"shuttle\";i:0;}s:5:\"hotel\";a:4:{s:5:\"hotel\";s:1:\"1\";s:6:\"住宿\";s:24:\"行程所列酒店费用\";s:9:\"hotel_fee\";s:24:\"行程所列酒店费用\";s:6:\"hotel1\";i:0;}s:4:\"food\";a:4:{s:4:\"food\";s:1:\"1\";s:6:\"用餐\";s:18:\"行程所列餐食\";s:8:\"food_fee\";s:18:\"行程所列餐食\";s:5:\"food1\";i:0;}s:6:\"ticket\";a:4:{s:6:\"ticket\";s:1:\"1\";s:6:\"门票\";s:36:\"行程中所列景点首道大门票\";s:10:\"ticket_fee\";s:36:\"行程中所列景点首道大门票\";s:11:\"ticket_note\";s:0:\"\";}s:7:\"service\";a:6:{s:8:\"service1\";s:1:\"1\";s:6:\"导服\";s:33:\"全陪和当地中文导游服务\";s:12:\"service1_fee\";s:33:\"全陪和当地中文导游服务\";s:8:\"service2\";i:0;s:8:\"service3\";i:0;s:8:\"service4\";i:0;}s:9:\"insurance\";a:2:{s:9:\"insurance\";i:0;s:6:\"保险\";s:0:\"\";}s:5:\"other\";a:3:{s:5:\"other\";s:1:\"1\";s:12:\"其它费用\";s:346:\"日本团签、旅游签证费用。\r\n包含团队签证费用，客人需要在客服的指引下准备好办理团签的资料，由旅行社统一时间送签任何签证都不能保证百分百出签，旅行社起到引导作用，游客需要配合补充团签资料。最终出签与否由领馆判定，团签出签率高达百分之99！\";s:9:\"other_fee\";s:346:\"日本团签、旅游签证费用。\r\n包含团队签证费用，客人需要在客服的指引下准备好办理团签的资料，由旅行社统一时间送签任何签证都不能保证百分百出签，旅行社起到引导作用，游客需要配合补充团签资料。最终出签与否由领馆判定，团签出签率高达百分之99！\";}s:5:\"child\";a:3:{s:5:\"child\";s:1:\"3\";s:15:\"儿童价标准\";s:58:\"年龄2--12周岁（不含）,占床,服务标准同成人\";s:10:\"child_note\";s:58:\"年龄2--12周岁（不含）,占床,服务标准同成人\";}}', 'a:4:{s:7:\"foreign\";a:5:{s:7:\"foreign\";i:0;s:15:\"外宾附加费\";s:150:\"本产品的起价适用持中国居民身份证或中国护照的游客，持其他国家或地区证件的游客请选择对应的选项补足差额\";s:8:\"foreign1\";i:0;s:8:\"foreign2\";s:1:\"1\";s:12:\"foreign2_fee\";s:150:\"本产品的起价适用持中国居民身份证或中国护照的游客，持其他国家或地区证件的游客请选择对应的选项补足差额\";}s:4:\"room\";a:4:{s:4:\"room\";s:1:\"1\";s:9:\"单房差\";s:9:\"单房差\";s:8:\"room_fee\";s:9:\"单房差\";s:9:\"room_note\";s:0:\"\";}s:5:\"other\";a:2:{s:5:\"other\";i:0;s:6:\"其它\";s:0:\"\";}s:5:\"extra\";a:10:{s:6:\"extra5\";s:1:\"1\";s:6:\"补充\";s:348:\"出入境个人物品海关征税，超重行李的托运费、保管费、因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用、酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费、“费用包含”中不包含的其它项目\";s:10:\"extra5_fee\";s:72:\"出入境个人物品海关征税，超重行李的托运费、保管费\";s:6:\"extra1\";s:1:\"1\";s:10:\"extra1_fee\";s:132:\"因交通延阻、罢工、天气、飞机、机器故障、航班取消或更改时间等不可抗力原因所导致的额外费用\";s:6:\"extra2\";s:1:\"1\";s:10:\"extra2_fee\";s:90:\"酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费\";s:6:\"extra3\";s:1:\"1\";s:10:\"extra3_fee\";s:45:\"“费用包含”中不包含的其它项目\";s:6:\"extra4\";i:0;}}', '&lt;ul class=&quot; list-paddingleft-2&quot; style=&quot;list-style-type: circle;&quot;&gt;&lt;li&gt;&lt;p&gt;最终的航班信息请以出团说明会或出团通知书为准。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;此产品使用包位航班，具体航班号及航班时刻待定，请以最终机票上的信息为准，届时我司会通知您，包位航班不接受您的更改及退订要求，敬请谅解。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;如因意外事件及不可抗力，包括但不限于，航空公司运力调配、航权审核、机场临时关闭、天气原因、航空管制等，导致航班取消或延期的，旅行社将尽最大努力协助您办理变更事宜，如产生差价，多退少补。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;具体航班号及航班时刻，请以最终所出机票信息为准。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;您选购的机票若是团队机票，机票票号无法提前查询，同时不能提前办理值机，具体信息以出团通知书为准，敬请谅解。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;本行程为我社委托当地旅行社散客拼团线路，在保证承诺的服务内容和标准不变的前提下，会与其他旅行社的客人拼成一个团，统一安排行程。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;出游过程中，如遇不可抗力因素造成景点未能正常游玩，导游经与客人协商后可根据实际情况取消或更换该景点，或由导游在现场按旅游产品中的门票价退还费用，退费不以景区挂牌价为准，敬请谅解。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;行程中的赠送项目，如因交通、天气等不可抗因素导致不能赠送的、或因您个人原因不能参观的，费用不退，敬请谅解。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;团队行程中，非自由活动期间，不允许提前离团或中途脱团，如有不便敬请谅解。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;本产品会在当地由导游根据具体情况推荐自费项目，一般为套餐形式，您可根据自身需要选择是否参加，绝无强制消费。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;所有确认入住的酒店以我公司的“出团说明书”为准。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;因当地经济条件有限，交通、酒店服务及设施、餐饮等方面与发达城市相比会有一定的差距，敬请谅解。&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', null, '2', '2', '日本6日5晚游•畅游东京+大阪+京都+富士山+樱花唯美季', '', '0', '6', '2017-02-27 22:12:19', null, '0');

-- ----------------------------
-- Table structure for mmm_line_date
-- ----------------------------
DROP TABLE IF EXISTS `mmm_line_date`;
CREATE TABLE `mmm_line_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lineid` int(11) NOT NULL DEFAULT '0' COMMENT '线路id',
  `line_date` datetime NOT NULL COMMENT '出游日期',
  `adult_price` int(11) NOT NULL DEFAULT '0' COMMENT '成人价格',
  `child_price` int(11) NOT NULL DEFAULT '0' COMMENT '儿童价格',
  `single_room` int(11) NOT NULL DEFAULT '0' COMMENT '单房差',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '班期状态：1-开启，2-关闭',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(11) NOT NULL DEFAULT '0' COMMENT '添加人',
  PRIMARY KEY (`id`),
  KEY `lineid` (`lineid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='线路对应的出游日期价格表';

-- ----------------------------
-- Records of mmm_line_date
-- ----------------------------
INSERT INTO `mmm_line_date` VALUES ('1', '100003', '2017-02-03 00:00:00', '333', '444', '555', '2', '2017-02-05 15:01:54', '1');
INSERT INTO `mmm_line_date` VALUES ('2', '100003', '2017-02-22 00:00:00', '401', '201', '61', '1', '2017-02-05 15:02:32', '1');
INSERT INTO `mmm_line_date` VALUES ('3', '100003', '2017-03-04 00:00:00', '601', '401', '151', '2', '2017-02-05 15:09:23', '1');
INSERT INTO `mmm_line_date` VALUES ('4', '100003', '2017-03-14 00:00:00', '502', '202', '102', '1', '2017-02-05 17:22:46', '1');
INSERT INTO `mmm_line_date` VALUES ('5', '100003', '2017-03-05 00:00:00', '11', '9', '7', '1', '2017-02-05 20:54:59', '6');
INSERT INTO `mmm_line_date` VALUES ('6', '100003', '2017-02-10 00:00:00', '40', '30', '10', '1', '2017-02-05 20:59:25', '6');
INSERT INTO `mmm_line_date` VALUES ('7', '100003', '2017-02-17 00:00:00', '9', '8', '7', '1', '2017-02-05 21:04:14', '6');
INSERT INTO `mmm_line_date` VALUES ('8', '100003', '2017-03-17 00:00:00', '44', '33', '22', '2', '2017-02-06 00:38:43', '6');
INSERT INTO `mmm_line_date` VALUES ('9', '100002', '2017-02-10 00:00:00', '100', '60', '20', '2', '2017-02-06 15:30:29', '6');
INSERT INTO `mmm_line_date` VALUES ('10', '100002', '2017-02-17 00:00:00', '100', '60', '20', '2', '2017-02-06 15:30:29', '6');
INSERT INTO `mmm_line_date` VALUES ('11', '100002', '2017-02-24 00:00:00', '3580', '3180', '900', '1', '2017-02-06 15:30:29', '6');
INSERT INTO `mmm_line_date` VALUES ('12', '100002', '2017-03-10 00:00:00', '3580', '3180', '900', '1', '2017-02-06 15:32:07', '6');
INSERT INTO `mmm_line_date` VALUES ('13', '100002', '2017-03-17 00:00:00', '3580', '3180', '900', '1', '2017-02-06 15:32:07', '6');
INSERT INTO `mmm_line_date` VALUES ('14', '100002', '2017-03-24 00:00:00', '3', '4', '5', '2', '2017-02-06 15:32:07', '6');
INSERT INTO `mmm_line_date` VALUES ('15', '100002', '2017-03-31 00:00:00', '3580', '3180', '900', '2', '2017-02-06 15:32:07', '6');
INSERT INTO `mmm_line_date` VALUES ('16', '100001', '2017-02-07 00:00:00', '55', '44', '33', '1', '2017-02-07 12:06:48', '6');
INSERT INTO `mmm_line_date` VALUES ('17', '100001', '2017-02-14 00:00:00', '55', '44', '33', '1', '2017-02-07 12:06:48', '6');
INSERT INTO `mmm_line_date` VALUES ('18', '100001', '2017-02-21 00:00:00', '55', '44', '33', '1', '2017-02-07 12:06:48', '6');
INSERT INTO `mmm_line_date` VALUES ('19', '100001', '2017-02-28 00:00:00', '55', '44', '33', '1', '2017-02-07 12:06:48', '6');
INSERT INTO `mmm_line_date` VALUES ('28', '100001', '2017-03-21 00:00:00', '3580', '3180', '900', '1', '2017-02-07 22:52:10', '6');
INSERT INTO `mmm_line_date` VALUES ('29', '100002', '2017-03-14 00:00:00', '3580', '3180', '900', '1', '2017-02-07 22:52:25', '6');
INSERT INTO `mmm_line_date` VALUES ('44', '100002', '2017-02-08 00:00:00', '55', '44', '33', '1', '2017-02-08 21:02:01', '6');
INSERT INTO `mmm_line_date` VALUES ('45', '100002', '2017-02-15 00:00:00', '55', '44', '33', '1', '2017-02-08 21:02:01', '6');
INSERT INTO `mmm_line_date` VALUES ('46', '100002', '2017-02-22 00:00:00', '55', '44', '33', '1', '2017-02-08 21:02:01', '6');
INSERT INTO `mmm_line_date` VALUES ('47', '100002', '2017-03-01 00:00:00', '55', '44', '33', '1', '2017-02-08 21:02:01', '6');
INSERT INTO `mmm_line_date` VALUES ('48', '100003', '2017-03-01 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('49', '100003', '2017-03-08 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('50', '100003', '2017-03-15 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('51', '100003', '2017-03-22 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('52', '100003', '2017-03-29 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('53', '100003', '2017-03-04 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('54', '100003', '2017-03-11 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('55', '100003', '2017-03-18 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('56', '100003', '2017-03-25 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('57', '100003', '2017-04-01 00:00:00', '360', '250', '60', '1', '2017-02-17 22:38:14', '6');
INSERT INTO `mmm_line_date` VALUES ('58', '100001', '2017-03-01 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('59', '100001', '2017-03-15 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('60', '100001', '2017-03-08 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('61', '100001', '2017-03-22 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('62', '100001', '2017-03-29 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('63', '100001', '2017-04-05 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('64', '100001', '2017-04-12 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('65', '100001', '2017-04-19 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('66', '100001', '2017-04-26 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('67', '100001', '2017-05-03 00:00:00', '368', '318', '50', '1', '2017-02-17 22:41:27', '6');
INSERT INTO `mmm_line_date` VALUES ('68', '100004', '2017-02-02 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:43:12', '6');
INSERT INTO `mmm_line_date` VALUES ('69', '100004', '2017-02-09 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:43:12', '6');
INSERT INTO `mmm_line_date` VALUES ('70', '100004', '2017-02-16 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:43:12', '6');
INSERT INTO `mmm_line_date` VALUES ('71', '100004', '2017-02-23 00:00:00', '3899', '2899', '400', '1', '2017-02-17 22:43:12', '6');
INSERT INTO `mmm_line_date` VALUES ('72', '100004', '2017-03-02 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:43:12', '6');
INSERT INTO `mmm_line_date` VALUES ('73', '100004', '2017-03-09 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('74', '100004', '2017-03-16 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('75', '100004', '2017-03-23 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('76', '100004', '2017-03-30 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('77', '100004', '2017-04-06 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('78', '100004', '2017-04-13 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('79', '100004', '2017-04-20 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('80', '100004', '2017-04-27 00:00:00', '3898', '2898', '500', '1', '2017-02-17 22:44:31', '6');
INSERT INTO `mmm_line_date` VALUES ('81', '100006', '2017-03-31 00:00:00', '368', '318', '50', '1', '2017-02-17 22:53:15', '6');
INSERT INTO `mmm_line_date` VALUES ('82', '100006', '2017-04-07 00:00:00', '368', '318', '50', '1', '2017-02-17 22:53:15', '6');
INSERT INTO `mmm_line_date` VALUES ('83', '100006', '2017-04-14 00:00:00', '368', '318', '50', '1', '2017-02-17 22:53:15', '6');
INSERT INTO `mmm_line_date` VALUES ('84', '100006', '2017-04-21 00:00:00', '368', '318', '50', '1', '2017-02-17 22:53:15', '6');
INSERT INTO `mmm_line_date` VALUES ('85', '100006', '2017-04-28 00:00:00', '368', '318', '50', '1', '2017-02-17 22:53:15', '6');
INSERT INTO `mmm_line_date` VALUES ('86', '100005', '2017-03-31 00:00:00', '138', '138', '22', '1', '2017-02-17 22:55:33', '6');
INSERT INTO `mmm_line_date` VALUES ('87', '100005', '2017-04-07 00:00:00', '138', '138', '0', '1', '2017-02-17 22:55:33', '6');
INSERT INTO `mmm_line_date` VALUES ('88', '100005', '2017-04-14 00:00:00', '138', '138', '10', '1', '2017-02-17 22:55:33', '6');
INSERT INTO `mmm_line_date` VALUES ('89', '100005', '2017-04-21 00:00:00', '138', '138', '0', '1', '2017-02-17 22:55:33', '6');
INSERT INTO `mmm_line_date` VALUES ('90', '100005', '2017-04-28 00:00:00', '138', '138', '0', '1', '2017-02-17 22:55:33', '6');
INSERT INTO `mmm_line_date` VALUES ('91', '100007', '2017-03-31 00:00:00', '428', '328', '100', '1', '2017-02-17 22:59:28', '6');
INSERT INTO `mmm_line_date` VALUES ('92', '100007', '2017-04-07 00:00:00', '428', '328', '100', '1', '2017-02-17 22:59:28', '6');
INSERT INTO `mmm_line_date` VALUES ('93', '100007', '2017-04-14 00:00:00', '428', '328', '100', '1', '2017-02-17 22:59:28', '6');
INSERT INTO `mmm_line_date` VALUES ('94', '100007', '2017-04-21 00:00:00', '428', '328', '100', '1', '2017-02-17 22:59:28', '6');
INSERT INTO `mmm_line_date` VALUES ('95', '100007', '2017-04-28 00:00:00', '428', '328', '100', '1', '2017-02-17 22:59:28', '6');
INSERT INTO `mmm_line_date` VALUES ('96', '100004', '2017-05-03 00:00:00', '3399', '2299', '199', '1', '2017-02-23 20:39:52', '6');
INSERT INTO `mmm_line_date` VALUES ('97', '100004', '2017-05-10 00:00:00', '3399', '2299', '199', '1', '2017-02-23 20:39:52', '6');
INSERT INTO `mmm_line_date` VALUES ('98', '100004', '2017-05-17 00:00:00', '3399', '2299', '199', '1', '2017-02-23 20:39:52', '6');
INSERT INTO `mmm_line_date` VALUES ('99', '100004', '2017-05-24 00:00:00', '3399', '2299', '199', '1', '2017-02-23 20:39:52', '6');
INSERT INTO `mmm_line_date` VALUES ('100', '100004', '2017-05-31 00:00:00', '3399', '2299', '199', '1', '2017-02-23 20:39:52', '6');
INSERT INTO `mmm_line_date` VALUES ('101', '100008', '2017-04-06 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('102', '100008', '2017-04-13 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('103', '100008', '2017-04-20 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('104', '100008', '2017-05-04 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('105', '100008', '2017-05-18 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('106', '100008', '2017-05-11 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('107', '100008', '2017-04-27 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('108', '100008', '2017-05-25 00:00:00', '368', '328', '100', '1', '2017-02-27 20:28:35', '6');
INSERT INTO `mmm_line_date` VALUES ('109', '100009', '2017-04-06 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('110', '100009', '2017-04-13 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('111', '100009', '2017-04-20 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('112', '100009', '2017-04-27 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('113', '100009', '2017-05-04 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('114', '100009', '2017-05-11 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('115', '100009', '2017-05-18 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('116', '100009', '2017-05-25 00:00:00', '688', '288', '120', '1', '2017-02-27 21:15:42', '6');
INSERT INTO `mmm_line_date` VALUES ('117', '100010', '2017-05-04 00:00:00', '788', '408', '150', '1', '2017-02-27 22:06:15', '6');
INSERT INTO `mmm_line_date` VALUES ('118', '100010', '2017-05-11 00:00:00', '788', '408', '150', '1', '2017-02-27 22:06:15', '6');
INSERT INTO `mmm_line_date` VALUES ('119', '100010', '2017-05-18 00:00:00', '788', '408', '150', '1', '2017-02-27 22:06:15', '6');
INSERT INTO `mmm_line_date` VALUES ('120', '100010', '2017-05-25 00:00:00', '788', '408', '150', '1', '2017-02-27 22:06:15', '6');
INSERT INTO `mmm_line_date` VALUES ('121', '100010', '2017-06-01 00:00:00', '788', '408', '150', '1', '2017-02-27 22:06:15', '6');
INSERT INTO `mmm_line_date` VALUES ('122', '100011', '2017-05-05 00:00:00', '6699', '5689', '2500', '1', '2017-02-27 22:31:29', '6');
INSERT INTO `mmm_line_date` VALUES ('123', '100011', '2017-05-19 00:00:00', '6699', '5689', '2500', '1', '2017-02-27 22:31:29', '6');
INSERT INTO `mmm_line_date` VALUES ('124', '100011', '2017-06-02 00:00:00', '6699', '5689', '2500', '1', '2017-02-27 22:31:29', '6');
INSERT INTO `mmm_line_date` VALUES ('125', '100011', '2017-07-07 00:00:00', '6699', '5689', '2500', '1', '2017-02-27 22:31:29', '6');
INSERT INTO `mmm_line_date` VALUES ('126', '100011', '2017-08-04 00:00:00', '6699', '5689', '2500', '1', '2017-02-27 22:31:29', '6');

-- ----------------------------
-- Table structure for mmm_line_image
-- ----------------------------
DROP TABLE IF EXISTS `mmm_line_image`;
CREATE TABLE `mmm_line_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lineid` int(11) NOT NULL DEFAULT '0' COMMENT '线路id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `is_cover` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是封面图（主图）：0-不是，1-是',
  PRIMARY KEY (`id`),
  KEY `lineid` (`lineid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='线路对应图片表';

-- ----------------------------
-- Records of mmm_line_image
-- ----------------------------
INSERT INTO `mmm_line_image` VALUES ('1', '100001', '/Public/Upload/lunbo/58708c0087169.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('2', '100001', '/Public/Upload/lunbo/58708cc1efc93.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('3', '100001', '/Public/Upload/lunbo/58708cc22a7c3.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('4', '100002', '/Public/Upload/lunbo/58708d3ec6b6b.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('5', '100002', '/Public/Upload/lunbo/587092aa0b25e.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('6', '100002', '/Public/Upload/lunbo/5870933c50c82.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('8', '100002', '/Public/Upload/lunbo/5872f7fcd12d1.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('9', '100003', '/Public/Upload/lunbo/5872f7fd72155.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('10', '100003', '/Public/Upload/lunbo/5872fd607e2f7.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('11', '100003', '/Public/Upload/lunbo/5872fd60d5d5b.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('12', '100003', '/Public/Upload/lunbo/588873478d8cf.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('13', '100004', '/Public/Upload/lunbo/589587b815f0d.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('14', '100004', '/Public/Upload/lunbo/5895976d13408.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('15', '100004', '/Public/Upload/lunbo/58959788eda8b.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('16', '100004', '/Public/Upload/lunbo/5895980804536.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('17', '100002', '/Public/Upload/lunbo/5895a03a41da3.jpeg', '0');
INSERT INTO `mmm_line_image` VALUES ('18', '100003', '/Public/Upload/lunbo/5895a0524a7d2.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('19', '100001', '/Public/Upload/lunbo/5895a079d24b8.jpg', '0');
INSERT INTO `mmm_line_image` VALUES ('20', '100003', '/Public/Upload/line/58a70aa7c58b0.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('21', '100001', '/Public/Upload/line/58a70b6a3cda9.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('22', '100004', '/Public/Upload/line/58a70bdd035fd.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('23', '100006', '/Public/Upload/line/58a70e3942417.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('24', '100005', '/Public/Upload/line/58a70ebe45557.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('25', '100007', '/Public/Upload/line/58a70fb70f6f4.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('26', '100008', '/Public/Upload/line/58b419607a8c5.jpg', '1');
INSERT INTO `mmm_line_image` VALUES ('27', '100009', '/Public/Upload/line/58b4242911c95.png', '0');
INSERT INTO `mmm_line_image` VALUES ('28', '100009', '/Public/Upload/line/58b42462d5a97.png', '1');
INSERT INTO `mmm_line_image` VALUES ('29', '100010', '/Public/Upload/line/58b42cff6793c.png', '0');
INSERT INTO `mmm_line_image` VALUES ('30', '100010', '/Public/Upload/line/58b42cff730d7.png', '1');
INSERT INTO `mmm_line_image` VALUES ('31', '100011', '/Public/Upload/line/58b434304a1b8.png', '0');
INSERT INTO `mmm_line_image` VALUES ('32', '100011', '/Public/Upload/line/58b4343055d3b.png', '1');

-- ----------------------------
-- Table structure for mmm_line_journey
-- ----------------------------
DROP TABLE IF EXISTS `mmm_line_journey`;
CREATE TABLE `mmm_line_journey` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lineid` int(11) NOT NULL DEFAULT '0' COMMENT '线路id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `day` tinyint(4) NOT NULL DEFAULT '1' COMMENT '出游第几天',
  `spot` text COMMENT '游览景点，多个景点之间用逗号分隔',
  `detail` text COMMENT '出游详情',
  `hotel` varchar(255) NOT NULL DEFAULT '' COMMENT '住宿酒店',
  `breakfast` varchar(255) NOT NULL DEFAULT '' COMMENT '早餐',
  `lunch` varchar(255) NOT NULL DEFAULT '' COMMENT '午餐',
  `dinner` varchar(255) NOT NULL DEFAULT '' COMMENT '晚餐',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `add_by` int(11) NOT NULL COMMENT '添加人',
  `edittime` datetime DEFAULT NULL COMMENT '修改人',
  `edit_by` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人',
  PRIMARY KEY (`id`),
  KEY `lineid` (`lineid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='线路日期行程';

-- ----------------------------
-- Records of mmm_line_journey
-- ----------------------------
INSERT INTO `mmm_line_journey` VALUES ('1', '100003', '深圳-惠州', '1', '巽寮湾，三角洲岛', '&lt;p&gt;撒放电饭锅东方红&lt;/p&gt;', '半岛酒店', '不含', '含', '含', '2017-02-07 12:15:32', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('2', '100003', '惠州', '2', '巽寮湾，三角洲岛', '&lt;p&gt;电风扇规范化和骨灰盒&lt;/p&gt;', '半岛酒店', '含', '含', '含', '2017-02-07 12:16:15', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('3', '100003', '惠州-深圳', '3', '梵蒂冈', '&lt;p&gt;发生的热风&lt;/p&gt;', '无', '发', '含', '不含', '2017-02-07 12:18:26', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('4', '100002', '香港—胡志明—头顿 （参考航班：BL 611  1415/1550  飞行时间2.5小时）', '1', '无', '&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;自行前往深圳港口码头或口岸集合，由专业领队带领，乘香港太平洋捷星航空飞往胡志明市（航程约2小时40分钟，时差：越南比中国慢1小时）。 随后乘车前往头顿（约2.5小时），抵达后晚餐，随后入住酒店。&lt;/span&gt;&lt;/p&gt;', '头顿当地四星酒店', '自理', '自理', '含', '2017-02-07 22:20:39', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('5', '100002', '头顿—美奈', '2', '保大皇行宫(白宫)，基督立像，鲸鱼庙，美奈，鱼港', '&lt;p style=&quot;margin-bottom:0;margin-bottom:0;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;早餐后，您可以自由的在酒店的泳池或海边畅泳。于指定时间集中参观越南末代皇帝—&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【保大皇行宫(白宫) 】&lt;/span&gt;&lt;/strong&gt;(游览时间40分钟)，续攀登被列为世界最大的&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【基督立像】&lt;/span&gt;&lt;/strong&gt;(游览时间40分钟)（温馨提示：请穿有袖的衣服，过膝长裤，女士请不要穿裙子），像高32米，臂展18.4米，自耶稣山高处可俯瞰全市风采之后参观有200多年历史的&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【鲸鱼庙】&lt;/span&gt;&lt;/strong&gt;(游览时间20分钟)。午餐后前往越南著名的海滨渡假胜地&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【美奈】&lt;/span&gt;&lt;/strong&gt;。车程约2小时，是南越著名的渔村及海滩渡假胜地。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;美奈（Mui Ne）是位于越南东南部&lt;/span&gt;&lt;a href=&quot;http://baike.sogou.com/lemma/ShowInnerLink.htm?lemmaId=68669332&quot; target=&quot;http://baike.sogou.com/_blank&quot; style=&quot;font-size: 13px; font-family: 微软雅黑, sans-serif; text-decoration: underline;&quot;&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;平顺省&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;美奈半岛上的一个渔村小镇，距离&lt;/span&gt;&lt;a href=&quot;http://baike.sogou.com/lemma/ShowInnerLink.htm?lemmaId=121832&quot; target=&quot;http://baike.sogou.com/_blank&quot; style=&quot;font-size: 13px; font-family: 微软雅黑, sans-serif; text-decoration: underline;&quot;&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;胡志明市&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;东北约200公里，离&lt;/span&gt;&lt;a href=&quot;http://baike.sogou.com/lemma/ShowInnerLink.htm?lemmaId=173116&quot; target=&quot;http://baike.sogou.com/_blank&quot; style=&quot;font-size: 13px; font-family: 微软雅黑, sans-serif; text-decoration: underline;&quot;&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;潘切市&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;（Phan Thiet）约22公里。这里有长约50kms的绵长海滩，椰风海浪，水清沙幼，游人不多，不同档次的旅游度假屋众多，是越南南部不可不去的海滩之一。美奈最吸引人的是那些庞大的沙丘，白沙丘，红沙丘和极为特殊的&lt;/span&gt;&lt;a href=&quot;http://baike.sogou.com/lemma/ShowInnerLink.htm?lemmaId=4416882&amp;ss_c=ssc.citiao.link&quot; target=&quot;http://baike.sogou.com/_blank&quot; style=&quot;font-size: 13px; font-family: 微软雅黑, sans-serif; text-decoration: underline;&quot;&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;喀斯特地貌&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;构成的红色河流&lt;/span&gt;。&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;旅游最佳时间是每年的十二月到来年的5月，年平均气温27°C，全年湿热。 傍晚时分，前往渔港欣赏著名的&lt;/span&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 13px; font-family: 微软雅黑, sans-serif; color: rgb(255, 0, 102);&quot;&gt;【鱼港Fishing Village】&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;：位于美奈中心3km，清晨的鱼获交易和傍晚的渔港夕照，是一道不错的风景。随后入住酒店。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '美奈当地四星酒店', '含', '含', '含', '2017-02-07 22:26:21', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('6', '100002', '美奈', '3', '红沙丘,仙女溪,海角沙丘', '&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-indent: 27px;line-height:21px&quot;&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;早餐后参观 &lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【红沙丘Red Sand dune】&lt;/span&gt;&lt;/strong&gt;：位于美奈中心28km，延绵不断 红色的沙子，距离大海较近，傍晚时分，紫色的晚霞与棕红色的沙丘在落日余晖的笼罩下显得更加艳丽，整个气氛浪漫至极。也可以进行&lt;a href=&quot;http://baike.baidu.com/view/1122716.htm&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:windowtext;text-underline:none&quot;&gt;滑沙&lt;/span&gt;&lt;/a&gt;等活动。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom:0;margin-bottom:0;text-indent: 27px;line-height:21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:13px;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;;color:#FF0066&quot;&gt;【仙女溪】&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:13px;font-family: &amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;仙女溪是美奈的一条溪流，水质清澈，水里的沙子很软，岸边生长有四叶草等植物。仙女溪的水水很浅，沙很细，经过烈日的暴晒之后，水温有点暖暖的。当你赤脚涉水而行时，脚踩在细细的沙面上，细沙和着暖暖的水，流溜过你的脚趾缝，仿佛仙女用她的纤纤玉手抚摸一般惬意。仙女溪色彩由红土、白沙、蓝天、流水、绿树等色彩强烈的元素组成，绝对是摄影爱好者们的大爱。下午参观&amp;quot;一边是火焰，一边是大海&amp;quot;的奇观&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【海角沙丘】&lt;/span&gt;&lt;/strong&gt;又名&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【白沙丘】&lt;/span&gt;&lt;/strong&gt;：这是一座高高耸立在海边，方圆好几公里的沙山，放眼四望一片大漠风烟之景。沙丘呈新月形，沙粒细腻，曲线曼妙，沙雾随风起。踩在松软的沙石上，起伏连绵。人像是要陷进去，实际上却能完全自如地掌控身体。土路与沙丘之间有面湖，清澈而深邃。湖里长满了水草与荷花，衬得湖水清雅之极，触手便可捞起沙丘的倒影。也可以登高远望，领略&amp;quot;一边是火焰，一边是大海&amp;quot;的奇观。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-size:12px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;;background:yellow;background:yellow&quot;&gt;可自行租当地的四驱车；或者吉普车上沙丘体验惊险刺激的活动；到达沙丘顶端可以玩滑沙（请租车的时候同工作人员说需要滑沙，让他们戴上工具）&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '美奈当地四星酒店', '含', '含', '含', '2017-02-07 22:27:45', '6', '2017-02-07 22:29:27', '6');
INSERT INTO `mmm_line_journey` VALUES ('7', '100002', '美奈—胡志明', '4', '红教堂,百年古邮局,西贡市邮政大楼,歌剧院,市政厅', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-size:13px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;早餐后自由享受阳光与海滩，于指定时间集合。乘车前往胡志明（车程约4小时）参观最著名的地标点 -&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【红教堂】&lt;/span&gt;&lt;/strong&gt;外观(游览时间15分钟),它是1877年所留下的古老建筑，为殖民时期留下的纪念品。及参观&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【百年古邮局】&lt;/span&gt;&lt;/strong&gt;(游览时间15分钟)，此建筑于19世纪末法人统治时代，属于重要的文化财产。属哥德式建筑，室内不需装冷气，利用空气之流动，即让人感觉非常舒服了，内部半圆形的天花板极富古典气息，有集邮者也可在此一寻纪念邮册。 参观具浓厚的法式风格&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【西贡市邮政大楼】&lt;/span&gt;&lt;/strong&gt;（30分钟），此建筑于19世纪末法人统治时代，属于重要的文化财产。属哥德式建筑，室内不需装冷气，利用空气之流动，即让人感觉非常舒服了，内部半圆形的天花板极富古典气息，此楼乃法式设计。再参观&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【歌剧院】&lt;/span&gt;&lt;/strong&gt;（外观15分钟）、&lt;strong&gt;&lt;span style=&quot;color:#FF0066&quot;&gt;【市政厅】&lt;/span&gt;&lt;/strong&gt;（外观15分钟），我们会安排您到开遍胡志明大街小巷的法式咖啡厅，品尝一杯香甜的“滴滴壶咖啡” (时间30分钟)，让您尽解一路上的舟车劳顿！&lt;/span&gt;&lt;/p&gt;', '胡志明当地五星酒店', '含', '含', '含', '2017-02-07 22:31:24', '6', '2017-02-07 22:31:37', '6');
INSERT INTO `mmm_line_journey` VALUES ('8', '100002', '胡志明—香港（参考航班：BL610  0935-1315 飞行时间2.5小时）', '5', '', '&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size:14px;line-height:115%;font-family:&amp;#39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;&quot;&gt;早餐后，前往胡志明国际机场搭乘航班，返回香港机场，至此结束愉快旅程。&lt;/span&gt;&lt;/p&gt;', '无', '含', '自理', '自理', '2017-02-07 22:32:58', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('9', '100008', '深圳-阳朔', '1', '', '&lt;p&gt;深圳出发，乘坐大巴，大约7个小时到达阳朔，后入住酒店。&lt;/p&gt;', '当地民居', '不含', '不含', '不含', '2017-02-27 20:22:02', '6', '2017-02-27 20:24:44', '6');
INSERT INTO `mmm_line_journey` VALUES ('10', '100008', '阳朔', '2', '银子岩，漓水古越，大槐树，阳朔酒吧街', '&lt;p&gt;起床后游览银子岩，中午午餐后游览漓水古越，大槐树，晚上6点，自由活动，可自行去阳朔酒吧街品尝当地特色。&lt;/p&gt;', '当地民居', '含', '含', '不含', '2017-02-27 20:23:39', '6', '2017-02-27 20:24:58', '6');
INSERT INTO `mmm_line_journey` VALUES ('11', '100008', '阳朔-深圳', '3', '漓江，十里画廊', '&lt;p&gt;早餐后游览十里画廊，漓江，之后中午饭，中午饭可欣赏月亮山，大约13:30集合返回深圳&lt;/p&gt;', '无', '含', '含', '不含', '2017-02-27 20:24:34', '6', '2017-02-27 20:26:14', '6');
INSERT INTO `mmm_line_journey` VALUES ('12', '100009', '深圳北-厦门北-入住酒店 ', '1', '', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;请各位贵宾自行前往指定深圳北站A进站口东广场集合（不含深圳北站接送，具体集合时间以出团前导游通知为准），后深圳北站乘动车（深圳北-厦门北 \r\n约3.5H左右）前往与台湾隔海相望的国际花园城市、中国最温馨的城市、全国旅游城市——【厦门】。接团后入住酒店，晚餐请自理。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;参考酒店如下：（一下其中一家酒店或同级酒店）&lt;br/&gt;东城湾快捷/凌波湾/西岸金领/宜居/磨鑫山庄/党务/泊捷/金晓/亿宝/利客居/四季阳光/鑫名轩/好梦/如家连锁系列/七天连锁系列/怡庭连锁系列/锦江之星连锁系列/速八连锁系列/夜泊丽湾/灌口金晓/大嶝翔家/红牡丹/杏霖/财税宾馆/金巴黎/香槟/税源/九可酒店/华逸轩/岑曦/永松宾馆/泊旅时尚/泊捷时尚/悦庭酒店/岚庭酒店/摩登世家酒店/名苑酒店/银龙酒店/新油宾馆/意佳酒店/东方桃源酒店/厦门港中居酒店/汉庭酒店等或同级酒店住2晚&lt;br/&gt;如对住宿有特别要求请下单前注明，不接受当天更换酒店！&lt;/span&gt;&lt;/p&gt;', '厦门东城湾快捷酒店', '不含', '不含', '不含', '2017-02-27 21:08:43', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('13', '100009', '南普陀寺—厦门大学外景—鼓浪屿—毓园—海滨浴场—酒店 ', '2', '南普陀寺,厦门大学外景,鼓浪屿,毓园,海滨浴场', '&lt;p&gt;南普陀寺—厦门大学外景—鼓浪屿—毓园—海滨浴场—酒店。&lt;/p&gt;&lt;p&gt;自由活动:&lt;/p&gt;&lt;p&gt;返回酒店后，自由活动。（准确时间和地点以导游实际安排为准，本日不含晚餐，请游客自行安排晚餐，可自行前往中山路美食广场自费品尝当地特色小吃，如:佛跳墙，土笋冻，面线糊，沙茶面，韭菜盒，花生汤，烧肉粽，薄饼，烤鱿鱼等。请保管好随身贵重物品及注意个人安全，电话保持通畅，若有问题请及时联系导游，可自行返回酒店（自行乘车返回酒店，厦门的士8元/3公里，另加收燃油附加费）。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;br/&gt;&lt;/p&gt;', '厦门东城湾快捷酒店', '含', '含', '不含', '2017-02-27 21:11:26', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('14', '100009', '环岛路—曾厝垵—老院子景区—厦门北—深圳 ', '3', '环岛路,曾厝垵', '&lt;p&gt;环岛路是厦门环海风景旅游干道之一，途径轮渡、白城立交桥、厦门大学白城、胡里山炮台、椰风寨、国际会展中心等主要景点，与沿路的大海、沙滩、草地等构成了内容丰富的海滨旅游观光带。在环岛东路的草坪上，立有一排栩栩如生的马拉松赛跑运动员的人物雕像，各种各样的运动姿势颇具“体育之路”的风采环岛路连接了众多景点，胡里山炮台、上李水库、“一国两制统一中国”标语牌、国际会展中心，以及庙宇、古树、奇石、雕塑和三个临海广场。沿线还建有椰风寨、玩月坡、数星园、海韵台等设施，串连成五彩缤纷、内容丰富的海滨旅游观光带，构成一幅蓝天、大海、阳光、沙滩、草地、绿树、鲜花和红色人行道共同组成的东岸游闲区，令人恋恋不舍。在环岛东路的草坪上，立有97座栩栩如生的马拉松赛跑运动员铜雕像。&lt;/p&gt;', '', '含', '含', '不含', '2017-02-27 21:12:28', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('15', '100010', '深圳—湛江—海口 ', '1', '海口', '&lt;p&gt;&amp;nbsp; &lt;span style=&quot;font-size: 14px;&quot;&gt;06:00惠州金叶酒店、08:00深圳上海宾馆、08:20深圳深大北门天桥、08:50深圳宝安都之都酒店、09:30东莞长安酒店【法定节假日会提前出发，具体时间以导游通知为准！】&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;17:00乘船过渡海口，在甲板上慢慢看日落（大约1.5小时）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;19:30 前往酒店: &lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;海口华侨宾馆&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;。参考酒店：华侨宾馆/兵工大酒店/金银洲宾馆等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;【友情提示】：1、第一天行程会比较累，但是为了享受到海天景色、阳光沙滩和椰风海韵，一切都是值得的；在旺季可能会出现等轮渡的情况，希望团友有心理准备，当天不含餐，请各位自备干粮。 &lt;br/&gt;2、感受我国第一条跨海火车轮渡线，在国内最大的渡轮上，体验琼州海峡的海上风光和海峽两岸美景。上船后请自行寻找座位与卡座，船上配有电视小卖部，航海约1.5小时到达海口。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '海口华侨宾馆', '不含', '不含', '不含', '2017-02-27 21:46:40', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('16', '100010', '海口—琼海—兴隆', '2', '玉带滩，海南琼海万泉河漂流，兴隆南国热带雨林游览区', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;07：30 享用早餐&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;08：30 玉带滩&lt;span style=&quot;font-size: 16px;&quot;&gt;，&lt;/span&gt;玉带滩位于博鳌水城东部，是一条自然形成的地形狭长的沙滩半岛。南海烟波浩淼，一望无际，内侧万泉河，沙美内海的湖光山色，内外相映，构成了一幅奇异的景观。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 乘车往世界唯一的融江、河、海、山麓、岛屿于一体，集椰林、沙滩、奇石、温泉、田园风光于一身的博鳌水城，后乘船游览被誉为世界上最完美的记入吉尼斯纪录的江河入海口玉带滩（游览时间约60分钟）欣赏世界分隔海、河最狭窄，自然景观保存最完美的沙滩半岛&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;10：00 海南琼海万泉河漂流.玉带滩外侧南海烟波浩淼，一望无际，内侧万泉河，沙美内海的湖光山色，内外相映，构成了一幅奇异的景观。接下来乘坐竹筏漂流（游览时间约45分钟）观万泉河两岸风光。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &lt;span style=&quot;font-size: 12px;&quot;&gt;【友情提示】：1、竹筏漂流较为平缓与传统漂流不一样，适合老人小孩，如需打水仗请带好毛巾和换洗衣服。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size: 14px;&quot;&gt;12：00 午餐: 用中餐 (20元/人，10-12人/ 围，八菜一汤)&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;13：00 兴隆南国热带雨林游览区.天涯雨林博物馆位于海南省海口——三亚东线高速公路中段，距海口164公里，距三亚100公里处。在万宁市兴隆华侨农场兴隆旅游度假城内，万宁最长最大的河流——太阳河畔。天涯雨林博物馆是目前亚洲最大的根雕、根艺展馆，里面陈列的都是罕见的巨型根雕、根艺。它是由印尼归侨罗德山先生于2003年7月兴建的，这些巨型的根雕、根艺都是从太阳河河床的淤泥里挖掘出来的。因地质的变迁，河流的改道，那些几百年、上千年甚至是远古时期的高大树木被深埋在泥沙、河床之中，经过长期的物理化学作用，使它们变成坚硬无比、千姿百态的巨型的、神奇的艺术作品，向人们展示自然美的同时，也向人们展示太阳河两岸曾有的热带雨林的原貌、型态与痕迹，向人们讲述太阳河两岸热带雨林动人的故事。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;16：00前往酒店.参考酒店：钱庄/南山温泉酒店等&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;17：00晚餐: 用晚餐 (20元/人，10-12人/ 围，八菜一汤)&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;br style=&quot;text-align: left;&quot;/&gt;&lt;/p&gt;', '', '含', '含', '含', '2017-02-27 21:59:25', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('17', '100010', '兴隆—三亚 ', '3', '椰田古寨，西岛，天涯海角', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;早餐: 享用早餐&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;在陵水县乘坐开往三亚的车，在英洲高速路口下，按照指示牌步行200米即可。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;天涯海角位于三亚湾西端，这片海滩上耸立着许多形态各异的岩石，很多岩石上刻有古今名人留下的字。其中最有名的是分别刻有“天涯”和“海角”的两块巨石，它们也一直被视为爱情的象征而成为三亚的标志性景观之一。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;参考酒店：月海阁楼/星榆山庄等。友情提示：不含晚餐，晚餐请自理！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;', '三亚月海阁楼公馆', '含', '含', '不含', '2017-02-27 22:02:44', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('18', '100010', '三亚—陵水—海口—深圳 ', '4', '亚龙湾，奥特莱斯', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;亚龙湾是一个半月形的海湾，绵延7公里，平缓而宽阔。这里的沙粒洁白细软，蔚蓝的海水清澈晶莹，能见度达9米。五颜六色的珊瑚礁和各种热带鱼儿穿梭其中，跃入海水中畅游，五彩缤纷的鱼儿似乎触手可及。这里终年可游泳，年平均海水温度22-25.1°C。凭借优越的沙质，亚龙湾被称为“东方夏威夷”，而它的海滩长度却是夏威夷的3倍。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;随后乘车前往海口上轮渡（晚餐请自备干粮或在游船上自行解决）后到达徐闻。之后上广湛高速、中江高速、广深高速抵达深圳，结束愉快行程。&lt;/span&gt;&lt;/p&gt;', '', '含', '含', '不含', '2017-02-27 22:04:04', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('19', '100011', '深圳—大阪', '1', '心斋桥，道顿堀', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt; &amp;nbsp;航班: 参考航班：ZH9053 &amp;nbsp;0950/1400 出发前以出团通知书为准于指定的地点集&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 心斋桥是位于日本大阪府大阪市中央区的商业购物区，这里既有各种精品屋、专卖店和大商场，也有各种小店。这里还汇聚了世界各地的美食，是不可不去的购物天堂。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 大阪最热闹的美食街，大大小小特色的摊摆满街道两旁，洋溢着阵阵食物香味。在这里可尝到各种大阪特色美食如金龙拉面、大阪烧、美津炒面、章鱼烧等，使人禁不住大开食戒&lt;/span&gt;&lt;/p&gt;', '热海新赤尾酒店或同级酒店', '不含', '不含', '不含', '2017-02-27 22:16:46', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('20', '100011', '大阪—京都 ', '2', '百选樱名所-樱花大道或大阪城公园，渡月桥，天龙寺，仁和寺', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 仁和寺是真言宗御室派总寺，为世界文化遗产。886年，光孝天皇下令建造，888年 完成，并以当时的年号命名后宇多天皇、代代法亲王均在次出家。此处便逐渐成为皇家御寺。寺中的“二王门”为德川家光所捐；“金堂”是御所紫辰殿迁移建成；“御影堂”则利用原清凉殿的材料建所建。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 寺内种植逾200棵的御室樱，且集中在同一区，沿着步道可以近距离观赏，御室樱的花朵白色且花形较大，一团团的绽放着衬着蓝天、阳光，透透的光影让人忘我，只想捕捉醉美的一刻，走到后方有个小小土丘，站在上面就能拍下一片御室樱与五重塔的合景.\r\n 日本天皇在退位之后几乎会皈依佛门，公元888年起有许多皇子皇女于仁和寺落发出家，因此这儿又称为「御室御所」，所种植的樱花也被称为「御室樱」&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '名古屋東急酒店或同级酒店', '含', '含', '自理', '2017-02-27 22:18:36', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('21', '100011', '中部—富士山 ', '4', '大法师公园，富士山，和平公园', '&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size: 14px;&quot;&gt; 富士山在日语中的意思是“火山”，它海拔3776米，屹立于本州中南部，跨静冈、山梨两县，东距东京80公里。这座被日本人奉为“圣岳”的山峰自781年有文字记载以来，共喷发了18次，最后一次喷发是在1707年，此后休眠至今。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 第13个世界文化遗产－日本的象征?~「富士山」是一座横跨静冈县和山梨县的活火山，位于东京西南方约80公里处，海拔约3776公尺，是日本国内的高峰，也是日本三大名山之一，更是日本重要的象征，被视为圣山。在富士山的周围，分布着5个淡水湖，统称富士五湖，河口湖为其中之一，2013年6月22日，富士山正式被登录为世界文化遗产，也是日本第13个世界文化遗产，更引发了前往观赏富士山的热潮&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '新宿华盛顿或同级酒店', '含', '含', '含', '2017-02-27 22:19:54', '6', '2017-02-27 22:22:55', '6');
INSERT INTO `mmm_line_journey` VALUES ('22', '100011', '日本中部 ', '3', '飞驒高山，高山上三之町古街，高山阵屋', '&lt;p style=&quot;white-space: normal;&quot;&gt;&amp;nbsp;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;在流经高山市内的宫川河东岸，有一条古老的街道。这条古街中段的三町，江户时代的住宅保存完好。这条古街，依然能清晰地勾勒出城堡城市“高山”的影子。到此一游，您可亲眼观赏到传统酒坊及带有突出格子门窗隔扇的古老住宅。这个地区，已被日本政府指定为“重要传统建筑群保护区”。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 飞驒市及高山市位于岐阜县，因地处日本中心地带且被群山环绕，自古以来就交通不便、人烟罕至，因此留下许多难得一见的传统风貌，走在有如江户时代的古老街道里，处处可见格子窗建筑，让人彷佛掉入时光隧道。飞驒和高山地区民风纯朴、古宅林立，宁静有气质，因此素有「小京都」的美名，是日本相当出名的古老市镇，目前也是日本相当受欢迎的旅游景点之一&lt;br/&gt;从阵屋步行三分钟可抵达有高山小京都之称的上三之町，由数条街道组成的「古町并」，有古老的商店街、桥梁、寺庙与酿酒厂。在刻意的维护之下，每间店铺的外观建筑和内在陈设都保存江户时代以来的浓厚古早原味。屋龄大都在三百年以上，是稀有珍贵的古建筑物群&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '名古屋东急大酒店或同级酒店', '含', '含', '含', '2017-02-27 22:21:17', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('23', '100011', '东京', '5', '东京都厅展望台，仲见世商店街，新宿歌舞伎町', '&lt;p&gt;&amp;nbsp; &lt;span style=&quot;font-size: 14px;&quot;&gt;全亚洲最著名的红灯区。所谓花街柳巷，纸醉金迷，应如是。由靖国大道和明治大道所围绕的这个区域有着很多电影院、夜总会、酒吧、情人旅店。每到夜晚，就是它精彩的开始。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 汇集了东京礼品, 日本著名药品健康产品及美容用品连锁免税店, 伊势丹,三越, 饮食店?娱乐场所?电影院等之集中地、日本少数之大型红灯区&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '东京湾有明华盛顿或同级酒店', '含', '含', '自理', '2017-02-27 22:24:32', '6', null, '0');
INSERT INTO `mmm_line_journey` VALUES ('24', '100011', '成田—深圳', '6', '浅草寺，仲见世商店街，隅田川', '&lt;p&gt;&amp;nbsp;&lt;span style=&quot;font-size: 14px;&quot;&gt; 说起浅草寺这个名字,可能大家都不太熟悉.但是只要说起那印有”雷门”字样的大灯笼,可真是无人不知无人不晓的经典景点。这座建于628年的东京最古老寺院每天吸引着络绎不绝的游客参拜祈福,或是乐淘一些日本江户特色的小商品,吃上一些地道的日本小吃。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 为日本观音寺总堂，相传在古天皇36年3月18日 SUMIDA川的三位渔民在出海捕鱼时，看到观音显现，并建立浅草寺来供奉观音&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; 航班: 参考航班：ZH9052 &amp;nbsp;1930/0020 1 &amp;nbsp;准确航班以出团通知书为准！&lt;/span&gt;&lt;/p&gt;', '无', '含', '自理', '自理', '2017-02-27 22:26:22', '6', null, '0');

-- ----------------------------
-- Table structure for mmm_line_label
-- ----------------------------
DROP TABLE IF EXISTS `mmm_line_label`;
CREATE TABLE `mmm_line_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `label_name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签名称',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='线路标签';

-- ----------------------------
-- Records of mmm_line_label
-- ----------------------------
INSERT INTO `mmm_line_label` VALUES ('1', '亲子游', '0');
INSERT INTO `mmm_line_label` VALUES ('2', '漂流季', '0');
INSERT INTO `mmm_line_label` VALUES ('4', '赏花季', '0');
INSERT INTO `mmm_line_label` VALUES ('5', '毕业旅行', '0');
INSERT INTO `mmm_line_label` VALUES ('6', '无自费', '0');
INSERT INTO `mmm_line_label` VALUES ('7', '踏青', '0');
INSERT INTO `mmm_line_label` VALUES ('8', '爸妈游', '0');
INSERT INTO `mmm_line_label` VALUES ('9', '蜜月', '0');
INSERT INTO `mmm_line_label` VALUES ('10', '周末游', '0');
INSERT INTO `mmm_line_label` VALUES ('11', '纯玩', '0');
INSERT INTO `mmm_line_label` VALUES ('12', '海岛', '0');
INSERT INTO `mmm_line_label` VALUES ('13', '游轮', '0');

-- ----------------------------
-- Table structure for mmm_line_place
-- ----------------------------
DROP TABLE IF EXISTS `mmm_line_place`;
CREATE TABLE `mmm_line_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '地点名称',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '级别类型',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `first_letter` varchar(20) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `is_island` tinyint(1) NOT NULL DEFAULT '0' COMMENT '目的地是否包含海岛：0-不含，1-含',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='线路出发地和目的地';

-- ----------------------------
-- Records of mmm_line_place
-- ----------------------------
INSERT INTO `mmm_line_place` VALUES ('1', '国内', '0', '1', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('2', '出境', '0', '1', '1', 'C', '0');
INSERT INTO `mmm_line_place` VALUES ('3', '港澳台', '0', '1', '2', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('4', '广东', '1', '2', '100', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('5', '广西', '1', '2', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('6', '东北', '1', '2', '0', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('7', '深圳', '4', '3', '50', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('8', '韶关', '4', '3', '1', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('10', '辽宁', '6', '3', '0', 'L', '0');
INSERT INTO `mmm_line_place` VALUES ('11', '黑龙江', '6', '3', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('12', '哈尔滨', '11', '4', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('14', '山西', '1', '2', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('15', '桂林', '5', '3', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('16', '沈阳', '10', '4', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('17', '齐齐哈尔', '11', '4', '0', 'Q', '0');
INSERT INTO `mmm_line_place` VALUES ('18', '吉林', '6', '3', '0', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('19', '华东', '1', '2', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('20', '浙江', '19', '3', '0', 'Z', '0');
INSERT INTO `mmm_line_place` VALUES ('22', '江苏', '19', '3', '0', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('23', '苏州', '22', '4', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('24', '杭州', '20', '4', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('25', '上海', '19', '3', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('26', '南京', '22', '4', '1', 'N', '0');
INSERT INTO `mmm_line_place` VALUES ('27', '日本', '2', '2', '1', 'R', '0');
INSERT INTO `mmm_line_place` VALUES ('28', '东京', '27', '3', '0', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('29', '东南亚', '2', '2', '0', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('30', '泰国', '29', '3', '0', 'T', '0');
INSERT INTO `mmm_line_place` VALUES ('32', '普吉岛', '30', '4', '0', 'P', '1');
INSERT INTO `mmm_line_place` VALUES ('33', '东莞', '4', '3', '2', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('34', '福建', '1', '2', '0', 'F', '0');
INSERT INTO `mmm_line_place` VALUES ('35', '海南', '1', '2', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('36', '惠州', '4', '3', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('37', '清远', '4', '3', '0', 'Q', '0');
INSERT INTO `mmm_line_place` VALUES ('38', '肇庆', '4', '3', '0', 'Z', '0');
INSERT INTO `mmm_line_place` VALUES ('39', '江门', '4', '3', '0', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('40', '阳江', '4', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('41', '英德', '4', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('42', '珠海', '4', '3', '0', 'Z', '0');
INSERT INTO `mmm_line_place` VALUES ('43', '汕尾', '4', '3', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('44', '河源', '4', '3', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('45', '阳朔', '5', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('46', '湖南', '1', '2', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('47', '云南', '1', '2', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('48', '北京', '1', '2', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('49', '广州', '4', '3', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('50', '汕头', '4', '3', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('51', '四川', '1', '2', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('52', '新疆', '1', '2', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('53', '西北', '1', '2', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('54', '西藏', '1', '2', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('55', '陕西', '1', '2', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('56', '河南', '1', '2', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('57', '内蒙古', '1', '2', '0', 'N', '0');
INSERT INTO `mmm_line_place` VALUES ('58', '湖北', '1', '2', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('59', '贵州', '1', '2', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('60', '山东', '1', '2', '0', 'S', '0');
INSERT INTO `mmm_line_place` VALUES ('61', '青海', '53', '3', '0', 'Q', '0');
INSERT INTO `mmm_line_place` VALUES ('62', '宁夏', '53', '3', '0', 'N', '0');
INSERT INTO `mmm_line_place` VALUES ('63', '甘肃', '53', '3', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('64', '江西', '1', '2', '0', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('65', '港澳珠', '3', '2', '0', 'G', '0');
INSERT INTO `mmm_line_place` VALUES ('68', '香港', '65', '3', '3', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('69', '澳门', '65', '3', '1', 'A', '0');
INSERT INTO `mmm_line_place` VALUES ('70', '珠海', '65', '3', '0', 'Z', '0');
INSERT INTO `mmm_line_place` VALUES ('71', '韩国', '2', '2', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('72', '欧洲', '2', '2', '0', 'O', '0');
INSERT INTO `mmm_line_place` VALUES ('73', '美洲', '2', '2', '0', 'M', '0');
INSERT INTO `mmm_line_place` VALUES ('74', '澳洲', '2', '2', '0', 'A', '0');
INSERT INTO `mmm_line_place` VALUES ('75', '新西兰', '74', '3', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('76', '澳大利亚', '74', '3', '1', 'A', '0');
INSERT INTO `mmm_line_place` VALUES ('77', '美国', '73', '3', '10', 'M', '0');
INSERT INTO `mmm_line_place` VALUES ('78', '加拿大', '73', '3', '0', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('79', '巴西', '73', '3', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('80', '南亚', '2', '2', '0', 'N', '0');
INSERT INTO `mmm_line_place` VALUES ('81', '芬兰', '72', '3', '0', 'F', '0');
INSERT INTO `mmm_line_place` VALUES ('82', '瑞典', '72', '3', '0', 'R', '0');
INSERT INTO `mmm_line_place` VALUES ('83', '挪威', '72', '3', '0', 'N', '0');
INSERT INTO `mmm_line_place` VALUES ('84', '英国', '72', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('85', '法国', '72', '3', '0', 'F', '0');
INSERT INTO `mmm_line_place` VALUES ('86', '冰岛', '72', '3', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('87', '丹麦', '72', '3', '0', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('88', '俄罗斯', '72', '3', '0', 'E', '0');
INSERT INTO `mmm_line_place` VALUES ('89', '波兰', '72', '3', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('90', '德国', '72', '3', '0', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('91', '奥地利', '72', '3', '0', 'A', '0');
INSERT INTO `mmm_line_place` VALUES ('92', '瑞士', '72', '3', '0', 'R', '0');
INSERT INTO `mmm_line_place` VALUES ('93', '爱尔兰', '72', '3', '0', 'A', '0');
INSERT INTO `mmm_line_place` VALUES ('94', '荷兰', '72', '3', '0', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('95', '比利时', '72', '3', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('96', '卢森堡', '72', '3', '0', 'L', '0');
INSERT INTO `mmm_line_place` VALUES ('97', '摩纳哥', '72', '3', '0', 'M', '0');
INSERT INTO `mmm_line_place` VALUES ('98', '希腊', '72', '3', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('99', '意大利', '72', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('100', '梵蒂冈', '72', '3', '0', 'F', '0');
INSERT INTO `mmm_line_place` VALUES ('101', '西班牙', '72', '3', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('102', '葡萄牙', '72', '3', '0', 'P', '0');
INSERT INTO `mmm_line_place` VALUES ('103', '尼泊尔', '80', '3', '0', 'N', '0');
INSERT INTO `mmm_line_place` VALUES ('104', '不丹', '80', '3', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('105', '印度', '80', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('106', '巴基斯坦', '80', '3', '0', 'B', '0');
INSERT INTO `mmm_line_place` VALUES ('107', '孟加拉', '80', '3', '0', 'M', '0');
INSERT INTO `mmm_line_place` VALUES ('108', '斯里兰卡', '80', '3', '0', 'S', '1');
INSERT INTO `mmm_line_place` VALUES ('109', '马尔代夫', '80', '3', '0', 'M', '1');
INSERT INTO `mmm_line_place` VALUES ('110', '越南', '29', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('111', '老挝', '29', '3', '0', 'L', '0');
INSERT INTO `mmm_line_place` VALUES ('112', '柬埔寨', '29', '3', '0', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('113', '缅甸', '29', '3', '0', 'M', '0');
INSERT INTO `mmm_line_place` VALUES ('114', '马来西亚', '29', '3', '0', 'M', '0');
INSERT INTO `mmm_line_place` VALUES ('115', '新加坡', '29', '3', '0', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('116', '印度尼西亚', '29', '3', '0', 'Y', '0');
INSERT INTO `mmm_line_place` VALUES ('117', '文莱', '29', '3', '0', 'W', '0');
INSERT INTO `mmm_line_place` VALUES ('118', '菲律宾', '29', '3', '0', 'F', '0');
INSERT INTO `mmm_line_place` VALUES ('119', '东帝汶', '29', '3', '0', 'D', '0');
INSERT INTO `mmm_line_place` VALUES ('120', '厦门', '34', '3', '1', 'X', '0');
INSERT INTO `mmm_line_place` VALUES ('121', '三亚', '35', '3', '1', 'S', '1');
INSERT INTO `mmm_line_place` VALUES ('122', '海口', '35', '3', '2', 'H', '0');
INSERT INTO `mmm_line_place` VALUES ('123', '京都', '27', '3', '2', 'J', '0');
INSERT INTO `mmm_line_place` VALUES ('124', '大阪', '27', '3', '3', 'D', '0');

-- ----------------------------
-- Table structure for mmm_member
-- ----------------------------
DROP TABLE IF EXISTS `mmm_member`;
CREATE TABLE `mmm_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '真实名字',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 ;  0保密;  1男; 2女',
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `addr` varchar(250) NOT NULL DEFAULT '' COMMENT '收货地址',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `emailverified` tinyint(1) DEFAULT '0' COMMENT '邮箱认证0未认证，1未激活，2已认证',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `photo` varchar(200) DEFAULT '' COMMENT '头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0禁用/1启用',
  `regtime` int(11) DEFAULT NULL COMMENT '注册时间',
  `regip` varchar(20) DEFAULT '' COMMENT '注册IP',
  `lastlogin` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `lastip` varchar(20) DEFAULT '' COMMENT '最后登录的ip',
  `updatetime` int(11) DEFAULT NULL COMMENT '最后修改数据的时间',
  `stopreason` varchar(200) DEFAULT '' COMMENT '停用理由',
  `stoptime` bigint(20) DEFAULT NULL COMMENT '停用时间',
  `id_type` varchar(255) DEFAULT NULL COMMENT '证件类型id，关联mmm_id_type表主键',
  `id_num` varchar(32) DEFAULT '' COMMENT '证件号码',
  `from` tinyint(4) DEFAULT '0' COMMENT '来源：0-pc注册 ， 1-wap注册',
  `openid` varchar(120) DEFAULT '' COMMENT '微信id',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0 否 1 是',
  `logintoken` varchar(64) NOT NULL DEFAULT '' COMMENT '最后登录的TOKEN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of mmm_member
-- ----------------------------
INSERT INTO `mmm_member` VALUES ('1', '张三', 'fb461af31f6d5c0bbdea4361dd3bc79f', '1', '测试', '13425157494', '深圳龙岗', '66890620@qq.com', '0', null, '', '1', null, '', '1486982065', '127.0.0.1', '1488540638', '', null, '1', '142328195502145674', '0', '', '0', '');

-- ----------------------------
-- Table structure for mmm_menu
-- ----------------------------
DROP TABLE IF EXISTS `mmm_menu`;
CREATE TABLE `mmm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `addr` varchar(128) NOT NULL DEFAULT '' COMMENT '链接地址',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `deep` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单深度，1、2、3层',
  `isshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1-显示，0-不显示',
  `orderid` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `controller` varchar(128) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(128) NOT NULL DEFAULT '' COMMENT '操作名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单显示位置，1-后台，2-前台',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用，0-不禁用，1-禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='前台和后台菜单表';

-- ----------------------------
-- Records of mmm_menu
-- ----------------------------
INSERT INTO `mmm_menu` VALUES ('1', '员工管理', '', '0', '1', '1', '5', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('2', '订单管理', '', '0', '1', '1', '4', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('3', '员工表', '/Admin/Employee/lists', '1', '2', '1', '1', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('4', '部门管理', '/Admin/Employee/adminDepa', '1', '2', '1', '1', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('5', '添加订单', '/Admin/Order/add', '2', '2', '1', '0', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('6', '修改订单', '/Admin/Order/edit', '2', '2', '1', '1', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('7', '管理员工', '/Admin/Employee/manage', '1', '2', '1', '2', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('8', '出游登记', '', '0', '1', '1', '2', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('9', '添加客人', '/Admin/TravelInfo/add', '8', '2', '1', '2', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('11', '导出出游客人', '/Admin/TravelInfo/infoselect', '8', '2', '1', '3', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('12', '出游列表', '/Admin/TravelInfo/travelinfo', '8', '2', '1', '0', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('13', '线路管理', '', '0', '1', '1', '3', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('14', '财务管理', '', '0', '1', '1', '6', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('15', '首页', '', '0', '1', '1', '1', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('16', '首页', '/Admin/Index/welcome', '15', '2', '1', '0', 'index', 'welcome', '1', '0');
INSERT INTO `mmm_menu` VALUES ('17', '系统设置', '', '0', '1', '1', '8', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('18', '员工管理', '/Admin/Employee/emplList', '1', '2', '1', '0', 'employee', 'emplList', '1', '0');
INSERT INTO `mmm_menu` VALUES ('19', '栏目广告', '/Admin/Ad/adtype', '17', '2', '1', '0', 'ad', 'adtype', '1', '0');
INSERT INTO `mmm_menu` VALUES ('20', '出发、目的地管理', '/Admin/Place/placelist', '17', '2', '1', '0', 'place', 'placelist', '1', '0');
INSERT INTO `mmm_menu` VALUES ('21', '周边线路', '/Admin/Line/linelist?type=1', '13', '2', '1', '0', 'line', 'linelist?type=1', '1', '0');
INSERT INTO `mmm_menu` VALUES ('22', '国内线路', '/Admin/Line/linelist?type=2', '13', '2', '1', '1', 'line', 'linelist?type=2', '1', '0');
INSERT INTO `mmm_menu` VALUES ('23', '供应商管理', '', '0', '1', '1', '7', '', '', '1', '0');
INSERT INTO `mmm_menu` VALUES ('24', '供应商列表', '/Admin/Supplier/lists', '23', '2', '1', '0', 'supplier', 'lists', '1', '0');
INSERT INTO `mmm_menu` VALUES ('25', '线路标签', '/Admin/Line/label', '13', '2', '1', '4', 'line', 'label', '1', '0');
INSERT INTO `mmm_menu` VALUES ('26', '出境线路', '/Admin/Line/linelist?type=3', '13', '2', '1', '2', 'line', 'linelist?type=3', '1', '0');
INSERT INTO `mmm_menu` VALUES ('27', '港澳线路', '/Admin/Line/linelist?type=4', '13', '2', '1', '3', 'line', 'linelist?type=3', '1', '0');
INSERT INTO `mmm_menu` VALUES ('28', '网站信息', '/Admin/Index/web_info', '17', '2', '1', '0', 'index', 'web_info', '1', '0');

-- ----------------------------
-- Table structure for mmm_order
-- ----------------------------
DROP TABLE IF EXISTS `mmm_order`;
CREATE TABLE `mmm_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id,关联mmm_member的主键id',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单状态：1-生成订单,2-待确认订单,3-支付订单,4-关闭订单(订单失效、取消、退款状态),5-完成订单',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0：未支付，1：已支付，2：已退款',
  `travel_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '出游状态：0-待出游，1-正出游，2-已出游',
  `lineid` int(11) NOT NULL DEFAULT '0' COMMENT '线路id,关联mmm_line表主键',
  `dateid` int(11) NOT NULL DEFAULT '0' COMMENT '线路日期id，关联mmm_line_date表主键id',
  `pay_amount` int(11) NOT NULL DEFAULT '0' COMMENT '支付总金额',
  `adult_price` int(11) NOT NULL DEFAULT '0' COMMENT '成人价格',
  `adult_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '成人个数',
  `child_price` int(11) NOT NULL DEFAULT '0' COMMENT '儿童价格',
  `child_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '儿童个数',
  `single_price` int(11) NOT NULL DEFAULT '0' COMMENT '全程单房差价格',
  `single_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单房个数',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `if_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被用户删除：0-不是，1-是',
  PRIMARY KEY (`id`),
  KEY `uesr_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of mmm_order
-- ----------------------------
INSERT INTO `mmm_order` VALUES ('1', '1', '1703011123541054', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', null, null, null, '0');
INSERT INTO `mmm_order` VALUES ('2', '1', '1703082206396626', '1', '0', '0', '100002', '15', '11240', '3580', '2', '3180', '1', '0', '1', '出行需要注意什么', '2017-03-08 22:06:39', null, null, '0');
INSERT INTO `mmm_order` VALUES ('3', '1', '1703082208286087', '1', '0', '0', '100007', '95', '2368', '428', '4', '328', '2', '0', '0', '有自由活动时间吗', '2017-03-08 22:08:28', null, null, '0');
INSERT INTO `mmm_order` VALUES ('4', '1', '1703082210551126', '1', '0', '0', '100007', '95', '1712', '428', '3', '328', '1', '100', '1', '有三人床吗', '2017-03-08 22:10:55', null, null, '0');

-- ----------------------------
-- Table structure for mmm_region
-- ----------------------------
DROP TABLE IF EXISTS `mmm_region`;
CREATE TABLE `mmm_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `parentid` int(11) NOT NULL COMMENT '父级ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型',
  `agency` tinyint(1) DEFAULT NULL,
  `orderid` int(11) DEFAULT '0' COMMENT '排序',
  `firstChar` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '拼音首字母',
  `abbr` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '地区类型  1江浙沪，2华东，3华南，4，华中，5华北，6东北，7西北，8西南，9港澳台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5423 DEFAULT CHARSET=utf8 COMMENT='行政区域';

-- ----------------------------
-- Records of mmm_region
-- ----------------------------
INSERT INTO `mmm_region` VALUES ('1', '黑龙江省', '0', '1', '0', '0', null, null, '6');
INSERT INTO `mmm_region` VALUES ('2', '浙江省', '0', '1', '0', '0', null, null, '1');
INSERT INTO `mmm_region` VALUES ('3', '山东省', '0', '1', '0', '0', null, null, '2');
INSERT INTO `mmm_region` VALUES ('4', '湖南省', '0', '1', '0', '0', null, null, '4');
INSERT INTO `mmm_region` VALUES ('5', '甘肃省', '0', '1', '0', '0', null, null, '7');
INSERT INTO `mmm_region` VALUES ('6', '上海市', '0', '1', '0', '0', 'S', 'SHS', '1');
INSERT INTO `mmm_region` VALUES ('7', '台湾', '0', '1', '0', '0', 'T', 'TW', '9');
INSERT INTO `mmm_region` VALUES ('8', '吉林省', '0', '1', '0', '0', null, null, '6');
INSERT INTO `mmm_region` VALUES ('9', '福建省', '0', '1', '0', '0', null, null, '2');
INSERT INTO `mmm_region` VALUES ('10', '宁夏回族自治区', '0', '1', '0', '0', null, null, '7');
INSERT INTO `mmm_region` VALUES ('11', '贵州省', '0', '1', '0', '0', null, null, '8');
INSERT INTO `mmm_region` VALUES ('12', '四川省', '0', '1', '0', '0', null, null, '8');
INSERT INTO `mmm_region` VALUES ('13', '青海省', '0', '1', '0', '0', null, null, '7');
INSERT INTO `mmm_region` VALUES ('14', '陕西省', '0', '1', '0', '0', null, null, '7');
INSERT INTO `mmm_region` VALUES ('15', '河南省', '0', '1', '0', '0', null, null, '4');
INSERT INTO `mmm_region` VALUES ('16', '西藏自治区', '0', '1', '0', '0', null, null, '8');
INSERT INTO `mmm_region` VALUES ('17', '天津市', '0', '1', '0', '0', 'T', 'TJS', '5');
INSERT INTO `mmm_region` VALUES ('18', '北京市', '0', '1', '0', '0', 'B', 'BJS', '5');
INSERT INTO `mmm_region` VALUES ('19', '云南省', '0', '1', '0', '0', null, null, '8');
INSERT INTO `mmm_region` VALUES ('20', '香港特别行政区', '0', '1', '0', '0', 'X', 'XGTBXZQ', '9');
INSERT INTO `mmm_region` VALUES ('21', '内蒙古自治区', '0', '1', '0', '0', null, null, '5');
INSERT INTO `mmm_region` VALUES ('22', '广东省', '0', '1', '0', '1', null, null, '3');
INSERT INTO `mmm_region` VALUES ('23', '江西省', '0', '1', '0', '0', null, null, '4');
INSERT INTO `mmm_region` VALUES ('24', '重庆市', '0', '1', '0', '0', 'C', 'CQS', '8');
INSERT INTO `mmm_region` VALUES ('25', '湖北省', '0', '1', '0', '0', null, null, '4');
INSERT INTO `mmm_region` VALUES ('26', '安徽省', '0', '1', '0', '0', null, null, '2');
INSERT INTO `mmm_region` VALUES ('27', '辽宁省', '0', '1', '0', '0', null, null, '6');
INSERT INTO `mmm_region` VALUES ('28', '山西省', '0', '1', '0', '0', null, null, '5');
INSERT INTO `mmm_region` VALUES ('29', '新疆维吾尔自治区', '0', '1', '0', '0', null, null, '7');
INSERT INTO `mmm_region` VALUES ('30', '江苏省', '0', '1', '0', '0', null, null, '1');
INSERT INTO `mmm_region` VALUES ('31', '广西壮族自治区', '0', '1', '0', '0', null, null, '3');
INSERT INTO `mmm_region` VALUES ('32', '河北省', '0', '1', '0', '0', null, null, '5');
INSERT INTO `mmm_region` VALUES ('33', '海南省', '0', '1', '0', '0', null, null, '3');
INSERT INTO `mmm_region` VALUES ('34', '澳门特别行政区', '0', '1', '0', '0', 'A', 'AMTBXZQ', '9');
INSERT INTO `mmm_region` VALUES ('35', '七台河市', '1', '2', '0', '0', 'Q', 'QTHS', null);
INSERT INTO `mmm_region` VALUES ('36', '伊春市', '1', '2', '0', '0', 'Y', 'YCS', null);
INSERT INTO `mmm_region` VALUES ('37', '佳木斯市', '1', '2', '0', '0', 'J', 'JMSS', null);
INSERT INTO `mmm_region` VALUES ('38', '双鸭山市', '1', '2', '0', '0', 'S', 'SYSS', null);
INSERT INTO `mmm_region` VALUES ('39', '哈尔滨市', '1', '2', '0', '0', 'H', 'HEBS', null);
INSERT INTO `mmm_region` VALUES ('40', '大兴安岭地区', '1', '2', '0', '0', 'D', 'DXALDQ', null);
INSERT INTO `mmm_region` VALUES ('41', '大庆市', '1', '2', '0', '0', 'D', 'DQS', null);
INSERT INTO `mmm_region` VALUES ('42', '牡丹江市', '1', '2', '0', '0', 'M', 'MDJS', null);
INSERT INTO `mmm_region` VALUES ('43', '绥化市', '1', '2', '0', '0', 'S', 'SHS', null);
INSERT INTO `mmm_region` VALUES ('44', '鸡西市', '1', '2', '0', '0', 'J', 'JXS', null);
INSERT INTO `mmm_region` VALUES ('45', '鹤岗市', '1', '2', '0', '0', 'H', 'HGS', null);
INSERT INTO `mmm_region` VALUES ('46', '黑河市', '1', '2', '0', '0', 'H', 'HHS', null);
INSERT INTO `mmm_region` VALUES ('47', '齐齐哈尔市', '1', '2', '0', '0', 'Q', 'QQHES', null);
INSERT INTO `mmm_region` VALUES ('48', '丽水市', '2', '2', '0', '0', 'L', 'LSS', null);
INSERT INTO `mmm_region` VALUES ('49', '台州市', '2', '2', '0', '0', 'T', 'TZS', null);
INSERT INTO `mmm_region` VALUES ('50', '嘉兴市', '2', '2', '0', '0', 'J', 'JXS', null);
INSERT INTO `mmm_region` VALUES ('51', '宁波市', '2', '2', '0', '0', 'N', 'NBS', null);
INSERT INTO `mmm_region` VALUES ('52', '杭州市', '2', '2', '0', '0', 'H', 'HZS', null);
INSERT INTO `mmm_region` VALUES ('53', '温州市', '2', '2', '0', '0', 'W', 'WZS', null);
INSERT INTO `mmm_region` VALUES ('54', '湖州市', '2', '2', '0', '0', 'H', 'HZS', null);
INSERT INTO `mmm_region` VALUES ('55', '绍兴市', '2', '2', '0', '0', 'S', 'SXS', null);
INSERT INTO `mmm_region` VALUES ('56', '舟山市', '2', '2', '0', '0', 'Z', 'ZSS', null);
INSERT INTO `mmm_region` VALUES ('57', '衢州市', '2', '2', '0', '0', 'Q', 'QZS', null);
INSERT INTO `mmm_region` VALUES ('58', '金华市', '2', '2', '0', '0', 'J', 'JHS', null);
INSERT INTO `mmm_region` VALUES ('59', '东营市', '3', '2', '0', '0', 'D', 'DYS', null);
INSERT INTO `mmm_region` VALUES ('60', '临沂市', '3', '2', '0', '0', 'L', 'LYS', null);
INSERT INTO `mmm_region` VALUES ('61', '威海市', '3', '2', '0', '0', 'W', 'WHS', null);
INSERT INTO `mmm_region` VALUES ('62', '德州市', '3', '2', '0', '0', 'D', 'DZS', null);
INSERT INTO `mmm_region` VALUES ('63', '日照市', '3', '2', '0', '0', 'R', 'RZS', null);
INSERT INTO `mmm_region` VALUES ('64', '枣庄市', '3', '2', '0', '0', 'Z', 'ZZS', null);
INSERT INTO `mmm_region` VALUES ('65', '泰安市', '3', '2', '0', '0', 'T', 'TAS', null);
INSERT INTO `mmm_region` VALUES ('66', '济南市', '3', '2', '0', '0', 'J', 'JNS', null);
INSERT INTO `mmm_region` VALUES ('67', '济宁市', '3', '2', '0', '0', 'J', 'JNS', null);
INSERT INTO `mmm_region` VALUES ('68', '淄博市', '3', '2', '0', '0', 'Z', 'ZBS', null);
INSERT INTO `mmm_region` VALUES ('69', '滨州市', '3', '2', '0', '0', 'B', 'BZS', null);
INSERT INTO `mmm_region` VALUES ('70', '潍坊市', '3', '2', '0', '0', 'W', 'WFS', null);
INSERT INTO `mmm_region` VALUES ('71', '烟台市', '3', '2', '0', '0', 'Y', 'YTS', null);
INSERT INTO `mmm_region` VALUES ('72', '聊城市', '3', '2', '0', '0', 'L', 'LCS', null);
INSERT INTO `mmm_region` VALUES ('73', '莱芜市', '3', '2', '0', '0', 'L', 'LWS', null);
INSERT INTO `mmm_region` VALUES ('74', '菏泽市', '3', '2', '0', '0', 'H', 'HZS', null);
INSERT INTO `mmm_region` VALUES ('75', '青岛市', '3', '2', '0', '0', 'Q', 'QDS', null);
INSERT INTO `mmm_region` VALUES ('76', '娄底市', '4', '2', '0', '0', 'L', 'LDS', null);
INSERT INTO `mmm_region` VALUES ('77', '岳阳市', '4', '2', '0', '0', 'Y', 'YYX', null);
INSERT INTO `mmm_region` VALUES ('78', '常德市', '4', '2', '0', '0', 'C', 'CDS', null);
INSERT INTO `mmm_region` VALUES ('79', '张家界市', '4', '2', '0', '0', 'Z', 'ZJJS', null);
INSERT INTO `mmm_region` VALUES ('80', '怀化市', '4', '2', '0', '0', 'H', 'HHS', null);
INSERT INTO `mmm_region` VALUES ('81', '株洲市', '4', '2', '0', '0', 'Z', 'ZZS', null);
INSERT INTO `mmm_region` VALUES ('82', '永州市', '4', '2', '0', '0', 'Y', 'YZS', null);
INSERT INTO `mmm_region` VALUES ('83', '湘潭市', '4', '2', '0', '0', 'X', 'XTS', null);
INSERT INTO `mmm_region` VALUES ('84', '湘西土家族苗族自治州', '4', '2', '0', '0', 'X', 'XXTJZMZZZZ', null);
INSERT INTO `mmm_region` VALUES ('85', '益阳市', '4', '2', '0', '0', 'Y', 'YYS', null);
INSERT INTO `mmm_region` VALUES ('86', '衡阳市', '4', '2', '0', '0', 'H', 'HYS', null);
INSERT INTO `mmm_region` VALUES ('87', '邵阳市', '4', '2', '0', '0', 'S', 'SYS', null);
INSERT INTO `mmm_region` VALUES ('88', '郴州市', '4', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('89', '长沙市', '4', '2', '0', '0', 'C', 'CSS', null);
INSERT INTO `mmm_region` VALUES ('90', '临夏回族自治州', '5', '2', '0', '0', 'L', 'LXHZZZZ', null);
INSERT INTO `mmm_region` VALUES ('91', '兰州市', '5', '2', '0', '0', 'L', 'LZS', null);
INSERT INTO `mmm_region` VALUES ('92', '嘉峪关市', '5', '2', '0', '0', 'J', 'JYGS', null);
INSERT INTO `mmm_region` VALUES ('93', '天水市', '5', '2', '0', '0', 'T', 'TSS', null);
INSERT INTO `mmm_region` VALUES ('94', '定西市', '5', '2', '0', '0', 'D', 'DXS', null);
INSERT INTO `mmm_region` VALUES ('95', '平凉市', '5', '2', '0', '0', 'P', 'PLS', null);
INSERT INTO `mmm_region` VALUES ('96', '庆阳市', '5', '2', '0', '0', 'Q', 'QYS', null);
INSERT INTO `mmm_region` VALUES ('97', '张掖市', '5', '2', '0', '0', 'Z', 'ZYS', null);
INSERT INTO `mmm_region` VALUES ('98', '武威市', '5', '2', '0', '0', 'W', 'WWS', null);
INSERT INTO `mmm_region` VALUES ('99', '甘南藏族自治州', '5', '2', '0', '0', 'G', 'GNZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('100', '白银市', '5', '2', '0', '0', 'B', 'BYS', null);
INSERT INTO `mmm_region` VALUES ('101', '酒泉市', '5', '2', '0', '0', 'J', 'JQS', null);
INSERT INTO `mmm_region` VALUES ('102', '金昌市', '5', '2', '0', '0', 'J', 'JCS', null);
INSERT INTO `mmm_region` VALUES ('103', '陇南市', '5', '2', '0', '0', 'L', 'LNS', null);
INSERT INTO `mmm_region` VALUES ('104', '上海市', '6', '2', '0', '0', 'S', 'SHS', null);
INSERT INTO `mmm_region` VALUES ('105', '台湾', '7', '2', '0', '0', 'T', 'TW', null);
INSERT INTO `mmm_region` VALUES ('106', '吉林市', '8', '2', '0', '0', 'J', 'JLS', null);
INSERT INTO `mmm_region` VALUES ('107', '四平市', '8', '2', '0', '0', 'S', 'SPS', null);
INSERT INTO `mmm_region` VALUES ('108', '延边朝鲜族自治州', '8', '2', '0', '0', 'Y', 'YBCXZZZZ', null);
INSERT INTO `mmm_region` VALUES ('109', '松原市', '8', '2', '0', '0', 'S', 'SYS', null);
INSERT INTO `mmm_region` VALUES ('110', '白城市', '8', '2', '0', '0', 'B', 'BCS', null);
INSERT INTO `mmm_region` VALUES ('111', '白山市', '8', '2', '0', '0', 'B', 'BSS', null);
INSERT INTO `mmm_region` VALUES ('112', '辽源市', '8', '2', '0', '0', 'L', 'LYS', null);
INSERT INTO `mmm_region` VALUES ('113', '通化市', '8', '2', '0', '0', 'T', 'THS', null);
INSERT INTO `mmm_region` VALUES ('114', '长春市', '8', '2', '0', '0', 'C', 'CCS', null);
INSERT INTO `mmm_region` VALUES ('115', '三明市', '9', '2', '0', '0', 'S', 'SMS', null);
INSERT INTO `mmm_region` VALUES ('116', '南平市', '9', '2', '0', '0', 'N', 'NPS', null);
INSERT INTO `mmm_region` VALUES ('117', '厦门市', '9', '2', '0', '0', 'X', 'XMS', null);
INSERT INTO `mmm_region` VALUES ('118', '宁德市', '9', '2', '0', '0', 'N', 'NDS', null);
INSERT INTO `mmm_region` VALUES ('119', '泉州市', '9', '2', '0', '0', 'Q', 'QZS', null);
INSERT INTO `mmm_region` VALUES ('120', '漳州市', '9', '2', '0', '0', 'Z', 'ZZS', null);
INSERT INTO `mmm_region` VALUES ('121', '福州市', '9', '2', '0', '0', 'F', 'FZS', null);
INSERT INTO `mmm_region` VALUES ('122', '莆田市', '9', '2', '0', '0', 'P', 'PTS', null);
INSERT INTO `mmm_region` VALUES ('123', '龙岩市', '9', '2', '0', '0', 'L', 'LYS', null);
INSERT INTO `mmm_region` VALUES ('124', '中卫市', '10', '2', '0', '0', 'Z', 'ZWS', null);
INSERT INTO `mmm_region` VALUES ('125', '吴忠市', '10', '2', '0', '0', 'W', 'WZS', null);
INSERT INTO `mmm_region` VALUES ('126', '固原市', '10', '2', '0', '0', 'G', 'GYS', null);
INSERT INTO `mmm_region` VALUES ('127', '石嘴山市', '10', '2', '0', '0', 'S', 'SZSS', null);
INSERT INTO `mmm_region` VALUES ('128', '银川市', '10', '2', '0', '0', 'Y', 'YCS', null);
INSERT INTO `mmm_region` VALUES ('129', '六盘水市', '11', '2', '0', '0', 'L', 'LPSS', null);
INSERT INTO `mmm_region` VALUES ('130', '安顺市', '11', '2', '0', '0', 'A', 'ASS', null);
INSERT INTO `mmm_region` VALUES ('131', '毕节地区', '11', '2', '0', '0', 'B', 'BJDQ', null);
INSERT INTO `mmm_region` VALUES ('132', '贵阳市', '11', '2', '0', '0', 'G', 'GYS', null);
INSERT INTO `mmm_region` VALUES ('133', '遵义市', '11', '2', '0', '0', 'Z', 'ZYS', null);
INSERT INTO `mmm_region` VALUES ('134', '铜仁地区', '11', '2', '0', '0', 'T', 'TRDQ', null);
INSERT INTO `mmm_region` VALUES ('135', '黔东南苗族侗族自治州', '11', '2', '0', '0', 'Q', 'QDNMZDZZZZ', null);
INSERT INTO `mmm_region` VALUES ('136', '黔南布依族苗族自治州', '11', '2', '0', '0', 'Q', 'QNBYZMZZZZ', null);
INSERT INTO `mmm_region` VALUES ('137', '黔西南布依族苗族自治州', '11', '2', '0', '0', 'Q', 'QXNBYZMZZZZ', null);
INSERT INTO `mmm_region` VALUES ('138', '乐山市', '12', '2', '0', '0', 'L', 'LSS', null);
INSERT INTO `mmm_region` VALUES ('139', '内江市', '12', '2', '0', '0', 'N', 'NJS', null);
INSERT INTO `mmm_region` VALUES ('140', '凉山彝族自治州', '12', '2', '0', '0', 'L', 'LSYZZZZ', null);
INSERT INTO `mmm_region` VALUES ('141', '南充市', '12', '2', '0', '0', 'N', 'NCS', null);
INSERT INTO `mmm_region` VALUES ('142', '宜宾市', '12', '2', '0', '0', 'Y', 'YBS', null);
INSERT INTO `mmm_region` VALUES ('143', '巴中市', '12', '2', '0', '0', 'B', 'BZS', null);
INSERT INTO `mmm_region` VALUES ('144', '广元市', '12', '2', '0', '0', 'G', 'GYS', null);
INSERT INTO `mmm_region` VALUES ('145', '广安市', '12', '2', '0', '0', 'G', 'GAS', null);
INSERT INTO `mmm_region` VALUES ('146', '德阳市', '12', '2', '0', '0', 'D', 'DYS', null);
INSERT INTO `mmm_region` VALUES ('147', '成都市', '12', '2', '0', '0', 'C', 'CDS', null);
INSERT INTO `mmm_region` VALUES ('148', '攀枝花市', '12', '2', '0', '0', 'P', 'PZHS', null);
INSERT INTO `mmm_region` VALUES ('149', '泸州市', '12', '2', '0', '0', 'L', 'LZS', null);
INSERT INTO `mmm_region` VALUES ('150', '甘孜藏族自治州', '12', '2', '0', '0', 'G', 'GZZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('151', '眉山市', '12', '2', '0', '0', 'M', 'MSS', null);
INSERT INTO `mmm_region` VALUES ('152', '绵阳市', '12', '2', '0', '0', 'M', 'MYS', null);
INSERT INTO `mmm_region` VALUES ('153', '自贡市', '12', '2', '0', '0', 'Z', 'ZGS', null);
INSERT INTO `mmm_region` VALUES ('154', '资阳市', '12', '2', '0', '0', 'Z', 'ZYS', null);
INSERT INTO `mmm_region` VALUES ('155', '达州市', '12', '2', '0', '0', 'D', 'DZS', null);
INSERT INTO `mmm_region` VALUES ('156', '遂宁市', '12', '2', '0', '0', 'S', 'SNS', null);
INSERT INTO `mmm_region` VALUES ('157', '阿坝藏族羌族自治州', '12', '2', '0', '0', 'A', 'ABZZWZZZZ', null);
INSERT INTO `mmm_region` VALUES ('158', '雅安市', '12', '2', '0', '0', 'Y', 'YAS', null);
INSERT INTO `mmm_region` VALUES ('159', '果洛藏族自治州', '13', '2', '0', '0', 'G', 'GLZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('160', '海东地区', '13', '2', '0', '0', 'H', 'HDDQ', null);
INSERT INTO `mmm_region` VALUES ('161', '海北藏族自治州', '13', '2', '0', '0', 'H', 'HBZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('162', '海南藏族自治州', '13', '2', '0', '0', 'H', 'HNZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('163', '海西蒙古族藏族自治州', '13', '2', '0', '0', 'H', 'HXMGZZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('164', '玉树藏族自治州', '13', '2', '0', '0', 'Y', 'YSZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('165', '西宁市', '13', '2', '0', '0', 'X', 'XNS', null);
INSERT INTO `mmm_region` VALUES ('166', '黄南藏族自治州', '13', '2', '0', '0', 'H', 'HNZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('167', '咸阳市', '14', '2', '0', '0', 'X', 'XYS', null);
INSERT INTO `mmm_region` VALUES ('168', '商洛市', '14', '2', '0', '0', 'S', 'SLS', null);
INSERT INTO `mmm_region` VALUES ('169', '安康市', '14', '2', '0', '0', 'A', 'AKS', null);
INSERT INTO `mmm_region` VALUES ('170', '宝鸡市', '14', '2', '0', '0', 'B', 'BJS', null);
INSERT INTO `mmm_region` VALUES ('171', '延安市', '14', '2', '0', '0', 'Y', 'YAS', null);
INSERT INTO `mmm_region` VALUES ('172', '榆林市', '14', '2', '0', '0', 'Y', 'YLS', null);
INSERT INTO `mmm_region` VALUES ('173', '汉中市', '14', '2', '0', '0', 'H', 'HZS', null);
INSERT INTO `mmm_region` VALUES ('174', '渭南市', '14', '2', '0', '0', 'W', 'WNS', null);
INSERT INTO `mmm_region` VALUES ('175', '西安市', '14', '2', '0', '0', 'X', 'XAS', null);
INSERT INTO `mmm_region` VALUES ('176', '铜川市', '14', '2', '0', '0', 'T', 'TCS', null);
INSERT INTO `mmm_region` VALUES ('177', '三门峡市', '15', '2', '0', '0', 'S', 'SMXS', null);
INSERT INTO `mmm_region` VALUES ('178', '信阳市', '15', '2', '0', '0', 'X', 'XYS', null);
INSERT INTO `mmm_region` VALUES ('179', '南阳市', '15', '2', '0', '0', 'N', 'NYS', null);
INSERT INTO `mmm_region` VALUES ('180', '周口市', '15', '2', '0', '0', 'Z', 'ZKS', null);
INSERT INTO `mmm_region` VALUES ('181', '商丘市', '15', '2', '0', '0', 'S', 'SQS', null);
INSERT INTO `mmm_region` VALUES ('182', '安阳市', '15', '2', '0', '0', 'A', 'AYS', null);
INSERT INTO `mmm_region` VALUES ('183', '平顶山市', '15', '2', '0', '0', 'P', 'PDSS', null);
INSERT INTO `mmm_region` VALUES ('184', '开封市', '15', '2', '0', '0', 'K', 'KFS', null);
INSERT INTO `mmm_region` VALUES ('185', '新乡市', '15', '2', '0', '0', 'X', 'XXS', null);
INSERT INTO `mmm_region` VALUES ('186', '洛阳市', '15', '2', '0', '0', 'L', 'LYS', null);
INSERT INTO `mmm_region` VALUES ('187', '济源市', '15', '2', '0', '0', 'J', 'JYS', null);
INSERT INTO `mmm_region` VALUES ('188', '漯河市', '15', '2', '0', '0', 'L', 'LHS', null);
INSERT INTO `mmm_region` VALUES ('189', '濮阳市', '15', '2', '0', '0', 'P', 'PYS', null);
INSERT INTO `mmm_region` VALUES ('190', '焦作市', '15', '2', '0', '0', 'J', 'JZS', null);
INSERT INTO `mmm_region` VALUES ('191', '许昌市', '15', '2', '0', '0', 'X', 'XCS', null);
INSERT INTO `mmm_region` VALUES ('192', '郑州市', '15', '2', '0', '0', 'Z', 'ZZS', null);
INSERT INTO `mmm_region` VALUES ('193', '驻马店市', '15', '2', '0', '0', 'Z', 'ZMDS', null);
INSERT INTO `mmm_region` VALUES ('194', '鹤壁市', '15', '2', '0', '0', 'H', 'HBS', null);
INSERT INTO `mmm_region` VALUES ('195', '山南地区', '16', '2', '0', '0', 'S', 'SNDQ', null);
INSERT INTO `mmm_region` VALUES ('196', '拉萨市', '16', '2', '0', '0', 'L', 'LSS', null);
INSERT INTO `mmm_region` VALUES ('197', '日喀则地区', '16', '2', '0', '0', 'R', 'RKZDQ', null);
INSERT INTO `mmm_region` VALUES ('198', '昌都地区', '16', '2', '0', '0', 'C', 'CDDQ', null);
INSERT INTO `mmm_region` VALUES ('199', '林芝地区', '16', '2', '0', '0', 'L', 'LZDQ', null);
INSERT INTO `mmm_region` VALUES ('200', '那曲地区', '16', '2', '0', '0', 'N', 'NQDQ', null);
INSERT INTO `mmm_region` VALUES ('201', '阿里地区', '16', '2', '0', '0', 'A', 'ALDQ', null);
INSERT INTO `mmm_region` VALUES ('202', '天津市', '17', '2', '0', '0', 'T', 'TJS', null);
INSERT INTO `mmm_region` VALUES ('203', '北京市', '18', '2', '0', '0', 'B', 'BJS', null);
INSERT INTO `mmm_region` VALUES ('204', '临沧市', '19', '2', '0', '0', 'L', 'LCS', null);
INSERT INTO `mmm_region` VALUES ('205', '丽江市', '19', '2', '0', '0', 'L', 'LJS', null);
INSERT INTO `mmm_region` VALUES ('206', '保山市', '19', '2', '0', '0', 'B', 'BSS', null);
INSERT INTO `mmm_region` VALUES ('207', '大理白族自治州', '19', '2', '0', '0', 'D', 'DLBZZZZ', null);
INSERT INTO `mmm_region` VALUES ('208', '德宏傣族景颇族自治州', '19', '2', '0', '0', 'D', 'DHDZJPZZZZ', null);
INSERT INTO `mmm_region` VALUES ('209', '怒江傈僳族自治州', '19', '2', '0', '0', 'N', 'NJLSZZZZ', null);
INSERT INTO `mmm_region` VALUES ('210', '文山壮族苗族自治州', '19', '2', '0', '0', 'W', 'WSZZMZZZZ', null);
INSERT INTO `mmm_region` VALUES ('211', '昆明市', '19', '2', '0', '0', 'K', 'KMS', null);
INSERT INTO `mmm_region` VALUES ('212', '昭通市', '19', '2', '0', '0', 'Z', 'ZTS', null);
INSERT INTO `mmm_region` VALUES ('213', '普洱市', '19', '2', '0', '0', 'P', 'PES', null);
INSERT INTO `mmm_region` VALUES ('214', '曲靖市', '19', '2', '0', '0', 'Q', 'QJS', null);
INSERT INTO `mmm_region` VALUES ('215', '楚雄彝族自治州', '19', '2', '0', '0', 'C', 'CXYZZZZ', null);
INSERT INTO `mmm_region` VALUES ('216', '玉溪市', '19', '2', '0', '0', 'Y', 'YXS', null);
INSERT INTO `mmm_region` VALUES ('217', '红河哈尼族彝族自治州', '19', '2', '0', '0', 'H', 'HHHNZYZZZZ', null);
INSERT INTO `mmm_region` VALUES ('218', '西双版纳傣族自治州', '19', '2', '0', '0', 'X', 'XSBNDZZZZ', null);
INSERT INTO `mmm_region` VALUES ('219', '迪庆藏族自治州', '19', '2', '0', '0', 'D', 'DQZZZZZ', null);
INSERT INTO `mmm_region` VALUES ('220', '香港特别行政区', '20', '2', '0', '0', 'X', 'XGTBXZQ', null);
INSERT INTO `mmm_region` VALUES ('221', '乌兰察布市', '21', '2', '0', '0', 'W', 'WLCBS', null);
INSERT INTO `mmm_region` VALUES ('222', '乌海市', '21', '2', '0', '0', 'W', 'WHS', null);
INSERT INTO `mmm_region` VALUES ('223', '兴安盟', '21', '2', '0', '0', 'X', 'XAM', null);
INSERT INTO `mmm_region` VALUES ('224', '包头市', '21', '2', '0', '0', 'B', 'BTS', null);
INSERT INTO `mmm_region` VALUES ('225', '呼伦贝尔市', '21', '2', '0', '0', 'H', 'HLBES', null);
INSERT INTO `mmm_region` VALUES ('226', '呼和浩特市', '21', '2', '0', '0', 'H', 'HHHTS', null);
INSERT INTO `mmm_region` VALUES ('227', '巴彦淖尔市', '21', '2', '0', '0', 'B', 'BYNES', null);
INSERT INTO `mmm_region` VALUES ('228', '赤峰市', '21', '2', '0', '0', 'C', 'CFS', null);
INSERT INTO `mmm_region` VALUES ('229', '通辽市', '21', '2', '0', '0', 'T', 'TLS', null);
INSERT INTO `mmm_region` VALUES ('230', '鄂尔多斯市', '21', '2', '0', '0', 'E', 'EEDSS', null);
INSERT INTO `mmm_region` VALUES ('231', '锡林郭勒盟', '21', '2', '0', '0', 'X', 'XLGLM', null);
INSERT INTO `mmm_region` VALUES ('232', '阿拉善盟', '21', '2', '0', '0', 'A', 'ALSM', null);
INSERT INTO `mmm_region` VALUES ('233', '东莞市', '22', '2', '0', '0', 'D', 'DGS', null);
INSERT INTO `mmm_region` VALUES ('234', '中山市', '22', '2', '0', '0', 'Z', 'ZSS', null);
INSERT INTO `mmm_region` VALUES ('235', '云浮市', '22', '2', '0', '0', 'Y', 'YFS', null);
INSERT INTO `mmm_region` VALUES ('236', '佛山市', '22', '2', '0', '0', 'F', 'FSS', null);
INSERT INTO `mmm_region` VALUES ('237', '广州市', '22', '2', '0', '0', 'G', 'GZS', null);
INSERT INTO `mmm_region` VALUES ('238', '惠州市', '22', '2', '0', '0', 'H', 'HZS', null);
INSERT INTO `mmm_region` VALUES ('239', '揭阳市', '22', '2', '0', '0', 'J', 'JYS', null);
INSERT INTO `mmm_region` VALUES ('240', '梅州市', '22', '2', '0', '0', 'M', 'MZS', null);
INSERT INTO `mmm_region` VALUES ('241', '汕头市', '22', '2', '0', '0', 'S', 'STS', null);
INSERT INTO `mmm_region` VALUES ('242', '汕尾市', '22', '2', '0', '0', 'S', 'SWS', null);
INSERT INTO `mmm_region` VALUES ('243', '江门市', '22', '2', '0', '0', 'J', 'JMS', null);
INSERT INTO `mmm_region` VALUES ('244', '河源市', '22', '2', '0', '0', 'H', 'HYS', null);
INSERT INTO `mmm_region` VALUES ('245', '深圳市', '22', '2', '0', '0', 'S', 'SZS', null);
INSERT INTO `mmm_region` VALUES ('246', '清远市', '22', '2', '0', '0', 'Q', 'QYS', null);
INSERT INTO `mmm_region` VALUES ('247', '湛江市', '22', '2', '0', '0', 'Z', 'ZJS', null);
INSERT INTO `mmm_region` VALUES ('248', '潮州市', '22', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('249', '珠海市', '22', '2', '0', '0', 'Z', 'ZHS', null);
INSERT INTO `mmm_region` VALUES ('250', '肇庆市', '22', '2', '0', '0', 'Z', 'ZQS', null);
INSERT INTO `mmm_region` VALUES ('251', '茂名市', '22', '2', '0', '0', 'M', 'MMS', null);
INSERT INTO `mmm_region` VALUES ('252', '阳江市', '22', '2', '0', '0', 'Y', 'YJS', null);
INSERT INTO `mmm_region` VALUES ('253', '韶关市', '22', '2', '0', '0', 'S', 'SGS', null);
INSERT INTO `mmm_region` VALUES ('254', '上饶市', '23', '2', '0', '0', 'S', 'SRS', null);
INSERT INTO `mmm_region` VALUES ('255', '九江市', '23', '2', '0', '0', 'J', 'JJS', null);
INSERT INTO `mmm_region` VALUES ('256', '南昌市', '23', '2', '0', '0', 'N', 'NCS', null);
INSERT INTO `mmm_region` VALUES ('257', '吉安市', '23', '2', '0', '0', 'J', 'JAS', null);
INSERT INTO `mmm_region` VALUES ('258', '宜春市', '23', '2', '0', '0', 'Y', 'YCS', null);
INSERT INTO `mmm_region` VALUES ('259', '抚州市', '23', '2', '0', '0', 'F', 'FZS', null);
INSERT INTO `mmm_region` VALUES ('260', '新余市', '23', '2', '0', '0', 'X', 'XYS', null);
INSERT INTO `mmm_region` VALUES ('261', '景德镇市', '23', '2', '0', '0', 'J', 'JDZS', null);
INSERT INTO `mmm_region` VALUES ('262', '萍乡市', '23', '2', '0', '0', 'P', 'PXS', null);
INSERT INTO `mmm_region` VALUES ('263', '赣州市', '23', '2', '0', '0', 'G', 'GZS', null);
INSERT INTO `mmm_region` VALUES ('264', '鹰潭市', '23', '2', '0', '0', 'Y', 'YTS', null);
INSERT INTO `mmm_region` VALUES ('265', '重庆市', '24', '2', '0', '0', 'C', 'CQS', null);
INSERT INTO `mmm_region` VALUES ('266', '仙桃市', '25', '2', '0', '0', 'X', 'XTS', null);
INSERT INTO `mmm_region` VALUES ('267', '十堰市', '25', '2', '0', '0', 'S', 'SYS', null);
INSERT INTO `mmm_region` VALUES ('268', '咸宁市', '25', '2', '0', '0', 'X', 'XNS', null);
INSERT INTO `mmm_region` VALUES ('269', '天门市', '25', '2', '0', '0', 'T', 'TMS', null);
INSERT INTO `mmm_region` VALUES ('270', '孝感市', '25', '2', '0', '0', 'X', 'XGS', null);
INSERT INTO `mmm_region` VALUES ('271', '宜昌市', '25', '2', '0', '0', 'Y', 'YCS', null);
INSERT INTO `mmm_region` VALUES ('272', '恩施土家族苗族自治州', '25', '2', '0', '0', 'E', 'ESTJZMZZZZ', null);
INSERT INTO `mmm_region` VALUES ('273', '武汉市', '25', '2', '0', '0', 'W', 'WHS', null);
INSERT INTO `mmm_region` VALUES ('274', '潜江市', '25', '2', '0', '0', 'Q', 'QJS', null);
INSERT INTO `mmm_region` VALUES ('275', '神农架林区', '25', '2', '0', '0', 'S', 'SNJLQ', null);
INSERT INTO `mmm_region` VALUES ('276', '荆州市', '25', '2', '0', '0', 'J', 'JZS', null);
INSERT INTO `mmm_region` VALUES ('277', '荆门市', '25', '2', '0', '0', 'J', 'JMS', null);
INSERT INTO `mmm_region` VALUES ('278', '襄阳市', '25', '2', '0', '0', 'X', 'XYS', null);
INSERT INTO `mmm_region` VALUES ('279', '鄂州市', '25', '2', '0', '0', 'E', 'EZS', null);
INSERT INTO `mmm_region` VALUES ('280', '随州市', '25', '2', '0', '0', 'S', 'SZS', null);
INSERT INTO `mmm_region` VALUES ('281', '黄冈市', '25', '2', '0', '0', 'H', 'HGS', null);
INSERT INTO `mmm_region` VALUES ('282', '黄石市', '25', '2', '0', '0', 'H', 'HSS', null);
INSERT INTO `mmm_region` VALUES ('283', '亳州市', '26', '2', '0', '0', 'B', 'BZS', null);
INSERT INTO `mmm_region` VALUES ('284', '六安市', '26', '2', '0', '0', 'L', 'LAS', null);
INSERT INTO `mmm_region` VALUES ('285', '合肥市', '26', '2', '0', '0', 'H', 'HFS', null);
INSERT INTO `mmm_region` VALUES ('286', '安庆市', '26', '2', '0', '0', 'A', 'AQS', null);
INSERT INTO `mmm_region` VALUES ('287', '宣城市', '26', '2', '0', '0', 'X', 'XCS', null);
INSERT INTO `mmm_region` VALUES ('288', '宿州市', '26', '2', '0', '0', 'S', 'SZS', null);
INSERT INTO `mmm_region` VALUES ('289', '巢湖市', '26', '2', '0', '0', 'C', 'CHS', null);
INSERT INTO `mmm_region` VALUES ('290', '池州市', '26', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('291', '淮北市', '26', '2', '0', '0', 'H', 'HBS', null);
INSERT INTO `mmm_region` VALUES ('292', '淮南市', '26', '2', '0', '0', 'H', 'HNS', null);
INSERT INTO `mmm_region` VALUES ('293', '滁州市', '26', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('294', '芜湖市', '26', '2', '0', '0', 'W', 'WHS', null);
INSERT INTO `mmm_region` VALUES ('295', '蚌埠市', '26', '2', '0', '0', 'B', 'BBS', null);
INSERT INTO `mmm_region` VALUES ('296', '铜陵市', '26', '2', '0', '0', 'T', 'TLS', null);
INSERT INTO `mmm_region` VALUES ('297', '阜阳市', '26', '2', '0', '0', 'F', 'FYS', null);
INSERT INTO `mmm_region` VALUES ('298', '马鞍山市', '26', '2', '0', '0', 'M', 'MASS', null);
INSERT INTO `mmm_region` VALUES ('299', '黄山市', '26', '2', '0', '0', 'H', 'HSS', null);
INSERT INTO `mmm_region` VALUES ('300', '丹东市', '27', '2', '0', '0', 'D', 'DDS', null);
INSERT INTO `mmm_region` VALUES ('301', '大连市', '27', '2', '0', '0', 'D', 'DLS', null);
INSERT INTO `mmm_region` VALUES ('302', '抚顺市', '27', '2', '0', '0', 'F', 'FSS', null);
INSERT INTO `mmm_region` VALUES ('303', '朝阳市', '27', '2', '0', '0', 'C', 'CYS', null);
INSERT INTO `mmm_region` VALUES ('304', '本溪市', '27', '2', '0', '0', 'B', 'BXS', null);
INSERT INTO `mmm_region` VALUES ('305', '沈阳市', '27', '2', '0', '0', 'S', 'SYS', null);
INSERT INTO `mmm_region` VALUES ('306', '盘锦市', '27', '2', '0', '0', 'P', 'PJS', null);
INSERT INTO `mmm_region` VALUES ('307', '营口市', '27', '2', '0', '0', 'Y', 'YKS', null);
INSERT INTO `mmm_region` VALUES ('308', '葫芦岛市', '27', '2', '0', '0', 'H', 'HLDS', null);
INSERT INTO `mmm_region` VALUES ('309', '辽阳市', '27', '2', '0', '0', 'L', 'LYS', null);
INSERT INTO `mmm_region` VALUES ('310', '铁岭市', '27', '2', '0', '0', 'T', 'TLS', null);
INSERT INTO `mmm_region` VALUES ('311', '锦州市', '27', '2', '0', '0', 'J', 'JZS', null);
INSERT INTO `mmm_region` VALUES ('312', '阜新市', '27', '2', '0', '0', 'F', 'FXS', null);
INSERT INTO `mmm_region` VALUES ('313', '鞍山市', '27', '2', '0', '0', 'A', 'ASS', null);
INSERT INTO `mmm_region` VALUES ('314', '临汾市', '28', '2', '0', '0', 'L', 'LFS', null);
INSERT INTO `mmm_region` VALUES ('315', '吕梁市', '28', '2', '0', '0', 'L', 'LLS', null);
INSERT INTO `mmm_region` VALUES ('316', '大同市', '28', '2', '0', '0', 'D', 'DTS', null);
INSERT INTO `mmm_region` VALUES ('317', '太原市', '28', '2', '0', '0', 'T', 'TYS', null);
INSERT INTO `mmm_region` VALUES ('318', '忻州市', '28', '2', '0', '0', 'X', 'XZS', null);
INSERT INTO `mmm_region` VALUES ('319', '晋中市', '28', '2', '0', '0', 'J', 'JZS', null);
INSERT INTO `mmm_region` VALUES ('320', '晋城市', '28', '2', '0', '0', 'J', 'JCS', null);
INSERT INTO `mmm_region` VALUES ('321', '朔州市', '28', '2', '0', '0', 'S', 'SZS', null);
INSERT INTO `mmm_region` VALUES ('322', '运城市', '28', '2', '0', '0', 'Y', 'YCS', null);
INSERT INTO `mmm_region` VALUES ('323', '长治市', '28', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('324', '阳泉市', '28', '2', '0', '0', 'Y', 'YQS', null);
INSERT INTO `mmm_region` VALUES ('325', '乌鲁木齐市', '29', '2', '0', '0', 'W', 'WLMQS', null);
INSERT INTO `mmm_region` VALUES ('326', '五家渠市', '29', '2', '0', '0', 'W', 'WJQS', null);
INSERT INTO `mmm_region` VALUES ('327', '伊犁哈萨克自治州', '29', '2', '0', '0', 'Y', 'YLHSKZZZ', null);
INSERT INTO `mmm_region` VALUES ('328', '克孜勒苏柯尔克孜自治州', '29', '2', '0', '0', 'K', 'KZLSKEKZZZZ', null);
INSERT INTO `mmm_region` VALUES ('329', '克拉玛依市', '29', '2', '0', '0', 'K', 'KLMYS', null);
INSERT INTO `mmm_region` VALUES ('330', '博尔塔拉蒙古自治州', '29', '2', '0', '0', 'B', 'BETLMGZZZ', null);
INSERT INTO `mmm_region` VALUES ('331', '吐鲁番地区', '29', '2', '0', '0', 'T', 'TLFDQ', null);
INSERT INTO `mmm_region` VALUES ('332', '和田地区', '29', '2', '0', '0', 'H', 'HTDQ', null);
INSERT INTO `mmm_region` VALUES ('333', '哈密地区', '29', '2', '0', '0', 'H', 'HMDQ', null);
INSERT INTO `mmm_region` VALUES ('334', '喀什地区', '29', '2', '0', '0', 'K', 'KSDQ', null);
INSERT INTO `mmm_region` VALUES ('335', '图木舒克市', '29', '2', '0', '0', 'T', 'TMSKS', null);
INSERT INTO `mmm_region` VALUES ('336', '塔城地区', '29', '2', '0', '0', 'T', 'TCDQ', null);
INSERT INTO `mmm_region` VALUES ('337', '巴音郭楞蒙古自治州', '29', '2', '0', '0', 'B', 'BYGLMGZZZ', null);
INSERT INTO `mmm_region` VALUES ('338', '昌吉回族自治州', '29', '2', '0', '0', 'C', 'CJHZZZZ', null);
INSERT INTO `mmm_region` VALUES ('339', '石河子市', '29', '2', '0', '0', 'S', 'SHZS', null);
INSERT INTO `mmm_region` VALUES ('340', '阿克苏地区', '29', '2', '0', '0', 'A', 'AKSDQ', null);
INSERT INTO `mmm_region` VALUES ('341', '阿勒泰地区', '29', '2', '0', '0', 'A', 'ALTDQ', null);
INSERT INTO `mmm_region` VALUES ('342', '阿拉尔市', '29', '2', '0', '0', 'A', 'ALES', null);
INSERT INTO `mmm_region` VALUES ('343', '南京市', '30', '2', '0', '0', 'N', 'NJS', null);
INSERT INTO `mmm_region` VALUES ('344', '南通市', '30', '2', '0', '0', 'N', 'NTS', null);
INSERT INTO `mmm_region` VALUES ('345', '宿迁市', '30', '2', '0', '0', 'S', 'SQS', null);
INSERT INTO `mmm_region` VALUES ('346', '常州市', '30', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('347', '徐州市', '30', '2', '0', '0', 'X', 'XZS', null);
INSERT INTO `mmm_region` VALUES ('348', '扬州市', '30', '2', '0', '0', 'Y', 'YZS', null);
INSERT INTO `mmm_region` VALUES ('349', '无锡市', '30', '2', '0', '0', 'W', 'WXS', null);
INSERT INTO `mmm_region` VALUES ('350', '泰州市', '30', '2', '0', '0', 'T', 'TZS', null);
INSERT INTO `mmm_region` VALUES ('351', '淮安市', '30', '2', '0', '0', 'H', 'HAS', null);
INSERT INTO `mmm_region` VALUES ('352', '盐城市', '30', '2', '0', '0', 'Y', 'YCS', null);
INSERT INTO `mmm_region` VALUES ('353', '苏州市', '30', '2', '0', '0', 'S', 'SZS', null);
INSERT INTO `mmm_region` VALUES ('354', '连云港市', '30', '2', '0', '0', 'L', 'LYGS', null);
INSERT INTO `mmm_region` VALUES ('355', '镇江市', '30', '2', '0', '0', 'Z', 'ZJS', null);
INSERT INTO `mmm_region` VALUES ('356', '北海市', '31', '2', '0', '0', 'B', 'BHS', null);
INSERT INTO `mmm_region` VALUES ('357', '南宁市', '31', '2', '0', '0', 'N', 'NCS', null);
INSERT INTO `mmm_region` VALUES ('358', '崇左市', '31', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('359', '来宾市', '31', '2', '0', '0', 'L', 'LBS', null);
INSERT INTO `mmm_region` VALUES ('360', '柳州市', '31', '2', '0', '0', 'L', 'LZS', null);
INSERT INTO `mmm_region` VALUES ('361', '桂林市', '31', '2', '0', '0', 'G', 'GLS', null);
INSERT INTO `mmm_region` VALUES ('362', '梧州市', '31', '2', '0', '0', 'W', 'WZS', null);
INSERT INTO `mmm_region` VALUES ('363', '河池市', '31', '2', '0', '0', 'H', 'HCS', null);
INSERT INTO `mmm_region` VALUES ('364', '玉林市', '31', '2', '0', '0', 'Y', 'YLS', null);
INSERT INTO `mmm_region` VALUES ('365', '百色市', '31', '2', '0', '0', 'B', 'BSS', null);
INSERT INTO `mmm_region` VALUES ('366', '贵港市', '31', '2', '0', '0', 'G', 'GGS', null);
INSERT INTO `mmm_region` VALUES ('367', '贺州市', '31', '2', '0', '0', 'H', 'HZS', null);
INSERT INTO `mmm_region` VALUES ('368', '钦州市', '31', '2', '0', '0', 'Q', 'QZS', null);
INSERT INTO `mmm_region` VALUES ('369', '防城港市', '31', '2', '0', '0', 'F', 'FCGS', null);
INSERT INTO `mmm_region` VALUES ('370', '保定市', '32', '2', '0', '0', 'B', 'BDS', null);
INSERT INTO `mmm_region` VALUES ('371', '唐山市', '32', '2', '0', '0', 'T', 'TSS', null);
INSERT INTO `mmm_region` VALUES ('372', '廊坊市', '32', '2', '0', '0', 'L', 'LFS', null);
INSERT INTO `mmm_region` VALUES ('373', '张家口市', '32', '2', '0', '0', 'Z', 'ZJKS', null);
INSERT INTO `mmm_region` VALUES ('374', '承德市', '32', '2', '0', '0', 'C', 'CDS', null);
INSERT INTO `mmm_region` VALUES ('375', '沧州市', '32', '2', '0', '0', 'C', 'CZS', null);
INSERT INTO `mmm_region` VALUES ('376', '石家庄市', '32', '2', '0', '0', 'S', 'SJZS', null);
INSERT INTO `mmm_region` VALUES ('377', '秦皇岛市', '32', '2', '0', '0', 'Q', 'QHDS', null);
INSERT INTO `mmm_region` VALUES ('378', '衡水市', '32', '2', '0', '0', 'H', 'HSS', null);
INSERT INTO `mmm_region` VALUES ('379', '邢台市', '32', '2', '0', '0', 'X', 'XTS', null);
INSERT INTO `mmm_region` VALUES ('380', '邯郸市', '32', '2', '0', '0', 'H', 'HDS', null);
INSERT INTO `mmm_region` VALUES ('381', '万宁市', '33', '2', '0', '0', 'W', 'WNS', null);
INSERT INTO `mmm_region` VALUES ('382', '三亚市', '33', '2', '0', '0', 'S', 'SYS', null);
INSERT INTO `mmm_region` VALUES ('383', '东方市', '33', '2', '0', '0', 'D', 'DFS', null);
INSERT INTO `mmm_region` VALUES ('384', '临高县', '33', '2', '0', '0', 'L', 'LGX', null);
INSERT INTO `mmm_region` VALUES ('385', '乐东黎族自治县', '33', '2', '0', '0', 'L', 'LDLZZZX', null);
INSERT INTO `mmm_region` VALUES ('386', '五指山市', '33', '2', '0', '0', 'W', 'WZSS', null);
INSERT INTO `mmm_region` VALUES ('387', '保亭黎族苗族自治县', '33', '2', '0', '0', 'B', 'BTLZMZZZX', null);
INSERT INTO `mmm_region` VALUES ('388', '儋州市', '33', '2', '0', '0', 'D', 'DZS', null);
INSERT INTO `mmm_region` VALUES ('389', '定安县', '33', '2', '0', '0', 'D', 'DAX', null);
INSERT INTO `mmm_region` VALUES ('390', '屯昌县', '33', '2', '0', '0', 'T', 'TCX', null);
INSERT INTO `mmm_region` VALUES ('391', '文昌市', '33', '2', '0', '0', 'W', 'WCS', null);
INSERT INTO `mmm_region` VALUES ('392', '昌江黎族自治县', '33', '2', '0', '0', 'C', 'CJLZZZX', null);
INSERT INTO `mmm_region` VALUES ('393', '海口市', '33', '2', '0', '0', 'H', 'HKS', null);
INSERT INTO `mmm_region` VALUES ('394', '澄迈县', '33', '2', '0', '0', 'C', 'CMS', null);
INSERT INTO `mmm_region` VALUES ('395', '琼中黎族苗族自治县', '33', '2', '0', '0', 'Q', 'QZLZMZZZX', null);
INSERT INTO `mmm_region` VALUES ('396', '琼海市', '33', '2', '0', '0', 'Q', 'QHS', null);
INSERT INTO `mmm_region` VALUES ('397', '白沙黎族自治县', '33', '2', '0', '0', 'B', 'BSLZZZX', null);
INSERT INTO `mmm_region` VALUES ('398', '陵水黎族自治县', '33', '2', '0', '0', 'L', 'LSLZZZX', null);
INSERT INTO `mmm_region` VALUES ('399', '澳门特别行政区', '34', '2', '0', '0', 'A', 'AMTBXZQ', null);
INSERT INTO `mmm_region` VALUES ('401', '勃利县', '35', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('402', '桃山区', '35', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('403', '新兴区', '35', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('404', '茄子河区', '35', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('405', '嘉荫县', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('406', '伊春区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('407', '乌伊岭区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('408', '汤旺河区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('409', '新青区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('410', '红星区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('411', '五营区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('412', '上甘岭区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('413', '友好区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('414', '翠峦区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('415', '乌马河区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('416', '美溪区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('417', '西林区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('418', '金山屯区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('419', '南岔区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('420', '带岭区', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('421', '铁力市', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('422', '抚远县', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('423', '汤原县', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('424', '桦川县', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('425', '桦南县', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('426', '前进区', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('427', '同江市', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('428', '东风区', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('429', '向阳区', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('430', '郊区', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('431', '富锦市', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('432', '宝清县', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('433', '友谊县', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('434', '集贤县', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('435', '饶河县', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('436', '四方台区', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('437', '岭东区', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('438', '尖山区', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('439', '宝山区', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('440', '延寿县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('441', '道里区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('442', '通河县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('443', '巴彦县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('444', '依兰县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('445', '宾县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('446', '方正县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('447', '五常市', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('448', '双城市', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('449', '尚志市', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('450', '松北区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('451', '呼兰区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('452', '阿城区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('453', '道外区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('454', '太平区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('455', '香坊区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('456', '平房区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('457', '动力区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('458', '南岗区', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('459', '木兰县', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('460', '呼玛县', '40', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('461', '漠河县', '40', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('462', '塔河县', '40', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('463', '杜尔伯特', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('464', '林甸县', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('465', '肇源县', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('466', '肇州县', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('467', '萨尔图区', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('468', '让胡路区', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('469', '龙凤区', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('470', '红岗区', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('471', '大同区', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('472', '林口县', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('473', '东宁县', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('474', '穆棱市', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('475', '宁安市', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('476', '爱民区', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('477', '绥芬河市', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('478', '西安区', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('479', '阳明区', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('480', '东安区', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('481', '海林市', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('482', '绥棱县', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('483', '明水县', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('484', '庆安县', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('485', '青冈县', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('486', '北林区', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('487', '望奎县', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('488', '海伦市', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('489', '肇东市', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('490', '安达市', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('491', '兰西县', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('492', '鸡东县', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('493', '密山市', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('494', '虎林市', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('495', '鸡冠区', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('496', '滴道区', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('497', '城子河区', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('498', '恒山区', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('499', '梨树区', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('500', '绥滨县', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('501', '萝北县', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('502', '东山区', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('503', '兴山区', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('504', '兴安区', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('505', '南山区', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('506', '工农区', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('507', '向阳区', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('508', '孙吴县', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('509', '逊克县', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('510', '爱辉区', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('511', '北安市', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('512', '五大连池市', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('513', '嫩江县', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('514', '拜泉县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('515', '龙沙区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('516', '克山县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('517', '富裕县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('518', '甘南县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('519', '泰来县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('520', '依安县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('521', '龙江县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('522', '讷河市', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('523', '梅里斯达斡尔区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('524', '碾子山区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('525', '富拉尔基区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('526', '建华区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('527', '铁峰区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('528', '昂昂溪区', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('529', '克东县', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('530', '景宁', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('531', '庆元县', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('532', '云和县', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('533', '松阳县', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('534', '莲都区', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('535', '缙云县', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('536', '青田县', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('537', '龙泉市', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('538', '遂昌县', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('539', '仙居县', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('540', '天台县', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('541', '三门县', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('542', '玉环县', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('543', '椒江区', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('544', '温岭市', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('545', '路桥区', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('546', '黄岩区', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('547', '临海市', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('548', '海盐县', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('549', '桐乡市', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('550', '平湖市', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('551', '南湖区', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('552', '海宁市', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('553', '秀洲区', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('554', '嘉善县', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('555', '宁海县', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('556', '象山县', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('557', '奉化市', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('558', '慈溪市', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('559', '余姚市', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('560', '海曙区', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('561', '北仑区', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('562', '镇海区', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('563', '江北区', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('564', '江东区', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('565', '鄞州区', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('566', '淳安县', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('567', '桐庐县', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('568', '临安市', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('569', '富阳市', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('570', '建德市', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('571', '市郊', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('572', '西湖区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('573', '萧山区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('574', '江干区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('575', '滨江区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('576', '拱墅区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('577', '下城区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('578', '上城区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('579', '余杭区', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('580', '泰顺县', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('581', '文成县', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('582', '苍南县', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('583', '平阳县', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('584', '永嘉县', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('585', '鹿城区', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('586', '乐清市', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('587', '瑞安市', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('588', '瓯海区', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('589', '龙湾区', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('590', '洞头县', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('591', '安吉县', '54', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('592', '长兴县', '54', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('593', '吴兴区', '54', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('594', '南浔区', '54', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('595', '德清县', '54', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('596', '嵊州市', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('597', '上虞市', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('598', '绍兴县', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('599', '诸暨市', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('600', '新昌县', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('601', '越城区', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('602', '嵊泗县', '56', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('603', '定海区', '56', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('604', '普陀区', '56', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('605', '岱山县', '56', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('606', '龙游县', '57', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('607', '开化县', '57', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('608', '衢州市', '57', '3', '0', '0', 'Q', 'QZS', null);
INSERT INTO `mmm_region` VALUES ('609', '江山市', '57', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('610', '常山县', '57', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('611', '磐安县', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('612', '婺城区', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('613', '武义县', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('614', '永康市', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('615', '东阳市', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('616', '赤岸镇', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('617', '苏溪镇', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('618', '大陈镇', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('619', '义亭镇', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('620', '上溪镇', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('621', '佛堂镇', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('622', '市区', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('623', '兰溪市', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('624', '金东区', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('625', '浦江县', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('626', '广饶县', '59', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('627', '利津县', '59', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('628', '东营区', '59', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('629', '河口区', '59', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('630', '垦利县', '59', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('631', '临沭县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('632', '蒙阴县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('633', '莒南县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('634', '平邑县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('635', '费县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('636', '兰山区', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('637', '沂水县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('638', '郯城县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('639', '沂南县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('640', '河东区', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('641', '罗庄区', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('642', '苍山县', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('643', '环翠区', '61', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('644', '文登市', '61', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('645', '荣成市', '61', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('646', '乳山市', '61', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('647', '宁津县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('648', '禹城市', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('649', '乐陵市', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('650', '陵县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('651', '德城区', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('652', '武城县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('653', '夏津县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('654', '平原县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('655', '齐河县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('656', '临邑县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('657', '庆云县', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('658', '莒县', '63', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('659', '东港区', '63', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('660', '岚山区', '63', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('661', '五莲县', '63', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('662', '滕州市', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('663', '薛城区', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('664', '市中区', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('665', '峄城区', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('666', '山亭区', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('667', '台儿庄区', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('668', '东平县', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('669', '宁阳县', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('670', '泰山区', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('671', '新泰市', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('672', '岱岳区', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('673', '肥城市', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('674', '商河县', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('675', '济阳县', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('676', '平阴县', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('677', '章丘市', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('678', '市中区', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('679', '历城区', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('680', '槐荫区', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('681', '天桥区', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('682', '历下区', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('683', '长清区', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('684', '梁山县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('685', '泗水县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('686', '汶上县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('687', '嘉祥县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('688', '金乡县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('689', '市中区', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('690', '微山县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('691', '邹城市', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('692', '兖州市', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('693', '曲阜市', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('694', '任城区', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('695', '鱼台县', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('696', '沂源县', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('697', '高青县', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('698', '桓台县', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('699', '张店区', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('700', '博山区', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('701', '淄川区', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('702', '临淄区', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('703', '周村区', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('704', '邹平县', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('705', '博兴县', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('706', '沾化县', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('707', '滨城区', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('708', '阳信县', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('709', '惠民县', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('710', '无棣县', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('711', '昌乐县', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('712', '临朐县', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('713', '昌邑市', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('714', '高密市', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('715', '安丘市', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('716', '潍城区', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('717', '诸城市', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('718', '青州市', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('719', '奎文区', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('720', '坊子区', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('721', '寒亭区', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('722', '寿光市', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('723', '长岛县', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('724', '海阳市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('725', '栖霞市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('726', '招远市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('727', '蓬莱市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('728', '莱州市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('729', '芝罘区', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('730', '龙口市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('731', '开发区', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('732', '莱山区', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('733', '牟平区', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('734', '福山区', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('735', '莱阳市', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('736', '高唐县', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('737', '冠县', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('738', '东阿县', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('739', '东昌府区', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('740', '莘县', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('741', '阳谷县', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('742', '临清市', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('743', '茌平县', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('744', '莱城区', '73', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('745', '钢城区', '73', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('746', '东明县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('747', '定陶县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('748', '鄄城县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('749', '郓城县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('750', '牡丹区', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('751', '成武县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('752', '单县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('753', '曹县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('754', '巨野县', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('755', '莱西市', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('756', '胶南市', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('757', '平度市', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('758', '即墨市', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('759', '胶州市', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('760', '市南区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('761', '黄岛区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('762', '李沧区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('763', '四方区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('764', '城阳区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('765', '市北区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('766', '崂山区', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('767', '新化县', '76', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('768', '双峰县', '76', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('769', '娄星区', '76', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('770', '冷水江市', '76', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('771', '涟源市', '76', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('772', '平江县', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('773', '湘阴县', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('774', '华容县', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('775', '岳阳县', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('776', '岳阳楼区', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('777', '汨罗市', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('778', '云溪区', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('779', '君山区', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('780', '临湘市', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('781', '石门县', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('782', '桃源县', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('783', '临澧县', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('784', '澧县', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('785', '武陵区', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('786', '安乡县', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('787', '津市市', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('788', '鼎城区', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('789', '汉寿县', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('790', '桑植县', '79', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('791', '永定区', '79', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('792', '武陵源区', '79', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('793', '慈利县', '79', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('794', '洪江市', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('795', '会同县', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('796', '中方县', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('797', '溆浦县', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('798', '辰溪县', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('799', '鹤城区', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('800', '芷江', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('801', '新晃', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('802', '通道', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('803', '麻阳', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('804', '靖州', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('805', '沅陵县', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('806', '炎陵县', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('807', '茶陵县', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('808', '攸县', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('809', '株洲县', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('810', '天元区', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('811', '石峰区', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('812', '芦淞区', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('813', '荷塘区', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('814', '醴陵市', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('815', '新田县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('816', '蓝山县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('817', '宁远县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('818', '江永县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('819', '道县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('820', '江华', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('821', '东安县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('822', '祁阳县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('823', '零陵区', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('824', '冷水滩区', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('825', '双牌县', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('826', '湘潭县', '83', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('827', '韶山市', '83', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('828', '岳塘区', '83', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('829', '雨湖区', '83', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('830', '湘乡市', '83', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('831', '龙山县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('832', '永顺县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('833', '古丈县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('834', '吉首市', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('835', '花垣县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('836', '凤凰县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('837', '泸溪县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('838', '保靖县', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('839', '安化县', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('840', '桃江县', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('841', '赫山区', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('842', '沅江市', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('843', '资阳区', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('844', '南县', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('845', '祁东县', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('846', '衡东县', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('847', '衡山县', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('848', '衡南县', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('849', '衡阳县', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('850', '雁峰区', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('851', '耒阳市', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('852', '南岳区', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('853', '蒸湘区', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('854', '石鼓区', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('855', '珠晖区', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('856', '常宁市', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('857', '新宁县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('858', '绥宁县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('859', '洞口县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('860', '隆回县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('861', '邵阳县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('862', '城步', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('863', '邵东县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('864', '武冈市', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('865', '北塔区', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('866', '大祥区', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('867', '双清区', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('868', '新邵县', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('869', '桂阳县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('870', '资兴市', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('871', '苏仙区', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('872', '北湖区', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('873', '安仁县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('874', '宜章县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('875', '汝城县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('876', '临武县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('877', '嘉禾县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('878', '永兴县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('879', '桂东县', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('880', '宁乡县', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('881', '望城县', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('882', '长沙县', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('883', '浏阳市', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('884', '岳麓区', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('885', '雨花区', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('886', '开福区', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('887', '天心区', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('888', '芙蓉区', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('889', '开发区', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('890', '临夏市', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('891', '积石山', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('892', '东乡族自治县', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('893', '临夏县', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('894', '广河县', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('895', '永靖县', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('896', '康乐县', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('897', '和政县', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('898', '榆中县', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('899', '永登县', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('900', '红古区', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('901', '皋兰县', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('902', '西固区', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('903', '七里河区', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('904', '城关区', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('905', '安宁区', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('906', '嘉峪关市', '92', '3', '0', '0', 'J', 'JYGS', null);
INSERT INTO `mmm_region` VALUES ('907', '张家川', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('908', '武山县', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('909', '麦积区', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('910', '甘谷县', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('911', '清水县', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('912', '秦安县', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('913', '秦州区', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('914', '安定区', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('915', '安定区', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('916', '岷县', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('917', '临洮县', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('918', '渭源县', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('919', '通渭县', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('920', '陇西县', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('921', '漳县', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('922', '泾川县', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('923', '庄浪县', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('924', '崆峒区', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('925', '崇信县', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('926', '静宁县', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('927', '华亭县', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('928', '灵台县', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('929', '正宁县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('930', '镇原县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('931', '西峰区', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('932', '合水县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('933', '宁县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('934', '环县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('935', '华池县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('936', '庆城县', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('937', '甘州区', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('938', '肃南', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('939', '高台县', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('940', '民乐县', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('941', '临泽县', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('942', '山丹县', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('943', '凉州区', '98', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('944', '古浪县', '98', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('945', '民勤县', '98', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('946', '天祝', '98', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('947', '夏河县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('948', '碌曲县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('949', '玛曲县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('950', '合作市', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('951', '舟曲县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('952', '卓尼县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('953', '临潭县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('954', '迭部县', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('955', '靖远县', '100', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('956', '景泰县', '100', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('957', '会宁县', '100', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('958', '平川区', '100', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('959', '白银区', '100', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('960', '阿克塞', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('961', '肃北', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('962', '瓜州县', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('963', '金塔县', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('964', '敦煌市', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('965', '玉门市', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('966', '肃州区', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('967', '永昌县', '102', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('968', '金川区', '102', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('969', '武都区', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('970', '宕昌县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('971', '西和县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('972', '文县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('973', '两当县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('974', '礼县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('975', '康县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('976', '徽县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('977', '成县', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('978', '崇明县', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('979', '奉贤区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('980', '金山区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('981', '青浦区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('982', '宝山区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('983', '嘉定区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('984', '松江区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('985', '南汇区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('986', '黄浦区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('987', '虹口区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('988', '卢湾区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('989', '静安区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('990', '普陀区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('991', '杨浦区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('992', '浦东新区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('993', '徐汇区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('994', '闵行区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('995', '闸北区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('996', '长宁区', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('997', '澎湖县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('998', '花莲县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('999', '台东县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1000', '屏东县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1001', '云林县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1002', '南投县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1003', '彰化县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1004', '苗栗县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1005', '桃园县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1006', '宜兰县', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1007', '嘉义', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1008', '新竹', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1009', '台南', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1010', '台中', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1011', '基隆', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1012', '高雄', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1013', '台北', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1014', '永吉县', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1015', '磐石市', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1016', '舒兰市', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1017', '桦甸市', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1018', '蛟河市', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1019', '丰满区', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1020', '龙潭区', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1021', '昌邑区', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1022', '船营区', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1023', '梨树县', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1024', '双辽市', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1025', '公主岭市', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1026', '伊通', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1027', '铁东区', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1028', '铁西区', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1029', '汪清县', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1030', '安图县', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1031', '和龙市', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1032', '龙井市', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1033', '珲春市', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1034', '敦化市', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1035', '图们市', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1036', '延吉市', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1037', '扶余县', '109', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1038', '乾安县', '109', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1039', '长岭县', '109', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1040', '宁江区', '109', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1041', '前郭尔罗斯', '109', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1042', '通榆县', '110', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1043', '镇赉县', '110', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1044', '大安市', '110', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1045', '洮南市', '110', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1046', '洮北区', '110', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1047', '靖宇县', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1048', '抚松县', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1049', '临江市', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1050', '长白', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1051', '八道江区', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1052', '江源区', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1053', '西安区', '112', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1054', '龙山区', '112', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1055', '东辽县', '112', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1056', '东丰县', '112', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1057', '柳河县', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1058', '辉南县', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1059', '通化县', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1060', '集安市', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1061', '梅河口市', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1062', '二道江区', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1063', '东昌区', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1064', '农安县', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1065', '榆树市', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1066', '九台市', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1067', '德惠市', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1068', '汽车产业开发区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1069', '经济技术开发区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1070', '高新技术开发区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1071', '净月潭开发区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1072', '双阳区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1073', '绿园区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1074', '南关区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1075', '二道区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1076', '宽城区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1077', '朝阳区', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1078', '建宁县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1079', '泰宁县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1080', '将乐县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1081', '沙县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1082', '尤溪县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1083', '大田县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1084', '宁化县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1085', '清流县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1086', '明溪县', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1087', '永安市', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1088', '三元区', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1089', '梅列区', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1090', '政和县', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1091', '松溪县', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1092', '光泽县', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1093', '浦城县', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1094', '顺昌县', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1095', '建阳市', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1096', '建瓯市', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1097', '武夷山市', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1098', '邵武市', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1099', '延平区', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1100', '翔安区', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1101', '同安区', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1102', '集美区', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1103', '湖里区', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1104', '海沧区', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1105', '思明区', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1106', '柘荣县', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1107', '周宁县', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1108', '寿宁县', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1109', '屏南县', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1110', '古田县', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1111', '霞浦县', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1112', '福鼎市', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1113', '福安市', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1114', '蕉城区', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1115', '金门县', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1116', '德化县', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1117', '永春县', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1118', '安溪县', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1119', '惠安县', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1120', '南安市', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1121', '晋江市', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1122', '石狮市', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1123', '泉港区', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1124', '清濛开发区', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1125', '洛江区', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1126', '丰泽区', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1127', '鲤城区', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1128', '漳浦县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1129', '云霄县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1130', '龙海市', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1131', '龙文区', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1132', '芗城区', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1133', '华安县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1134', '平和县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1135', '南靖县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1136', '东山县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1137', '长泰县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1138', '诏安县', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1139', '平潭县', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1140', '永泰县', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1141', '闽清县', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1142', '罗源县', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1143', '连江县', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1144', '闽侯县', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1145', '长乐市', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1146', '福清市', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1147', '晋安区', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1148', '马尾区', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1149', '仓山区', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1150', '台江区', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1151', '鼓楼区', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1152', '仙游县', '122', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1153', '秀屿区', '122', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1154', '荔城区', '122', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1155', '涵江区', '122', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1156', '城厢区', '122', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1157', '长汀县', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1158', '漳平市', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1159', '新罗区', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1160', '连城县', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1161', '武平县', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1162', '上杭县', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1163', '永定县', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1164', '中宁县', '124', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1165', '海原县', '124', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1166', '沙坡头区', '124', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1167', '同心县', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1168', '盐池县', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1169', '中宁县', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1170', '青铜峡市', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1171', '中卫县', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1172', '利通区', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1173', '彭阳县', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1174', '泾源县', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1175', '隆德县', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1176', '西吉县', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1177', '海原县', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1178', '原州区', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1179', '平罗县', '127', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1180', '陶乐县', '127', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1181', '惠农区', '127', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1182', '大武口区', '127', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1183', '惠农县', '127', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1184', '贺兰县', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1185', '永宁县', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1186', '灵武市', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1187', '兴庆区', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1188', '金凤区', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1189', '西夏区', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1190', '盘县', '129', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1191', '水城县', '129', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1192', '六枝特区', '129', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1193', '钟山区', '129', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1194', '普定县', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1195', '平坝县', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1196', '紫云', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1197', '镇宁', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1198', '关岭', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1199', '西秀区', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1200', '威宁', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1201', '赫章县', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1202', '纳雍县', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1203', '织金县', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1204', '金沙县', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1205', '黔西县', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1206', '大方县', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1207', '毕节市', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1208', '息烽县', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1209', '修文县', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1210', '开阳县', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1211', '清镇市', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1212', '新天园区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1213', '金阳新区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1214', '小河区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1215', '白云区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1216', '乌当区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1217', '花溪区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1218', '云岩区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1219', '南明区', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1220', '务川', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1221', '道真', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1222', '习水县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1223', '余庆县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1224', '湄潭县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1225', '凤冈县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1226', '正安县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1227', '绥阳县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1228', '桐梓县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1229', '遵义县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1230', '仁怀市', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1231', '赤水市', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1232', '汇川区', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1233', '道真县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1234', '务川县', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1235', '红花岗区', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1236', '万山特区', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1237', '松桃', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1238', '沿河', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1239', '印江', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1240', '玉屏', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1241', '德江县', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1242', '思南县', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1243', '石阡县', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1244', '江口县', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1245', '铜仁市', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1246', '台江县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1247', '剑河县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1248', '锦屏县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1249', '天柱县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1250', '岑巩县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1251', '镇远县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1252', '三穗县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1253', '施秉县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1254', '黄平县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1255', '凯里市', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1256', '丹寨县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1257', '麻江县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1258', '雷山县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1259', '从江县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1260', '榕江县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1261', '黎平县', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1262', '三都', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1263', '惠水县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1264', '龙里县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1265', '长顺县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1266', '罗甸县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1267', '平塘县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1268', '独山县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1269', '瓮安县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1270', '贵定县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1271', '荔波县', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1272', '福泉市', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1273', '都匀市', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1274', '安龙县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1275', '册亨县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1276', '望谟县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1277', '贞丰县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1278', '晴隆县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1279', '普安县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1280', '兴仁县', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1281', '兴义市', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1282', '马边', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1283', '峨边', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1284', '沐川县', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1285', '夹江县', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1286', '井研县', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1287', '犍为县', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1288', '乐山市', '138', '3', '0', '0', 'L', 'LSS', null);
INSERT INTO `mmm_region` VALUES ('1289', '峨眉山市', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1290', '隆昌县', '139', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1291', '资中县', '139', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1292', '威远县', '139', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1293', '东兴区', '139', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1294', '市中区', '139', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1295', '木里', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1296', '雷波县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1297', '美姑县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1298', '甘洛县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1299', '越西县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1300', '冕宁县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1301', '喜德县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1302', '昭觉县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1303', '金阳县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1304', '布拖县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1305', '普格县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1306', '宁南县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1307', '会东县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1308', '会理县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1309', '德昌县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1310', '盐源县', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1311', '西昌市', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1312', '西充县', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1313', '嘉陵区', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1314', '高坪区', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1315', '顺庆区', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1316', '仪陇县', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1317', '蓬安县', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1318', '营山县', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1319', '南部县', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1320', '阆中市', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1321', '屏山县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1322', '兴文县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1323', '筠连县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1324', '珙县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1325', '高县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1326', '长宁县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1327', '江安县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1328', '南溪县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1329', '宜宾县', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1330', '翠屏区', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1331', '平昌县', '143', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1332', '南江县', '143', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1333', '通江县', '143', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1334', '巴州区', '143', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1335', '朝天区', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1336', '元坝区', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1337', '利州区', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1338', '苍溪县', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1339', '剑阁县', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1340', '青川县', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1341', '旺苍县', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1342', '邻水县', '145', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1343', '武胜县', '145', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1344', '岳池县', '145', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1345', '华蓥市', '145', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1346', '广安区', '145', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1347', '中江县', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1348', '罗江县', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1349', '绵竹市', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1350', '什邡市', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1351', '广汉市', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1352', '旌阳区', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1353', '新津县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1354', '蒲江县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1355', '大邑县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1356', '郫县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1357', '双流县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1358', '金堂县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1359', '崇州市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1360', '邛崃市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1361', '彭州市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1362', '都江堰市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1363', '新津县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1364', '蒲江县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1365', '大邑县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1366', '郫县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1367', '双流县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1368', '金堂县', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1369', '崇州市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1370', '邛崃市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1371', '彭州市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1372', '都江堰市', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1373', '高新西区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1374', '高新区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1375', '温江区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1376', '新都区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1377', '青白江区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1378', '龙泉驿区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1379', '成华区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1380', '武侯区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1381', '金牛区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1382', '锦江区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1383', '青羊区', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1384', '盐边县', '148', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1385', '米易县', '148', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1386', '仁和区', '148', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1387', '西  区', '148', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1388', '东  区', '148', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1389', '古蔺县', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1390', '叙永县', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1391', '合江县', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1392', '泸县', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1393', '龙马潭区', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1394', '纳溪区', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1395', '江阳区', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1396', '得荣县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1397', '巴塘县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1398', '色达县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1399', '稻城县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1400', '石渠县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1401', '乡城县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1402', '德格县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1403', '理塘县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1404', '白玉县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1405', '道孚县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1406', '新龙县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1407', '雅江县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1408', '甘孜县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1409', '九龙县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1410', '炉霍县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1411', '泸定县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1412', '丹巴县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1413', '康定县', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1414', '青神县', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1415', '丹棱县', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1416', '洪雅县', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1417', '彭山县', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1418', '仁寿县', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1419', '东坡区', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1420', '安县', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1421', '平武县', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1422', '三台县', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1423', '盐亭县', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1424', '江油市', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1425', '游仙区', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1426', '涪城区', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1427', '北川县', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1428', '梓潼县', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1429', '富顺县', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1430', '荣县', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1431', '沿滩区', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1432', '贡井区', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1433', '自流井区', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1434', '大安区', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1435', '乐至县', '154', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1436', '安岳县', '154', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1437', '简阳市', '154', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1438', '雁江区', '154', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1439', '渠县', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1440', '大竹县', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1441', '开江县', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1442', '宣汉县', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1443', '达县', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1444', '万源市', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1445', '通川区', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1446', '大英县', '156', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1447', '射洪县', '156', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1448', '蓬溪县', '156', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1449', '安居区', '156', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1450', '船山区', '156', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1451', '红原县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1452', '若尔盖县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1453', '阿坝县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1454', '壤塘县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1455', '黑水县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1456', '小金县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1457', '金川县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1458', '九寨沟县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1459', '松潘县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1460', '茂县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1461', '理县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1462', '汶川县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1463', '马尔康县', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1464', '名山县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1465', '雨城区', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1466', '宝兴县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1467', '芦山县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1468', '天全县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1469', '石棉县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1470', '汉源县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1471', '荥经县', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1472', '玛多县', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1473', '久治县', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1474', '达日县', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1475', '甘德县', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1476', '班玛县', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1477', '玛沁县', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1478', '循化', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1479', '化隆', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1480', '互助', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1481', '民和', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1482', '乐都县', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1483', '平安县', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1484', '门源', '161', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1485', '刚察县', '161', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1486', '祁连县', '161', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1487', '海晏县', '161', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1488', '贵南县', '162', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1489', '兴海县', '162', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1490', '贵德县', '162', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1491', '同德县', '162', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1492', '共和县', '162', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1493', '天峻县', '163', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1494', '都兰县', '163', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1495', '乌兰县', '163', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1496', '格尔木市', '163', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1497', '德令哈市', '163', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1498', '曲麻莱县', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1499', '囊谦县', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1500', '治多县', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1501', '称多县', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1502', '杂多县', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1503', '玉树县', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1504', '大通', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1505', '湟源县', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1506', '湟中县', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1507', '城北区', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1508', '城西区', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1509', '城东区', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1510', '城中区', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1511', '河南蒙古族自治县', '166', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1512', '泽库县', '166', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1513', '尖扎县', '166', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1514', '同仁县', '166', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1515', '武功县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1516', '淳化县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1517', '旬邑县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1518', '长武县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1519', '彬县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1520', '永寿县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1521', '礼泉县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1522', '乾县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1523', '泾阳县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1524', '三原县', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1525', '兴平市', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1526', '杨陵区', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1527', '渭城区', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1528', '秦都区', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1529', '柞水县', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1530', '镇安县', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1531', '山阳县', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1532', '商南县', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1533', '丹凤县', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1534', '洛南县', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1535', '商州区', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1536', '白河县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1537', '旬阳县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1538', '镇坪县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1539', '平利县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1540', '岚皋县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1541', '紫阳县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1542', '宁陕县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1543', '石泉县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1544', '汉阴县', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1545', '汉滨区', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1546', '太白县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1547', '凤县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1548', '麟游县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1549', '千阳县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1550', '陇县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1551', '眉县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1552', '扶风县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1553', '岐山县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1554', '凤翔县', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1555', '金台区', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1556', '渭滨区', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1557', '陈仓区', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1558', '子长县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1559', '延川县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1560', '延长县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1561', '宝塔区', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1562', '吴起县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1563', '黄陵县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1564', '黄龙县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1565', '宜川县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1566', '洛川县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1567', '富县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1568', '甘泉县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1569', '志丹县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1570', '安塞县', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1571', '清涧县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1572', '吴堡县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1573', '佳县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1574', '米脂县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1575', '绥德县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1576', '定边县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1577', '靖边县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1578', '横山县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1579', '府谷县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1580', '神木县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1581', '榆阳区', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1582', '子洲县', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1583', '佛坪县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1584', '留坝县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1585', '镇巴县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1586', '略阳县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1587', '宁强县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1588', '勉县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1589', '西乡县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1590', '洋县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1591', '城固县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1592', '南郑县', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1593', '汉台区', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1594', '富平县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1595', '白水县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1596', '蒲城县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1597', '澄城县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1598', '合阳县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1599', '大荔县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1600', '潼关县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1601', '华县', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1602', '华阴市', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1603', '韩城市', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1604', '临渭区', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1605', '雁塔区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1606', '碑林区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1607', '新城区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1608', '莲湖区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1609', '高陵县', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1610', '户县', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1611', '周至县', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1612', '蓝田县', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1613', '长安区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1614', '临潼区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1615', '阎良区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1616', '未央区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1617', '灞桥区', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1618', '宜君县', '176', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1619', '印台区', '176', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1620', '王益区', '176', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1621', '耀州区', '176', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1622', '卢氏县', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1623', '陕县', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1624', '渑池县', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1625', '灵宝市', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1626', '义马市', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1627', '湖滨区', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1628', '平桥区', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1629', '浉河区', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1630', '息县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1631', '淮滨县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1632', '潢川县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1633', '固始县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1634', '商城县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1635', '新县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1636', '光山县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1637', '罗山县', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1638', '桐柏县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1639', '新野县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1640', '唐河县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1641', '社旗县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1642', '淅川县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1643', '镇平县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1644', '西峡县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1645', '方城县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1646', '南召县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1647', '邓州市', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1648', '宛城区', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1649', '卧龙区', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1650', '内乡县', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1651', '鹿邑县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1652', '太康县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1653', '淮阳县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1654', '郸城县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1655', '沈丘县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1656', '商水县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1657', '西华县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1658', '扶沟县', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1659', '项城市', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1660', '川汇区', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1661', '夏邑县', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1662', '柘城县', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1663', '虞城县', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1664', '宁陵县', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1665', '睢县', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1666', '民权县', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1667', '永城市', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1668', '睢阳区', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1669', '梁园区', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1670', '内黄县', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1671', '滑县', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1672', '汤阴县', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1673', '安阳县', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1674', '林州市', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1675', '龙安区', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1676', '殷都区', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1677', '文峰区', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1678', '北关区', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1679', '郏县', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1680', '鲁山县', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1681', '叶县', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1682', '宝丰县', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1683', '汝州市', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1684', '舞钢市', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1685', '石龙区', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1686', '湛河区', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1687', '卫东区', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1688', '新华区', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1689', '兰考县', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1690', '开封县', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1691', '尉氏县', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1692', '通许县', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1693', '杞县', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1694', '禹王台区', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1695', '金明区', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1696', '顺河回族区', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1697', '龙亭区', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1698', '鼓楼区', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1699', '长垣县', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1700', '封丘县', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1701', '延津县', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1702', '原阳县', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1703', '获嘉县', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1704', '新乡县', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1705', '辉县市', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1706', '卫辉市', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1707', '牧野区', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1708', '凤泉区', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1709', '红旗区', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1710', '卫滨区', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1711', '伊川县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1712', '洛宁县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1713', '宜阳县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1714', '汝阳县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1715', '嵩县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1716', '栾川县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1717', '新安县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1718', '孟津县', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1719', '偃师市', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1720', '吉利区', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1721', '洛龙区', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1722', '瀍河回族区', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1723', '涧西区', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1724', '老城区', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1725', '西工区', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1726', '济源市', '187', '3', '0', '0', 'J', 'JYS', null);
INSERT INTO `mmm_region` VALUES ('1727', '临颍县', '188', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1728', '舞阳县', '188', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1729', '召陵区', '188', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1730', '源汇区', '188', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1731', '郾城区', '188', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1732', '濮阳县', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1733', '台前县', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1734', '范县', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1735', '南乐县', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1736', '清丰县', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1737', '华龙区', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1738', '温县', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1739', '武陟县', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1740', '博爱县', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1741', '修武县', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1742', '孟州市', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1743', '沁阳市', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1744', '山阳区', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1745', '马村区', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1746', '中站区', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1747', '解放区', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1748', '襄城县', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1749', '鄢陵县', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1750', '许昌县', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1751', '长葛市', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1752', '禹州市', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1753', '魏都区', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1754', '登封市', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1755', '新郑市', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1756', '新密市', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1757', '荥阳市', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1758', '巩义市', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1759', '出口加工区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1760', '高新开发区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1761', '郑东新区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1762', '惠济区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1763', '上街区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1764', '中原区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1765', '管城区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1766', '二七区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1767', '邙山区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1768', '金水区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1769', '中牟县', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1770', '经济技术开发区', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1771', '新蔡县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1772', '遂平县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1773', '汝南县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1774', '泌阳县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1775', '确山县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1776', '正阳县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1777', '平舆县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1778', '上蔡县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1779', '西平县', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1780', '驿城区', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1781', '淇县', '194', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1782', '浚县', '194', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1783', '鹤山区', '194', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1784', '山城区', '194', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1785', '淇滨区', '194', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1786', '浪卡子县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1787', '错那县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1788', '隆子县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1789', '加查县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1790', '洛扎县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1791', '措美县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1792', '曲松县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1793', '琼结县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1794', '桑日县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1795', '贡嘎县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1796', '扎囊县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1797', '乃东县', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1798', '墨竹工卡县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1799', '达孜县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1800', '堆龙德庆县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1801', '曲水县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1802', '尼木县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1803', '当雄县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1804', '林周县', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1805', '城关区', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1806', '岗巴县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1807', '萨嘎县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1808', '聂拉木县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1809', '吉隆县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1810', '亚东县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1811', '仲巴县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1812', '定结县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1813', '康马县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1814', '仁布县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1815', '白朗县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1816', '谢通门县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1817', '昂仁县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1818', '拉孜县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1819', '萨迦县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1820', '定日县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1821', '江孜县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1822', '南木林县', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1823', '日喀则市', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1824', '洛隆县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1825', '芒康县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1826', '左贡县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1827', '八宿县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1828', '察雅县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1829', '丁青县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1830', '类乌齐县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1831', '贡觉县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1832', '江达县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1833', '昌都县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1834', '边坝县', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1835', '朗县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1836', '察隅县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1837', '波密县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1838', '墨脱县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1839', '米林县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1840', '工布江达县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1841', '林芝县', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1842', '尼玛县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1843', '巴青县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1844', '班戈县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1845', '索县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1846', '申扎县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1847', '安多县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1848', '聂荣县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1849', '比如县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1850', '嘉黎县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1851', '那曲县', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1852', '措勤县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1853', '改则县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1854', '革吉县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1855', '日土县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1856', '札达县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1857', '普兰县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1858', '噶尔县', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1859', '蓟县', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1860', '静海县', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1861', '宁河县', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1862', '经济开发区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1863', '宝坻区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1864', '武清区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1865', '大港区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1866', '汉沽区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1867', '塘沽区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1868', '北辰区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1869', '西青区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1870', '津南区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1871', '东丽区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1872', '红桥区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1873', '河东区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1874', '河北区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1875', '南开区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1876', '河西区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1877', '和平区', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1878', '密云县', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1879', '大兴区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1880', '平谷区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1881', '怀柔区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1882', '昌平区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1883', '顺义区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1884', '通州区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1885', '门头沟区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1886', '房山区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1887', '石景山区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1888', '丰台区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1889', '宣武区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1890', '崇文区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1891', '朝阳区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1892', '海淀区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1893', '西城区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1894', '东城区', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1895', '延庆县', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1896', '沧源', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1897', '耿马', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1898', '双江', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1899', '镇康县', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1900', '永德县', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1901', '云县', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1902', '凤庆县', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1903', '临翔区', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1904', '华坪县', '205', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1905', '永胜县', '205', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1906', '玉龙', '205', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1907', '宁蒗', '205', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1908', '古城区', '205', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1909', '昌宁县', '206', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1910', '龙陵县', '206', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1911', '腾冲县', '206', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1912', '施甸县', '206', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1913', '隆阳区', '206', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1914', '云龙县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1915', '永平县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1916', '弥渡县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1917', '宾川县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1918', '祥云县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1919', '大理市', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1920', '巍山', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1921', '南涧', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1922', '漾濞', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1923', '鹤庆县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1924', '剑川县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1925', '洱源县', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1926', '陇川县', '208', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1927', '盈江县', '208', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1928', '梁河县', '208', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1929', '瑞丽市', '208', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1930', '潞西市', '208', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1931', '贡山', '209', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1932', '福贡县', '209', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1933', '泸水县', '209', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1934', '兰坪', '209', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1935', '富宁县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1936', '广南县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1937', '丘北县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1938', '马关县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1939', '麻栗坡县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1940', '西畴县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1941', '砚山县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1942', '文山县', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1943', '寻甸', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1944', '禄劝', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1945', '石林县', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1946', '嵩明县', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1947', '宜良县', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1948', '富民县', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1949', '晋宁县', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1950', '呈贡县', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1951', '安宁市', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1952', '东川区', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1953', '西山区', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1954', '官渡区', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1955', '五华区', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1956', '盘龙区', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1957', '水富县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1958', '威信县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1959', '彝良县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1960', '镇雄县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1961', '绥江县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1962', '永善县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1963', '大关县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1964', '盐津县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1965', '巧家县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1966', '鲁甸县', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1967', '昭阳区', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1968', '西盟', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1969', '澜沧', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1970', '孟连', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1971', '江城', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1972', '镇沅', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1973', '景谷', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1974', '景东', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1975', '墨江', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1976', '思茅区', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1977', '宁洱', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1978', '沾益县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1979', '会泽县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1980', '富源县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1981', '罗平县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1982', '师宗县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1983', '陆良县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1984', '马龙县', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1985', '宣威市', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1986', '麒麟区', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1987', '禄丰县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1988', '武定县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1989', '元谋县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1990', '永仁县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1991', '大姚县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1992', '姚安县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1993', '南华县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1994', '牟定县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1995', '双柏县', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1996', '楚雄市', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1997', '元江', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1998', '新平', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('1999', '峨山', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2000', '易门县', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2001', '华宁县', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2002', '通海县', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2003', '澄江县', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2004', '江川县', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2005', '红塔区', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2006', '屏边', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2007', '河口', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2008', '金平', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2009', '红河县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2010', '元阳县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2011', '弥勒县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2012', '石屏县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2013', '建水县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2014', '绿春县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2015', '开远市', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2016', '个旧市', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2017', '蒙自县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2018', '泸西县', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2019', '勐腊县', '218', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2020', '勐海县', '218', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2021', '景洪市', '218', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2022', '维西', '219', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2023', '德钦县', '219', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2024', '香格里拉县', '219', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2025', '离岛区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2026', '中西区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2027', '荃湾区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2028', '南区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2029', '北区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2030', '油尖旺区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2031', '湾仔区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2032', '大埔区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2033', '西贡区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2034', '深水埗区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2035', '元朗区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2036', '葵青区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2037', '屯门区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2038', '九龙城区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2039', '黄大仙区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2040', '观塘区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2041', '东区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2042', '沙田区', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2043', '察哈尔右翼中旗', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2044', '察哈尔右翼前旗', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2045', '凉城县', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2046', '兴和县', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2047', '商都县', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2048', '卓资县', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2049', '丰镇市', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2050', '集宁区', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2051', '化德县', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2052', '四子王旗', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2053', '察哈尔右翼后旗', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2054', '海南区', '222', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2055', '乌达区', '222', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2056', '海勃湾区', '222', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2057', '突泉县', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2058', '扎赉特旗', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2059', '科尔沁右翼中旗', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2060', '科尔沁右翼前旗', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2061', '阿尔山市', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2062', '乌兰浩特市', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2063', '达尔罕茂明安联合旗', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2064', '固阳县', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2065', '土默特右旗', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2066', '白云矿区', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2067', '石拐区', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2068', '九原区', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2069', '东河区', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2070', '青山区', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2071', '昆都仑区', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2072', '新巴尔虎右旗', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2073', '新巴尔虎左旗', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2074', '陈巴尔虎旗', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2075', '鄂温克族自治旗', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2076', '鄂伦春自治旗', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2077', '阿荣旗', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2078', '根河市', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2079', '额尔古纳市', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2080', '扎兰屯市', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2081', '牙克石市', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2082', '满洲里市', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2083', '莫力达瓦', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2084', '海拉尔区', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2085', '武川县', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2086', '和林格尔县', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2087', '托克托县', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2088', '土默特左旗', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2089', '清水河县', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2090', '赛罕区', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2091', '新城区', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2092', '玉泉区', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2093', '回民区', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2094', '杭锦后旗', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2095', '乌拉特后旗', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2096', '乌拉特中旗', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2097', '乌拉特前旗', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2098', '磴口县', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2099', '五原县', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2100', '临河区', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2101', '敖汉旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2102', '宁城县', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2103', '喀喇沁旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2104', '翁牛特旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2105', '克什克腾旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2106', '红山区', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2107', '巴林右旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2108', '巴林左旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2109', '阿鲁科尔沁旗', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2110', '松山区', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2111', '元宝山区', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2112', '林西县', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2113', '扎鲁特旗', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2114', '奈曼旗', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2115', '库伦旗', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2116', '科尔沁区', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2117', '科尔沁左翼后旗', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2118', '科尔沁左翼中旗', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2119', '霍林郭勒市', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2120', '开鲁县', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2121', '伊金霍洛旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2122', '乌审旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2123', '杭锦旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2124', '东胜区', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2125', '鄂托克前旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2126', '准格尔旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2127', '达拉特旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2128', '鄂托克旗', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2129', '多伦县', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2130', '正蓝旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2131', '正镶白旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2132', '镶黄旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2133', '太仆寺旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2134', '二连浩特市', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2135', '东乌珠穆沁旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2136', '苏尼特右旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2137', '苏尼特左旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2138', '阿巴嘎旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2139', '锡林浩特市', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2140', '西乌珠穆沁旗', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2141', '额济纳旗', '232', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2142', '阿拉善左旗', '232', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2143', '阿拉善右旗', '232', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2144', '望牛墩镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2145', '洪梅镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2146', '石碣镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2147', '道滘镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2148', '麻涌镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2149', '虎门镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2150', '石龙镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2151', '莞城区', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2152', '万江区', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2153', '东城区', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2154', '南城区', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2155', '高埗镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2156', '中堂镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2157', '长安镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2158', '石排镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2159', '企石镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2160', '东坑镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2161', '横沥镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2162', '桥头镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2163', '常平镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2164', '清溪镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2165', '厚街镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2166', '谢岗镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2167', '塘厦镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2168', '凤岗镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2169', '樟木头', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2170', '黄江镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2171', '大朗镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2172', '大岭山镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2173', '寮步镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2174', '茶山镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2175', '沙田镇', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2176', '五桂山街道', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2177', '中山港街道', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2178', '石岐街道', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2179', '西区街道', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2180', '东区街道', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2181', '环城街道', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2182', '云安县', '235', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2183', '郁南县', '235', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2184', '云城区', '235', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2185', '罗定市', '235', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2186', '新兴县', '235', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2187', '高明区', '236', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2188', '三水区', '236', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2189', '禅城区', '236', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2190', '南海区', '236', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2191', '顺德区', '236', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2192', '市郊', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2193', '从化区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2194', '增城区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2195', '花都区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2196', '番禺区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2197', '黄埔区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2198', '从化市', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2199', '荔湾区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2200', '海珠区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2201', '白云区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2202', '东山区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2203', '天河区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2204', '越秀区', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2205', '龙门县', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2206', '惠东县', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2207', '惠阳区', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2208', '大亚湾', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2209', '惠城区', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2210', '博罗县', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2211', '惠来县', '239', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2212', '揭西县', '239', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2213', '榕城区', '239', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2214', '普宁市', '239', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2215', '揭东县', '239', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2216', '蕉岭县', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2217', '平远县', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2218', '五华县', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2219', '梅县', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2220', '大埔县', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2221', '兴宁市', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2222', '梅江区', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2223', '丰顺县', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2224', '金平区', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2225', '龙湖区', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2226', '澄海区', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2227', '濠江区', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2228', '南澳县', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2229', '潮南区', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2230', '潮阳区', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2231', '陆河县', '242', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2232', '城区', '242', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2233', '陆丰市', '242', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2234', '海丰县', '242', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2235', '恩平市', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2236', '鹤山市', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2237', '开平市', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2238', '江海区', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2239', '新会区', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2240', '蓬江区', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2241', '台山市', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2242', '紫金县', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2243', '龙川县', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2244', '东源县', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2245', '源城区', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2246', '和平县', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2247', '连平县', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2248', '盐田区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2249', '龙岗区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2250', '福田区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2251', '南山区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2252', '罗湖区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2253', '宝安区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2254', '连南', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2255', '连山', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2256', '清新县', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2257', '清城区', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2258', '佛冈县', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2259', '连州市', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2260', '英德市', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2261', '阳山县', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2262', '徐闻县', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2263', '遂溪县', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2264', '吴川市', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2265', '雷州市', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2266', '赤坎区', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2267', '麻章区', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2268', '坡头区', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2269', '霞山区', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2270', '廉江市', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2271', '饶平县', '248', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2272', '湘桥区', '248', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2273', '潮安县', '248', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2274', '金湾区', '249', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2275', '香洲区', '249', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2276', '斗门区', '249', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2277', '德庆县', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2278', '封开县', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2279', '怀集县', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2280', '肇庆市', '250', '3', '0', '0', 'Z', 'ZQS', null);
INSERT INTO `mmm_region` VALUES ('2281', '四会市', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2282', '高要市', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2283', '广宁县', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2284', '电白县', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2285', '信宜市', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2286', '茂南区', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2287', '高州市', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2288', '茂港区', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2289', '化州市', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2290', '阳东县', '252', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2291', '江城区', '252', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2292', '阳春市', '252', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2293', '阳西县', '252', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2294', '乳源', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2295', '新丰县', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2296', '翁源县', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2297', '仁化县', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2298', '始兴县', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2299', '曲江县', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2300', '乐昌市', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2301', '曲江区', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2302', '武江区', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2303', '浈江区', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2304', '南雄市', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2305', '婺源县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2306', '万年县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2307', '波阳县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2308', '余干县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2309', '弋阳县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2310', '信州区', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2311', '铅山县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2312', '玉山县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2313', '广丰县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2314', '上饶县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2315', '德兴市', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2316', '横峰县', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2317', '彭泽县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2318', '湖口县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2319', '都昌县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2320', '星子县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2321', '德安县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2322', '浔阳区', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2323', '修水县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2324', '武宁县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2325', '九江县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2326', '瑞昌市', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2327', '庐山区', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2328', '永修县', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2329', '进贤县', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2330', '安义县', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2331', '新建县', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2332', '南昌县', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2333', '高新区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2334', '东湖区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2335', '红谷滩新区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2336', '青山湖区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2337', '湾里区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2338', '青云谱区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2339', '西湖区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2340', '昌北区', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2341', '永新县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2342', '万安县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2343', '遂川县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2344', '泰和县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2345', '永丰县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2346', '新干县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2347', '安福县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2348', '吉水县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2349', '吉安县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2350', '井冈山市', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2351', '青原区', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2352', '吉州区', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2353', '峡江县', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2354', '铜鼓县', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2355', '靖安县', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2356', '宜丰县', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2357', '上高县', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2358', '袁州区', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2359', '奉新县', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2360', '高安市', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2361', '樟树市', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2362', '丰城市', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2363', '万载县', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2364', '广昌县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2365', '东乡县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2366', '资溪县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2367', '金溪县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2368', '宜黄县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2369', '临川区', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2370', '崇仁县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2371', '南丰县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2372', '黎川县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2373', '南城县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2374', '乐安县', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2375', '渝水区', '260', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2376', '分宜县', '260', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2377', '浮梁县', '261', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2378', '珠山区', '261', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2379', '昌江区', '261', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2380', '乐平市', '261', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2381', '上栗县', '262', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2382', '芦溪县', '262', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2383', '安源区', '262', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2384', '湘东区', '262', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2385', '莲花县', '262', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2386', '信丰县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2387', '大余县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2388', '南康市', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2389', '瑞金市', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2390', '于都县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2391', '章贡区', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2392', '石城县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2393', '寻乌县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2394', '会昌县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2395', '兴国县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2396', '宁都县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2397', '全南县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2398', '定南县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2399', '龙南县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2400', '安远县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2401', '崇义县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2402', '上犹县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2403', '赣县', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2404', '余江县', '264', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2405', '月湖区', '264', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2406', '贵溪市', '264', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2407', '秀山', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2408', '合川区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2409', '彭水', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2410', '石柱', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2411', '忠县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2412', '云阳县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2413', '奉节县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2414', '巫山县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2415', '巫溪县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2416', '开县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2417', '梁平县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2418', '城口县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2419', '丰都县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2420', '武隆县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2421', '垫江县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2422', '璧山县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2423', '荣昌县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2424', '大足县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2425', '铜梁县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2426', '潼南县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2427', '綦江县', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2428', '双桥区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2429', '长寿区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2430', '黔江开发区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2431', '渝中区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2432', '九龙坡区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2433', '江北区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2434', '涪陵区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2435', '巴南区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2436', '沙坪坝区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2437', '北碚区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2438', '万州区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2439', '大渡口区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2440', '万盛区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2441', '渝北区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2442', '南岸区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2443', '永川区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2444', '南川区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2445', '江津区', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2446', '酉阳', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2447', '仙桃市', '266', '3', '0', '0', 'X', 'XTS', null);
INSERT INTO `mmm_region` VALUES ('2448', '房县', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2449', '竹溪县', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2450', '竹山县', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2451', '郧西县', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2452', '郧县', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2453', '丹江口市', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2454', '茅箭区', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2455', '张湾区', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2456', '通山县', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2457', '崇阳县', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2458', '咸安区', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2459', '嘉鱼县', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2460', '赤壁市', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2461', '通城县', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2462', '天门市', '269', '3', '0', '0', 'T', 'TMS', null);
INSERT INTO `mmm_region` VALUES ('2463', '云梦县', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2464', '大悟县', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2465', '孝昌县', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2466', '孝南区', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2467', '安陆市', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2468', '应城市', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2469', '汉川市', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2470', '秭归县', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2471', '兴山县', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2472', '远安县', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2473', '枝江市', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2474', '当阳市', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2475', '宜都市', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2476', '长阳', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2477', '猇亭区', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2478', '点军区', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2479', '伍家岗区', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2480', '西陵区', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2481', '五峰', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2482', '夷陵区', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2483', '鹤峰县', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2484', '来凤县', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2485', '咸丰县', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2486', '恩施市', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2487', '巴东县', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2488', '建始县', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2489', '利川市', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2490', '宣恩县', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2491', '硚口区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2492', '江汉区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2493', '武昌区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2494', '江岸区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2495', '经济开发区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2496', '新洲区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2497', '汉阳区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2498', '江夏区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2499', '蔡甸区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2500', '汉南区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2501', '东西湖区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2502', '洪山区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2503', '青山区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2504', '黄陂区', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2505', '潜江市', '274', '3', '0', '0', 'Q', 'QJS', null);
INSERT INTO `mmm_region` VALUES ('2506', '神农架林区', '275', '3', '0', '0', 'S', 'SNJLQ', null);
INSERT INTO `mmm_region` VALUES ('2507', '江陵县', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2508', '监利县', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2509', '公安县', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2510', '沙市区', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2511', '洪湖市', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2512', '石首市', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2513', '荆州区', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2514', '松滋市', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2515', '沙洋县', '277', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2516', '京山县', '277', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2517', '东宝区', '277', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2518', '掇刀区', '277', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2519', '钟祥市', '277', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2520', '襄城区', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2521', '保康县', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2522', '谷城县', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2523', '南漳县', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2524', '樊城区', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2525', '枣阳市', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2526', '老河口市', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2527', '襄阳区', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2528', '宜城市', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2529', '梁子湖区', '279', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2530', '鄂城区', '279', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2531', '华容区', '279', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2532', '曾都区', '280', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2533', '广水市', '280', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2534', '黄梅县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2535', '蕲春县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2536', '浠水县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2537', '英山县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2538', '黄州区', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2539', '红安县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2540', '团风县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2541', '武穴市', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2542', '麻城市', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2543', '罗田县', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2544', '阳新县', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2545', '大冶市', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2546', '黄石港区', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2547', '下陆区', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2548', '西塞山区', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2549', '铁山区', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2550', '谯城区', '283', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2551', '涡阳县', '283', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2552', '蒙城县', '283', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2553', '利辛县', '283', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2554', '霍山县', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2555', '金寨县', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2556', '舒城县', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2557', '金安区', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2558', '寿县', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2559', '裕安区', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2560', '霍邱县', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2561', '肥西县', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2562', '肥东县', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2563', '长丰县', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2564', '庐阳区', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2565', '蜀山区', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2566', '瑶海区', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2567', '包河区', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2568', '岳西县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2569', '望江县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2570', '宿松县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2571', '太湖县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2572', '潜山县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2573', '迎江区', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2574', '怀宁县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2575', '桐城市', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2576', '宜秀区', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2577', '大观区', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2578', '枞阳县', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2579', '旌德县', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2580', '绩溪县', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2581', '泾县', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2582', '宣州区', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2583', '郎溪县', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2584', '宁国市', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2585', '广德县', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2586', '泗县', '288', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2587', '灵璧县', '288', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2588', '埇桥区', '288', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2589', '砀山县', '288', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2590', '萧县', '288', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2591', '和县', '289', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2592', '含山县', '289', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2593', '居巢区', '289', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2594', '庐江县', '289', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2595', '无为县', '289', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2596', '青阳县', '290', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2597', '贵池区', '290', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2598', '东至县', '290', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2599', '石台县', '290', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2600', '濉溪县', '291', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2601', '相山区', '291', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2602', '杜集区', '291', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2603', '烈山区', '291', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2604', '凤台县', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2605', '潘集区', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2606', '田家庵区', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2607', '谢家集区', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2608', '大通区', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2609', '八公山区', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2610', '凤阳县', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2611', '定远县', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2612', '全椒县', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2613', '琅琊区', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2614', '明光市', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2615', '天长市', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2616', '南谯区', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2617', '来安县', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2618', '南陵县', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2619', '繁昌县', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2620', '芜湖县', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2621', '镜湖区', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2622', '鸠江区', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2623', '弋江区', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2624', '三山区', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2625', '中市区', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2626', '固镇县', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2627', '五河县', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2628', '东市区', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2629', '郊区', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2630', '西市区', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2631', '怀远县', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2632', '郊区', '296', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2633', '铜陵县', '296', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2634', '铜官山区', '296', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2635', '狮子山区', '296', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2636', '颖上县', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2637', '阜南县', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2638', '太和县', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2639', '临泉县', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2640', '界首市', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2641', '蚌山区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2642', '颍东区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2643', '颍州区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2644', '淮上区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2645', '禹会区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2646', '龙子湖区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2647', '颍泉区', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2648', '当涂县', '298', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2649', '雨山区', '298', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2650', '花山区', '298', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2651', '金家庄区', '298', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2652', '祁门县', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2653', '黟县', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2654', '休宁县', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2655', '屯溪区', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2656', '徽州区', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2657', '黄山区', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2658', '歙县', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2659', '凤城市', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2660', '东港市', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2661', '宽甸', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2662', '振安区', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2663', '元宝区', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2664', '振兴区', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2665', '长海县', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2666', '庄河市', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2667', '普兰店市', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2668', '瓦房店市', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2669', '开发区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2670', '西岗区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2671', '旅顺口区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2672', '甘井子区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2673', '沙河口区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2674', '中山区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2675', '金州区', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2676', '东洲区', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2677', '新抚区', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2678', '顺城区', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2679', '望花区', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2680', '新宾', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2681', '清原', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2682', '抚顺县', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2683', '建平县', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2684', '朝阳县', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2685', '凌源市', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2686', '双塔区', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2687', '喀喇沁左翼蒙古族自治县', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2688', '龙城区', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2689', '北票市', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2690', '桓仁', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2691', '南芬区', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2692', '本溪', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2693', '明山区', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2694', '平山区', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2695', '溪湖区', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2696', '法库县', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2697', '康平县', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2698', '辽中县', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2699', '新民市', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2700', '浑南新区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2701', '于洪区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2702', '沈河区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2703', '东陵区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2704', '苏家屯区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2705', '铁西区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2706', '大东区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2707', '和平区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2708', '皇姑区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2709', '沈北新区', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2710', '盘山县', '306', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2711', '双台子区', '306', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2712', '兴隆台区', '306', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2713', '大洼县', '306', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2714', '大石桥市', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2715', '盖州市', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2716', '站前区', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2717', '鲅鱼圈区', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2718', '西市区', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2719', '老边区', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2720', '建昌县', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2721', '绥中县', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2722', '龙港区', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2723', '连山区', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2724', '南票区', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2725', '兴城市', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2726', '辽阳县', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2727', '灯塔市', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2728', '弓长岭区', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2729', '白塔区', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2730', '宏伟区', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2731', '文圣区', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2732', '太子河区', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2733', '昌图县', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2734', '西丰县', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2735', '铁岭县', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2736', '银州区', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2737', '调兵山市', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2738', '清河区', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2739', '开原市', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2740', '义县', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2741', '黑山县', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2742', '北镇市', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2743', '太和区', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2744', '凌河区', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2745', '古塔区', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2746', '凌海市', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2747', '彰武县', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2748', '细河区', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2749', '清河门区', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2750', '阜新', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2751', '新邱区', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2752', '海州区', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2753', '太平区', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2754', '台安县', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2755', '海城市', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2756', '岫岩', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2757', '铁东区', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2758', '立山区', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2759', '铁西区', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2760', '千山区', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2761', '汾西县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2762', '尧都区', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2763', '永和县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2764', '隰县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2765', '大宁县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2766', '乡宁县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2767', '古县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2768', '浮山县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2769', '安泽县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2770', '吉县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2771', '洪洞县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2772', '襄汾县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2773', '翼城县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2774', '曲沃县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2775', '霍州市', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2776', '侯马市', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2777', '蒲县', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2778', '汾阳市', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2779', '孝义市', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2780', '离石区', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2781', '离石市', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2782', '交口县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2783', '中阳县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2784', '文水县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2785', '岚县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2786', '石楼县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2787', '柳林县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2788', '临县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2789', '兴县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2790', '交城县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2791', '方山县', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2792', '大同县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2793', '左云县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2794', '浑源县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2795', '灵丘县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2796', '广灵县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2797', '城区', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2798', '阳高县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2799', '新荣区', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2800', '南郊区', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2801', '矿区', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2802', '天镇县', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2803', '古交市', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2804', '娄烦县', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2805', '阳曲县', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2806', '清徐县', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2807', '经济技术开发区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2808', '民营经济开发区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2809', '杏花岭区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2810', '晋源区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2811', '万柏林区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2812', '尖草坪区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2813', '迎泽区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2814', '小店区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2815', '高新开发区', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2816', '偏关县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2817', '保德县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2818', '河曲县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2819', '岢岚县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2820', '五寨县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2821', '神池县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2822', '忻府区', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2823', '宁武县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2824', '繁峙县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2825', '代县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2826', '五台县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2827', '定襄县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2828', '原平市', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2829', '静乐县', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2830', '灵石县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2831', '平遥县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2832', '祁县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2833', '太谷县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2834', '寿阳县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2835', '榆次区', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2836', '和顺县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2837', '左权县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2838', '榆社县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2839', '介休市', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2840', '昔阳县', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2841', '泽州县', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2842', '陵川县', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2843', '城区', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2844', '沁水县', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2845', '高平市', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2846', '阳城县', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2847', '怀仁县', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2848', '右玉县', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2849', '朔城区', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2850', '山阴县', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2851', '平鲁区', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2852', '应县', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2853', '芮城县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2854', '平陆县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2855', '夏县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2856', '垣曲县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2857', '绛县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2858', '新绛县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2859', '盐湖区', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2860', '闻喜县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2861', '万荣县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2862', '临猗县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2863', '河津市', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2864', '永济市', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2865', '稷山县', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2866', '黎城县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2867', '平顺县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2868', '屯留县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2869', '襄垣县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2870', '长治县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2871', '潞城市', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2872', '壶关县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2873', '郊区', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2874', '城区', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2875', '沁源县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2876', '武乡县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2877', '长子县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2878', '沁县', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2879', '盂县', '324', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2880', '平定县', '324', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2881', '城区', '324', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2882', '矿区', '324', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2883', '郊区', '324', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2884', '乌鲁木齐县', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2885', '米东区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2886', '达坂城区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2887', '天山区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2888', '水磨沟区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2889', '新市区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2890', '沙依巴克区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2891', '头屯河区', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2892', '五家渠市', '326', '3', '0', '0', 'W', 'WJQS', null);
INSERT INTO `mmm_region` VALUES ('2893', '察布查尔', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2894', '阿勒泰市', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2895', '特克斯县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2896', '昭苏县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2897', '吉木乃县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2898', '和布克赛尔', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2899', '裕民县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2900', '新源县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2901', '青河县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2902', '托里县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2903', '哈巴河县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2904', '巩留县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2905', '沙湾县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2906', '霍城县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2907', '福海县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2908', '伊宁县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2909', '富蕴县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2910', '额敏县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2911', '乌苏市', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2912', '奎屯市', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2913', '布尔津县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2914', '伊宁市', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2915', '布克赛尔', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2916', '尼勒克县', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2917', '阿克陶县', '328', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2918', '阿合奇县', '328', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2919', '乌恰县', '328', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2920', '阿图什市', '328', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2921', '克拉玛依市', '329', '3', '0', '0', 'K', 'KLMYS', null);
INSERT INTO `mmm_region` VALUES ('2922', '温泉县', '330', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2923', '博乐市', '330', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2924', '精河县', '330', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2925', '托克逊县', '331', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2926', '吐鲁番市', '331', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2927', '鄯善县', '331', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2928', '民丰县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2929', '于田县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2930', '策勒县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2931', '和田市', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2932', '皮山县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2933', '墨玉县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2934', '和田县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2935', '洛浦县', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2936', '巴里坤', '333', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2937', '哈密市', '333', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2938', '伊吾县', '333', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2939', '塔什库尔干', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2940', '巴楚县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2941', '伽师县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2942', '岳普湖县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2943', '麦盖提县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2944', '喀什市', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2945', '莎车县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2946', '泽普县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2947', '英吉沙县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2948', '疏勒县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2949', '疏附县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2950', '叶城县', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2951', '图木舒克市', '335', '3', '0', '0', 'T', 'TMSKS', null);
INSERT INTO `mmm_region` VALUES ('2952', '博湖县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2953', '和硕县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2954', '和静县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2955', '焉耆', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2956', '库尔勒市', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2957', '若羌县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2958', '尉犁县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2959', '轮台县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2960', '且末县', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2961', '木垒', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2962', '吉木萨尔县', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2963', '奇台县', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2964', '呼图壁县', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2965', '阜康市', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2966', '昌吉市', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2967', '米泉市', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2968', '玛纳斯县', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2969', '石河子市', '339', '3', '0', '0', 'S', 'SHZS', null);
INSERT INTO `mmm_region` VALUES ('2970', '柯坪县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2971', '阿瓦提县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2972', '乌什县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2973', '拜城县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2974', '阿克苏市', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2975', '沙雅县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2976', '库车县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2977', '温宿县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2978', '新和县', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2979', '阿拉尔市', '342', '3', '0', '0', 'A', 'ALES', null);
INSERT INTO `mmm_region` VALUES ('2980', '高淳县', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2981', '溧水县', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2982', '六合区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2983', '江宁区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2984', '浦口区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2985', '栖霞区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2986', '玄武区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2987', '雨花台区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2988', '秦淮区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2989', '建邺区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2990', '白下区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2991', '鼓楼区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2992', '下关区', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2993', '如东县', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2994', '海安县', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2995', '海门市', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2996', '通州市', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2997', '崇川区', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2998', '启东市', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('2999', '经济开发区', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3000', '港闸区', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3001', '如皋市', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3002', '泗洪县', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3003', '泗阳县', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3004', '宿城区', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3005', '宿豫县', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3006', '宿豫区', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3007', '沭阳县', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3008', '金坛市', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3009', '溧阳市', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3010', '武进区', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3011', '天宁区', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3012', '郊区', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3013', '戚墅堰区', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3014', '钟楼区', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3015', '新北区', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3016', '睢宁县', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3017', '铜山县', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3018', '沛县', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3019', '丰县', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3020', '邳州市', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3021', '云龙区', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3022', '泉山区', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3023', '贾汪区', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3024', '九里区', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3025', '鼓楼区', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3026', '新沂市', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3027', '宝应县', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3028', '江都市', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3029', '高邮市', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3030', '广陵区', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3031', '邗江区', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3032', '维扬区', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3033', '仪征市', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3034', '宜兴市', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3035', '江阴市', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3036', '新区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3037', '滨湖区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3038', '崇安区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3039', '锡山区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3040', '南长区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3041', '北塘区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3042', '惠山区', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3043', '姜堰市', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3044', '泰兴市', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3045', '海陵区', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3046', '兴化市', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3047', '高港区', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3048', '靖江市', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3049', '金湖县', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3050', '盱眙县', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3051', '洪泽县', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3052', '清河区', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3053', '淮阴区', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3054', '楚州区', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3055', '清浦区', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3056', '涟水县', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3057', '亭湖区', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3058', '城区', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3059', '建湖县', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3060', '射阳县', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3061', '阜宁县', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3062', '盐都区', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3063', '响水县', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3064', '大丰市', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3065', '东台市', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3066', '盐都县', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3067', '滨海县', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3068', '太仓市', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3069', '沧浪区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3070', '开发区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3071', '锦溪镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3072', '千灯镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3073', '周庄镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3074', '张浦镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3075', '淀山湖镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3076', '花桥镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3077', '陆家镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3078', '周市镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3079', '巴城镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3080', '玉山镇', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3081', '张家港市', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3082', '常熟市', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3083', '新区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3084', '园区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3085', '相城区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3086', '吴中区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3087', '虎丘区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3088', '平江区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3089', '金阊区', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3090', '吴江市', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3091', '灌南县', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3092', '灌云县', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3093', '东海县', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3094', '新浦区', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3095', '海州区', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3096', '连云区', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3097', '赣榆县', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3098', '句容市', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3099', '扬中市', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3100', '京口区', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3101', '丹徒区', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3102', '润州区', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3103', '丹阳市', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3104', '合浦县', '356', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3105', '海城区', '356', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3106', '银海区', '356', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3107', '铁山港区', '356', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3108', '横县', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3109', '宾阳县', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3110', '上林县', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3111', '马山县', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3112', '隆安县', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3113', '邕宁区', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3114', '江南区', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3115', '西乡塘区', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3116', '良庆区', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3117', '兴宁区', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3118', '青秀区', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3119', '武鸣县', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3120', '天等县', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3121', '大新县', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3122', '龙州县', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3123', '江州区', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3124', '宁明县', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3125', '凭祥市', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3126', '扶绥县', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3127', '金秀', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3128', '忻城县', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3129', '兴宾区', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3130', '象州县', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3131', '合山市', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3132', '武宣县', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3133', '三江', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3134', '融水', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3135', '融安县', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3136', '鹿寨县', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3137', '城中区', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3138', '柳江县', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3139', '柳南区', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3140', '柳北区', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3141', '鱼峰区', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3142', '柳城县', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3143', '恭城', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3144', '秀峰区', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3145', '永福县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3146', '资源县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3147', '荔浦县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3148', '灌阳县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3149', '兴安县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3150', '平乐县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3151', '全州县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3152', '灵川县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3153', '临桂县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3154', '阳朔县', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3155', '雁山区', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3156', '七星区', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3157', '象山区', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3158', '叠彩区', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3159', '龙胜', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3160', '蒙山县', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3161', '藤县', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3162', '苍梧县', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3163', '万秀区', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3164', '长洲区', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3165', '蝶山区', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3166', '岑溪市', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3167', '大化', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3168', '环江', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3169', '巴马', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3170', '罗城', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3171', '都安', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3172', '金城江区', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3173', '南丹县', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3174', '凤山县', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3175', '天峨县', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3176', '宜州市', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3177', '东兰县', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3178', '兴业县', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3179', '博白县', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3180', '玉州区', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3181', '容县', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3182', '北流市', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3183', '陆川县', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3184', '田东县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3185', '靖西县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3186', '田阳县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3187', '田林县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3188', '德保县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3189', '那坡县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3190', '西林县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3191', '平果县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3192', '凌云县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3193', '右江区', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3194', '隆林', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3195', '乐业县', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3196', '平南县', '366', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3197', '桂平市', '366', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3198', '港北区', '366', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3199', '港南区', '366', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3200', '覃塘区', '366', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3201', '富川', '367', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3202', '八步区', '367', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3203', '钟山县', '367', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3204', '昭平县', '367', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3205', '钦南区', '368', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3206', '钦北区', '368', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3207', '灵山县', '368', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3208', '浦北县', '368', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3209', '上思县', '369', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3210', '港口区', '369', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3211', '防城区', '369', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3212', '东兴市', '369', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3213', '顺平县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3214', '博野县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3215', '曲阳县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3216', '易县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3217', '安新县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3218', '望都县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3219', '涞源县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3220', '容城县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3221', '高阳县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3222', '唐县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3223', '定兴县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3224', '徐水县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3225', '阜平县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3226', '涞水县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3227', '清苑县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3228', '满城县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3229', '高碑店市', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3230', '安国市', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3231', '定州市', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3232', '涿州市', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3233', '北市区', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3234', '南市区', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3235', '新市区', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3236', '雄县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3237', '蠡县', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3238', '唐海县', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3239', '玉田县', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3240', '迁西县', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3241', '乐亭县', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3242', '滦南县', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3243', '滦县', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3244', '路北区', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3245', '遵化市', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3246', '丰润区', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3247', '丰南区', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3248', '开平区', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3249', '古冶区', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3250', '路南区', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3251', '迁安市', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3252', '大厂', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3253', '文安县', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3254', '大城县', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3255', '香河县', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3256', '安次区', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3257', '固安县', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3258', '三河市', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3259', '霸州市', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3260', '广阳区', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3261', '永清县', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3262', '崇礼县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3263', '桥西区', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3264', '涿鹿县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3265', '怀来县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3266', '万全县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3267', '怀安县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3268', '阳原县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3269', '蔚县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3270', '尚义县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3271', '沽源县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3272', '康保县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3273', '张北县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3274', '宣化县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3275', '下花园区', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3276', '宣化区', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3277', '桥东区', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3278', '赤城县', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3279', '围场', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3280', '宽城', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3281', '丰宁', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3282', '隆化县', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3283', '滦平县', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3284', '双桥区', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3285', '兴隆县', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3286', '承德县', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3287', '鹰手营子矿区', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3288', '双滦区', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3289', '平泉县', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3290', '孟村', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3291', '运河区', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3292', '吴桥县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3293', '南皮县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3294', '肃宁县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3295', '盐山县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3296', '海兴县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3297', '东光县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3298', '青县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3299', '沧县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3300', '河间市', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3301', '黄骅市', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3302', '任丘市', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3303', '泊头市', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3304', '新华区', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3305', '献县', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3306', '赵县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3307', '长安区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3308', '平山县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3309', '无极县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3310', '赞皇县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3311', '深泽县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3312', '高邑县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3313', '灵寿县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3314', '行唐县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3315', '栾城县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3316', '正定县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3317', '井陉县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3318', '鹿泉市', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3319', '新乐市', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3320', '晋州市', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3321', '藁城市', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3322', '辛集市', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3323', '高新区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3324', '井陉矿区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3325', '裕华区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3326', '新华区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3327', '桥西区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3328', '桥东区', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3329', '元氏县', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3330', '青龙', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3331', '卢龙县', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3332', '抚宁县', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3333', '海港区', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3334', '北戴河区', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3335', '山海关区', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3336', '昌黎县', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3337', '阜城县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3338', '景县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3339', '故城县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3340', '安平县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3341', '饶阳县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3342', '桃城区', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3343', '武邑县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3344', '枣强县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3345', '深州市', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3346', '冀州市', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3347', '武强县', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3348', '桥西区', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3349', '南宫市', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3350', '临西县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3351', '清河县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3352', '威县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3353', '平乡县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3354', '广宗县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3355', '新河县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3356', '巨鹿县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3357', '宁晋县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3358', '南和县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3359', '任县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3360', '隆尧县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3361', '柏乡县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3362', '内丘县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3363', '临城县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3364', '邢台县', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3365', '沙河市', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3366', '桥东区', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3367', '武安市', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3368', '邯郸县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3369', '邯山区', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3370', '复兴区', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3371', '从台区', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3372', '曲周县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3373', '魏县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3374', '馆陶县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3375', '广平县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3376', '鸡泽县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3377', '邱县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3378', '永年县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3379', '肥乡县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3380', '磁县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3381', '涉县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3382', '大名县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3383', '成安县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3384', '临漳县', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3385', '峰峰矿区', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3386', '其他', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3387', '市区', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3388', '新州镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3389', '木棠镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3390', '光村镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3391', '东成镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3392', '排浦镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3393', '海头镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3394', '和庆镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3395', '兰洋镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3396', '白马井镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3397', '南丰镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3398', '峨蔓镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3399', '中和镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3400', '大成镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3401', '雅星镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3402', '王五镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3403', '那大镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3404', '洋浦开发区', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3405', '三都镇', '388', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3406', '美兰区', '393', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3407', '秀英区', '393', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3408', '龙华区', '393', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3409', '琼山区', '393', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3410', '澳门', '399', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3421', '义乌市', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('3422', '昆山市', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5000', '龙华新区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5001', '市中心区', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5002', '华强北', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5003', '香蜜湖', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5004', '荔枝公园', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5005', '皇岗', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5006', '沙头', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5007', '梅林', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5008', '八卦岭/园岭', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5009', '华强南', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5010', '车公庙', '2250', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5011', '宝安南路沿线', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5012', '宝安南路沿线', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5013', '火车站', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5014', '东门商业圈', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5015', '翠竹路沿线', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5016', '莲塘', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5017', '罗湖区政府', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5018', '笋岗', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5019', '国贸', '2252', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5020', '南山中心区', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5021', '华侨城', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5022', '南油', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5023', '蛇口', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5024', '西丽', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5025', '科技园', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5026', '前海', '2251', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5027', '大小梅沙', '2248', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5028', '沙头角', '2248', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5029', '盐田', '2248', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5030', '宝安中心区', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5031', '宝安其他', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5032', '石岩', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5033', '松岗', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5034', '福永', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5035', '固戍桃源居', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5036', '西乡', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5037', '公明', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5038', '沙井', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5039', '光明', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5040', '新安', '2253', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5041', '龙岗其他', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5042', '龙岗中心区', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5043', '布吉', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5044', '南澳', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5045', '横岗', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5046', '平湖', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5047', '坪地', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5048', '坂田', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5049', '大鹏', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5050', '坪山', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5051', '双龙/南联', '2249', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5052', '龙华', '5000', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5053', '大浪', '5000', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5054', '观澜', '5000', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5055', '民治', '5000', '4', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5056', '光明新区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5057', '坪山新区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5058', '大鹏新区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5059', '其他区', '245', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5060', '其他', '35', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5061', '其他', '36', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5062', '其他', '37', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5063', '其他', '38', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5064', '其他', '39', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5065', '其他', '40', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5066', '其他', '41', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5067', '其他', '42', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5068', '其他', '43', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5069', '其他', '44', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5070', '其他', '45', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5071', '其他', '46', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5072', '其他', '47', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5073', '其他', '48', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5074', '其他', '49', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5075', '其他', '50', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5076', '其他', '51', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5077', '其他', '52', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5078', '其他', '53', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5079', '其他', '54', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5080', '其他', '55', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5081', '其他', '56', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5082', '其他', '57', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5083', '其他', '58', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5084', '其他', '59', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5085', '其他', '60', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5086', '其他', '61', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5087', '其他', '62', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5088', '其他', '63', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5089', '其他', '64', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5090', '其他', '65', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5091', '其他', '66', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5092', '其他', '67', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5093', '其他', '68', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5094', '其他', '69', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5095', '其他', '70', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5096', '其他', '71', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5097', '其他', '72', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5098', '其他', '73', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5099', '其他', '74', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5100', '其他', '75', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5101', '其他', '76', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5102', '其他', '77', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5103', '其他', '78', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5104', '其他', '79', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5105', '其他', '80', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5106', '其他', '81', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5107', '其他', '82', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5108', '其他', '83', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5109', '其他', '84', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5110', '其他', '85', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5111', '其他', '86', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5112', '其他', '87', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5113', '其他', '88', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5114', '其他', '89', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5115', '其他', '90', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5116', '其他', '91', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5117', '其他', '92', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5118', '其他', '93', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5119', '其他', '94', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5120', '其他', '95', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5121', '其他', '96', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5122', '其他', '97', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5123', '其他', '98', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5124', '其他', '99', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5125', '其他', '100', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5126', '其他', '101', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5127', '其他', '102', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5128', '其他', '103', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5129', '其他', '104', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5130', '其他', '105', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5131', '其他', '106', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5132', '其他', '107', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5133', '其他', '108', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5134', '其他', '109', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5135', '其他', '110', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5136', '其他', '111', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5137', '其他', '112', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5138', '其他', '113', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5139', '其他', '114', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5140', '其他', '115', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5141', '其他', '116', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5142', '其他', '117', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5143', '其他', '118', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5144', '其他', '119', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5145', '其他', '120', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5146', '其他', '121', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5147', '其他', '122', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5148', '其他', '123', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5149', '其他', '124', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5150', '其他', '125', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5151', '其他', '126', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5152', '其他', '127', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5153', '其他', '128', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5154', '其他', '129', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5155', '其他', '130', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5156', '其他', '131', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5157', '其他', '132', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5158', '其他', '133', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5159', '其他', '134', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5160', '其他', '135', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5161', '其他', '136', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5162', '其他', '137', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5163', '其他', '138', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5164', '其他', '139', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5165', '其他', '140', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5166', '其他', '141', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5167', '其他', '142', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5168', '其他', '143', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5169', '其他', '144', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5170', '其他', '145', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5171', '其他', '146', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5172', '其他', '147', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5173', '其他', '148', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5174', '其他', '149', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5175', '其他', '150', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5176', '其他', '151', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5177', '其他', '152', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5178', '其他', '153', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5179', '其他', '154', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5180', '其他', '155', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5181', '其他', '156', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5182', '其他', '157', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5183', '其他', '158', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5184', '其他', '159', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5185', '其他', '160', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5186', '其他', '161', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5187', '其他', '162', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5188', '其他', '163', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5189', '其他', '164', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5190', '其他', '165', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5191', '其他', '166', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5192', '其他', '167', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5193', '其他', '168', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5194', '其他', '169', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5195', '其他', '170', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5196', '其他', '171', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5197', '其他', '172', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5198', '其他', '173', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5199', '其他', '174', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5200', '其他', '175', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5201', '其他', '176', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5202', '其他', '177', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5203', '其他', '178', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5204', '其他', '179', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5205', '其他', '180', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5206', '其他', '181', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5207', '其他', '182', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5208', '其他', '183', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5209', '其他', '184', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5210', '其他', '185', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5211', '其他', '186', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5212', '其他', '187', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5213', '其他', '188', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5214', '其他', '189', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5215', '其他', '190', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5216', '其他', '191', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5217', '其他', '192', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5218', '其他', '193', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5219', '其他', '194', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5220', '其他', '195', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5221', '其他', '196', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5222', '其他', '197', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5223', '其他', '198', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5224', '其他', '199', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5225', '其他', '200', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5226', '其他', '201', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5227', '其他', '202', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5228', '其他', '203', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5229', '其他', '204', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5230', '其他', '205', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5231', '其他', '206', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5232', '其他', '207', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5233', '其他', '208', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5234', '其他', '209', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5235', '其他', '210', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5236', '其他', '211', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5237', '其他', '212', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5238', '其他', '213', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5239', '其他', '214', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5240', '其他', '215', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5241', '其他', '216', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5242', '其他', '217', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5243', '其他', '218', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5244', '其他', '219', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5245', '其他', '220', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5246', '其他', '221', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5247', '其他', '222', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5248', '其他', '223', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5249', '其他', '224', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5250', '其他', '225', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5251', '其他', '226', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5252', '其他', '227', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5253', '其他', '228', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5254', '其他', '229', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5255', '其他', '230', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5256', '其他', '231', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5257', '其他', '232', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5258', '其他', '233', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5259', '其他', '234', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5260', '其他', '235', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5261', '其他', '236', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5262', '其他', '237', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5263', '其他', '238', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5264', '其他', '239', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5265', '其他', '240', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5266', '其他', '241', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5267', '其他', '242', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5268', '其他', '243', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5269', '其他', '244', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5270', '其他', '246', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5271', '其他', '247', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5272', '其他', '248', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5273', '其他', '249', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5274', '其他', '250', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5275', '其他', '251', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5276', '其他', '252', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5277', '其他', '253', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5278', '其他', '254', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5279', '其他', '255', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5280', '其他', '256', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5281', '其他', '257', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5282', '其他', '258', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5283', '其他', '259', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5284', '其他', '260', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5285', '其他', '261', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5286', '其他', '262', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5287', '其他', '263', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5288', '其他', '264', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5289', '其他', '265', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5290', '其他', '266', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5291', '其他', '267', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5292', '其他', '268', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5293', '其他', '269', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5294', '其他', '270', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5295', '其他', '271', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5296', '其他', '272', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5297', '其他', '273', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5298', '其他', '274', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5299', '其他', '275', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5300', '其他', '276', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5301', '其他', '277', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5302', '其他', '278', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5303', '其他', '279', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5304', '其他', '280', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5305', '其他', '281', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5306', '其他', '282', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5307', '其他', '283', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5308', '其他', '284', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5309', '其他', '285', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5310', '其他', '286', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5311', '其他', '287', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5312', '其他', '288', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5313', '其他', '289', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5314', '其他', '290', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5315', '其他', '291', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5316', '其他', '292', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5317', '其他', '293', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5318', '其他', '294', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5319', '其他', '295', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5320', '其他', '296', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5321', '其他', '297', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5322', '其他', '298', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5323', '其他', '299', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5324', '其他', '300', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5325', '其他', '301', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5326', '其他', '302', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5327', '其他', '303', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5328', '其他', '304', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5329', '其他', '305', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5330', '其他', '306', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5331', '其他', '307', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5332', '其他', '308', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5333', '其他', '309', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5334', '其他', '310', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5335', '其他', '311', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5336', '其他', '312', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5337', '其他', '313', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5338', '其他', '314', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5339', '其他', '315', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5340', '其他', '316', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5341', '其他', '317', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5342', '其他', '318', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5343', '其他', '319', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5344', '其他', '320', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5345', '其他', '321', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5346', '其他', '322', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5347', '其他', '323', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5348', '其他', '324', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5349', '其他', '325', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5350', '其他', '326', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5351', '其他', '327', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5352', '其他', '328', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5353', '其他', '329', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5354', '其他', '330', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5355', '其他', '331', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5356', '其他', '332', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5357', '其他', '333', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5358', '其他', '334', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5359', '其他', '335', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5360', '其他', '336', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5361', '其他', '337', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5362', '其他', '338', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5363', '其他', '339', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5364', '其他', '340', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5365', '其他', '341', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5366', '其他', '342', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5367', '其他', '343', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5368', '其他', '344', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5369', '其他', '345', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5370', '其他', '346', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5371', '其他', '347', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5372', '其他', '348', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5373', '其他', '349', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5374', '其他', '350', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5375', '其他', '351', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5376', '其他', '352', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5377', '其他', '353', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5378', '其他', '354', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5379', '其他', '355', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5380', '其他', '356', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5381', '其他', '357', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5382', '其他', '358', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5383', '其他', '359', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5384', '其他', '360', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5385', '其他', '361', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5386', '其他', '362', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5387', '其他', '363', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5388', '其他', '364', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5389', '其他', '365', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5390', '其他', '366', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5391', '其他', '367', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5392', '其他', '368', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5393', '其他', '369', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5394', '其他', '370', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5395', '其他', '371', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5396', '其他', '372', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5397', '其他', '373', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5398', '其他', '374', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5399', '其他', '375', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5400', '其他', '376', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5401', '其他', '377', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5402', '其他', '378', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5403', '其他', '379', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5404', '其他', '380', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5405', '其他', '381', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5406', '其他', '382', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5407', '其他', '383', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5408', '其他', '384', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5409', '其他', '385', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5410', '其他', '386', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5411', '其他', '387', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5412', '其他', '389', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5413', '其他', '390', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5414', '其他', '391', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5415', '其他', '392', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5416', '其他', '393', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5417', '其他', '394', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5418', '其他', '395', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5419', '其他', '396', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5420', '其他', '397', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5421', '其他', '398', '3', '0', '0', null, null, null);
INSERT INTO `mmm_region` VALUES ('5422', '其他', '399', '3', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for mmm_sms
-- ----------------------------
DROP TABLE IF EXISTS `mmm_sms`;
CREATE TABLE `mmm_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verify` varchar(128) DEFAULT NULL COMMENT '标识，比如2分钟内发同一个验证码',
  `type` tinyint(1) DEFAULT '1' COMMENT '1 短信验证码  2 推送信息',
  `content` text COMMENT '发送内容，存序列化之后的数据',
  `mobile` varchar(1200) DEFAULT NULL COMMENT '手机号码',
  `sendtime` int(10) DEFAULT NULL COMMENT '发送时间',
  `status` varchar(64) DEFAULT NULL COMMENT '发送状态码, 0-成功，1-失败',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='短信发送记录';

-- ----------------------------
-- Records of mmm_sms
-- ----------------------------
INSERT INTO `mmm_sms` VALUES ('1', '896536', '1', 'a:2:{i:0;i:896536;i:1;i:10;}', '13425157494', '1487686722', '0', null);

-- ----------------------------
-- Table structure for mmm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `mmm_supplier`;
CREATE TABLE `mmm_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(120) NOT NULL DEFAULT '' COMMENT '供应商或者地接名字',
  `addr` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商地址',
  `tel` varchar(36) NOT NULL DEFAULT '' COMMENT '公司座机',
  `boss` varchar(36) NOT NULL DEFAULT '' COMMENT '老板名字',
  `boss_phone` varchar(36) NOT NULL DEFAULT '' COMMENT '老板手机号码',
  `boss_wx` varchar(36) NOT NULL DEFAULT '' COMMENT '老板微信号码',
  `boss_qq` varchar(36) NOT NULL DEFAULT '' COMMENT '老板QQ号码',
  `note` text COMMENT '公司介绍',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '供应商状态：0-启用，1-停用，2-删除',
  `score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '供应商评分等级：0 一般，1-较好，2-较差，',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主打线路类型：1-周边，2-国内，3-出境，4-港澳台',
  `des` varchar(255) NOT NULL DEFAULT '' COMMENT '主打目的地id，多个目的地id用逗号分隔',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `company_name` (`company_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='供应商管理';

-- ----------------------------
-- Records of mmm_supplier
-- ----------------------------
INSERT INTO `mmm_supplier` VALUES ('1', '环宇天下', '环宇天下', '', '环宇天下', '1', '', '', '', '0', '1', '3', '110', '2017-02-07 21:49:00');
INSERT INTO `mmm_supplier` VALUES ('2', '老鼠假期1', '老鼠假期1', '老鼠假期1', '张三', '13545869875', '13545869875', '13545869875', '发给', '0', '0', '3', '1', '2017-01-04 16:28:04');
INSERT INTO `mmm_supplier` VALUES ('4', '梦幻假期', '梦幻假期', '', '张三', '1', '1', '1', '', '0', '1', '3', '110', '2017-02-07 21:51:43');

-- ----------------------------
-- Table structure for mmm_supplier_op
-- ----------------------------
DROP TABLE IF EXISTS `mmm_supplier_op`;
CREATE TABLE `mmm_supplier_op` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '供应商id',
  `name` varchar(36) NOT NULL DEFAULT '' COMMENT '供应商员工名字',
  `tel` varchar(36) NOT NULL DEFAULT '' COMMENT '座机',
  `phone` varchar(36) NOT NULL DEFAULT '' COMMENT '联系电话',
  `wx` varchar(36) NOT NULL DEFAULT '' COMMENT '微信号码',
  `qq` varchar(36) NOT NULL DEFAULT '' COMMENT 'QQ号码',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='供应商线路对应的OP操作人信息';

-- ----------------------------
-- Records of mmm_supplier_op
-- ----------------------------
INSERT INTO `mmm_supplier_op` VALUES ('1', '1', '李莉', '0755-89653245', '134', 'w', 'q', '打算2', '2016-12-27 11:51:14');
INSERT INTO `mmm_supplier_op` VALUES ('3', '1', '张飞', '0755-2', '189', 'ww', 'q', '打算？', '2016-12-27 11:57:43');
INSERT INTO `mmm_supplier_op` VALUES ('4', '2', '发发', '', '', '', '', '', '2017-01-04 16:28:24');
INSERT INTO `mmm_supplier_op` VALUES ('5', '2', '问问', '', '', '', '', '', '2017-01-04 16:28:41');

-- ----------------------------
-- Table structure for mmm_user
-- ----------------------------
DROP TABLE IF EXISTS `mmm_user`;
CREATE TABLE `mmm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 ;  0保密;  1男; 2女',
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `mobileverified` tinyint(1) DEFAULT '2' COMMENT '手机认证0未认证，1未激活，2已认证',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `emailverified` tinyint(1) DEFAULT '0' COMMENT '邮箱认证0未认证，1未激活，2已认证',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `photo` varchar(200) DEFAULT '' COMMENT '头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0禁用/1启用',
  `regtime` int(11) DEFAULT NULL COMMENT '注册时间',
  `regip` varchar(20) DEFAULT '' COMMENT '注册IP',
  `lastlogin` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `lastip` varchar(20) DEFAULT '' COMMENT '最后登录的ip',
  `updatetime` int(11) DEFAULT NULL COMMENT '最后修改数据的时间',
  `stopreason` varchar(200) DEFAULT '' COMMENT '停用理由',
  `stoptime` bigint(20) DEFAULT NULL COMMENT '停用时间',
  `noticetime` char(12) DEFAULT '',
  `from` tinyint(4) DEFAULT '0' COMMENT '来源：0-pc注册 ， 1-wap注册',
  `openid` varchar(120) DEFAULT '' COMMENT '微信id',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除 0 否 1 是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of mmm_user
-- ----------------------------
INSERT INTO `mmm_user` VALUES ('1', '马永珍', '', '0', '', '13425157494', '2', '', '0', null, '', '1', null, '', null, '', null, '', null, '', '0', '', '0');

-- ----------------------------
-- Table structure for mmm_web_info
-- ----------------------------
DROP TABLE IF EXISTS `mmm_web_info`;
CREATE TABLE `mmm_web_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `web_title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站描述',
  `web_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '网站搜索关键词',
  `pc_logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'PC端logo图',
  `mobile_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '移动端logo图',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名字',
  `company_addr` varchar(255) NOT NULL DEFAULT '' COMMENT '公司地址',
  `web_id` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `web_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系电话',
  `main_color` varchar(32) NOT NULL DEFAULT '' COMMENT '网站主色调',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mmm_web_info
-- ----------------------------
INSERT INTO `mmm_web_info` VALUES ('1', '旅游_旅游网_旅游线路_自驾游_旅行社_海外国际旅行社益田假日营业部', '出境旅游,国内旅游_周边自驾游,国际旅行社,放假去哪儿好玩,港澳台游,海外国际旅行社益田假日营业部', '/Public/Upload/image/58a6fdac8129f.jpg', '/Public/Upload/image/58a6fcec9474e.jpg', '深圳市海外国际旅行社有限公司益田假日世界营业部', '深圳市龙岗区中心城', '粤ICP-备133562', '0755-82222695', '#209de6');

-- ----------------------------
-- Table structure for travel_info
-- ----------------------------
DROP TABLE IF EXISTS `travel_info`;
CREATE TABLE `travel_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出游信息ID',
  `adminId` int(11) NOT NULL COMMENT '录入资料的管理员ID',
  `visitorType` tinyint(4) NOT NULL COMMENT '客人类型： 1-散客，2-包团',
  `lineType` tinyint(4) NOT NULL COMMENT '线路类型: 1-周边，2-国内，3-出境，4港澳台',
  `lineName` varchar(255) NOT NULL COMMENT '线路名称（价格）',
  `startDate` int(11) NOT NULL COMMENT '出游日期',
  `endDate` int(11) NOT NULL COMMENT '出游结束日期',
  `visitorNum` tinyint(4) NOT NULL COMMENT '出游人数',
  `guideCollection` decimal(10,2) NOT NULL COMMENT '导游代收款',
  `visitorNote` varchar(255) NOT NULL DEFAULT '0' COMMENT '出游备注',
  `deposit` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已付定金',
  `agency` varchar(32) NOT NULL COMMENT '地接社或者专线名称',
  `agencyLinkman` varchar(16) NOT NULL COMMENT '地接负责人',
  `agencyPhone` varchar(32) NOT NULL DEFAULT '0' COMMENT '地接联系电话',
  `orderCode` varchar(32) NOT NULL COMMENT '网站订单号，或者券号，或者验证码',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客人来源：1携程/2美团/3糯米/4窝窝/5点评/6去哪儿/7途牛/8拉手/9内部网站/10其它',
  `payType` tinyint(4) NOT NULL COMMENT '结算方式：1总部系统/2月结/3周结/4现结/5其它',
  `contractId` varchar(32) NOT NULL DEFAULT '0' COMMENT '合同号（针对上系统）',
  `systemId` varchar(32) NOT NULL DEFAULT '0' COMMENT '系统号',
  `receiptId` varchar(32) NOT NULL DEFAULT '0' COMMENT '收据号',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '内部备注',
  `time` int(11) NOT NULL COMMENT '登记时间',
  `insurance` float(6,2) NOT NULL COMMENT '保险金额',
  PRIMARY KEY (`id`),
  KEY `userId` (`adminId`) USING BTREE,
  KEY `startDate` (`startDate`,`endDate`) USING BTREE,
  KEY `lineName` (`lineName`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='出游信息登记表';

-- ----------------------------
-- Records of travel_info
-- ----------------------------
INSERT INTO `travel_info` VALUES ('14', '1', '1', '4', '清远', '1465142400', '1465228799', '4', '100.00', '出游备注4', '10.00', '地接名', '地接负责人', '444', '订单号4', '1', '2', '合同号4', '系统号4', '收据号4', '内部备注4', '1465290783', '16.00');
INSERT INTO `travel_info` VALUES ('4', '1', '2', '1', '清远', '1465142400', '1465228799', '3', '1000.00', '出游备注', '10.00', '地接名6', '地接负责人6', '666', '订单号6', '2', '3', '合同号6', '系统号6', '收据号6', '内部备注6', '1465290879', '15.00');
INSERT INTO `travel_info` VALUES ('13', '1', '1', '3', '泰国', '1464969600', '1465228799', '2', '100.00', '出游备注2', '200.00', '地接名2', '地接负责人2', '333', '订单号2', '3', '4', '合同号2', '系统号2', '收据号2', '内部备注2', '1465364154', '15.00');
INSERT INTO `travel_info` VALUES ('15', '1', '1', '3', '越南5天4晚', '1465142400', '1465574399', '2', '600.00', '有一个老人，需要签免责声明', '0.00', '美美假期', '地接负责人', '82222695', '订单号', '5', '4', '合同号', '系统号', '收据号', '内部备注', '1465359462', '12.60');
INSERT INTO `travel_info` VALUES ('16', '6', '1', '4', '香港纯玩一日游', '1465574400', '1465660799', '3', '30.00', '有一个70岁以上的老人需要签免责声明，2大1小', '0.00', '港岛假期', '', '', '', '4', '2', '', '', '', '小孩免费', '1465201485', '4.00');
INSERT INTO `travel_info` VALUES ('19', '4', '2', '1', '西冲一天', '1472659200', '1472731200', '30', '2000.00', '接人地点在南山区科技园', '1000.00', '无', '无', '无', '', '1', '4', '', '', '', '', '1472622141', '0.00');
INSERT INTO `travel_info` VALUES ('18', '4', '1', '1', '河源两天自由行', '1465574400', '1465747199', '2', '100.00', '1大1小', '0.00', '槎城', '肖小姐', '13689561245', '145269863', '7', '2', '', '', '收据号', '', '1465295227', '3.60');
INSERT INTO `travel_info` VALUES ('20', '4', '1', '2', '西藏5天4晚', '1471968000', '1472385600', '2', '1000.00', '', '0.00', '', '', '', '', '0', '0', '', '', '', '', '1472622624', '0.00');
INSERT INTO `travel_info` VALUES ('21', '4', '2', '1', '清远1天', '1472832000', '1472904000', '10', '1000.00', '', '0.00', '', '', '', '', '0', '0', '', '', '', '', '1472624509', '10.00');
INSERT INTO `travel_info` VALUES ('22', '1', '1', '1', '惠州2天', '1472659200', '1472817600', '2', '1000.00', '无', '1000.00', '惠州专线', '我', '', '12345678', '1', '2', '', '', '', '', '1472692672', '3.60');
INSERT INTO `travel_info` VALUES ('23', '1', '2', '3', '泰国6天', '1472659200', '1473163200', '8', '1000001.00', '无', '9999.99', '泰国专线', '', '', '', '10', '4', '', '', '', '', '1473142520', '100.00');
INSERT INTO `travel_info` VALUES ('24', '1', '1', '4', '香港1天', '1472745600', '1472817600', '1', '30.00', '', '0.00', '', '', '', '', '0', '0', '', '', '', '', '1472695236', '0.00');
INSERT INTO `travel_info` VALUES ('40', '1', '2', '1', '深圳一天', '1473264000', '1473336000', '25', '2000.00', '安排一个女导游', '1000.00', '', '', '', '', '2', '4', '', '', '', '', '1473133899', '25.00');
INSERT INTO `travel_info` VALUES ('39', '1', '1', '4', '港澳三天', '1473350400', '1473595200', '4', '90.00', '惹他', '0.00', '港澳专线', '同意', '热', '', '10', '2', '22', '33', '', '而要让体育', '1473132689', '12.00');
INSERT INTO `travel_info` VALUES ('38', '1', '1', '2', '桂林三天两晚', '1473177600', '1473422400', '3', '598.00', '其中一个人在广州上车，三人安排一间房', '0.00', '桂林专线', '', '', '', '0', '0', '', '', '', '', '1473131930', '6.00');
INSERT INTO `travel_info` VALUES ('37', '1', '1', '3', '日本一天', '1473350400', '1473422400', '1', '0.00', '', '0.00', '', '', '', '', '0', '0', '', '', '', '', '1472803631', '10.00');
INSERT INTO `travel_info` VALUES ('41', '1', '1', '2', '当的份上刚好', '1473177600', '1473336000', '2', '0.00', '', '0.00', '', '', '', '', '0', '0', '', '', '', '', '1473142378', '0.00');
INSERT INTO `travel_info` VALUES ('42', '1', '1', '1', '的规范化', '1473609600', '1474372800', '3', '0.00', '', '0.00', '', '', '', '', '0', '0', '', '', '', '', '1473142436', '0.00');
INSERT INTO `travel_info` VALUES ('43', '1', '1', '3', '韩国6天5晚-济州岛完美旅游', '1475251200', '1475755200', '3', '5000.35', '皇岗口岸早8:00点集合', '6000.45', '韩国专线', '李晓明', '13545679865', '1234569870', '1', '4', '', '', '100563', '', '1475199707', '30.60');

-- ----------------------------
-- Table structure for travel_member
-- ----------------------------
DROP TABLE IF EXISTS `travel_member`;
CREATE TABLE `travel_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出行人员表ID',
  `travelInfoId` int(11) NOT NULL COMMENT '出游信息表主ID',
  `ifLeader` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否领队：0不是，1是领队',
  `trueName` varchar(16) NOT NULL COMMENT '出游成员真实名字',
  `phone` varchar(32) NOT NULL DEFAULT '0' COMMENT '联系电话',
  `idNumber` varchar(32) NOT NULL COMMENT '证件号码：身份证号/护照号/通行证号',
  `musterAddr` varchar(255) NOT NULL DEFAULT '' COMMENT '集合地点时间',
  `birthDate` varchar(16) NOT NULL DEFAULT '' COMMENT '出生年-月-日',
  `birthAddr` varchar(16) NOT NULL DEFAULT '' COMMENT '出生地',
  `signAddr` varchar(16) NOT NULL DEFAULT '' COMMENT '签发地',
  `payPrice` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '收客价',
  `settlementPrice` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '网站结算价格',
  `agencyPrice` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '地接结算价格',
  PRIMARY KEY (`id`),
  KEY `travelInfoId` (`travelInfoId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出行人员表';

-- ----------------------------
-- Records of travel_member
-- ----------------------------
INSERT INTO `travel_member` VALUES ('8', '14', '1', '赵大燕', '321', '452512197502159623', '集合地点4', '2009-06-05', '出生地', '签发地', '300.00', '280.00', '250.00');
INSERT INTO `travel_member` VALUES ('2', '4', '1', '王三和', '666', '666', '集合地点', '0', '', '', '100.00', '80.00', '50.00');
INSERT INTO `travel_member` VALUES ('18', '14', '0', '赵晓燕', '13623569874', '254521198633235698', '深大北门', '1985-06-07', '湖南', '湖南', '230.00', '200.00', '150.00');
INSERT INTO `travel_member` VALUES ('6', '13', '1', '王五', '13945698512', '142325198632541245', '深大北门', '', '', '', '500.00', '400.00', '350.00');
INSERT INTO `travel_member` VALUES ('10', '15', '1', '赵六', '13322695478', '142325198811237957', '深大北门', '', '', '', '2600.00', '2500.00', '2200.00');
INSERT INTO `travel_member` VALUES ('11', '15', '0', '赵琪', '13425157494', '142515984533268745', '深大北门', '', '', '', '2600.00', '2500.00', '2200.00');
INSERT INTO `travel_member` VALUES ('12', '16', '1', '刘德华', '13752145684', 'W98653254', '皇岗口岸', '1986-06-04', '黑龙江', '黑龙江', '80.00', '80.00', '50.00');
INSERT INTO `travel_member` VALUES ('13', '16', '0', '刘德光', '13452157495', 'W98653252', '皇岗口岸', '1986-06-02', '广东', '广东', '80.00', '80.00', '50.00');
INSERT INTO `travel_member` VALUES ('14', '16', '0', '刘小德', '', 'W98653253', '皇岗口岸', '1986-06-12', '广东', '广东', '0.00', '0.00', '0.00');
INSERT INTO `travel_member` VALUES ('15', '14', '0', '赵燕', '13425157494', '142325198604257598', '深大北门', '2009-06-09', '山东', '山东', '200.00', '180.00', '150.00');
INSERT INTO `travel_member` VALUES ('16', '4', '0', '王小飞', '13548752546', '142586198878524259', '上海宾馆', '', '', '', '280.00', '260.00', '200.00');
INSERT INTO `travel_member` VALUES ('17', '13', '0', '赵七', '13856475241', '241574986323568957', '深大北门', '', '', '', '200.00', '190.00', '150.00');
INSERT INTO `travel_member` VALUES ('19', '4', '0', '王大飞', '13525457894', '452585198544562598', '上海宾馆', '', '', '', '300.00', '270.00', '210.00');
INSERT INTO `travel_member` VALUES ('20', '14', '0', '刘飞', '13523251579', 'w23568985', '皇岗口岸', '1995-05-29', '湖南', '湖南', '230.00', '200.00', '150.00');
INSERT INTO `travel_member` VALUES ('21', '18', '1', '陈泽峰', '13452157494', '132542198644563258', '深大北门', '', '', '', '358.00', '328.00', '280.00');
INSERT INTO `travel_member` VALUES ('22', '18', '0', '陈晓丽', '13652468957', '132542198644563258', '深大北门', '', '', '', '358.00', '328.00', '280.00');
INSERT INTO `travel_member` VALUES ('23', '19', '1', '张三', '13425157494', '无', '无', '', '', '', '10.00', '10.00', '10.00');
INSERT INTO `travel_member` VALUES ('24', '20', '1', '李四', '13425157494', '12', '深圳', '', '', '', '1000.00', '900.00', '800.00');
INSERT INTO `travel_member` VALUES ('25', '20', '0', '赵六', '13425157493', '12', '深圳', '', '', '', '1000.00', '900.00', '800.00');
INSERT INTO `travel_member` VALUES ('26', '21', '1', '张超', '123', '1', '布吉', '', '', '', '2000.00', '1900.00', '1500.00');
INSERT INTO `travel_member` VALUES ('27', '22', '1', '1', '1', '1', '上海宾馆8:00', '', '', '', '100.00', '90.00', '50.00');
INSERT INTO `travel_member` VALUES ('28', '22', '0', '2', '2', '2', '上海宾馆8:00', '', '', '', '100.00', '90.00', '50.00');
INSERT INTO `travel_member` VALUES ('29', '23', '1', '1', '1', '1', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('30', '23', '0', '2', '2', '2', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('31', '23', '0', '3', '3', '3', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('32', '23', '0', '4', '4', '4', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('33', '23', '0', '5', '5', '5', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('34', '23', '0', '6', '6', '6', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('35', '23', '0', '7', '7', '7', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('36', '23', '0', '8', '8', '8', '深圳机场', '', '', '', '3000.00', '2800.00', '2600.00');
INSERT INTO `travel_member` VALUES ('62', '43', '1', '刘阿萨', '13565459876', '123425456977896542', '皇岗口岸早8:00点集合', '', '', '', '5500.00', '5300.00', '5000.00');
INSERT INTO `travel_member` VALUES ('39', '24', '1', '阿萨德刚', '1', '1', '皇岗口岸', '1', '1', '1', '100.00', '90.00', '50.00');
INSERT INTO `travel_member` VALUES ('51', '38', '0', '李四', '13452159687', '153265498711235987', '深大北门13:00', '', '', '', '398.00', '368.00', '320.00');
INSERT INTO `travel_member` VALUES ('50', '38', '1', '张三', '13452159687', '153265498711235987', '深大北门13:00', '', '', '', '398.00', '368.00', '320.00');
INSERT INTO `travel_member` VALUES ('47', '37', '1', '豆腐干', '123', '5', '豆腐干', '', '', '', '1000.00', '850.00', '700.00');
INSERT INTO `travel_member` VALUES ('52', '38', '0', '王五', '13452159687', '153265498711235987', '深大北门13:00', '', '', '', '398.00', '368.00', '320.00');
INSERT INTO `travel_member` VALUES ('53', '39', '1', '第一', '1', '1', '上海宾馆8:00', '1', '1', '1', '100.00', '100.00', '50.00');
INSERT INTO `travel_member` VALUES ('54', '39', '0', '第二', '2', '2', '上海宾馆9:00', '2', '2', '2', '100.00', '100.00', '50.00');
INSERT INTO `travel_member` VALUES ('55', '39', '0', '第6', '', '', '', '', '', '', '200.00', '180.00', '150.00');
INSERT INTO `travel_member` VALUES ('58', '40', '1', '李丽', '13326536987', '123', '大师傅', '', '', '', '5000.00', '5000.00', '4000.00');
INSERT INTO `travel_member` VALUES ('57', '39', '0', '第7', '', '', '', '', '', '', '300.00', '270.00', '240.00');
INSERT INTO `travel_member` VALUES ('59', '41', '1', '规范', '发货', '', '', '', '', '', '0.00', '0.00', '0.00');
INSERT INTO `travel_member` VALUES ('60', '41', '0', ' 刚好', '的 ', '', '', '', '', '', '0.00', '0.00', '0.00');
INSERT INTO `travel_member` VALUES ('61', '42', '1', '地方 ', ' 刚好', '挺好用', '', '', '', '', '0.00', '0.00', '0.00');
INSERT INTO `travel_member` VALUES ('63', '43', '0', '黄小东', '654321', '123425456977896543', '皇岗口岸早8:00点集合', '', '', '', '5500.00', '5300.00', '5000.00');
INSERT INTO `travel_member` VALUES ('64', '43', '0', '这新秩序', '987', '123425456977896544', '皇岗口岸早8:00点集合', '', '', '', '5500.00', '5300.00', '5000.00');
