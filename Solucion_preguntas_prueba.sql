---Ejecución query que da respuesta a la primera pregunta
SELECT codigo_tienda FROM (
SELECT count(distinct(num_documento_cliente)) as Numero_clientes_Diferentes, codigo_tienda 
from fact_sales_table 
group by codigo_tienda 
HAVING Numero_clientes_Diferentes>100);

----Ejecución query que da respuesta a la segunda pregunta pregunta
SELECT nombre_barrio from (
SELECT count(distinct(num_documento_cliente)) as Numero_clientes_Diferentes, nombre_barrio 
from fact_sales_table f 
LEFT JOIN dim_barrio b on f.id_barrio=b.id_barrio 
LEFT JOIN dim_tienda t on f.codigo_tienda=t.codigo_tienda 
where tipo_tienda='Tienda Regional'
group by nombre_barrio order by 1 DESC limit 5);
