
-- Dumping database structure for bioskop
DROP DATABASE IF EXISTS `bioskop`;
CREATE DATABASE IF NOT EXISTS `bioskop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bioskop`;

-- Dumping structure for table bioskop.films
DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `film_code` varchar(50) NOT NULL,
  `film_name` varchar(50) NOT NULL,
  `airing` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`film_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bioskop.films: ~0 rows (approximately)
DELETE FROM `films`;

-- Dumping structure for table bioskop.seats
DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `seat_no` varchar(50) NOT NULL,
  `seat_available` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bioskop.seats: ~0 rows (approximately)
DELETE FROM `seats`;

-- Dumping structure for table bioskop.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bioskop.user: ~0 rows (approximately)
DELETE FROM `user`;

DROP TABLE IF EXISTS `studio`;
CREATE TABLE IF NOT EXISTS `studio` (
  `studio_id` varchar(100) NOT NULL,
  `studio_name` varchar(100) NOT NULL,
  PRIMARY KEY (`studio_id`),
  KEY `studio_FK` (`studio_id`,`studio_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `studio`;

DROP TABLE IF EXISTS `available`;
CREATE TABLE IF NOT EXISTS `available` (
  `seat_no` varchar(100) NOT NULL,
  `studio_id` varchar(100) NOT NULL,
  KEY `available_FK_1` (`studio_id`),
  KEY `available_FK` (`seat_no`),
  CONSTRAINT `available_FK` FOREIGN KEY (`seat_no`) REFERENCES `seats` (`seat_no`),
  CONSTRAINT `available_FK_1` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `available`;

-- Dumping structure for table bioskop.schedules
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `schedule_id` int NOT NULL,
  `film_code` varchar(100) DEFAULT NULL,
  `tanggal_tayang` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `harga_tiket` varchar(100) DEFAULT NULL,
  `studio_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `schedules_FK` (`film_code`),
  KEY `schedules_FK_1` (`studio_id`),
  CONSTRAINT `schedules_FK` FOREIGN KEY (`film_code`) REFERENCES `films` (`film_code`),
  CONSTRAINT `schedules_FK_1` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bioskop.schedules: ~0 rows (approximately)
DELETE FROM `schedules`;



