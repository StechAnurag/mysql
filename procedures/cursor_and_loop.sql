CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_and_loop`()
BEGIN
	declare the_email varchar(40);
    declare finished boolean default false;
    
    declare cur1 cursor for select email from users where active = true AND registered > date(now()) - interval 1 year;
    
    -- define an error handler
    declare continue handler for not found set finished := true;
    
    open cur1;
		the_loop: loop
			fetch cur1 INTO the_email;
        
			if finished = true then
				leave the_loop;
            end if;
            
            insert into leads values(default, the_email);
        end loop the_loop;
    close cur1;
END

call cursor_and_loop();