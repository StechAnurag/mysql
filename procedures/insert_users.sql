CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_users`()
BEGIN
	declare num_rows int default 10000;
    declare count int default 0;
    
    declare email_val varchar(50) default null;
    declare register_val date default null;
    declare active_val boolean default false;
    
    drop table if exists users;
    create table users(
		id int primary key auto_increment,
        email varchar(50) not null,
        registered date not null,
        active boolean default false
    );
    
    while count < num_rows do
		set email_val 	:= concat('user', count, '@gmail.com');
        set register_val:= date(now()) - interval floor(rand() * 10000) day;
        set active_val 	:= round(rand());
        
        insert into users(email, registered, active) values(email_val, register_val, active_val);
        
        set count := count + 1;
    end while;
    
    select '1000 users inserted' as success;
END

call insert_users();
-- insertion of 10000 users took 45sec approx.
