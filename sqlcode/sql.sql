# CREATE TABLE `javalastfinal`.`question`
# (
#     `question_id` BIGINT(10)   NOT NULL AUTO_INCREMENT,
#     `question`    TEXT         NOT NULL,
#     `answerA`     VARCHAR(255) NOT NULL,
#     `answerB`     VARCHAR(255) NOT NULL,
#     `answerC`     VARCHAR(255) NOT NULL,
#     `answerD`     VARCHAR(255) NOT NULL,
#     `right`       VARCHAR(255) NOT NULL,
#     PRIMARY KEY (`question_id`)
# ) ENGINE = InnoDB;
# INSERT INTO `javalastfinal`.`question` (`question_id`, `question`, `answerA`, `answerB`, `answerC`, `answerD`, `right`) VALUES
# (1, 'Specify the directory name where the XML Layouts are stored', '/res/values', '/res/layout', '/res/values', '/target', '/res/layout'),
# (2, 'The root element of AndroidManifest.xml', ' service', 'app', ' manifest ', 'activity', 'manifest '),
# (3, 'What represents a single user interface screen?', 'View', 'Service', 'ViewGroup', 'Activity', 'Activity'),
# (4, 'All layout classes are a direct subclass of', 'Object', 'View', 'ViewGroup', 'AbsoluteLayout ', 'ViewGroup'),
# (5, 'A Layout that arranges its children in a single row or a single column.', 'Relative Layout', 'Frame layout', 'Linear Layout', 'Absolute Layout', 'Linear Layout'),
# (6, 'The basic building element of android user interface is called', 'View', 'ContentProvider', 'ViewGroup', 'Layout', 'View'),
# (7, 'Android is developed by', 'Android Inc', 'Apple Inc', 'Samsung', 'Google Inc ', 'Google Inc '),
# (8, 'Which daemon is used when the NameNode goes down?', 'HDFS', 'Yarn', 'DataNode', 'Secondary NameNode', 'Secondary NameNode'),
# (9, 'Which of the following method add a path or paths to the list of inputs?', 'addInputPath()', 'setInput()', 'setInputPaths()', 'addInput()', 'addInputPath()'),
# (10, 'Which of the file contains the configuration setting for HDFS daemons?', 'yarn-site.xml', 'hdfs-site.xml', ' mapred-site.xml', ' gradle-site.xml', 'hdfs-site.xml'),
# (11, 'Which configuration file is used to control the HDFS replication factor?', 'yarn-site.xml', 'mapred-site.xml', 'hdfs-site.xml', 'core-site.xml', 'hdfs-site.xml'),
# (12, 'Which of the following method used to set the output directory?', 'OutputFormat.setOutputpath()', 'FileOutputFormat.setOutputpath()', 'OutputFormat.setOutput()', 'FileOutputFormat.setOutput()', 'FileOutputFormat.setOutputpath()'),
# (13, 'Every android app must have AndroidManifest.xml file', 'True', 'False', 'I don\'t know', '', 'True'),
# (14, '________ object is used to invoke the next filter in the chain of filters?', 'Filter', 'Action', 'Config', 'FilterChain ', 'FilterChain ');

CREATE TABLE `role`
(
    `role_id` int(11) NOT NULL,
    `name`    varchar(255) DEFAULT NULL,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role`
    DISABLE KEYS */;
INSERT INTO `role`
VALUES (0, 'ROLE_USER'),
       (1, 'ROLE_ADMIN'),
       (2, 'TEACHER'),
       (3, 'STUDENT');

CREATE TABLE `user` (
                        `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
                        `email` varchar(255) NOT NULL,
                        `enabled` bit(1) NOT NULL,
                        `first_name` varchar(255) DEFAULT NULL,
                        `last_name` varchar(255) DEFAULT NULL,
                        `password` varchar(255) DEFAULT NULL,
                        `phone` varchar(255) DEFAULT NULL,
                        `username` varchar(255) DEFAULT NULL,`gender` VARCHAR(10) DEFAULT NULL,
                        `group_id` BIGINT(20) DEFAULT NULL,
                        PRIMARY KEY (`user_id`),
                        UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
                        CONSTRAINT `FKa8m1smlfsc8kkjn2t6wpdmysk4545` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`)

) ENGINE=InnoDB AUTO_INCREMENT=4 ;
CREATE TABLE `javalastfinal`.`major` ( `major_id` BIGINT NOT NULL , `major_name` VARCHAR(255) NOT NULL , PRIMARY KEY (`major_id`), UNIQUE (`major_name`)) ENGINE = InnoDB;
INSERT INTO `major` (`major_id`, `major_name`) VALUES ('0', 'Big Data'), ('1', ' SE'),('2', 'Cyber Security'), ('3', 'Computer Scinece');
CREATE TABLE `javalastfinal`.`group` ( `group_id` BIGINT NOT NULL , `group` VARCHAR(22) NOT NULL , `major_id` BIGINT(20) NOT NULL , PRIMARY KEY (`group_id`), UNIQUE `group_unique` (`group`)
                                     ,
                                       CONSTRAINT `FKa8m1smlfsc8kkjn2t6wpdmysk4545sss` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)) ENGINE = InnoDB;
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'dleskov@gmail.ru','','Dmitry','Leskov','$2a$12$DWCryEwHwbTYCegib92tk.VST.GG1i2WAqfaSwyMdxX0cl0eBeSve','5551112345','User','Ono',1001),(3,'asd@gmail.com','','alex','osipov','$2a$12$hZR7pcSf0JU/OTXR3TOyuu8r6C6n.JZE8Ei47E4LZs1t0Aq1AO6oC','1111111111','Admin','Pacan',2);
UNLOCK TABLES;
INSERT INTO `group` (`group_id`, `group`, `major_id`) VALUES ('1001', 'SE-1911', '1'), ('1002', 'CS-1901', '2'),('1003', 'IT-1917', '3'), ('1004', 'IT-1914', '0');


DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
                             `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
                             `role_id` int(11) DEFAULT NULL,
                             `user_id` bigint(20) DEFAULT NULL,
                             PRIMARY KEY (`user_role_id`),
                             KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
                             KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
                             CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
                             CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3;



LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES (1,2,1),(2,3,3);
