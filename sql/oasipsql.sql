-- MySQL Workbench Forward Engineering
drop database oasipdb;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oasipdb` DEFAULT CHARACTER SET utf8 ;
USE `oasipdb` ;

-- -----------------------------------------------------
-- Table `mydb`.`eventCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oasipdb`.`event_category` (
 `eventCategoryId` INT NOT NULL AUTO_INCREMENT,
`eventCategoryName` VARCHAR(100) NOT NULL,
  `eventCategoryDescription` VARCHAR(500) NULL,
  `eventDuration` INT NOT NULL,
  PRIMARY KEY (`eventCategoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oasipdb`.`event` (
  `eventId` INT NOT NULL AUTO_INCREMENT,
  `bookingName` VARCHAR(100) NOT NULL,
  `bookingEmail` VARCHAR(50) NOT NULL,
  `eventStartTime` DATETIME NOT NULL,
  `eventDuration` INT NOT NULL,
  `eventNotes` VARCHAR(500) NULL,
  `eventCategoryId` INT NOT NULL,
  `fileId` INT NULL,
  PRIMARY KEY (`eventId`),
  INDEX `fk_event_eventCategory_idx` (`eventCategoryId` ASC),
  CONSTRAINT `fk_event_event_category`
    FOREIGN KEY (`eventCategoryId`)
    REFERENCES `oasipdb`.`event_category` (`eventCategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_event_file`
    FOREIGN KEY (`fileId`)
    REFERENCES `oasipdb`.`file` (`fileId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oasipdb`.`user` (
`userId` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
`password` VARCHAR(90) NOT NULL,
  `role` VARCHAR(50) NOT NULL,
  `createdOn` DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4),
  `updatedOn` DATETIME(4) DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ecentCategoryOwner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oasipdb`.`event_category_owner` (
  `eventCategoryId` INT AUTO_INCREMENT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`eventCategoryId`, `userId`),
  INDEX `fk_event_category_has_user_user_idx` (`userId` ASC),
  INDEX `fk_event_category_has_user_eventC_ctegory_idx` (`eventCategoryId` ASC),
  CONSTRAINT `fk_event_category_has_user_event_category`
    FOREIGN KEY (`eventCategoryId`)
    REFERENCES `oasipdb`.`event_category` (`eventCategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_category_has_user_user`
    FOREIGN KEY (`userId`)
    REFERENCES `oasipdb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `oasipdb`.`file` (
  `fileId` INT NOT NULL AUTO_INCREMENT,
  `fileName` VARCHAR(100) NULL,
  `filePath` VARCHAR(100) NULL,
  `fileSize` VARCHAR(50) NULL,
  PRIMARY KEY (`fileId`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

