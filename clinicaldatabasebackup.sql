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

/*Incluir 4 pacientes*/

describe Pacientes;
insert into Pacientes (nome, idade, cidade, cpf, doenca)
	values	("Ana", 20, "Florianopolis", "20000200000", "gripe"),
			("Paulo", 24, "Palhoca", "20000220000", "fratura"),
            ("Lucia", 30, "Biguacu", "22000200000", "tendinite"),
            ("Carlos", 28, "Joinville", "11000110000", "sarampo");
select * from Pacientes; 

/*Incluir Medicos*/
describe Medicos;
insert into Medicos (nome, idade, especialidade, cpf, cidade, fk_nroa)
	values	("Joao", 40, "Ortopedia", "10000100000", "Florianopolis", 1),
			("Maria", 42, "Traumatologia", "10000110000", "Blumenau", 2),
            ("Pedro", 51, "Pediatria", "11000100000", "Sao Jose", 4),
            ("Carlos", 28, "Ortopedia", "11000110000", "Joinville", 4),
            ("Marcia", 33, "Neurologia", "11000111000", "Biguacu", 3);
select * from Medicos;

/*Incluir consultas*/

describe Consulta;
insert into Consulta (fk_codm, fk_codp, data_consulta, hora)
		values	(1,1,'2006/06/12','14:00'),
				(1,4,'2006/06/13','10:00'),
                (2,1,'2006/06/13','9:00'),
                (2,2,'2006/06/13','11:00'),
                (2,3,'2006/06/14','14:00'),
                (2,4,'2006/06/14','17:00'),
                (3,1,'2006/06/19','18:00'),
                (3,3,'2006/06/12','10:00'),
                (3,4,'2006/06/19','13:00'),
                (4,4,'2006/06/20','13:00'),
                (4,4,'2006/06/22','19:30');
select * from Consulta;

/*1: O paciente Paulo mudou-se para ilhota*/
update pacientes set cidade = 'Ilhota' where codp=2;
select * from Pacientes;

/*2: A consulta do médico 1 com paciente 4 passou para às 12h 04/07/2006*/
update consulta set data_consulta = '2006/07/04', 
	hora = '12:00' where fk_codm = 1 AND fk_codp=4;
select * from Consulta;

/*3: A paciente Ana fez aniversário e sua doença agora é hepatite*/
select * from Pacientes;
update pacientes set idade = 21 where codp=1;
update pacientes set doenca = 'hepatite' where codp = 1;

/*4: A consulta do Médico Pedro (codm 3) com o paciente Carlos(copd 4) passou para uma hora e meia depois*/
select * from Consulta;
update consulta set hora = '14:30' where fk_codm=3 AND fk_codp=4;

/*5: O funcionário Carlos(codf 4) deixou a clínica*/
select * from Funcionarios;
delete from Funcionarios where codf=4;

/*6: As consultas marcadas após as 19h foram canceladas*/
select * from Consulta;
delete from consulta where hora >= '19:00';



           
 



 
