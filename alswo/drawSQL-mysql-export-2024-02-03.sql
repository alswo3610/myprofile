CREATE TABLE `AnnounceMent`(
    `announce_num` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `announce_admin` VARCHAR(20) NOT NULL,
    `announce_title` VARCHAR(20) NOT NULL,
    `announce_content` VARCHAR(100) NOT NULL,
    `announce_date` DATE NOT NULL
);
CREATE TABLE `Classes`(
    `class_num` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `class_name` VARCHAR(255) NOT NULL,
    `class_startDate` DATE NOT NULL,
    `class_endDate` DATE NOT NULL,
    `class_teacher` VARCHAR(20) NOT NULL,
    `class_day` INT NOT NULL
);
CREATE TABLE `Member`(
    `member_id` VARCHAR(20) NOT NULL,
    `member_password` VARCHAR(20) NOT NULL,
    `member_name` TEXT NOT NULL,
    `member_birth` DATE NOT NULL,
    `member_address` VARCHAR(20) NOT NULL,
    `member_image` BLOB NOT NULL,
    `member_phonenum` INT NOT NULL,
    `member_email` VARCHAR(20) NOT NULL,
    `member_department` VARCHAR(20) NOT NULL,
    `member_admin` VARCHAR(20) NOT NULL,
    `member_className` VARCHAR(20) NOT NULL
);
ALTER TABLE
    `Member` ADD PRIMARY KEY(`member_id`);
CREATE TABLE `Counseling`(
    `counseling_num` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `counseling_stu` VARCHAR(20) NOT NULL,
    `counseling_admin` VARCHAR(20) NOT NULL,
    `counseling_date` DATE NOT NULL,
    `counseling_title` VARCHAR(20) NOT NULL,
    `counseling_content` VARCHAR(100) NOT NULL
);
CREATE TABLE `Attendance`(
    `member_id` VARCHAR(20) NOT NULL,
    `attendance_in` DATETIME NOT NULL,
    `attendance_out` DATETIME NOT NULL,
    `attendance_status` BIGINT NOT NULL
);
ALTER TABLE
    `Attendance` ADD PRIMARY KEY(`member_id`);
ALTER TABLE
    `Attendance` ADD PRIMARY KEY(`attendance_out`);
ALTER TABLE
    `AnnounceMent` ADD CONSTRAINT `announcement_announce_admin_foreign` FOREIGN KEY(`announce_admin`) REFERENCES `Member`(`member_admin`);
ALTER TABLE
    `Member` ADD CONSTRAINT `member_member_classname_foreign` FOREIGN KEY(`member_className`) REFERENCES `Classes`(`class_name`);
ALTER TABLE
    `Counseling` ADD CONSTRAINT `counseling_counseling_stu_foreign` FOREIGN KEY(`counseling_stu`) REFERENCES `Member`(`member_id`);
ALTER TABLE
    `Attendance` ADD CONSTRAINT `attendance_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `Member`(`member_id`);
ALTER TABLE
    `Counseling` ADD CONSTRAINT `counseling_counseling_admin_foreign` FOREIGN KEY(`counseling_admin`) REFERENCES `Member`(`member_admin`);