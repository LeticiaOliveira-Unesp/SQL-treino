-- Databricks notebook source
SELECT * FROM silver_olist.pedido

WHERE descSituacao = 'delivered'

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido, onde a situação do pedido seja 'delivered' (entregue)

-- COMMAND ----------

SELECT * FROM silver_olist.pedido

WHERE descSituacao = 'canceled'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido

WHERE descSituacao = 'shipped'
AND YEAR(dtPedido) = '2018' 

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos enviados de 2018

-- COMMAND ----------

SELECT * FROM silver_olist.pedido

WHERE descSituacao = 'shipped' OR descSituacao = 'canceled'
AND YEAR(dtPedido) = '2018' 

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos enviados ou (cancelados de 2018) 

-- o 2018 só está para o 'canceled'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido

WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled')
AND YEAR(dtPedido) = '2018' 

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos enviados ou cancelados de 2018

-- precisa do parênteses para a condição AND ser para os dois

-- COMMAND ----------

SELECT * FROM silver_olist.pedido

WHERE descSituacao IN ('shipped','canceled')
AND YEAR(dtPedido) = '2018' 

-- Outro modo de fazer é usando IN (pois as duas condições são da mesma coluna) -> usa uma lista

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos (enviados ou cancelados) de 2018

-- COMMAND ----------

SELECT *,
      datediff(dtEstimativaEntrega, dtAprovado)

FROM silver_olist.pedido

WHERE descSituacao IN ('shipped','canceled')
AND year(dtPedido) = '2018' 
AND datediff(dtEstimativaEntrega, dtAprovado) > 30

-- COMMAND ----------

SELECT *,
      datediff(dtEstimativaEntrega, dtAprovado)

FROM silver_olist.pedido

WHERE descSituacao IN ('shipped','canceled')
AND YEAR(dtPedido) = '2018' 
AND datediff(dtEstimativaEntrega, dtAprovado) > 30

-- ÚLTIMA COLUNA COM OS RESULTADOS
