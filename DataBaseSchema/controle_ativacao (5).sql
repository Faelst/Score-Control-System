-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Set-2020 às 16:23
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `controle_ativacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro_agendamento`
--

CREATE TABLE `cadastro_agendamento` (
  `id_cadastro_agendamento` int(10) NOT NULL,
  `fk_usuario` int(11) DEFAULT NULL,
  `fk_cidade` int(10) NOT NULL,
  `fk_nome_tecnico` int(10) NOT NULL,
  `fk_procedimento_agendamento` int(10) NOT NULL,
  `numero_ordem` int(30) NOT NULL,
  `data_execucao` date NOT NULL,
  `datafechamento_ordem` date NOT NULL,
  `ponto_extra` float DEFAULT NULL,
  `motivo_ponto_extra` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacao_agendamento` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(10) NOT NULL,
  `nome_cidade` varchar(90) NOT NULL,
  `fk_regiao` int(10) DEFAULT NULL,
  `des_cidade` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome_cidade`, `fk_regiao`, `des_cidade`) VALUES
(1, 'Jacarei', 1, 'Jacarei'),
(2, 'São Jóse dos Campos', 1, 'SJC'),
(3, 'Guararema', 1, 'GUA'),
(4, 'Campos do Jordão', 2, 'CMJ'),
(5, 'Taubate', 3, 'TAU'),
(6, 'Caçapava', 3, 'CAÇ'),
(7, 'Pinda', 4, 'PIN'),
(8, 'Roseira', 4, 'ROSE'),
(9, 'Mogi das Cruzes', 5, 'MOGI'),
(10, 'Potim', 4, NULL),
(11, 'Aparecida', 4, NULL),
(12, 'Tremenbé', 4, 'Trem'),
(13, 'Pedrinhas', 4, 'Sem identificação'),
(14, 'Bom Sucesso', 6, 'Proximo a regiao de '),
(15, 'Santa Isabel', 7, 'STI'),
(16, 'Itatiba', 1, '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipes`
--

CREATE TABLE `equipes` (
  `id_equipe` int(10) NOT NULL,
  `fk_usuario` int(10) NOT NULL,
  `fk_tecnico` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `equipes`
--

INSERT INTO `equipes` (`id_equipe`, `fk_usuario`, `fk_tecnico`) VALUES
(16, 47, 29),
(18, 47, 18),
(19, 47, 20),
(20, 47, 24),
(21, 47, 43),
(22, 47, 17),
(29, 53, 26),
(30, 53, 16),
(31, 53, 34),
(32, 53, 93),
(34, 53, 86),
(35, 52, 28),
(36, 52, 41),
(37, 52, 34),
(38, 51, 27),
(39, 51, 23),
(40, 51, 32),
(41, 51, 45),
(42, 51, 31),
(43, 51, 95),
(50, 10, 12),
(59, 49, 30),
(60, 49, 86),
(61, 49, 41),
(64, 49, 16),
(65, 49, 34),
(66, 47, 97),
(67, 47, 98),
(69, 51, 90),
(72, 47, 100),
(84, 47, 64),
(85, 49, 62),
(86, 52, 87),
(87, 10, 28),
(88, 10, 87),
(90, 57, 102),
(91, 57, 103),
(92, 57, 105),
(100, 52, 26),
(116, 53, 30),
(119, 53, 28),
(121, 49, 26),
(124, 47, 110),
(132, 46, 23),
(133, 46, 32),
(134, 46, 31),
(135, 46, 45),
(136, 46, 27),
(138, 47, 101),
(139, 49, 28),
(140, 49, 113),
(143, 61, 101),
(144, 61, 21),
(145, 61, 93),
(146, 61, 72),
(147, 46, 116),
(148, 48, 35),
(149, 48, 107),
(150, 48, 13),
(154, 48, 40),
(155, 48, 21),
(156, 48, 72),
(157, 48, 102),
(158, 48, 103),
(162, 46, 115),
(163, 62, 118),
(164, 62, 116),
(165, 62, 115),
(166, 48, 105),
(177, 22, 24),
(178, 22, 20),
(179, 22, 64),
(180, 22, 17),
(181, 22, 43),
(182, 22, 100),
(183, 46, 118),
(185, 54, 37),
(186, 54, 38),
(187, 54, 92),
(188, 54, 84),
(189, 54, 111),
(190, 54, 114),
(191, 54, 120),
(192, 54, 91),
(194, 54, 88),
(195, 22, 121),
(196, 49, 122),
(197, 47, 121),
(198, 22, 38),
(199, 22, 37),
(200, 22, 84),
(201, 22, 92),
(202, 22, 88),
(203, 22, 120),
(204, 22, 114),
(205, 22, 91),
(206, 22, 111),
(207, 64, 21),
(208, 64, 72),
(209, 64, 101),
(210, 64, 93),
(212, 47, 123),
(213, 61, 121),
(214, 61, 24),
(215, 61, 20),
(216, 61, 125),
(217, 61, 64),
(218, 61, 123),
(219, 46, 126),
(220, 61, 100),
(221, 61, 17),
(222, 49, 127),
(223, 22, 90),
(224, 49, 128);

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimento`
--

CREATE TABLE `procedimento` (
  `id_procedimento` int(10) NOT NULL,
  `tipo_procedimento` varchar(20) NOT NULL,
  `desc_procedimento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `procedimento`
--

INSERT INTO `procedimento` (`id_procedimento`, `tipo_procedimento`, `desc_procedimento`) VALUES
(1, 'Ativação', NULL),
(2, 'Manutenção', NULL),
(3, 'Migração', NULL),
(4, 'Mud. de Endereço', NULL),
(5, 'Auxilio Tecnico', NULL),
(6, 'Outros', NULL),
(7, 'Troca de ONU', 'Manutenção de onde a troca de '),
(8, 'Retirada', 'Retirada de Equipamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimento_agendamento`
--

CREATE TABLE `procedimento_agendamento` (
  `id_procedimento_agendamento` int(10) NOT NULL,
  `nomeProcedimento` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pontucao` float(3,2) NOT NULL,
  `desc_procedimento_agendamento` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `procedimento_agendamento`
--

INSERT INTO `procedimento_agendamento` (`id_procedimento_agendamento`, `nomeProcedimento`, `pontucao`, `desc_procedimento_agendamento`) VALUES
(1, 'Instalação', 1.00, 'Ativa??o'),
(2, 'Instalação Alta Dificuldade', 1.50, 'Ativa??o'),
(3, 'Manutenção', 0.50, 'Manuten??o'),
(4, 'Retirada', 0.50, 'Outros'),
(5, 'Vistoria', 0.20, 'Outros'),
(6, 'Rompimento', 1.00, 'Outros'),
(7, 'Treinamento/NR', 4.00, 'Outros'),
(8, 'Nao Executado', 0.00, 'Outros'),
(9, 'Duplado', 0.00, 'Ordem de serviço executado por dois funcionarios'),
(10, 'Acordo', 1.00, 'Outros'),
(11, 'Evento (CAMPOS DO JORDAO)', 0.25, 'Solicitação realizada no periodo de instabilidade '),
(12, 'Ausência', 0.25, 'Visita Tecnicca ausente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `regiao`
--

CREATE TABLE `regiao` (
  `id_regiao` int(10) NOT NULL,
  `nome_regiao` varchar(20) NOT NULL,
  `desc_regiao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `regiao`
--

INSERT INTO `regiao` (`id_regiao`, `nome_regiao`, `desc_regiao`) VALUES
(1, 'Jac/SJC/Gua', 'Jacarei / São José d'),
(2, 'Campos', NULL),
(3, 'Taubate/Caçapava', NULL),
(4, 'Pinda/Roseira', NULL),
(5, 'Mogi das Cruzes', NULL),
(6, 'Outros', NULL),
(7, 'Santa Isabel', 'STI');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tabela_pontos`
-- (See below for the actual view)
--
CREATE TABLE `tabela_pontos` (
`id_tecnico` int(10)
,`nome_tecnico` varchar(80)
,`Pontos_normais` double(19,2)
,`Pontos_adicionados` varchar(63)
,`pontos_totais` varchar(63)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tecnico`
--

CREATE TABLE `tecnico` (
  `id_tecnico` int(10) NOT NULL,
  `nome_tecnico` varchar(80) NOT NULL,
  `fk_cidade` int(10) DEFAULT NULL,
  `des_tecnico` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tecnico`
--

INSERT INTO `tecnico` (`id_tecnico`, `nome_tecnico`, `fk_cidade`, `des_tecnico`) VALUES
(12, 'Luiz Antonio', 1, 'Tecnico In'),
(13, 'Guilherme Torres Pazetto', 1, 'Tecnico In'),
(14, 'Anderson dos Santos', 1, 'Instalação'),
(15, 'Anderson Oliveira dos Santos', 1, 'Instalação'),
(16, 'Bruno Weber dos Santos', 7, 'Manutenção'),
(17, 'Carlos Gonçalves da Silva', 4, 'Instalação'),
(18, 'Cleber Raimundo de Lima', 4, 'Instalação'),
(19, 'Cleiton Nogueira Serpa', 4, 'Instalação'),
(20, 'Clodoaldo Aparecido da Silva', 4, 'Instalação'),
(21, 'Elberth Silva Nunes', 1, 'Instalação'),
(23, 'Gustavo Morales de Freitas', 5, 'Instalação'),
(24, 'Italo Augusto da Rocha Silveira', 4, 'Instalação'),
(25, 'Jadiel Candido Leal', 5, 'Instalação'),
(26, 'Joao Vitor do Amaral Pereira', 7, 'Instalação'),
(27, 'Jonatan Emboava', 5, 'Instalação'),
(28, 'Julio Cesar dos Santos', 7, 'Instalação'),
(29, 'Lenon Martins da Silva', 4, 'Instalação'),
(30, 'Lucas Feliciano Batista', 7, 'Instalação'),
(31, 'Lucas Wada', 5, 'Instalação'),
(32, 'Luciano da Silva', 5, 'Instalação'),
(33, 'Mario Xavier Fragoso', 7, 'Instalação'),
(34, 'Rodrigo Jose Monteiro', 7, 'Instalação'),
(35, 'Washinton Wesley da Silva', 1, 'Instalação'),
(36, 'Wesley Henrique Barreto', 1, 'Instalação'),
(37, 'Jose Pereira', 1, 'Instalação'),
(38, 'Jose Augusto', 1, 'Instalação'),
(39, 'Adilson Dias', 1, 'Instalação'),
(40, 'Wesley Cardoso', 1, 'Instalação'),
(41, 'Wesley Castelani', 7, 'Tecnico Ex'),
(43, 'Fabio Freire', 4, 'Intalação'),
(44, 'Felipe Matelleto', 7, 'Instalação'),
(45, 'Emerson Pereira', 5, 'Instalação'),
(53, 'Joao Felipe', 1, 'asd'),
(54, 'Gustavo Casari', 5, 'Instalação'),
(57, 'Anderson Luiz do Santos', 7, 'TÃ©cnico d'),
(58, 'Ricardo Lançamento', 7, 'Tecnico de'),
(61, 'Anderson José', 1, 'tecnico Te'),
(62, 'Gustavo Cardoso Fernandes', 1, 'tecnico Te'),
(63, 'Jailton Pinheiro de Oliveira', 1, 'Tecnico de'),
(64, 'Denis Cesar', 4, 'tÃ©cnico c'),
(66, 'Lucas  Rogerio', 7, 'Lucas Fisc'),
(67, 'Alcides Lançamento', 7, 'Something'),
(68, 'juan juan', 4, 'juan'),
(69, 'Maikon Maikon', 1, 'lanÃ§ament'),
(70, 'Wilson Caixa', 4, 'Caixa Wils'),
(71, 'Claudemir Francisco', 1, 'Clau de mi'),
(72, 'Wagner Pascoal', 1, 'jacarei'),
(73, 'Hugo Barreto', 1, 'tecnico'),
(74, 'Emerson belezura', 1, 'lanÃ§ament'),
(75, 'Anderson Goiaba', 7, 'Ajudando e'),
(76, 'Leandro Juarez', 1, 'terceiro'),
(77, 'Jorge leite', 1, 'assistente'),
(78, 'Claudio Roberto', 1, 'larissa'),
(84, 'Elvis Ribeiro', 1, 'Terceiro'),
(85, 'Julio Lançamento', 7, 'pinda'),
(86, 'Igor  Cassio', 7, 'OBS'),
(87, 'Almir Pinda', 7, 'pinda'),
(88, 'Wesley Carlos Rodrigo de Abreu', 1, 'TÃ©cnico T'),
(90, 'Celio Claudio', 5, 'TaubayÃ³'),
(91, 'Diogenes Mariano de Paula', 1, 'Tecnico Te'),
(92, 'Eliseu de Moura Junior', 1, 'Tecnico Te'),
(93, 'Julio Cesar Souza', 1, 'Tecnico Te'),
(95, 'Luiz Gustavo', 5, 'TÃ©cnico I'),
(97, 'Mauricios Elias Faria', 4, 'Terceiro'),
(98, 'Anderson Pasinkevicius', 4, 'Terceiro'),
(99, 'Leandro Tatu', 4, 'Tecnico I'),
(100, 'Leandro Antonio de Lima', 4, 'CLT'),
(101, ' Rogerio Simoes De Lima Junior', 4, 'CLT'),
(102, 'Gilson Eric', 15, 'TÃ©cnico I'),
(103, 'Mike ', 15, 'TÃ©cnico I'),
(104, 'Natanael Santos', 1, 'Tecnico Te'),
(105, 'Ademir Junior', 1, 'Tecnico In'),
(107, 'David Alves de Lima Junior', 1, 'TÃ©cnico C'),
(108, 'Carlos Alberto Rodrigues JÃºnior', 1, ''),
(109, 'Lucas Rafael Ribeiro da Silva', 10, 'terceiro'),
(110, 'Pedro Henrique', 4, 'Terceiriza'),
(111, 'Neudir da Silva Dutra', 1, 'TÃ©cnico T'),
(113, 'Alisson Rodrigo', 1, 'TÃ©cnico T'),
(114, 'Lucas Geovane de Paiva', 6, ''),
(115, 'Eduardo Tome', 16, 'TÃ©cnico I'),
(116, 'Gabriel Leandro da Silva', 16, 'TÃ©cnico T'),
(117, 'Willian Araujo', 1, 'Técnico Te'),
(118, 'Pablo Alves da Silva', 16, ''),
(119, 'Jean Carlos de Oliveira Souza', 16, ''),
(120, 'Luciano de Oliveira Ferreira', 1, 'Tecnico Te'),
(121, 'Paulo Lima', 4, 'tÃ©cnico d'),
(122, 'Alberoni Amaurilio', 7, ''),
(123, 'Douglas Santos', 4, 'TÃ©cnico T'),
(124, 'Douglas de Almeida GraÃ§a Rodrigues', 4, ''),
(125, 'Wanderson James Oliveira MagalhÃ£es', 4, 'Tecnico Te'),
(126, 'Bruno Schimidt de Castro Luiz da Mota', 5, 'Ajudante d'),
(127, 'Aux Joni Roque', 7, 'auxiliar'),
(128, 'Wilker Paulo da Silva', 3, 'Tecnico CL'),
(129, 'Patrique Hernandes Pereira', 3, 'Tecnico CL'),
(130, 'DAVID TORQUATO DA SILVA', 3, 'Tecnico CL');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tecnico_vitoria`
-- (See below for the actual view)
--
CREATE TABLE `tecnico_vitoria` (
`id_tecnico` int(10)
,`nome_tecnico` varchar(80)
,`fk_cidade` int(10)
,`des_tecnico` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_profile`
--

CREATE TABLE `user_profile` (
  `id_usuario_perfil` int(11) NOT NULL,
  `fk_usuario` int(10) DEFAULT NULL,
  `foto_usuario` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user_profile`
--

INSERT INTO `user_profile` (`id_usuario_perfil`, `fk_usuario`, `foto_usuario`) VALUES
(1, 10, 'GIF_paginaconstrucao (1).gif'),
(2, 53, 'GIF_paginaconstrucao (1).gif'),
(3, 64, 'IMG_20170712_135731646.jpg'),
(4, 58, 'logo.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nome_usuario` varchar(30) NOT NULL,
  `nick_usuario` varchar(20) NOT NULL,
  `senha_usuario` varchar(20) NOT NULL,
  `admin_user` tinyint(1) NOT NULL,
  `modulo_agendamento` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome_usuario`, `nick_usuario`, `senha_usuario`, `admin_user`, `modulo_agendamento`) VALUES
(10, 'Rafael Silverio', 'fael_st', 'qwe', 1, 1),
(12, 'Gabriel Zabini', 'gz19sv', 'teste123', 0, NULL),
(13, 'Matheus Marinho', 'matheus.marinho', 'Matheus34084660-', 1, NULL),
(14, 'Alex Santos', 'alex.santos', 'trex', 0, NULL),
(15, 'Gabriel Henrique', 'gz19fs', 'barreta.50', 0, NULL),
(16, 'Priscila Rezende', 'priscila.rezende', '080614', 0, NULL),
(17, 'Jackeline Dias', 'jz80fd', 'vivas#2009', 0, NULL),
(18, 'Douglas de Almeida', 'dz85gr', 'vivas#2018sp', 1, NULL),
(19, 'Vitor Thomaz', 'vz12jc', '4372649', 1, NULL),
(20, 'Joao Rodrigues', 'joao.rodrigues', '123junior', 1, NULL),
(21, 'Anderson Alexandre', 'anderson.alexandre', 'vivas#2019', 1, NULL),
(22, 'Vitoria Elen', 'vitoria.elen', 'anjovivi', 1, 1),
(23, 'Leticia Fernandes', 'leticia.fernandes', 'vivas2009', 1, 1),
(46, 'Larissa Andreassa', 'larissa.andreassa', 'vivas2009', 1, 1),
(47, 'Celita Muniz', 'celita.muniz', 'vivas2009', 1, 1),
(48, 'Ludmilla Stella Leite da Silva', 'ludmilla.silva', 'vivas2009', 0, 1),
(49, 'Mayara Ferreira', 'mayara.ferreira', 'vivas2009', 1, 1),
(50, 'Thaiane Silva', 'thaiane.silva', 'vivas2009', 0, 1),
(51, 'Valeria Szegh', 'valeria.szegh', 'temporal', 0, 1),
(52, 'Aline Diegues', 'aline.diegues', 'vivas2009', 0, 1),
(53, 'Silvana Melo', 'silvana.melo', 'vivas2009', 0, 1),
(54, 'Michelle Moraes', 'moraes.michelle', 'mudar123', 0, 1),
(56, 'Suporte Vivas', 'suporte', 'vivas#2009', 0, 0),
(57, 'Dulcineia Nunes do Nascimento', 'nunes.dulci', 'mudar123', 0, 1),
(58, 'Lucelio de Souza', 'lucelio.souza', 'meninao2020', 1, 1),
(59, 'Roger Souto', 'souto.roger', 'vivas2009', 1, 1),
(60, 'Larissa Andreassa', 'andreassa.larissa', 'vivas2009', 0, 1),
(61, 'Zelia Fonseca', 'fonseca.zelia', 'vivas2009', 1, 1),
(62, 'Juliana Silva', 'silva.juliana', 'vivas2009', 0, 1),
(63, 'Ricardo Vitalino', 'zrv19id', 'vivas2009', 0, 0),
(64, 'Andre Leal', 'andre.leal', 'torelli1', 0, 1);

-- --------------------------------------------------------

--
-- Structure for view `tabela_pontos`
--
DROP TABLE IF EXISTS `tabela_pontos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tabela_pontos`  AS  select `tec`.`id_tecnico` AS `id_tecnico`,`tec`.`nome_tecnico` AS `nome_tecnico`,sum(`proc`.`pontucao`) AS `Pontos_normais`,format(sum(`cad`.`ponto_extra`),2) AS `Pontos_adicionados`,format(sum((coalesce(`cad`.`ponto_extra`,0) + coalesce(`proc`.`pontucao`,0))),2) AS `pontos_totais` from ((`cadastro_agendamento` `cad` join `tecnico` `tec`) join `procedimento_agendamento` `proc`) where ((`tec`.`id_tecnico` = `cad`.`fk_nome_tecnico`) and (`cad`.`fk_procedimento_agendamento` = `proc`.`id_procedimento_agendamento`)) group by `tec`.`nome_tecnico` ;

-- --------------------------------------------------------

--
-- Structure for view `tecnico_vitoria`
--
DROP TABLE IF EXISTS `tecnico_vitoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tecnico_vitoria`  AS  select `tecnico`.`id_tecnico` AS `id_tecnico`,`tecnico`.`nome_tecnico` AS `nome_tecnico`,`tecnico`.`fk_cidade` AS `fk_cidade`,`tecnico`.`des_tecnico` AS `des_tecnico` from `tecnico` where ((`tecnico`.`id_tecnico` = 16) or (`tecnico`.`id_tecnico` = 30) or (`tecnico`.`id_tecnico` = 34) or (`tecnico`.`id_tecnico` = 44)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cadastro_agendamento`
--
ALTER TABLE `cadastro_agendamento`
  ADD PRIMARY KEY (`id_cadastro_agendamento`),
  ADD KEY `fk_cidade` (`fk_cidade`),
  ADD KEY `fk_nome_tecnico` (`fk_nome_tecnico`),
  ADD KEY `fk_procedimento_agendamento` (`fk_procedimento_agendamento`),
  ADD KEY `fk_usuario` (`fk_usuario`) USING BTREE;

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`),
  ADD UNIQUE KEY `nome_cidade` (`nome_cidade`),
  ADD KEY `fk_regiao` (`fk_regiao`);

--
-- Indexes for table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id_equipe`),
  ADD KEY `fk_usuario` (`fk_usuario`),
  ADD KEY `fk_tecnico` (`fk_tecnico`);

--
-- Indexes for table `procedimento`
--
ALTER TABLE `procedimento`
  ADD PRIMARY KEY (`id_procedimento`),
  ADD UNIQUE KEY `tipo_procedimento` (`tipo_procedimento`);

--
-- Indexes for table `procedimento_agendamento`
--
ALTER TABLE `procedimento_agendamento`
  ADD PRIMARY KEY (`id_procedimento_agendamento`);

--
-- Indexes for table `regiao`
--
ALTER TABLE `regiao`
  ADD PRIMARY KEY (`id_regiao`);

--
-- Indexes for table `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD UNIQUE KEY `nome_tecnico` (`nome_tecnico`),
  ADD KEY `fk_cidade` (`fk_cidade`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id_usuario_perfil`),
  ADD KEY `fk_usuario` (`fk_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nick_usuario` (`nick_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cadastro_agendamento`
--
ALTER TABLE `cadastro_agendamento`
  MODIFY `id_cadastro_agendamento` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id_cidade` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id_equipe` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `procedimento`
--
ALTER TABLE `procedimento`
  MODIFY `id_procedimento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `procedimento_agendamento`
--
ALTER TABLE `procedimento_agendamento`
  MODIFY `id_procedimento_agendamento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `regiao`
--
ALTER TABLE `regiao`
  MODIFY `id_regiao` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id_tecnico` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id_usuario_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cadastro_agendamento`
--
ALTER TABLE `cadastro_agendamento`
  ADD CONSTRAINT `cadastro_agendamento_ibfk_1` FOREIGN KEY (`fk_cidade`) REFERENCES `cidade` (`id_cidade`),
  ADD CONSTRAINT `cadastro_agendamento_ibfk_2` FOREIGN KEY (`fk_nome_tecnico`) REFERENCES `tecnico` (`id_tecnico`),
  ADD CONSTRAINT `cadastro_agendamento_ibfk_3` FOREIGN KEY (`fk_procedimento_agendamento`) REFERENCES `procedimento_agendamento` (`id_procedimento_agendamento`),
  ADD CONSTRAINT `cadastro_agendamento_ibfk_4` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`fk_regiao`) REFERENCES `regiao` (`id_regiao`);

--
-- Limitadores para a tabela `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `fk_tecnico` FOREIGN KEY (`fk_tecnico`) REFERENCES `tecnico` (`id_tecnico`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`fk_cidade`) REFERENCES `cidade` (`id_cidade`);

--
-- Limitadores para a tabela `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
