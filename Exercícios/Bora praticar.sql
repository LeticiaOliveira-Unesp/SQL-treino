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

-- COMMAND ----------

-- Qual categoria tem mais produtos vendidos?

SELECT T2.descCategoria,
       COUNT(*)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria
ORDER BY COUNT(*) DESC

LIMIT 1

-- COMMAND ----------

--Qual categoria tem produto mais caros em média

SELECT T2.descCategoria,
       AVG(T1.vlPreco)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria
ORDER BY AVG(T1.vlPreco) DESC

LIMIT 1

-- COMMAND ----------

-- Os clientes de qual estado pagam mais frete?
SELECT T3.descUF,
       AVG(T1.vlFrete)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.pedido AS T2
ON T1.idPedido = T2.idPedido

LEFT JOIN silver_olist.cliente AS T3
ON T2.idCliente = T3.idCliente

GROUP BY T3.descUF
ORDER BY AVG(T1.vlFrete) DESC


-- COMMAND ----------

SELECT T3.descUF,
       AVG(T1.vlFrete) AS avgFrete

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.pedido AS T2
ON T1.idPedido = T2.idPedido

LEFT JOIN silver_olist.cliente AS T3
ON T2.idCliente = T3.idCliente

GROUP BY T3.descUF

HAVING avgFrete > 40

ORDER BY avgFrete DESC
