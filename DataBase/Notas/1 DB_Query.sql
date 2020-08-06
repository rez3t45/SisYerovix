/* 
DROP DATABASE DB_School;
*/

Create database DB_School;

use DB_School;

/* INSTRUCTIVO :
 ERWIN generaba mal el autoincremente x eso -> 1: busca esta cadena  'INT N@T NULL' (omite '' y cambia @ = A)  2: Reemplaza por ' INT N@T NULL AUTO_INCREMENT AUTO_INCREMENT'  
 La tabla: Formulario_perfil -> QUitar el AutoIncrement
 */



CREATE TABLE Area
(
	id_area              INT NOT NULL AUTO_INCREMENT,
	area                 VARCHAR(150) NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_area)
);



CREATE TABLE Asistencia
(
	id_asistencia        INT NOT NULL AUTO_INCREMENT,
	id_estudiante        INT NULL,
	id_clase             INT NULL,
	fecha_reg            DATETIME NULL,
	tipo_asistencia      CHAR(1) NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	fecha_asistencia     DATE NULL,
	PRIMARY KEY (id_asistencia)
);



CREATE TABLE Calificaciones
(
	id_calificacion      INT NOT NULL AUTO_INCREMENT,
	C1                   TINYINT NULL,
	C2                   TINYINT NULL,
	C3                   TINYINT NULL,
	C4                   TINYINT NULL,
	fec_reg              DATETIME NULL,
	estado               BIT NULL,
	id_periodo           INT NULL,
	id_clase             INT NULL,
	id_estudiante        INT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_calificacion)
);



CREATE TABLE Cargo
(
	id_cargo             INT NOT NULL AUTO_INCREMENT,
	cargo                VARCHAR(150) NULL,
	estado               BIT NULL,
	id_area              INT NULL,
	id_usu               INT NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_cargo)
);



CREATE TABLE Ciclo
(
	id_ciclo             INT NOT NULL AUTO_INCREMENT,
	ciclo                VARCHAR(150) NULL,
	anio                 YEAR NULL,
	fec_ini              DATE NULL,
	fec_fin              DATE NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_ciclo)
);



CREATE TABLE Clase
(
	id_clase             INT NOT NULL AUTO_INCREMENT,
	clase                VARCHAR(100) NULL,
	id_curso             INT NULL,
	id_colaborador       INT NULL,
	id_ciclo             INT NULL,
	can_evaluaciones     TINYINT NULL,
	salon_fisico         VARCHAR(100) NULL,
	fec_reg              DATETIME NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	horas_semanales      TINYINT NULL,
	id_seccion           INT NULL,
	PRIMARY KEY (id_clase)
);



CREATE TABLE Colaborador
(
	id_colaborador       INT NOT NULL AUTO_INCREMENT,
	nombres              VARCHAR(150) NULL,
	ap_paterno           VARCHAR(80) NULL,
	ap_materno           VARCHAR(80) NULL,
	sexo                 CHAR(1) NULL,
	fec_nac              DATE NULL,
	domicilio            TEXT NULL,
	cel                  VARCHAR(15) NULL,
	estado               BIT NULL,
	id_cargo             INT NULL,
	tipo_doc             CHAR(3) NULL,
	nro_doc              VARCHAR(15) NULL,
	id_usu               INT NULL,
	situacion            VARCHAR(20) NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_colaborador)
);



CREATE TABLE Conducta
(
	id_conducta          INT NOT NULL AUTO_INCREMENT,
	P1                   TINYINT NULL,
	fec_reg              DATETIME NULL,
	estado               BIT NULL,
	id_estudiante        INT NULL,
	id_usu               INT NULL,
	P2                   TINYINT NULL,
	P3                   TINYINT NULL,
	P4                   TINYINT NULL,
	id_clase             INT NULL,
	PRIMARY KEY (id_conducta)
);



CREATE TABLE Curso
(
	id_curso             INT NOT NULL AUTO_INCREMENT,
	curso                VARCHAR(150) NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_curso)
);



CREATE TABLE Estudiante
(
	id_estudiante        INT NOT NULL AUTO_INCREMENT,
	nombres              VARCHAR(150) NULL,
	ap_paterno           VARCHAR(80) NULL,
	ap_materno           VARCHAR(80) NULL,
	sexo                 CHAR(1) NULL,
	fec_nac              DATE NULL,
	domicilio            TEXT NULL,
	cel_estudiante       VARCHAR(15) NULL,
	apoderado            VARCHAR(250) NULL,
	cel_apoderado        VARCHAR(15) NULL,
	estado               BIT NULL,
	fec_reg              DATETIME NULL,
	tipo_doc             CHAR(3) NULL,
	nro_doc              VARCHAR(15) NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_estudiante)
);



