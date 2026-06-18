# LISTAR TODOS OS CLIENTES

SELECT * FROM clientes;


# CLIENTES ORDENADOS POR RENDA

SELECT 
	nome, 
    renda_mensal
FROM clientes
ORDER BY renda_mensal DESC;


# CLIENTES COM RENDA A CIMA DE R$5.000

SELECT 
	nome, 
    renda_mensal
FROM clientes
WHERE renda_mensal > 5000;

# QUANTIDADE DE CLIENTES POR ESTADO

SELECT 
	   estado,
       COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY estado
ORDER BY quantidade_clientes DESC;    

# SALDO MÉDIO DAS CONTAS

SELECT ROUND(AVG(saldo), 2) AS saldo_medio
FROM contas;

# CLIENTE E SALDO DA CONTA

SELECT	
	clientes.nome AS cliente,
    contas.saldo AS saldo_conta
FROM clientes
INNER JOIN contas
ON clientes.cliente_id = contas.cliente_id;

# CLIENTE E AGÊNCIA

SELECT 
       clientes.nome AS cliente,
       agencias.nome_agencia AS agencia
FROM clientes 
INNER JOIN contas 
    ON clientes.cliente_id = contas.cliente_id
INNER JOIN agencias
    ON contas.agencia_id = agencias.agencia_id;  
    
# QUANTIDADE DE CONTAS POR AGÊNCIA

SELECT 
       agencias.nome_agencia AS agencia,
       COUNT(*) AS quantidade_contas
FROM agencias
INNER JOIN contas
    ON agencias.agencia_id = contas.agencia_id
GROUP BY agencias.nome_agencia
ORDER BY quantidade_contas DESC;    

# SALDO MÉDIO POR AGÊNCIA

SELECT
	agencias.nome_agencia AS agencia,
    ROUND(AVG(contas.saldo) , 2) AS saldo_medio
FROM agencias
INNER JOIN contas
ON agencias.agencia_id = contas.agencia_id
GROUP BY agencia
ORDER BY saldo_medio DESC;


# TOTAL MOVIMENTADO POR CLIENTE

SELECT 
	   clientes.nome,
       ROUND(SUM(transacoes.valor),2) AS total_movimentado
FROM clientes 
INNER JOIN contas
    ON clientes.cliente_id = contas.cliente_id
INNER JOIN transacoes
    ON contas.conta_id = transacoes.conta_id
GROUP BY clientes.nome
ORDER BY total_movimentado DESC;

# CLIENTES COM SALDO A CIMA DA MÉDIA

SELECT 
	   clientes.nome AS cliente,
       contas.saldo AS saldo
FROM clientes
INNER JOIN contas
    ON clientes.cliente_id = contas.cliente_id
WHERE contas.saldo >
(
    SELECT AVG(saldo)
    FROM contas
);

# CLIENTE QUE MAIS MOVIMENTOU DINHEIRO

SELECT 
	   clientes.nome AS cliente,
       SUM(transacoes.valor) AS total_movimentado
FROM clientes 
INNER JOIN contas 
    ON clientes.cliente_id = contas.cliente_id
INNER JOIN transacoes 
    ON contas.conta_id = transacoes.conta_id
GROUP BY clientes.nome
ORDER BY total_movimentado DESC
LIMIT 1;

# AGÊNCIA QUE MAIS MOVIMENTOU DINHEIRO

SELECT
	agencias.nome_agencia AS agencia,
    SUM(transacoes.valor) AS valor_movimentado
FROM agencias
INNER JOIN contas
ON agencias.agencia_id = contas.agencia_id
INNER JOIN transacoes
ON contas.conta_id = transacoes.conta_id
GROUP BY agencias.nome_agencia
ORDER BY valor_movimentado DESC
LIMIT 1;    
    
# CLIENTES SEM TRANSAÇÕES

SELECT 
	clientes.nome
FROM clientes 
INNER JOIN contas 
    ON clientes.cliente_id = contas.cliente_id
LEFT JOIN transacoes 
    ON contas.conta_id = transacoes.conta_id
WHERE transacoes.transacao_id IS NULL;	

# RANKING DE CLIENTES POR SALDO

SELECT clientes.nome AS cliente,
       contas.saldo AS saldo,
       RANK() OVER (ORDER BY contas.saldo DESC) AS ranking
FROM clientes 
INNER JOIN contas 
    ON clientes.cliente_id = contas.cliente_id;
    
    
  
    
    
	


   
    
    
    
    


   



