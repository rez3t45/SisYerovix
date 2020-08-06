use DB_School;

/* DESACTIVAR CONSTRAINTS FOREIGN KEY */

SET FOREIGN_KEY_CHECKS=0;

/*****************************************/
/******** AREAS */
/*****************************************/

INSERT INTO  area (`area`,`estado`,`id_usu`) VALUES ('System32',1,1);

/*****************************************/
/******** CARGOS */
/*****************************************/

INSERT INTO cargo (`cargo`,`fec_reg`,`estado`, `id_area`, `id_usu`) VALUES  ('Developer',now(),1,1,1);


/*****************************************/
/****** COLABORADOR */
/*****************************************/

/*ALTER TABLE colaborador MODIFY id_colaborador INT; */

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('SystemT','','','M',null,'','',1,1,'DNI','00000000',1,'RESERVADO',CURDATE());

INSERT INTO colaborador (`nombres`,`ap_paterno`,`ap_materno`,`sexo`,`fec_nac`,`domicilio`,`cel`,`estado`,`id_cargo`,`tipo_doc`,`nro_doc`,`id_usu`,`situacion`,`fec_reg`)
VALUES ('SystemR','','','M',null,'','',1,1,'DNI','00000000',1,'RESERVADO',CURDATE());


/* NO DA
ALTER TABLE colaborador MODIFY id_colaborador INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE colaborador CHANGE COLUMN `id_colaborador` `id_colaborador` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE tablename AUTO_INCREMENT SET 1;
*/

/*select * from COLABORADOR;*/

/*****************************************/
/******** PERFIL */
/*****************************************/

INSERT INTO perfil (`perfil`,`estado`) VALUES ('Administrador',1);
INSERT INTO perfil (`perfil`,`estado`) VALUES ('Docente',1);
INSERT INTO perfil (`perfil`,`estado`) VALUES ('Auxiliar',1);
INSERT INTO perfil (`perfil`,`estado`) VALUES ('Psicologo',1);

/*****************************************/
/******** USUARIOS */
/*****************************************/

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('atomasto',AES_ENCRYPT('a1con9v','S3rver@.@Net'),1,1,1,1,now());

INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
VALUES ('jrivera',AES_ENCRYPT('password','S3rver@.@Net'),1,2,1,1,now());

/* 
SELECT  *, cast(aes_decrypt(pwd, 'S3rver@.@Net') as char) as 'Descifrado'  FrOM USUARIOS; 
*/





SET FOREIGN_KEY_CHECKS=1;
