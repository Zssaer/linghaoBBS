
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `apassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `atime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '2018-04-12 01:33:06');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `titles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子标题',
  `fcontent` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子内容',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子图片',
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属板块名字',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发帖时间',
  `userid` int(11) NOT NULL COMMENT '发帖人id',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发帖人姓名',
  `status` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '帖子审核状态(0为待审核，1为通过审核，2为未通过审核，默认为0)',
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发帖表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (40, 'java集合框架', 'Map\n映射表（也称为关联数组）的基本思想是它维护的是键-值（对）关联，因此你可以使用键来查找值。标准的java类库中包含了Map的几种基本实现。\nHashMap\nMap基于散列表的实现（它实现了HashTable）。插入和查询“键值对”的开销是固定的。可以通过构造器设置容量和负载因子。以调整容器的性能。\nTreeMap\n基于红黑树的实现。查看“键”或者“键值对”时，它们会被排序（次序由Comparable或Comparator决定）。TreeMap的特点在于，所得到的结果是经过排序的。TreeMap是唯一的带有subMap()方法的Map，它可以返回一个子树。', '387c3a86-fd76-48ec-b16a-91a2adc127f54be57d50d7eb0ef7bac518d2e417c5b0.jpg', 'java', '2019-05-08 19:22:49', 26, 'LL', 00000000001);
INSERT INTO `article` VALUES (45, 'FACEBOOK 的系统架构', 'Web 前端是由 PHP 写的。Facebook 的 HipHop [1] 会把PHP转成 C++ 并用 g++编译，这样就可以为模板和Web逻贺业务层提供高的性能。\r\n业务逻辑以Service的形式存在，其使用Thrift [2]。这些Service根据需求的不同由PHP，C++或Java实现（也可以用到了其它的一些语言……）\r\n用Java写的Services没有用到任何一个企业级的应用服务器，但用到了Facebook自己的定制的应用服务器。看上去好像是重新发明轮子，但是这些Services只被暴露给Thrift使用（绝大所数是这样），Tomcat太重量级了，即使是Jetty也可能太过了点，其附加值对Facebook所需要的没有意义。\r\n持久化由MySQL, Memcached [3], Facebook 的 Cassandra [4], Hadoop 的 HBase [5] 完成。Memcached 使用了MySQL的内存Cache。Facebook 工程师承认他们的Cassandra 使用正在减少，因为他们更喜欢HBase，因为它的更简单的一致性模型，以到其MapReduce能力。', 'b644fea0-862b-44ff-b335-5c7f798e6ce22017_9_1_16_57_31_id7_814f253234a906a1d422f3c4fe832fa1.jpg', '架构', '2019-05-13 22:47:02', 29, '古天乐', 00000000001);
INSERT INTO `article` VALUES (66, '新配图-修改', '测试hdiohaoshvh mklcmksadmnfkmnasknKNNIKNIKN就没看了奇偶及农我害你和你你可能打击是的纳税方面 看了大家四点上课了能打卡啥都没你看那是多难看到哪门口打死你看吧的奶爸开了的哪款是你的', '3219b13d-9f25-4054-b1d7-73470a8aa870ae1ad9585f84e52765599dc06c9f7891.jpg', '人工智能', '2019-05-08 19:24:06', 28, '陈意涵', 00000000001);

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注表id',
  `userid` int(11) NOT NULL COMMENT '主动关注者的id',
  `beuserid` int(11) NOT NULL COMMENT '被动关注者的id',
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `beuserid`(`beuserid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES (110, 26, 28);
INSERT INTO `attention` VALUES (111, 26, 29);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表id',
  `userid` int(11) NOT NULL COMMENT '收藏者id',
  `fid` int(11) NOT NULL COMMENT '被收藏帖子id',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (76, 26, 45);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `pcontent` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `userid` int(11) NOT NULL COMMENT '评论者',
  `fid` int(11) NOT NULL COMMENT '被评论帖子id',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (32, '非常感谢！写的很好呢，收藏了！', 26, 40, '2018-04-17 21:37:31');
