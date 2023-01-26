-- LDTS Academy. https://academy.ldts.us
-- All Rights Reserved

-- Curso DB123
-- Ejercicio GrooveShark -Script de partida.

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP DATABASE IF EXISTS `Grooveshark` ;
CREATE DATABASE `Grooveshark` ;
USE `Grooveshark` ;

-- -----------------------------------------------------
-- Table `Grooveshark`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grooveshark`.`Usuarios` ;

CREATE  TABLE IF NOT EXISTS `Grooveshark`.`Usuarios` (
  `idusuario` INT NULL ,
  `usuario` VARCHAR(10) NULL ,
  `password` VARCHAR(45) NULL ,
  `fechaalta` VARCHAR(45) NULL )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grooveshark`.`Generos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grooveshark`.`Generos` ;

CREATE  TABLE IF NOT EXISTS `Grooveshark`.`Generos` (
  `idgenero` INT NOT NULL ,
  `alias` VARCHAR(45) NULL ,
  PRIMARY KEY (`idgenero`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grooveshark`.`Canciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grooveshark`.`Canciones` ;

CREATE  TABLE IF NOT EXISTS `Grooveshark`.`Canciones` (
  `idcancion` INT NULL ,
  `titulo` VARCHAR(50) NULL ,
  `genero_id` VARCHAR(50) NULL ,
  `cancion` BLOB NULL ,
  `usupropietario_id` INT NOT NULL ,
  INDEX `fk_Canciones_Epoca1_idx` (`usupropietario_id` ASC) ,
  CONSTRAINT `fk_Canciones_Epoca1`
    FOREIGN KEY (`usupropietario_id` )
    REFERENCES `Grooveshark`.`Generos` (`idgenero` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grooveshark`.`Listas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grooveshark`.`Listas` ;

CREATE  TABLE IF NOT EXISTS `Grooveshark`.`Listas` (
  `idlista` INT NOT NULL ,
  `usuario_id` INT NULL ,
  `nombre_lista` VARCHAR(45) NULL ,
  PRIMARY KEY (`idlista`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grooveshark`.`Listas_has_Canciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grooveshark`.`Listas_has_Canciones` ;

CREATE  TABLE IF NOT EXISTS `Grooveshark`.`Listas_has_Canciones` (
  `Listas_idlista` INT NOT NULL ,
  `Canciones_idcancion` INT NOT NULL ,
  PRIMARY KEY (`Listas_idlista`, `Canciones_idcancion`) ,
  INDEX `fk_Listas_has_Canciones_Listas_idx` (`Listas_idlista` ASC) ,
  CONSTRAINT `fk_Listas_has_Canciones_Listas`
    FOREIGN KEY (`Listas_idlista` )
    REFERENCES `Grooveshark`.`Listas` (`idlista` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Grooveshark` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Grooveshark`.`Usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `Grooveshark`;
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (1, 'Tony', '123456', '2014-12-15');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (2, 'Manuel', 'elhacker', '2014-12-12');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (3, 'Loreto', '1992', '2014-11-12');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (4, 'Lupe', '34567', '2014-12-11');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (5, 'Dora', '432543', '2014-11-11');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (6, 'Alfonso', 'barra_sw', '2014-10-10');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (7, 'pepe', 'puntoycoma', '2014-10-12');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (8, 'joaquin', 'esesocket', '2014-10-13');
INSERT INTO `Grooveshark`.`Usuarios` (`idusuario`, `usuario`, `password`, `fechaalta`) VALUES (9, 'jose', 'yograbovideos', '2014-12-10');

COMMIT;

-- -----------------------------------------------------
-- Data for table `Grooveshark`.`Generos`
-- -----------------------------------------------------
START TRANSACTION;
USE `Grooveshark`;
INSERT INTO `Grooveshark`.`Generos` (`idgenero`, `alias`) VALUES (22, '80s');
INSERT INTO `Grooveshark`.`Generos` (`idgenero`, `alias`) VALUES (88, '90s');
INSERT INTO `Grooveshark`.`Generos` (`idgenero`, `alias`) VALUES (99, '00s');

COMMIT;

-- -----------------------------------------------------
-- Data for table `Grooveshark`.`Canciones`
-- -----------------------------------------------------
START TRANSACTION;
USE `Grooveshark`;
INSERT INTO `Grooveshark`.`Canciones` (`idcancion`, `titulo`, `genero_id`, `cancion`, `usupropietario_id`) VALUES (11, 'Unix4ever', '80s', NULL, 22);
INSERT INTO `Grooveshark`.`Canciones` (`idcancion`, `titulo`, `genero_id`, `cancion`, `usupropietario_id`) VALUES (12, 'httpd doesnt work', '90s', NULL, 88);
INSERT INTO `Grooveshark`.`Canciones` (`idcancion`, `titulo`, `genero_id`, `cancion`, `usupropietario_id`) VALUES (13, 'Entos 7 - Unpluged', '00s', NULL, 99);

COMMIT;
