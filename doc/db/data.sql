-- MySQL Script generated by MySQL Workbench
-- Mon Mar  6 20:20:18 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eg_sns
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eg_sns
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eg_sns` DEFAULT CHARACTER SET utf8 ;
USE `eg_sns` ;

-- -----------------------------------------------------
-- Table `eg_sns`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eg_sns`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_id` VARCHAR(32) NOT NULL COMMENT 'ログインID',
  `password` VARCHAR(32) NOT NULL COMMENT 'パスワード',
  `name` VARCHAR(32) NOT NULL COMMENT '名前',
  `email_address` VARCHAR(256) NOT NULL COMMENT 'メールアドレス',
  `icon_url` VARCHAR(2000) NULL COMMENT 'プロフィールアイコンURL',
  `profile` TEXT NULL COMMENT 'プロフィール',
  `created` DATETIME NOT NULL COMMENT '作成日時',
  `updated` DATETIME NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'ユーザー';


-- -----------------------------------------------------
-- Table `eg_sns`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eg_sns`.`posts` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `users_id` BIGINT NOT NULL COMMENT 'ユーザーID',
  `title` VARCHAR(512) NOT NULL COMMENT 'タイトル',
  `body` TEXT NOT NULL COMMENT '本文',
  `created` DATETIME NOT NULL COMMENT '作成日時',
  `updated` DATETIME NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  INDEX `fk_posts_users_idx` (`users_id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '投稿';


-- -----------------------------------------------------
-- Table `eg_sns`.`friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eg_sns`.`friends` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `users_id` BIGINT NOT NULL COMMENT 'ユーザーID',
  `friend_users_id` BIGINT NOT NULL COMMENT 'フレンドユーザーID',
  `approval_status` TINYINT NOT NULL COMMENT '承認ステータス（1.未承認「申請中」、2.承認済み）',
  `created` DATETIME NOT NULL COMMENT '作成日時',
  `updated` DATETIME NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  INDEX `fk_friends_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_friends_users2_idx` (`friend_users_id` ASC) VISIBLE,
  INDEX `uk_friends1` (`users_id` ASC, `friend_users_id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = 'フレンド';


-- -----------------------------------------------------
-- Table `eg_sns`.`post_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eg_sns`.`post_comments` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `posts_id` BIGINT NOT NULL COMMENT '投稿ID',
  `users_id` BIGINT NOT NULL COMMENT 'ユーザーID',
  `comment` TEXT NOT NULL COMMENT 'コメント',
  `created` DATETIME NOT NULL COMMENT '作成日時',
  `updated` DATETIME NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  INDEX `fk_post_comments_posts1_idx` (`posts_id` ASC) VISIBLE,
  INDEX `fk_post_comments_users1_idx` (`users_id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '投稿コメント';


-- -----------------------------------------------------
-- Table `eg_sns`.`post_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eg_sns`.`post_images` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `posts_id` BIGINT NOT NULL COMMENT '投稿ID',
  `users_id` BIGINT NOT NULL COMMENT 'ユーザーID',
  `image_url` VARCHAR(2000) NOT NULL COMMENT '投稿画像URL',
  `created` DATETIME NOT NULL COMMENT '作成日時',
  `updated` DATETIME NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  INDEX `fk_post_images_posts1_idx` (`posts_id` ASC) VISIBLE,
  INDEX `fk_post_images_users1_idx` (`users_id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '投稿画像';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
