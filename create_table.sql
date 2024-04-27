-- `no-css-board`.`user` definition

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT '사용자 아이디',
  `password` varchar(256) NOT NULL COMMENT '패스워드',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- `no-css-board`.post definition

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `title` varchar(256) NOT NULL COMMENT '게시글 제목',
  `content` text NOT NULL COMMENT '게시글 내용(html 허용)',
  `status` enum('PUBLISHED','DELETED') NOT NULL DEFAULT 'PUBLISHED',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_fk` (`user_id`),
  CONSTRAINT `post_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- `no-css-board`.comment definition

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `board_id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT 'html 가능',
  `status` enum('PUBLISHED','DELETED') NOT NULL DEFAULT 'PUBLISHED',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_board_FK` (`board_id`),
  KEY `comment_user_FK` (`user_id`),
  CONSTRAINT `comment_board_FK` FOREIGN KEY (`board_id`) REFERENCES `post` (`id`),
  CONSTRAINT `comment_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;