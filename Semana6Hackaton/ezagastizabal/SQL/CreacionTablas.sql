-- MySQL Workbench Synchronization
-- Generated: 2020-07-05 13:32
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: edwin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`facCabecera` (
  `idfacCabecera` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoPago_idtipoPago` INT(11) NOT NULL,
  `cliente_idcliente` INT(11) NOT NULL,
  `fechafacCabecera` DATETIME NOT NULL DEFAULT NOW(),
  `igvfacCabecera` DECIMAL(18,2) NOT NULL,
  `subtotalFacCabecera` DECIMAL(18,2) NOT NULL,
  `totalFacCabecera` VARCHAR(45) NOT NULL,
  `estadoFactura` CHAR(1) NOT NULL,
  PRIMARY KEY (`idfacCabecera`),
  INDEX `fk_facCabecera_tipoPago1_idx` (`tipoPago_idtipoPago` ASC) VISIBLE,
  INDEX `fk_facCabecera_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_facCabecera_tipoPago1`
    FOREIGN KEY (`tipoPago_idtipoPago`)
    REFERENCES `mydb`.`tipoPago` (`idtipoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facCabecera_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `idproductos` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `valorProducto` DECIMAL(18,2) NOT NULL,
  `igvProducto` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`facDetalle` (
  `idfacDetalle` INT(11) NOT NULL AUTO_INCREMENT,
  `facCabecera_idfacCabecera` INT(11) NOT NULL,
  `productos_idproductos` INT(11) NOT NULL,
  `cantFacDetalle` INT(11) NOT NULL,
  `valorDetalle` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`idfacDetalle`),
  INDEX `fk_facDetalle_facCabecera_idx` (`facCabecera_idfacCabecera` ASC) VISIBLE,
  INDEX `fk_facDetalle_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  CONSTRAINT `fk_facDetalle_facCabecera`
    FOREIGN KEY (`facCabecera_idfacCabecera`)
    REFERENCES `mydb`.`facCabecera` (`idfacCabecera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facDetalle_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `mydb`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`tipoPago` (
  `idtipoPago` INT(11) NOT NULL AUTO_INCREMENT,
  `descTipoPago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoPago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `nroIdentificacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