CREATE TABLE Exp_Emocional
(
	id_emo               INT NOT NULL AUTO_INCREMENT,
	fecha_doc            DATE NULL,
	estado               BIT NULL,
	id_colaborador       INT NULL,
	id_estudiante        INT NULL,
	id_ciclo             INT NULL,
	motivo               VARCHAR(250) NULL,
	observaciones        TEXT NULL,
	estado_exp           VARCHAR(10) NULL,
	id_usu               INT NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_emo)
);



CREATE TABLE Formulario
(
	id_form              INT NOT NULL AUTO_INCREMENT,
	formulario           VARCHAR(100) NULL,
	estado               BIT NULL,
	PRIMARY KEY (id_form)
);



CREATE TABLE Formulario_perfil
(
	id_form              INT NOT NULL ,
	id_perfil            INT NOT NULL ,
	estado               BIT NULL,
	PRIMARY KEY (id_form,id_perfil)
);



CREATE TABLE Grado
(
	id_grado             INT NOT NULL AUTO_INCREMENT,
	grado                CHAR(1) NULL,
	id_nivel             INT NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_grado)
);



CREATE TABLE Incidente
(
	id_incidente         INT NOT NULL AUTO_INCREMENT,
	incidente            VARCHAR(250) NULL,
	estado               BIT NULL,
	fec_reg              DATETIME NULL,
	fec_incidente        DATE NULL,
	id_estudiante        INT NULL,
	id_usu               INT NULL,
	dt_incidente         TEXT NULL,
	PRIMARY KEY (id_incidente)
);



CREATE TABLE Matricula
(
	id_matricula         INT NOT NULL AUTO_INCREMENT,
	id_ciclo             INT NULL,
	id_estudiante        INT NULL,
	fecha_doc            DATE NULL,
	fecha_reg            DATETIME NULL,
	estado               BIT NULL,
	id_seccion           INT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_matricula)
);



CREATE TABLE Nivel
(
	id_nivel             INT NOT NULL AUTO_INCREMENT,
	nivel                VARCHAR(50) NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_nivel)
);



CREATE TABLE Perfil
(
	id_perfil            INT NOT NULL AUTO_INCREMENT,
	perfil               VARCHAR(80) NULL,
	estado               BIT NULL,
	PRIMARY KEY (id_perfil)
);



CREATE TABLE periodo
(
	id_periodo           INT NOT NULL AUTO_INCREMENT,
	periodo              VARCHAR(70) NULL,
	id_ciclo             INT NULL,
	fec_ini              DATE NULL,
	fec_fin              DATE NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	PRIMARY KEY (id_periodo)
);



CREATE TABLE Seccion
(
	id_seccion           INT NOT NULL AUTO_INCREMENT,
	seccion              CHAR(1) NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	id_ciclo             INT NULL,
	id_colaborador       INT NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_seccion)
);



CREATE TABLE Seguimiento_Emo
(
	id_semo              INT NOT NULL AUTO_INCREMENT,
	id_emo               INT NULL,
	fecha_doc            DATE NULL,
	detalle              TEXT NULL,
	estado               BIT NULL,
	id_usu               INT NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_semo)
);



CREATE TABLE Usuarios
(
	id_usu               INT NOT NULL AUTO_INCREMENT,
	usu                  VARCHAR(70) NULL,
	pwd                  BLOB NULL,
	estado               BIT NULL,
	id_colaborador       INT NULL,
	id_perfil            INT NULL,
	estado_usu           BIT NULL,
	fec_reg              DATETIME NULL,
	PRIMARY KEY (id_usu)
);



ALTER TABLE Area
ADD FOREIGN KEY R_59 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Asistencia
ADD FOREIGN KEY R_23 (id_estudiante) REFERENCES Estudiante (id_estudiante);



ALTER TABLE Asistencia
ADD FOREIGN KEY R_25 (id_clase) REFERENCES Clase (id_clase);



ALTER TABLE Asistencia
ADD FOREIGN KEY R_54 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Calificaciones
ADD FOREIGN KEY R_83 (id_periodo) REFERENCES periodo (id_periodo);



ALTER TABLE Calificaciones
ADD FOREIGN KEY R_84 (id_clase) REFERENCES Clase (id_clase);



