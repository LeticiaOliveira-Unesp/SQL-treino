-- Databricks notebook source
-- DBTITLE 1,Exercício 01
-- 01 selecione todos os clientes paulistanos (nasceram na cidade de SP)

SELECT *
FROM silver_olist.cliente
WHERE descCidade = 'sao paulo'


-- COMMAND ----------

-- DBTITLE 1,Exercício 02
-- selecione todos os paulistas

SELECT *
FROM silver_olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

SELECT *
FROM silver_olist.cliente

-- COMMAND ----------

-- DBTITLE 1,Exercício 03
-- selecione todos os vendedores cariocas e paulistas

SELECT *
FROM silver_olist.vendedor
WHERE descCidade = 'rio de janeiro'
OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 04
-- selecione produtos de perfumaria e bebes com altura maior que 5cm

SELECT *

FROM silver_olist.produto

WHERE descCategoria IN ('perfumaria', 'bebes')
AND vlAlturaCm > 5
