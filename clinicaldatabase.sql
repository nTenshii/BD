create database Clinica;
use Clinica;
show databases;

CREATE TABLE Ambulatorio (
    nroa int PRIMARY KEY auto_increment,
    andar int not null, 
    capacidade smallint
);

CREATE TABLE Funcionarios (
    codf int PRIMARY KEY auto_increment,
    nome varchar(40) not null,
    idade smallint not null,
    cidade char(30),
    cpf varchar(11) UNIQUE,
    salario decimal(9,2),
    cargo varchar(20)
);

CREATE TABLE Pacientes (
    codp int PRIMARY KEY auto_increment,
    nome varchar(40) not null,
    idade smallint not null,
    cidade char(30),
    cpf varchar(11) UNIQUE,
    doenca varchar(40) not null
);

CREATE TABLE Medicos (
    codm int PRIMARY KEY auto_increment,
    nome varchar(40) not null,
    idade smallint not null,
    especialidade char(20),
    cpf varchar(11) UNIQUE,
    cidade varchar(30),
    fk_nroa int,
    foreign key (fk_nroa) references Ambulatorio (nroa)
);

CREATE TABLE Consulta (
    num_consulta int PRIMARY KEY auto_increment,
    data_consulta date,
    hora time,
    fk_codp int,
    fk_codm int,
    foreign key (fk_codm) references Medicos(codm),
    foreign key (fk_codp) references Pacientes(codp)
);
 



 
