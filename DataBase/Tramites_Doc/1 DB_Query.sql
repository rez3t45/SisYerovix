/*DROP DATABASE SysTraDoc;*/

CREATE DATABASE SysTraDoc;

use SysTraDoc;


CREATE TABLE Adjuntos
(
	id_ajunto            INT NOT NULL,
	adjunto              BLOB NULL,
	id_Tramite_Estudiante INT NULL,
	id_Tramite_Administrativo INT NULL,
	tipo                 VARCHAR(80) NULL
);



ALTER TABLE Adjuntos
ADD PRIMARY KEY (id_ajunto);



CREATE TABLE Areas
(
	id_area              INT NOT NULL,
	area                 VARCHAR(150) NULL,
	estado               BIT NULL,
	fecha_reg            DATETIME NULL,
	id_usuario           INT NULL
);



ALTER TABLE Areas
ADD PRIMARY KEY (id_area);



CREATE TABLE Estado_Tramite
(
	id_est_tramite       INT NOT NULL,
	est_tram1            VARCHAR(80) NULL,
	fecha_reg            DATETIME NULL,
	estado               BIT NULL,
	est_tram2            VARCHAR(80) NULL
);



ALTER TABLE Estado_Tramite
ADD PRIMARY KEY (id_est_tramite);



CREATE TABLE Form_Perfil
(
	id_op_perfil         INT NOT NULL,
	estado               BIT NULL,
	id_perfil            INT NULL,
	id_form              INT NULL
);



ALTER TABLE Form_Perfil
ADD PRIMARY KEY (id_op_perfil);



CREATE TABLE Formularios
(
	id_form              INT NOT NULL,
	formulario           VARCHAR(150) NULL,
	estado               BIT NULL
);



ALTER TABLE Formularios
ADD PRIMARY KEY (id_form);



CREATE TABLE Movimientos
(
	id_mov               INT NOT NULL,
	fecha_reg            DATETIME NULL,
	destino              VARCHAR(70) NULL,
	obs                  TEXT NULL,
	archivo              BLOB NULL,
	estado               BIT NULL,
	id_Tramite_Administrativo INT NULL,
	id_Tramite_Estudiante INT NULL,
	id_usuario           INT NULL,
	origen               VARCHAR(70) NULL,
	id_est_tramite       INT NULL
);



ALTER TABLE Movimientos
ADD PRIMARY KEY (id_mov);



CREATE TABLE Perfil
(
	id_perfil            INT NOT NULL,
	perfil               VARCHAR(30) NULL,
	estado               BIT NULL
);



ALTER TABLE Perfil
ADD PRIMARY KEY (id_perfil);



CREATE TABLE Persona
(
	id_persona           INT NOT NULL,
	tipo_doc             CHAR(3) NULL,
	num_doc              VARCHAR(15) NULL,
	nombres              VARCHAR(100) NULL,
	correo               VARCHAR(30) NULL,
	celular              VARCHAR(15) NULL,
	fecha_reg            DATETIME NULL,
	estado               BIT NULL,
	id_area              INT NULL,
	id_usuario           INT NULL,
	telefono             VARCHAR(15) NULL,
	apellidos            VARCHAR(100) NULL
);



ALTER TABLE Persona
ADD PRIMARY KEY (id_persona);



CREATE TABLE Tipos_doc
(
	id_tipo_doc          INT NOT NULL,
	tipo_doc             VARCHAR(150) NULL,
	estado               BIT NULL,
	fecha_reg            DATETIME NULL,
	id_usuario           INT NULL
);



ALTER TABLE Tipos_doc
ADD PRIMARY KEY (id_tipo_doc);



CREATE TABLE Tramite_Administrativo
(
	id_Tramite_Administrativo INT NOT NULL,
	titulo               VARCHAR(200) NULL,
	dt_tramite           TEXT NULL,
	fecha_tramite        DATETIME NULL,
	archivo              BLOB NULL,
	nro_folios           VARCHAR(3) NULL,
	id_tipo_doc          INT NULL,
	id_ubicacion         INT NULL,
	id_area              INT NULL,
	estado               BIT NULL,
	fecha_reg            DATETIME NULL,
	id_est_tramite       INT NULL,
	id_usuario           INT NULL,
	id_persona           INT NULL,
	id_ref               VARCHAR(15) NULL
);



ALTER TABLE Tramite_Administrativo
ADD PRIMARY KEY (id_Tramite_Administrativo);



