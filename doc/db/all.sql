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