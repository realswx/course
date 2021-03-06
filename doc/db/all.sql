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
('00000002', '00000002', 'test2');