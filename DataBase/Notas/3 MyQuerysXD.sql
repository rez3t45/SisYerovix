use DB_School;

/* ALTER IS NOT SUPPORT IN THIS COMMIT :
 https://www.mysqltutorial.org/mysql-stored-procedure/alter-stored-procedure/#:~:text=So%20you%20need%20to%20add,and%20click%20the%20Apply%20button.
 
  Only Drop and ReCreate
*/

DELIMITER //
CREATE procedure Tsp_Insert_Usuarios
(
 usu_ varchar(70) ,
 pwd_ varchar(70) ,
 id_colaborador_ int,
 id_perfil_ int 
)
begin
	INSERT INTO  usuarios (`usu`,`pwd`,`estado`,`id_colaborador`,`id_perfil`, `estado_usu`,`fec_reg`) 
	VALUES (usu_,AES_ENCRYPT(pwd_,'S3rver@.@Net'),1,id_colaborador_,id_perfil_,1,now());
end 
//
DELIMITER ;

-- CALL Tsp_Insert_Usuarios ('users','pwd',1,1); 

DELIMITER //
CREATE procedure Tsp_Login
(
 usu_ varchar(70) ,
 pwd_ varchar(70)
)
begin

/*	
SELECT  u.id_usu,id_perfil,c.nombres 'Colaborador' FrOM USUARIOS u RIGHT join  colaborador c on u.id_colaborador = c.id_colaborador
where u.usu like usu_  and cast(aes_decrypt(u.pwd, 'S3rver@.@Net') as char) like pwd_;
*/

SELECT  u.id_usu,id_perfil FrOM USUARIOS u  
where u.usu like usu_  and cast(aes_decrypt(u.pwd, 'S3rver@.@Net') as char) like pwd_;

end 
//
DELIMITER ;

-- CALL Tsp_Login ('atomasto','a1con9v');

DELIMITER //
CREATE procedure Tsp_Max_id_Usu
()
begin
	select max(id_usu) as id_usu from usuarios ;
end 
//
DELIMITER ;

-- call Tsp_Max_id_Usu

DELIMITER //
CREATE procedure Tsp_Get_datos_usu_x_IdUsu
(
 id_usu_ int
 )
begin
	SELECT  u.id_usu,p.id_perfil,p.perfil,u.usu, concat(c.nombres,' ' ,c.ap_paterno,' ' ,c.ap_materno) 'Colaborador' 
	FrOM USUARIOS u RIGHT join  colaborador c on u.id_colaborador = c.id_colaborador inner join Perfil p on u.id_perfil = p.id_perfil
    where u.id_usu = id_usu_;  
end 
//
DELIMITER ;

-- call Tsp_Get_datos_usu_x_IdUsu (4);

DELIMITER //
CREATE procedure Tsp_Get_Forms_x_idPerfil
(
 id_perfil_ int
 )
begin
	SELECT id_form  from Formulario_perfil 
    where id_perfil = id_perfil_ and estado = 1;
end 
//
DELIMITER ;

-- call Tsp_Get_Forms_x_idPerfil (1)
 



 
