-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sas` DEFAULT CHARACTER SET utf8 ;
USE `sas` ;

-- -----------------------------------------------------
-- Table `sas`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`curso` ;

CREATE TABLE IF NOT EXISTS `sas`.`curso` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`turma` ;

CREATE TABLE IF NOT EXISTS `sas`.`turma` (
  `id` INT NOT NULL,
  `ano_inicial` DATETIME NOT NULL,
  `id_curso` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`aluno` ;

CREATE TABLE IF NOT EXISTS `sas`.`aluno` (
  `matricula` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `id_turma` INT NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`responsavel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`responsavel` ;

CREATE TABLE IF NOT EXISTS `sas`.`responsavel` (
  `cpf` VARCHAR(20) NOT NULL,
  `senha` VARCHAR(60) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`responsavel_aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`responsavel_aluno` ;

CREATE TABLE IF NOT EXISTS `sas`.`responsavel_aluno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_responsavel` INT NOT NULL,
  `id_aluno` INT NOT NULL,
  `cpf_responsavel` VARCHAR(20) NOT NULL,
  `matricula_aluno` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`motivo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`motivo` ;

CREATE TABLE IF NOT EXISTS `sas`.`motivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`moderador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`moderador` ;

CREATE TABLE IF NOT EXISTS `sas`.`moderador` (
  `cpf` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(30) NULL,
  `senha` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`portaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`portaria` ;

CREATE TABLE IF NOT EXISTS `sas`.`portaria` (
  `cpf` VARCHAR(50) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(30) NULL,
  `senha` VARCHAR(60) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sas`.`requisicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sas`.`requisicao` ;

CREATE TABLE IF NOT EXISTS `sas`.`requisicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_saida_agendada` DATETIME NULL,
  `data_retorno_agendada` DATETIME NULL,
  `data_saida` DATETIME NULL,
  `data_retorno` DATETIME NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `deleted_at` DATETIME NULL,
  `id_responsavel_aluno` INT NOT NULL,
  `id_motivo` INT NOT NULL,
  `cpf_moderador` VARCHAR(20) NOT NULL,
  `cpf_portaria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
