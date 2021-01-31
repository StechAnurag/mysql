CREATE DEFINER=`root`@`localhost` PROCEDURE `variable_scope_and_multiple_cursors`(
	OUT titles TEXT,
    OUT fruits TEXT
)
BEGIN
	# 1st begin end block to scope the variables
	BEGIN
		DECLARE the_title VARCHAR(40);
		DECLARE the_category VARCHAR(20);
		DECLARE finished BOOL DEFAULT false;
		
		DECLARE books_cursor CURSOR FOR SELECT product, category FROM products;
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished := true;
		SET titles = '';
		OPEN books_cursor;
			the_loop: LOOP
				FETCH books_cursor INTO the_title, the_category;
                
				IF finished = true THEN
					LEAVE the_loop;
				END IF;
                
				IF the_category = 'book' THEN
					SET titles := concat(titles, the_title, ', ');
				END IF;
			END LOOP the_loop;
		CLOSE books_cursor;
	END;
    
    #2nd Begin end block
    BEGIN
		DECLARE the_fruit VARCHAR(40);
		DECLARE finished BOOL DEFAULT false;
		
		DECLARE fruits_cursor CURSOR FOR SELECT p.product FROM fruits f JOIN products p ON f.product_id = p.id;
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished := true;
		SET fruits = '';
		OPEN fruits_cursor;
			the_loop: LOOP
				FETCH fruits_cursor INTO the_fruit;
				IF finished = true THEN
					LEAVE the_loop;
				END IF;
				SET fruits := concat(fruits, the_fruit, ', ');
			END LOOP the_loop;
		CLOSE fruits_cursor; 
	END;
END

call variable_scope_and_multiple_cursors(@titles, @fruits);

select @fruits, @titles;