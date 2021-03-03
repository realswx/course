/*Table structure for table `test` */
USE course_online;
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