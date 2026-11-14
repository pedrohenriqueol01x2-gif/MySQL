CREATE DATABASE db_loja_somy;

Use db_loja_somy;

CREATE TABLE tb_cargos(
id_cargos integer unsigned not null,
nome varchar(50) not null,
descricao varchar(200) not null,
salario decimal(8,2) not null,
PRIMARY KEY (id_cargos)
);

CREATE TABLE tb_funcionario(
id_funcionario integer unsigned not null,
nome varchar(100) not null,
CPF varchar(14) not null unique,
endereco varchar(100) not null,
cidade varchar(100) not null,
telefone varchar(20) not null,
cargo INTEGER UNSIGNED NOT NULL,
primary key (id_funcionario),
Foreign Key (cargo) references tb_cargos(id_cargos)
);

CREATE TABLE tb_fornecedor(
CNPJ varchar(20) unique not null,
Nome varchar(100) not null,
telefone varchar(14) not null,
Email varchar(50),
Endereço varchar(50),
PRIMARY KEY (CNPJ)
);

CREATE TABLE tb_despesas(
id_despesa Integer unsigned not null,
descricao varchar(100) not null,
categoria varchar(100) not null,
valor_pago decimal(8,2) not null,
forma_pagamento enum('Boleto', 'Crédito', 'Débito', 'Pix', 'Transferência') not null,
CNPJ_fornecedor varchar(20) not null,
Data_pagamento date not null,
primary key (id_despesa),
foreign key (CNPJ_fornecedor) references tb_fornecedor(CNPJ)
);

CREATE TABLE tb_produtos(
id_produto integer unsigned not null,
Nome varchar(100) not null,
valor_produto decimal(8,2) not null,
estoque integer not null,
primary key(id_produto)
);

CREATE TABLE tb_acessorios(
produto_id integer unsigned not null,
tipo varchar(45) not null,
cor varchar(45) not null,
compatibilidade varchar(45) not null,
conexao varchar(45) not null,
primary key (produto_id),
foreign key (produto_id) references tb_produtos(id_produto)
);

CREATE TABLE tb_console(
produto_id integer unsigned not null,
mídia varchar(45) not null,
geracao varchar(45) not null,
fabricante varchar(45) not null,
primary key (produto_id),
foreign key (produto_id) references tb_produtos(id_produto)
);

CREATE TABLE tb_jogos(
produto_id integer unsigned not null,
plataforma varchar(45) not null,
genero varchar(45) not null,
classificacao varchar(45) not null,
primary key (produto_id),
foreign key (produto_id) references tb_produtos(id_produto)
);

CREATE TABLE tb_reposicao(
Id_reposicao INTEGER UNSIGNED NOT NULL,
id_produto INTEGER UNSIGNED NOT NULL,
CNPJ_fornecedor VARCHAR(20) NOT NULL,
id_funcionario INTEGER UNSIGNED NOT NULL,
qnt_item INTEGER NOT NULL,
valor_compra DECIMAL(8,2) NOT NULL,
data_reposicao DATE NOT NULL,
PRIMARY KEY (Id_reposicao),
FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto),
FOREIGN KEY (CNPJ_fornecedor) REFERENCES tb_fornecedor(CNPJ),
FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario(id_funcionario)
);

CREATE TABLE tb_cliente(
cod_cliente integer unsigned not null,
nome varchar(100) not null,
CPF varchar(14) not null unique,
endereco varchar(100) not null,
email varchar(100) not null,
telefone varchar(20) not null,
primary key (cod_cliente)
);

CREATE TABLE tb_vendas(
cod_venda integer unsigned not null,
cliente_cod integer unsigned not null,
produto_id integer unsigned not null,
funci_id integer unsigned not null,
qnt_item integer not null,
valor_unitario decimal(8,2) not null,
garantia varchar (20) not null,
data_venda date not null,
forma_pag enum('Crédito', 'Débito', 'Pix') not null,
primary key (cod_venda),
foreign key (cliente_cod) references tb_cliente(cod_cliente),
foreign key (produto_id) references tb_produtos(id_produto),
foreign key (funci_id) references tb_funcionario(id_funcionario)
);

CREATE TABLE tb_receita(
id_receita integer unsigned not null,
origem_venda integer unsigned not null,
descricao varchar(100) not null,
valor_total decimal(8,2) not null,
data_recebimento date not null,
primary key (id_receita),
foreign key (origem_venda) references tb_vendas(cod_venda)
);

/* Dados das tabelas */

INSERT INTO tb_cargos (id_cargos, nome, descricao, salario) VALUES
(01, 'Gerente', 'Responsável por coordenar a empresa, supervisionar equipes, tomar decisões e acompanhar resultados.', 10500.00),
(02, 'Vendas', 'Responsável pelo atendimento aos clientes, apresentação dos produtos, negociação e realização de vendas.', 4400.00),
(03, 'Assistência Técnica', 'Responsável pela manutenção, diagnóstico e reparo de consoles, controles e acessórios.', 6000.00),
(04, 'Financeiro', 'Responsável pelo controle de receitas, despesas, pagamentos, recebimentos e fluxo de caixa.', 6400.00),
(05, 'RH', 'Responsável pelo recrutamento, seleção, contratação, treinamento e gestão dos funcionários.', 6000.00),
(06, 'Administrativo e Gestão', 'Responsável pela organização de documentos, contratos, compras e processos administrativos.', 5200.00);

INSERT INTO tb_funcionario (id_funcionario, nome, CPF, endereco, cidade, telefone, cargo) VALUES
(001, 'Funcionário Exemplo 01', '000.000.000-01', 'Endereço fictício 01', 'Itapoã', '(00) 00000-0001', 01),
(002, 'Funcionário Exemplo 02', '000.000.000-02', 'Endereço fictício 02', 'Paranoá', '(00) 00000-0002', 02),
(003, 'Funcionário Exemplo 03', '000.000.000-03', 'Endereço fictício 03', 'São Sebastião', '(00) 00000-0003', 03),
(004, 'Funcionário Exemplo 04', '000.000.000-04', 'Endereço fictício 04', 'Luziânia', '(00) 00000-0004', 02),
(005, 'Funcionário Exemplo 05', '000.000.000-05', 'Endereço fictício 05', 'Santa Maria', '(00) 00000-0005', 03),
(006, 'Funcionário Exemplo 06', '000.000.000-06', 'Endereço fictício 06', 'Planaltina', '(00) 00000-0006', 04),
(007, 'Funcionário Exemplo 07', '000.000.000-07', 'Endereço fictício 07', 'Água Fria', '(00) 00000-0007', 05),
(008, 'Funcionário Exemplo 08', '000.000.000-08', 'Endereço fictício 08', 'Paranoá', '(00) 00000-0008', 06),
(009, 'Funcionário Exemplo 09', '000.000.000-09', 'Endereço fictício 09', 'Guará', '(00) 00000-0009', 02),
(010, 'Funcionário Exemplo 10', '000.000.000-10', 'Endereço fictício 10', 'Santa Maria', '(00) 00000-0010', 04),
(011, 'Funcionário Exemplo 11', '000.000.000-11', 'Endereço fictício 11', 'Valparaíso', '(00) 00000-0011', 05),
(012, 'Funcionário Exemplo 12', '000.000.000-12', 'Endereço fictício 12', 'Itapoã', '(00) 00000-0012', 06);


INSERT INTO tb_fornecedor (CNPJ, Nome, telefone, Email, Endereço) VALUES
('00.000.000/0000-01', 'Fornecedor Exemplo 01', '(00) 0000-0001', 'fornecedor01@example.com', 'Endereço fictício 01'),
('00.000.000/0000-02', 'Fornecedor Exemplo 02', '(00) 0000-0002', 'fornecedor02@example.com', 'Endereço fictício 02'),
('00.000.000/0000-03', 'Fornecedor Exemplo 03', '(00) 0000-0003', 'fornecedor03@example.com', 'Endereço fictício 03'),
('00.000.000/0000-04', 'Fornecedor Exemplo 04', '(00) 0000-0004', 'fornecedor04@example.com', 'Endereço fictício 04'),
('00.000.000/0000-05', 'Fornecedor Exemplo 05', '(00) 0000-0005', 'fornecedor05@example.com', 'Endereço fictício 05'),
('00.000.000/0000-06', 'Fornecedor Exemplo 06', '(00) 0000-0006', 'fornecedor06@example.com', 'Endereço fictício 06'),
('00.000.000/0000-07', 'Fornecedor Exemplo 07', '(00) 0000-0007', 'fornecedor07@example.com', 'Endereço fictício 07'),
('00.000.000/0000-08', 'Fornecedor Exemplo 08', '(00) 0000-0008', 'fornecedor08@example.com', 'Endereço fictício 08'),
('00.000.000/0000-09', 'Fornecedor Exemplo 09', '(00) 0000-0009', 'fornecedor09@example.com', 'Endereço fictício 09'),
('00.000.000/0000-10', 'Fornecedor Exemplo 10', '(00) 0000-0010', 'fornecedor10@example.com', 'Endereço fictício 10'),
('00.000.000/0000-11', 'Fornecedor Exemplo 11', '(00) 0000-0011', 'fornecedor11@example.com', 'Endereço fictício 11'),
('00.000.000/0000-12', 'Fornecedor Exemplo 12', '(00) 0000-0012', 'fornecedor12@example.com', 'Endereço fictício 12'),
('00.000.000/0000-13', 'Fornecedor Exemplo 13', '(00) 0000-0013', 'fornecedor13@example.com', 'Endereço fictício 13'),
('00.000.000/0000-14', 'Fornecedor Exemplo 14', '(00) 0000-0014', 'fornecedor14@example.com', 'Endereço fictício 14'),
('00.000.000/0000-15', 'Fornecedor Exemplo 15', '(00) 0000-0015', 'fornecedor15@example.com', 'Endereço fictício 15'),
('00.000.000/0000-16', 'Fornecedor Exemplo 16', '(00) 0000-0016', 'fornecedor16@example.com', 'Endereço fictício 16'),
('00.000.000/0000-17', 'Fornecedor Exemplo 17', '(00) 0000-0017', 'fornecedor17@example.com', 'Endereço fictício 17');

