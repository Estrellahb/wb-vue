-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: white_jotter
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anime`
--

DROP TABLE IF EXISTS `anime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_cn` varchar(255) NOT NULL,
  `name_jp` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `info` varchar(1000) NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name_cn` (`name_cn`,`name_jp`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anime`
--

LOCK TABLES `anime` WRITE;
/*!40000 ALTER TABLE `anime` DISABLE KEYS */;
INSERT INTO `anime` VALUES (1,'GIRLS BAND CRY','ガールズバンドクライ',4.5,'番剧简介：高中二年级时退学，独自一人以上大学为目标前往东京的主角。 被朋友背叛不知道该怎么办的少女。 被父母抛弃，在大城市中独自打工维持生计的女孩。 这个世界总是背叛我们。 什么事情都不会按照我们的意愿发展。 但是，因为我们有热爱着的事物。 因为我们相信有属于自己的容身之处。 所以、高歌着。','连载中'),(2,'摇曳露营S3','ゆるキャンs3',4.1,'抚子、凛、千明、葵和惠那，在伊豆时体验到了团体露营的乐趣。在这之后，对露营热情高涨的五人，在山梨和静冈等地继续享受各自的户外活动。','连载中'),(3,'为美好的世界献上祝福S3','この素晴らしい世界に祝福をs3',4.3,'主要讲述了男主角佐藤和真为解救一名将被卷入交通事故的女高中生，光荣赴死，死后遇见女神阿库娅，得知某个世界被笼罩在魔王的黑暗阴影下，民不聊生，便带领阿库娅前往异世界，企图杀死魔王，争求解放。','连载中'),(4,'孤独摇滚','ぼっち・ざ・ろっく',4.8,'作为网络吉他手“Guitar Hero”而广受好评的后藤一里，在现实中却是个什么都不会的沟通障碍者。一里有着组建乐队的梦想，但因为不敢向人主动搭话而一直没有成功，直到一天在公园中被伊地知虹夏发现并邀请进入缺少吉他手的“结束乐队”。可是，完全没有和他人合作经历的一里，在人前完全发挥不出原本的实力。','已完结'),(5,'轻音少女','けいおん',4.9,'新学年开始，樱丘高中轻音部因原有部员全部毕业离校而无法达到部员4人的最低人数。轻音部新成员只有秋山澪和田井中律。温柔可爱的千金大小姐琴吹䌷因觉得田井中律及秋山澪的互动很有趣而入社；平泽唯在阴差阳错的情况下把“轻音”当作“轻松的音乐”，又想起小时候玩响板得到老师表扬，所以申请入部。于是，便有了贝斯手秋山澪、吉他手平泽唯、鼓手田井中律及键盘手琴吹䌷。后来新成员中野梓加入轻音部，成为第二名吉他手。','已完结'),(6,'少女歌剧','レヴュースタァライト',4.2,'舞台少女——以未来的舞台女演员为目标，光芒四溢的少女们。某天，她们收到了一封邮件—“请去取得吧，你所希望的那颗星“ 为了摘取闪耀的星星，而聚集于选拔会场的9名舞台少女。追求光芒的心意、执着、命运——在舞台上交错。现在，Revue的帷幕升起了。','已完结'),(7,'星际牛仔','カウボーイビバップ',4.7,'史派克（Spike）和杰特（Jet）是驾驶飞船Bebop号在宇宙中以捉拿逃犯获取奖金为生的赏金猎人。两人在星际间的旅程中，结识了身负巨债、嗜财如命的美女菲（Faye）和电脑神童艾德（Ed），并收养了拥有高智商的数据狗爱因（Ein）。从此，四人一狗游荡在广阔之宇宙之中，在自己与他人的生活中经历着种种悲欢离合，也寻找着各自的过去。','已完结');
/*!40000 ALTER TABLE `anime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `date` varchar(20) DEFAULT '',
  `press` varchar(255) DEFAULT '',
  `abs` varchar(255) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_category_on_cid` (`cid`),
  CONSTRAINT `fk_book_category_on_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (2,'https://i.loli.net/2019/04/10/5cada7e73d601.jpg','三体','刘慈欣',' 2008-1','重庆出版社','文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\r\n\r\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……\r\n\r\n人类的末日悄然来临。',2),(32,'https://i.loli.net/2019/04/10/5cada99bd8ca5.jpg','叙事的虚构性','[美] 海登·怀特 ','2019-3','南京大学出版社','海登•怀特被誉为人类伟大的思想家之一。从1973年出版具有里程碑意义的专著《元史学》以来，怀特的作品对于历史学、文学研究、人类学、哲学、艺术史、电影传媒研究等将叙事学作为关注焦点的学科而言意义非凡。\n\n本书由罗伯特•多兰作序，他巧妙地将怀特重要但难得一见的文章汇集成册，研究探讨他关于历史书写和叙事的革命性理论。怀特的这些文章大多采用论文体，内容涉及多位思想家，探讨诸多主题，文笔犀利，语言优美。\n\n《叙事的虚构性》追溯怀特重要思想的演变轨迹，是历史编纂学者和学习者、历史理论和文学研究学者们的重要读物。',3),(37,'https://i.loli.net/2019/04/10/5cada8986e13a.jpg','奢侈与逸乐','[英]马克辛·伯格','2019-3','中国工人出版社','本书探讨了十八世纪英国新式、时尚的消费品的发明、制造和购买。',3),(38,'https://i.loli.net/2019/04/10/5cada8b8a3a17.jpg','忧伤动物','[德]莫妮卡·马龙 ','2019-4','漓江出版社','“忧伤动物”(animal triste)这个词组取自一句最早可以追溯到亚里士多德时代的拉丁语名言，即“欢爱后，每个动物都忧伤不已”（Post coitum omne animal triste est）。无疑，这部冠以如此标题的小说让人有不祥的预感并暗示着宿命的思想。小说的女主人公是位近乎百岁的老人。在多年前有意斩断了与外界的一切联系之后，在她的后半生里，她唯一能做的就是或躺或坐在“印着鲜红、艳绿和深紫色的大花”、让人想起“食肉植物的花朵”的床单上，追忆几十年前她和自己...',1),(54,'https://i.loli.net/2019/04/10/5cada9d9d23a6.jpg','爱界','[英] 费伊·韦尔登 ','2019-3-1','人民文学出版社','去不去爱，爱的界限何在，一直是普拉克西丝的人生课题。\n\n年迈的她独自待在肮脏而昏暗的地下室里，想写回忆录，可她该写些什么呢？是写父母未婚同居生下了她，她还年幼天真无邪时，母女就遭父亲抛弃？还是写她曾经或是主动或是被动地成了未婚同居者、妻子、情人、母亲、后母？还是写她两年的牢狱生活？她想描绘二十世纪女性的众生相，想记录女性群体在情感、灵魂和思想方面所处的三重困境，想道出女性之间的大爱如何铸成姐妹之谊。',3),(55,'https://i.loli.net/2019/04/10/5cada824c7119.jpg','密室中的旅行','[美] 保罗·奥斯特 ','2019-3','九州出版社','一旦被抛进这个世界，我们就永远不会消失，即使造物者已经死去。\n\n.\n\n布兰克先生发现自己被囚禁在一个陌生的房间里，对过去的身份和经历一无所知。桌上有四叠六英寸厚的文稿，其中有一份未完待续的囚犯自述；还有一叠似曾相识的照片，照片中的人物将逐一登场。他续写了那个囚犯的故事，却发现自己正在经历的一切也早已被记录在文稿中……',1),(59,'https://i.loli.net/2019/04/10/5cada87fd5c72.jpg','基本穿搭','[日]大山旬 ','2019-3','四川人民出版社','对穿衣搭配感到不耐烦，认为时尚很麻烦，穿什么都可以或者对衣服有着自己的想法但不够自信，本书就是为这样的人而准备的穿衣指南。不需要追随瞬息万变的时尚潮流，也不需要烦恼色彩搭配，只要掌握最低限度的知识和备齐常规单品，谁都能完成清爽得体的 80分搭配。',4),(60,'https://i.loli.net/2019/04/10/5cada976927da.jpg','冒牌人生','陈思安','2019-4','四川文艺出版社','《冒牌人生》收录了十篇短篇小说。十个故事分别以城市中的怪人为主角，他们默默无闻地生存在城市主流生活的边缘地带：或是等待手术的性别认同障碍者，或是武艺高强而深藏不露的夜市摊主，或是卧底追凶的底层保安，或是甘于...',1),(61,'https://i.loli.net/2019/04/10/5cada9202d970.jpg','战争哀歌','[越]保宁 ','2019-4','湖南文艺出版社','《战争哀歌》超越了战争，战争是它的背景，它的内核是关于逝去的青春，关于美和伤痛！\n\n一场突如其来的战争打碎了阿坚和阿芳这对年轻情侣的生活，在血肉横飞的战争中，主人公阿坚成了幸存者，但战争带来的伤痛还远远没有平息。那些经历仍旧萦绕在阿坚的生活之中，被战争毁灭的不仅 仅是阿坚， 阿芳也遭遇了难以想象的梦魇。时间越长，阿坚越觉得自己不是活着，而是被困在这人世间。',1),(62,'https://i.loli.net/2019/04/10/5cada9c852298.jpg','胡椒的全球史','[美] 玛乔丽·谢弗 ','2019-3','上海三联出版社','看似不起眼的胡椒，却是家家餐桌必备。在中世纪时，更是欧洲达官显贵们的最爱、财富与地位的象征。黑胡椒原产于印度，距离欧洲各港口有十万八千里之远，取之向来不易。商人们对其供应来源不遗余力的追寻，成为世界史上一股重要的推动力量，促成全球贸易的兴起，重新划定了世界经济版图。',2),(63,'https://i.loli.net/2019/04/10/5cada962c287c.jpg','与病对话','胡冰霜','2019-3-31','北京联合出版公司','一部融合科普性与趣味性、兼具心理学与哲学意味的医学散文。\n\n一位满怀仁心的资深医者对几十年行医生涯的回望与省思。\n\n全书以真实的病例和鲜活的故事贯穿始终，作者从一位全科医生、心理学者的视角观察、解读疾病与患者身心之关系，厘清大众对诸多常见疾病的误解...',1),(64,'https://i.loli.net/2019/04/10/5cada858e6019.jpg','上帝笑了99次','[英]彼得·凯弗','2019-2','北京联合出版公司','一只美洲羊驼会坠入爱河吗？机器人能变成人吗？怎样才能不赢得公主青睐？人类一思考，上帝就发笑。在99个奇妙、怪诞、滑稽的问题背后，其实是99个烧脑的哲学、道德、法律领域的经典悖论，也是99道极富挑战性的大思考测试。本书内容覆盖了大多数常见哲学话题，包括形而上学、逻辑学、伦理学、语言哲学、政治哲学、自我认知、人际关系、美学、存在主义等，还配有20多幅漫画插图。在锻炼思维之外，本书也能帮我们建立个性化的哲学知识体系。',3),(65,'https://i.loli.net/2019/04/10/5cada8e1aa892.jpg','互联网算法','[美] 菲斯曼等 ','2019-4','江西人民出版社','只要你租过房子、上网买过东西、自己经营过企业，那么你就处在商业变革的前线。在这场变革中，亚马逊、谷歌、优步等不同以往的企业取得了史无前例的成功，而促成这场变革的不只是科技进步，还有经济学思想。\n\n在这本趣味横生的书中，我们会看到，经济思想的革命远比科技革命更宏大。从谷歌广告的算法，到网上购物规避欺诈，都要依靠经济学家建立的经济模型，甚至连互联网公司...',6),(66,'https://i.loli.net/2019/04/10/5cada9ec514c9.jpg','七侯笔录','马伯庸','2019-4-15','湖南文艺出版社','一个关于文化的离奇故事，一段关于文人的壮丽传说。\n\n几千年来，每一位风华绝代的文人墨客辞世之时，都会让自己的灵魂寄寓在一管毛笔之中。他们身躯虽去，才华永存，这些伟大的精神凝为性情不一的笔灵，深藏于世间，只为一句“不教天下才情付诸东流”的誓言。其中最伟大的七位古人，他们所凝聚的七管笔灵，被称为“管城七侯”。\n\n一位不学无术的现代少年，无意中邂逅了李白的青莲笔，命运就此与千年之前的诗仙交织一处，并为他开启了一个叫作笔冢的神秘世界。',3),(67,'https://i.loli.net/2019/04/10/5cada9870c2ab.jpg','中心与边缘','[美] 希尔斯','2019-3','译林出版社','美国著名社会学家爱德华·希尔斯的主要研究成果包括他对“克里斯玛”、“中心”和“边缘”等概念的解释，以及他对“大众社会”一词的修正，这些研究对分析政治和文化领导力以及社会凝聚力具有重要价值。本书对希尔斯数十载社会理论研究进行了全面而详细的总结，为解释与探究当代社会的结构与变化提供了极具科学性的参考依据。',3),(68,'https://i.loli.net/2019/04/10/5cad643643d4c.jpg','水浒群星闪耀时','李黎','2019-4','上海文艺出版社','本书以众所周知的梁山英雄为写作对象，重点书写其上山后、招安前的日常生活，涉及他们的喜怒哀乐、同类中人、乡愁怀旧、未来憧憬、命运追问等。书中涉及宋江、武松、鲁智深、李俊、燕青等等耳熟能详的人物而显得有些“改编”与水浒研究的意味，但鉴于所有人物皆为虚构，本书稿的内容是虚构之上的虚构，旨在宏大叙事的语境下突出个人的细微之处和命运感。',1),(69,'https://i.loli.net/2019/04/10/5cad63931ce27.jpg','谋杀狄更斯','[美] 丹·西蒙斯 ','2019-4','上海文艺出版社','“狄更斯的那场意外灾难发生在1865年6月9日，那列搭载他的成功、平静、理智、手稿与情妇的火车一路飞驰，迎向铁道上的裂隙，突然触目惊心地坠落了。”',1),(70,'http://localhost:8443/api/file/k09g2r.png','像艺术家一样思考','[英] 威尔·贡培兹','2019-4','湖南美术出版社','归纳成就艺术大师的 10 个关键词\n\n揭示大师们的创作秘辛\n\n凝聚 BBC 艺术频道主编威尔·贡培兹职业生涯的所见、所知、所想\n\n·\n\n威尔·贡培兹是你能遇到的最好的老师\n\n——《卫报》',3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'文学'),(2,'流行'),(3,'文化'),(4,'生活'),(5,'经管'),(6,'科技');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` char(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,NULL,'zeze3709'),(4,'luqiu','zeze3709'),(5,'qwe','zeze3709'),(6,'rty','qwe'),(7,'wer','wer'),(8,'sf','da'),(9,'aada','123'),(10,'ada','dad'),(11,'sfs','123'),(12,'ghj','123'),(13,'fsdasd','123'),(14,'123','123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `comment` text,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES (1,'Google','https://www.google.com','faGoogle','搜索神器','搜索引擎'),(2,'Yandex','https://yandex.com/','faCat','毛子的搜索引擎，搜图特好用','搜索引擎'),(3,'GitHub','https://github.com','faGithub','程序员的交友网站','开源社区'),(4,'Facebook','https://www.facebook.com','faFacebook','社交网站','社交网络'),(5,'VCB','https://vcb-s.com','faCat','收藏级压制组','压制与字幕组'),(6,'Anime字幕论坛','https://bbs.acgrip.com/','faCat','动画字幕网站','压制与字幕组'),(7,'诸神字幕组','https://subs.kamigami.org','faCat','字幕组','压制与字幕组'),(8,'幻樱字幕组','http://www.hysub.net/?ref=acgdh.cc','faCat','番剧下载','压制与字幕组'),(9,'SubHD','https://subhd.tv/','faCat','字幕下载','压制与字幕组'),(10,'萌番组','https://bangumi.moe','faCat','番剧下载','番剧下载'),(11,'末日動漫資源庫','https://share.acgnx.se/','faCat','番剧下载','番剧下载'),(12,'Nyaa','https://nyaa.si/','faCat','Nyaa是一个侧重于东亚多媒体资源的BitTorrent站点。要科技','番剧下载'),(13,'蜜柑计划','https://mikanani.me/','faCat','番剧订阅下载','番剧下载'),(14,'动漫花园','https://share.dmhy.org/','faCat','番剧下载','番剧下载'),(15,'天使动漫论坛','https://www.tsdm39.com/forum.php','faCat','里面有很多bd自购大佬','番剧下载'),(16,'ACGRIP','https://acgrip.art/','faCat','番剧下载','番剧下载'),(17,'AGE动漫','https://www.agedm.org/','faCat','在线视频网站','在线番剧网站'),(18,'樱花动漫','http://www.iyinghua.io/','faCat','在线视频网站','在线番剧网站'),(19,'bangumi','https://bgm.tv/','faCat','二次元社区','在线番剧网站'),(20,'YuC AnimeList','https://yuc.wiki/','faCat','番剧更新讯息','在线番剧网站'),(21,'番剧图片搜索引擎','https://trace.moe/','faCat','图片定位视频地址','工具类'),(22,'free download','https://www.freedownloadmanager.org/zh/','faCat','下载工具，兼容浏览器下载','工具类'),(23,'图吧工具箱','https://www.tbtool.cn/','faCat','计算机硬件检测实用工具','工具类'),(24,'qbittonrrent','https://www.qbittorrent.org/download','faCat','免费bt磁力下载工具 便携版本：https://www.52pojie.cn/thread-1851155-1-1.html','工具类'),(25,'7-zip','https://www.7-zip.org/download.html','faCat','占用空间最小的解压与压缩软件','工具类');
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 11:24:22