CREATE TABLE Tramite_Estudiante
(
	id_Tramite_Estudiante INT NOT NULL,
	nro_doc              VARCHAR(15) NULL,
	nombre_sol           VARCHAR(150) NULL,
	paterno_sol          VARCHAR(80) NULL,
	materno_sol          VARCHAR(80) NULL,
	email_sol            VARCHAR(80) NULL,
	cel_sol              VARCHAR(15) NULL,
	tel_sol              VARCHAR(15) NULL,
	nombre_alu           VARCHAR(100) NULL,
	paterno_alu          VARCHAR(80) NULL,
	materno_alu          VARCHAR(80) NULL,
	nivel_alu            CHAR(1) NULL,
	grado_alu            CHAR(1) NULL,
	seccion_alu          VARCHAR(2) NULL,
	direccion_sol        VARCHAR(200) NULL,
	dt_tramite           TEXT NULL,
	archivo              BLOB NULL,
	nro_folios           VARCHAR(3) NULL,
	anio_fin_alu         VARCHAR(4) NULL,
	fecha_reg            DATETIME NULL,
	estado               BIT NULL,
	id_est_tramite       INT NULL,
	id_usuario           INT NULL,
	id_area              INT NULL,
	img_pago             BLOB NULL,
	id_ref               VARCHAR(15) NULL
);



ALTER TABLE Tramite_Estudiante
ADD PRIMARY KEY (id_Tramite_Estudiante);



CREATE TABLE Ubicacion
(
	id_ubicacion         INT NOT NULL,
	ubicacion            VARCHAR(300) NULL,
	fecha_reg            DATETIME NULL,
	estado               BIT NULL,
	id_usuario           INT NULL
);



ALTER TABLE Ubicacion
ADD PRIMARY KEY (id_ubicacion);



CREATE TABLE Usuarios
(
	id_usuario           INT NOT NULL,
	usu                  VARCHAR(30) NULL,
	pwd                  VARCHAR(30) NULL,
	estado               BIT NULL,
	id_persona           INT NULL,
	id_perfil            INT NULL
);



ALTER TABLE Usuarios
ADD PRIMARY KEY (id_usuario);



ALTER TABLE Adjuntos
ADD FOREIGN KEY R_8 (id_Tramite_Estudiante) REFERENCES Tramite_Estudiante (id_Tramite_Estudiante);



ALTER TABLE Adjuntos
ADD FOREIGN KEY R_9 (id_Tramite_Administrativo) REFERENCES Tramite_Administrativo (id_Tramite_Administrativo);



ALTER TABLE Areas
ADD FOREIGN KEY R_16 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Form_Perfil
ADD FOREIGN KEY R_45 (id_perfil) REFERENCES Perfil (id_perfil);



ALTER TABLE Form_Perfil
ADD FOREIGN KEY R_47 (id_form) REFERENCES Formularios (id_form);



ALTER TABLE Movimientos
ADD FOREIGN KEY R_32 (id_Tramite_Administrativo) REFERENCES Tramite_Administrativo (id_Tramite_Administrativo);



ALTER TABLE Movimientos
ADD FOREIGN KEY R_33 (id_Tramite_Estudiante) REFERENCES Tramite_Estudiante (id_Tramite_Estudiante);



ALTER TABLE Movimientos
ADD FOREIGN KEY R_34 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Movimientos
ADD FOREIGN KEY R_48 (id_est_tramite) REFERENCES Estado_Tramite (id_est_tramite);



ALTER TABLE Persona
ADD FOREIGN KEY R_40 (id_area) REFERENCES Areas (id_area);



ALTER TABLE Persona
ADD FOREIGN KEY R_41 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Tipos_doc
ADD FOREIGN KEY R_14 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Tramite_Administrativo
ADD FOREIGN KEY R_18 (id_tipo_doc) REFERENCES Tipos_doc (id_tipo_doc);



ALTER TABLE Tramite_Administrativo
ADD FOREIGN KEY R_19 (id_ubicacion) REFERENCES Ubicacion (id_ubicacion);



ALTER TABLE Tramite_Administrativo
ADD FOREIGN KEY R_20 (id_area) REFERENCES Areas (id_area);



ALTER TABLE Tramite_Administrativo
ADD FOREIGN KEY R_21 (id_persona) REFERENCES Persona (id_persona);



ALTER TABLE Tramite_Administrativo
ADD FOREIGN KEY R_23 (id_est_tramite) REFERENCES Estado_Tramite (id_est_tramite);



ALTER TABLE Tramite_Administrativo
ADD FOREIGN KEY R_24 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Tramite_Estudiante
ADD FOREIGN KEY R_11 (id_est_tramite) REFERENCES Estado_Tramite (id_est_tramite);



ALTER TABLE Tramite_Estudiante
ADD FOREIGN KEY R_13 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Tramite_Estudiante
ADD FOREIGN KEY R_28 (id_area) REFERENCES Areas (id_area);



ALTER TABLE Ubicacion
ADD FOREIGN KEY R_17 (id_usuario) REFERENCES Usuarios (id_usuario);



ALTER TABLE Usuarios
ADD FOREIGN KEY R_15 (id_persona) REFERENCES Persona (id_persona);



ALTER TABLE Usuarios
ADD FOREIGN KEY R_43 (id_perfil) REFERENCES Perfil (id_perfil);

