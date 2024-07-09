USE hw_6;

/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

-- 1

DELIMITER $$ -- //

CREATE FUNCTION format_seconds(seconds_input INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    DECLARE result VARCHAR(100);

    SET days = FLOOR(seconds_input / 86400);

    SET hours = FLOOR((seconds_input % 86400) / 3600);

    SET minutes = FLOOR((seconds_input % 3600) / 60);

    SET seconds = seconds_input % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END $$ -- //
DELIMITER ;

SELECT format_seconds(123456) AS formatted_time;


-- 2

DELIMITER $$ -- //
CREATE PROCEDURE print_even_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE even_numbers VARCHAR(255) DEFAULT '';

    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SET even_numbers = CONCAT(even_numbers, i, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;
    
    SET even_numbers = LEFT(even_numbers, CHAR_LENGTH(even_numbers) - 1);

    SELECT even_numbers;
END $$ -- //
DELIMITER ;

CALL print_even_numbers();