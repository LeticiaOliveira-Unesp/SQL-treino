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


-- COMMAND ----------

-- DBTITLE 1,Exercício 06
SELECT * 
FROM silver_olist.pedido

WHERE YEAR(dtPedido) = 2017
AND MONTH(dtPedido) = 12
AND descSituacao = 'delivered'
AND date(dtEntregue) > date(dtEstimativaEntrega) -- corta a hora para não ter problema com considerar atraso devido a hora do dia entregue e da estimativa


-- COMMAND ----------

-- DBTITLE 1,Exercício 08
SELECT *,

      ROUND(vlPagamento/nrPacelas, 2) AS vlParcela

FROM silver_olist.pagamento_pedido

WHERE nrPacelas >= 2
AND vlPagamento/nrPacelas < 20


-- COMMAND ----------

-- DBTITLE 1,Exercício 02 do Case
SELECT *,
      vlPreco + vlFrete AS vlTotal,
      vlFrete/(vlPreco + vlFrete) AS pctFrete,
      
       CASE
        WHEN vlFrete/(vlPreco + vlFrete) <= 0.1 THEN '10%'
        WHEN vlFrete/(vlPreco + vlFrete) <= 0.25 THEN '10% a 25%'
        WHEN vlFrete/(vlPreco + vlFrete) <= 0.5 THEN '25% a 50%'
        ELSE '+50%'
      END AS descFretePct

FROM silver_olist.item_pedido