Insert tb_produtos values ('10001001', 'Playstation 5', '3999.00', '15');
Insert tb_produtos values ('10001002', 'Xbox Series X', '3799.00', '10');
Insert tb_produtos values ('10001003', 'Xbox Series S', '2199.00', '18');
Insert tb_produtos values ('10001004', 'Switch 2', '3199.00', '12');
Insert tb_produtos values ('10001005', 'Playstation 4', '1599.00', '8');
Insert tb_produtos values ('10001006', 'Xbox One', '1199.00', '6');
Insert tb_produtos values ('10001007', 'Switch', '1899.00', '14');
Insert tb_produtos values ('10001008', 'Wii U', '899.00', '3');
Insert tb_produtos values ('10001009', 'Xbox 360', '699.00', '5');
Insert tb_produtos values ('10001010', 'Playstation 3', '799.00', '5');
Insert tb_produtos values ('10001011', 'Wii', '599.00', '4');
Insert tb_produtos values ('10001012', 'DS', '499.00', '4');
Insert tb_produtos values ('10001013', 'PSP', '649.00', '3');
Insert tb_produtos values ('10001014', 'Playstation 2', '599.00', '6');
Insert tb_produtos values ('10001015', 'GameCube', '799.00', '2');
Insert tb_produtos values ('10001016', 'Dreamcast', '899.00', '2');
Insert tb_produtos values ('10001017', 'Gameboy', '449.00', '5');
Insert tb_produtos values ('10001018', 'Nintendo 64', '749.00', '3');
Insert tb_produtos values ('10001019', 'Playstation', '549.00', '5');
Insert tb_produtos values ('10001020', 'Mega Drive', '599.00', '4');
Insert tb_produtos values ('10001021', 'Super Nintendo', '699.00', '3');
Insert tb_produtos values ('20001001', 'Marvel''s Spider-Man 2', '299.00', '10');
Insert tb_produtos values ('20001002', 'God of War Ragnarök', '299.00', '10');
Insert tb_produtos values ('20001003', 'Horizon Forbidden West', '299.00', '10');
Insert tb_produtos values ('20001004', 'Gran Turismo 7', '299.00', '10');
Insert tb_produtos values ('20001005', 'Ratchet & Clank: Rift Apart', '299.00', '10');
Insert tb_produtos values ('20001006', 'Demon''s Souls', '299.00', '10');
Insert tb_produtos values ('20001007', 'Returnal', '299.00', '10');
Insert tb_produtos values ('20001008', 'Astro Bot', '299.00', '10');
Insert tb_produtos values ('20001009', 'Final Fantasy XVI', '299.00', '10');
Insert tb_produtos values ('20001010', 'Final Fantasy VII Rebirth', '299.00', '10');
Insert tb_produtos values ('20001011', 'Ghost of Tsushima Director''s Cut', '299.00', '10');
Insert tb_produtos values ('20001012', 'The Last of Us Part I', '299.00', '10');
Insert tb_produtos values ('20001013', 'Resident Evil 4 Remake', '299.00', '10');
Insert tb_produtos values ('20001014', 'Resident Evil Village', '299.00', '10');
Insert tb_produtos values ('20001015', 'Elden Ring', '299.00', '10');
Insert tb_produtos values ('20001016', 'Hogwarts Legacy', '299.00', '10');
Insert tb_produtos values ('20001017', 'Mortal Kombat 1', '299.00', '10');
Insert tb_produtos values ('20001018', 'Street Fighter 6', '299.00', '10');
Insert tb_produtos values ('20001019', 'Tekken 8', '299.00', '10');
Insert tb_produtos values ('20001020', 'Cyberpunk 2077', '299.00', '10');
Insert tb_produtos values ('20001021', 'Halo Infinite', '299.00', '10');
Insert tb_produtos values ('20001022', 'Forza Horizon 5', '299.00', '10');
Insert tb_produtos values ('20001023', 'Gears 5', '299.00', '10');
Insert tb_produtos values ('20001024', 'Starfield', '299.00', '10');
Insert tb_produtos values ('20001025', 'Microsoft Flight Simulator', '299.00', '10');
Insert tb_produtos values ('20001026', 'Sea of Thieves', '299.00', '10');
Insert tb_produtos values ('20001027', 'Forza Motorsport', '299.00', '10');
Insert tb_produtos values ('20001028', 'Hi-Fi Rush', '299.00', '10');
Insert tb_produtos values ('20001029', 'Senua''s Saga: Hellblade II', '299.00', '10');
Insert tb_produtos values ('20001030', 'Indiana Jones and the Great Circle', '299.00', '10');
Insert tb_produtos values ('20001031', 'Ori and the Will of the Wisps', '299.00', '10');
Insert tb_produtos values ('20001032', 'Psychonauts 2', '299.00', '10');
Insert tb_produtos values ('20001033', 'Resident Evil 4 Remake', '159.00', '12');
Insert tb_produtos values ('20001034', 'Elden Ring', '159.00', '12');
Insert tb_produtos values ('20001035', 'Cyberpunk 2077', '159.00', '12');
Insert tb_produtos values ('20001036', 'Mario Kart World', '249.00', '8');
Insert tb_produtos values ('20001037', 'Donkey Kong Bananza', '249.00', '8');
Insert tb_produtos values ('20001038', 'The Legend of Zelda: Ocarina of Time Remake', '249.00', '8');
Insert tb_produtos values ('20001039', 'The Legend of Zelda: Tears of the Kingdom', '249.00', '8');
Insert tb_produtos values ('20001040', 'God of War', '159.00', '12');
Insert tb_produtos values ('20001041', 'Marvel''s Spider-Man', '159.00', '12');
Insert tb_produtos values ('20001042', 'The Last of Us Part II', '159.00', '12');
Insert tb_produtos values ('20001043', 'Uncharted 4: A Thief''s End', '159.00', '12');
Insert tb_produtos values ('20001044', 'Bloodborne', '159.00', '12');
Insert tb_produtos values ('20001045', 'Ghost of Tsushima', '159.00', '12');
Insert tb_produtos values ('20001046', 'Horizon Zero Dawn', '159.00', '12');
Insert tb_produtos values ('20001047', 'Days Gone', '159.00', '12');
Insert tb_produtos values ('20001048', 'Infamous Second Son', '159.00', '12');
Insert tb_produtos values ('20001049', 'Until Dawn', '159.00', '12');
Insert tb_produtos values ('20001050', 'Detroit: Become Human', '159.00', '12');
Insert tb_produtos values ('20001051', 'Red Dead Redemption 2', '159.00', '12');
Insert tb_produtos values ('20001052', 'Grand Theft Auto V', '159.00', '12');
Insert tb_produtos values ('20001053', 'The Witcher 3: Wild Hunt', '159.00', '12');
Insert tb_produtos values ('20001054', 'Dark Souls III', '159.00', '12');
Insert tb_produtos values ('20001055', 'Resident Evil 2 Remake', '159.00', '12');
Insert tb_produtos values ('20001056', 'Mortal Kombat 11', '159.00', '12');
Insert tb_produtos values ('20001057', 'Halo 5: Guardians', '159.00', '12');
Insert tb_produtos values ('20001058', 'Forza Horizon 4', '159.00', '12');
Insert tb_produtos values ('20001059', 'Gears of War 4', '159.00', '12');
Insert tb_produtos values ('20001060', 'Sunset Overdrive', '159.00', '12');
Insert tb_produtos values ('20001061', 'Quantum Break', '159.00', '12');
Insert tb_produtos values ('20001062', 'Ori and the Blind Forest', '159.00', '12');
Insert tb_produtos values ('20001063', 'Cuphead', '159.00', '12');
Insert tb_produtos values ('20001064', 'Sea of Thieves', '159.00', '12');
Insert tb_produtos values ('20001065', 'State of Decay 2', '159.00', '12');
Insert tb_produtos values ('20001066', 'Ryse: Son of Rome', '159.00', '12');
Insert tb_produtos values ('20001067', 'Killer Instinct', '159.00', '12');
Insert tb_produtos values ('20001068', 'Forza Motorsport 7', '159.00', '12');
Insert tb_produtos values ('20001069', 'The Legend of Zelda: Breath of the Wild', '249.00', '8');
Insert tb_produtos values ('20001070', 'The Legend of Zelda: Tears of the Kingdom', '249.00', '8');
Insert tb_produtos values ('20001071', 'Super Mario Odyssey', '249.00', '8');
Insert tb_produtos values ('20001072', 'Mario Kart 8 Deluxe', '249.00', '8');
Insert tb_produtos values ('20001073', 'Super Smash Bros. Ultimate', '249.00', '8');
Insert tb_produtos values ('20001074', 'Animal Crossing: New Horizons', '249.00', '8');
Insert tb_produtos values ('20001075', 'Pokémon Scarlet', '249.00', '8');
Insert tb_produtos values ('20001076', 'Pokémon Violet', '249.00', '8');
Insert tb_produtos values ('20001077', 'Luigi''s Mansion 3', '249.00', '8');
Insert tb_produtos values ('20001078', 'Metroid Dread', '249.00', '8');
Insert tb_produtos values ('20001079', 'Kirby and the Forgotten Land', '249.00', '8');
Insert tb_produtos values ('20001080', 'Super Mario Bros. Wonder', '249.00', '8');
Insert tb_produtos values ('20001081', 'Fire Emblem: Three Houses', '249.00', '8');
Insert tb_produtos values ('20001082', 'Xenoblade Chronicles 3', '249.00', '8');
Insert tb_produtos values ('20001083', 'Mario Party Superstars', '249.00', '8');
Insert tb_produtos values ('20001084', 'Donkey Kong Country: Tropical Freeze', '249.00', '8');
Insert tb_produtos values ('20001085', 'Mario Kart 8', '249.00', '8');
Insert tb_produtos values ('20001086', 'Super Mario 3D World', '249.00', '8');
Insert tb_produtos values ('20001087', 'Donkey Kong Country: Tropical Freeze', '249.00', '8');
Insert tb_produtos values ('20001088', 'The Legend of Zelda: Breath of the Wild', '249.00', '8');
Insert tb_produtos values ('20001089', 'Halo 4', '69.00', '4');
Insert tb_produtos values ('20001090', 'Gears of War', '69.00', '4');
Insert tb_produtos values ('20001091', 'Forza Horizon', '69.00', '4');
Insert tb_produtos values ('20001092', 'Red Dead Redemption', '69.00', '4');
Insert tb_produtos values ('20001093', 'Grand Theft Auto IV', '69.00', '4');
Insert tb_produtos values ('20001094', 'Alan Wake', '69.00', '4');
Insert tb_produtos values ('20001095', 'BioShock', '69.00', '4');
Insert tb_produtos values ('20001096', 'Call of Duty: Modern Warfare 3', '69.00', '4');
Insert tb_produtos values ('20001097', 'Call of Duty: Black Ops 2', '69.00', '4');
Insert tb_produtos values ('20001098', 'Minecraft: Xbox 360 Edition', '69.00', '4');
Insert tb_produtos values ('20001099', 'Skate 3', '69.00', '4');
Insert tb_produtos values ('20001100', 'Assassin''s Creed IV Black Flag', '69.00', '4');
Insert tb_produtos values ('20001101', 'The Last of Us', '89.00', '6');
Insert tb_produtos values ('20001102', 'God of War III', '89.00', '6');
Insert tb_produtos values ('20001103', 'Uncharted 2: Among Thieves', '89.00', '6');
Insert tb_produtos values ('20001104', 'Uncharted 3: Drake''s Deception', '89.00', '6');
Insert tb_produtos values ('20001105', 'Gran Turismo 6', '89.00', '6');
Insert tb_produtos values ('20001106', 'Metal Gear Solid 4', '89.00', '6');
Insert tb_produtos values ('20001107', 'Red Dead Redemption', '89.00', '6');
Insert tb_produtos values ('20001108', 'Grand Theft Auto IV', '89.00', '6');
Insert tb_produtos values ('20001109', 'Demon''s Souls', '89.00', '6');
Insert tb_produtos values ('20001110', 'Heavy Rain', '89.00', '6');
Insert tb_produtos values ('20001111', 'Killzone 2', '89.00', '6');
Insert tb_produtos values ('20001112', 'Wii Sports', '99.00', '5');
Insert tb_produtos values ('20001113', 'Mario Kart Wii', '99.00', '5');
Insert tb_produtos values ('20001114', 'Super Mario Galaxy', '99.00', '5');
Insert tb_produtos values ('20001115', 'Super Smash Bros. Brawl', '99.00', '5');
Insert tb_produtos values ('20001116', 'The Legend of Zelda: Twilight Princess', '99.00', '5');
Insert tb_produtos values ('20001117', 'Xenoblade Chronicles', '99.00', '5');
Insert tb_produtos values ('20001118', 'Punch-Out!!', '99.00', '5');
Insert tb_produtos values ('20001119', 'Just Dance 3', '99.00', '5');
Insert tb_produtos values ('20001120', 'Pokémon Platinum', '79.00', '5');
Insert tb_produtos values ('20001121', 'Pokémon Black', '79.00', '5');
Insert tb_produtos values ('20001122', 'Pokémon White', '79.00', '5');
Insert tb_produtos values ('20001123', 'New Super Mario Bros.', '79.00', '5');
Insert tb_produtos values ('20001124', 'Animal Crossing: Wild World', '79.00', '5');
Insert tb_produtos values ('20001125', 'Professor Layton and the Curious Village', '79.00', '5');
Insert tb_produtos values ('20001126', 'Nintendogs', '79.00', '5');
Insert tb_produtos values ('20001127', 'Castlevania: Dawn of Sorrow', '79.00', '5');
Insert tb_produtos values ('20001128', 'Dragon Quest IX', '79.00', '5');
Insert tb_produtos values ('20001129', 'God of War: Ghost of Sparta', '79.00', '5');
Insert tb_produtos values ('20001130', 'Grand Theft Auto: Vice City Stories', '79.00', '5');
Insert tb_produtos values ('20001131', 'Monster Hunter Freedom Unite', '79.00', '5');
Insert tb_produtos values ('20001132', 'Crisis Core: Final Fantasy VII', '79.00', '5');
Insert tb_produtos values ('20001133', 'Metal Gear Solid: Peace Walker', '79.00', '5');
Insert tb_produtos values ('20001134', 'Tekken 6', '79.00', '5');
Insert tb_produtos values ('20001135', 'Midnight Club 3: DUB Edition', '79.00', '5');
Insert tb_produtos values ('20001136', 'God of War', '89.00', '6');
Insert tb_produtos values ('20001137', 'God of War II', '89.00', '6');
Insert tb_produtos values ('20001138', 'Grand Theft Auto: San Andreas', '89.00', '6');
Insert tb_produtos values ('20001139', 'Grand Theft Auto: Vice City', '89.00', '6');
Insert tb_produtos values ('20001140', 'Shadow of the Colossus', '89.00', '6');
Insert tb_produtos values ('20001141', 'Metal Gear Solid 3: Snake Eater', '89.00', '6');
Insert tb_produtos values ('20001142', 'Resident Evil 4', '89.00', '6');
Insert tb_produtos values ('20001143', 'Devil May Cry 3', '89.00', '6');
Insert tb_produtos values ('20001144', 'Kingdom Hearts', '89.00', '6');
Insert tb_produtos values ('20001145', 'Gran Turismo 4', '89.00', '6');
Insert tb_produtos values ('20001146', 'Tekken 5', '89.00', '6');
Insert tb_produtos values ('20001147', 'Mortal Kombat: Shaolin Monks', '89.00', '6');
Insert tb_produtos values ('20001148', 'Bully', '89.00', '6');
Insert tb_produtos values ('20001149', 'Need for Speed: Most Wanted', '89.00', '6');
Insert tb_produtos values ('20001150', 'Guitar Hero III: Legends of Rock', '89.00', '6');
Insert tb_produtos values ('20001151', 'Super Smash Bros Melee', '99.00', '5');
Insert tb_produtos values ('20001152', 'Metroid Prime', '99.00', '5');
Insert tb_produtos values ('20001153', 'Pikmin', '99.00', '5');
Insert tb_produtos values ('20001154', 'Eternal Darkness', '99.00', '5');
Insert tb_produtos values ('20001155', 'F-Zero GX', '99.00', '5');
Insert tb_produtos values ('20001156', 'Sonic Adventure 2', '69.00', '4');
Insert tb_produtos values ('20001157', 'Shenmue', '69.00', '4');
Insert tb_produtos values ('20001158', 'Crazy Taxi', '69.00', '4');
Insert tb_produtos values ('20001159', 'Jet Set Radio', '69.00', '4');
Insert tb_produtos values ('20001160', 'Resident Evil: Code Veronica', '69.00', '4');
Insert tb_produtos values ('20001161', 'Tetris', '69.00', '4');
Insert tb_produtos values ('20001162', 'Pokémon Red', '69.00', '4');
Insert tb_produtos values ('20001163', 'Pokémon Crystal', '69.00', '4');
Insert tb_produtos values ('20001164', 'The Legend of Zelda: Link''s Awakening', '69.00', '4');
Insert tb_produtos values ('20001165', 'Game & Watch Gallery', '69.00', '4');
Insert tb_produtos values ('20001166', 'Super Mario 64', '69.00', '4');
Insert tb_produtos values ('20001167', 'The Legend of Zelda: Ocarina of Time', '69.00', '4');
Insert tb_produtos values ('20001168', 'The Legend of Zelda: Majora''s Mask', '69.00', '4');
Insert tb_produtos values ('20001169', 'GoldenEye 007', '69.00', '4');
Insert tb_produtos values ('20001170', 'Banjo-Kazooie', '69.00', '4');
Insert tb_produtos values ('20001171', 'Pokémon Stadium', '69.00', '4');
Insert tb_produtos values ('20001172', 'Perfect Dark', '69.00', '4');
Insert tb_produtos values ('20001173', 'Crash Bandicoot 2: Cortex Strikes Back', '69.00', '4');
Insert tb_produtos values ('20001174', 'Final Fantasy VIII', '69.00', '4');
Insert tb_produtos values ('20001175', 'Metal Gear Solid', '69.00', '4');
Insert tb_produtos values ('20001176', 'Resident Evil 3: Nemesis', '69.00', '4');
Insert tb_produtos values ('20001177', 'Silent Hill', '69.00', '4');
Insert tb_produtos values ('20001178', 'Gran Turismo', '69.00', '4');
Insert tb_produtos values ('20001179', 'Tekken 3', '69.00', '4');
Insert tb_produtos values ('20001180', 'Castlevania: Symphony of the Night', '69.00', '4');
Insert tb_produtos values ('20001181', 'Tony Hawk''s Pro Skater 2', '69.00', '4');
Insert tb_produtos values ('20001182', 'Sonic the Hedgehog', '69.00', '4');
Insert tb_produtos values ('20001183', 'Streets of Rage', '69.00', '4');
Insert tb_produtos values ('20001184', 'Gunstar Heroes', '69.00', '4');
Insert tb_produtos values ('20001185', 'Comix Zone', '69.00', '4');
Insert tb_produtos values ('20001186', 'Shinobi III', '69.00', '4');
Insert tb_produtos values ('20001187', 'Phantasy Star IV', '69.00', '4');
Insert tb_produtos values ('20001188', 'Super Mario World', '69.00', '4');
Insert tb_produtos values ('20001189', 'The Legend of Zelda: A Link to the Past', '69.00', '4');
Insert tb_produtos values ('20001190', 'Super Metroid', '69.00', '4');
Insert tb_produtos values ('20001191', 'Donkey Kong Country', '69.00', '4');
Insert tb_produtos values ('20001192', 'Chrono Trigger', '69.00', '4');
Insert tb_produtos values ('20001193', 'Super Street Fighter II', '69.00', '4');
Insert tb_produtos values ('20001194', 'Mega Man X', '69.00', '4');
Insert tb_produtos values ('20001195', 'F-Zero', '69.00', '4');
Insert tb_produtos values ('30001001', 'Controle DualSense', '399.00', '15');
Insert tb_produtos values ('30001002', 'Controle DualShock 4', '279.00', '12');
Insert tb_produtos values ('30001003', 'Controle DualShock 3', '149.00', '8');
Insert tb_produtos values ('30001004', 'Controle Xbox Wireless', '349.00', '14');
Insert tb_produtos values ('30001005', 'Controle Xbox One', '269.00', '10');
Insert tb_produtos values ('30001006', 'Controle Xbox 360', '149.00', '6');
Insert tb_produtos values ('30001007', 'Joy-Con esquerdo', '199.00', '10');
Insert tb_produtos values ('30001008', 'Joy-Con direito', '199.00', '10');
Insert tb_produtos values ('30001009', 'Nintendo Switch Pro Controller', '329.00', '8');
Insert tb_produtos values ('30001010', 'Nintendo Switch 2 Pro Controller', '399.00', '6');
Insert tb_produtos values ('30001011', 'Controle Wii Remote', '129.00', '8');
Insert tb_produtos values ('30001012', 'Nunchuk Wii', '69.00', '10');
Insert tb_produtos values ('30001013', 'Controle GameCube', '149.00', '5');
Insert tb_produtos values ('30001014', 'Controle Nintendo 64', '119.00', '4');
Insert tb_produtos values ('30001015', 'Controle Sega Mega Drive', '89.00', '5');
Insert tb_produtos values ('30001016', 'Headset Gamer Pulse 3D', '399.00', '7');
Insert tb_produtos values ('30001017', 'Headset Gamer Xbox', '349.00', '6');
Insert tb_produtos values ('30001018', 'Headset Gamer Universal', '179.00', '12');
Insert tb_produtos values ('30001019', 'Headset Gamer Bluetooth', '219.00', '8');
Insert tb_produtos values ('30001020', 'Microfone Gamer USB', '159.00', '5');
Insert tb_produtos values ('30001021', 'Cabo HDMI 2.1', '69.00', '20');
Insert tb_produtos values ('30001022', 'Cabo HDMI 2.0', '45.00', '20');
Insert tb_produtos values ('30001023', 'Cabo USB-C', '39.00', '25');
Insert tb_produtos values ('30001024', 'Cabo Micro USB', '29.00', '15');
Insert tb_produtos values ('30001025', 'Cabo USB para controle Xbox', '45.00', '12');
Insert tb_produtos values ('30001026', 'Cabo de força PS5', '49.00', '10');
Insert tb_produtos values ('30001027', 'Cabo de força Xbox', '49.00', '10');
Insert tb_produtos values ('30001028', 'Cabo AV Nintendo Wii', '45.00', '8');
Insert tb_produtos values ('30001029', 'Cabo componente PS2', '55.00', '5');
Insert tb_produtos values ('30001030', 'Cabo de rede Ethernet', '35.00', '15');
Insert tb_produtos values ('30001031', 'Fonte de alimentação Xbox 360', '149.00', '5');
Insert tb_produtos values ('30001032', 'Fonte Nintendo Switch', '169.00', '6');
Insert tb_produtos values ('30001033', 'Carregador DualSense', '119.00', '8');
Insert tb_produtos values ('30001034', 'Base carregadora DualShock 4', '89.00', '6');
Insert tb_produtos values ('30001035', 'Carregador Joy-Con', '99.00', '7');
Insert tb_produtos values ('30001036', 'Bateria recarregável Xbox', '109.00', '8');
Insert tb_produtos values ('30001037', 'Base vertical PS5', '119.00', '6');
Insert tb_produtos values ('30001038', 'Base vertical Xbox Series X', '99.00', '5');
Insert tb_produtos values ('30001039', 'Suporte para headset', '59.00', '10');
Insert tb_produtos values ('30001040', 'Suporte para controles', '69.00', '10');
Insert tb_produtos values ('30001041', 'Case de transporte Nintendo Switch', '89.00', '8');
Insert tb_produtos values ('30001042', 'Case de transporte Nintendo Switch 2', '109.00', '6');
Insert tb_produtos values ('30001043', 'Capa protetora DualSense', '39.00', '12');
Insert tb_produtos values ('30001044', 'Capa protetora Xbox Controller', '39.00', '12');
Insert tb_produtos values ('30001045', 'Película protetora Switch', '35.00', '10');
Insert tb_produtos values ('30001046', 'Película protetora Switch 2', '45.00', '8');
Insert tb_produtos values ('30001047', 'Adaptador Bluetooth USB', '59.00', '10');
Insert tb_produtos values ('30001048', 'Adaptador USB-C para HDMI', '79.00', '8');
Insert tb_produtos values ('30001049', 'Adaptador de controle USB', '69.00', '6');
Insert tb_produtos values ('30001050', 'Hub USB 4 portas', '89.00', '8');
Insert tb_produtos values ('30001051', 'Volante Gamer', '649.00', '3');
Insert tb_produtos values ('30001052', 'Pedal para volante Gamer', '249.00', '3');
Insert tb_produtos values ('30001053', 'Cartão microSD 256GB', '169.00', '10');
Insert tb_produtos values ('30001054', 'SSD externo 1TB', '399.00', '5');
Insert tb_produtos values ('30001055', 'Controle arcade USB', '299.00', '4');

