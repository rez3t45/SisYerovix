DELIMITER //

Create procedure Tsp_Lista_links_x_usu
( Puser_id int)
begin
	select * from links where user_id = Puser_id;
end //

DELIMITER ;