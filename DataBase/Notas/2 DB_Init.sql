use DB_School;

/* DESACTIVAR CONSTRAINTS FOREIGN KEY */

SET FOREIGN_KEY_CHECKS=0;

/*****************************************/
/******** AREAS */
/*****************************************/

INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('System32',1,1);

-- > SUPUESTOS
INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('Administracion',1,1);
INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('Psicologia',1,1);
INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('Pedagogia',1,1);
INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('Contable',1,1);
INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('Mantenimiento',1,1);
INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('Informatica',1,1);

-- select * from AREA ;
/*****************************************/
/******** CARGOS */
/*****************************************/

INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Developer',now(),1,1,1);

-- > SUPUESTOS
INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Director',now(),1,2,1);
INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Psicologo',now(),1,3,1);
INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Docente',now(),1,4,1);
INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Contador',now(),1,5,1);
INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Soporte Informatico',now(),1,7,1);
INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Auxiliar',now(),1,4,1);

select * from Cargo;
/*****************************************/
/****** COLABORADOR */
/*****************************************/

/*ALTER TABLE colaborador MODIFY id_colaborador INT; */

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('SystemT','','','M',null,'','',1,1,'DNI','00000000',1,'RESERVADO',CURDATE());

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('SystemR','','','M',null,'','',1,1,'DNI','00000000',1,'RESERVADO',CURDATE());

-- > SUPUESTOS
INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('Profe Pepito','apeP','maternP','M',null,'','',1,4,'DNI','00000000',1,'ACTIVO',CURDATE());

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('Profe Martiza','apeM','materM','F',null,'','',1,4,'DNI','00000000',1,'ACTIVO',CURDATE());

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('Psico Pipi','apeP','matP','M',null,'','',1,3,'DNI','00000000',1,'ACTIVO',CURDATE());

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('Director Juan','apeJ','matJ','M',null,'','',1,2,'DNI','00000000',1,'ACTIVO',CURDATE());

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('Aux Fredy','apeF','matF','M',null,'','',1,7,'DNI','00000000',1,'ACTIVO',CURDATE());

-- Select * from colaborador;

/* NO DA
ALTER TABLE colaborador MODIFY id_colaborador INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE colaborador CHANGE COLUMN `id_colaborador` `id_colaborador` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE tablename AUTO_INCREMENT SET 1;
*/

/*select * from COLABORADOR;*/

/*****************************************/
/******** CATEGORIA FORMULARIO  */
/*****************************************/
INSERT INTO CAT_FORM (`cat_form`) values ('Docente');
INSERT INTO CAT_FORM (`cat_form`) values ('Piscologico');
INSERT INTO CAT_FORM (`cat_form`) values ('Auxiliar');
INSERT INTO CAT_FORM (`cat_form`) values ('Seguridad');
INSERT INTO CAT_FORM (`cat_form`) values ('Academico');



/*****************************************/
/******** FORMULARIOS  */
/*****************************************/

INSERT INTO formulario (`formulario`,`estado`,`id_cat_form`)VALUES ('Ciclo',1,5);
INSERT INTO formulario (`formulario`,`estado`,`id_cat_form`)VALUES ('Periodo',1,5);
INSERT INTO formulario (`formulario`,`estado`,`id_cat_form`)VALUES ('Calificaciones',1,1);
INSERT INTO formulario (`formulario`,`estado`,`id_cat_form`)VALUES ('Seguimiento Emocional',1,2);
INSERT INTO formulario (`formulario`,`estado`,`id_cat_form`)VALUES ('Incidente',1,3);
INSERT INTO formulario (`formulario`,`estado`,`id_cat_form`)VALUES ('Usuarios',1,4);

-- select * from formulario;

/*****************************************/
/******** PERFIL */
/*****************************************/

INSERT INTO perfil (`perfil`,`estado`) VALUES ('Administrador',1);
INSERT INTO perfil (`perfil`,`estado`) VALUES ('Docente',1);
INSERT INTO perfil (`perfil`,`estado`) VALUES ('Auxiliar',1);
INSERT INTO perfil (`perfil`,`estado`) VALUES ('Psicologo',1);

/*****************************************/
/******** FORMULARIOS_ PERFIL  */
/*****************************************/

INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (1,1,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (2,1,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (3,1,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (4,1,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (5,1,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (3,2,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (4,4,1);
INSERT INTO formulario_perfil (`id_form`,`id_perfil`,`estado`) values (5,3,1);

-- select * from formulario_perfil;

/*****************************************/
/******** USUARIOS */
/*****************************************/

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('atomasto',AES_ENCRYPT('a1con9v','S3rver@.@Net'),1,1,1,1,now());
INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('jrivera',AES_ENCRYPT('password','S3rver@.@Net'),1,2,1,1,now());

-- > SUPUESTOS

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('ppepito',AES_ENCRYPT('ppepito','S3rver@.@Net'),1,3,2,1,now());

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('pmaria',AES_ENCRYPT('pmaria','S3rver@.@Net'),1,4,2,1,now());

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('ppipi',AES_ENCRYPT('ppipi','S3rver@.@Net'),1,5,4,1,now());

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('djuan',AES_ENCRYPT('djuan','S3rver@.@Net'),1,6,1,1,now());

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('afredy',AES_ENCRYPT('afredy','S3rver@.@Net'),1,7,3,1,now());

/* 
SELECT  *, cast(aes_decrypt(pwd, 'S3rver@.@Net') as char) as 'Descifrado'  FrOM USUARIOS; 
*/

SET FOREIGN_KEY_CHECKS=1;
