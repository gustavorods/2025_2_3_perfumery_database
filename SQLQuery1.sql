CREATE DATABASE perfumariaBd;

USE perfumariaBd;

-- Tabela de Regiões
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

-- Tabela de Funcionários (Vendedores)
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
);

-- Tabela de Veículos
CREATE TABLE veiculos (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(50) NOT NULL, 
    modelo_veiculo VARCHAR(50) NOT NULL,
    ano_fabricacao VARCHAR(10) NOT NULL
);

-- Relacionamento entre Funcionários e Veículos
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
