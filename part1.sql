DROP TABLE lab1Etudiant CASCADE CONSTRAINTS;
DROP TABLE lab1Professeur CASCADE CONSTRAINTS;
DROP TABLE lab1Inscription CASCADE CONSTRAINTS;

CREATE TABLE lab1Etudiant
(
code_permanent VARCHAR2(20) PRIMARY KEY,
nom VARCHAR2(50) NOT NULL,
prenom VARCHAR2(50) NOT NULL,
date_naissance DATE NOT NULL
);

CREATE TABLE lab1Professeur
(
nas VARCHAR2(9) PRIMARY KEY,
nom VARCHAR2(50) DEFAULT 'INCONNU' NOT NULL,
prenom VARCHAR2(50) DEFAULT 'INCONNU' NOT NULL,
date_naissance DATE NOT NULL,
type_prof VARCHAR2(50) NOT NULL,
specialite VARCHAR2(50),
nombre_departement NUMBER(10) REFERENCES LAB1DEPARTEMENT(nombre_departement),

CONSTRAINT CHK_PROF CHECK IN  ('CHARGE DE COURS' OR 'MAITRE D//'ENSEIGNEMENT' OR 'PROFESSEUR')

);

CREATE TABLE lab1Inscription
(
id_inscription NUMBER(10) PRIMARY KEY,
note NUMBER(4,2),
code_permanent VARCHAR2(20),
id_groupe NUMBER(10),
FOREIGN KEY (code_permanent) REFERENCES lab1Etudiant(code_permanent)
ON DELETE CASCADE,
FOREIGN KEY (id_groupe) REFERENCES Lab1Groupe_Cours(id_groupe)

);