Insert tb_console values('10001001', 'Blu-ray / Digital', '9ª geração', 'Sony');
Insert tb_console values('10001002', 'Blu-ray / Digital', '9ª geração', 'Microsoft');
Insert tb_console values('10001003', 'Digital', '9ª geração', 'Microsoft');
Insert tb_console values('10001004', 'Cartucho / Digital', '9ª geração', 'Nintendo');
Insert tb_console values('10001005', 'Blu-ray / Digital', '8ª geração', 'Sony');
Insert tb_console values('10001006', 'DVD / Digital', '8ª geração', 'Microsoft');
Insert tb_console values('10001007', 'Cartucho / Digital', '8ª geração', 'Nintendo');
Insert tb_console values('10001008', 'Disco óptico', '8ª geração', 'Nintendo');
Insert tb_console values('10001009', 'DVD / Digital', '7ª geração', 'Microsoft');
Insert tb_console values('10001010', 'Blu-ray / Digital', '7ª geração', 'Sony');
Insert tb_console values('10001011', 'Disco óptico', '6ª geração', 'Nintendo');
Insert tb_console values('10001012', 'Cartucho', '7ª geração', 'Nintendo');
Insert tb_console values('10001013', 'UMD / Digital', '7ª geração', 'Sony');
Insert tb_console values('10001014', 'DVD / CD', '6ª geração', 'Sony');
Insert tb_console values('10001015', 'MiniDVD', '6ª geração', 'Nintendo');
Insert tb_console values('10001016', 'GD-ROM', '6ª geração', 'Sega');
Insert tb_console values('10001017', 'Cartucho', '4ª geração', 'Nintendo');
Insert tb_console values('10001018', 'Cartucho', '5ª geração', 'Nintendo');
Insert tb_console values('10001019', 'CD', '5ª geração', 'Sony');
Insert tb_console values('10001020', 'Cartucho', '4ª geração', 'Sega');
Insert tb_console values('10001021', 'Cartucho', '4ª geração', 'Nintendo');

