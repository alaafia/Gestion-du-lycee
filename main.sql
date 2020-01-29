Create database gestion_ecole;

use gestion_ecole;

create table ÉLÈVES(
Matricule integer,
Nom Varchar(50),
Prénom Varchar(50),
DateNais date,
LieuNais Varchar(50),
Sexe Varchar(50),
Adresse Varchar(50),
Tel integer(12),
Père Varchar(50),
Mère Varchar(50),
primary key (Matricule)
);

create table SERIES(
IdSerie integer,
Séries varchar(50),
primary key (IdSerie)
);

create table CLASSES(
CodeClasse integer,
Classes varchar(5),
IdSerie integer,
primary key (CodeClasse),
foreign key (IdSerie) references Séries(IdSerie)
);

create table MATIERES(
IdMatière integer,
Matières varchar(50),
primary key (IdMatière)
);

create table Associer(
CodeClasse integer,
IdMatière integer,
Coefficient integer,
primary key (CodeClasse,IdMatière),
foreign key (CodeClasse) references Séries(CLASSES),
foreign key (IdMatière) references Séries(MATIERES)
);

create table TRIMESTRES(
IdPeriode integer,
Trimestres varchar(3),
primary key (IdPeriode)
);

create table PROFESSEURS(
IdProf integer,
NomP varchar(50),
PrénomP varchar(50),
AdresseP varchar(100),
TelP integer(12),
primary key (IdProf)
);

create table Obtenir(
Dates date,
IdPeriode integer,
Matricule integer,
CodeClasse integer,
IdMatière integer,
Note_classe integer(2),
Note_compo integer(2),
primary key (Dates,IdPeriode,Matricule,CodeClasse,IdMatière),
foreign key (IdPeriode) references TRIMESTRES(IdPeriode),
foreign key (Matricule) references ÉLÈVES(Matricule),
foreign key (CodeClasse) references TRIMESTRES(CodeClasse),
foreign key (IdMatière) references Matières(IdMatière)
);

create table Inscrire(
Dates date,
Matricule integer,
CodeClasse integer,
primary key (Dates,Matricule,CodeClasse),
foreign key (Matricule) references ÉLÈVES(Matricule),
foreign key (CodeClasse) references TRIMESTRES(CodeClasse)
);

create table Dispenser(
CodeClasse integer,
IdProf integer,
Dates date,
primary key (Dates,CodeClasse,IdProf),
foreign key (CodeClasse) references TRIMESTRES(CodeClasse),
foreign key (IdProf) references PROFESSEURS(IdProf)
);


insert into ÉLÈVES(Matricule,Nom,Prénom,DateNais,LieuNais,Sexe,Adresse,Tel,Père,Mère) VALUES 
(53,'aicha','laafia','1997-09-08','Beni Mellal','femme','khouribga',0701345678,'bouzekri','fatima'), 
(54,'ezzahra','laakred','1997-11-13','casablanca','femme','khouribga', 0701245679,'mohammed','fatima'),
(88,'mohammed','soulimani','1997-01-01','casablanca','homme','khouribga',07012340078,'ahmed','aicha');


insert into SERIES (IdSerie, Séries) VALUES 
(1,'1ier annee'),
(2,'2eme annee'),
(3,'3eme annee');


insert into CLASSES (CodeClasse, Classes, IdSerie) VALUES 
(1,"A",1),
(2,"B",1),
(3,"C",2);


insert into MATIERES (IdMatière, Matières) VALUES 
(1,"BD"),
(2,"SI"),
(3,"algo"),
(4,"statistic"),
(5,"TEC");

insert into Associer(CodeClasse,IdMatière,Coefficient) VALUES
(1,1,5),
(1,2,3),
(1,3,3),
(1,4,4),
(1,5,3);

insert into TRIMESTRES (IdPeriode, Trimestres) VALUES
(1,"1t"),
(2,"2t"),
(3,"3t");

insert into PROFESSEURS (IdProf, NomP, PrénomP, AdresseP, TelP) VALUES
(1,"Jounidi","Soufian","casablanca",0701345677),
(2,"Dargham","abdelmajid","khouribga",0701345600),
(3,"el hadfi","youssef","khouribga",0701345601);

insert into Obtenir (Dates,IdPeriode,Matricule,CodeClasse,IdMatière,Note_classe,Note_compo) VALUES
('2020-01-10',1,53,1,1,18,15),
('2020-01-10',1,54,1,1,14,18),
('2020-01-10',1,88,1,1,10,10),
('2020-01-10',1,53,2,4,12,18),
('2020-01-10',1,54,2,4,15,18);

insert into Inscrire (Dates,Matricule,CodeClasse) VALUES
('2020-01-10',53,1),
('2020-01-10',54,1),
('2020-01-10',88,1),
('2020-01-10',53,2),
('2020-01-10',54,2),
('2020-01-10',88,2),
('2020-01-10',53,3),
('2020-01-10',54,3),
('2020-01-10',88,3);

insert into Dispenser (Dates, CodeClasse,IdProf) VALUES
('2020-01-10',1,1),
('2020-01-10',2,1),
('2020-01-10',3,1),
('2020-01-10',1,2),
('2020-01-10',2,2),
('2020-01-10',3,2),
('2020-01-10',1,3),
('2020-01-10',2,3),
('2020-01-10',3,3);

select *
from Obtenir o join ÉLÈVES  e on e.Matricule = o.Matricule 
where o.IdMatière = (
                                                    select IdMatière 
                                                    from MATIERES
                                                    where Matières = "BD"
                                                    );
                