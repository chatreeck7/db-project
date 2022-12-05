USE schoolar;
-- DROP FUNCTION CalcDaysleft;
-- --CREATE STORED FUNCTIONS !
-- DELIMITER $$
-- CREATE FUNCTION CalcDaysleft(expire_date DATE)
-- 	RETURNS INT
--     DETERMINISTIC
-- BEGIN
-- 	DECLARE present_date DATE;
-- 	Select CURRENT_DATE() INTO present_date;
-- 	IF present_date > expire_date THEN
-- 		RETURN -1;
--     ELSEIF  expire_date >= present_date THEN
-- 		RETURN DATEDIFF(expire_date,present_date);
-- 	END IF;
-- END $$
-- DELIMITER ;

-- --SHOW the remaining time of Provider's which has u_id = 0000000061
SELECT P.username, P.tel, P.next_payment_date, CalcDaysleft(P.next_payment_date) AS remaining_time 
FROM Provider P
WHERE P.u_id = '0000000061'
