-- Databricks notebook source
-- Lista de vendedores que estão no Estado com mais clientes
-- SELECT descUF
   --   COUNT(DISTINCT idClienteUnico)

-- FROM silver_olist.cliente

-- GROUP BY descUF
-- ORDER BY COUNT(DISTINCT idClienteUnico) DESC

SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF = (
   SELECT descUF
   FROM silver_olist.cliente
   GROUP BY descUF
   ORDER BY COUNT(DISTINCT idClienteUnico) DESC
   LIMIT 1
)


-- COMMAND ----------

   SELECT descUF
   FROM silver_olist.cliente
   GROUP BY descUF
   ORDER BY COUNT(DISTINCT idClienteUnico) DESC
   LIMIT 1

-- COMMAND ----------

-- Lista dos vendedores que tem mais clientes

SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF IN (
   
   SELECT descUF
   FROM silver_olist.cliente
   GROUP BY descUF
   ORDER BY COUNT(DISTINCT idClienteUnico) DESC
   LIMIT 2
   
)

-- COMMAND ----------

-- CTE

WITH tb_estados AS (

   SELECT descUF
   FROM silver_olist.cliente
   GROUP BY descUF
   ORDER BY COUNT(DISTINCT idClienteUnico) DESC
   LIMIT 2

) 

SELECT * FROM tb_estados


-- COMMAND ----------

-- tb_estados é uma tabela temporária

WITH tb_estados AS (

   SELECT descUF
   FROM silver_olist.cliente
   GROUP BY descUF
   ORDER BY COUNT(DISTINCT idClienteUnico) DESC
   LIMIT 2

) 

SELECT idVendedor, 
        descUF
        
FROM silver_olist.vendedor

WHERE descUF IN (SELECT descUF FROM tb_estados)

-- COMMAND ----------

WITH tb_estados AS (

   SELECT descUF
   FROM silver_olist.cliente
   GROUP BY descUF
   ORDER BY COUNT(DISTINCT idClienteUnico) DESC
   LIMIT 2

),  

tb_vendedores AS (

SELECT idVendedor, 
        descUF
        
FROM silver_olist.vendedor

WHERE descUF IN (SELECT descUF FROM tb_estados)

)

SELECT * FROM tb_vendedores

-- COMMAND ----------

-- Nota média dos pedidos dos vendedores de cada estado

WITH tb_pedido_nota AS (

    SELECT T1.idVendedor,
            T2.vlNota
            
    FROM silver_olist.item_pedido AS T1

    LEFT JOIN silver_olist.avaliacao_pedido AS T2
    ON T1.idPedido = T2.idPedido

),

tb_avg_vendedor AS (

  SELECT idVendedor,
         AVG(vlNota) AS avgNotaVendedor
  FROM tb_pedido_nota
  GROUP BY idVendedor
),

tb_vendedor_estado AS (

SELECT T1.*, 
       T2.descUF
FROM tb_avg_vendedor AS T1
LEFT JOIN silver_olist.vendedor AS T2
ON T1.idVendedor = T2.idVendedor

)

SELECT descUF,
       AVG(avgNotaVendedor) AS avgNotaEstado

FROM tb_vendedor_estado

GROUP BY descUF
ORDER BY avgNotaEstado DESC
