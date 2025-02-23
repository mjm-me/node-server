-- MySQL Script generated by MySQL Workbench
-- Wed Feb 12 13:49:44 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Demo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Demo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Demo` DEFAULT CHARACTER SET utf8 ;
USE `Demo` ;

-- -----------------------------------------------------
-- Table `Demo`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Demo`.`users` (
  `idusers` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Demo`.`post_articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Demo`.`post_articles` (
  `idarticles` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` MEDIUMTEXT NULL,
  `users_idusers` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idarticles`),
  INDEX `fk_articles_users_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_articles_users`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `Demo`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Demo`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Demo`.`books` (
  `idbooks` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `publisher` VARCHAR(45) NULL,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`idbooks`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Demo`.`users_has_books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Demo`.`users_has_books` (
  `users_idusers` INT UNSIGNED NOT NULL,
  `books_idbooks` INT NOT NULL,
  `position` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`users_idusers`, `books_idbooks`),
  INDEX `fk_users_has_books_books1_idx` (`books_idbooks` ASC) VISIBLE,
  INDEX `fk_users_has_books_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_books_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `Demo`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_books_books1`
    FOREIGN KEY (`books_idbooks`)
    REFERENCES `Demo`.`books` (`idbooks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;