INSERT INTO `comment` VALUES (40, 'Map 映射表（也称为关联数组）的基本思想是它维护的是键-值（对）关联，因此你可以使用键来查找值。', 29, 40, '2018-06-03 23:08:44');
INSERT INTO `comment` VALUES (54, '我也是程序猿，每天整得脑壳疼，出了这碗饭感觉其他的都莫法???', 26, 57, '2018-10-19 12:18:36');
INSERT INTO `comment` VALUES (160, '个地方郭德纲的', 28, 40, '2019-04-21 14:30:52');
INSERT INTO `comment` VALUES (164, '来了类似', 28, 45, '2019-04-24 00:23:23');
INSERT INTO `comment` VALUES (171, '<a href=\"www.baidu.com\">连接测试</a>', 28, 66, '2019-04-24 00:43:57');
INSERT INTO `comment` VALUES (172, '啦啦啦', 28, 45, '2019-04-30 00:22:26');
INSERT INTO `comment` VALUES (174, '熱熱', 28, 57, '2019-04-30 11:31:27');
INSERT INTO `comment` VALUES (175, '撒旦画嘎哈说过的话管哈', 26, 66, '2019-05-08 19:33:22');

-- ----------------------------
-- Table structure for plate
-- ----------------------------
DROP TABLE IF EXISTS `plate`;
CREATE TABLE `plate`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '板块名字',
  `btime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '板块创建时间',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '板块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plate
-- ----------------------------
INSERT INTO `plate` VALUES (1, 'java', '2020-03-30 18:08:51');
INSERT INTO `plate` VALUES (2, 'C++', '2020-03-30 18:55:29');
INSERT INTO `plate` VALUES (3, 'Python', '2020-04-17 20:00:42');
INSERT INTO `plate` VALUES (19, '人工智能', '2020-04-17 20:01:55');
INSERT INTO `plate` VALUES (20, '移动开发', '2020-04-17 20:03:56');
INSERT INTO `plate` VALUES (21, '程序人生', '2020-04-17 20:04:25');
INSERT INTO `plate` VALUES (22, '前端', '2020-7-17 20:05:00');
INSERT INTO `plate` VALUES (23, '运维', '2020-07-17 20:05:05');
INSERT INTO `plate` VALUES (24, '架构', '2020-07-17 20:05:10');
INSERT INTO `plate` VALUES (26, 'github', '2020-07-04 10:09:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户email',
  `family` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户住址',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人简介',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (26, 'LL', 20, '男', '123', '641348448@qq.com', '四川省', '克己复礼，始于兴趣，勤于专研。', '2018-10-19 12:12:27');
INSERT INTO `user` VALUES (28, '陈K', 48, '男', '123', '6755656565@qq.com', '中国台湾', '元气女神', '2019-04-24 00:36:16');
INSERT INTO `user` VALUES (29, '古天乐', 48, '男', '888999', 'maliangnansheng@gmail.com', '中国香港', '无', '2018-06-03 22:58:12');

-- ----------------------------
-- Table structure for via
-- ----------------------------
DROP TABLE IF EXISTS `via`;
CREATE TABLE `via`  (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '头像表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of via
-- ----------------------------
INSERT INTO `via` VALUES (26, 'a9666fef-d613-4374-89ac-855a0158836d1517883884441.jpg');
INSERT INTO `via` VALUES (28, 'e70f656b-596e-444e-8c93-a1fa59f6bff4156e36861bcbe7ccd83b9bada2e99322.jpg');
INSERT INTO `via` VALUES (29, 'd4981200-aded-4c66-9731-c15607a0de66TIM截图20180901103719.png');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `VisitID` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问记录编号',
  `VisitURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问页地址',
  `VisitIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者ip',
  `VisitCountry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者所在国家',
  `VisitProvince` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者省份',
  `VisitCity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者城市',
  `VisitHostName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机名',
  `VisitOS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者操作系统',
  `VisitTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  PRIMARY KEY (`VisitID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1498 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问记录表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
