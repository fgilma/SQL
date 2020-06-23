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
-- Table `mydb`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor` (
  `NIF` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `calle` VARCHAR(45) NULL,
  `numero` INT NULL,
  `piso` INT NULL,
  `puerta` VARCHAR(2) NULL,
  `codigoPostal` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gafas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gafas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Gafas` (
  `id_gafas` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `graduacion` VARCHAR(45) NULL,
  `colorVidrio` VARCHAR(45) NULL,
  `colorMontura` VARCHAR(45) NULL,
  `precio` DECIMAL(2) NULL,
  `Proveedor_NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `fk_Gafas_Proveedor_idx` (`Proveedor_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Gafas_Proveedor`
    FOREIGN KEY (`Proveedor_NIF`)
    REFERENCES `mydb`.`Proveedor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `id_cliente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `fecha_registro` DATETIME NULL,
  `Clientes_id_cliente` INT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_Clientes_Clientes1_idx` (`Clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Clientes1`
    FOREIGN KEY (`Clientes_id_cliente`)
    REFERENCES `mydb`.`Clientes` (`id_cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empleados` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Empleados` (
  `id_empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `Gafas_id_gafas` INT NOT NULL,
  `Empleados_id_empleado` INT NOT NULL,
  `cantidad` INT NULL,
  `precio` DECIMAL(2) NULL,
  `Clientes_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_Pedido_Gafas1_idx` (`Gafas_id_gafas` ASC) VISIBLE,
  INDEX `fk_Pedido_Empleados1_idx` (`Empleados_id_empleado` ASC) VISIBLE,
  INDEX `fk_Pedido_Clientes1_idx` (`Clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Gafas1`
    FOREIGN KEY (`Gafas_id_gafas`)
    REFERENCES `mydb`.`Gafas` (`id_gafas`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pedido_Empleados1`
    FOREIGN KEY (`Empleados_id_empleado`)
    REFERENCES `mydb`.`Empleados` (`id_empleado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pedido_Clientes1`
    FOREIGN KEY (`Clientes_id_cliente`)
    REFERENCES `mydb`.`Clientes` (`id_cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