ALTER TABLE Calificaciones
ADD FOREIGN KEY R_85 (id_estudiante) REFERENCES Estudiante (id_estudiante);



ALTER TABLE Calificaciones
ADD FOREIGN KEY R_86 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Cargo
ADD FOREIGN KEY R_43 (id_area) REFERENCES Area (id_area);



ALTER TABLE Cargo
ADD FOREIGN KEY R_60 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Ciclo
ADD FOREIGN KEY R_49 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Clase
ADD FOREIGN KEY R_5 (id_curso) REFERENCES Curso (id_curso);



ALTER TABLE Clase
ADD FOREIGN KEY R_6 (id_colaborador) REFERENCES Colaborador (id_colaborador);



ALTER TABLE Clase
ADD FOREIGN KEY R_19 (id_ciclo) REFERENCES Ciclo (id_ciclo);



ALTER TABLE Clase
ADD FOREIGN KEY R_61 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Clase
ADD FOREIGN KEY R_69 (id_seccion) REFERENCES Seccion (id_seccion);



ALTER TABLE Colaborador
ADD FOREIGN KEY R_44 (id_cargo) REFERENCES Cargo (id_cargo);



ALTER TABLE Colaborador
ADD FOREIGN KEY R_58 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Conducta
ADD FOREIGN KEY R_66 (id_estudiante) REFERENCES Estudiante (id_estudiante);



ALTER TABLE Conducta
ADD FOREIGN KEY R_68 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Conducta
ADD FOREIGN KEY R_82 (id_clase) REFERENCES Clase (id_clase);



ALTER TABLE Curso
ADD FOREIGN KEY R_55 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Estudiante
ADD FOREIGN KEY R_51 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Exp_Emocional
ADD FOREIGN KEY R_71 (id_colaborador) REFERENCES Colaborador (id_colaborador);



ALTER TABLE Exp_Emocional
ADD FOREIGN KEY R_73 (id_estudiante) REFERENCES Estudiante (id_estudiante);



ALTER TABLE Exp_Emocional
ADD FOREIGN KEY R_77 (id_ciclo) REFERENCES Ciclo (id_ciclo);



ALTER TABLE Exp_Emocional
ADD FOREIGN KEY R_79 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Formulario_perfil
ADD FOREIGN KEY R_47 (id_form) REFERENCES Formulario (id_form);



ALTER TABLE Formulario_perfil
ADD FOREIGN KEY R_48 (id_perfil) REFERENCES Perfil (id_perfil);



ALTER TABLE Grado
ADD FOREIGN KEY R_21 (id_nivel) REFERENCES Nivel (id_nivel);



ALTER TABLE Grado
ADD FOREIGN KEY R_57 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Incidente
ADD FOREIGN KEY R_30 (id_estudiante) REFERENCES Estudiante (id_estudiante);



ALTER TABLE Incidente
ADD FOREIGN KEY R_52 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Matricula
ADD FOREIGN KEY R_74 (id_ciclo) REFERENCES Ciclo (id_ciclo);



ALTER TABLE Matricula
ADD FOREIGN KEY R_75 (id_estudiante) REFERENCES Estudiante (id_estudiante);



ALTER TABLE Matricula
ADD FOREIGN KEY R_76 (id_seccion) REFERENCES Seccion (id_seccion);



ALTER TABLE Matricula
ADD FOREIGN KEY R_81 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Nivel
ADD FOREIGN KEY R_56 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE periodo
ADD FOREIGN KEY R_14 (id_ciclo) REFERENCES Ciclo (id_ciclo);



ALTER TABLE periodo
ADD FOREIGN KEY R_50 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Seccion
ADD FOREIGN KEY R_62 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Seccion
ADD FOREIGN KEY R_70 (id_ciclo) REFERENCES Ciclo (id_ciclo);



ALTER TABLE Seccion
ADD FOREIGN KEY R_72 (id_colaborador) REFERENCES Colaborador (id_colaborador);



ALTER TABLE Seguimiento_Emo
ADD FOREIGN KEY R_78 (id_emo) REFERENCES Exp_Emocional (id_emo);



ALTER TABLE Seguimiento_Emo
ADD FOREIGN KEY R_80 (id_usu) REFERENCES Usuarios (id_usu);



ALTER TABLE Usuarios
ADD FOREIGN KEY R_45 (id_colaborador) REFERENCES Colaborador (id_colaborador);



ALTER TABLE Usuarios
ADD FOREIGN KEY R_46 (id_perfil) REFERENCES Perfil (id_perfil);






