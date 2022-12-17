-- Databricks notebook source
-- Vendedores campeões de vendas - Brasil
WITH
 tb_vendas_vendedores AS (
 
   SELECT 
         idVendedor,
         COUNT(*) AS qtVendas
   
   FROM silver_olist.item_pedido
   GROUP BY idVendedor
   ORDER BY qtVendas DESC
 
 )
 
 select * from tb_vendas_vendedores

-- COMMAND ----------

-- Vendedores campeões de vendas - por estado (TOP 10 de cada Estado)

WITH
 tb_vendas_vendedores AS (
 
   SELECT 
         idVendedor,
         COUNT(*) AS qtVendas
   
   FROM silver_olist.item_pedido
   GROUP BY idVendedor
   ORDER BY qtVendas DESC
 
 )
 
 SELECT T1.*,
        T2.descUF
 
 from tb_vendas_vendedores AS T1
 
 LEFT JOIN silver_olist.vendedor AS T2
 ON T1.idVendedor = T2.idVendedor
 
 ORDER BY qtVendas DESC
 
 LIMIT 10 -- não deu certo, não pegou por estado - Aqui entra a window function

-- COMMAND ----------

-- Vendedores campeões de vendas - por estado (TOP 10 de cada Estado)

WITH
 tb_vendas_vendedores AS (
 
   SELECT 
         idVendedor,
         COUNT(*) AS qtVendas
   
   FROM silver_olist.item_pedido
   GROUP BY idVendedor
   ORDER BY qtVendas DESC
 
 ),
 
tb_row_number AS (
 
 SELECT T1.*,
        T2.descUF,
        ROW_NUMBER() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN
 
 from tb_vendas_vendedores AS T1
 
 LEFT JOIN silver_olist.vendedor AS T2
 ON T1.idVendedor = T2.idVendedor
 
 ORDER BY descUF, qtVendas DESC
 
)

SELECT * FROM tb_row_number WHERE RN <= 10

-- COMMAND ----------

WITH
 tb_vendas_vendedores AS (
 
   SELECT 
         idVendedor,
         COUNT(*) AS qtVendas
   
   FROM silver_olist.item_pedido
   GROUP BY idVendedor
   ORDER BY qtVendas DESC
 
 ),
 
tb_row_number AS (
 
 SELECT T1.*,
        T2.descUF,
        ROW_NUMBER() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN
 
 from tb_vendas_vendedores AS T1
 
 LEFT JOIN silver_olist.vendedor AS T2
 ON T1.idVendedor = T2.idVendedor
 
 QUALIFY RN <= 10
 
 ORDER BY descUF, qtVendas DESC
 
)

SELECT * FROM tb_row_number
