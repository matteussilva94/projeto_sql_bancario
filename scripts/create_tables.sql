CREATE DATABASE projeto_sql_bancario;
USE projeto_sql_bancario;

CREATE TABLE agencias (
agencia_id INT PRIMARY KEY,
nome_agencia VARCHAR(100),
cidade VARCHAR(50),
estado CHAR(2));

CREATE TABLE clientes (
cliente_id INT PRIMARY KEY,
nome VARCHAR(100),
sexo CHAR(1),
idade INT,
cidade VARCHAR(50),
estado CHAR(2),
renda_mensal DECIMAL(10,2));

CREATE TABLE contas (
conta_id INT PRIMARY KEY,
cliente_id INT,
agencia_id INT,
tipo_conta VARCHAR(20),
saldo DECIMAL(12,2));

CREATE TABLE transacoes (
transacao_id INT PRIMARY KEY,
conta_id INT,
data_transacao DATE,
tipo_transacao VARCHAR(20),
valor DECIMAL(10,2));

SHOW TABLES;

#VERIFICAÇÃO DE IMPORTAÇÃO

SELECT COUNT(*) FROM agencias;

SELECT COUNT(*) FROM clientes;

SELECT COUNT(*) FROM contas;

SELECT COUNT(*) FROM transacoes;


SELECT * FROM agencias;

SELECT * FROM clientes;

SELECT * FROM contas;

SELECT * FROM transacoes;

# ADIÇÃO DE FOREIGN KEYS PARA PODER CRIAR O MODELO RELACIONAL.

ALTER TABLE contas
ADD CONSTRAINT fk_contas_clientes
FOREIGN KEY (cliente_id)
REFERENCES clientes(cliente_id);

ALTER TABLE contas
ADD CONSTRAINT fk_contas_agencias
FOREIGN KEY (agencia_id)
REFERENCES agencias(agencia_id);

ALTER TABLE transacoes
ADD CONSTRAINT fk_transacoes_contas
FOREIGN KEY (conta_id)
REFERENCES contas(conta_id);