--Criando o banco
CREATE DATABASE projeto_esig;

-- Conectar ao banco
\c projeto_esig;

--Tabela do banco, cadastro pessoal
CREATE TABLE cadastro (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL
);

--Popular a tabela
INSERT INTO cadastro (nome, sobrenome, email) VALUES
('Emanuel', 'dos Santos Bezerra da Silva', 'emanuel123@gmail.com'),
('Carlos', 'Paulino', 'carlos321@outlook.com'),
('Augusto', 'Santana', 'augusto3331@yahoo.com'),
('Antonio', 'Valle', 'valle.an123@ig.com'),
('Vitor', 'Pereira', 'pereiravitor123@hotmail.com.br');