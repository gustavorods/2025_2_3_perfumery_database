CREATE DATABASE perfumariaBd;

USE perfumariaBd;

-- Tabela de Regi�es
CREATE TABLE regioes (
    id_regiao INT PRIMARY KEY,
    nome_regiao VARCHAR(100) NOT NULL
);

-- Tabela de Pontos de Venda
CREATE TABLE pontos_venda (
    id_ponto INT PRIMARY KEY,
    descricao VARCHAR(150),
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
);

-- Tabela de Funcion�rios (Vendedores)
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
);

-- Tabela de Ve�culos
CREATE TABLE veiculos (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(50) NOT NULL, 
    modelo_veiculo VARCHAR(50) NOT NULL,
    ano_fabricacao VARCHAR(10) NOT NULL
);

-- Relacionamento entre Funcion�rios e Ve�culos
CREATE TABLE funcionario_veiculo (
     id_veiculo INT NOT NULL,
     id_funcionario INT NOT NULL,
    data_uso DATE NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    quantidade_estoque INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf_cliente VARCHAR(30) NOT NULL
);

-- Tabela de Notas Fiscais
CREATE TABLE notas_fiscais (
    id_nf INT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_cliente INT NOT NULL,
    data_emissao DATE NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Itens de Nota Fiscal (Produtos vendidos)
CREATE TABLE itens_nf (
    id_item INT PRIMARY KEY,
    id_nf INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_vendida INT NOT NULL,
    FOREIGN KEY (id_nf) REFERENCES notas_fiscais(id_nf),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


-- -------------------------------
-- INSERTS: Regiões
-- -------------------------------
INSERT INTO regioes (id_regiao, nome_regiao) VALUES
(1, 'Zona Norte'),
(2, 'Zona Sul'),
(3, 'Zona Leste'),
(4, 'Zona Oeste'),
(5, 'Centro');

-- -------------------------------
-- INSERTS: Pontos de Venda
-- -------------------------------
INSERT INTO pontos_venda (id_ponto, descricao, id_regiao) VALUES
(1, 'Shopping Norte', 1),
(2, 'Terminal Santana', 1),
(3, 'Shopping Sul', 2),
(4, 'Avenida Paulista', 5),
(5, 'Mercado Leste', 3),
(6, 'Shopping Oeste', 4);

-- -------------------------------
-- INSERTS: Funcionários
-- -------------------------------
INSERT INTO funcionarios (id_funcionario, nome_funcionario, id_regiao) VALUES
(1, 'João Silva', 1),
(2, 'Maria Oliveira', 2),
(3, 'Carlos Souza', 3),
(4, 'Ana Paula', 5),
(5, 'Lucas Lima', 4);

-- -------------------------------
-- INSERTS: Veículos
-- -------------------------------
INSERT INTO veiculos (id_veiculo, placa, modelo_veiculo, ano_fabricacao) VALUES
(1, 'ABC-1234', 'Fiat Uno', '2020'),
(2, 'DEF-5678', 'Ford Ka', '2021'),
(3, 'GHI-9101', 'Hyundai HB20', '2022'),
(4, 'JKL-1122', 'Chevrolet Onix', '2023'),
(5, 'MNO-3344', 'Renault Kwid', '2021');

-- -------------------------------
-- INSERTS: Funcionário-Veículo
-- -------------------------------
INSERT INTO funcionario_veiculo (id_veiculo, id_funcionario, data_uso) VALUES
(1, 1, '2025-10-01'),
(2, 2, '2025-10-02'),
(3, 3, '2025-10-03'),
(4, 4, '2025-10-04'),
(5, 5, '2025-10-05'),
(2, 1, '2025-10-10'),
(1, 2, '2025-09-15');

-- -------------------------------
-- INSERTS: Produtos
-- -------------------------------
INSERT INTO produtos (id_produto, nome_produto, quantidade_estoque, preco_unitario) VALUES
(1, 'Perfume Floral', 50, 120.00),
(2, 'Colônia Cítrica', 40, 90.00),
(3, 'Desodorante Masculino', 100, 25.00),
(4, 'Perfume Amadeirado', 60, 150.00),
(5, 'Creme Hidratante', 80, 45.00),
(6, 'Sabonete Natural', 150, 12.00),
(7, 'Kit Presente', 30, 200.00);

-- -------------------------------
-- INSERTS: Clientes
-- -------------------------------
INSERT INTO clientes (id_cliente, nome_cliente, cpf_cliente) VALUES
(1, 'Carla Mendes', '123.456.789-00'),
(2, 'Roberto Dias', '987.654.321-00'),
(3, 'Fernanda Luz', '456.123.789-00'),
(4, 'Bruno Castro', '321.654.987-00'),
(5, 'Isabela Silva', '789.456.123-00');

-- -------------------------------
-- INSERTS: Notas Fiscais
-- -------------------------------
INSERT INTO notas_fiscais (id_nf, id_funcionario, id_cliente, data_emissao) VALUES
(1, 1, 1, '2025-10-01'),
(2, 2, 2, '2025-10-02'),
(3, 3, 3, '2025-10-03'),
(4, 1, 4, '2025-10-05');

-- -------------------------------
-- INSERTS: Itens de Notas Fiscais
-- -------------------------------
INSERT INTO itens_nf (id_item, id_nf, id_produto, quantidade_vendida) VALUES
(1, 1, 1, 2),
(2, 1, 3, 5),
(3, 2, 2, 3),
(4, 2, 5, 1),
(5, 3, 4, 1),
(6, 4, 1, 1),
(7, 4, 7, 2);
