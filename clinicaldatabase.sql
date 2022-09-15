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

/*Incluir 2 ambulatorios na tabela Ambulatorio*/
describe Ambulatorio;
insert into Ambulatorio (andar, capacidade)
	values  (1,30),
			(1,50),
            (2,40),
            (2,25),
            (2,55);
select * from Ambulatorio;

/*Incluir 5 funcionarios*/

describe Funcionarios;
insert into Funcionarios (nome, idade, cidade, salario, cpf)
	values	("Rita", 32, "Sao Jose", 1200, "20000100000"),
			("Maria", 55, "Palhoca", 1220, "30000110000"),
            ("Caio", 45, "Florianopolis", 1100, "41000100000"),
            ("Carlos", 44, "Florianopolis", 1200, "51000110000"),
            ("Paula", 33, "Florianopolis", 2500, "61000111000");
select * from Funcionarios;


           
 



 