Insert tb_jogos values('20001001', 'Playstation 5', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001002', 'Playstation 5', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001003', 'Playstation 5', 'Ação / Aventura', '12 anos');
Insert tb_jogos values('20001004', 'Playstation 5', 'Corrida', 'Livre');
Insert tb_jogos values('20001005', 'Playstation 5', 'Ação / Plataforma', '10 anos');
Insert tb_jogos values('20001006', 'Playstation 5', 'RPG / Ação', '16 anos');
Insert tb_jogos values('20001007', 'Playstation 5', 'Roguelike / Ação', '16 anos');
Insert tb_jogos values('20001008', 'Playstation 5', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001009', 'Playstation 5', 'RPG', '16 anos');
Insert tb_jogos values('20001010', 'Playstation 5', 'RPG / Ação', '14 anos');
Insert tb_jogos values('20001011', 'Playstation 5', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001012', 'Playstation 5', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001013', 'Playstation 5', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001014', 'Playstation 5', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001015', 'Playstation 5', 'RPG / Ação', '16 anos');
Insert tb_jogos values('20001016', 'Playstation 5', 'RPG / Aventura', '12 anos');
Insert tb_jogos values('20001017', 'Playstation 5', 'Luta', '18 anos');
Insert tb_jogos values('20001018', 'Playstation 5', 'Luta', '12 anos');
Insert tb_jogos values('20001019', 'Playstation 5', 'Luta', '12 anos');
Insert tb_jogos values('20001020', 'Playstation 5', 'RPG / Ação', '18 anos');
Insert tb_jogos values('20001021', 'Xbox Series X', 'Tiro / Ação', '16 anos');
Insert tb_jogos values('20001022', 'Xbox Series X', 'Corrida', 'Livre');
Insert tb_jogos values('20001023', 'Xbox Series X', 'Tiro / Ação', '16 anos');
Insert tb_jogos values('20001024', 'Xbox Series X', 'RPG / Aventura', '16 anos');
Insert tb_jogos values('20001025', 'Xbox Series X', 'Simulação', 'Livre');
Insert tb_jogos values('20001026', 'Xbox Series X', 'Ação / Aventura', '12 anos');
Insert tb_jogos values('20001027', 'Xbox Series X', 'Corrida', 'Livre');
Insert tb_jogos values('20001028', 'Xbox Series X', 'Ação / Ritmo', '12 anos');
Insert tb_jogos values('20001029', 'Xbox Series X', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001030', 'Xbox Series X', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001031', 'Xbox Series X', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001032', 'Xbox Series X', 'Plataforma / Aventura', '12 anos');
Insert tb_jogos values('20001033', 'Xbox Series X', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001034', 'Xbox Series X', 'RPG / Ação', '16 anos');
Insert tb_jogos values('20001035', 'Xbox Series X', 'RPG / Ação', '18 anos');
Insert tb_jogos values('20001036', 'Switch 2', 'Corrida', 'Livre');
Insert tb_jogos values('20001037', 'Switch 2', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001038', 'Switch 2', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001039', 'Switch 2', 'Ação / Aventura', '10 anos');
Insert tb_jogos values('20001040', 'Playstation 4', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001041', 'Playstation 4', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001042', 'Playstation 4', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001043', 'Playstation 4', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001044', 'Playstation 4', 'RPG / Ação', '16 anos');
Insert tb_jogos values('20001045', 'Playstation 4', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001046', 'Playstation 4', 'Ação / Aventura', '12 anos');
Insert tb_jogos values('20001047', 'Playstation 4', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001048', 'Playstation 4', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001049', 'Playstation 4', 'Terror / Aventura', '18 anos');
Insert tb_jogos values('20001050', 'Playstation 4', 'Aventura / Drama', '16 anos');
Insert tb_jogos values('20001051', 'Playstation 4', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001052', 'Playstation 4', 'Ação / Mundo Aberto', '18 anos');
Insert tb_jogos values('20001053', 'Playstation 4', 'RPG / Aventura', '16 anos');
Insert tb_jogos values('20001054', 'Playstation 4', 'RPG / Ação', '16 anos');
Insert tb_jogos values('20001055', 'Playstation 4', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001056', 'Playstation 4', 'Luta', '18 anos');
Insert tb_jogos values('20001057', 'Xbox One', 'Tiro / Ação', '16 anos');
Insert tb_jogos values('20001058', 'Xbox One', 'Corrida', 'Livre');
Insert tb_jogos values('20001059', 'Xbox One', 'Tiro / Ação', '18 anos');
Insert tb_jogos values('20001060', 'Xbox One', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001061', 'Xbox One', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001062', 'Xbox One', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001063', 'Xbox One', 'Plataforma / Ação', 'Livre');
Insert tb_jogos values('20001064', 'Xbox One', 'Ação / Aventura', '12 anos');
Insert tb_jogos values('20001065', 'Xbox One', 'Sobrevivência', '18 anos');
Insert tb_jogos values('20001066', 'Xbox One', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001067', 'Xbox One', 'Luta', '12 anos');
Insert tb_jogos values('20001068', 'Xbox One', 'Corrida', 'Livre');
Insert tb_jogos values('20001069', 'Switch', 'Ação / Aventura', '10 anos');
Insert tb_jogos values('20001070', 'Switch', 'Ação / Aventura', '10 anos');
Insert tb_jogos values('20001071', 'Switch', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001072', 'Switch', 'Corrida', 'Livre');
Insert tb_jogos values('20001073', 'Switch', 'Luta', '10 anos');
Insert tb_jogos values('20001074', 'Switch', 'Simulação', 'Livre');
Insert tb_jogos values('20001075', 'Switch', 'RPG', 'Livre');
Insert tb_jogos values('20001076', 'Switch', 'RPG', 'Livre');
Insert tb_jogos values('20001077', 'Switch', 'Aventura / Terror', 'Livre');
Insert tb_jogos values('20001078', 'Switch', 'Ação / Plataforma', '10 anos');
Insert tb_jogos values('20001079', 'Switch', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001080', 'Switch', 'Plataforma', 'Livre');
Insert tb_jogos values('20001081', 'Switch', 'RPG / Estratégia', '12 anos');
Insert tb_jogos values('20001082', 'Switch', 'RPG', '12 anos');
Insert tb_jogos values('20001083', 'Switch', 'Festa / Minijogos', 'Livre');
Insert tb_jogos values('20001084', 'Switch', 'Plataforma', 'Livre');
Insert tb_jogos values('20001085', 'Wii U', 'Corrida', 'Livre');
Insert tb_jogos values('20001086', 'Wii U', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001087', 'Wii U', 'Plataforma', 'Livre');
Insert tb_jogos values('20001088', 'Wii U', 'Ação / Aventura', '10 anos');
Insert tb_jogos values('20001089', 'Xbox 360', 'Tiro / Ação', '16 anos');
Insert tb_jogos values('20001090', 'Xbox 360', 'Tiro / Ação', '18 anos');
Insert tb_jogos values('20001091', 'Xbox 360', 'Corrida', 'Livre');
Insert tb_jogos values('20001092', 'Xbox 360', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001093', 'Xbox 360', 'Ação / Mundo Aberto', '18 anos');
Insert tb_jogos values('20001094', 'Xbox 360', 'Terror / Ação', '16 anos');
Insert tb_jogos values('20001095', 'Xbox 360', 'Tiro / Ação', '18 anos');
Insert tb_jogos values('20001096', 'Xbox 360', 'Tiro / Ação', '18 anos');
Insert tb_jogos values('20001097', 'Xbox 360', 'Tiro / Ação', '18 anos');
Insert tb_jogos values('20001098', 'Xbox 360', 'Aventura / Construção', 'Livre');
Insert tb_jogos values('20001099', 'Xbox 360', 'Esporte / Skate', 'Livre');
Insert tb_jogos values('20001100', 'Xbox 360', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001101', 'Playstation 3', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001102', 'Playstation 3', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001103', 'Playstation 3', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001104', 'Playstation 3', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001105', 'Playstation 3', 'Corrida', 'Livre');
Insert tb_jogos values('20001106', 'Playstation 3', 'Ação / Furtividade', '18 anos');
Insert tb_jogos values('20001107', 'Playstation 3', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001108', 'Playstation 3', 'Ação / Mundo Aberto', '18 anos');
Insert tb_jogos values('20001109', 'Playstation 3', 'RPG / Ação', '16 anos');
Insert tb_jogos values('20001110', 'Playstation 3', 'Drama / Aventura', '16 anos');
Insert tb_jogos values('20001111', 'Playstation 3', 'Tiro / Ação', '16 anos');
Insert tb_jogos values('20001112', 'Wii', 'Esporte', 'Livre');
Insert tb_jogos values('20001113', 'Wii', 'Corrida', 'Livre');
Insert tb_jogos values('20001114', 'Wii', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001115', 'Wii', 'Luta', '10 anos');
Insert tb_jogos values('20001116', 'Wii', 'Ação / Aventura', '10 anos');
Insert tb_jogos values('20001117', 'Wii', 'RPG', '12 anos');
Insert tb_jogos values('20001118', 'Wii', 'Esporte / Luta', 'Livre');
Insert tb_jogos values('20001119', 'Wii', 'Ritmo / Dança', 'Livre');
Insert tb_jogos values('20001120', 'DS', 'RPG', 'Livre');
Insert tb_jogos values('20001121', 'DS', 'RPG', 'Livre');
Insert tb_jogos values('20001122', 'DS', 'RPG', 'Livre');
Insert tb_jogos values('20001123', 'DS', 'Plataforma', 'Livre');
Insert tb_jogos values('20001124', 'DS', 'Simulação', 'Livre');
Insert tb_jogos values('20001125', 'DS', 'Aventura / Quebra-cabeça', 'Livre');
Insert tb_jogos values('20001126', 'DS', 'Simulação', 'Livre');
Insert tb_jogos values('20001127', 'DS', 'Ação / Plataforma', '12 anos');
Insert tb_jogos values('20001128', 'DS', 'RPG', '10 anos');
Insert tb_jogos values('20001129', 'PSP', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001130', 'PSP', 'Ação / Mundo Aberto', '18 anos');
Insert tb_jogos values('20001131', 'PSP', 'RPG / Ação', '12 anos');
Insert tb_jogos values('20001132', 'PSP', 'RPG', '12 anos');
Insert tb_jogos values('20001133', 'PSP', 'Ação / Furtividade', '16 anos');
Insert tb_jogos values('20001134', 'PSP', 'Luta', '12 anos');
Insert tb_jogos values('20001135', 'PSP', 'Corrida', 'Livre');
Insert tb_jogos values('20001136', 'Playstation 2', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001137', 'Playstation 2', 'Ação / Aventura', '18 anos');
Insert tb_jogos values('20001138', 'Playstation 2', 'Ação / Mundo Aberto', '18 anos');
Insert tb_jogos values('20001139', 'Playstation 2', 'Ação / Mundo Aberto', '18 anos');
Insert tb_jogos values('20001140', 'Playstation 2', 'Ação / Aventura', '10 anos');
Insert tb_jogos values('20001141', 'Playstation 2', 'Ação / Furtividade', '18 anos');
Insert tb_jogos values('20001142', 'Playstation 2', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001143', 'Playstation 2', 'Ação', '18 anos');
Insert tb_jogos values('20001144', 'Playstation 2', 'RPG / Ação', 'Livre');
Insert tb_jogos values('20001145', 'Playstation 2', 'Corrida', 'Livre');
Insert tb_jogos values('20001146', 'Playstation 2', 'Luta', '12 anos');
Insert tb_jogos values('20001147', 'Playstation 2', 'Luta / Ação', '16 anos');
Insert tb_jogos values('20001148', 'Playstation 2', 'Ação / Aventura', '16 anos');
Insert tb_jogos values('20001149', 'Playstation 2', 'Corrida', 'Livre');
Insert tb_jogos values('20001150', 'Playstation 2', 'Música / Ritmo', 'Livre');
Insert tb_jogos values('20001151', 'GameCube', 'Luta', '10 anos');
Insert tb_jogos values('20001152', 'GameCube', 'Ação / Aventura', '12 anos');
Insert tb_jogos values('20001153', 'GameCube', 'Estratégia / Aventura', 'Livre');
Insert tb_jogos values('20001154', 'GameCube', 'Terror / Aventura', '18 anos');
Insert tb_jogos values('20001155', 'GameCube', 'Corrida', 'Livre');
Insert tb_jogos values('20001156', 'Dreamcast', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001157', 'Dreamcast', 'Aventura', '16 anos');
Insert tb_jogos values('20001158', 'Dreamcast', 'Corrida', 'Livre');
Insert tb_jogos values('20001159', 'Dreamcast', 'Ação / Aventura', '12 anos');
Insert tb_jogos values('20001160', 'Dreamcast', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001161', 'Gameboy', 'Quebra-cabeça', 'Livre');
Insert tb_jogos values('20001162', 'Gameboy', 'RPG', 'Livre');
Insert tb_jogos values('20001163', 'Gameboy', 'RPG', 'Livre');
Insert tb_jogos values('20001164', 'Gameboy', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001165', 'Gameboy', 'Minijogos', 'Livre');
Insert tb_jogos values('20001166', 'Nintendo 64', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001167', 'Nintendo 64', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001168', 'Nintendo 64', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001169', 'Nintendo 64', 'Tiro', '12 anos');
Insert tb_jogos values('20001170', 'Nintendo 64', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001171', 'Nintendo 64', 'RPG / Estratégia', 'Livre');
Insert tb_jogos values('20001172', 'Nintendo 64', 'Tiro / Ação', '16 anos');
Insert tb_jogos values('20001173', 'Playstation', 'Plataforma / Aventura', 'Livre');
Insert tb_jogos values('20001174', 'Playstation', 'RPG', '12 anos');
Insert tb_jogos values('20001175', 'Playstation', 'Ação / Furtividade', '18 anos');
Insert tb_jogos values('20001176', 'Playstation', 'Terror / Ação', '18 anos');
Insert tb_jogos values('20001177', 'Playstation', 'Terror', '18 anos');
Insert tb_jogos values('20001178', 'Playstation', 'Corrida', 'Livre');
Insert tb_jogos values('20001179', 'Playstation', 'Luta', '12 anos');
Insert tb_jogos values('20001180', 'Playstation', 'Ação / RPG', '16 anos');
Insert tb_jogos values('20001181', 'Playstation', 'Esporte / Skate', 'Livre');
Insert tb_jogos values('20001182', 'Mega Drive', 'Plataforma', 'Livre');
Insert tb_jogos values('20001183', 'Mega Drive', 'Ação / Luta', '12 anos');
Insert tb_jogos values('20001184', 'Mega Drive', 'Ação / Plataforma', 'Livre');
Insert tb_jogos values('20001185', 'Mega Drive', 'Ação / Plataforma', 'Livre');
Insert tb_jogos values('20001186', 'Mega Drive', 'Ação / Plataforma', '12 anos');
Insert tb_jogos values('20001187', 'Mega Drive', 'RPG', 'Livre');
Insert tb_jogos values('20001188', 'Super Nintendo', 'Plataforma', 'Livre');
Insert tb_jogos values('20001189', 'Super Nintendo', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001190', 'Super Nintendo', 'Ação / Aventura', 'Livre');
Insert tb_jogos values('20001191', 'Super Nintendo', 'Plataforma', 'Livre');
Insert tb_jogos values('20001192', 'Super Nintendo', 'RPG', 'Livre');
Insert tb_jogos values('20001193', 'Super Nintendo', 'Luta', '12 anos');
Insert tb_jogos values('20001194', 'Super Nintendo', 'Ação / Plataforma', 'Livre');
Insert tb_jogos values('20001195', 'Super Nintendo', 'Corrida', 'Livre');

INSERT INTO tb_acessorios (produto_id, tipo, cor, compatibilidade, conexao) VALUES
(30001001, 'Controle', 'Branco', 'PS5', 'Bluetooth'),
(30001002, 'Controle', 'Preto', 'PS4', 'Bluetooth'),
(30001003, 'Controle', 'Preto', 'PS3', 'Bluetooth'),
(30001004, 'Controle', 'Preto', 'Xbox Series X/S', 'Bluetooth'),
(30001005, 'Controle', 'Preto', 'Xbox One', 'Sem fio'),
(30001006, 'Controle', 'Preto', 'Xbox 360', 'Sem fio'),
(30001007, 'Controle', 'Azul', 'Switch / Switch 2', 'Bluetooth / Trilho'),
(30001008, 'Controle', 'Vermelho', 'Switch / Switch 2', 'Bluetooth / Trilho'),
(30001009, 'Controle', 'Preto', 'Switch', 'Bluetooth'),
(30001010, 'Controle', 'Preto', 'Switch 2', 'Bluetooth'),
(30001011, 'Controle', 'Branco', 'Wii / Wii U', 'Bluetooth'),
(30001012, 'Acessório de controle', 'Preto', 'Wii / Wii U', 'Conector proprietário'),
(30001013, 'Controle', 'Roxo', 'GameCube', 'Com fio'),
(30001014, 'Controle', 'Cinza', 'Nintendo 64', 'Com fio'),
(30001015, 'Controle', 'Preto', 'Mega Drive', 'Com fio'),
(30001016, 'Headset', 'Preto', 'PS5 / PS4', 'USB / Sem fio'),
(30001017, 'Headset', 'Preto', 'Xbox', 'Sem fio'),
(30001018, 'Headset', 'Preto', 'Universal', 'P2 / USB'),
(30001019, 'Headset', 'Preto', 'Universal', 'Bluetooth'),
(30001020, 'Microfone', 'Preto', 'PC / Consoles', 'USB'),
(30001021, 'Cabo HDMI', 'Preto', 'PS5 / Xbox / Switch 2', 'HDMI'),
(30001022, 'Cabo HDMI', 'Preto', 'Universal', 'HDMI'),
(30001023, 'Cabo USB-C', 'Preto', 'Universal', 'USB-C'),
(30001024, 'Cabo Micro USB', 'Preto', 'PS4 / PS3', 'Micro USB'),
(30001025, 'Cabo USB', 'Preto', 'Xbox', 'USB'),
(30001026, 'Cabo de força', 'Preto', 'PS5', 'Energia AC'),
(30001027, 'Cabo de força', 'Preto', 'Xbox', 'Energia AC'),
(30001028, 'Cabo AV', 'Preto', 'Wii', 'AV composto'),
(30001029, 'Cabo componente', 'Preto', 'PS2', 'Componente'),
(30001030, 'Cabo de rede', 'Preto', 'Universal', 'RJ-45'),
(30001031, 'Fonte de alimentação', 'Preto', 'Xbox 360', 'Conector proprietário'),
(30001032, 'Fonte de alimentação', 'Preto', 'Switch', 'USB-C'),
(30001033, 'Carregador', 'Branco', 'PS5', 'USB-C'),
(30001034, 'Base carregadora', 'Preto', 'PS4', 'USB'),
(30001035, 'Carregador', 'Preto', 'Switch', 'USB-C'),
(30001036, 'Bateria recarregável', 'Preto', 'Xbox', 'Conector proprietário'),
(30001037, 'Base vertical', 'Preto', 'PS5', 'Sem conexão'),
(30001038, 'Base vertical', 'Preto', 'Xbox Series X', 'Sem conexão'),
(30001039, 'Suporte', 'Preto', 'Universal', 'Sem conexão'),
(30001040, 'Suporte', 'Preto', 'Universal', 'Sem conexão'),
(30001041, 'Case', 'Preto', 'Switch', 'Sem conexão'),
(30001042, 'Case', 'Preto', 'Switch 2', 'Sem conexão'),
(30001043, 'Capa protetora', 'Branco', 'PS5', 'Encaixe'),
(30001044, 'Capa protetora', 'Preto', 'Xbox', 'Encaixe'),
(30001045, 'Película protetora', 'Transparente', 'Switch', 'Sem conexão'),
(30001046, 'Película protetora', 'Transparente', 'Switch 2', 'Sem conexão'),
(30001047, 'Adaptador Bluetooth', 'Preto', 'PC / Universal', 'USB'),
(30001048, 'Adaptador HDMI', 'Cinza', 'Universal', 'USB-C / HDMI'),
(30001049, 'Adaptador de controle', 'Preto', 'Universal', 'USB'),
(30001050, 'Hub USB', 'Preto', 'Universal', 'USB'),
(30001051, 'Volante gamer', 'Preto', 'PS5 / PS4 / Xbox', 'USB'),
(30001052, 'Pedal gamer', 'Preto', 'Universal', 'Conector proprietário'),
(30001053, 'Cartão de memória', 'Preto', 'Switch / Switch 2', 'MicroSD'),
(30001054, 'SSD externo', 'Preto', 'PS5 / Xbox / PC', 'USB-C'),
(30001055, 'Controle arcade', 'Preto', 'PC / Consoles', 'USB');

INSERT INTO tb_cliente (cod_cliente, nome, CPF, endereco, email, telefone) VALUES
(1, 'Cliente Exemplo 01', '000.000.000-13', 'Endereço fictício 01', 'cliente01@example.com', '(00) 00000-0001'),
(2, 'Cliente Exemplo 02', '000.000.000-14', 'Endereço fictício 02', 'cliente02@example.com', '(00) 00000-0002'),
(3, 'Cliente Exemplo 03', '000.000.000-15', 'Endereço fictício 03', 'cliente03@example.com', '(00) 00000-0003'),
(4, 'Cliente Exemplo 04', '000.000.000-16', 'Endereço fictício 04', 'cliente04@example.com', '(00) 00000-0004'),
(5, 'Cliente Exemplo 05', '000.000.000-17', 'Endereço fictício 05', 'cliente05@example.com', '(00) 00000-0005'),
(6, 'Cliente Exemplo 06', '000.000.000-18', 'Endereço fictício 06', 'cliente06@example.com', '(00) 00000-0006'),
(7, 'Cliente Exemplo 07', '000.000.000-19', 'Endereço fictício 07', 'cliente07@example.com', '(00) 00000-0007'),
(8, 'Cliente Exemplo 08', '000.000.000-20', 'Endereço fictício 08', 'cliente08@example.com', '(00) 00000-0008'),
(9, 'Cliente Exemplo 09', '000.000.000-21', 'Endereço fictício 09', 'cliente09@example.com', '(00) 00000-0009'),
(10, 'Cliente Exemplo 10', '000.000.000-22', 'Endereço fictício 10', 'cliente10@example.com', '(00) 00000-0010'),
(11, 'Cliente Exemplo 11', '000.000.000-23', 'Endereço fictício 11', 'cliente11@example.com', '(00) 00000-0011'),
(12, 'Cliente Exemplo 12', '000.000.000-24', 'Endereço fictício 12', 'cliente12@example.com', '(00) 00000-0012'),
(13, 'Cliente Exemplo 13', '000.000.000-25', 'Endereço fictício 13', 'cliente13@example.com', '(00) 00000-0013'),
(14, 'Cliente Exemplo 14', '000.000.000-26', 'Endereço fictício 14', 'cliente14@example.com', '(00) 00000-0014'),
(15, 'Cliente Exemplo 15', '000.000.000-27', 'Endereço fictício 15', 'cliente15@example.com', '(00) 00000-0015'),
(16, 'Cliente Exemplo 16', '000.000.000-28', 'Endereço fictício 16', 'cliente16@example.com', '(00) 00000-0016'),
(17, 'Cliente Exemplo 17', '000.000.000-29', 'Endereço fictício 17', 'cliente17@example.com', '(00) 00000-0017'),
(18, 'Cliente Exemplo 18', '000.000.000-30', 'Endereço fictício 18', 'cliente18@example.com', '(00) 00000-0018'),
(19, 'Cliente Exemplo 19', '000.000.000-31', 'Endereço fictício 19', 'cliente19@example.com', '(00) 00000-0019'),
(20, 'Cliente Exemplo 20', '000.000.000-32', 'Endereço fictício 20', 'cliente20@example.com', '(00) 00000-0020'),
(21, 'Cliente Exemplo 21', '000.000.000-33', 'Endereço fictício 21', 'cliente21@example.com', '(00) 00000-0021'),
(22, 'Cliente Exemplo 22', '000.000.000-34', 'Endereço fictício 22', 'cliente22@example.com', '(00) 00000-0022'),
(23, 'Cliente Exemplo 23', '000.000.000-35', 'Endereço fictício 23', 'cliente23@example.com', '(00) 00000-0023'),
(24, 'Cliente Exemplo 24', '000.000.000-36', 'Endereço fictício 24', 'cliente24@example.com', '(00) 00000-0024'),
(25, 'Cliente Exemplo 25', '000.000.000-37', 'Endereço fictício 25', 'cliente25@example.com', '(00) 00000-0025'),
(26, 'Cliente Exemplo 26', '000.000.000-38', 'Endereço fictício 26', 'cliente26@example.com', '(00) 00000-0026'),
(27, 'Cliente Exemplo 27', '000.000.000-39', 'Endereço fictício 27', 'cliente27@example.com', '(00) 00000-0027'),
(28, 'Cliente Exemplo 28', '000.000.000-40', 'Endereço fictício 28', 'cliente28@example.com', '(00) 00000-0028'),
(29, 'Cliente Exemplo 29', '000.000.000-41', 'Endereço fictício 29', 'cliente29@example.com', '(00) 00000-0029'),
(30, 'Cliente Exemplo 30', '000.000.000-42', 'Endereço fictício 30', 'cliente30@example.com', '(00) 00000-0030'),
(31, 'Cliente Exemplo 31', '000.000.000-43', 'Endereço fictício 31', 'cliente31@example.com', '(00) 00000-0031'),
(32, 'Cliente Exemplo 32', '000.000.000-44', 'Endereço fictício 32', 'cliente32@example.com', '(00) 00000-0032'),
(33, 'Cliente Exemplo 33', '000.000.000-45', 'Endereço fictício 33', 'cliente33@example.com', '(00) 00000-0033'),
(34, 'Cliente Exemplo 34', '000.000.000-46', 'Endereço fictício 34', 'cliente34@example.com', '(00) 00000-0034'),
(35, 'Cliente Exemplo 35', '000.000.000-47', 'Endereço fictício 35', 'cliente35@example.com', '(00) 00000-0035'),
(36, 'Cliente Exemplo 36', '000.000.000-48', 'Endereço fictício 36', 'cliente36@example.com', '(00) 00000-0036'),
(37, 'Cliente Exemplo 37', '000.000.000-49', 'Endereço fictício 37', 'cliente37@example.com', '(00) 00000-0037'),
(38, 'Cliente Exemplo 38', '000.000.000-50', 'Endereço fictício 38', 'cliente38@example.com', '(00) 00000-0038'),
(39, 'Cliente Exemplo 39', '000.000.000-51', 'Endereço fictício 39', 'cliente39@example.com', '(00) 00000-0039'),
(40, 'Cliente Exemplo 40', '000.000.000-52', 'Endereço fictício 40', 'cliente40@example.com', '(00) 00000-0040');

INSERT INTO tb_vendas (cod_venda, cliente_cod, produto_id, funci_id, qnt_item, valor_unitario, garantia, data_venda, forma_pag) VALUES
(1000, 1, 10001001, 2, 1, 3999.00, '12 meses', '2026-10-02', 'Crédito'),
(2000, 2, 20001022, 4, 2, 299.00, '90 dias', '2026-10-02', 'Pix'),
(3000, 3, 30001001, 9, 1, 399.00, '12 meses', '2026-10-02', 'Débito'),
(4000, 4, 10001003, 2, 1, 2199.00, '12 meses', '2026-10-03', 'Crédito'),
(5000, 5, 20001023, 4, 1, 299.00, '90 dias', '2026-10-03', 'Pix'),
(6000, 6, 30001007, 9, 2, 199.00, '90 dias', '2026-10-04', 'Débito'),
(7000, 7, 10001004, 2, 1, 3199.00, '12 meses', '2026-10-04', 'Crédito'),
(8000, 8, 20001024, 4, 1, 299.00, '90 dias', '2026-10-04', 'Pix'),
(9000, 9, 30001021, 9, 1, 69.00, '30 dias', '2026-10-04', 'Débito'),
(10000, 10, 10001005, 2, 1, 1599.00, '6 meses', '2026-10-05', 'Crédito'),
(11000, 11, 20001025, 4, 2, 299.00, '90 dias', '2026-10-05', 'Pix'),
(12000, 12, 30001016, 9, 1, 399.00, '12 meses', '2026-10-06', 'Débito'),
(13000, 13, 10001006, 2, 1, 1199.00, '6 meses', '2026-10-08', 'Crédito'),
(14000, 14, 20001026, 4, 1, 299.00, '90 dias', '2026-10-08', 'Pix'),
(15000, 15, 30001011, 9, 1, 129.00, '90 dias', '2026-10-08', 'Débito'),
(16000, 16, 10001007, 2, 1, 1899.00, '12 meses', '2026-10-08', 'Crédito'),
(17000, 17, 20001027, 4, 3, 299.00, '90 dias', '2026-10-09', 'Pix'),
(18000, 18, 30001022, 9, 2, 45.00, '30 dias', '2026-10-09', 'Débito'),
(19000, 19, 10001008, 2, 1, 899.00, '6 meses', '2026-10-10', 'Crédito'),
(20000, 20, 20001028, 4, 1, 299.00, '90 dias', '2026-10-10', 'Pix'),
(21000, 21, 30001009, 9, 1, 329.00, '12 meses', '2026-10-10', 'Débito'),
(22000, 22, 10001009, 2, 1, 699.00, '6 meses', '2026-10-11', 'Crédito'),
(23000, 23, 20001029, 4, 2, 299.00, '90 dias', '2026-10-11', 'Pix'),
(24000, 24, 30001020, 9, 1, 159.00, '90 dias', '2026-10-11', 'Débito'),
(25000, 25, 10001010, 2, 1, 799.00, '6 meses', '2026-10-11', 'Crédito'),
(26000, 26, 20001030, 4, 1, 299.00, '90 dias', '2026-10-11', 'Pix'),
(27000, 27, 30001041, 9, 1, 89.00, '30 dias', '2026-10-12', 'Débito'),
(28000, 28, 10001011, 2, 1, 599.00, '6 meses', '2026-10-12', 'Crédito'),
(29000, 29, 20001031, 4, 2, 299.00, '90 dias', '2026-10-13', 'Pix'),
(30000, 30, 30001053, 9, 1, 169.00, '90 dias', '2026-10-15', 'Débito'),
(31000, 31, 10001012, 2, 2, 499.00, '6 meses', '2026-10-15', 'Crédito'),
(32000, 32, 20001032, 4, 1, 299.00, '90 dias', '2026-10-16', 'Pix'),
(33000, 33, 30001035, 9, 1, 99.00, '90 dias', '2026-10-16', 'Débito'),
(34000, 34, 10001013, 2, 1, 649.00, '6 meses', '2026-10-16', 'Crédito'),
(35000, 35, 20001033, 4, 2, 299.00, '90 dias', '2026-10-17', 'Pix'),
(36000, 36, 30001050, 9, 1, 89.00, '90 dias', '2026-10-17', 'Débito'),
(37000, 37, 10001014, 2, 1, 599.00, '6 meses', '2026-10-18', 'Crédito'),
(38000, 38, 20001034, 4, 1, 299.00, '90 dias', '2026-10-19', 'Pix'),
(39000, 39, 30001054, 9, 1, 399.00, '12 meses', '2026-10-19', 'Débito'),
(40000, 40, 10001015, 2, 1, 799.00, '6 meses', '2026-10-19', 'Crédito');

INSERT INTO tb_reposicao (Id_reposicao, id_produto, CNPJ_fornecedor, id_funcionario, qnt_item, valor_compra, data_reposicao) VALUES
(101, 10001001, '00.000.000/0000-05', 8, 2, 5000.00, '2026-10-01'),
(202, 10001004, '00.000.000/0000-04', 12, 2, 3000.00, '2026-10-02'),
(303, 10001002, '00.000.000/0000-06', 8, 1, 2800.00, '2026-10-03'),
(404, 10001003, '00.000.000/0000-06', 12, 2, 3600.00, '2026-10-04'),
(505, 10001005, '00.000.000/0000-05', 8, 1, 1200.00, '2026-10-05'),
(606, 10001007, '00.000.000/0000-04', 12, 2, 1600.00, '2026-10-06'),
(707, 10001001, '00.000.000/0000-05', 8, 1, 2500.00, '2026-10-07'),
(808, 10001004, '00.000.000/0000-04', 12, 1, 1500.00, '2026-10-08'),
(909, 20001001, '00.000.000/0000-05', 8, 5, 750.00, '2026-10-09'),
(110, 20001002, '00.000.000/0000-05', 12, 4, 600.00, '2026-10-10'),
(111, 20001008, '00.000.000/0000-05', 8, 3, 600.00, '2026-10-11'),
(122, 20001015, '00.000.000/0000-01', 12, 4, 720.00, '2026-10-12'),
(133, 20001016, '00.000.000/0000-01', 8, 3, 360.00, '2026-10-13'),
(144, 20001051, '00.000.000/0000-01', 12, 6, 540.00, '2026-10-14'),
(155, 20001052, '00.000.000/0000-01', 8, 6, 480.00, '2026-10-15'),
(166, 20001039, '00.000.000/0000-04', 12, 3, 600.00, '2026-10-16'),
(177, 20001036, '00.000.000/0000-04', 8, 4, 1000.00, '2026-10-17'),
(188, 20001017, '00.000.000/0000-01', 12, 3, 360.00, '2026-10-18'),
(199, 20001022, '00.000.000/0000-06', 8, 4, 600.00, '2026-10-19'),
(200, 20001020, '00.000.000/0000-01', 12, 3, 300.00, '2026-10-20'),
(211, 20001010, '00.000.000/0000-05', 8, 2, 400.00, '2026-10-21'),
(222, 20001037, '00.000.000/0000-04', 12, 3, 750.00, '2026-10-22'),
(233, 20001030, '00.000.000/0000-06', 8, 2, 360.00, '2026-10-23'),
(244, 20001073, '00.000.000/0000-04', 12, 4, 600.00, '2026-10-24'),
(255, 20001080, '00.000.000/0000-04', 8, 3, 450.00, '2026-10-25'),
(266, 20001013, '00.000.000/0000-01', 12, 4, 480.00, '2026-10-26'),
(277, 20001018, '00.000.000/0000-01', 8, 3, 450.00, '2026-10-27'),
(288, 20001019, '00.000.000/0000-01', 12, 2, 300.00, '2026-10-28'),
(299, 20001040, '00.000.000/0000-05', 8, 3, 450.00, '2026-10-29'),
(300, 20001075, '00.000.000/0000-04', 12, 3, 450.00, '2026-10-30'),
(311, 20001076, '00.000.000/0000-04', 8, 2, 300.00, '2026-10-31'),
(322, 20001042, '00.000.000/0000-05', 12, 3, 450.00, '2026-11-01'),
(333, 20001045, '00.000.000/0000-05', 8, 2, 300.00, '2026-11-02'),
(344, 30001001, '00.000.000/0000-05', 12, 4, 1000.00, '2026-11-03'),
(355, 30001004, '00.000.000/0000-06', 8, 3, 750.00, '2026-11-04'),
(366, 30001010, '00.000.000/0000-04', 12, 2, 600.00, '2026-11-05'),
(377, 30001016, '00.000.000/0000-05', 8, 2, 600.00, '2026-11-06'),
(388, 30001018, '00.000.000/0000-02', 12, 4, 480.00, '2026-11-07'),
(399, 30001021, '00.000.000/0000-02', 8, 6, 180.00, '2026-11-08'),
(400, 30001033, '00.000.000/0000-05', 12, 3, 360.00, '2026-11-09'),
(411, 30001042, '00.000.000/0000-04', 8, 4, 200.00, '2026-11-01'),
(422, 30001053, '00.000.000/0000-04', 12, 3, 300.00, '2026-11-02'),
(433, 30001054, '00.000.000/0000-02', 8, 2, 700.00, '2026-11-03'),
(444, 30001055, '00.000.000/0000-02', 12, 2, 500.00, '2026-11-04'),
(455, 30001007, '00.000.000/0000-04', 8, 3, 450.00, '2026-11-05'),
(466, 30001017, '00.000.000/0000-06', 12, 2, 400.00, '2026-11-06'),
(477, 30001041, '00.000.000/0000-04', 8, 4, 240.00, '2026-11-07'),
(488, 30001045, '00.000.000/0000-04', 12, 6, 180.00, '2026-11-08'),
(499, 30001023, '00.000.000/0000-02', 8, 5, 100.00, '2026-11-09'),
(500, 30001051, '00.000.000/0000-02', 12, 1, 900.00, '2026-11-08'),
(511, 30001039, '00.000.000/0000-02', 8, 3, 150.00, '2026-11-09');

INSERT INTO tb_receita (id_receita, origem_venda, descricao, valor_total, data_recebimento) VALUES
(5001, 1000, 'Venda de console', 3999.00, '2026-10-02'),
(5002, 2000, 'Venda de jogo', 598.00, '2026-10-02'),
(5003, 3000, 'Venda de acessório', 399.00, '2026-10-02'),
(5004, 4000, 'Venda de console', 2199.00, '2026-10-03'),
(5005, 5000, 'Venda de jogo', 299.00, '2026-10-03'),
(5006, 6000, 'Venda de acessório', 398.00, '2026-10-04'),
(5007, 7000, 'Venda de console', 3199.00, '2026-10-04'),
(5008, 8000, 'Venda de jogo', 299.00, '2026-10-04'),
(5009, 9000, 'Venda de acessório', 69.00, '2026-10-04'),
(5010, 10000, 'Venda de console', 1599.00, '2026-10-05'),
(5011, 11000, 'Venda de jogo', 598.00, '2026-10-05'),
(5012, 12000, 'Venda de acessório', 399.00, '2026-10-06'),
(5013, 13000, 'Venda de console', 1199.00, '2026-10-08'),
(5014, 14000, 'Venda de jogo', 299.00, '2026-10-08'),
(5015, 15000, 'Venda de acessório', 129.00, '2026-10-08'),
(5016, 16000, 'Venda de console', 1899.00, '2026-10-08'),
(5017, 17000, 'Venda de jogo', 897.00, '2026-10-09'),
(5018, 18000, 'Venda de acessório', 90.00, '2026-10-09'),
(5019, 19000, 'Venda de console', 899.00, '2026-10-10'),
(5020, 20000, 'Venda de jogo', 299.00, '2026-10-10'),
(5021, 21000, 'Venda de acessório', 329.00, '2026-10-10'),
(5022, 22000, 'Venda de console', 699.00, '2026-10-11'),
(5023, 23000, 'Venda de jogo', 598.00, '2026-10-11'),
(5024, 24000, 'Venda de acessório', 159.00, '2026-10-11'),
(5025, 25000, 'Venda de console', 799.00, '2026-10-11'),
(5026, 26000, 'Venda de jogo', 299.00, '2026-10-11'),
(5027, 27000, 'Venda de acessório', 89.00, '2026-10-12'),
(5028, 28000, 'Venda de console', 1198.00, '2026-10-12'),
(5029, 29000, 'Venda de jogo', 299.00, '2026-10-13'),
(5030, 30000, 'Venda de acessório', 338.00, '2026-10-15'),
(5031, 31000, 'Venda de console', 499.00, '2026-10-15'),
(5032, 32000, 'Venda de jogo', 299.00, '2026-10-16'),
(5033, 33000, 'Venda de acessório', 99.00, '2026-10-16'),
(5034, 34000, 'Venda de console', 1298.00, '2026-10-16'),
(5035, 35000, 'Venda de jogo', 299.00, '2026-10-17'),
(5036, 36000, 'Venda de acessório', 89.00, '2026-10-17'),
(5037, 37000, 'Venda de console', 599.00, '2026-10-18'),
(5038, 38000, 'Venda de jogo', 299.00, '2026-10-19'),
(5039, 39000, 'Venda de acessório', 399.00, '2026-10-19'),
(5040, 40000, 'Venda de console', 799.00, '2026-10-19');

INSERT INTO tb_despesas(id_despesa, descricao, categoria, valor_pago, Data_pagamento, forma_pagamento, CNPJ_fornecedor)VALUES
(1111, 'Aluguel da loja', 'Aluguel', 2500.00, '2026-09-05', 'Pix', '00.000.000/0000-07'),
(2222, 'Conta de energia', 'Serviços públicos', 480.00, '2026-09-07', 'Pix', '00.000.000/0000-08'),
(3333, 'Conta de internet', 'Serviços públicos', 150.00, '2026-09-08', 'Crédito', '00.000.000/0000-09'),
(4444, 'Salários dos funcionários', 'Folha de pagamento', 12000.00, '2026-09-10', 'Transferência', '00.000.000/0000-10'),
(5555, 'Material de escritório', 'Administrativo', 320.00, '2026-09-12', 'Débito', '00.000.000/0000-11'),
(6666, 'Limpeza da loja', 'Manutenção', 180.00, '2026-09-14', 'Pix', '00.000.000/0000-12'),
(7777, 'Marketing digital', 'Publicidade', 650.00, '2026-09-16', 'Crédito', '00.000.000/0000-13'),
(8888, 'Frete de mercadorias', 'Logística', 420.00, '2026-09-18', 'Pix', '00.000.000/0000-14'),
(9999, 'Água', 'Serviços públicos', 110.00, '2026-09-20', 'Pix', '00.000.000/0000-15'),
(10000, 'Manutenção de computadores', 'Manutenção', 750.00, '2026-09-22', 'Transferência', '00.000.000/0000-16'),
(11111, 'Aluguel da loja', 'Aluguel', 2500.00, '2026-10-05', 'Pix', '00.000.000/0000-07'),
(12222, 'Conta de energia', 'Serviços públicos', 510.00, '2026-10-07', 'Pix', '00.000.000/0000-08'),
(13333, 'Conta de internet', 'Serviços públicos', 150.00, '2026-10-08', 'Crédito', '00.000.000/0000-09'),
(14444, 'Salários dos funcionários', 'Folha de pagamento', 12000.00, '2026-10-10', 'Transferência', '00.000.000/0000-10'),
(15555, 'Compra de embalagens', 'Administrativo', 290.00, '2026-10-12', 'Pix', '00.000.000/0000-11'),
(16666, 'Divulgação em redes sociais', 'Publicidade', 500.00, '2026-10-14', 'Crédito', '00.000.000/0000-13'),
(17777, 'Frete de mercadorias', 'Logística', 380.00, '2026-10-16', 'Pix', '00.000.000/0000-14'),
(18888, 'Reparo de equipamentos', 'Manutenção', 620.00, '2026-10-17', 'Transferência', '00.000.000/0000-16'),
(19999, 'Água', 'Serviços públicos', 115.00, '2026-10-19', 'Pix', '00.000.000/0000-15'),
(200000, 'Impostos da empresa', 'Impostos', 1800.00, '2026-10-19', 'Boleto', '00.000.000/0000-17'),
(211111, 'Compra de cartões-presente digitais', 'Jogos e serviços digitais', 750.00, '2026-09-20', 'Débito', '00.000.000/0000-03'),
(222222, 'Aquisição de jogos Nintendo Switch', 'Jogos', 2800.00, '2026-09-22', 'Boleto', '00.000.000/0000-04'),
(233333, 'Compra de acessórios PlayStation', 'Acessórios', 1650.00, '2026-10-05', 'Pix', '00.000.000/0000-05'),
(244444, 'Aquisição de headsets Xbox', 'Acessórios', 1100.00, '2026-10-07', 'Débito', '00.000.000/0000-06'),
(255555, 'Compra de consoles para revenda', 'Consoles', 9200.00, '2026-10-08', 'Boleto', '00.000.000/0000-01'),
(266666, 'Compra de teclados e mouses gamers', 'Acessórios', 980.00, '2026-10-10', 'Pix', '00.000.000/0000-02');

SET SQL_SAFE_UPDATES = 0;
/* Adicionando novo atributo a tabela funcionário*/
ALTER TABLE tb_funcionario
ADD COLUMN sexo Enum('Masculino', 'Feminino', 'Outros');

/* Adicionando dados de sexo a tabela funcionário*/
UPDATE tb_funcionario
SET sexo = 'Outros'
WHERE nome IN ('Funcionário Exemplo 07', 'Funcionário Exemplo 04', 'Funcionário Exemplo 01');

UPDATE tb_funcionario
SET sexo = 'Feminino'
WHERE nome = 'Funcionário Exemplo 06';

UPDATE tb_funcionario
SET sexo = 'Masculino'
WHERE nome NOT IN (
    'Funcionário Exemplo 07',
    'Funcionário Exemplo 04',
    'Funcionário Exemplo 01',
    'Funcionário Exemplo 06'
);

/* Alterando estoque do produto*/
UPDATE tb_produtos
SET estoque = 0
WHERE id_produto in (10001013, 10001011);

/* Queryes Básicas*/
/* 1. Consultar */
select *
from tb_produtos;

/* 2. Listar todos os clientes cadastrados na loja */
SELECT *
FROM tb_cliente;

/* 3. Consultar o nome e o telefone de todos os fornecedores */
SELECT nome, telefone
FROM tb_fornecedor;

/* 4. Listar o nome e o salário de todos os cargos da empresa */
SELECT nome, salario
FROM tb_cargos;

/* 5. Consultar o nome e o preço de todos os produtos */
SELECT nome, valor_produto
FROM tb_produtos;


/* 6. Listar os nomes e as cidades dos funcionários */
SELECT nome, cidade
FROM tb_funcionario;

/* 7. Consultar os jogos cadastrados e suas respectivas plataformas */
SELECT produto_id, plataforma, genero
FROM tb_jogos;

/* 8. Listar os consoles e seus respectivos fabricantes */
SELECT produto_id, fabricante, geracao
FROM tb_console;

/* 9. Consultar todas as despesas da empresa */
SELECT descricao, categoria, valor_pago
FROM tb_despesas;

/* 10. Listar os clientes em ordem alfabética */
SELECT nome, email, telefone
FROM tb_cliente
ORDER BY nome ASC;


/* Queries Intermediárias/
/* 11. Consultar os produtos com estoque igual a zero */
SELECT nome, estoque
FROM tb_produtos
WHERE estoque = 0;

/* 12. Consultar nome dos funcionários por sexo em ordem alfabética*/
SELECT nome as 'Funcionários do sexo Masculino'
from tb_funcionario
where sexo = 'Masculino'
order by nome asc;

/* 13. Listar o total de empregados por cidade*/
SELECT cidade as 'Cidades' , COUNT(*) AS 'Total de Funcionários em cada Cidade'
FROM tb_funcionario
GROUP BY cidade
ORDER BY cidade ASC;

/* 14. Calcular o valor total de cada produto em estoque ordenado pela quantidade */
SELECT nome AS 'Produto', valor_produto AS 'Preço', estoque AS 'Quantidade',
(valor_produto * estoque) AS 'Valor Total'
FROM tb_produtos
WHERE estoque >= 0
ORDER BY estoque DESC;

/* 15. Consultar controles com preços entre R$ 100 e R$ 500 */
SELECT nome as 'Controles', valor_produto as 'Valor Unitário', estoque 'Estoque Disponível'
FROM tb_produtos
WHERE valor_produto BETWEEN 100 AND 500
AND (nome LIKE '%Controle%')
ORDER BY valor_produto ASC;

/* 16. Consultar o desconto de 10% e o valor final dos produtos */
SELECT nome AS 'Produto', valor_produto AS 'Preço Original',
CAST(valor_produto * 0.10 AS DECIMAL(8,2)) AS 'Desconto de 10%',
CAST(valor_produto * 0.90 AS DECIMAL(8,2)) AS 'Valor com Desconto'
FROM tb_produtos
WHERE valor_produto >= 500
ORDER BY valor_produto ASC;

/* 17. Consultar funcionários com salários entre R$ 5.000 e R$ 7.000*/
SELECT f.nome AS 'Funcionário', f.cidade AS 'Cidade', c.nome AS 'Cargo', c.salario AS 'Salário'
FROM tb_funcionario f
INNER JOIN tb_cargos c
ON f.cargo = c.id_cargos
WHERE c.salario >= 5000
AND c.salario <= 7000
ORDER BY c.salario DESC;

/* 18. Consultar vendas */
SELECT v.cod_venda AS 'Código da Venda', c.nome AS 'Cliente', p.nome AS 'Produto', cat.categoria AS 'Categoria', f.nome AS 'Vendedor', v.qnt_item AS 'Quantidade', v.qnt_item * v.valor_unitario AS 'Total da Venda'
FROM tb_vendas v
INNER JOIN tb_cliente c
ON v.cliente_cod = c.cod_cliente
INNER JOIN tb_produtos p
ON v.produto_id = p.id_produto
INNER JOIN tb_funcionario f
ON v.funci_id = f.id_funcionario
INNER JOIN( SELECT produto_id, 'Console' AS categoria
FROM tb_console
UNION ALL
SELECT produto_id, 'Jogo'
FROM tb_jogos
UNION ALL
SELECT produto_id, 'Acessório'
FROM tb_acessorios) cat ON p.id_produto = cat.produto_id
ORDER BY `Total da Venda` DESC;

/* 19. Consultar quantidade e valores das despesas por fornecedor */
SELECT f.Nome AS 'Fornecedor', COUNT(*) AS 'Quantidade de Despesas', ROUND(AVG(d.valor_pago), 2) AS 'Média de Pagamentos', MAX(d.valor_pago) AS 'Maior Despesa', MIN(d.valor_pago) AS 'Menor Despesa', SUM(d.valor_pago) AS 'Total Pago'
FROM tb_despesas d
INNER JOIN tb_fornecedor f
ON d.CNPJ_fornecedor = f.CNPJ
GROUP BY f.CNPJ, f.Nome
ORDER BY SUM(d.valor_pago) DESC;

/* 20. Consultar reposições de produtos com fornecedor e funcionário responsável */
SELECT p.Nome AS 'Produto', f.Nome AS 'Fornecedor', fun.nome AS 'Responsável pela compra', r.qnt_item AS 'Quantidade comprada', r.valor_compra AS 'Valor da Compra', r.data_reposicao AS 'Data da Reposição'
FROM tb_reposicao r
INNER JOIN tb_produtos p
ON r.id_produto = p.id_produto
INNER JOIN tb_fornecedor f
ON r.CNPJ_fornecedor = f.CNPJ
INNER JOIN tb_funcionario fun
ON r.id_funcionario = fun.id_funcionario
ORDER BY r.data_reposicao DESC;

/* Queryes Avançadas */
/* 21. Vendas sem estoque */
DELIMITER $$

CREATE TRIGGER trg_verificar_estoque
BEFORE INSERT ON tb_vendas
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    DECLARE mensagem VARCHAR(128);

    SELECT estoque INTO estoque_atual
    FROM tb_produtos
    WHERE id_produto = NEW.produto_id;

    IF NEW.qnt_item > estoque_atual THEN
        SET mensagem = CONCAT(
            'Estoque insuficiente! Disponivel: ',
            estoque_atual,
            ' unidades.'
        );

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = mensagem;
    END IF;
END $$

DELIMITER ;

/* Simulando a venda */
INSERT INTO tb_vendas(cod_venda, cliente_cod, produto_id, funci_id, qnt_item, valor_unitario, garantia, data_venda, forma_pag)
VALUES(900001, 1, 10001013, 2, 1, 649.00, '90 dias', CURDATE(), 'Pix');

/* 22. Consultar produtos com estoque baixo */

DELIMITER $$

CREATE PROCEDURE sp_estoque_baixo(IN limite INT)
BEGIN
SELECT p.nome AS 'Produto', 'Console' AS 'Categoria', p.estoque AS 'Quantidade em Estoque', p.valor_produto AS 'Valor Unitário'
FROM tb_produtos p
INNER JOIN tb_console c
ON p.id_produto = c.produto_id
WHERE p.estoque < limite

UNION ALL
SELECT p.nome, 'Jogo', p.estoque, p.valor_produto
FROM tb_produtos p
INNER JOIN tb_jogos j
ON p.id_produto = j.produto_id
WHERE p.estoque < limite

UNION ALL
SELECT p.nome, 'Acessório', p.estoque, p.valor_produto
FROM tb_produtos p
INNER JOIN tb_acessorios a
ON p.id_produto = a.produto_id
WHERE p.estoque < limite

ORDER BY `Quantidade em Estoque` ASC;
END $$

DELIMITER ;

/* Pesquisando o estoque */
CALL sp_estoque_baixo(5);