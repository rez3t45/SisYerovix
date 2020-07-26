USE SysTraDoc;

/* DESACTIVAR CONSTRAINTS FOREIGN KEY */

SET FOREIGN_KEY_CHECKS=0;

/*****************************************/
/****** PERSONA */
/*****************************************/

/*ALTER TABLE PERSONA NOCHECK CONSTRAINT ALL; NO SIRVE en MYSQL*/

INSERT INTO PERSONA (`id_persona`,`tipo_doc`,`num_doc`,`nombres`,`apellidos`,`correo`,`celular`,`fecha_reg`,`estado`,`id_area`,`id_usuario`,`telefono`)
VALUES (0,'','','System','','','',NOW(),1,0,0,'');

/*select * from PERSONA;*/

/*****************************************/
/******** USUARIOS */
/*****************************************/

INSERT INTO usuarios (`id_usuario`, `usu`, `pwd`, `estado`, `id_persona`, `id_perfil`)
VALUES (0,'admin','Password$1', 1, 0 , 0);

/* SELECT * FROM usuarios */

/*****************************************/
/******** PERFILES */
/*****************************************/

INSERT INTO perfil (`id_perfil`, `perfil`, `estado`)
VALUES (0,'admintotal',1);

/*****************************************/
/******** TIPOS DOC */
/*****************************************/

INSERT INTO tipos_doc (`id_tipo_doc`, `tipo_doc`, `estado`, `fecha_reg`, `id_usuario`) VALUES (1,'Solicitud',1,now(),0);
INSERT INTO tipos_doc (`id_tipo_doc`, `tipo_doc`, `estado`, `fecha_reg`, `id_usuario`) VALUES (2,'Carta',1,now(),0);
INSERT INTO tipos_doc (`id_tipo_doc`, `tipo_doc`, `estado`, `fecha_reg`, `id_usuario`) VALUES (3,'Oficio',1,now(),0);
INSERT INTO tipos_doc (`id_tipo_doc`, `tipo_doc`, `estado`, `fecha_reg`, `id_usuario`) VALUES (4,'Notificacion',1,now(),0);
INSERT INTO tipos_doc (`id_tipo_doc`, `tipo_doc`, `estado`, `fecha_reg`, `id_usuario`) VALUES (5,'Resolucion',1,now(),0);
/*INSERT INTO tipos_doc (`id_tipo_doc`, `tipo_doc`, `estado`, `fecha_reg`, `id_usuario`) VALUES (6,'otros',1,now(),0);*/

/*****************************************/
/******** AREAS */
/*****************************************/

INSERT INTO  areas (`id_area`,`area`,`estado`,`fecha_reg`,`id_usuario`)
VALUES (0,'Mesa de Partes',1,now(),0);

/*****************************************/
/******** AREAS */
/*****************************************/

INSERT INTO  estado_tramite (`id_est_tramite`,`est_tram1`,`fecha_reg`,`estado`,`est_tram2`) VALUES (1,'Emitido',now(),1,'Emite Tramite');
INSERT INTO  estado_tramite (`id_est_tramite`,`est_tram1`,`fecha_reg`,`estado`,`est_tram2`) VALUES (2,'Derivado',now(),1,'Deriva');
INSERT INTO  estado_tramite (`id_est_tramite`,`est_tram1`,`fecha_reg`,`estado`,`est_tram2`) VALUES (3,'Resuelto',now(),1,'Resuelve');
INSERT INTO  estado_tramite (`id_est_tramite`,`est_tram1`,`fecha_reg`,`estado`,`est_tram2`) VALUES (4,'Rechazado',now(),1,'Rechaza');


/*****************************************/
/******** UBICACION */
/*****************************************/

INSERT INTO  ubicacion (`id_ubicacion`,`ubicacion`,`fecha_reg`,`estado`,`id_usuario`) VALUES (1,'Institucion',now(),1,0);


SET FOREIGN_KEY_CHECKS=1;

/*
Create procedure Tsp_Graba_Areas
(
in area,
in id_usuario
)
begin
INSERT INTO AREAS (`id_area`,`area`,`estado`,`fecha_reg`,`id_usuario`)
VALUES
(<{id_area: }>,
<{area: }>,
<{estado: }>,
<{fecha_reg: }>,
<{id_usuario: }>);
END

DELIMITER //

Create procedure Tsp_Lista_links_x_usu
( Puser_id int)
begin
	select * from links where user_id = Puser_id;
end //

DELIMITER ;
*/