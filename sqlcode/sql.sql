CREATE TABLE `javalastfinal`.`question`
(
    `question_id` BIGINT(10)   NOT NULL AUTO_INCREMENT,
    `question`    TEXT         NOT NULL,
    `answerA`     VARCHAR(255) NOT NULL,
    `answerB`     VARCHAR(255) NOT NULL,
    `answerC`     VARCHAR(255) NOT NULL,
    `answerD`     VARCHAR(255) NOT NULL,
    `right`       VARCHAR(255) NOT NULL,
    PRIMARY KEY (`question_id`)
) ENGINE = InnoDB;
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
                        `username` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`user_id`),
                        UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;



LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'dleskov@gmail.ru','','Dmitry','Leskov','$2a$12$DWCryEwHwbTYCegib92tk.VST.GG1i2WAqfaSwyMdxX0cl0eBeSve','5551112345','User'),(3,'asd@gmail.com','','alex','osipov','$2a$12$hZR7pcSf0JU/OTXR3TOyuu8r6C6n.JZE8Ei47E4LZs1t0Aq1AO6oC','1111111111','Admin');

UNLOCK TABLES;



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
