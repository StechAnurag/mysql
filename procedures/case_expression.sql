CREATE DEFINER=`root`@`localhost` PROCEDURE `sort_grocery`(
	OUT unassigned VARCHAR(255)
)
BEGIN
	DECLARE finished BOOLEAN DEFAULT false;
    DECLARE product_id INT;
    DECLARE the_product VARCHAR(40);
    DECLARE category_name VARCHAR(40);
    
	DECLARE cur1 CURSOR FOR select id, product, category from products order by id;
    
	DECLARE CONTINUE HANDLER FOR not found SET finished := true;
    
    SET unassigned := '';
    
    OPEN cur1;
		the_loop: loop
			FETCH cur1 INTO product_id, the_product, category_name;
            
            if finished = true then
				LEAVE the_loop;
            end if;
            
            case category_name
				when 'fruit' then
					insert into fruits(product_id) values(product_id);
				when 'vegetable' then
					insert into vegetables(product_id) values(product_id);
				when 'bakery' then
					insert into bakery(product_id) values(product_id);
				else
					SET unassigned := concat(unassigned, the_product, ', ');
			end case;
		end loop the_loop;
    CLOSE cur1;
END

call sort_grocery(@unassigned);

select @unassigned;