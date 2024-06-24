-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `Customer ID` INT NOT NULL AUTO_INCREMENT,
  `Customer Name` VARCHAR(255) NOT NULL,
  `Customerscol` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `Order ID` INT NOT NULL AUTO_INCREMENT,
  `Order Date` DATE NOT NULL,
  `Delivery Date` DATE NULL,
  `Cusotomer ID` INT NOT NULL,
  PRIMARY KEY (`Order ID`),
  INDEX `Customer ID_idx` (`Cusotomer ID` ASC) VISIBLE,
  CONSTRAINT `Customer ID`
    FOREIGN KEY (`Cusotomer ID`)
    REFERENCES `mydb`.`Customers` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CountryCode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CountryCode` (
  `CountryCode` VARCHAR(2) NOT NULL,
  `Country Name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`CountryCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Deliveries` (
  `Delivery ID` INT NOT NULL AUTO_INCREMENT,
  `Order ID` INT NOT NULL,
  `CountryCode` VARCHAR(2) NOT NULL,
  `City` VARCHAR(255) NOT NULL,
  `PostalCode` VARCHAR(255) NOT NULL,
  `Delivery Cost` DECIMAL(2) NOT NULL,
  `Sales` DECIMAL(2) NOT NULL,
  `Cost` DECIMAL(2) NOT NULL,
  `Quantity` DECIMAL(2) NOT NULL,
  `Discount` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`Delivery ID`),
  INDEX `OrderID_idx` (`Order ID` ASC) VISIBLE,
  INDEX `CountryCode_idx` (`CountryCode` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`Order ID`)
    REFERENCES `mydb`.`Orders` (`Order ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CountryCode`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `mydb`.`CountryCode` (`CountryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DeliberiesCountent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DeliberiesCountent` (
  `Delivery ID` INT NOT NULL,
  `Course Name` VARCHAR(255) NOT NULL,
  `Cuisine Name` VARCHAR(255) NOT NULL,
  `Starter Name` VARCHAR(255) NOT NULL,
  `Desert Name` VARCHAR(255) NOT NULL,
  `Drink` VARCHAR(255) NOT NULL,
  `Sides` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Delivery ID`),
  CONSTRAINT `Delivery ID`
    FOREIGN KEY (`Delivery ID`)
    REFERENCES `mydb`.`Deliveries` (`Delivery ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
