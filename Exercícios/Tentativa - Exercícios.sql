-- Databricks notebook source
-- DBTITLE 1,Exercício 01
SELECT *

FROM silver_olist.item_pedido

WHERE idPedidoItem > 1

-- COMMAND ----------

-- DBTITLE 1,Exercício 02
SELECT *

FROM silver_olist.item_pedido

WHERE vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,Exercício 03

