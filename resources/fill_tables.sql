
select * from website; 
-- status=1 (active), 
--        0 (inactive), igual se muestra en los proyectos
--        2 (blocked), no se muestra en la lista


select * from website_availability_stats;  
-- average de 0 a 100
-- type 0: last 8 hours
--      1:last 24 hour  
--      2:last 7 days   
--      3: last month

select * from website_status;
-- risk level de 0 a 3
-- type: 0: del dia
--       1: semanal

select * from url;
-- type: 0 Normal
--       1: vip

select * from url_status;