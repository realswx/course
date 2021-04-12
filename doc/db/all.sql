USE course_online;

/*Table structure for table `test` */
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
    `id` char(8) NOT NULL COMMENT 'id',
    `name` varchar(50) NOT NULL COMMENT '名称',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试';

/*Data for the table `test` */
insert  into `test`(`id`,`name`) values
(1,'test1'),
(2,'test2');


/*Table structure for table `chapter` */
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
    `id` char(8) NOT NULL COMMENT 'ID',
    `course_id` char(8) COMMENT '课程ID',
    `name` varchar(50) COMMENT '名称',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='大章';

/*Data for the table `chapter` */
insert  into `chapter`(`id`,`course_id`, `name`) values
('00000001', '00000001', 'test1'),
('00000002', '00000002', 'test2'),
('00000003', '00000003', '大章3'),
('00000004', '00000004', '大章4'),
('00000005', '00000005', '大章5'),
('00000006', '00000006', '大章6'),
('00000007', '00000007', '大章7'),
('00000008', '00000008', '大章8'),
('00000009', '00000009', '大章9'),
('00000010', '00000010', '大章10'),
('00000011', '00000011', '大章11'),
('00000012', '00000012', '大章12'),
('00000013', '00000013', '大章13'),
('00000014', '00000014', '大章14'),
('00000015', '00000015', '大章15'),
('00000016', '00000016', '大章16'),
('00000017', '00000017', '大章17');


/*Table structure for table `section` */
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
    `id` char(8) NOT NULL DEFAULT '' COMMENT 'ID',
    `title` varchar(50) NOT NULL COMMENT '名称',
    `course_id` char(8) COMMENT '课程ID|course.id',
    `chapter_id` char(8) COMMENT '大章|chapter.id',
    `video` varchar(200) COMMENT '视频',
    `time` int COMMENT '时长|单位秒',
    `charge` char(1) COMMENT '收费|C 收费；F 免费',
    `sort` int COMMENT '顺序',
    `created_at` DATETIME(3) COMMENT '创建时间',
    `updated_at` DATETIME(3) COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小节';
/*Data for the table `section` */
insert  into `section`(`id`,`title`,`course_id`,`chapter_id`,`video`,`time`,`charge`,`sort`,`created_at`,`updated_at`) values
('00000001', '测试小节01', '00000001', '00000000', '', 500, 'F', 1, now(), now());


/*Table structure for table `course` */
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
    `id` char(8) NOT NULL DEFAULT '' COMMENT 'ID',
    `name` varchar(50) NOT NULL COMMENT '名称',
    `summary` varchar(2000) COMMENT '概述',
    `time` int DEFAULT 0 COMMENT '时长|单位秒',
    `price` decimal(8,2) DEFAULT 0.00 COMMENT '价格（元）',
    `image` varchar(100) COMMENT '封面',
    `level` char(1) COMMENT '级别|ONE("1", "初级"),TWO("2","中级"),THREE("3","高级")',
    `charge` char(1) COMMENT '收费|CHARGE("C", "收费"),FREE("F","免费")',
    `status` char(1) COMMENT '状态|PUBLISH("P", "发布"),DRAFT("D","草稿")',
    `enroll` integer DEFAULT 0 COMMENT '报名数',
    `sort` int COMMENT '顺序',
    `created_at` DATETIME(3) COMMENT '创建时间',
    `updated_at` DATETIME(3) COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程';
/*Data for the table `course` */
insert  into `course`(`id`,`name`,`summary`,`time`,`price`,`image`,`level`,`charge`,`status`,`enroll`,`sort`,`created_at`,`updated_at`) values
('00000001', '测试课程01', '这是一门测试课程', 7200, 19.9, '', 0, 'C', 'D', 100, 0, now(), now());