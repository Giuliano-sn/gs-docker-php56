# ************************************************************
# Sequel Ace SQL dump
# Versão 20051
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Servidor: 127.0.0.1 (MySQL 8.0.27)
# Banco de Dados: wms_giusoft
# Tempo de geração: 2023-09-25 19:48:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump de tabela areas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1',
  `descricao` varchar(30) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `codigo_faturamento` varchar(10) DEFAULT '',
  `codigo_producao` varchar(10) DEFAULT NULL,
  `id_regioes` bigint NOT NULL DEFAULT '1',
  `prioridade` int DEFAULT '0',
  `armazenagem` tinyint(1) DEFAULT '0',
  `expedicao` tinyint(1) DEFAULT '0',
  `recebimento` tinyint(1) DEFAULT '0',
  `divergencia` tinyint(1) DEFAULT '0',
  `avaria` tinyint(1) DEFAULT '0',
  `espera` tinyint(1) DEFAULT '0',
  `posicionavel` tinyint(1) DEFAULT '1',
  `de_cima_pra_baixo` tinyint(1) DEFAULT '0',
  `lote_unico` tinyint(1) DEFAULT '0',
  `reservavel` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ATIVO` (`ativo`),
  KEY `REGIAO` (`id_regioes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela areas_algoritimos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `areas_algoritimos`;

CREATE TABLE `areas_algoritimos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint NOT NULL DEFAULT '0',
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela areas_restricoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `areas_restricoes`;

CREATE TABLE `areas_restricoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_areas` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_permitido` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_proibido` bigint unsigned NOT NULL DEFAULT '0',
  `id_grupos_permitido` bigint unsigned NOT NULL DEFAULT '0',
  `id_grupos_proibido` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela armazens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `armazens`;

CREATE TABLE `armazens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo_barras` char(3) DEFAULT '0',
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `razao_social` varchar(50) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT '',
  `insc_estadual` varchar(20) DEFAULT '',
  `insc_municipal` varchar(20) DEFAULT NULL,
  `cnae` varchar(20) DEFAULT NULL,
  `iss` double DEFAULT NULL,
  `prefixo` char(6) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `id_enderecos_estados` bigint unsigned DEFAULT '0',
  `id_enderecos_cidades` bigint unsigned DEFAULT '0',
  `cep` char(8) DEFAULT NULL,
  `estabelecimento` char(3) DEFAULT NULL,
  `estabelecimento_fiscal` char(3) DEFAULT NULL,
  `codigo_deposito` char(3) DEFAULT NULL,
  `codigo_localizacao_material` varchar(11) DEFAULT NULL,
  `conta_contabil` varchar(17) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `serie` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `armazens` WRITE;
/*!40000 ALTER TABLE `armazens` DISABLE KEYS */;

INSERT INTO `armazens` (`id`, `codigo_barras`, `descricao`, `razao_social`, `cnpj`, `insc_estadual`, `insc_municipal`, `cnae`, `iss`, `prefixo`, `telefone`, `endereco`, `numero`, `complemento`, `bairro`, `id_enderecos_estados`, `id_enderecos_cidades`, `cep`, `estabelecimento`, `estabelecimento_fiscal`, `codigo_deposito`, `codigo_localizacao_material`, `conta_contabil`, `ip`, `serie`)
VALUES
	(1,'1','Armazem 1',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `armazens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela cfops
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cfops`;

CREATE TABLE `cfops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` char(4) DEFAULT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `descricao_resumida` varchar(40) DEFAULT NULL,
  `informacao_complementar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `cfops` WRITE;
/*!40000 ALTER TABLE `cfops` DISABLE KEYS */;

INSERT INTO `cfops` (`id`, `codigo`, `descricao`, `descricao_resumida`, `informacao_complementar`)
VALUES
	(1,'1905','Entrada de mercadoria',NULL,NULL),
	(2,'2905','Entrada de outro Estado',NULL,NULL),
	(8,'5554','Remessa de bem do ativo imobilizado para uso fora do estabelecimento','Remessa Locação',''),
	(9,'5906','Retorno de mercadoria depositada em depósito fechado ou armazém geral','Ret. de mercadoria depositada em Dep. fe',''),
	(11,'5909','Retorno de bem por conta de contrato de comodato','Retor bem por conta contrato de comodato','NAO INCIDENCIA DE ICMS CONF. ART. VI INCISO XIV DEC.6284/97'),
	(12,'5915','Remessa de mercadoria ou bem para conserto ou reparo','Rem. Merc. Conserto',''),
	(13,'5920','Remessa de vasilhame ou sacaria','',NULL),
	(14,'5921','Devolucao de vasilhame ou sacaria','Dev. vasilhame ou sacaria',''),
	(17,'5927','Lançamento efetuado a titulo de baixa de estoque decorrente de perda, roubo ou',NULL,NULL),
	(22,'6554','Remessa de bem do ativo imobilizado para uso fora do estabelecimento',NULL,NULL),
	(23,'6906','Retorno de mercadoria depósitada em depósito fechado ou armazém geral','Retorno de mercadoria deposita.','Retorno de mercadoria depositada em depósito fechado ou armazém geral.'),
	(24,'5905','Remessa p/ deposito fechado ou armazéns gerais',NULL,NULL),
	(26,'5949','Outras saídas - remessa por conta e ordem de terceiro','remessa por conta e ordem de terceiros',''),
	(28,'6907','Retorno simbólico de mercadoria depositada em dep. fechado ou armazem geral','RETORNO SIMBOLICO DE MERCADORIA',''),
	(29,'6915','Remessa de mercadoria ou bem para conserto ou reparo','Remessa p/ Conserto',''),
	(30,'6908','Remessa de bem por conta de contrato de comodato',NULL,NULL),
	(31,'5907','Retorno Simbólico de mercadoria depositada em deposito fechado ou armazem geral','RETORNO SIMBOLICO DE MERCADORIA',''),
	(32,'5918','Devolucao de mercadoria recebida em consignacao mercantil ou industrial','',''),
	(34,'5553','Devolucao de compra de bem para o ativo imobilizado','Devolução de compra',''),
	(35,'5210','Devolucao de compra para utilizacao na prestacao de serviço','DEV. compras utiliz. prest. serv.',''),
	(36,'6949','Outra saida de merc. ou prest. de serv. nao especificado','Outra saida de mercadoria',''),
	(37,'5413','Devolucao de Mercadoria Destinada ao Uso ou Consumo','Devolucao Merca. Dest. a Uso',''),
	(38,'5552','Transferencia de bens do ativo imobilizado','Transferencia de bens',''),
	(39,'5557','Transferência de material de uso ou consumo','Transf. Mat. ou Consumo',''),
	(40,'6905','Remessa para depósito fechado ou armazém geral','Rem. p/dep. fechado ou arm. geral',''),
	(41,'5556','Devolução de compra de material de uso ou consumo','DEV. COMPRA MAT. CONSUMO','DEV. COMPRA MAT. CONSUMO'),
	(42,'5551','Venda de bem do ativo imobilizado','Venda de bem do ativo imobilizado',''),
	(43,'3551','Compra de bem para o ativo imobilizado','Compra de bem para o ativo imobilizado',''),
	(44,'6551','Venda de bem do ativo imobilizado','Venda bens imobilizado',''),
	(45,'6556','Devolução de compra de material de uso ou consumo','Dev. de compra de mat. de uso ou consumo',''),
	(46,'5412','Dev. de bem do ativo imobilizado, em op. com merc. sujeita ao reg. subs. trib.','devol. bem ativo em operacao',''),
	(47,'5555','Dev. de bem do ativo imobilizado de terceiro, para uso no estabelecimento','Dev. bem do ativo imobil. de terceiro',''),
	(48,'6413','Devolucao de Mercadoria Destinada ao Uso ou Consumo','Dev. de Merc. Dest. ao Uso ou Cons.',''),
	(49,'6553','Devolução de Compra de Bem para o Ativo Imbobilizado','Dev. de Compra de Bem p/ o A. Imobilizad',''),
	(50,'6552','Transferencia de bens do ativo imobilizado','Transferencia','bens do ativo imobilizado'),
	(51,'5908','Remessa de bem por conta de contrato de comodato','Remessa bem por conta contrato comodato','NAO INCIDENCIA DE ICMS CONF. ART VI INCISO XIV DEC 6284/97'),
	(52,'5910','Remessa em bonificacao, doacao ou brinde','Remessa em bonificacao, doacao ou brinde',''),
	(53,'5923','Remessa por Conta e Ordem de Terceiro','Remessa por Cont. e Ordem de Terceiro','5923 - Operações Dentro do Estado'),
	(54,'6923','Remessa por Conta e Ordem de Terceiro','Remessa por Cont. e Ordem de Terceiro','6923-Operções Interestaduais'),
	(55,'5913','Retorno de mercadoria ou bem recebido para demonstração','Retorno de mercadoria','classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para demonstração.'),
	(56,'3949','Outras entradas nao especif. rem. parc','OUTRAS ENTRADAS NAO ESPECIF. REM. PARC',''),
	(57,'6909','Retorno de bem recebido por conta de contrato de comodato','RETORNO DE BEM POR CONTA DE CONTRATO',''),
	(59,'5156','Trans de merc adquirida ou recebida de terceiros, que não deva por ele transita','Trans. de merc. adq. ou rec de terceiros',''),
	(60,'5551','Venda de bem do ativo imobilizado','VENDA DE BEM DO ATIVO IMOBILIZADO',''),
	(61,'6912','Remessa de mercadoria ou bem recebido para demonstração','Remessa de merc ou bem para demonstração','Remessa de mercadoria ou bem recebido para demonstração'),
	(62,'6913','Retorno de mercadoria ou bem recebido para demonstração','Retorno de merc ou bem para demonstração','Retorno de mercadoria ou bem recebido para demonstração'),
	(63,'6555','Dev de bem ativo imobilizado de terceiro recebido para uso no estabelecimento','',''),
	(64,'5901','Rem p industrializ por encomenda','Rem p industrializ por encomenda',''),
	(65,'1554','Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento','Retorno de bem do ativo imobilizado','Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento'),
	(66,'1949','Outras Entradas não Especificada','',''),
	(67,'1906','Retorno de mercadoria remetida para depósito fechado ou armazém geral','Ret. de mercadoria remetida em Dep.','Retorno de mercadoria remetida para depósito fechado ou armazém geral classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em depósito fechado ou armazém ger'),
	(68,'5949','Simples remessa','SIMPLES REMESSA','SIMPLES REMESSA'),
	(69,'5949','Venda de sucatas','VENDA DE SUCATAS',''),
	(70,'5920','Estorno de NF-e nao cancelada no prazo legal','Est.  NF-e não cancelada no prazo legal','Estorno de NF-e nao cancelada no prazo legal'),
	(72,'1905','Estorno de NF-e nao cancelada no prazo legal','',''),
	(73,'5949','Outras saidas - remessa para armazenagem s/icms','OUTRAS SAIDAS - REMESSA PARA ARMAZENAGEM','OUTRAS SAIDAS - REMESSA PARA ARMAZENAGEM S/ICMS'),
	(74,'5949','Outra saida','OUTRA SAIDA',''),
	(75,'5504','Remessa de mercadoria  para formação de lote de exportação.','Rem. de merc. p/ formação de lote de e',''),
	(76,'6151','6151','6151',NULL),
	(77,'5405','5405','5405',NULL),
	(78,'5102','5102','5102',NULL),
	(79,'5151','5151','5151',NULL),
	(80,'6101','6101','6101',NULL),
	(81,'5655','5655','5655',NULL),
	(82,'6409','6409','6409',NULL),
	(83,'6401','6401','6401',NULL),
	(84,'6911','6911','6911',NULL),
	(85,'6403','6403','6403',NULL),
	(86,'5656','5656','5656',NULL),
	(87,'6102','6102','6102',NULL),
	(88,'6658','6658','6658',NULL),
	(89,'6659','6659','6659',NULL),
	(90,'6152','6152','6152',NULL),
	(91,'5663','5663','5663',NULL),
	(92,'6656','6656','6656',NULL),
	(93,'5664','Retorno de combustível ou lubrificante recebido para armazenagem','Retorno de combustível ou lubrificante ',''),
	(94,'6655','6655','6655',NULL),
	(95,'5665','Retorno Simbólico de Lubrificantes e Combustíveis','Retorno Simbólico de Lubrificantes e Co',''),
	(96,'6654','6654','6654',NULL),
	(97,'7667','7667','7667',NULL),
	(98,'6910','6910','6910',NULL),
	(99,'5667','5667','5667',NULL),
	(100,'6920','6920','6920',NULL),
	(101,'1411','1411','1411',NULL),
	(102,'2661','2661','2661',NULL),
	(103,'6917','6917','6917',NULL),
	(104,'6107','6107','6107',NULL),
	(105,'7101','7101','7101',NULL),
	(106,'1234','teste','teste',''),
	(107,'1524','saida teste','saida teste',''),
	(108,'7890','VACINAS','',''),
	(109,'123','ENTRADA DE MERCADORIA','',''),
	(110,'6105','6105','6105',NULL),
	(111,'6106','6106','6106',NULL),
	(112,'5202','5202','5202',NULL),
	(122,'5125','Cobrança de serviço 5.125','NF cobrança conforme o Art. 286 Inc. XX','NF cobrança conforme o Art. 286 Inc. XX'),
	(123,'5925','Retorno de mercadoria recebida para industrialização p conta e ord.','Retorno para industrialização por cont','Retorno de mercadoria recebida para industrialização por conta e ordem de terceiros. Art. 280 Inc. I RICMS-BA/12.');

/*!40000 ALTER TABLE `cfops` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela cidades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cidades`;

CREATE TABLE `cidades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_estados` int NOT NULL DEFAULT '0',
  `sigla` varchar(10) DEFAULT '',
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `distancia_da_sede` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cidades';

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;

INSERT INTO `cidades` (`id`, `id_estados`, `sigla`, `descricao`, `distancia_da_sede`)
VALUES
	(1,1,'SSA','Salvador',0),
	(2,1,'IBO','Ibotirama',600),
	(3,1,'DIA','Dias Dávila',80),
	(4,1,'LAU','Lauro de Freitas',30),
	(5,1,'CAM','Camaçari',60),
	(6,2,'RJO','Rio de Janeiro',2500),
	(7,1,'SFS','Simões Filho',40),
	(8,31,'SPO','São Paulo',2700),
	(10,23,'REC','Recife',2000),
	(11,1,'','Alagoinhas',0),
	(12,1,'','Amargosa',0),
	(13,1,'','Barreiras',0),
	(14,1,'','Bom Jesus da Lapa',0),
	(15,1,'','Brumado',0),
	(17,1,'','Candeias',0),
	(18,1,'','Capim Grosso',0),
	(19,1,'','Catu',0),
	(20,1,'','Conceição do Coité',0),
	(21,1,'','Conceição do Jacuípe',0),
	(22,1,'','Cruz das Almas',0),
	(24,1,'','Euclides da Cunha',0),
	(25,1,'','Eunapolis',0),
	(26,1,'','Feira de Santana',0),
	(27,1,'','Guanambi',0),
	(28,1,'','Gandu',0),
	(29,1,'','Ibicaraí',0),
	(30,1,'IB','Ibicuí',0),
	(31,1,'','Ilheus',0),
	(32,1,'','Ipiau',0),
	(33,1,'','Ipirá',0),
	(34,1,'','Irece',0),
	(35,1,'','Itaberaba',0),
	(36,1,'','Itabuna',0),
	(37,1,'','Itamaraju',0),
	(38,1,'','Itapetinga',0),
	(39,1,'','Jacobina',0),
	(40,1,'','Jequie',0),
	(41,1,'','Juazeiro',0),
	(42,1,'','Luis Eduardo Magalhães',0),
	(44,1,'','Macaubas',0),
	(45,1,'','Posto da Mata',0),
	(46,1,'','Paulo Afonso',0),
	(47,1,'','Pojuca',0),
	(48,1,'','Porto seguro',0),
	(49,1,'','Riachão do Jacuípe',0),
	(50,1,'','Ribeira do Pombal',0),
	(51,1,'','Santa Maria da Vitória',0),
	(52,1,'','Santo Amaro',0),
	(53,1,'','Santo Estevão',0),
	(54,1,'','Santo Antônio de Jesus',0),
	(55,1,'','São Felix do Coribe',0),
	(56,1,'','Seabra',0),
	(57,1,'','Senhor do Bomfim',0),
	(58,1,'','Serrinha',0),
	(60,1,'','Teixeira de Freitas',0),
	(61,1,'','Valença',0),
	(62,1,'','Vitória da Conquista',0),
	(63,1,'','Esplanada',0),
	(64,1,'','Valente',0),
	(65,1,'','Itabela',0),
	(66,1,'','Madre de Deus',0),
	(67,1,'','Poções',0),
	(68,1,'','Coaraci',0),
	(69,1,'','Nazaré',0),
	(70,1,'','Mucuri',0),
	(71,1,'','Rio real',0),
	(72,1,'','Cachoeira',0),
	(73,1,'','Camacã',0),
	(74,1,'','Campo Formoso',0),
	(75,1,'','Entre Rios',0),
	(77,1,'','Inhambupe',0),
	(78,2,'QUE','Queimados',0),
	(79,2,'NIG','Nova Iguaçu',0),
	(80,2,'','Cabuçu',0),
	(81,2,'','Nilópolis',0),
	(82,2,'','Belford Roxo',0),
	(83,2,'','Miguel Couto',0),
	(84,2,'','Sepetiba',0),
	(85,2,'','Mesquita',0),
	(86,2,'','Paracambi',0),
	(87,2,'','Petrópolis',0),
	(88,2,'','Teresópolis',0),
	(89,2,'','Guapimirim',0),
	(90,2,'','Magé',0),
	(91,2,'','Friburgo',0),
	(92,2,'','Cabo Frio',0),
	(93,2,'','Barra Mansa',0),
	(94,2,'','Miguel Pereira',0),
	(95,2,'','Angra dos Reis',0),
	(97,2,'','Rio das Ostras',0),
	(98,2,'','Penedo',0),
	(99,2,'','Campos dos Goytacazes',0),
	(100,2,'','Duque de Caxias',0),
	(101,2,'','São Gonçalo',0),
	(102,2,'','Niterói',0),
	(103,2,'','São João de Meriti',0),
	(104,2,'','Volta Redonda',0),
	(105,2,'','Macaé',0),
	(106,2,'','Itaboraí',0),
	(107,2,'','Nova Friburgo',0),
	(108,2,'','Maricá',0),
	(109,2,'','Resende',0),
	(110,2,'','Araruama',0),
	(111,2,'','Itaguaí',0),
	(112,2,'','Japeri',0),
	(113,2,'','Itaperuna',0),
	(114,2,'','São Pedro da Aldeia',0),
	(115,2,'','Barra do Piraí',0),
	(116,2,'','Seropédica',0),
	(117,2,'','Saquarema',0),
	(118,2,'','Três Rios',0),
	(119,2,'','Valença',0),
	(120,2,'','Rio Bonito',0),
	(121,2,'','Cachoeiras de Macacu',0),
	(123,2,'','Paraíba do Sul',0),
	(124,2,'','São Francisco de Itabapoana',0),
	(125,2,'','Santo Antônio de Pádua',0),
	(126,2,'','Mangaratiba',0),
	(127,2,'','Paraty',0),
	(128,2,'','Casimiro de Abreu',0),
	(129,2,'','São Fidélis',0),
	(130,2,'','Vassouras',0),
	(131,2,'','Iguaba Grande',0),
	(132,2,'','Paty do Alferes',0),
	(133,12,'FOR','Fortaleza',1100),
	(134,12,'JUN','Juazeiro do Norte',600),
	(135,12,'','Abaiara',0),
	(136,12,'','Acarape',0),
	(137,12,'','Acaraú',0),
	(138,12,'','Acopiara',0),
	(139,12,'','Aiuaba',0),
	(140,12,'','Alcântaras',0),
	(141,12,'','Altaneira',0),
	(142,12,'','Alto Santo',0),
	(143,12,'','Amontada',0),
	(144,12,'','Antonina do Norte',0),
	(145,12,'','Apuiarés',0),
	(146,12,'','Aquiraz',0),
	(147,12,'','Aracati',0),
	(148,12,'','Aracoiaba',0),
	(149,12,'','Ararendá',0),
	(150,12,'','Araripe',0),
	(151,12,'','Aratuba',0),
	(152,12,'','Arneiroz',0),
	(153,12,'','Assaré',0),
	(154,12,'','Aurora',0),
	(155,12,'','Baixio',0),
	(156,12,'','Banabuiú',0),
	(157,12,'','Barbalha',0),
	(158,12,'','Barreira',0),
	(159,12,'','Barro',0),
	(160,12,'','Barroquinha',0),
	(161,12,'','Baturité',0),
	(162,12,'','Beberibe',0),
	(163,12,'','Bela Cruz',0),
	(164,12,'','Boa Viagem',0),
	(165,12,'','Brejo Santo',0),
	(166,12,'','Camocim',0),
	(167,12,'','Campos Sales',0),
	(168,12,'','Canindé',0),
	(169,12,'','Capistrano',0),
	(170,12,'','Caridade',0),
	(171,12,'','Cariré',0),
	(172,12,'','Caririaçu',0),
	(173,12,'','Cariús',0),
	(174,12,'','Carnaubal',0),
	(175,12,'','Cascavel',0),
	(176,12,'','Catarina',0),
	(177,12,'','Catunda',0),
	(178,12,'','Caucaia',0),
	(179,12,'','Cedro',0),
	(180,12,'','Chaval',0),
	(181,12,'','Choró',0),
	(182,12,'','Chorozinho',0),
	(183,12,'','Coreaú',0),
	(184,12,'','Crateús',0),
	(185,12,'','Crato',0),
	(186,12,'','Croatá',0),
	(187,12,'','Cruz',0),
	(188,12,'','Deputado Irapuan Pinheiro',0),
	(189,12,'','Ererê',0),
	(190,12,'','Eusébio',0),
	(191,12,'','Farias Brito',0),
	(192,12,'','Forquilha',0),
	(193,12,'','Fortim',0),
	(194,12,'','Frecheirinha',0),
	(195,12,'','General Sampaio',0),
	(196,12,'','Graça',0),
	(197,12,'','Granja',0),
	(198,12,'','Granjeiro',0),
	(199,12,'','Groaíras',0),
	(200,12,'','Guaiúba',0),
	(201,12,'','Guaraciaba do Norte',0),
	(202,12,'','Guaramiranga',0),
	(203,12,'','Hidrolândia',0),
	(204,12,'','Horizonte',0),
	(205,12,'','Ibaretama',0),
	(206,12,'','Ibiapina',0),
	(207,12,'','Ibicuitinga',0),
	(208,12,'','Icapuí',0),
	(209,12,'','Icó',0),
	(210,12,'','Iguatu',0),
	(211,12,'','Independência',0),
	(212,12,'','Ipaporanga',0),
	(213,12,'','Ipaumirim',0),
	(214,12,'','Ipu',0),
	(215,12,'','Irauçuba',0),
	(216,12,'','Itaiçaba',0),
	(217,12,'','Itaitinga',0),
	(218,12,'','Itapagé',0),
	(219,12,'','Itapipoca',0),
	(220,12,'','Itapiúna',0),
	(221,12,'','Itarema',0),
	(222,12,'','Itatira',0),
	(223,12,'','Jaguaretama',0),
	(224,12,'','Jaguaribara',0),
	(225,12,'','Jaguaribe',0),
	(226,12,'','Jaguaruana',0),
	(227,12,'','Jardim',0),
	(228,12,'','Jati',0),
	(229,12,'','Jijoca de Jericoacoara',0),
	(230,12,'','Jucás',0),
	(231,12,'','Lavras da Mangabeira',0),
	(232,12,'','Limoeiro do Norte',0),
	(233,12,'','Madalena',0),
	(234,12,'','Maracanaú',0),
	(235,12,'','Maranguape',0),
	(236,12,'','Marco',0),
	(237,12,'','Martinópole',0),
	(238,12,'','Massapê',0),
	(239,12,'','Mauriti',0),
	(240,12,'','Meruoca',0),
	(241,12,'','Milagres',0),
	(242,12,'','Milhã',0),
	(243,12,'','Miraíma',0),
	(244,12,'','Missão Velha',0),
	(245,12,'','Mombaça',0),
	(246,12,'','Monsenhor Tabosa',0),
	(247,12,'','Morada Nova',0),
	(248,12,'','Moraújo',0),
	(249,12,'','Morrinhos',0),
	(250,12,'','Mucambo',0),
	(251,12,'','Mulungu',0),
	(252,12,'','Nova Russas',0),
	(253,12,'','Novo Oriente',0),
	(254,12,'','Ocara',0),
	(255,12,'','Orós',0),
	(256,12,'','Pacajus',0),
	(257,12,'','Pacatuba',0),
	(258,12,'','Pacoti',0),
	(259,12,'','Pacujá',0),
	(260,12,'','Palhano',0),
	(261,12,'','Palmácia',0),
	(262,12,'','Paracuru',0),
	(263,12,'','Paraipaba',0),
	(264,12,'','Parambu',0),
	(265,12,'','Paramoti',0),
	(266,12,'','Pedra Branca',0),
	(267,12,'','Penaforte',0),
	(268,12,'','Pentecoste',0),
	(269,12,'','Pereiro',0),
	(270,12,'','Pindoretama',0),
	(271,12,'','Piquet Carneiro',0),
	(272,12,'','Pires Ferreira',0),
	(273,12,'','Poranga',0),
	(274,12,'','Porteiras',0),
	(275,12,'','Potengi',0),
	(276,12,'','Potiretama',0),
	(277,12,'','Quiterianópolis',0),
	(278,12,'','Quixadá',0),
	(279,12,'','Quixelô',0),
	(280,12,'','Quixeramobim',0),
	(281,12,'','Quixeré',0),
	(282,12,'','Reriutaba',0),
	(283,12,'','Russas',0),
	(284,12,'','Saboeiro',0),
	(285,12,'','Salitre',0),
	(286,12,'','Santa Quitéria',0),
	(287,12,'','Santana do Acaraú',0),
	(288,12,'','Santana do Cariri',0),
	(289,12,'','São Benedito',0),
	(290,12,'','São Gonçalo do Amarante',0),
	(291,12,'','São João do Jaguaribe',0),
	(292,12,'','São Luís do Curu',0),
	(293,12,'','Senador Pompeu',0),
	(294,12,'','Senador Sá',0),
	(295,12,'','Sobral',0),
	(296,12,'','Solonópole',0),
	(297,12,'','Tabuleiro do Norte',0),
	(298,12,'','Tamboril',0),
	(299,12,'','Tarrafas',0),
	(300,12,'','Tauá',0),
	(301,12,'','Tejuçuoca',0),
	(302,12,'','Tianguá',0),
	(303,12,'','Trairi',0),
	(304,12,'','Tururu',0),
	(305,12,'','Ubajara',0),
	(306,12,'','Umari',0),
	(307,12,'','Umirim',0),
	(308,12,'','Uruburetama',0),
	(309,12,'','Uruoca',0),
	(310,12,'','Varjota',0),
	(311,12,'','Várzea Alegre',0),
	(312,12,'','Viçosa do Ceará',0),
	(313,8,'RBR','Rio Branco',6600),
	(314,8,'','Acrelândia',0),
	(315,8,'','Assis Brasil',0),
	(316,8,'','Brasiléia',0),
	(317,8,'','Bujari',0),
	(318,8,'','Capixaba',0),
	(319,8,'','Cruzeiro do Sul',0),
	(320,8,'','Epitaciolândia',0),
	(321,8,'','Feijó',0),
	(322,8,'','Jordão',0),
	(323,8,'','Mâncio Lima',0),
	(324,8,'','Manoel Urbano',0),
	(325,8,'','Marechal Thaumaturgo',0),
	(326,8,'','Plácido de Castro',0),
	(327,8,'','Porto Acre',0),
	(328,8,'','Porto Walter',0),
	(329,8,'','Rodrigues Alves',0),
	(330,8,'','Santa Rosa do Purus',0),
	(331,8,'','Sena Madureira',0),
	(332,8,'','Senador Guiomard',0),
	(333,8,'','Tarauacá',0),
	(334,8,'','Xapuri',0),
	(335,22,'CUR','Curitiba',0),
	(336,22,'LON','Londrina',4010),
	(337,22,'PAR','Paranaguá',3050),
	(338,22,'','Abatiá',0),
	(339,22,'','Adrianópolis',0),
	(340,22,'','Agudos do Sul',0),
	(341,22,'','Almirante Tamandaré',0),
	(342,22,'','Altamira do Paraná',0),
	(343,22,'','Alto Paraná',0),
	(344,22,'','Alto Piquiri',0),
	(345,22,'','Altônia',0),
	(346,22,'','Alvorada do Sul',0),
	(347,22,'','Amaporã',0),
	(348,22,'','Ampére',0),
	(349,22,'','Anahy',0),
	(350,22,'','Andirá',0),
	(351,22,'','Ã?ngulo',0),
	(352,22,'','Antonina',0),
	(353,22,'','Antônio Olinto',0),
	(354,22,'','Apucarana',0),
	(355,22,'','Arapongas',0),
	(356,22,'','Arapoti',0),
	(357,22,'','Arapuã',0),
	(358,22,'','Araucária',0),
	(359,22,'','Ariranha do Ivaí',0),
	(360,22,'','Assaí',0),
	(361,22,'','Assis Chateaubriand',0),
	(362,22,'','Astorga',0),
	(363,22,'','Balsa Nova',0),
	(364,22,'','Bandeirantes',0),
	(365,22,'','Barbosa Ferraz',0),
	(366,22,'','Barra do Jacaré',0),
	(367,22,'','Barracão',0),
	(368,22,'','Bela Vista da Caroba',0),
	(369,22,'','Bela Vista do Paraíso',0),
	(370,22,'','Bituruna',0),
	(371,22,'','Boa Esperança do Iguaçu',0),
	(372,22,'','Boa Ventura de São Roque',0),
	(373,22,'','Boa Vista da Aparecida',0),
	(374,22,'','Bocaiúva do Sul',0),
	(375,22,'','Bom Jesus do Sul',0),
	(376,22,'','Bom Sucesso do Sul',0),
	(377,22,'','Borrazópolis',0),
	(378,22,'','Braganey',0),
	(379,22,'','Brasilândia do Sul',0),
	(380,22,'','Cafeara',0),
	(381,22,'','Cafezal do Sul',0),
	(382,22,'','Califórnia',0),
	(383,22,'','Cambará',0),
	(384,22,'','Cambé',0),
	(385,22,'','Cambira',0),
	(386,22,'','Campina da Lagoa',0),
	(387,22,'','Campina do Simão',0),
	(388,22,'','Campina Grande do Sul',0),
	(389,22,'','Campo Bonito',0),
	(390,22,'','Campo do Tenente',0),
	(391,22,'','Campo Largo',0),
	(392,22,'','Campo Magro',0),
	(393,22,'','Campo Mourão',0),
	(394,22,'','Cândido de Abreu',0),
	(395,22,'','Candói',0),
	(396,22,'','Capitão Leônidas Marques',0),
	(397,22,'','Carambeí',0),
	(398,22,'','Carlópolis',0),
	(399,22,'','Castro',0),
	(400,22,'','Catanduvas',0),
	(401,22,'','Centenário do Sul',0),
	(402,22,'','Cerro Azul',0),
	(403,22,'','Céu Azul',0),
	(404,22,'','Chopinzinho',0),
	(405,22,'','Cianorte',0),
	(406,22,'','Cidade Gaúcha',0),
	(407,22,'','Clevelândia',0),
	(408,22,'','Colombo',0),
	(409,22,'','Colorado',0),
	(410,22,'','Congonhinhas',0),
	(411,22,'','Conselheiro Mairinck',0),
	(412,22,'','Contenda',0),
	(413,22,'','Corbélia',0),
	(414,22,'','Cornélio Procópio',0),
	(415,22,'','Coronel Domingos Soares',0),
	(416,22,'','Coronel Vivida',0),
	(417,22,'','Corumbataí do Sul',0),
	(418,22,'','Cruz Machado',0),
	(419,22,'','Cruzeiro do Iguaçu',0),
	(420,22,'','Cruzeiro do Oeste',0),
	(421,22,'','Cruzmaltina',0),
	(422,22,'','Curiúva',0),
	(423,22,'','Diamante do Norte',0),
	(424,22,'','Diamante do Sul',0),
	(425,22,'','Diamante D Oeste',0),
	(426,22,'','Dois Vizinhos',0),
	(427,22,'','Douradina',0),
	(428,22,'','Doutor Camargo',0),
	(429,22,'','Doutor Ulysses',0),
	(430,22,'','Enéas Marques',0),
	(431,22,'','Engenheiro Beltrão',0),
	(432,22,'','Entre Rios do Oeste',0),
	(433,22,'','Esperança Nova',0),
	(434,22,'','Espigão Alto do Iguaçu',0),
	(435,22,'','Farol',0),
	(436,22,'','Faxinal',0),
	(437,22,'','Fazenda Rio Grande',0),
	(438,22,'','Fênix',0),
	(439,22,'','Fernandes Pinheiro',0),
	(440,22,'','Figueira',0),
	(441,22,'','Flor da Serra do Sul',0),
	(442,22,'','Floraí',0),
	(443,22,'','Florestópolis',0),
	(444,22,'','Flórida',0),
	(445,22,'','Formosa do Oeste',0),
	(446,22,'','Foz do Iguaçu',0),
	(447,22,'','Foz do Jordão',0),
	(448,22,'','Francisco Alves',0),
	(449,22,'','Francisco Beltrão',0),
	(450,22,'','General Carneiro',0),
	(451,22,'','Godoy Moreira',0),
	(452,22,'','Goioerê',0),
	(453,22,'','Goioxim',0),
	(454,22,'','Grandes Rios',0),
	(455,22,'','Guairação¡',0),
	(456,22,'','Guamiranga',0),
	(457,22,'','Guapirama',0),
	(458,22,'','Guaporema',0),
	(459,22,'','Guaraniaçu',0),
	(460,22,'','Guarapuava',0),
	(461,22,'','Guaraqueçaba',0),
	(462,22,'','Guaratuba',0),
	(463,22,'','Honório Serpa',0),
	(464,22,'','Ibaiti',0),
	(465,22,'','Ibema',0),
	(466,22,'','Ibiporã',0),
	(467,22,'','Icaraíma',0),
	(468,22,'','Iguaraçu',0),
	(469,22,'','Imbaú',0),
	(470,22,'','Imbituva',0),
	(471,22,'','Inácio Martins',0),
	(472,22,'','Ipiranga',0),
	(473,22,'','Iporã',0),
	(474,22,'','Iracema do Oeste',0),
	(475,22,'','Irati',0),
	(476,22,'','Iretama',0),
	(477,22,'','Itaguajé',0),
	(478,22,'','Itaipulândia',0),
	(479,22,'','Itambaracá',0),
	(480,22,'','Itapejara d Oeste',0),
	(481,22,'','Itaperuçu',0),
	(482,22,'','Itaúna do Sul',0),
	(483,22,'','Ivaí',0),
	(484,22,'','Ivaiporã',0),
	(485,22,'','Ivaté',0),
	(486,22,'','Ivatuba',0),
	(487,22,'','Jaboti',0),
	(488,22,'','Jacarezinho',0),
	(489,22,'','Jaguapitã',0),
	(490,22,'','Jaguariaíva',0),
	(491,22,'','Jandaia do Sul',0),
	(492,22,'','Janiópolis',0),
	(493,22,'','Japira',0),
	(494,22,'','Jardim Alegre',0),
	(495,22,'','Jardim Olinda',0),
	(496,22,'','Jataizinho',0),
	(497,22,'','Jesuítas',0),
	(498,22,'','Joaquim Távora',0),
	(499,22,'','Jundiaí do Sul',0),
	(500,22,'','Juranda',0),
	(501,22,'','Kaloré',0),
	(502,22,'','Lapa',0),
	(503,22,'','Laranjeiras do Sul',0),
	(504,22,'','Leópolis',0),
	(505,22,'','Lidianópolis',0),
	(506,22,'','Lindoeste',0),
	(507,22,'','Loanda',0),
	(508,22,'','Lobato',0),
	(509,22,'','Luiziana',0),
	(510,22,'','Lunardelli',0),
	(511,22,'','Lupionópolis',0),
	(512,22,'','Mallet',0),
	(513,22,'','Mamborê',0),
	(514,22,'','Mandaguaçu',0),
	(515,22,'','Mandaguari',0),
	(516,22,'','Mandirituba',0),
	(517,22,'','Manfrinópolis',0),
	(518,22,'','Mangueirinha',0),
	(519,22,'','Manoel Ribas',0),
	(520,22,'','Marechal Cândido Rondon',0),
	(521,22,'','Maria Helena',0),
	(522,22,'','Marialva',0),
	(523,22,'','Marilândia do Sul',0),
	(524,22,'','Marilena',0),
	(525,22,'','Mariluz',0),
	(526,22,'','Maringá',0),
	(527,22,'','Mariópolis',0),
	(528,22,'','Maripá',0),
	(529,22,'','Marmeleiro',0),
	(530,22,'','Marquinho',0),
	(531,22,'','Marumbi',0),
	(532,22,'','Matelândia',0),
	(533,22,'','Matinhos',0),
	(534,22,'','Mato Rico',0),
	(535,22,'','Mauá da Serra',0),
	(536,22,'','Medianeira',0),
	(537,22,'','Mercedes',0),
	(538,22,'','Miraselva',0),
	(539,22,'','Missal',0),
	(540,22,'','Moreira Sales',0),
	(541,22,'','Morretes',0),
	(542,22,'','Munhoz de Melo',0),
	(543,22,'','Nossa Senhora das Graças',0),
	(544,22,'','Nova Aliança do Ivaí',0),
	(545,22,'','Nova América da Colina',0),
	(546,22,'','Nova Aurora',0),
	(547,22,'','Nova Cantu',0),
	(548,22,'','Nova Esperança',0),
	(549,22,'','Nova Esperança do Sudoeste',0),
	(550,22,'','Nova Laranjeiras',0),
	(551,22,'','Nova Londrina',0),
	(552,22,'','Nova Olímpia',0),
	(553,22,'','Nova Prata do Iguaçu',0),
	(554,22,'','Nova Santa Bárbara',0),
	(555,22,'','Nova Santa Rosa',0),
	(556,22,'','Nova Tebas',0),
	(557,22,'','Novo Itacolomi',0),
	(558,22,'','Ortigueira',0),
	(559,22,'','Ourizona',0),
	(560,22,'','Ouro Verde do Oeste',0),
	(561,22,'','Paiçandu',0),
	(562,22,'','Palmeira',0),
	(563,22,'','Palotina',0),
	(564,22,'','Paraíso do Norte',0),
	(565,22,'','Paranacity',0),
	(566,22,'','Paranapoema',0),
	(567,22,'','Paranavaí',0),
	(568,22,'','Pato Bragado',0),
	(569,22,'','Pato Branco',0),
	(570,22,'','Paula Freitas',0),
	(571,22,'','Paulo Frontin',0),
	(572,22,'','Peabiru',0),
	(573,22,'','Perobal',0),
	(574,22,'','Pérola',0),
	(575,22,'','Pérola d Oeste',0),
	(576,22,'','Piên',0),
	(577,22,'','Pinhais',0),
	(578,22,'','Pinhal de São Bento',0),
	(579,22,'','Pinhalão',0),
	(580,22,'','Piraí do Sul',0),
	(581,22,'','Piraquara',0),
	(582,22,'','Pitanga',0),
	(583,22,'','Planaltina do Paraná',0),
	(584,22,'','Ponta Grossa',0),
	(585,22,'','Pontal do Paraná',0),
	(586,22,'','Porecatu',0),
	(587,22,'','Porto Amazonas',0),
	(588,22,'','Porto Barreiro',0),
	(589,22,'','Porto Rico',0),
	(590,22,'','Porto Vitória',0),
	(591,22,'','Prado Ferreira',0),
	(592,22,'','Pranchita',0),
	(593,22,'','Presidente Castelo Branco',0),
	(594,22,'','Primeiro de Maio',0),
	(595,22,'','Prudentópolis',0),
	(596,22,'','Quarto Centenário',0),
	(597,22,'','Quatiguá',0),
	(598,22,'','Quatro Barras',0),
	(599,22,'','Quatro Pontes',0),
	(600,22,'','Quedas do Iguaçu',0),
	(601,22,'','Querência do Norte',0),
	(602,22,'','Quinta do Sol',0),
	(603,22,'','Quitandinha',0),
	(604,22,'','Ramilândia',0),
	(605,22,'','Rancho Alegre',0),
	(606,22,'','Rancho Alegre D Oeste',0),
	(607,22,'','Realeza',0),
	(608,22,'','Rebouças',0),
	(609,22,'','Renascença',0),
	(610,22,'','Reserva',0),
	(611,22,'','Reserva do Iguaçu',0),
	(612,22,'','Ribeirão Claro',0),
	(613,22,'','Ribeirão do Pinhal',0),
	(614,22,'','Rio Azul',0),
	(615,22,'','Rio Bom',0),
	(616,22,'','Rio Bonito do Iguaçu',0),
	(617,22,'','Rio Branco do Ivaí',0),
	(618,22,'','Rio Branco do Sul',0),
	(619,22,'','Rio Negro',0),
	(620,22,'','Rolândia',0),
	(621,22,'','Roncador',0),
	(622,22,'','Rondon',0),
	(623,22,'','Rosário do Ivaí',0),
	(624,22,'','Sabáudia',0),
	(625,22,'','Salgado Filho',0),
	(626,22,'','Salto do Itararé',0),
	(627,22,'','Salto do Lontra',0),
	(628,22,'','Santa Amélia',0),
	(629,22,'','Santa Cecília do Pavão',0),
	(630,22,'','Santa Cruz de Monte Castelo',0),
	(631,22,'','Santa Fé',0),
	(632,22,'','Santa Isabel do Ivaí',0),
	(633,22,'','Santa Izabel do Oeste',0),
	(634,22,'','Santa Maria do Oeste',0),
	(635,22,'','Santa Mariana',0),
	(636,22,'','Santa Mônica',0),
	(637,22,'','Santa Tereza do Oeste',0),
	(638,22,'','Santa Terezinha de Itaipu',0),
	(639,22,'','Santana do Itararé',0),
	(640,22,'','Santo Antônio da Platina',0),
	(641,22,'','Santo Antônio do Caiuá',0),
	(642,22,'','Santo Antônio do Paraíso',0),
	(643,22,'','Santo Antônio do Sudoeste',0),
	(644,22,'','Santo Inácio',0),
	(645,22,'','São Carlos do Ivaí',0),
	(646,22,'','São Jerônimo da Serra',0),
	(647,22,'','São João do Caiuá',0),
	(648,22,'','São João do Ivaí',0),
	(649,22,'','São João do Triunfo',0),
	(650,22,'','São Jorge do Ivaí',0),
	(651,22,'','São Jorge do Patrocínio',0),
	(652,22,'','São Jorge d Oeste',0),
	(653,22,'','São José da Boa Vista',0),
	(654,22,'','São José das Palmeiras',0),
	(655,22,'','São José dos Pinhais',0),
	(656,22,'','São Manoel do Paraná',0),
	(657,22,'','São Mateus do Sul',0),
	(658,22,'','São Miguel do Iguaçu',0),
	(659,22,'','São Pedro do Iguaçu',0),
	(660,22,'','São Pedro do Ivaí',0),
	(661,22,'','São Pedro do Paraná',0),
	(662,22,'','São Sebastião da Amoreira',0),
	(663,22,'','Sapopema',0),
	(664,22,'','Sarandi',0),
	(665,22,'','Saudade do Iguaçu',0),
	(666,22,'','Sengés',0),
	(667,22,'','Serranópolis do Iguaçu',0),
	(668,22,'','Sertaneja',0),
	(669,22,'','Sertanópolis',0),
	(670,22,'','Siqueira Campos',0),
	(671,22,'','Sulina',0),
	(672,22,'','Tamarana',0),
	(673,22,'','Tamboara',0),
	(674,22,'','Tapejara',0),
	(675,22,'','Teixeira Soares',0),
	(676,22,'','Telêmaco Borba',0),
	(677,22,'','Terra Boa',0),
	(678,22,'','Terra Rica',0),
	(679,22,'','Tibagi',0),
	(680,22,'','Tijucas do Sul',0),
	(681,22,'','Tomazina',0),
	(682,22,'','Três Barras do Paraná',0),
	(683,22,'','Tunas do Paraná',0),
	(684,22,'','Tuneiras do Oeste',0),
	(685,22,'','Tupãssi',0),
	(686,22,'','Turvo',0),
	(687,22,'','Ubiratã',0),
	(688,22,'','Umuarama',0),
	(689,22,'','União da Vitória',0),
	(690,22,'','Uniflor',0),
	(691,22,'','Uraí',0),
	(692,22,'','Ventania',0),
	(693,22,'','Vera Cruz do Oeste',0),
	(694,22,'','Verê',0),
	(695,22,'','Virmond',0),
	(696,22,'','Vitorino',0),
	(697,22,'','Xambrê',0),
	(698,15,'GOI','Goiânia',2500),
	(699,15,'CAT','Catalão',2450),
	(700,15,'ANA','Anápolis',2490),
	(701,15,'','Abadia de Goiás',0),
	(702,15,'','Abadiânia',0),
	(703,15,'','Acreúna',0),
	(704,15,'','Adelândia',0),
	(705,15,'','Água Fria de Goiás',0),
	(706,15,'','Água Limpa',0),
	(707,15,'','Águas Lindas de Goiás',0),
	(708,15,'','Alexânia',0),
	(709,15,'','Aloândia',0),
	(710,15,'','Alto Horizonte',0),
	(711,15,'','Alto Paraíso de Goiás',0),
	(712,15,'','Alvorada do Norte',0),
	(713,15,'','Amaralina',0),
	(714,15,'','Americano do Brasil',0),
	(715,15,'','Amorinópolis',0),
	(716,15,'','Anhanguera',0),
	(717,15,'','Anicuns',0),
	(718,15,'','Aparecida de Goiânia',0),
	(719,15,'','Aparecida do Rio Doce',0),
	(720,15,'','Aporé',0),
	(721,15,'','Araçu',0),
	(722,15,'','Aragarças',0),
	(723,15,'','Aragoiânia',0),
	(724,15,'','Araguapaz',0),
	(725,15,'','Arenópolis',0),
	(726,15,'','Aruanã',0),
	(727,15,'','Aurilândia',0),
	(728,15,'','Avelinópolis',0),
	(729,15,'','Baliza',0),
	(730,15,'','Bela Vista de Goiás',0),
	(731,15,'','Bom Jardim de Goiás',0),
	(732,15,'','Bom Jesus de Goiás',0),
	(733,15,'','Bonfinópolis',0),
	(734,15,'','Bonópolis',0),
	(735,15,'','Brazabrantes',0),
	(736,15,'','Britânia',0),
	(737,15,'','Buriti Alegre',0),
	(738,15,'','Buriti de Goiás',0),
	(739,15,'','Buritinópolis',0),
	(740,15,'','Cabeceiras',0),
	(741,15,'','Cachoeira Alta',0),
	(742,15,'','Cachoeira de Goiás',0),
	(743,15,'','Caçu',0),
	(744,15,'','Caiapônia',0),
	(745,15,'','Caldas Novas',0),
	(746,15,'','Caldazinha',0),
	(747,15,'','Campestre de Goiás',0),
	(748,15,'','Campinaçu',0),
	(749,15,'','Campinorte',0),
	(750,15,'','Campo Alegre de Goiás',0),
	(751,15,'','Campo Limpo de Goiás',0),
	(752,15,'','Campos Belos',0),
	(753,15,'','Campos Verdes',0),
	(754,15,'','Carmo do Rio Verde',0),
	(755,15,'','Castelândia',0),
	(756,15,'','Caturaí',0),
	(757,15,'','Cavalcante',0),
	(758,15,'','Ceres',0),
	(759,15,'','Cezarina',0),
	(760,15,'','Chapadão do Céu',0),
	(761,15,'','Cidade Ocidental',0),
	(762,15,'','Cocalzinho de Goiás',0),
	(763,15,'','Colinas do Sul',0),
	(764,15,'','Córrego do Ouro',0),
	(765,15,'','Corumbá de Goiás',0),
	(766,15,'','Corumbaíba',0),
	(767,15,'','Cristalina',0),
	(768,15,'','Cristianópolis',0),
	(769,15,'','Crixás',0),
	(770,15,'','Cromínia',0),
	(771,15,'','Cumari',0),
	(772,15,'','Damianópolis',0),
	(773,15,'','Damolândia',0),
	(774,15,'','Diorama',0),
	(775,15,'','Divinópolis de Goiás',0),
	(776,15,'','Doverlândia',0),
	(777,15,'','Edealina',0),
	(778,15,'','Edéia',0),
	(779,15,'','Faina',0),
	(780,15,'','Fazenda Nova',0),
	(781,15,'','Firminópolis',0),
	(782,15,'','Flores de Goiás',0),
	(783,15,'','Formosa',0),
	(784,15,'','Gameleira de Goiás',0),
	(785,15,'','Goianápolis',0),
	(786,15,'','Goiandira',0),
	(787,15,'','Goianésia',0),
	(788,15,'','Goianira',0),
	(789,15,'','Goiás',0),
	(790,15,'','Goiatuba',0),
	(791,15,'','Gouvelândia',0),
	(792,15,'','Guapó',0),
	(793,15,'','Guaraíta',0),
	(794,15,'','Guarani de Goiás',0),
	(795,15,'','Guarinos',0),
	(796,15,'','Heitoraí',0),
	(797,15,'','Hidrolina',0),
	(798,15,'','Iaciara',0),
	(799,15,'','Inaciolândia',0),
	(800,15,'','Indiara',0),
	(801,15,'','Inhumas',0),
	(802,15,'','Ipameri',0),
	(803,15,'','Ipiranga de Goiás',0),
	(804,15,'','Iporá',0),
	(805,15,'','Israelândia',0),
	(806,15,'','Itaberaí',0),
	(807,15,'','Itaguari',0),
	(808,15,'','Itaguaru',0),
	(809,15,'','Itapaci',0),
	(810,15,'','Itapirapuã',0),
	(811,15,'','Itapuranga',0),
	(812,15,'','Itarumã',0),
	(813,15,'','Itauçu',0),
	(814,15,'','Itumbiara',0),
	(815,15,'','Ivolândia',0),
	(816,15,'','Jandaia',0),
	(817,15,'','Jaraguá',0),
	(818,15,'','Jataí',0),
	(819,15,'','Jaupaci',0),
	(820,15,'','Jesúpolis',0),
	(821,15,'','Joviânia',0),
	(822,15,'','Leopoldo de Bulhões',0),
	(823,15,'','Luziânia',0),
	(824,15,'','Mairipotaba',0),
	(825,15,'','Mambaí',0),
	(826,15,'','Mara Rosa',0),
	(827,15,'','Marzagão',0),
	(828,15,'','Matrinchã',0),
	(829,15,'','Maurilândia',0),
	(830,15,'','Mimoso de Goiás',0),
	(831,15,'','Minaçu',0),
	(832,15,'','Mineiros',0),
	(833,15,'','Moiporá',0),
	(834,15,'','Monte Alegre de Goiás',0),
	(835,15,'','Montes Claros de Goiás',0),
	(836,15,'','Montividiu',0),
	(837,15,'','Montividiu do Norte',0),
	(838,15,'','Morro Agudo de Goiás',0),
	(839,15,'','Mossâmedes',0),
	(840,15,'','Mozarlândia',0),
	(841,15,'','Mutunópolis',0),
	(842,15,'','Nazário',0),
	(843,15,'','Nerópolis',0),
	(844,15,'','Niquelândia',0),
	(845,15,'','Nova América',0),
	(846,15,'','Nova Crixás',0),
	(847,15,'','Nova Glória',0),
	(848,15,'','Nova Iguaçu de Goiás',0),
	(849,15,'','Nova Roma',0),
	(850,15,'','Novo Brasil',0),
	(851,15,'','Novo Gama',0),
	(852,15,'','Novo Planalto',0),
	(853,15,'','Orizona',0),
	(854,15,'','Ouro Verde de Goiás',0),
	(855,15,'','Ouvidor',0),
	(856,15,'','Padre Bernardo',0),
	(857,15,'','Palestina de Goiás',0),
	(858,15,'','Palmeiras de Goiás',0),
	(859,15,'','Palmelo',0),
	(860,15,'','Palminópolis',0),
	(861,15,'','Panamá',0),
	(862,15,'','Paranaiguara',0),
	(863,15,'','Paraúna',0),
	(864,15,'','Perolândia',0),
	(865,15,'','Petrolina de Goiás',0),
	(866,15,'','Pilar de Goiás',0),
	(867,15,'','Piracanjuba',0),
	(868,15,'','Pirenópolis',0),
	(869,15,'','Pires do Rio',0),
	(870,15,'','Planaltina',0),
	(871,15,'','Pontalina',0),
	(872,15,'','Porangatu',0),
	(873,15,'','Porteirão',0),
	(874,15,'','Portelândia',0),
	(875,15,'','Posse',0),
	(876,15,'','Professor Jamil',0),
	(877,15,'','Quirinópolis',0),
	(878,15,'','Rialma',0),
	(879,15,'','Rianápolis',0),
	(880,15,'','Rio Quente',0),
	(881,15,'','Rio Verde',0),
	(882,15,'','Rubiataba',0),
	(883,15,'','Sanclerlândia',0),
	(884,15,'','Santa Bárbara de Goiás',0),
	(885,15,'','Santa Cruz de Goiás',0),
	(886,15,'','Santa Fé de Goiás',0),
	(887,15,'','Santa Helena de Goiás',0),
	(888,15,'','Santa Rita do Araguaia',0),
	(889,15,'','Santa Rita do Novo Destino',0),
	(890,15,'','Santa Rosa de Goiás',0),
	(891,15,'','Santa Tereza de Goiás',0),
	(892,15,'','Santa Terezinha de Goiás',0),
	(893,15,'','Santo Antônio da Barra',0),
	(894,15,'','Santo Antônio de Goiás',0),
	(895,15,'','Santo Antônio do Descoberto',0),
	(896,15,'','São Francisco de Goiás',0),
	(897,15,'','São João da Paraúna',0),
	(898,15,'','São João dAliança',0),
	(899,15,'','São Luís de Montes Belos',0),
	(900,15,'','São Luíz do Norte',0),
	(901,15,'','São Miguel do Araguaia',0),
	(902,15,'','São Miguel do Passa Quatro',0),
	(903,15,'','São Patrício',0),
	(904,15,'','Senador Canedo',0),
	(905,15,'','Serranópolis',0),
	(906,15,'','Silvânia',0),
	(907,15,'','Simolândia',0),
	(908,15,'','Sítio dAbadia',0),
	(909,15,'','Taquaral de Goiás',0),
	(910,15,'','Teresina de Goiás',0),
	(911,15,'','Terezópolis de Goiás',0),
	(912,15,'','Três Ranchos',0),
	(913,15,'','Trombas',0),
	(914,15,'','Turvânia',0),
	(915,15,'','Turvelândia',0),
	(916,15,'','Uirapuru',0),
	(917,15,'','Uruaçu',0),
	(918,15,'','Uruana',0),
	(919,15,'','Urutaí',0),
	(920,15,'','Valparaíso de Goiás',0),
	(921,15,'','Varjão',0),
	(922,15,'','Vianópolis',0),
	(923,15,'','Vicentinópolis',0),
	(924,15,'','Vila Boa',0),
	(925,15,'','Vila Propício',0);

/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela contadores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contadores`;

CREATE TABLE `contadores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `ano` int NOT NULL DEFAULT '0',
  `numero` int NOT NULL DEFAULT '0',
  `setor` char(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `contadores` WRITE;
/*!40000 ALTER TABLE `contadores` DISABLE KEYS */;

INSERT INTO `contadores` (`id`, `id_armazens`, `ano`, `numero`, `setor`)
VALUES
	(1,1,2022,2,'0'),
	(2,1,2022,2,'0');

/*!40000 ALTER TABLE `contadores` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela contagens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contagens`;

CREATE TABLE `contagens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned DEFAULT '0',
  `id_notas` bigint unsigned DEFAULT '0',
  `contagem` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela contagens_umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contagens_umas`;

CREATE TABLE `contagens_umas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas` bigint unsigned DEFAULT '0',
  `id_tipos_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_contagens` bigint unsigned NOT NULL DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_barras` varchar(40) NOT NULL DEFAULT '',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `uma` varchar(20) NOT NULL DEFAULT '',
  `situacao` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IX_umas_cod` (`codigo_barras`),
  KEY `IX_umas_prog` (`id_programacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela contagens_umas_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contagens_umas_itens`;

CREATE TABLE `contagens_umas_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_contagens_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas_origem` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `tipo` char(1) NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `faturar` tinyint(1) NOT NULL DEFAULT '0',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `avariada` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  `data` datetime NOT NULL,
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_validade_antiga` date NOT NULL DEFAULT '0000-00-00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `m3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `temperatura` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor` decimal(20,8) DEFAULT NULL,
  `quantidade_temp` decimal(20,6) DEFAULT NULL,
  `lote` varchar(30) NOT NULL,
  `serial` varchar(40) NOT NULL DEFAULT '',
  `inventario` tinyint unsigned DEFAULT '0',
  `entrada_dinamica` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_contagens` (`id_contagens_umas`),
  KEY `IX_programacao` (`id_programacao`),
  KEY `IX_armazens` (`id_armazens`),
  KEY `IX_veiculos_acessos` (`id_veiculos_acessos`),
  KEY `IX_notas_itens` (`id_notas_itens`),
  KEY `IX_itens_skus` (`id_itens_skus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela containers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `containers`;

CREATE TABLE `containers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas_cliente` bigint DEFAULT '0',
  `id_veiculos_acessos_entrada` bigint DEFAULT '0',
  `id_veiculos_acessos_saida` bigint DEFAULT '0',
  `id_posicoes` bigint DEFAULT '0',
  `cancelado` tinyint(1) DEFAULT '0',
  `cheio` tinyint(1) DEFAULT '0',
  `avariado` tinyint(1) DEFAULT '0',
  `faturado` tinyint(1) DEFAULT '0',
  `numero` char(11) DEFAULT '',
  `tamanho` char(2) NOT NULL DEFAULT '20',
  `data_entrada` datetime DEFAULT '0000-00-00 00:00:00',
  `data_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `data_faturamento` datetime DEFAULT '0000-00-00 00:00:00',
  `lacre` varchar(30) DEFAULT NULL,
  `booking` varchar(60) DEFAULT '',
  `id_tipos_containers` bigint DEFAULT '0',
  `tara` char(4) DEFAULT NULL,
  `numero_nota` varchar(20) DEFAULT NULL,
  `peso` decimal(20,8) DEFAULT NULL,
  `valor` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CLIENTE` (`id_pessoas_cliente`),
  KEY `POSICAO` (`id_posicoes`),
  KEY `FLAGS` (`cancelado`,`cheio`,`avariado`,`faturado`),
  KEY `NUMERO` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela containers_movimentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `containers_movimentos`;

CREATE TABLE `containers_movimentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_tipos_containers_movimentos` bigint DEFAULT '0',
  `id_pessoas` bigint DEFAULT '0',
  `id_containers` bigint DEFAULT '0',
  `id_posicao` bigint DEFAULT '0',
  `data` datetime DEFAULT '0000-00-00 00:00:00',
  `detalhes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela enderecos_cidades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enderecos_cidades`;

CREATE TABLE `enderecos_cidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_enderecos_estados` bigint unsigned NOT NULL DEFAULT '0',
  `sigla` varchar(10) DEFAULT '',
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `distancia_da_sede` bigint DEFAULT '0',
  `codigo_ibge` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cidades';

LOCK TABLES `enderecos_cidades` WRITE;
/*!40000 ALTER TABLE `enderecos_cidades` DISABLE KEYS */;

INSERT INTO `enderecos_cidades` (`id`, `id_enderecos_estados`, `sigla`, `descricao`, `distancia_da_sede`, `codigo_ibge`)
VALUES
	(1,1,'SSA','Salvador',0,'2927408'),
	(2,1,'IBO','Ibotirama',600,'2913200'),
	(3,1,'DIA','Dias Dávila',80,NULL),
	(4,1,'LAU','Lauro de Freitas',30,'2919207'),
	(5,1,'CAM','Camaçari',60,'2905701'),
	(6,2,'RJO','Rio de Janeiro',2500,'3304557'),
	(7,1,'SFS','Simões Filho',40,'2930709'),
	(8,31,'SPO','São Paulo',2700,'3550308'),
	(10,23,'REC','Recife',2000,'2611606'),
	(11,1,'ALA','Alagoinhas',180,'2900702'),
	(12,1,'','Amargosa',0,'2901007'),
	(13,1,'','Barreiras',0,'2903201'),
	(14,1,'','Bom Jesus da Lapa',0,'2903904'),
	(15,1,'','Brumado',0,'2904605'),
	(17,1,'CAN','Candeias',30,'3112000'),
	(18,1,'','Capim Grosso',0,'2906873'),
	(19,1,'','Catu',0,'2907509'),
	(20,1,'','Conceição do Coité',0,'2908408'),
	(21,1,'','Conceição do Jacuípe',0,'2908507'),
	(22,1,'','Cruz das Almas',0,'2909802'),
	(24,1,'','Euclides da Cunha',0,'2910701'),
	(25,1,'','Eunapolis',0,NULL),
	(26,1,'FEI','Feira de Santana',100,'2910800'),
	(27,1,'','Guanambi',0,'2911709'),
	(28,1,'','Gandu',0,'2911204'),
	(29,1,'','Ibicaraí',0,'2912103'),
	(30,1,'','Ibicuí',0,'2912301'),
	(31,1,'','Ilheus',0,NULL),
	(32,1,'','Ipiau',0,NULL),
	(33,1,'','Ipirá',0,'2914000'),
	(34,1,'','Irece',0,NULL),
	(35,1,'','Itaberaba',0,'2914703'),
	(36,1,'ITB','Itabuna',450,'2914802'),
	(37,1,'','Itamaraju',0,'2915601'),
	(38,1,'ITP','Itapetinga',540,'2916401'),
	(39,1,'','Jacobina',0,'2917508'),
	(40,1,'','Jequie',0,NULL),
	(41,1,'JUA','Juazeiro',500,'2918407'),
	(42,1,'','Luis Eduardo Magalhães',0,NULL),
	(44,1,'','Macaubas',0,NULL),
	(45,1,'','Posto da Mata',0,NULL),
	(46,1,'','Paulo Afonso',0,'2924009'),
	(47,1,'','Pojuca',0,'2925204'),
	(48,1,'POR','Porto seguro',610,'2925303'),
	(49,1,'','Riachão do Jacuípe',0,'2926301'),
	(50,1,'','Ribeira do Pombal',0,'2926608'),
	(51,1,'','Santa Maria da Vitória',0,'2928109'),
	(52,1,'STA','Santo Amaro',50,'2928604'),
	(53,1,'','Santo Estevão',0,NULL),
	(54,1,'','Santo Antônio de Jesus',0,'2928703'),
	(55,1,'','São Felix do Coribe',0,NULL),
	(56,1,'','Seabra',0,'2929909'),
	(57,1,'','Senhor do Bomfim',0,NULL),
	(58,1,'','Serrinha',0,'2930501'),
	(60,1,'','Teixeira de Freitas',0,'2931350'),
	(61,1,'VAL','Valença',300,'3306107'),
	(62,1,'VCO','Vitória da Conquista',600,'2933307'),
	(63,1,'','Esplanada',0,'2910602'),
	(64,1,'','Valente',0,'2933000'),
	(65,1,'','Itabela',0,'2914653'),
	(66,1,'','Madre de Deus',0,'2919926'),
	(67,1,'','Poções',0,'2925105'),
	(68,1,'','Coaraci',0,'2908002'),
	(69,1,'','Nazaré',0,'2922508'),
	(70,1,'','Mucuri',0,'2922003'),
	(71,1,'','Rio real',0,'2927002'),
	(72,1,'CAC','Cachoeira',160,'2904902'),
	(73,1,'','Camacã',0,NULL),
	(74,1,'','Campo Formoso',0,'2906006'),
	(75,1,'','Entre Rios',0,'4205175'),
	(77,1,'','Inhambupe',0,'2913705'),
	(78,2,'','Queimados',0,'3304144'),
	(79,2,'','Nova Iguaçu',0,'3303500'),
	(80,2,'','Cabuçu',0,NULL),
	(81,2,'','Nilópolis',0,'3303203'),
	(82,2,'','Belford Roxo',0,'3300456'),
	(83,2,'','Miguel Couto',0,NULL),
	(84,2,'','Sepetiba',0,NULL),
	(85,2,'','Mesquita',0,'3302858'),
	(86,2,'','Paracambi',0,'3303609'),
	(87,2,'PTR','Petrópolis',2200,'3303906'),
	(88,2,'TER','Teresópolis',2200,'3305802'),
	(89,2,'','Guapimirim',0,'3301850'),
	(90,2,'MAG','Magé',2200,'3302502'),
	(91,2,'','Friburgo',0,NULL),
	(92,2,'CAB','Cabo Frio',2200,'3300704'),
	(93,2,'','Barra Mansa',0,'3300407'),
	(94,2,'','Miguel Pereira',0,'3302908'),
	(95,2,'','Angra dos Reis',0,'3300100'),
	(97,2,'','Rio das Ostras',0,'3304524'),
	(98,2,'','Penedo',0,'2706703'),
	(99,2,'','Campos dos Goytacazes',0,'3301009'),
	(100,2,'','Duque de Caxias',0,'3301702'),
	(101,2,'','São Gonçalo',0,'3304904'),
	(102,2,'NIT','Niterói',2190,'3303302'),
	(103,2,'','São João de Meriti',0,'3305109'),
	(104,2,'VTR','Volta Redonda',2300,'3306305'),
	(105,2,'','Macaé',0,'3302403'),
	(106,2,'','Itaboraí',0,'3301900'),
	(107,2,'','Nova Friburgo',0,'3303401'),
	(108,2,'','Maricá',0,'3302700'),
	(109,2,'','Resende',0,'3304201'),
	(110,2,'ARA','Araruama',2200,'3300209'),
	(111,2,'','Itaguaí',0,'3302007'),
	(112,2,'','Japeri',0,'3302270'),
	(113,2,'','Itaperuna',0,'3302205'),
	(114,2,'','São Pedro da Aldeia',0,'3305208'),
	(115,2,'','Barra do Piraí',0,'3300308'),
	(116,2,'','Seropédica',0,'3305554'),
	(117,2,'','Saquarema',0,'3305505'),
	(118,2,'','Três Rios',0,'3306008'),
	(119,2,'VAL','Valença',300,'3306107'),
	(120,2,'','Rio Bonito',0,'3304300'),
	(121,2,'','Cachoeiras de Macacu',0,'3300803'),
	(123,2,'','Paraíba do Sul',0,'3303708'),
	(124,2,'','São Francisco de Itabapoana',0,'3304755'),
	(125,2,'','Santo Antônio de Pádua',0,'3304706'),
	(126,2,'','Mangaratiba',0,'3302601'),
	(127,2,'','Paraty',0,NULL),
	(128,2,'','Casimiro de Abreu',0,'3301306'),
	(129,2,'','São Fidélis',0,'3304805'),
	(130,2,'','Vassouras',0,'3306206'),
	(131,2,'','Iguaba Grande',0,'3301876'),
	(132,2,'','Paty do Alferes',0,'3303856'),
	(133,12,'FOR','Fortaleza',1100,'2304400'),
	(134,12,'JUN','Juazeiro do Norte',600,'2307304'),
	(135,12,'','Abaiara',0,'2300101'),
	(136,12,'','Acarape',0,'2300150'),
	(137,12,'','Acaraú',0,'2300200'),
	(138,12,'','Acopiara',0,'2300309'),
	(139,12,'','Aiuaba',0,'2300408'),
	(140,12,'','Alcântaras',0,'2300507'),
	(141,12,'','Altaneira',0,'2300606'),
	(142,12,'','Alto Santo',0,'2300705'),
	(143,12,'','Amontada',0,'2300754'),
	(144,12,'','Antonina do Norte',0,'2300804'),
	(145,12,'','Apuiarés',0,'2300903'),
	(146,12,'','Aquiraz',0,'2301000'),
	(147,12,'','Aracati',0,'2301109'),
	(148,12,'','Aracoiaba',0,'2301208'),
	(149,12,'','Ararendá',0,'2301257'),
	(150,12,'','Araripe',0,'2301307'),
	(151,12,'','Aratuba',0,'2301406'),
	(152,12,'','Arneiroz',0,'2301505'),
	(153,12,'','Assaré',0,'2301604'),
	(154,12,'','Aurora',0,'4201901'),
	(155,12,'','Baixio',0,'2301802'),
	(156,12,'','Banabuiú',0,'2301851'),
	(157,12,'','Barbalha',0,'2301901'),
	(158,12,'','Barreira',0,'2301950'),
	(159,12,'','Barro',0,'2302008'),
	(160,12,'','Barroquinha',0,'2302057'),
	(161,12,'','Baturité',0,'2302107'),
	(162,12,'','Beberibe',0,'2302206'),
	(163,12,'','Bela Cruz',0,'2302305'),
	(164,12,'','Boa Viagem',0,'2302404'),
	(165,12,'','Brejo Santo',0,'2302503'),
	(166,12,'','Camocim',0,'2302602'),
	(167,12,'','Campos Sales',0,'2302701'),
	(168,12,'','Canindé',0,'2302800'),
	(169,12,'','Capistrano',0,'2302909'),
	(170,12,'','Caridade',0,'2303006'),
	(171,12,'','Cariré',0,'2303105'),
	(172,12,'','Caririaçu',0,'2303204'),
	(173,12,'','Cariús',0,'2303303'),
	(174,12,'','Carnaubal',0,'2303402'),
	(175,12,'','Cascavel',0,'4104808'),
	(176,12,'','Catarina',0,'2303600'),
	(177,12,'','Catunda',0,'2303659'),
	(178,12,'','Caucaia',0,'2303709'),
	(179,12,'','Cedro',0,'2604304'),
	(180,12,'','Chaval',0,'2303907'),
	(181,12,'','Choró',0,'2303931'),
	(182,12,'','Chorozinho',0,'2303956'),
	(183,12,'','Coreaú',0,'2304004'),
	(184,12,'','Crateús',0,'2304103'),
	(185,12,'','Crato',0,'2304202'),
	(186,12,'','Croatá',0,'2304236'),
	(187,12,'','Cruz',0,'2304251'),
	(188,12,'','Deputado Irapuan Pinheiro',0,'2304269'),
	(189,12,'','Ererê',0,'2304277'),
	(190,12,'','Eusébio',0,'2304285'),
	(191,12,'','Farias Brito',0,'2304301'),
	(192,12,'','Forquilha',0,'2304350'),
	(193,12,'','Fortim',0,'2304459'),
	(194,12,'','Frecheirinha',0,'2304509'),
	(195,12,'','General Sampaio',0,'2304608'),
	(196,12,'','Graça',0,'2304657'),
	(197,12,'','Granja',0,'2304707'),
	(198,12,'','Granjeiro',0,'2304806'),
	(199,12,'','Groaíras',0,'2304905'),
	(200,12,'','Guaiúba',0,'2304954'),
	(201,12,'','Guaraciaba do Norte',0,'2305001'),
	(202,12,'','Guaramiranga',0,'2305100'),
	(203,12,'','Hidrolândia',0,'5209705'),
	(204,12,'','Horizonte',0,'2305233'),
	(205,12,'','Ibaretama',0,'2305266'),
	(206,12,'','Ibiapina',0,'2305308'),
	(207,12,'','Ibicuitinga',0,'2305332'),
	(208,12,'','Icapuí',0,'2305357'),
	(209,12,'','Icó',0,'2305407'),
	(210,12,'','Iguatu',0,'4110052'),
	(211,12,'','Independência',0,'4310405'),
	(212,12,'','Ipaporanga',0,'2305654'),
	(213,12,'','Ipaumirim',0,'2305704'),
	(214,12,'','Ipu',0,'2305803'),
	(215,12,'','Irauçuba',0,'2306108'),
	(216,12,'','Itaiçaba',0,'2306207'),
	(217,12,'','Itaitinga',0,'2306256'),
	(218,12,'','Itapagé',0,'2306306'),
	(219,12,'','Itapipoca',0,'2306405'),
	(220,12,'','Itapiúna',0,'2306504'),
	(221,12,'','Itarema',0,'2306553'),
	(222,12,'','Itatira',0,'2306603'),
	(223,12,'','Jaguaretama',0,'2306702'),
	(224,12,'','Jaguaribara',0,'2306801'),
	(225,12,'','Jaguaribe',0,'2306900'),
	(226,12,'','Jaguaruana',0,'2307007'),
	(227,12,'','Jardim',0,'5005004'),
	(228,12,'','Jati',0,'2307205'),
	(229,12,'','Jijoca de Jericoacoara',0,'2307254'),
	(230,12,'','Jucás',0,'2307403'),
	(231,12,'','Lavras da Mangabeira',0,'2307502'),
	(232,12,'','Limoeiro do Norte',0,'2307601'),
	(233,12,'','Madalena',0,'2307635'),
	(234,12,'','Maracanaú',0,'2307650'),
	(235,12,'','Maranguape',0,'2307700'),
	(236,12,'','Marco',0,'2307809'),
	(237,12,'','Martinópole',0,'2307908'),
	(238,12,'','Massapê',0,'2308005'),
	(239,12,'','Mauriti',0,'2308104'),
	(240,12,'','Meruoca',0,'2308203'),
	(241,12,'','Milagres',0,'2921302'),
	(242,12,'','Milhã',0,'2308351'),
	(243,12,'','Miraíma',0,'2308377'),
	(244,12,'','Missão Velha',0,'2308401'),
	(245,12,'','Mombaça',0,'2308500'),
	(246,12,'','Monsenhor Tabosa',0,'2308609'),
	(247,12,'','Morada Nova',0,'2308708'),
	(248,12,'','Moraújo',0,'2308807'),
	(249,12,'','Morrinhos',0,'5213806'),
	(250,12,'','Mucambo',0,'2309003'),
	(251,12,'','Mulungu',0,'2509800'),
	(252,12,'','Nova Russas',0,'2309300'),
	(253,12,'','Novo Oriente',0,'2309409'),
	(254,12,'','Ocara',0,'2309458'),
	(255,12,'','Orós',0,'2309508'),
	(256,12,'','Pacajus',0,'2309607'),
	(257,12,'','Pacatuba',0,'2804904'),
	(258,12,'','Pacoti',0,'2309805'),
	(259,12,'','Pacujá',0,'2309904'),
	(260,12,'','Palhano',0,'2310001'),
	(261,12,'','Palmácia',0,'2310100'),
	(262,12,'','Paracuru',0,'2310209'),
	(263,12,'','Paraipaba',0,'2310258'),
	(264,12,'','Parambu',0,'2310308'),
	(265,12,'','Paramoti',0,'2310407'),
	(266,12,'','Pedra Branca',0,'2511004'),
	(267,12,'','Penaforte',0,'2310605'),
	(268,12,'','Pentecoste',0,'2310704'),
	(269,12,'','Pereiro',0,'2310803'),
	(270,12,'','Pindoretama',0,'2310852'),
	(271,12,'','Piquet Carneiro',0,'2310902'),
	(272,12,'','Pires Ferreira',0,'2310951'),
	(273,12,'','Poranga',0,'2311009'),
	(274,12,'','Porteiras',0,'2311108'),
	(275,12,'','Potengi',0,'2311207'),
	(276,12,'','Potiretama',0,'2311231'),
	(277,12,'','Quiterianópolis',0,'2311264'),
	(278,12,'','Quixadá',0,'2311306'),
	(279,12,'','Quixelô',0,'2311355'),
	(280,12,'','Quixeramobim',0,'2311405'),
	(281,12,'','Quixeré',0,'2311504'),
	(282,12,'','Reriutaba',0,'2311702'),
	(283,12,'','Russas',0,'2311801'),
	(284,12,'','Saboeiro',0,'2311900'),
	(285,12,'','Salitre',0,'2311959'),
	(286,12,'','Santa Quitéria',0,'2312205'),
	(287,12,'','Santana do Acaraú',0,'2312007'),
	(288,12,'','Santana do Cariri',0,'2312106'),
	(289,12,'','São Benedito',0,'2312304'),
	(290,12,'','São Gonçalo do Amarante',0,'2412005'),
	(291,12,'','São João do Jaguaribe',0,'2312502'),
	(292,12,'','São Luís do Curu',0,'2312601'),
	(293,12,'','Senador Pompeu',0,'2312700'),
	(294,12,'','Senador Sá',0,'2312809'),
	(295,12,'','Sobral',0,'2312908'),
	(296,12,'','Solonópole',0,'2313005'),
	(297,12,'','Tabuleiro do Norte',0,'2313104'),
	(298,12,'','Tamboril',0,'2313203'),
	(299,12,'','Tarrafas',0,'2313252'),
	(300,12,'','Tauá',0,'2313302'),
	(301,12,'','Tejuçuoca',0,'2313351'),
	(302,12,'','Tianguá',0,'2313401'),
	(303,12,'','Trairi',0,'2313500'),
	(304,12,'','Tururu',0,'2313559'),
	(305,12,'','Ubajara',0,'2313609'),
	(306,12,'','Umari',0,'2313708'),
	(307,12,'','Umirim',0,'2313757'),
	(308,12,'','Uruburetama',0,'2313807'),
	(309,12,'','Uruoca',0,'2313906'),
	(310,12,'','Varjota',0,'2313955'),
	(311,12,'','Várzea Alegre',0,'2314003'),
	(312,12,'','Viçosa do Ceará',0,'2314102'),
	(313,8,'RBR','Rio Branco',6600,'5107206'),
	(314,8,'','Acrelândia',0,'1200013'),
	(315,8,'','Assis Brasil',0,'1200054'),
	(316,8,'','Brasiléia',0,'1200104'),
	(317,8,'','Bujari',0,'1200138'),
	(318,8,'','Capixaba',0,'1200179'),
	(319,8,'','Cruzeiro do Sul',0,'4306205'),
	(320,8,'','Epitaciolândia',0,'1200252'),
	(321,8,'','Feijó',0,'1200302'),
	(322,8,'','Jordão',0,'1200328'),
	(323,8,'','Mâncio Lima',0,'1200336'),
	(324,8,'','Manoel Urbano',0,'1200344'),
	(325,8,'','Marechal Thaumaturgo',0,'1200351'),
	(326,8,'','Plácido de Castro',0,'1200385'),
	(327,8,'','Porto Acre',0,'1200807'),
	(328,8,'','Porto Walter',0,'1200393'),
	(329,8,'','Rodrigues Alves',0,'1200427'),
	(330,8,'','Santa Rosa do Purus',0,'1200435'),
	(331,8,'','Sena Madureira',0,'1200500'),
	(332,8,'','Senador Guiomard',0,'1200450'),
	(333,8,'','Tarauacá',0,'1200609'),
	(334,8,'','Xapuri',0,'1200708'),
	(335,22,'CUR','Curitiba',4000,'4106902'),
	(336,22,'LON','Londrina',4010,'4113700'),
	(337,22,'PAR','Paranaguá',3050,'4118204'),
	(338,22,'','Abatiá',0,'4100103'),
	(339,22,'','Adrianópolis',0,'4100202'),
	(340,22,'','Agudos do Sul',0,'4100301'),
	(341,22,'','Almirante Tamandaré',0,'4100400'),
	(342,22,'','Altamira do Paraná',0,'4100459'),
	(343,22,'','Alto Paraná',0,'4100608'),
	(344,22,'','Alto Piquiri',0,'4100707'),
	(345,22,'','Altônia',0,'4100509'),
	(346,22,'','Alvorada do Sul',0,'4100806'),
	(347,22,'','Amaporã',0,'4100905'),
	(348,22,'','Ampére',0,'4101002'),
	(349,22,'','Anahy',0,'4101051'),
	(350,22,'','Andirá',0,'4101101'),
	(351,22,'','Ã‚ngulo',0,'4101150'),
	(352,22,'','Antonina',0,'4101200'),
	(353,22,'','Antônio Olinto',0,'4101309'),
	(354,22,'','Apucarana',0,'4101408'),
	(355,22,'','Arapongas',0,'4101507'),
	(356,22,'','Arapoti',0,'4101606'),
	(357,22,'','Arapuã',0,'4101655'),
	(358,22,'','Araucária',0,'4101804'),
	(359,22,'','Ariranha do Ivaí',0,'4101853'),
	(360,22,'','Assaí',0,'4101903'),
	(361,22,'','Assis Chateaubriand',0,'4102000'),
	(362,22,'','Astorga',0,'4102109'),
	(363,22,'','Balsa Nova',0,'4102307'),
	(364,22,'','Bandeirantes',0,'5001508'),
	(365,22,'','Barbosa Ferraz',0,'4102505'),
	(366,22,'','Barra do Jacaré',0,'4102703'),
	(367,22,'','Barracão',0,'4301800'),
	(368,22,'','Bela Vista da Caroba',0,'4102752'),
	(369,22,'','Bela Vista do Paraíso',0,'4102802'),
	(370,22,'','Bituruna',0,'4102901'),
	(371,22,'','Boa Esperança do Iguaçu',0,'4103024'),
	(372,22,'','Boa Ventura de São Roque',0,'4103040'),
	(373,22,'','Boa Vista da Aparecida',0,'4103057'),
	(374,22,'','Bocaiúva do Sul',0,'4103107'),
	(375,22,'','Bom Jesus do Sul',0,'4103156'),
	(376,22,'','Bom Sucesso do Sul',0,'4103222'),
	(377,22,'','Borrazópolis',0,'4103305'),
	(378,22,'','Braganey',0,'4103354'),
	(379,22,'','Brasilândia do Sul',0,'4103370'),
	(380,22,'','Cafeara',0,'4103404'),
	(381,22,'','Cafezal do Sul',0,'4103479'),
	(382,22,'','Califórnia',0,'4103503'),
	(383,22,'','Cambará',0,'4103602'),
	(384,22,'','Cambé',0,'4103701'),
	(385,22,'','Cambira',0,'4103800'),
	(386,22,'','Campina da Lagoa',0,'4103909'),
	(387,22,'','Campina do Simão',0,'4103958'),
	(388,22,'','Campina Grande do Sul',0,'4104006'),
	(389,22,'','Campo Bonito',0,'4104055'),
	(390,22,'','Campo do Tenente',0,'4104105'),
	(391,22,'','Campo Largo',0,'4104204'),
	(392,22,'','Campo Magro',0,'4104253'),
	(393,22,'','Campo Mourão',0,'4104303'),
	(394,22,'','Cândido de Abreu',0,'4104402'),
	(395,22,'','Candói',0,'4104428'),
	(396,22,'','Capitão Leônidas Marques',0,'4104600'),
	(397,22,'','Carambeí',0,'4104659'),
	(398,22,'','Carlópolis',0,'4104709'),
	(399,22,'','Castro',0,'4104907'),
	(400,22,'','Catanduvas',0,'4204004'),
	(401,22,'','Centenário do Sul',0,'4105102'),
	(402,22,'','Cerro Azul',0,'4105201'),
	(403,22,'','Céu Azul',0,'4105300'),
	(404,22,'','Chopinzinho',0,'4105409'),
	(405,22,'','Cianorte',0,'4105508'),
	(406,22,'','Cidade Gaúcha',0,'4105607'),
	(407,22,'','Clevelândia',0,'4105706'),
	(408,22,'','Colombo',0,'4105805'),
	(409,22,'','Colorado',0,'4305603'),
	(410,22,'','Congonhinhas',0,'4106001'),
	(411,22,'','Conselheiro Mairinck',0,'4106100'),
	(412,22,'','Contenda',0,'4106209'),
	(413,22,'','Corbélia',0,'4106308'),
	(414,22,'','Cornélio Procópio',0,'4106407'),
	(415,22,'','Coronel Domingos Soares',0,'4106456'),
	(416,22,'','Coronel Vivida',0,'4106506'),
	(417,22,'','Corumbataí do Sul',0,'4106555'),
	(418,22,'','Cruz Machado',0,'4106803'),
	(419,22,'','Cruzeiro do Iguaçu',0,'4106571'),
	(420,22,'','Cruzeiro do Oeste',0,'4106605'),
	(421,22,'','Cruzmaltina',0,'4106852'),
	(422,22,'','Curiúva',0,'4107009'),
	(423,22,'','Diamante do Norte',0,'4107108'),
	(424,22,'','Diamante do Sul',0,'4107124'),
	(425,22,'','Diamante D Oeste',0,'4107157'),
	(426,22,'','Dois Vizinhos',0,'4107207'),
	(427,22,'','Douradina',0,'5003504'),
	(428,22,'','Doutor Camargo',0,'4107306'),
	(429,22,'','Doutor Ulysses',0,'4128633'),
	(430,22,'','Enéas Marques',0,'4107405'),
	(431,22,'','Engenheiro Beltrão',0,'4107504'),
	(432,22,'','Entre Rios do Oeste',0,'4107538'),
	(433,22,'','Esperança Nova',0,'4107520'),
	(434,22,'','Espigão Alto do Iguaçu',0,'4107546'),
	(435,22,'','Farol',0,'4107553'),
	(436,22,'','Faxinal',0,'4107603'),
	(437,22,'','Fazenda Rio Grande',0,'4107652'),
	(438,22,'','Fênix',0,'4107702'),
	(439,22,'','Fernandes Pinheiro',0,'4107736'),
	(440,22,'','Figueira',0,'4107751'),
	(441,22,'','Flor da Serra do Sul',0,'4107850'),
	(442,22,'','Floraí',0,'4107801'),
	(443,22,'','Florestópolis',0,'4108007'),
	(444,22,'','Flórida',0,'4108106'),
	(445,22,'','Formosa do Oeste',0,'4108205'),
	(446,22,'','Foz do Iguaçu',0,'4108304'),
	(447,22,'','Foz do Jordão',0,'4108452'),
	(448,22,'','Francisco Alves',0,'4108320'),
	(449,22,'','Francisco Beltrão',0,'4108403'),
	(450,22,'','General Carneiro',0,'5103908'),
	(451,22,'','Godoy Moreira',0,'4108551'),
	(452,22,'','Goioerê',0,'4108601'),
	(453,22,'','Goioxim',0,'4108650'),
	(454,22,'','Grandes Rios',0,'4108700'),
	(455,22,'','Guairação¡',0,'4108908'),
	(456,22,'','Guamiranga',0,'4108957'),
	(457,22,'','Guapirama',0,'4109005'),
	(458,22,'','Guaporema',0,'4109104'),
	(459,22,'','Guaraniaçu',0,'4109302'),
	(460,22,'','Guarapuava',0,'4109401'),
	(461,22,'','Guaraqueçaba',0,'4109500'),
	(462,22,'','Guaratuba',0,'4109609'),
	(463,22,'','Honório Serpa',0,'4109658'),
	(464,22,'','Ibaiti',0,'4109708'),
	(465,22,'','Ibema',0,'4109757'),
	(466,22,'','Ibiporã',0,'4109807'),
	(467,22,'','Icaraíma',0,'4109906'),
	(468,22,'','Iguaraçu',0,'4110003'),
	(469,22,'','Imbaú',0,'4110078'),
	(470,22,'','Imbituva',0,'4110102'),
	(471,22,'','Inácio Martins',0,'4110201'),
	(472,22,'','Ipiranga',0,'4110508'),
	(473,22,'','Iporã',0,'4110607'),
	(474,22,'','Iracema do Oeste',0,'4110656'),
	(475,22,'','Irati',0,'4207858'),
	(476,22,'','Iretama',0,'4110805'),
	(477,22,'','Itaguajé',0,'4110904'),
	(478,22,'','Itaipulândia',0,'4110953'),
	(479,22,'','Itambaracá',0,'4111001'),
	(480,22,'','Itapejara d Oeste',0,'4111209'),
	(481,22,'','Itaperuçu',0,'4111258'),
	(482,22,'','Itaúna do Sul',0,'4111308'),
	(483,22,'','Ivaí',0,'4111407'),
	(484,22,'','Ivaiporã',0,'4111506'),
	(485,22,'','Ivaté',0,'4111555'),
	(486,22,'','Ivatuba',0,'4111605'),
	(487,22,'','Jaboti',0,'4111704'),
	(488,22,'','Jacarezinho',0,'4111803'),
	(489,22,'','Jaguapitã',0,'4111902'),
	(490,22,'','Jaguariaíva',0,'4112009'),
	(491,22,'','Jandaia do Sul',0,'4112108'),
	(492,22,'','Janiópolis',0,'4112207'),
	(493,22,'','Japira',0,'4112306'),
	(494,22,'','Jardim Alegre',0,'4112504'),
	(495,22,'','Jardim Olinda',0,'4112603'),
	(496,22,'','Jataizinho',0,'4112702'),
	(497,22,'','Jesuítas',0,'4112751'),
	(498,22,'','Joaquim Távora',0,'4112801'),
	(499,22,'','Jundiaí do Sul',0,'4112900'),
	(500,22,'','Juranda',0,'4112959'),
	(501,22,'','Kaloré',0,'4113106'),
	(502,22,'','Lapa',0,'4113205'),
	(503,22,'','Laranjeiras do Sul',0,'4113304'),
	(504,22,'','Leópolis',0,'4113403'),
	(505,22,'','Lidianópolis',0,'4113429'),
	(506,22,'','Lindoeste',0,'4113452'),
	(507,22,'','Loanda',0,'4113502'),
	(508,22,'','Lobato',0,'4113601'),
	(509,22,'','Luiziana',0,'4113734'),
	(510,22,'','Lunardelli',0,'4113759'),
	(511,22,'','Lupionópolis',0,'4113809'),
	(512,22,'','Mallet',0,'4113908'),
	(513,22,'','Mamborê',0,'4114005'),
	(514,22,'','Mandaguaçu',0,'4114104'),
	(515,22,'','Mandaguari',0,'4114203'),
	(516,22,'','Mandirituba',0,'4114302'),
	(517,22,'','Manfrinópolis',0,'4114351'),
	(518,22,'','Mangueirinha',0,'4114401'),
	(519,22,'','Manoel Ribas',0,'4114500'),
	(520,22,'','Marechal Cândido Rondon',0,'4114609'),
	(521,22,'','Maria Helena',0,'4114708'),
	(522,22,'','Marialva',0,'4114807'),
	(523,22,'','Marilândia do Sul',0,'4114906'),
	(524,22,'','Marilena',0,'4115002'),
	(525,22,'','Mariluz',0,'4115101'),
	(526,22,'','Maringá',0,'4115200'),
	(527,22,'','Mariópolis',0,'4115309'),
	(528,22,'','Maripá',0,'4115358'),
	(529,22,'','Marmeleiro',0,'4115408'),
	(530,22,'','Marquinho',0,'4115457'),
	(531,22,'','Marumbi',0,'4115507'),
	(532,22,'','Matelândia',0,'4115606'),
	(533,22,'','Matinhos',0,'4115705'),
	(534,22,'','Mato Rico',0,'4115739'),
	(535,22,'','Mauá da Serra',0,'4115754'),
	(536,22,'','Medianeira',0,'4115804'),
	(537,22,'','Mercedes',0,'4115853'),
	(538,22,'','Miraselva',0,'4116000'),
	(539,22,'','Missal',0,'4116059'),
	(540,22,'','Moreira Sales',0,'4116109'),
	(541,22,'','Morretes',0,'4116208'),
	(542,22,'','Munhoz de Melo',0,'4116307'),
	(543,22,'','Nossa Senhora das Graças',0,'4116406'),
	(544,22,'','Nova Aliança do Ivaí',0,'4116505'),
	(545,22,'','Nova América da Colina',0,'4116604'),
	(546,22,'','Nova Aurora',0,'5214804'),
	(547,22,'','Nova Cantu',0,'4116802'),
	(548,22,'','Nova Esperança',0,'4116901'),
	(549,22,'','Nova Esperança do Sudoeste',0,'4116950'),
	(550,22,'','Nova Laranjeiras',0,'4117057'),
	(551,22,'','Nova Londrina',0,'4117107'),
	(552,22,'','Nova Olímpia',0,'5106232'),
	(553,22,'','Nova Prata do Iguaçu',0,'4117255'),
	(554,22,'','Nova Santa Bárbara',0,'4117214'),
	(555,22,'','Nova Santa Rosa',0,'4117222'),
	(556,22,'','Nova Tebas',0,'4117271'),
	(557,22,'','Novo Itacolomi',0,'4117297'),
	(558,22,'','Ortigueira',0,'4117305'),
	(559,22,'','Ourizona',0,'4117404'),
	(560,22,'','Ouro Verde do Oeste',0,'4117453'),
	(561,22,'','Paiçandu',0,'4117503'),
	(562,22,'','Palmeira',0,'4212056'),
	(563,22,'','Palotina',0,'4117909'),
	(564,22,'','Paraíso do Norte',0,'4118006'),
	(565,22,'','Paranacity',0,'4118105'),
	(566,22,'','Paranapoema',0,'4118303'),
	(567,22,'','Paranavaí',0,'4118402'),
	(568,22,'','Pato Bragado',0,'4118451'),
	(569,22,'','Pato Branco',0,'4118501'),
	(570,22,'','Paula Freitas',0,'4118600'),
	(571,22,'','Paulo Frontin',0,'4118709'),
	(572,22,'','Peabiru',0,'4118808'),
	(573,22,'','Perobal',0,'4118857'),
	(574,22,'','Pérola',0,'4118907'),
	(575,22,'','Pérola d Oeste',0,'4119004'),
	(576,22,'','Piên',0,'4119103'),
	(577,22,'','Pinhais',0,'4119152'),
	(578,22,'','Pinhal de São Bento',0,'4119251'),
	(579,22,'','Pinhalão',0,'4119202'),
	(580,22,'','Piraí do Sul',0,'4119400'),
	(581,22,'','Piraquara',0,'4119509'),
	(582,22,'','Pitanga',0,'4119608'),
	(583,22,'','Planaltina do Paraná',0,'4119707'),
	(584,22,'','Ponta Grossa',0,'4119905'),
	(585,22,'','Pontal do Paraná',0,'4119954'),
	(586,22,'','Porecatu',0,'4120002'),
	(587,22,'','Porto Amazonas',0,'4120101'),
	(588,22,'','Porto Barreiro',0,'4120150'),
	(589,22,'','Porto Rico',0,'4120200'),
	(590,22,'','Porto Vitória',0,'4120309'),
	(591,22,'','Prado Ferreira',0,'4120333'),
	(592,22,'','Pranchita',0,'4120358'),
	(593,22,'','Presidente Castelo Branco',0,'4120408'),
	(594,22,'','Primeiro de Maio',0,'4120507'),
	(595,22,'','Prudentópolis',0,'4120606'),
	(596,22,'','Quarto Centenário',0,'4120655'),
	(597,22,'','Quatiguá',0,'4120705'),
	(598,22,'','Quatro Barras',0,'4120804'),
	(599,22,'','Quatro Pontes',0,'4120853'),
	(600,22,'','Quedas do Iguaçu',0,'4120903'),
	(601,22,'','Querência do Norte',0,'4121000'),
	(602,22,'','Quinta do Sol',0,'4121109'),
	(603,22,'','Quitandinha',0,'4121208'),
	(604,22,'','Ramilândia',0,'4121257'),
	(605,22,'','Rancho Alegre',0,'4121307'),
	(606,22,'','Rancho Alegre D Oeste',0,'4121356'),
	(607,22,'','Realeza',0,'4121406'),
	(608,22,'','Rebouças',0,'4121505'),
	(609,22,'','Renascença',0,'4121604'),
	(610,22,'','Reserva',0,'4121703'),
	(611,22,'','Reserva do Iguaçu',0,'4121752'),
	(612,22,'','Ribeirão Claro',0,'4121802'),
	(613,22,'','Ribeirão do Pinhal',0,'4121901'),
	(614,22,'','Rio Azul',0,'4122008'),
	(615,22,'','Rio Bom',0,'4122107'),
	(616,22,'','Rio Bonito do Iguaçu',0,'4122156'),
	(617,22,'','Rio Branco do Ivaí',0,'4122172'),
	(618,22,'','Rio Branco do Sul',0,'4122206'),
	(619,22,'','Rio Negro',0,'5007307'),
	(620,22,'','Rolândia',0,'4122404'),
	(621,22,'','Roncador',0,'4122503'),
	(622,22,'','Rondon',0,'4122602'),
	(623,22,'','Rosário do Ivaí',0,'4122651'),
	(624,22,'','Sabáudia',0,'4122701'),
	(625,22,'','Salgado Filho',0,'4122800'),
	(626,22,'','Salto do Itararé',0,'4122909'),
	(627,22,'','Salto do Lontra',0,'4123006'),
	(628,22,'','Santa Amélia',0,'4123105'),
	(629,22,'','Santa Cecília do Pavão',0,'4123204'),
	(630,22,'','Santa Cruz de Monte Castelo',0,'4123303'),
	(631,22,'','Santa Fé',0,'4123402'),
	(632,22,'','Santa Isabel do Ivaí',0,'4123709'),
	(633,22,'','Santa Izabel do Oeste',0,'4123808'),
	(634,22,'','Santa Maria do Oeste',0,'4123857'),
	(635,22,'','Santa Mariana',0,'4123907'),
	(636,22,'','Santa Mônica',0,'4123956'),
	(637,22,'','Santa Tereza do Oeste',0,'4124020'),
	(638,22,'','Santa Terezinha de Itaipu',0,'4124053'),
	(639,22,'','Santana do Itararé',0,'4124004'),
	(640,22,'','Santo Antônio da Platina',0,'4124103'),
	(641,22,'','Santo Antônio do Caiuá',0,'4124202'),
	(642,22,'','Santo Antônio do Paraíso',0,'4124301'),
	(643,22,'','Santo Antônio do Sudoeste',0,'4124400'),
	(644,22,'','Santo Inácio',0,'4124509'),
	(645,22,'','São Carlos do Ivaí',0,'4124608'),
	(646,22,'','São Jerônimo da Serra',0,'4124707'),
	(647,22,'','São João do Caiuá',0,'4124905'),
	(648,22,'','São João do Ivaí',0,'4125001'),
	(649,22,'','São João do Triunfo',0,'4125100'),
	(650,22,'','São Jorge do Ivaí',0,'4125308'),
	(651,22,'','São Jorge do Patrocínio',0,'4125357'),
	(652,22,'','São Jorge d Oeste',0,'4125209'),
	(653,22,'','São José da Boa Vista',0,'4125407'),
	(654,22,'','São José das Palmeiras',0,'4125456'),
	(655,22,'','São José dos Pinhais',0,'4125506'),
	(656,22,'','São Manoel do Paraná',0,'4125555'),
	(657,22,'','São Mateus do Sul',0,'4125605'),
	(658,22,'','São Miguel do Iguaçu',0,'4125704'),
	(659,22,'','São Pedro do Iguaçu',0,'4125753'),
	(660,22,'','São Pedro do Ivaí',0,'4125803'),
	(661,22,'','São Pedro do Paraná',0,'4125902'),
	(662,22,'','São Sebastião da Amoreira',0,'4126009'),
	(663,22,'','Sapopema',0,'4126207'),
	(664,22,'','Sarandi',0,'4320107'),
	(665,22,'','Saudade do Iguaçu',0,'4126272'),
	(666,22,'','Sengés',0,'4126306'),
	(667,22,'','Serranópolis do Iguaçu',0,'4126355'),
	(668,22,'','Sertaneja',0,'4126405'),
	(669,22,'','Sertanópolis',0,'4126504'),
	(670,22,'','Siqueira Campos',0,'4126603'),
	(671,22,'','Sulina',0,'4126652'),
	(672,22,'','Tamarana',0,'4126678'),
	(673,22,'','Tamboara',0,'4126702'),
	(674,22,'','Tapejara',0,'4320909'),
	(675,22,'','Teixeira Soares',0,'4127007'),
	(676,22,'','Telêmaco Borba',0,'4127106'),
	(677,22,'','Terra Boa',0,'4127205'),
	(678,22,'','Terra Rica',0,'4127304'),
	(679,22,'','Tibagi',0,'4127502'),
	(680,22,'','Tijucas do Sul',0,'4127601'),
	(681,22,'','Tomazina',0,'4127809'),
	(682,22,'','Três Barras do Paraná',0,'4127858'),
	(683,22,'','Tunas do Paraná',0,'4127882'),
	(684,22,'','Tuneiras do Oeste',0,'4127908'),
	(685,22,'','Tupãssi',0,'4127957'),
	(686,22,'','Turvo',0,'4218806'),
	(687,22,'','Ubiratã',0,'4128005'),
	(688,22,'','Umuarama',0,'4128104'),
	(689,22,'','União da Vitória',0,'4128203'),
	(690,22,'','Uniflor',0,'4128302'),
	(691,22,'','Uraí',0,'4128401'),
	(692,22,'','Ventania',0,'4128534'),
	(693,22,'','Vera Cruz do Oeste',0,'4128559'),
	(694,22,'','Verê',0,'4128609'),
	(695,22,'','Virmond',0,'4128658'),
	(696,22,'','Vitorino',0,'4128708'),
	(697,22,'','Xambrê',0,'4128807'),
	(698,15,'GOI','Goiânia',2500,'5208707'),
	(699,15,'CAT','Catalão',2450,'5205109'),
	(700,15,'ANA','Anápolis',2490,'5201108'),
	(701,15,'','Abadia de Goiás',0,'5200050'),
	(702,15,'','Abadiânia',0,'5200100'),
	(703,15,'','Acreúna',0,'5200134'),
	(704,15,'','Adelândia',0,'5200159'),
	(705,15,'','Água Fria de Goiás',0,'5200175'),
	(706,15,'','Água Limpa',0,'5200209'),
	(707,15,'','Águas Lindas de Goiás',0,'5200258'),
	(708,15,'','Alexânia',0,'5200308'),
	(709,15,'','Aloândia',0,'5200506'),
	(710,15,'','Alto Horizonte',0,'5200555'),
	(711,15,'','Alto Paraíso de Goiás',0,'5200605'),
	(712,15,'','Alvorada do Norte',0,'5200803'),
	(713,15,'','Amaralina',0,'5200829'),
	(714,15,'','Americano do Brasil',0,'5200852'),
	(715,15,'','Amorinópolis',0,'5200902'),
	(716,15,'','Anhanguera',0,'5201207'),
	(717,15,'','Anicuns',0,'5201306'),
	(718,15,'','Aparecida de Goiânia',0,'5201405'),
	(719,15,'','Aparecida do Rio Doce',0,'5201454'),
	(720,15,'','Aporé',0,'5201504'),
	(721,15,'','Araçu',0,'5201603'),
	(722,15,'','Aragarças',0,'5201702'),
	(723,15,'','Aragoiânia',0,'5201801'),
	(724,15,'','Araguapaz',0,'5202155'),
	(725,15,'','Arenópolis',0,'5202353'),
	(726,15,'','Aruanã',0,'5202502'),
	(727,15,'','Aurilândia',0,'5202601'),
	(728,15,'','Avelinópolis',0,'5202809'),
	(729,15,'','Baliza',0,'5203104'),
	(730,15,'','Bela Vista de Goiás',0,'5203302'),
	(731,15,'','Bom Jardim de Goiás',0,'5203401'),
	(732,15,'','Bom Jesus de Goiás',0,'5203500'),
	(733,15,'','Bonfinópolis',0,'5203559'),
	(734,15,'','Bonópolis',0,'5203575'),
	(735,15,'','Brazabrantes',0,'5203609'),
	(736,15,'','Britânia',0,'5203807'),
	(737,15,'','Buriti Alegre',0,'5203906'),
	(738,15,'','Buriti de Goiás',0,'5203939'),
	(739,15,'','Buritinópolis',0,'5203962'),
	(740,15,'','Cabeceiras',0,'5204003'),
	(741,15,'','Cachoeira Alta',0,'5204102'),
	(742,15,'','Cachoeira de Goiás',0,'5204201'),
	(743,15,'','Caçu',0,'5204300'),
	(744,15,'','Caiapônia',0,'5204409'),
	(745,15,'','Caldas Novas',0,'5204508'),
	(746,15,'','Caldazinha',0,'5204557'),
	(747,15,'','Campestre de Goiás',0,'5204607'),
	(748,15,'','Campinaçu',0,'5204656'),
	(749,15,'','Campinorte',0,'5204706'),
	(750,15,'','Campo Alegre de Goiás',0,'5204805'),
	(751,15,'','Campo Limpo de Goiás',0,'5204854'),
	(752,15,'','Campos Belos',0,'5204904'),
	(753,15,'','Campos Verdes',0,'5204953'),
	(754,15,'','Carmo do Rio Verde',0,'5205000'),
	(755,15,'','Castelândia',0,'5205059'),
	(756,15,'','Caturaí',0,'5205208'),
	(757,15,'','Cavalcante',0,'5205307'),
	(758,15,'','Ceres',0,'5205406'),
	(759,15,'','Cezarina',0,'5205455'),
	(760,15,'','Chapadão do Céu',0,'5205471'),
	(761,15,'','Cidade Ocidental',0,'5205497'),
	(762,15,'','Cocalzinho de Goiás',0,'5205513'),
	(763,15,'','Colinas do Sul',0,'5205521'),
	(764,15,'','Córrego do Ouro',0,'5205703'),
	(765,15,'','Corumbá de Goiás',0,'5205802'),
	(766,15,'','Corumbaíba',0,'5205901'),
	(767,15,'','Cristalina',0,'5206206'),
	(768,15,'','Cristianópolis',0,'5206305'),
	(769,15,'','Crixás',0,'5206404'),
	(770,15,'','Cromínia',0,'5206503'),
	(771,15,'','Cumari',0,'5206602'),
	(772,15,'','Damianópolis',0,'5206701'),
	(773,15,'','Damolândia',0,'5206800'),
	(774,15,'','Diorama',0,'5207105'),
	(775,15,'','Divinópolis de Goiás',0,'5208301'),
	(776,15,'','Doverlândia',0,'5207253'),
	(777,15,'','Edealina',0,'5207352'),
	(778,15,'','Edéia',0,'5207402'),
	(779,15,'','Faina',0,'5207535'),
	(780,15,'','Fazenda Nova',0,'5207600'),
	(781,15,'','Firminópolis',0,'5207808'),
	(782,15,'','Flores de Goiás',0,'5207907'),
	(783,15,'','Formosa',0,'5208004'),
	(784,15,'','Gameleira de Goiás',0,'5208152'),
	(785,15,'','Goianápolis',0,'5208400'),
	(786,15,'','Goiandira',0,'5208509'),
	(787,15,'','Goianésia',0,'5208608'),
	(788,15,'','Goianira',0,'5208806'),
	(789,15,'','Goiás',0,'5208905'),
	(790,15,'','Goiatuba',0,'5209101'),
	(791,15,'','Gouvelândia',0,'5209150'),
	(792,15,'','Guapó',0,'5209200'),
	(793,15,'','Guaraíta',0,'5209291'),
	(794,15,'','Guarani de Goiás',0,'5209408'),
	(795,15,'','Guarinos',0,'5209457'),
	(796,15,'','Heitoraí',0,'5209606'),
	(797,15,'','Hidrolina',0,'5209804'),
	(798,15,'','Iaciara',0,'5209903'),
	(799,15,'','Inaciolândia',0,'5209937'),
	(800,15,'','Indiara',0,'5209952'),
	(801,15,'','Inhumas',0,'5210000'),
	(802,15,'','Ipameri',0,'5210109'),
	(803,15,'','Ipiranga de Goiás',0,'5210158'),
	(804,15,'','Iporá',0,'5210208'),
	(805,15,'','Israelândia',0,'5210307'),
	(806,15,'','Itaberaí',0,'5210406'),
	(807,15,'','Itaguari',0,'5210562'),
	(808,15,'','Itaguaru',0,'5210604'),
	(809,15,'','Itapaci',0,'5210901'),
	(810,15,'','Itapirapuã',0,'5211008'),
	(811,15,'','Itapuranga',0,'5211206'),
	(812,15,'','Itarumã',0,'5211305'),
	(813,15,'','Itauçu',0,'5211404'),
	(814,15,'','Itumbiara',0,'5211503'),
	(815,15,'','Ivolândia',0,'5211602'),
	(816,15,'','Jandaia',0,'5211701'),
	(817,15,'','Jaraguá',0,'5211800'),
	(818,15,'','Jataí',0,'5211909'),
	(819,15,'','Jaupaci',0,'5212006'),
	(820,15,'','Jesúpolis',0,'5212055'),
	(821,15,'','Joviânia',0,'5212105'),
	(822,15,'','Leopoldo de Bulhões',0,'5212303'),
	(823,15,'','Luziânia',0,'5212501'),
	(824,15,'','Mairipotaba',0,'5212600'),
	(825,15,'','Mambaí',0,'5212709'),
	(826,15,'','Mara Rosa',0,'5212808'),
	(827,15,'','Marzagão',0,'5212907'),
	(828,15,'','Matrinchã',0,'5212956'),
	(829,15,'','Maurilândia',0,'5213004'),
	(830,15,'','Mimoso de Goiás',0,'5213053'),
	(831,15,'','Minaçu',0,'5213087'),
	(832,15,'','Mineiros',0,'5213103'),
	(833,15,'','Moiporá',0,'5213400'),
	(834,15,'','Monte Alegre de Goiás',0,'5213509'),
	(835,15,'','Montes Claros de Goiás',0,'5213707'),
	(836,15,'','Montividiu',0,'5213756'),
	(837,15,'','Montividiu do Norte',0,'5213772'),
	(838,15,'','Morro Agudo de Goiás',0,'5213855'),
	(839,15,'','Mossâmedes',0,'5213905'),
	(840,15,'','Mozarlândia',0,'5214002'),
	(841,15,'','Mutunópolis',0,'5214101'),
	(842,15,'','Nazário',0,'5214408'),
	(843,15,'','Nerópolis',0,'5214507'),
	(844,15,'','Niquelândia',0,'5214606'),
	(845,15,'','Nova América',0,'5214705'),
	(846,15,'','Nova Crixás',0,'5214838'),
	(847,15,'','Nova Glória',0,'5214861'),
	(848,15,'','Nova Iguaçu de Goiás',0,'5214879'),
	(849,15,'','Nova Roma',0,'5214903'),
	(850,15,'','Novo Brasil',0,'5215207'),
	(851,15,'','Novo Gama',0,'5215231'),
	(852,15,'','Novo Planalto',0,'5215256'),
	(853,15,'','Orizona',0,'5215306'),
	(854,15,'','Ouro Verde de Goiás',0,'5215405'),
	(855,15,'','Ouvidor',0,'5215504'),
	(856,15,'','Padre Bernardo',0,'5215603'),
	(857,15,'','Palestina de Goiás',0,'5215652'),
	(858,15,'','Palmeiras de Goiás',0,'5215702'),
	(859,15,'','Palmelo',0,'5215801'),
	(860,15,'','Palminópolis',0,'5215900'),
	(861,15,'','Panamá',0,'5216007'),
	(862,15,'','Paranaiguara',0,'5216304'),
	(863,15,'','Paraúna',0,'5216403'),
	(864,15,'','Perolândia',0,'5216452'),
	(865,15,'','Petrolina de Goiás',0,'5216809'),
	(866,15,'','Pilar de Goiás',0,'5216908'),
	(867,15,'','Piracanjuba',0,'5217104'),
	(868,15,'','Pirenópolis',0,'5217302'),
	(869,15,'','Pires do Rio',0,'5217401'),
	(870,15,'','Planaltina',0,'5217609'),
	(871,15,'','Pontalina',0,'5217708'),
	(872,15,'','Porangatu',0,'5218003'),
	(873,15,'','Porteirão',0,'5218052'),
	(874,15,'','Portelândia',0,'5218102'),
	(875,15,'','Posse',0,'5218300'),
	(876,15,'','Professor Jamil',0,'5218391'),
	(877,15,'','Quirinópolis',0,'5218508'),
	(878,15,'','Rialma',0,'5218607'),
	(879,15,'','Rianápolis',0,'5218706'),
	(880,15,'','Rio Quente',0,'5218789'),
	(881,15,'','Rio Verde',0,'5218805'),
	(882,15,'','Rubiataba',0,'5218904'),
	(883,15,'','Sanclerlândia',0,'5219001'),
	(884,15,'','Santa Bárbara de Goiás',0,'5219100'),
	(885,15,'','Santa Cruz de Goiás',0,'5219209'),
	(886,15,'','Santa Fé de Goiás',0,'5219258'),
	(887,15,'','Santa Helena de Goiás',0,'5219308'),
	(888,15,'','Santa Rita do Araguaia',0,'5219407'),
	(889,15,'','Santa Rita do Novo Destino',0,'5219456'),
	(890,15,'','Santa Rosa de Goiás',0,'5219506'),
	(891,15,'','Santa Tereza de Goiás',0,'5219605'),
	(892,15,'','Santa Terezinha de Goiás',0,'5219704'),
	(893,15,'','Santo Antônio da Barra',0,'5219712'),
	(894,15,'','Santo Antônio de Goiás',0,'5219738'),
	(895,15,'','Santo Antônio do Descoberto',0,'5219753'),
	(896,15,'','São Francisco de Goiás',0,'5219902'),
	(897,15,'','São João da Paraúna',0,'5220058'),
	(898,15,'','São João d\'Aliança',0,NULL),
	(899,15,'','São Luís de Montes Belos',0,'5220108'),
	(900,15,'','São Luíz do Norte',0,'5220157'),
	(901,15,'','São Miguel do Araguaia',0,'5220207'),
	(902,15,'','São Miguel do Passa Quatro',0,'5220264'),
	(903,15,'','São Patrício',0,'5220280'),
	(904,15,'','Senador Canedo',0,'5220454'),
	(905,15,'','Serranópolis',0,'5220504'),
	(906,15,'','Silvânia',0,'5220603'),
	(907,15,'','Simolândia',0,'5220686'),
	(908,15,'','Sítio d\'Abadia',0,NULL),
	(909,15,'','Taquaral de Goiás',0,'5221007'),
	(910,15,'','Teresina de Goiás',0,'5221080'),
	(911,15,'','Terezópolis de Goiás',0,'5221197'),
	(912,15,'','Três Ranchos',0,'5221304'),
	(913,15,'','Trombas',0,'5221452'),
	(914,15,'','Turvânia',0,'5221502'),
	(915,15,'','Turvelândia',0,'5221551'),
	(916,15,'','Uirapuru',0,'5221577'),
	(917,15,'','Uruaçu',0,'5221601'),
	(918,15,'','Uruana',0,'5221700'),
	(919,15,'','Urutaí',0,'5221809'),
	(920,15,'','Valparaíso de Goiás',0,'5221858'),
	(921,15,'','Varjão',0,'5221908'),
	(922,15,'','Vianópolis',0,'5222005'),
	(923,15,'','Vicentinópolis',0,'5222054'),
	(924,15,'','Vila Boa',0,'5222203'),
	(925,15,'','Vila Propício',0,'5222302'),
	(926,31,'','EMBU DAS ARTES',0,'3515004'),
	(927,1,'','São Sebastião do Passé',0,'2929503'),
	(928,1,'','São Sebastião do Passé',0,'2929503'),
	(929,14,'ES','SERRA',0,'3205002');

/*!40000 ALTER TABLE `enderecos_cidades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela enderecos_estados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enderecos_estados`;

CREATE TABLE `enderecos_estados` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_enderecos_paises` bigint unsigned NOT NULL DEFAULT '0',
  `sigla` char(2) NOT NULL DEFAULT '',
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `codigo_area` varchar(10) NOT NULL DEFAULT '',
  `prefixo_celular` varchar(10) NOT NULL DEFAULT '',
  `codigo_ibge` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estados';

LOCK TABLES `enderecos_estados` WRITE;
/*!40000 ALTER TABLE `enderecos_estados` DISABLE KEYS */;

INSERT INTO `enderecos_estados` (`id`, `id_enderecos_paises`, `sigla`, `descricao`, `codigo_area`, `prefixo_celular`, `codigo_ibge`)
VALUES
	(1,1,'BA','Bahia','','','29'),
	(2,1,'RJ','Rio de Janeiro','','','33'),
	(8,1,'AC','Acre','','','12'),
	(9,1,'AL','Alagoas','','','27'),
	(10,1,'AP','Amapá','','','16'),
	(11,1,'AM','Amazonas','001','','13'),
	(12,1,'CE','Ceará','','','23'),
	(13,1,'DF','Distrito Federal','','','53'),
	(14,1,'ES','Espiríto Santo','','','32'),
	(15,1,'GO','Goiás','','','52'),
	(16,1,'MA','Maranhão','','','21'),
	(17,1,'MT','Mato Grosso','','','51'),
	(18,1,'MS','Mato Grosso do Sul','','','50'),
	(19,1,'MG','Minas Gerais','','','31'),
	(20,1,'PA','Pará','','','15'),
	(21,1,'PB','Paraíba','','','25'),
	(22,1,'PR','Paraná','','','41'),
	(23,1,'PE','Pernambuco','','','26'),
	(24,1,'PI','Piauí','','',NULL),
	(26,1,'RN','Rio Grande do Norte','','','24'),
	(27,1,'RS','Rio Grande do Sul','','','43'),
	(28,1,'RO','Rondônia','','','11'),
	(29,1,'RR','Roraima','','','14'),
	(30,1,'SC','Santa Catarina','','','42'),
	(31,1,'SP','São Paulo','1','','35'),
	(32,1,'SE','Sergipe','','','28'),
	(33,1,'TO','Tocantins','','','17');

/*!40000 ALTER TABLE `enderecos_estados` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela enderecos_paises
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enderecos_paises`;

CREATE TABLE `enderecos_paises` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `codigo_area` varchar(10) NOT NULL DEFAULT '',
  `sigla` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `enderecos_paises` WRITE;
/*!40000 ALTER TABLE `enderecos_paises` DISABLE KEYS */;

INSERT INTO `enderecos_paises` (`id`, `nome`, `codigo_area`, `sigla`)
VALUES
	(1,'Brasil','55','BRA'),
	(2,'África do Sul','',''),
	(3,'Albânia','',''),
	(4,'Alemanha','',''),
	(5,'Andorra','',''),
	(6,'Angola','',''),
	(7,'Anguilla','',''),
	(8,'Antártida','',''),
	(9,'Antígua e Barbuda','',''),
	(10,'Antilhas Holandesas','',''),
	(11,'Arábia Saudita','',''),
	(12,'Argélia','',''),
	(13,'Argentina','',''),
	(14,'Armênia','',''),
	(15,'Aruba','',''),
	(16,'Austrália','',''),
	(17,'Áustria','',''),
	(18,'Azerbaijão','',''),
	(19,'Bahamas','',''),
	(20,'Bahrein','',''),
	(21,'Bangladesh','',''),
	(22,'Barbados','',''),
	(23,'Belarus','',''),
	(24,'Bélgica','',''),
	(25,'Belize','',''),
	(26,'Benin','',''),
	(27,'Bermuda','',''),
	(28,'Bolívia','',''),
	(29,'Bósnia e Herzegovina','',''),
	(30,'Botsuana','',''),
	(31,'Afeganistão','',''),
	(32,'Brunei','',''),
	(33,'Bulgária','',''),
	(34,'Burkina Faso','',''),
	(35,'Burundi','',''),
	(36,'Butão','',''),
	(37,'Cabo Verde','',''),
	(38,'Camarões','',''),
	(39,'Camboja','',''),
	(40,'Canadá','',''),
	(41,'Catar','',''),
	(42,'Cazaquistão','',''),
	(43,'Chade','',''),
	(44,'Chile','',''),
	(45,'China','',''),
	(46,'Chipre','',''),
	(47,'Cidade do Vaticano (Santa Sé)','',''),
	(48,'Cingapura','',''),
	(49,'Colômbia','',''),
	(50,'Comores','',''),
	(51,'Congo','',''),
	(52,'Congo, República Popular do','',''),
	(53,'Coréia','',''),
	(54,'Coréia do Norte','',''),
	(55,'Costa do Marfim','',''),
	(56,'Costa Rica','',''),
	(57,'Croácia (Hrvatska)','',''),
	(58,'Cuba','',''),
	(59,'Dinamarca','',''),
	(60,'Djibuti','',''),
	(61,'Dominica','',''),
	(62,'Egito','',''),
	(63,'El Salvador','',''),
	(64,'Emirados Árabes Unidos','',''),
	(65,'Equador','',''),
	(66,'Eritréia','',''),
	(67,'Eslováquia','',''),
	(68,'Eslovênia','',''),
	(69,'Espanha','',''),
	(70,'Estados Unidos','',''),
	(71,'Estônia','',''),
	(72,'Etiópia','',''),
	(73,'Fiji','',''),
	(74,'Filipinas','',''),
	(75,'Finlândia','',''),
	(76,'França','',''),
	(77,'Gabão','',''),
	(78,'Gâmbia','',''),
	(79,'Gana','',''),
	(80,'Geórgia','',''),
	(81,'Gibraltar','',''),
	(82,'Grécia','',''),
	(83,'Grenada','',''),
	(84,'Groenlândia','',''),
	(85,'Guadalupe','',''),
	(86,'Guam','',''),
	(87,'Guatemala','',''),
	(88,'Guiana','',''),
	(89,'Guiana Francesa','',''),
	(90,'Guiné','',''),
	(91,'Guiné Equatorial','',''),
	(92,'Guiné-Bissau','',''),
	(93,'Haiti','',''),
	(94,'Holanda','',''),
	(95,'Honduras','',''),
	(96,'Hong Kong','',''),
	(97,'Hungria','',''),
	(98,'Iêmen','',''),
	(99,'Ilha Bouvet','',''),
	(100,'Ilha Norfolk','',''),
	(101,'Ilhas Cayman','',''),
	(102,'Ilhas Christmas','',''),
	(103,'Ilhas Cocos (Keeling)','',''),
	(104,'Ilhas Cook','',''),
	(105,'Ilhas Faroés','',''),
	(106,'Ilhas Geórgia do Sul e Sandwich do Sul','',''),
	(107,'Ilhas Heard e McDonald','',''),
	(108,'Ilhas Malvinas','',''),
	(109,'Ilhas Marianas do Norte','',''),
	(110,'Ilhas Marshall','',''),
	(111,'Ilhas Salomão','',''),
	(112,'Ilhas Svalbard e Jan Mayen','',''),
	(113,'Ilhas Turks e Caicos','',''),
	(114,'Ilhas Virgens Americanas','',''),
	(115,'Ilhas Virgens Britânicas','',''),
	(116,'Ilhas Wallis e Futuna','',''),
	(117,'Ãndia','',''),
	(118,'Indonésia','',''),
	(119,'Irã','',''),
	(120,'Iraque','',''),
	(121,'Irlanda','',''),
	(122,'Islândia','',''),
	(123,'Israel','',''),
	(124,'Itália','',''),
	(125,'Iugoslávia','',''),
	(126,'Jamaica','',''),
	(127,'Japão','',''),
	(128,'Jordânia','',''),
	(129,'Kiribati','',''),
	(130,'Kuwait','',''),
	(131,'Laos','',''),
	(132,'Lesoto','',''),
	(133,'Letônia','',''),
	(134,'Líbano','',''),
	(135,'Libéria','',''),
	(136,'Líbia','',''),
	(137,'Liechtenstein','',''),
	(138,'Lituânia','',''),
	(139,'Luxemburgo','',''),
	(140,'Macau','',''),
	(141,'Macedônia','',''),
	(142,'Madagascar','',''),
	(143,'Malásia','',''),
	(144,'Malaui','',''),
	(145,'Maldivas','',''),
	(146,'Mali','',''),
	(147,'Malta','',''),
	(148,'Marrocos','',''),
	(149,'Martinica','',''),
	(150,'Maurício','',''),
	(151,'Mauritânia','',''),
	(152,'Mayotte','',''),
	(153,'México','',''),
	(154,'Micronésia','',''),
	(155,'Moçambique','',''),
	(156,'Moldávia','',''),
	(157,'Mônaco','',''),
	(158,'Mongólia','',''),
	(159,'Montserrat','',''),
	(160,'Myanma','',''),
	(161,'Namíbia','',''),
	(162,'Nauru','',''),
	(163,'Nepal','',''),
	(164,'Nicarágua','',''),
	(165,'Níger','',''),
	(166,'Nigéria','',''),
	(167,'Niue','',''),
	(168,'Noruega','',''),
	(169,'Nova Caledônia','',''),
	(170,'Nova Zelândia','',''),
	(171,'Omã','',''),
	(172,'Palau','',''),
	(173,'Panamá','',''),
	(174,'Papua-Nova Guiné','',''),
	(175,'Paquistão','',''),
	(176,'Paraguai','',''),
	(177,'Peru','',''),
	(178,'Pitcairn','',''),
	(179,'Polinésia Francesa','',''),
	(180,'Polônia','',''),
	(181,'Porto Rico','',''),
	(182,'Portugal','',''),
	(183,'Quênia','',''),
	(184,'Quirguistão','',''),
	(185,'Reino Unido','',''),
	(186,'República Centro-Africana','',''),
	(187,'República Dominicana','',''),
	(188,'República Tcheca','',''),
	(189,'Reunião','',''),
	(190,'Romênia','',''),
	(191,'Ruanda','',''),
	(192,'Rússia','',''),
	(193,'Saara Ocidental','',''),
	(194,'Saint Kitts e Névis','',''),
	(195,'Samoa','',''),
	(196,'Samoa Americana','',''),
	(197,'San Marino','',''),
	(198,'Santa Helena','',''),
	(199,'Santa Lúcia','',''),
	(200,'São Tomé e Príncipe','',''),
	(201,'São Vicente e Granadinas','',''),
	(202,'Senegal','',''),
	(203,'Serra Leoa','',''),
	(204,'Seychelles','',''),
	(205,'Síria','',''),
	(206,'Somália','',''),
	(207,'Sri Lanka','',''),
	(208,'St. Pierre e Miquelon','',''),
	(209,'Suazilândia','',''),
	(210,'Sudão','',''),
	(211,'Suécia','',''),
	(212,'Suíça','',''),
	(213,'Suriname','',''),
	(214,'Tadjiquistão','',''),
	(215,'Tailândia','',''),
	(216,'Taiwan','',''),
	(217,'Tanzânia','',''),
	(218,'Território Britânico do Oceano Ãndico','',''),
	(219,'Territórios Franceses do Sul','',''),
	(220,'Territórios Insulares dos EUA','',''),
	(221,'Timor Oriental','',''),
	(222,'Togo','',''),
	(223,'Tokelau','',''),
	(224,'Tonga','',''),
	(225,'Trinidad e Tobago','',''),
	(226,'Tunísia','',''),
	(227,'Turcomenistão','',''),
	(228,'Turquia','',''),
	(229,'Tuvalu','',''),
	(230,'Ucrânia','',''),
	(231,'Uganda','',''),
	(232,'Uruguai','',''),
	(233,'Uzbequistão','',''),
	(234,'Vanuatu','',''),
	(235,'Venezuela','',''),
	(236,'Vietnã','',''),
	(237,'Zâmbia','',''),
	(238,'Zimbábue','','');

/*!40000 ALTER TABLE `enderecos_paises` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela equipamentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipamentos`;

CREATE TABLE `equipamentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo_barras` varchar(20) DEFAULT NULL,
  `id_tipos_equipamentos` bigint NOT NULL DEFAULT '0',
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  `ip_porta` varchar(50) DEFAULT NULL,
  `id_posicoes` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `COD_BARRAS` (`codigo_barras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela equipamentos_pessoas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipamentos_pessoas`;

CREATE TABLE `equipamentos_pessoas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_equipamentos` bigint DEFAULT '0',
  `id_pessoas` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela equipamentos_posicoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipamentos_posicoes`;

CREATE TABLE `equipamentos_posicoes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_equipamentos` bigint DEFAULT '0',
  `armazem` char(3) DEFAULT NULL,
  `modulo` char(3) DEFAULT NULL,
  `rua_de` char(10) DEFAULT '',
  `rua_ate` char(10) DEFAULT '',
  `predio_de` char(3) DEFAULT '',
  `predio_ate` char(3) DEFAULT '',
  `andar_de` char(3) DEFAULT '',
  `andar_ate` char(3) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela estados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estados`;

CREATE TABLE `estados` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_paises` bigint unsigned NOT NULL DEFAULT '0',
  `sigla` char(2) NOT NULL DEFAULT '',
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `codigo_area` varchar(10) NOT NULL DEFAULT '',
  `prefixo_celular` varchar(10) NOT NULL DEFAULT '',
  `codigo_ibge` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estados';

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;

INSERT INTO `estados` (`id`, `id_paises`, `sigla`, `descricao`, `codigo_area`, `prefixo_celular`, `codigo_ibge`)
VALUES
	(1,1,'BA','Bahia','','',NULL),
	(2,1,'RJ','Rio de Janeiro','','',NULL),
	(8,1,'AC','Acre','','',NULL),
	(9,1,'AL','Alagoas','','',NULL),
	(10,1,'AP','Amapá','','',NULL),
	(11,1,'AM','Amazonas','','',NULL),
	(12,1,'CE','Ceará','','',NULL),
	(13,1,'DF','Distrito Federal','','',NULL),
	(14,1,'ES','Espiríto Santo','','',NULL),
	(15,1,'GO','Goiás','','',NULL),
	(16,1,'MA','Maranhão','','',NULL),
	(17,1,'MT','Mato Grosso','','',NULL),
	(18,1,'MS','Mato Grosso do Sul','','',NULL),
	(19,1,'MG','Minas Gerais','','',NULL),
	(20,1,'PA','Pará','','',NULL),
	(21,1,'PB','Paraíba','','',NULL),
	(22,1,'PR','Paraná','','',NULL),
	(23,1,'PE','Pernambuco','','',NULL),
	(24,1,'PI','Piauí','','',NULL),
	(26,1,'RN','Rio Grande do Norte','','',NULL),
	(27,1,'RS','Rio Grande do Sul','','',NULL),
	(28,1,'RO','Rondônia','','',NULL),
	(29,1,'RR','Roraima','','',NULL),
	(30,1,'SC','Santa Catarina','','',NULL),
	(31,1,'SP','São Paulo','1','',NULL),
	(32,1,'SE','Sergipe','','',NULL),
	(33,1,'TO','Tocantins','','',NULL);

/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela etiquetas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etiquetas`;

CREATE TABLE `etiquetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT '''',
  `codigo` longtext,
  `ultima` bigint unsigned NOT NULL DEFAULT '0',
  `tamanho` varchar(15) NOT NULL DEFAULT '',
  `itens_por_etiqueta` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;

INSERT INTO `etiquetas` (`id`, `nome`, `codigo`, `ultima`, `tamanho`, `itens_por_etiqueta`)
VALUES
	(1,'UMA','^XA^PR3\n^FO20,020^A0N30,30^FD@empresa@^FS\n^FO300,020^A0N30,30^FD@15@^FS\n^FO690,020^A0N30,30^FD@3@^FS\n^FO0,47^GB810,1,3^FS\n\n^FO170,065^A0N55,55^FD@1@^FS\n^FO70,110^BY3^BQN,2,8^FDQA,@1@^FS\n^FO290,120^BY2^BC,170,N,N,N^SN@1@,0,Y^FS\n^FO270,150^A0N50,50^FD ^FS\n^FO0,298^GB810,1,3^FS\n\n^FO285,320^A0N30,40^FD@4@^FS\n^FO020,390^A0N28,28^FD@6@^FS\n^FO320,390^A0N28,28^FD@5@^FS\n^FO500,390^A0N28,28^FD@2@^FS\n\n^FO20,440^A0N25,23^FD@7@^FS\n^FO20,450^A0N25,25^FD@8@^FS\n^FO20,480^A0N25,25^FD@9@^FS\n^XZ',0,'4x2.36',0),
	(2,'Apartamento','^XA\n^LH40,04^PRA^FS\n^FO100,020^A0N30,30^FD@empresa@^FS\n^FO507,040^A0,32,20^FDMOD: ^FS^FO557,040^A0,32,48^FD@3@^FS\n^FO507,080^A0,32,20^FDRUA: ^FS^FO557,80^A0,32,48^FD@4@^FS\n^FO507,120^A0,32,20^FDPRD: ^FS^FO557,120^A0,32,48^FD@5@^FS\n^FO507,160^A0,32,20^FDAND: ^FS^FO557,160^A0,32,48^FD@6@^FS\n^FO507,200^A0,32,20^FDAPT: ^FS^FO557,200^A0,32,48^FD@7@^FS\n^FO10,060^BY2^BCN,150,Y,N^FD@1@^FS\n^XZ',0,'4x2.36',0),
	(3,'Box','^XA^PR3\n^FO220,020^A0N30,30^FD@empresa@^FS\n^FO245,060^A0N80,80^FDB   O   X^FS\n^FO213,130^BY3^BC,250,N,N,N^SN@1@,0,Y^FS\n^FO270,400^ADN,40,10^FR^FDDep:@2@ Mod:@3@ Box:@4@^FS\n^FO250,440^ADN,40,30^FR^FD@1@^FS\n^XZ',0,'4x2.36',0),
	(4,'SKU','^XA\n^LH40,04^PRA^FS\n^FO30,020^A0N30,30^FD@empresa@ - @1@^FS\n^FO30,060^BY2^BCN,150,Y,N^FD@1@^FS\n^XZ',0,'4x2.36',0),
	(5,'Posicao_blocado','^XA^PR3\n^FO350,060^A0N30,30^FDPOSICAO^FS\n^FO180,180^BY2^BC,125,N,N,N^FD@1@^FS\n^FO220,100^A0N50,50^FD@1@^FS\n^XZ',0,'4x2.36',0),
	(6,'Pessoa','^XA^PR3\n^FO20,020^A0N30,30^FD@empresa@^FS\n^FO650,020^A0N30,30^FDColaborador^FS\n^FO0,47^GB810,1,3^FS\n^FO60,065^A0N50,50^FB700,1,0,C,0^FD@2@^FS\n^FO210,110^BY3^BC,90,N,N,N^SN@1@,0,Y^FS\n^XZ',0,'4x2.36',0),
	(7,'UMA_Grande','^XA\n\n^FO0,020^FB1200,1,0,C,0^A0N70,70^FD@1@^FS\n^FO90,090^BY5^BC,200,N,N,N^SN@1@,0,Y^FS \n\n^FO690,320^FB500,1,0,L,0^A0N120,120^FD@16@^FS\n^FO690,420^BY3^BC,150,N,N,N^SN@16@,0,Y^FS \n\n^FO690,600^FB400,1,0,C,0^A0N50,50^FDData Impressao^FS\n^FO690,670^FB400,1,0,C,0^A0N60,60^FD@20@^FS\n^FO690,750^FB400,1,0,C,0^A0N60,60^FD@21@^FS\n\n\n^FO90,900^FB1040,4,0,C,0^A0N80,80^FD\n@22@\n^FS\n\n^FO90,1200^FB500,1,0,L,0^A0N50,50^FDLotes^FS\n\n^FO90,1280^FB500,6,0,L,0^A0N120,120^FD\n@17@\n^FS\n\n^FO640,1280^FB200,6,0,R,0^A0N120,120^FD\n@18@\n^FS\n\n^FO900,1280^FB300,6,0,L,0^A0N120,120^FD\n@19@\n^FS\n\n\n^FO90,320^BY4^BQN,2,10^FDQA,\n@23@\n^FS\n\n^XZ',0,'5.8x9',1),
	(8,'Posicao_vertical','^XA^PR3\n^FO350,060^A0N30,30^FDPOSICAO^FS\n^FO180,180^BY2^BC,125,N,N,N^FD@1@^FS\n^FO220,100^A0N50,50^FD@1@^FS\n^XZ',0,'4x2.36',0),
	(9,'Equipamento','^XA^PR3\n^FO20,020^A0N30,30^FD@empresa@^FS\n^FO650,020^A0N30,30^FDEquipamento^FS\n^FO0,47^GB810,1,3^FS\n^FO60,065^A0N50,50^FB700,1,0,C,0^FD@2@^FS\n^FO210,110^BY3^BC,90,N,N,N^SN@1@,0,Y^FS\n^XZ',0,'4x2.36',0);

/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela eventos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eventos`;

CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipos_eventos` bigint NOT NULL DEFAULT '0',
  `id_programacao` bigint NOT NULL DEFAULT '0',
  `id_posicoes` bigint NOT NULL DEFAULT '0',
  `id_umas` bigint NOT NULL DEFAULT '0',
  `id_itens_skus` bigint NOT NULL DEFAULT '0',
  `id_notas` bigint NOT NULL DEFAULT '0',
  `id_pessoas_cadastrou` bigint NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint NOT NULL DEFAULT '0',
  `id_pessoas_atualizou` bigint NOT NULL DEFAULT '0',
  `id_pessoas_iniciou` bigint NOT NULL DEFAULT '0',
  `id_pessoas_finalizou` bigint NOT NULL DEFAULT '0',
  `id_pessoas_operador` bigint NOT NULL DEFAULT '0',
  `id_equipamentos` bigint NOT NULL DEFAULT '0',
  `id_posicoes_posicionar` bigint NOT NULL DEFAULT '0',
  `id_eventos_prioridade` bigint NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_execucao_inicio` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_finalizado` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `ordem` int NOT NULL DEFAULT '0',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `expedicao` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `OS` (`id_programacao`),
  KEY `FINALIZADO` (`finalizado`),
  KEY `ATIVO` (`ativo`),
  KEY `CANCELADO` (`cancelado`),
  KEY `TIPO_EVENTO` (`id_tipos_eventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_contagens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_contagens`;

CREATE TABLE `expurgo_contagens` (
  `id` bigint unsigned NOT NULL,
  `id_programacao` bigint unsigned DEFAULT '0',
  `id_notas` bigint unsigned DEFAULT '0',
  `contagem` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_contagens_umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_contagens_umas`;

CREATE TABLE `expurgo_contagens_umas` (
  `id` bigint unsigned NOT NULL,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas` bigint unsigned DEFAULT '0',
  `id_tipos_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_contagens` bigint unsigned NOT NULL DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_barras` varchar(40) NOT NULL DEFAULT '',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `uma` varchar(20) NOT NULL DEFAULT '',
  `situacao` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IX_umas_cod` (`codigo_barras`),
  KEY `IX_umas_prog` (`id_programacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_contagens_umas_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_contagens_umas_itens`;

CREATE TABLE `expurgo_contagens_umas_itens` (
  `id` bigint unsigned NOT NULL,
  `id_contagens_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas_origem` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `tipo` char(1) NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `faturar` tinyint(1) NOT NULL DEFAULT '0',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `avariada` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  `data` datetime NOT NULL,
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_validade_antiga` date NOT NULL DEFAULT '0000-00-00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `m3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `temperatura` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor` decimal(20,2) NOT NULL DEFAULT '0.00',
  `quantidade_temp` decimal(20,6) DEFAULT NULL,
  `lote` varchar(30) NOT NULL,
  `serial` varchar(40) NOT NULL DEFAULT '',
  `inventario` tinyint unsigned DEFAULT '0',
  `entrada_dinamica` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_contagens` (`id_contagens_umas`),
  KEY `IX_programacao` (`id_programacao`),
  KEY `IX_armazens` (`id_armazens`),
  KEY `IX_veiculos_acessos` (`id_veiculos_acessos`),
  KEY `IX_notas_itens` (`id_notas_itens`),
  KEY `IX_itens_skus` (`id_itens_skus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_itens`;

CREATE TABLE `expurgo_itens` (
  `id` bigint unsigned NOT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  `apto` tinyint(1) DEFAULT '0',
  `faz_picking` tinyint(1) DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime DEFAULT '0000-00-00 00:00:00',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_fornecedor` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned DEFAULT '0',
  `id_grupos` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos` bigint unsigned NOT NULL DEFAULT '0',
  `id_prioridades_saida` bigint unsigned NOT NULL,
  `id_itens_skus_pedido` bigint unsigned DEFAULT '0',
  `id_itens_skus_operacao` bigint unsigned DEFAULT '0',
  `id_itens_skus_reposicao_picking` bigint unsigned DEFAULT '0',
  `codigo` varchar(20) NOT NULL,
  `codigo_anterior` varchar(60) DEFAULT NULL,
  `codigo_barras` varchar(60) DEFAULT NULL,
  `codigo_barras_alternativo` varchar(60) DEFAULT NULL,
  `ncm` varchar(11) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` longtext NOT NULL,
  `prazo_validade` int DEFAULT NULL,
  `shelf_life` int NOT NULL DEFAULT '0',
  `picking_quantidade_minima` int DEFAULT '0',
  `picking_quantidade_maxima` int DEFAULT '0',
  `temperatura_ideal` double DEFAULT NULL,
  `temperatura_limite` double DEFAULT NULL,
  `observacoes` text,
  `exige_lote` tinyint(1) DEFAULT '0',
  `exige_data_fabricacao` tinyint(1) DEFAULT '0',
  `exige_data_validade` tinyint(1) DEFAULT '0',
  `id_grupos_combustivel` bigint DEFAULT '0',
  `regra_posicionamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_propr` (`id_pessoas_proprietario`),
  KEY `IX_grupos` (`id_grupos`),
  KEY `IX_tipos` (`id_tipos`),
  KEY `ativo` (`ativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_itens_areas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_itens_areas`;

CREATE TABLE `expurgo_itens_areas` (
  `id` bigint unsigned NOT NULL,
  `id_itens` bigint unsigned DEFAULT '0',
  `id_areas` bigint unsigned DEFAULT '0',
  `ativo` tinyint unsigned DEFAULT '1',
  `prioridade` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_itens_skus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_itens_skus`;

CREATE TABLE `expurgo_itens_skus` (
  `id` bigint unsigned NOT NULL,
  `ativo` tinyint unsigned DEFAULT '0',
  `id_itens` bigint unsigned NOT NULL,
  `id_unidades` bigint unsigned NOT NULL DEFAULT '1',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned DEFAULT '0',
  `id_itens_skus_intermediario` bigint DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime DEFAULT '0000-00-00 00:00:00',
  `codigo` varchar(30) NOT NULL,
  `codigo_anterior` varchar(60) DEFAULT NULL,
  `codigo_barras` varchar(60) DEFAULT '',
  `codigo_barras_alternativo` varchar(60) DEFAULT '',
  `nome` varchar(30) NOT NULL,
  `quantidade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `peso_liquido` decimal(10,4) DEFAULT '0.0000',
  `peso_bruto` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `largura` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `altura` decimal(10,4) DEFAULT '0.0000',
  `comprimento` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `palete_lastro` decimal(10,4) DEFAULT '0.0000',
  `palete_altura` decimal(10,4) DEFAULT '0.0000',
  `empilhamento_maximo` int DEFAULT '0',
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `invisivel` tinyint(1) DEFAULT '0',
  `sigla` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IX_itens_skus_cod` (`codigo`),
  KEY `IX_itens_skus_codbar` (`codigo_barras`),
  KEY `IX_itens` (`id_itens`),
  KEY `IX_unidades` (`id_unidades`),
  KEY `codigo_alternativo` (`codigo_barras_alternativo`),
  KEY `ativo` (`ativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_programacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_programacao`;

CREATE TABLE `expurgo_programacao` (
  `id` bigint unsigned NOT NULL,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_reservou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_separou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_executou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_destinatario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_motorista` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_colaborador` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_conferiu_saida` bigint DEFAULT '0',
  `id_veiculos` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_areas` bigint unsigned NOT NULL DEFAULT '0',
  `id_areas_direcionar` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_apanha` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_origem` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_grupos` bigint unsigned NOT NULL DEFAULT '0',
  `data_criacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_previsao_inicial` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_previsao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_execucao_inicio` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_execucao_final` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_conferencia_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `data_reservada` datetime DEFAULT '0000-00-00 00:00:00',
  `data_separada` datetime DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `os` char(20) NOT NULL DEFAULT '',
  `numero_cliente` varchar(200) NOT NULL,
  `numseq` varchar(40) NOT NULL DEFAULT '',
  `recno` bigint NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `liberada` tinyint(1) DEFAULT '1',
  `iniciada` tinyint(1) NOT NULL DEFAULT '0',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `executada` tinyint(1) NOT NULL DEFAULT '0',
  `importada` tinyint DEFAULT '0',
  `divergencia` tinyint(1) NOT NULL DEFAULT '0',
  `conferida_saida` tinyint DEFAULT '0',
  `apanha_concluida` tinyint(1) DEFAULT '0',
  `carregando` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_reserva` tinyint(1) DEFAULT '0' COMMENT '0 - Não reservada\n1 - Reserva Manual\n2 - Reserva Normal\n',
  `entrada_dinamica` tinyint(1) DEFAULT '0',
  `crossdocking` tinyint(1) DEFAULT '0',
  `usar_saldos` tinyint(1) DEFAULT '1',
  `observacoes` longtext NOT NULL,
  `ocorrencias` longtext NOT NULL,
  `lote` varchar(50) NOT NULL DEFAULT '',
  `posicionar_em` varchar(30) DEFAULT '',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `prioridade` bigint NOT NULL DEFAULT '0',
  `reservando` tinyint(1) DEFAULT '0',
  `apanha_simplificada` tinyint(1) DEFAULT '0',
  `quantidade_programada` decimal(20,6) DEFAULT '0.000000',
  `quantidade_reservada` decimal(20,6) DEFAULT '0.000000',
  `detalhes_nfe` text,
  `criar_eventos` tinyint(1) DEFAULT '0',
  `liberada_saida` tinyint(1) DEFAULT '0',
  `rota` varchar(255) DEFAULT NULL,
  `usa_uma_virgem` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `OS` (`os`),
  KEY `PROPRIETARIO` (`id_pessoas_proprietario`),
  KEY `DATA_PREVISAO` (`data_previsao`),
  KEY `NUMERO_CLIENTE` (`numero_cliente`(191)),
  KEY `NUMSEQ` (`numseq`),
  KEY `RECNO` (`recno`),
  KEY `APANHA` (`id_programacao_apanha`),
  KEY `ORIGEM` (`id_programacao_origem`),
  KEY `CANCELADA` (`cancelada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_programacao_atividades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_programacao_atividades`;

CREATE TABLE `expurgo_programacao_atividades` (
  `id` bigint unsigned NOT NULL,
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_atividades` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `cancelada` tinyint unsigned DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `descricao` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `PESSOA` (`id_pessoas`),
  KEY `DATA` (`data`),
  KEY `TIPO` (`id_tipos_atividades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_programacao_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_programacao_itens`;

CREATE TABLE `expurgo_programacao_itens` (
  `id` bigint unsigned NOT NULL,
  `id_programacao` bigint NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned DEFAULT '0',
  `id_programacao_itens_produzir` bigint DEFAULT '0',
  `conferida` tinyint(1) NOT NULL DEFAULT '0',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `quantidade_conferida` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `quantidade_aceita` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,3) NOT NULL DEFAULT '0.000',
  `m3` decimal(10,3) NOT NULL DEFAULT '0.000',
  `palete_lastro` int NOT NULL DEFAULT '0',
  `palete_altura` int NOT NULL DEFAULT '0',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `valor` decimal(20,10) DEFAULT '0.0000000000',
  `uma` char(20) NOT NULL DEFAULT '',
  `uma_destino` char(20) NOT NULL DEFAULT '',
  `recno` bigint NOT NULL DEFAULT '0',
  `grupo` varchar(50) NOT NULL DEFAULT '',
  `lote` varchar(20) NOT NULL DEFAULT '',
  `umas_necessarias` int DEFAULT '0',
  `numero_nota` varchar(30) DEFAULT '',
  `gerou_entrada_dinamica` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `IX_id_notas_tens` (`id_notas_itens`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_umas`;

CREATE TABLE `expurgo_umas` (
  `id` bigint unsigned NOT NULL,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes_posicionar` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus_associar` bigint DEFAULT '0',
  `id_tipos_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_contagens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_conferiu` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_conferiu_saida` bigint DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_ativacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_desativacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_conferencia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_conferencia_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `data_paletizacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_filmagem` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fumigacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_saida` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `posicionada` tinyint(1) DEFAULT '0',
  `conferida` tinyint(1) NOT NULL DEFAULT '0',
  `conferida_saida` tinyint DEFAULT '0',
  `liberada` tinyint(1) DEFAULT '1',
  `paletizada` tinyint(1) DEFAULT '0',
  `filmada` tinyint(1) DEFAULT '0',
  `fumigada` tinyint(1) DEFAULT '0',
  `indivisivel` tinyint(1) DEFAULT '0',
  `imobilizada` tinyint(1) DEFAULT '0',
  `produzida` tinyint(1) DEFAULT '0',
  `incompleta` tinyint(1) DEFAULT '0',
  `codigo_barras` varchar(20) NOT NULL DEFAULT '',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `situacao` varchar(20) NOT NULL DEFAULT '',
  `complemento` text,
  `ordem` int NOT NULL DEFAULT '0',
  `ordem_movimentacao` int DEFAULT '0',
  `saida_avulsa` tinyint(1) DEFAULT '0',
  `id_pessoas_posicionou` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_umas_cod` (`codigo_barras`),
  KEY `IX_umas_prog` (`id_programacao`),
  KEY `ATIVO` (`ativo`),
  KEY `POSICAO` (`id_posicoes`),
  KEY `POSICIONAR` (`id_posicoes_posicionar`),
  KEY `IMOBILIZADA` (`imobilizada`),
  KEY `COD_EXTERNO` (`codigo_externo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_umas_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_umas_itens`;

CREATE TABLE `expurgo_umas_itens` (
  `id` bigint unsigned NOT NULL,
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas_origem` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens_saida` bigint DEFAULT '0',
  `id_notas_programacao` bigint DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_operacao` bigint DEFAULT '0',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `tipo` char(1) NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `faturar` tinyint(1) NOT NULL DEFAULT '0',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `avariada` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  `entrada` tinyint(1) DEFAULT '0',
  `saida` tinyint(1) DEFAULT '0',
  `data` datetime NOT NULL,
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_validade_antiga` date NOT NULL DEFAULT '0000-00-00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `m3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `temperatura` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `quantidade_temp` decimal(20,6) DEFAULT NULL,
  `lote` varchar(30) NOT NULL,
  `serial` varchar(40) NOT NULL DEFAULT '',
  `inventario` tinyint unsigned DEFAULT '0',
  `observacoes` varchar(60) DEFAULT NULL,
  `ajuste_saldo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_umas` (`id_umas`),
  KEY `IX_programacao` (`id_programacao`),
  KEY `IX_armazens` (`id_armazens`),
  KEY `IX_veiculos_acessos` (`id_veiculos_acessos`),
  KEY `IX_itens_skus` (`id_itens_skus`),
  KEY `CODIGO_EXTERNO` (`codigo_externo`),
  KEY `PROPRIETARIO` (`id_pessoas_proprietario`),
  KEY `CANCELADA` (`cancelada`),
  KEY `IX_notas_itens` (`id_notas_itens`),
  KEY `FLAGS` (`reservada`,`separada`,`avariada`,`bloqueada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_umas_movimentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_umas_movimentos`;

CREATE TABLE `expurgo_umas_movimentos` (
  `id` bigint unsigned NOT NULL,
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas_para` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `tipo` char(1) NOT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `descricao` varchar(60) DEFAULT NULL,
  `lote` varchar(60) DEFAULT NULL,
  `lote_para` varchar(60) DEFAULT NULL,
  `data_validade` date DEFAULT '0000-00-00',
  `data_fabricacao` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`),
  KEY `DATA` (`data`),
  KEY `TIPO` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_veiculos_acessos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_veiculos_acessos`;

CREATE TABLE `expurgo_veiculos_acessos` (
  `id` bigint unsigned NOT NULL,
  `id_veiculos` bigint unsigned NOT NULL,
  `id_armazens` bigint DEFAULT '0',
  `id_pessoas_transportadora` bigint unsigned NOT NULL,
  `id_pessoas_cliente` bigint unsigned NOT NULL,
  `id_pessoas_autorizou_entrada` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_autorizou_saida` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_motorista` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_operacoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_crachas` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_entrada` bigint DEFAULT NULL,
  `id_pessoas_saida` bigint DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_chegada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_autorizacao_entrada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_entrada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_inicio_operacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_final_operacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_autorizacao_saida` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_saida` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `motivo` varchar(60) DEFAULT NULL,
  `peso_entrada` decimal(20,8) DEFAULT '0.00000000',
  `peso_saida` decimal(20,8) DEFAULT '0.00000000',
  `lacre_entrada` varchar(45) NOT NULL,
  `lacre_saida` varchar(45) NOT NULL,
  `observacoes` text,
  `motivo_cancelamento` varchar(50) DEFAULT NULL,
  `placa_adicional` char(23) DEFAULT NULL,
  `placa_adicional2` char(7) DEFAULT NULL,
  `container_1` char(11) DEFAULT NULL,
  `container_2` char(11) DEFAULT NULL,
  `transporte_tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela expurgo_veiculos_acessos_programacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expurgo_veiculos_acessos_programacoes`;

CREATE TABLE `expurgo_veiculos_acessos_programacoes` (
  `id` bigint unsigned NOT NULL,
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `programacao` (`id_programacao`),
  KEY `id_veiculos_acessos` (`id_veiculos_acessos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela faturamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faturamento`;

CREATE TABLE `faturamento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT '0000-00-00 00:00:00',
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_algoritimo` bigint unsigned NOT NULL DEFAULT '0',
  `id_grupos` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `quantidade` double NOT NULL DEFAULT '0',
  `quantidade_umas` double NOT NULL DEFAULT '0',
  `peso_bruto` double NOT NULL DEFAULT '0',
  `peso_liquido` double NOT NULL DEFAULT '0',
  `m2` double NOT NULL DEFAULT '0',
  `m3` double NOT NULL DEFAULT '0',
  `temperatura` double NOT NULL DEFAULT '0',
  `valor` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_access`;

CREATE TABLE `gfw_access` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(45) DEFAULT '',
  `try` tinyint(1) DEFAULT '0',
  `login` tinyint(1) DEFAULT '0',
  `logout` tinyint(1) DEFAULT '0',
  `details` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDD` (`idd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_countries`;

CREATE TABLE `gfw_countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned NOT NULL DEFAULT '0',
  `iso2` char(2) DEFAULT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `long_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  `locale` char(5) DEFAULT NULL,
  `timezone` int DEFAULT '0',
  `locale_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `LOCALES` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_countries` WRITE;
/*!40000 ALTER TABLE `gfw_countries` DISABLE KEYS */;

INSERT INTO `gfw_countries` (`id`, `idd`, `iso2`, `name`, `long_name`, `iso3`, `numcode`, `un_member`, `calling_code`, `cctld`, `locale`, `timezone`, `locale_default`)
VALUES
	(1,0,'AF','Afghanistan','Islamic Republic of Afghanistan','AFG','004','yes','93','.af','en',0,0),
	(2,0,'AX','Aland Islands','&Aring;land Islands','ALA','248','no','358','.ax','en',0,0),
	(3,0,'AL','Albania','Republic of Albania','ALB','008','yes','355','.al','en',0,0),
	(4,0,'DZ','Algeria','People\'s Democratic Republic of Algeria','DZA','012','yes','213','.dz','en',0,0),
	(5,0,'AS','American Samoa','American Samoa','ASM','016','no','1+684','.as','en',0,0),
	(6,0,'AD','Andorra','Principality of Andorra','AND','020','yes','376','.ad','en',0,0),
	(7,0,'AO','Angola','Republic of Angola','AGO','024','yes','244','.ao','pt_BR',0,0),
	(8,0,'AI','Anguilla','Anguilla','AIA','660','no','1+264','.ai','en',0,0),
	(9,0,'AQ','Antarctica','Antarctica','ATA','010','no','672','.aq','en',0,0),
	(10,0,'AG','Antigua and Barbuda','Antigua and Barbuda','ATG','028','yes','1+268','.ag','en',0,0),
	(11,0,'AR','Argentina','Argentine Republic','ARG','032','yes','54','.ar','en',0,0),
	(12,0,'AM','Armenia','Republic of Armenia','ARM','051','yes','374','.am','en',0,0),
	(13,0,'AW','Aruba','Aruba','ABW','533','no','297','.aw','en',0,0),
	(14,0,'AU','Australia','Commonwealth of Australia','AUS','036','yes','61','.au','en',0,0),
	(15,0,'AT','Austria','Republic of Austria','AUT','040','yes','43','.at','en',0,0),
	(16,0,'AZ','Azerbaijan','Republic of Azerbaijan','AZE','031','yes','994','.az','en',0,0),
	(17,0,'BS','Bahamas','Commonwealth of The Bahamas','BHS','044','yes','1+242','.bs','en',0,0),
	(18,0,'BH','Bahrain','Kingdom of Bahrain','BHR','048','yes','973','.bh','en',0,0),
	(19,0,'BD','Bangladesh','People\'s Republic of Bangladesh','BGD','050','yes','880','.bd','en',0,0),
	(20,0,'BB','Barbados','Barbados','BRB','052','yes','1+246','.bb','en',0,0),
	(21,0,'BY','Belarus','Republic of Belarus','BLR','112','yes','375','.by','en',0,0),
	(22,0,'BE','Belgium','Kingdom of Belgium','BEL','056','yes','32','.be','en',0,0),
	(23,0,'BZ','Belize','Belize','BLZ','084','yes','501','.bz','en',0,0),
	(24,0,'BJ','Benin','Republic of Benin','BEN','204','yes','229','.bj','en',0,0),
	(25,0,'BM','Bermuda','Bermuda Islands','BMU','060','no','1+441','.bm','en',0,0),
	(26,0,'BT','Bhutan','Kingdom of Bhutan','BTN','064','yes','975','.bt','en',0,0),
	(27,0,'BO','Bolivia','Plurinational State of Bolivia','BOL','068','yes','591','.bo','en',0,0),
	(28,0,'BQ','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius and Saba','BES','535','no','599','.bq','en',0,0),
	(29,0,'BA','Bosnia and Herzegovina','Bosnia and Herzegovina','BIH','070','yes','387','.ba','en',0,0),
	(30,0,'BW','Botswana','Republic of Botswana','BWA','072','yes','267','.bw','en',0,0),
	(31,0,'BV','Bouvet Island','Bouvet Island','BVT','074','no','NONE','.bv','en',0,0),
	(32,0,'BR','Brasil','Federative Republic of Brazil','BRA','076','yes','55','.br','pt_BR',0,1),
	(33,0,'IO','British Indian Ocean Territory','British Indian Ocean Territory','IOT','086','no','246','.io','en',0,0),
	(34,0,'BN','Brunei','Brunei Darussalam','BRN','096','yes','673','.bn','en',0,0),
	(35,0,'BG','Bulgaria','Republic of Bulgaria','BGR','100','yes','359','.bg','en',0,0),
	(36,0,'BF','Burkina Faso','Burkina Faso','BFA','854','yes','226','.bf','en',0,0),
	(37,0,'BI','Burundi','Republic of Burundi','BDI','108','yes','257','.bi','en',0,0),
	(38,0,'KH','Cambodia','Kingdom of Cambodia','KHM','116','yes','855','.kh','en',0,0),
	(39,0,'CM','Cameroon','Republic of Cameroon','CMR','120','yes','237','.cm','en',0,0),
	(40,0,'CA','Canada','Canada','CAN','124','yes','1','.ca','en',0,0),
	(41,0,'CV','Cape Verde','Republic of Cape Verde','CPV','132','yes','238','.cv','pt_BR',0,0),
	(42,0,'KY','Cayman Islands','The Cayman Islands','CYM','136','no','1+345','.ky','en',0,0),
	(43,0,'CF','Central African Republic','Central African Republic','CAF','140','yes','236','.cf','en',0,0),
	(44,0,'TD','Chad','Republic of Chad','TCD','148','yes','235','.td','en',0,0),
	(45,0,'CL','Chile','Republic of Chile','CHL','152','yes','56','.cl','en',0,0),
	(46,0,'CN','China','People\'s Republic of China','CHN','156','yes','86','.cn','en',0,0),
	(47,0,'CX','Christmas Island','Christmas Island','CXR','162','no','61','.cx','en',0,0),
	(48,0,'CC','Cocos (Keeling) Islands','Cocos (Keeling) Islands','CCK','166','no','61','.cc','en',0,0),
	(49,0,'CO','Colombia','Republic of Colombia','COL','170','yes','57','.co','en',0,0),
	(50,0,'KM','Comoros','Union of the Comoros','COM','174','yes','269','.km','en',0,0),
	(51,0,'CG','Congo','Republic of the Congo','COG','178','yes','242','.cg','en',0,0),
	(52,0,'CK','Cook Islands','Cook Islands','COK','184','some','682','.ck','en',0,0),
	(53,0,'CR','Costa Rica','Republic of Costa Rica','CRI','188','yes','506','.cr','en',0,0),
	(54,0,'CI','Cote d\'ivoire (Ivory Coast)','Republic of C&ocirc;te D\'Ivoire (Ivory Coast)','CIV','384','yes','225','.ci','en',0,0),
	(55,0,'HR','Croatia','Republic of Croatia','HRV','191','yes','385','.hr','en',0,0),
	(56,0,'CU','Cuba','Republic of Cuba','CUB','192','yes','53','.cu','en',0,0),
	(57,0,'CW','Curacao','Cura&ccedil;ao','CUW','531','no','599','.cw','en',0,0),
	(58,0,'CY','Cyprus','Republic of Cyprus','CYP','196','yes','357','.cy','en',0,0),
	(59,0,'CZ','Czech Republic','Czech Republic','CZE','203','yes','420','.cz','en',0,0),
	(60,0,'CD','Democratic Republic of the Congo','Democratic Republic of the Congo','COD','180','yes','243','.cd','en',0,0),
	(61,0,'DK','Denmark','Kingdom of Denmark','DNK','208','yes','45','.dk','en',0,0),
	(62,0,'DJ','Djibouti','Republic of Djibouti','DJI','262','yes','253','.dj','en',0,0),
	(63,0,'DM','Dominica','Commonwealth of Dominica','DMA','212','yes','1+767','.dm','en',0,0),
	(64,0,'DO','Dominican Republic','Dominican Republic','DOM','214','yes','1+809, 8','.do','en',0,0),
	(65,0,'EC','Ecuador','Republic of Ecuador','ECU','218','yes','593','.ec','en',0,0),
	(66,0,'EG','Egypt','Arab Republic of Egypt','EGY','818','yes','20','.eg','en',0,0),
	(67,0,'SV','El Salvador','Republic of El Salvador','SLV','222','yes','503','.sv','en',0,0),
	(68,0,'GQ','Equatorial Guinea','Republic of Equatorial Guinea','GNQ','226','yes','240','.gq','en',0,0),
	(69,0,'ER','Eritrea','State of Eritrea','ERI','232','yes','291','.er','en',0,0),
	(70,0,'EE','Estonia','Republic of Estonia','EST','233','yes','372','.ee','en',0,0),
	(71,0,'ET','Ethiopia','Federal Democratic Republic of Ethiopia','ETH','231','yes','251','.et','en',0,0),
	(72,0,'FK','Falkland Islands (Malvinas)','The Falkland Islands (Malvinas)','FLK','238','no','500','.fk','en',0,0),
	(73,0,'FO','Faroe Islands','The Faroe Islands','FRO','234','no','298','.fo','en',0,0),
	(74,0,'FJ','Fiji','Republic of Fiji','FJI','242','yes','679','.fj','en',0,0),
	(75,0,'FI','Finland','Republic of Finland','FIN','246','yes','358','.fi','en',0,0),
	(76,0,'FR','France','French Republic','FRA','250','yes','33','.fr','en',0,0),
	(77,0,'GF','French Guiana','French Guiana','GUF','254','no','594','.gf','en',0,0),
	(78,0,'PF','French Polynesia','French Polynesia','PYF','258','no','689','.pf','en',0,0),
	(79,0,'TF','French Southern Territories','French Southern Territories','ATF','260','no',NULL,'.tf','en',0,0),
	(80,0,'GA','Gabon','Gabonese Republic','GAB','266','yes','241','.ga','en',0,0),
	(81,0,'GM','Gambia','Republic of The Gambia','GMB','270','yes','220','.gm','en',0,0),
	(82,0,'GE','Georgia','Georgia','GEO','268','yes','995','.ge','en',0,0),
	(83,0,'DE','Germany','Federal Republic of Germany','DEU','276','yes','49','.de','en',0,0),
	(84,0,'GH','Ghana','Republic of Ghana','GHA','288','yes','233','.gh','en',0,0),
	(85,0,'GI','Gibraltar','Gibraltar','GIB','292','no','350','.gi','en',0,0),
	(86,0,'GR','Greece','Hellenic Republic','GRC','300','yes','30','.gr','en',0,0),
	(87,0,'GL','Greenland','Greenland','GRL','304','no','299','.gl','en',0,0),
	(88,0,'GD','Grenada','Grenada','GRD','308','yes','1+473','.gd','en',0,0),
	(89,0,'GP','Guadaloupe','Guadeloupe','GLP','312','no','590','.gp','en',0,0),
	(90,0,'GU','Guam','Guam','GUM','316','no','1+671','.gu','en',0,0),
	(91,0,'GT','Guatemala','Republic of Guatemala','GTM','320','yes','502','.gt','en',0,0),
	(92,0,'GG','Guernsey','Guernsey','GGY','831','no','44','.gg','en',0,0),
	(93,0,'GN','Guinea','Republic of Guinea','GIN','324','yes','224','.gn','en',0,0),
	(94,0,'GW','Guinea-Bissau','Republic of Guinea-Bissau','GNB','624','yes','245','.gw','pt_BR',0,0),
	(95,0,'GY','Guyana','Co-operative Republic of Guyana','GUY','328','yes','592','.gy','en',0,0),
	(96,0,'HT','Haiti','Republic of Haiti','HTI','332','yes','509','.ht','en',0,0),
	(97,0,'HM','Heard Island and McDonald Islands','Heard Island and McDonald Islands','HMD','334','no','NONE','.hm','en',0,0),
	(98,0,'HN','Honduras','Republic of Honduras','HND','340','yes','504','.hn','en',0,0),
	(99,0,'HK','Hong Kong','Hong Kong','HKG','344','no','852','.hk','en',0,0),
	(100,0,'HU','Hungary','Hungary','HUN','348','yes','36','.hu','en',0,0),
	(101,0,'IS','Iceland','Republic of Iceland','ISL','352','yes','354','.is','en',0,0),
	(102,0,'IN','India','Republic of India','IND','356','yes','91','.in','en',0,0),
	(103,0,'ID','Indonesia','Republic of Indonesia','IDN','360','yes','62','.id','en',0,0),
	(104,0,'IR','Iran','Islamic Republic of Iran','IRN','364','yes','98','.ir','en',0,0),
	(105,0,'IQ','Iraq','Republic of Iraq','IRQ','368','yes','964','.iq','en',0,0),
	(106,0,'IE','Ireland','Ireland','IRL','372','yes','353','.ie','en',0,0),
	(107,0,'IM','Isle of Man','Isle of Man','IMN','833','no','44','.im','en',0,0),
	(108,0,'IL','Israel','State of Israel','ISR','376','yes','972','.il','en',0,0),
	(109,0,'IT','Italy','Italian Republic','ITA','380','yes','39','.jm','en',0,0),
	(110,0,'JM','Jamaica','Jamaica','JAM','388','yes','1+876','.jm','en',0,0),
	(111,0,'JP','Japan','Japan','JPN','392','yes','81','.jp','en',0,0),
	(112,0,'JE','Jersey','The Bailiwick of Jersey','JEY','832','no','44','.je','en',0,0),
	(113,0,'JO','Jordan','Hashemite Kingdom of Jordan','JOR','400','yes','962','.jo','en',0,0),
	(114,0,'KZ','Kazakhstan','Republic of Kazakhstan','KAZ','398','yes','7','.kz','en',0,0),
	(115,0,'KE','Kenya','Republic of Kenya','KEN','404','yes','254','.ke','en',0,0),
	(116,0,'KI','Kiribati','Republic of Kiribati','KIR','296','yes','686','.ki','en',0,0),
	(117,0,'XK','Kosovo','Republic of Kosovo','---','---','some','381','','en',0,0),
	(118,0,'KW','Kuwait','State of Kuwait','KWT','414','yes','965','.kw','en',0,0),
	(119,0,'KG','Kyrgyzstan','Kyrgyz Republic','KGZ','417','yes','996','.kg','en',0,0),
	(120,0,'LA','Laos','Lao People\'s Democratic Republic','LAO','418','yes','856','.la','en',0,0),
	(121,0,'LV','Latvia','Republic of Latvia','LVA','428','yes','371','.lv','en',0,0),
	(122,0,'LB','Lebanon','Republic of Lebanon','LBN','422','yes','961','.lb','en',0,0),
	(123,0,'LS','Lesotho','Kingdom of Lesotho','LSO','426','yes','266','.ls','en',0,0),
	(124,0,'LR','Liberia','Republic of Liberia','LBR','430','yes','231','.lr','en',0,0),
	(125,0,'LY','Libya','Libya','LBY','434','yes','218','.ly','en',0,0),
	(126,0,'LI','Liechtenstein','Principality of Liechtenstein','LIE','438','yes','423','.li','en',0,0),
	(127,0,'LT','Lithuania','Republic of Lithuania','LTU','440','yes','370','.lt','en',0,0),
	(128,0,'LU','Luxembourg','Grand Duchy of Luxembourg','LUX','442','yes','352','.lu','en',0,0),
	(129,0,'MO','Macao','The Macao Special Administrative Region','MAC','446','no','853','.mo','pt_BR',0,0),
	(130,0,'MK','Macedonia','The Former Yugoslav Republic of Macedonia','MKD','807','yes','389','.mk','en',0,0),
	(131,0,'MG','Madagascar','Republic of Madagascar','MDG','450','yes','261','.mg','en',0,0),
	(132,0,'MW','Malawi','Republic of Malawi','MWI','454','yes','265','.mw','en',0,0),
	(133,0,'MY','Malaysia','Malaysia','MYS','458','yes','60','.my','en',0,0),
	(134,0,'MV','Maldives','Republic of Maldives','MDV','462','yes','960','.mv','en',0,0),
	(135,0,'ML','Mali','Republic of Mali','MLI','466','yes','223','.ml','en',0,0),
	(136,0,'MT','Malta','Republic of Malta','MLT','470','yes','356','.mt','en',0,0),
	(137,0,'MH','Marshall Islands','Republic of the Marshall Islands','MHL','584','yes','692','.mh','en',0,0),
	(138,0,'MQ','Martinique','Martinique','MTQ','474','no','596','.mq','en',0,0),
	(139,0,'MR','Mauritania','Islamic Republic of Mauritania','MRT','478','yes','222','.mr','en',0,0),
	(140,0,'MU','Mauritius','Republic of Mauritius','MUS','480','yes','230','.mu','en',0,0),
	(141,0,'YT','Mayotte','Mayotte','MYT','175','no','262','.yt','en',0,0),
	(142,0,'MX','Mexico','United Mexican States','MEX','484','yes','52','.mx','en',0,0),
	(143,0,'FM','Micronesia','Federated States of Micronesia','FSM','583','yes','691','.fm','en',0,0),
	(144,0,'MD','Moldava','Republic of Moldova','MDA','498','yes','373','.md','en',0,0),
	(145,0,'MC','Monaco','Principality of Monaco','MCO','492','yes','377','.mc','en',0,0),
	(146,0,'MN','Mongolia','Mongolia','MNG','496','yes','976','.mn','en',0,0),
	(147,0,'ME','Montenegro','Montenegro','MNE','499','yes','382','.me','en',0,0),
	(148,0,'MS','Montserrat','Montserrat','MSR','500','no','1+664','.ms','en',0,0),
	(149,0,'MA','Morocco','Kingdom of Morocco','MAR','504','yes','212','.ma','en',0,0),
	(150,0,'MZ','Mozambique','Republic of Mozambique','MOZ','508','yes','258','.mz','pt_BR',0,0),
	(151,0,'MM','Myanmar (Burma)','Republic of the Union of Myanmar','MMR','104','yes','95','.mm','en',0,0),
	(152,0,'NA','Namibia','Republic of Namibia','NAM','516','yes','264','.na','en',0,0),
	(153,0,'NR','Nauru','Republic of Nauru','NRU','520','yes','674','.nr','en',0,0),
	(154,0,'NP','Nepal','Federal Democratic Republic of Nepal','NPL','524','yes','977','.np','en',0,0),
	(155,0,'NL','Netherlands','Kingdom of the Netherlands','NLD','528','yes','31','.nl','en',0,0),
	(156,0,'NC','New Caledonia','New Caledonia','NCL','540','no','687','.nc','en',0,0),
	(157,0,'NZ','New Zealand','New Zealand','NZL','554','yes','64','.nz','en',0,0),
	(158,0,'NI','Nicaragua','Republic of Nicaragua','NIC','558','yes','505','.ni','en',0,0),
	(159,0,'NE','Niger','Republic of Niger','NER','562','yes','227','.ne','en',0,0),
	(160,0,'NG','Nigeria','Federal Republic of Nigeria','NGA','566','yes','234','.ng','en',0,0),
	(161,0,'NU','Niue','Niue','NIU','570','some','683','.nu','en',0,0),
	(162,0,'NF','Norfolk Island','Norfolk Island','NFK','574','no','672','.nf','en',0,0),
	(163,0,'KP','North Korea','Democratic People\'s Republic of Korea','PRK','408','yes','850','.kp','en',0,0),
	(164,0,'MP','Northern Mariana Islands','Northern Mariana Islands','MNP','580','no','1+670','.mp','en',0,0),
	(165,0,'NO','Norway','Kingdom of Norway','NOR','578','yes','47','.no','en',0,0),
	(166,0,'OM','Oman','Sultanate of Oman','OMN','512','yes','968','.om','en',0,0),
	(167,0,'PK','Pakistan','Islamic Republic of Pakistan','PAK','586','yes','92','.pk','en',0,0),
	(168,0,'PW','Palau','Republic of Palau','PLW','585','yes','680','.pw','en',0,0),
	(169,0,'PS','Palestine','State of Palestine (or Occupied Palestinian Territory)','PSE','275','some','970','.ps','en',0,0),
	(170,0,'PA','Panama','Republic of Panama','PAN','591','yes','507','.pa','en',0,0),
	(171,0,'PG','Papua New Guinea','Independent State of Papua New Guinea','PNG','598','yes','675','.pg','en',0,0),
	(172,0,'PY','Paraguay','Republic of Paraguay','PRY','600','yes','595','.py','en',0,0),
	(173,0,'PE','Peru','Republic of Peru','PER','604','yes','51','.pe','en',0,0),
	(174,0,'PH','Phillipines','Republic of the Philippines','PHL','608','yes','63','.ph','en',0,0),
	(175,0,'PN','Pitcairn','Pitcairn','PCN','612','no','NONE','.pn','en',0,0),
	(176,0,'PL','Poland','Republic of Poland','POL','616','yes','48','.pl','en',0,0),
	(177,0,'PT','Portugal','Portuguese Republic','PRT','620','yes','351','.pt','pt_BR',0,0),
	(178,0,'PR','Puerto Rico','Commonwealth of Puerto Rico','PRI','630','no','1+939','.pr','en',0,0),
	(179,0,'QA','Qatar','State of Qatar','QAT','634','yes','974','.qa','en',0,0),
	(180,0,'RE','Reunion','R&eacute;union','REU','638','no','262','.re','en',0,0),
	(181,0,'RO','Romania','Romania','ROU','642','yes','40','.ro','en',0,0),
	(182,0,'RU','Russia','Russian Federation','RUS','643','yes','7','.ru','en',0,0),
	(183,0,'RW','Rwanda','Republic of Rwanda','RWA','646','yes','250','.rw','en',0,0),
	(184,0,'BL','Saint Barthelemy','Saint Barth&eacute;lemy','BLM','652','no','590','.bl','en',0,0),
	(185,0,'SH','Saint Helena','Saint Helena, Ascension and Tristan da Cunha','SHN','654','no','290','.sh','en',0,0),
	(186,0,'KN','Saint Kitts and Nevis','Federation of Saint Christopher and Nevis','KNA','659','yes','1+869','.kn','en',0,0),
	(187,0,'LC','Saint Lucia','Saint Lucia','LCA','662','yes','1+758','.lc','en',0,0),
	(188,0,'MF','Saint Martin','Saint Martin','MAF','663','no','590','.mf','en',0,0),
	(189,0,'PM','Saint Pierre and Miquelon','Saint Pierre and Miquelon','SPM','666','no','508','.pm','en',0,0),
	(190,0,'VC','Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','VCT','670','yes','1+784','.vc','en',0,0),
	(191,0,'WS','Samoa','Independent State of Samoa','WSM','882','yes','685','.ws','en',0,0),
	(192,0,'SM','San Marino','Republic of San Marino','SMR','674','yes','378','.sm','en',0,0),
	(193,0,'ST','Sao Tome and Principe','Democratic Republic of S&atilde;o Tom&eacute; and Pr&iacute;ncipe','STP','678','yes','239','.st','pt_BR',0,0),
	(194,0,'SA','Saudi Arabia','Kingdom of Saudi Arabia','SAU','682','yes','966','.sa','en',0,0),
	(195,0,'SN','Senegal','Republic of Senegal','SEN','686','yes','221','.sn','en',0,0),
	(196,0,'RS','Serbia','Republic of Serbia','SRB','688','yes','381','.rs','en',0,0),
	(197,0,'SC','Seychelles','Republic of Seychelles','SYC','690','yes','248','.sc','en',0,0),
	(198,0,'SL','Sierra Leone','Republic of Sierra Leone','SLE','694','yes','232','.sl','en',0,0),
	(199,0,'SG','Singapore','Republic of Singapore','SGP','702','yes','65','.sg','en',0,0),
	(200,0,'SX','Sint Maarten','Sint Maarten','SXM','534','no','1+721','.sx','en',0,0),
	(201,0,'SK','Slovakia','Slovak Republic','SVK','703','yes','421','.sk','en',0,0),
	(202,0,'SI','Slovenia','Republic of Slovenia','SVN','705','yes','386','.si','en',0,0),
	(203,0,'SB','Solomon Islands','Solomon Islands','SLB','090','yes','677','.sb','en',0,0),
	(204,0,'SO','Somalia','Somali Republic','SOM','706','yes','252','.so','en',0,0),
	(205,0,'ZA','South Africa','Republic of South Africa','ZAF','710','yes','27','.za','en',0,0),
	(206,0,'GS','South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands','SGS','239','no','500','.gs','en',0,0),
	(207,0,'KR','South Korea','Republic of Korea','KOR','410','yes','82','.kr','en',0,0),
	(208,0,'SS','South Sudan','Republic of South Sudan','SSD','728','yes','211','.ss','en',0,0),
	(209,0,'ES','Spain','Kingdom of Spain','ESP','724','yes','34','.es','en',0,0),
	(210,0,'LK','Sri Lanka','Democratic Socialist Republic of Sri Lanka','LKA','144','yes','94','.lk','en',0,0),
	(211,0,'SD','Sudan','Republic of the Sudan','SDN','729','yes','249','.sd','en',0,0),
	(212,0,'SR','Suriname','Republic of Suriname','SUR','740','yes','597','.sr','en',0,0),
	(213,0,'SJ','Svalbard and Jan Mayen','Svalbard and Jan Mayen','SJM','744','no','47','.sj','en',0,0),
	(214,0,'SZ','Swaziland','Kingdom of Swaziland','SWZ','748','yes','268','.sz','en',0,0),
	(215,0,'SE','Sweden','Kingdom of Sweden','SWE','752','yes','46','.se','en',0,0),
	(216,0,'CH','Switzerland','Swiss Confederation','CHE','756','yes','41','.ch','en',0,0),
	(217,0,'SY','Syria','Syrian Arab Republic','SYR','760','yes','963','.sy','en',0,0),
	(218,0,'TW','Taiwan','Republic of China (Taiwan)','TWN','158','former','886','.tw','en',0,0),
	(219,0,'TJ','Tajikistan','Republic of Tajikistan','TJK','762','yes','992','.tj','en',0,0),
	(220,0,'TZ','Tanzania','United Republic of Tanzania','TZA','834','yes','255','.tz','en',0,0),
	(221,0,'TH','Thailand','Kingdom of Thailand','THA','764','yes','66','.th','en',0,0),
	(222,0,'TL','Timor-Leste (East Timor)','Democratic Republic of Timor-Leste','TLS','626','yes','670','.tl','pt_BR',0,0),
	(223,0,'TG','Togo','Togolese Republic','TGO','768','yes','228','.tg','en',0,0),
	(224,0,'TK','Tokelau','Tokelau','TKL','772','no','690','.tk','en',0,0),
	(225,0,'TO','Tonga','Kingdom of Tonga','TON','776','yes','676','.to','en',0,0),
	(226,0,'TT','Trinidad and Tobago','Republic of Trinidad and Tobago','TTO','780','yes','1+868','.tt','en',0,0),
	(227,0,'TN','Tunisia','Republic of Tunisia','TUN','788','yes','216','.tn','en',0,0),
	(228,0,'TR','Turkey','Republic of Turkey','TUR','792','yes','90','.tr','en',0,0),
	(229,0,'TM','Turkmenistan','Turkmenistan','TKM','795','yes','993','.tm','en',0,0),
	(230,0,'TC','Turks and Caicos Islands','Turks and Caicos Islands','TCA','796','no','1+649','.tc','en',0,0),
	(231,0,'TV','Tuvalu','Tuvalu','TUV','798','yes','688','.tv','en',0,0),
	(232,0,'UG','Uganda','Republic of Uganda','UGA','800','yes','256','.ug','en',0,0),
	(233,0,'UA','Ukraine','Ukraine','UKR','804','yes','380','.ua','en',0,0),
	(234,0,'AE','United Arab Emirates','United Arab Emirates','ARE','784','yes','971','.ae','en',0,0),
	(235,0,'GB','United Kingdom','United Kingdom of Great Britain and Nothern Ireland','GBR','826','yes','44','.uk','en',0,0),
	(236,0,'US','United States','United States of America','USA','840','yes','1','.us','en',0,1),
	(237,0,'UM','United States Minor Outlying Islands','United States Minor Outlying Islands','UMI','581','no','NONE','NONE','en',0,0),
	(238,0,'UY','Uruguay','Eastern Republic of Uruguay','URY','858','yes','598','.uy','en',0,0),
	(239,0,'UZ','Uzbekistan','Republic of Uzbekistan','UZB','860','yes','998','.uz','en',0,0),
	(240,0,'VU','Vanuatu','Republic of Vanuatu','VUT','548','yes','678','.vu','en',0,0),
	(241,0,'VA','Vatican City','State of the Vatican City','VAT','336','no','39','.va','en',0,0),
	(242,0,'VE','Venezuela','Bolivarian Republic of Venezuela','VEN','862','yes','58','.ve','en',0,0),
	(243,0,'VN','Vietnam','Socialist Republic of Vietnam','VNM','704','yes','84','.vn','en',0,0),
	(244,0,'VG','Virgin Islands, British','British Virgin Islands','VGB','092','no','1+284','.vg','en',0,0),
	(245,0,'VI','Virgin Islands, US','Virgin Islands of the United States','VIR','850','no','1+340','.vi','en',0,0),
	(246,0,'WF','Wallis and Futuna','Wallis and Futuna','WLF','876','no','681','.wf','en',0,0),
	(247,0,'EH','Western Sahara','Western Sahara','ESH','732','no','212','.eh','en',0,0),
	(248,0,'YE','Yemen','Republic of Yemen','YEM','887','yes','967','.ye','en',0,0),
	(249,0,'ZM','Zambia','Republic of Zambia','ZMB','894','yes','260','.zm','en',0,0),
	(250,0,'ZW','Zimbabwe','Republic of Zimbabwe','ZWE','716','yes','263','.zw','en',0,0);

/*!40000 ALTER TABLE `gfw_countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_fonts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_fonts`;

CREATE TABLE `gfw_fonts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_fonts` WRITE;
/*!40000 ALTER TABLE `gfw_fonts` DISABLE KEYS */;

INSERT INTO `gfw_fonts` (`id`, `idd`, `name`, `description`)
VALUES
	(1,0,'Helvetica','Helvetica'),
	(2,0,'Times','Times'),
	(3,0,'Raleway','Raleway'),
	(4,0,'Open+Sans','Open Sans'),
	(5,0,'Roboto','Roboto'),
	(6,0,'Poiret+One','Poiret One'),
	(7,0,'Lobster','Lobster'),
	(8,0,'Abel','Abel'),
	(9,0,'Play','Play'),
	(10,0,'Orbitron','Orbitron'),
	(11,0,'Comfortaa','Comfortaa'),
	(12,0,'Cookie','Cookie'),
	(13,0,'Varela','Varela'),
	(14,0,'Great+Vibes','Great Vibes'),
	(15,0,'Jura','Jura'),
	(16,0,'Tangerine','Tangerine'),
	(17,0,'Glegoo','Glegoo'),
	(18,0,'Doppio+One','Doppio One'),
	(19,0,'Nixie+One','Nixie One'),
	(20,0,'Advent+Pro','Advent Pro'),
	(21,0,'Forum','Forum'),
	(22,0,'Metrophobic','Metrophobic'),
	(23,0,'Anaheim','Anaheim'),
	(24,0,'Hind+Vadodara','Hind Vadodara'),
	(25,0,'Federo','Federo');

/*!40000 ALTER TABLE `gfw_fonts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_home
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_home`;

CREATE TABLE `gfw_home` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `locale` char(5) DEFAULT 'pt_BR',
  `active` tinyint(1) DEFAULT '0',
  `carousel` tinyint(1) DEFAULT '1',
  `place1` tinyint(1) DEFAULT '0',
  `place2` tinyint(1) DEFAULT '0',
  `keyword` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(200) DEFAULT NULL,
  `short_text` text,
  `text` blob,
  `attachment1` varchar(45) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_i18n`;

CREATE TABLE `gfw_i18n` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `locale` char(5) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `revised` tinyint(1) DEFAULT '0',
  `source` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_links`;

CREATE TABLE `gfw_links` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `keyword` varchar(45) DEFAULT NULL,
  `caption` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `link` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_locales`;

CREATE TABLE `gfw_locales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `locale` char(5) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_locales` WRITE;
/*!40000 ALTER TABLE `gfw_locales` DISABLE KEYS */;

INSERT INTO `gfw_locales` (`id`, `idd`, `locale`, `name`)
VALUES
	(1,0,'en','Inglês'),
	(2,0,'pt_BR','Português'),
	(3,0,'es','Espanhol'),
	(4,0,'fr','Francês'),
	(5,0,'it','Italiano');

/*!40000 ALTER TABLE `gfw_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_locked
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_locked`;

CREATE TABLE `gfw_locked` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_log`;

CREATE TABLE `gfw_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_gfw_users` bigint DEFAULT '0',
  `id_gfw_menus` bigint DEFAULT '0',
  `id_equip` bigint NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `full_link` varchar(300) DEFAULT NULL,
  `request` text,
  `details` text,
  PRIMARY KEY (`id`),
  KEY `USER` (`id_gfw_users`),
  KEY `EQUIP` (`id_equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_menus`;

CREATE TABLE `gfw_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `show_at` int DEFAULT '0',
  `locale` char(5) DEFAULT NULL,
  `keyword` varchar(45) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `content` text,
  `link` varchar(160) DEFAULT NULL,
  `file` varchar(240) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `order1` int DEFAULT '0',
  `order2` int DEFAULT '0',
  `add_parameters` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LOCALE` (`locale`,`active`),
  KEY `LINK` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_menus` WRITE;
/*!40000 ALTER TABLE `gfw_menus` DISABLE KEYS */;

INSERT INTO `gfw_menus` (`id`, `idd`, `active`, `show_at`, `locale`, `keyword`, `title`, `content`, `link`, `file`, `icon`, `type`, `order1`, `order2`, `add_parameters`)
VALUES
	(1,0,1,2,'pt_BR','Planejamento','Planejamento','','','','','dropdown',10,0,NULL),
	(2,0,1,2,'pt_BR','Programacao','Programação','Programação de atividades','programacao','operacao/programacao.php','calendar','dropdownLink',10,101,NULL),
	(3,0,1,2,'pt_BR','Paineldeatividades','Painel de atividades','Mostra o andamento das atividades atuais','painel','operacao/painel.php','monitor-heart-rate','dropdownLink',10,104,NULL),
	(5,0,1,2,'pt_BR','Entrada','Entrada','Recebimento e conferência para entrada no armazém','entrada','operacao/entrada.php','sign-in','dropdownLink',20,201,NULL),
	(6,0,1,2,'pt_BR','Separacao','Separação','Realiza a separação de um ou mais programações','separacao','operacao/separacao.php','dolly','dropdownLink',20,203,NULL),
	(7,0,1,2,'pt_BR','Informaacoes','Informações','Busca informações sobre uma carga, posição ou SKU','informacoes','operacao/informacoes.php','barcode-read','dropdownLink',20,100,NULL),
	(8,0,1,2,'pt_BR','Posicionamento','Posicionamento','Posicionamento de carga','posicionamento','operacao/posicionamento.php','inventory','dropdownLink',20,202,NULL),
	(9,0,1,2,'pt_BR','Conferaancia','Conferência','Conferência de carga','conferencia','operacao/conferencia.php','box-check','dropdownLink',20,204,NULL),
	(10,0,1,2,'pt_BR','Tranferaancia','Tranferência','Transferência para outra UMA','transferencia','operacao/transferencia.php','external-link','dropdownLink',20,303,NULL),
	(11,0,1,2,'pt_BR','Bloqueio','Bloqueio','Bloqueio ou desbloqueio de posição ou carga','bloqueio','operacao/bloqueio.php','times-circle','dropdownLink',30,104,NULL),
	(12,0,1,2,'pt_BR','Devolucao','Devolução','Devolução de cargas','devolucao','operacao/devolucao.php','reply','dropdownLink',20,305,NULL),
	(13,0,1,2,'pt_BR','Atividades','Atividades','','','','','dropdownLink',10,100,NULL),
	(14,0,1,2,'pt_BR','Operacao','Operação','','','','','dropdown',20,0,NULL),
	(16,0,1,2,'pt_BR','Etiquetas','Etiquetas','Emissão de etiquetas de posição, SKU e UMA','etiquetas','operacao/etiquetas.php','barcode-alt','dropdownLink',20,101,NULL),
	(19,0,1,2,'pt_BR','Ferramentas','Ferramentas','','','','','dropdown',30,0,NULL),
	(21,0,1,2,'pt_BR','Relatairios','Relatórios','','','','','dropdown',80,0,NULL),
	(22,0,1,2,'pt_BR','OperSep1','','','','','','dropdownLink',20,200,NULL),
	(23,0,1,2,'pt_BR','Cadastros','Cadastros','','','','','dropdown',90,0,NULL),
	(24,0,1,2,'pt_BR','Saaada','Saída','Saída de cargas do estoque','saida','operacao/saida.php','sign-out','dropdownLink',20,207,NULL),
	(25,0,1,2,'pt_BR','Nfdeentrada','NFe - Clientes','Criação, importação e gestão de NF dos clientes','nf_entrada','notas_fiscais/entrada.php','file-download','dropdownLink',30,201,NULL),
	(26,0,1,2,'pt_BR','Nfdesaaada','NFe - Internas','Emissão e gestão de notas fiscais de saída','nf_saida','notas_fiscais/saida.php','file-upload','dropdownLink',30,202,NULL),
	(27,0,1,2,'pt_BR','InformaacoesCert','Informações','Informações sobre o certificado digital','nf_informacoes','notas_fiscais/informacoes.php','shield-alt','dropdownLink',30,206,NULL),
	(28,0,1,2,'pt_BR','Situacao','Situação','Mostra acessibilidade na comunicação com servidores do governo','nf_situacao','notas_fiscais/situacao.php','plug','dropdownLink',30,207,NULL),
	(29,0,1,2,'pt_BR','Portaria','Portaria','','','','','dropdownLink',40,100,NULL),
	(30,0,1,2,'pt_BR','Veaaculos','Veículos','Acesso de veículos','acesso_veiculos','portaria/veiculos.php','truck','dropdownLink',40,101,NULL),
	(31,0,1,2,'pt_BR','Pessoas','Pessoas','Acesso de pessoas','acesso_pessoas','portaria/pessoas.php','street-view','dropdownLink',40,102,NULL),
	(33,0,1,2,'pt_BR','Autorizaacoes','Autorizações','Autorizações de acesso','autorizacoes','portaria/autorizacoes.php','user-check','dropdownLink',40,103,NULL),
	(34,0,1,2,'pt_BR','Bloqueios','Bloqueios','Definição de bloqueios de acesso a pessoas ou veículos','portaria_bloqueios','portaria/bloqueios.php','user-slash','dropdownLink',40,104,NULL),
	(35,0,1,2,'pt_BR','Saldos','Saldos','Saldos de itens em estoque','saldos','relatorios/saldos.php','pallet-alt','dropdownLink',80,101,NULL),
	(36,0,1,2,'pt_BR','Relatairios29822','Estoque','','','','','dropdownLink',80,100,NULL),
	(37,0,1,2,'pt_BR','Movimentacao','Operações','Operações programadas','operacoes','relatorios/operacoes.php','dolly-flatbed-alt','dropdownLink',80,102,NULL),
	(38,0,1,2,'pt_BR','Umas','UMAs','Relatório de saldo de UMAs','umas','relatorios/umas.php','barcode-alt','dropdownLink',80,103,NULL),
	(39,0,1,2,'pt_BR','Traunsito','Relatórios','Relatórios de trânsito de pessoas ou veículos','transito','relatorios/transito.php','map-signs','dropdownLink',40,105,NULL),
	(42,0,1,2,'pt_BR','Ocupacao','Ocupação','Ocupação do armazém','ocupacao','gestao/ocupacao.php','warehouse-alt','dropdownLink',10,201,NULL),
	(43,0,1,2,'pt_BR','Temposemovimentos','Tempos e movimentos','Relação entre movimentos no decorrer do tempo','tempos','gestao/tempos_movimentos.php','stopwatch','dropdownLink',10,205,NULL),
	(44,0,1,2,'pt_BR','Clientes','Clientes','Relacionamento dos clientes com as atividades','clientes','gestao/clientes.php','user-tie','dropdownLink',10,202,NULL),
	(45,0,1,2,'pt_BR','Pessoas42105','Pessoas','Cadastro de pessoas','pessoas','cadastros/pessoas.php','id-badge','dropdownLink',90,101,NULL),
	(46,0,1,2,'pt_BR','Empresas','Empresas','Cadastro de empresas','empresas','cadastros/empresas.php','building','dropdownLink',90,102,NULL),
	(47,0,1,2,'pt_BR','Itens','Itens','Cadastro de produtos (itens de estoque)','itens','cadastros/itens.php','box','dropdownLink',90,202,NULL),
	(48,0,1,2,'pt_BR','Grupos','Grupos','Cadastro de grupos de itens','grupos','cadastros/grupos.php','boxes','dropdownLink',90,201,NULL),
	(49,0,1,2,'pt_BR','Tipos','Tipos','Cadastro de tipos de itens','tipos','cadastros/tipos.php','tag','dropdownLink',90,202,NULL),
	(50,0,1,2,'pt_BR','Acreas','Áreas','Cadastro de áreas para posicionamento nos armazéns','areas','cadastros/areas.php','map-signs','dropdownLink',90,303,NULL),
	(51,0,1,2,'pt_BR','Posiacoes','Posições','Cadastro de posições dos armazéns','posicoes','cadastros/posicoes.php','map-marker-alt','dropdownLink',90,304,NULL),
	(52,0,1,2,'pt_BR','Armazaons','Armazéns','Cadastro de armazéns','armazens','cadastros/armazens.php','warehouse','dropdownLink',90,301,NULL),
	(53,0,1,2,'pt_BR','Pessoasfaasicasejuraadicas','Pessoas Físicas e Jurídicas','','','','','dropdownLink',90,100,NULL),
	(54,0,1,2,'pt_BR','Estoque','Estoque','','','','','dropdownLink',90,200,NULL),
	(55,0,1,2,'pt_BR','Posicionamento45958','Posicionamento','','','','','dropdownLink',90,300,NULL),
	(57,0,1,2,'pt_BR','Inventariar','Inventariar','Inventariar posição ou UMA','inventariar','operacao/inventariar.php','scanner','dropdownLink',20,307,NULL),
	(61,0,1,2,'pt_BR','Execucao','Faturamento','','','','','dropdownLink',40,400,NULL),
	(62,0,1,2,'pt_BR','Demonstrativo','Demonstrativo','Demonstrativo de faturamento','demonstrativo','faturamento/demonstrativo.php','file-alt','dropdownLink',40,401,NULL),
	(63,0,1,2,'pt_BR','Itensadicionais','Itens adicionais','Itens adicionais ao faturamento normal','itens_adicionais','faturamento/itens.php','tasks','dropdownLink',40,402,NULL),
	(65,0,1,2,'pt_BR','Prea%3Fos','Preços por clientes','Preços dos serviços','precos','faturamento/precos.php','usd-circle','dropdownLink',40,403,NULL),
	(66,0,1,2,'pt_BR','Servia%3Fos','Tipos de serviços','Serviços disponíveis para faturamento','servicos','faturamento/servicos.php','clipboard-list','dropdownLink',40,404,NULL),
	(67,0,1,2,'pt_BR','NotasFiscais','Notas fiscais','','','','','dropdownLink',30,200,NULL),
	(69,0,1,2,'pt_BR','Graeficos','Gráficos','','','','','dropdownLink',10,200,NULL),
	(71,0,1,2,'pt_BR','Unidades','Unidades','Cadastro de unidades','unidades','cadastros/unidades.php','cube','dropdownLink',90,203,NULL),
	(75,0,1,2,'pt_BR','Cidades','Cidades','Cadastro de cidades','cidades','cadastros/cidades.php','map-marker','dropdownLink',90,402,NULL),
	(76,0,1,2,'pt_BR','Mapa','Mapa do armazém','Mapa do armazém','mapa_umas','operacao/mapa.php','map','dropdownLink',10,103,NULL),
	(77,0,1,2,'pt_BR','Tiposdeocorraancias','Tipos de ocorrências','Cadastro de tipos de ocorrências','tipos_ocorrencias','cadastros/tipos_ocorrencias.php','exclamation','dropdownLink',90,404,NULL),
	(78,0,1,2,'pt_BR','Tiposdeprogramacao','Tipos de programações','Cadastro de tipos de programações','tipos_programacoes','cadastros/tipos_programacoes.php','list','dropdownLink',90,404,NULL),
	(79,0,1,2,'pt_BR','Importacaodedados','Importações de dados','Parâmetros para importação de dados de outros sistemas','importacoes','cadastros/importacoes.php','download','dropdownLink',90,408,NULL),
	(80,0,1,2,'pt_BR','Tiposdeumas','Tipos de UMAs','Cadastro de tipos de UMAs','tipos_umas','cadastros/tipos_umas.php','barcode','dropdownLink',90,406,NULL),
	(81,0,1,2,'pt_BR','Tiposdeveaaculos','Tipos de veículos','Cadastro de tipos de veículos','tipos_veiculos','cadastros/tipos_veiculos.php','truck','dropdownLink',90,407,NULL),
	(82,0,1,2,'pt_BR','Setores','Setores','Cadastro de setores da empresa','setores','cadastros/setores.php','sitemap','dropdownLink',90,403,NULL),
	(83,0,1,2,'pt_BR','Substituir','Substituir','Substituir NFe atribuindo às UMAs uma nova NFe','substituir','notas_fiscais/substituir.php','sync','dropdownLink',30,204,NULL),
	(84,0,1,2,'pt_BR','Associarumaanfe','Associar UMAs a NFe','Associa uma NFe importada a UMAs existentes','associar','notas_fiscais/associar.php','tag','dropdownLink',30,205,NULL),
	(85,0,1,2,'pt_BR','Tiposdeetiquetas','Tipos de etiquetas','Permite configurar etiquetas ZPL','tipos_etiquetas','cadastros/tipos_etiquetas.php','barcode-alt','dropdownLink',90,409,NULL),
	(86,0,1,2,'pt_BR','Curvaabc','Análise PQR','Análise PQR','curva_abc','gestao/curva_pqr.php','chart-pie','dropdownLink',10,206,NULL),
	(87,0,1,2,'pt_BR','Cfop','CFOP','Cadastro de CFOPs','cfops','cadastros/cfops.php','tag','dropdownLink',90,410,NULL),
	(88,0,1,2,'pt_BR','Regiaoesdeseparacao','Regiões de separação','Regiões para separação em paralelo','regioes','cadastros/regioes.php','draw-polygon','dropdownLink',90,302,NULL),
	(89,0,1,2,'pt_BR','Equipamentos','Equipamentos','Cadastro de equipamentos','equipamentos','cadastros/equipamentos.php','forklift','dropdownLink',90,401,NULL),
	(90,0,1,2,'pt_BR','Transformacao','Transformação','Efetuar uma transformação (paletização, filmagem, etc.)','transformacao','operacao/transformacao.php','pallet','dropdownLink',30,103,NULL),
	(91,0,1,2,'pt_BR','Edicao','Edição de UMA','Edição de alguns dados da UMA','edicao','operacao/edicao.php','edit','dropdownLink',30,102,NULL),
	(92,0,1,2,'pt_BR','Inventaerios','Inventários','Relatório de inventários realizados','inventarios_realizados','relatorios/inventarios.php','search','dropdownLink',80,109,NULL),
	(93,0,1,2,'pt_BR','Equipe','Equipe','','','','','dropdownLink',80,200,NULL),
	(94,0,1,2,'pt_BR','Atividades23351','Atividades','Mostra atividades executadas por colaboradores','atividades','relatorios/atividades.php','user-cog','dropdownLink',80,201,NULL),
	(95,0,1,2,'pt_BR','Entradas','Entradas','Relatório de entradas','entradas','relatorios/entradas.php','arrow-alt-to-left','dropdownLink',80,104,NULL),
	(96,0,1,2,'pt_BR','Saaadas','Saídas','Relatório de saídas','saidas','relatorios/saidas.php','arrow-alt-from-left','dropdownLink',80,105,NULL),
	(97,0,1,2,'pt_BR','Pendaancias','Pendências','Analisa e lista pendências operacionais','pendencias','relatorios/pendencias.php','exclamation-triangle','dropdownLink',80,202,NULL),
	(98,0,1,2,'pt_BR','Separaacoes','Separações','Relatório de separações efetuadas','separacoes','relatorios/separacoes.php','hand-holding-box','dropdownLink',80,106,NULL),
	(99,0,1,2,'pt_BR','Paletizacao','Paletização','Executa a paletização de uma carga','paletizacao','operacao/paletizacao.php','pallet-alt','dropdownLink',20,208,NULL),
	(100,0,1,2,'pt_BR','Filmagem','Filmagem','Executa a filmagem de UMA','filmagem','operacao/filmagem.php','gift','dropdownLink',20,209,NULL),
	(101,0,1,2,'pt_BR','Ressuprimento','Ressuprimento','Ressuprimento de posições de picking','ressuprimento','operacao/ressuprimento.php','person-carry','dropdownLink',20,301,NULL),
	(102,0,1,2,'pt_BR','Picking','Picking','Relatório de análise de picking e ressuprimento','relatorio_picking','relatorios/picking.php','person-carry','dropdownLink',80,107,NULL),
	(103,0,1,2,'pt_BR','Ajustedesaldo','Ajuste de saldo','Permite ajustar o saldo de uma UMA','ajuste_saldo','operacao/ajustar_saldo.php','clipboard-check','dropdownLink',30,101,NULL),
	(104,0,1,2,'pt_BR','Integracaoproteus','Protheus','Relatórios de acompanhamento da integração do Proteus','','','','dropdownLink',40,300,NULL),
	(105,0,1,2,'pt_BR','Webservice','Webservice','Consulta de transferências e apontamentos','proteus_webservice','proteus/webservice.php','sync','dropdownLink',40,301,NULL),
	(106,0,1,2,'pt_BR','Comparacaodeinventaerio','Saldo','Comparação entre o saldo do Proteus e do gWMS','proteus_saldo','proteus/saldo.php','search','dropdownLink',40,302,NULL),
	(107,0,1,2,'pt_BR','Baixarnaaerea','Baixar na área','Baixar UMAs na área','baixar_area','operacao/baixar_area.php','download','dropdownLink',20,304,NULL),
	(108,0,1,2,'pt_BR','Apanha','Apanha','Realiza a separação de várias OS de uma vez','apanha','operacao/apanha.php','object-group','dropdownLink',20,205,NULL),
	(109,0,1,2,'pt_BR','Posiacoes20999','Posições','Relatório de posições ocupadas ou livres','rel_posicoes','relatorios/posicoes.php','map','dropdownLink',80,110,NULL),
	(110,0,1,2,'pt_BR','Paletização','Paletização','Relatório de paletização','rel_paletizacao','relatorios/paletizacao.php','pallet','dropdownLink',80,202,NULL),
	(111,0,1,2,'pt_BR','Acreas25741','Áreas','Permite realizar a gestão das áreas','gestao_areas','gestao/areas.php','map-signs','dropdownLink',10,202,NULL),
	(112,0,1,2,'pt_BR','Nfeemitidas','NFe emitidas','Relatório de NFe emitidas','nfe_emitidas','relatorios/nfe_emitidas.php','archive','dropdownLink',80,301,NULL),
	(113,0,1,2,'pt_BR','Outros','Outros','','','','','dropdownLink',80,300,NULL),
	(114,0,1,2,'pt_BR','Programaacoes','Programações','Relatório com resumo das programações','programacoes','relatorios/programacoes.php','calendar','dropdownLink',80,108,NULL),
	(115,0,1,2,'pt_BR','Paletizaacoes','Paletizações','Relação de paletizações efetuadas e seus códigos de OP','paletizacoes_op','relatorios/paletizacoes_op.php','pallet','dropdownLink',40,303,NULL),
	(117,0,1,2,'pt_BR','Movimentacao31262','Eventos','Execução de eventos com UMAs','eventos','operacao/eventos.php','exchange','dropdownLink',20,102,NULL),
	(118,0,1,2,'pt_BR','Gestauodemovimentacao','Gestão de eventos','Gerenciar a movimentação de UMAs','admin_eventos','operacao/admin_eventos.php','tasks','dropdownLink',10,102,NULL),
	(119,0,1,2,'pt_BR','Nfeimportadas','NFe importadas','Relatório de NFe importadas','nfe_importadas','relatorios/nfe_clientes.php','file','dropdownLink',80,302,NULL),
	(120,0,1,2,'pt_BR','Painel','Gestão do painel','Gestão do painel de atividades','gestao_painel','gestao/painel.php','monitor-heart-rate','dropdownLink',10,203,''),
	(121,0,1,2,'pt_BR','Imobilizacao','Imobilização','Imobilizar UMA impedindo que sejam realizadas quaisquer operações nela','imobilizacao','operacao/imobilizacao.php','lock','dropdownLink',30,105,''),
	(122,0,1,2,'pt_BR','Producao','Produção','Transformar insumos em produto acabado','producao','operacao/producao.php','cogs','dropdownLink',20,206,NULL),
	(123,0,1,2,'pt_BR','Produtosincompletos','Produtos incompletos','Produtos que foram produzidos faltando algum insumo','rel_produtos_incompletos','relatorios/produtos_incompletos.php','puzzle-piece','dropdownLink',80,303,NULL),
	(126,0,1,2,'pt_BR','Containers','Containers','Movimentação de containers','','','','dropdownLink',40,200,NULL),
	(127,0,1,2,'pt_BR','Movimentacao34363','Movimentação','Movimentação de containers','containers','containers/containers.php','cubes','dropdownLink',40,201,NULL),
	(128,0,1,2,'pt_BR','Relatairio','Relatórios','Relatórios de estoque ou movimentação de containers','rel_containers','relatorios/containers.php','paste','dropdownLink',40,202,NULL),
	(129,0,1,2,'pt_BR','Contingencia','Contingencia','Alternar modo de emissão de NFe','contingencia','notas_fiscais/contingencia.php','sync','dropdownLink',30,208,NULL),
	(130,0,1,2,'pt_BR','OperSep2','','','','','','dropdownLink',20,300,NULL),
	(131,0,1,2,'pt_BR','OperSep3','Diversos','','','','','dropdownLink',90,400,NULL),
	(133,0,1,2,'pt_BR','Modulos','Módulos','',NULL,NULL,NULL,'dropdown',40,0,NULL),
	(134,0,1,2,'pt_BR','Ocorraancia','Ocorrências','Registrar um fato que precisa de atenção posterior','ope_ocorrencia','operacao/ocorrencias.php','exclamation','dropdownLink',20,103,NULL),
	(135,0,1,2,'pt_BR','Ajustes','Ajustes','','','','','dropdownLink',30,100,NULL),
	(136,0,1,2,'pt_BR','Ocorraancias','Ocorrências','Fatos ocorridos que merecem atenção','rel_ocorrencias','relatorios/ocorrencias.php','exclamation','dropdownLink',80,304,NULL),
	(137,0,1,2,'pt_BR','Crossdocking','Cross docking','Registrar operação de cross docking','crossdocking','operacao/crossdocking.php','arrows','dropdownLink',20,306,NULL),
	(138,0,1,2,'pt_BR','Arquivar-Nfe','Arquivar - NFe','Arquivar NFe geradas no periódo','nfe_arquivar','notas_fiscais/arquivar.php','file','dropdownLink',30,209,NULL),
	(139,0,1,2,'pt_BR','Verificarumas','Verificar UMAs','Verificar UMAs','verificar_umas','operacao/verificar_umas.php','search-plus','dropdownLink',20,104,NULL),
	(140,0,1,2,'pt_BR','Verificardepois','Verificar depois','Observações de UMAs','verificar_depois','/relatorios/verificar_umas.php','clock','dropdownLink',80,305,NULL),
	(141,0,1,2,'pt_BR','Estoque38238','Estoque','Containers no estoque','rel_estoque_containers','relatorios/estoque_containers.php','inbox','dropdownLink',40,203,NULL),
	(142,0,1,2,'pt_BR','Eventos','Eventos','Relatório de eventos','relatorio_eventos','relatorios/eventos.php','exchange','dropdownLink',80,306,NULL),
	(143,0,1,2,'pt_BR','Maequinas','Máquinas','Cadastro de máquinas','maquina','cadastros/maquina.php','forklift','dropdownLink',90,411,NULL),
	(144,0,1,2,'pt_BR','Nfe-Equipamentos','NFe - equipamentos','Emissão de NFe para equipamentos internos','nf_maquina','notas_fiscais/saida.php','file','dropdownLink',30,203,NULL),
	(145,0,1,2,'pt_BR','Unidades69631','Armazéns internos','Cadastro de armazéns internos','empresas_armazens','cadastros/armazens_unidades.php','building','dropdownLink',90,103,NULL),
	(146,0,1,2,'pt_BR','Clonaritens','Clonar itens','Copiar itens de um cliente para outro','clonar_itens','cadastros/clonar_cadastro.php','sync','dropdownLink',90,412,NULL),
	(147,0,1,2,'pt_BR','Exportaa%3Fauo','Exportação','Exportação Blocos K','exportacao_datasul','datasul/exportacao_datasul.php','file-spreadsheet','dropdownLink',40,501,NULL),
	(148,0,1,2,'pt_BR','Datasul','Datasul','Datasul','','','','dropdownLink',40,500,NULL),
	(149,0,1,2,'pt_BR','Ocupaa%3Fauo','Ocupação','Relatório de ocupação do armazém','rel_ocupacao','gestao/rel_ocupacao.php','inventory','dropdownLink',80,307,NULL),
	(150,0,1,2,'pt_BR','Winthor','Winthor','','','','','dropdownLink',40,600,NULL),
	(151,0,1,2,'pt_BR','Entrada87299','Entrada','Sincronizar entrada','entrada_winthor','winthor/conferencia.php','arrow-up','dropdownLink',40,601,NULL),
	(152,0,1,2,'pt_BR','Saaada43140','Saída','Sincronizar saída','saida_winthor','winthor/corte_carga.php','arrow-down','dropdownLink',40,602,NULL),
	(153,0,1,2,'pt_BR','Inventaerio','Inventário','Sincronizar inventário','inventario_winthor','winthor/inventario.php','tally','dropdownLink',40,603,NULL),
	(154,0,1,2,'pt_BR','Saldos30759','Saldos','Relatório de saldos de divergência entra Winthor e WMS','saldos_winthor','winthor/saldos.php','not-equal','dropdownLink',40,604,NULL),
	(155,0,1,2,'pt_BR','Movimentaa%3Faoes','Movimentações','Movimentações de entradas e saídas','mov_winthor','relatorios/movimentacoes.php','dolly','dropdownLink',40,605,NULL),
	(157,0,1,2,'pt_BR','Inventariar-Linha','Inventariar - Linha','Inventariar itens da linha','inventario_basico&linha=1','operacao/inventario_basico.php','scanner','dropdownLink',20,308,NULL),
	(158,0,1,2,'pt_BR','Localizar','Localizar','Localizar itens','localizar','operacao/localizar.php','search','dropdownLink',20,310,NULL),
	(159,0,1,2,'pt_BR','Tornearia','Tornearia','Relatórios dos ressuprimentos de tornearia','tornearia','relatorios/tornearia.php','cog','dropdownLink',81,306,NULL),
	(160,0,1,2,'pt_BR','Localizarconsumaaveis','Localizar Consumíveis','Localizar itens consumíveis','localizar&saida=1','operacao/localizar.php','search','dropdownLink',20,311,NULL),
	(161,0,1,2,'pt_BR','Criarposia%3Fauo','Criar posição','Criar posição lendo o código','criar_posicao','operacao/cadastrar_posicao.php','map-marker-alt','dropdownLink',30,106,NULL),
	(162,0,1,2,'pt_BR','Inventariar-Estoque','Inventariar - Estoque','Realizar contagem de inventário','inventario_basico','operacao/inventario_basico.php','scanner','dropdownLink',20,309,NULL),
	(163,0,1,2,'pt_BR','Ressuprimento%28S%29','Ressuprimento (S)','Ressuprimento simplificado','ressuprimento_simplificado','operacao/ressuprimento_simplificado.php','person-carry','dropdownLink',20,302,NULL),
	(165,0,1,0,'pt_BR','Produtividade','Produtividade','','produtividade','relatorios/produtividade.php','user','dropdownLink',80,203,NULL),
	(166,0,0,2,'pt_BR','Integraa%3Fauo','Integração','','','','','dropdownLink',40,700,NULL),
	(167,0,0,2,'pt_BR','Kimberly x Suzano','Kimberly x Suzano','IntegraÃ§Ã£o Kimberly Clark x Suzano','kimberly_suzano','integracoes/kimberly_suzano.php','upload','dropdownLink',40,701,NULL);

/*!40000 ALTER TABLE `gfw_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_pages`;

CREATE TABLE `gfw_pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `locale` char(5) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` longblob,
  `active` tinyint(1) DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LOCALE` (`locale`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_permissions`;

CREATE TABLE `gfw_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `locale` char(5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_permissions` WRITE;
/*!40000 ALTER TABLE `gfw_permissions` DISABLE KEYS */;

INSERT INTO `gfw_permissions` (`id`, `idd`, `locale`, `active`, `name`)
VALUES
	(1,0,'pt_BR',1,'Acessar todas as funções'),
	(2,0,'pt_BR',1,'Colaborador Estoquista/Analista'),
	(3,0,'pt_BR',1,'Colaborador Conferente'),
	(4,0,'pt_BR',1,'Colaborador Conferente Líder'),
	(5,0,'pt_BR',1,'Colaborador Edição/Ajuste saldo'),
	(6,0,'pt_BR',1,'Colaborador Inventariador'),
	(7,0,'pt_BR',1,'Módulo Notas Fiscais'),
	(8,0,'pt_BR',1,'Módulo Portaria'),
	(9,0,'pt_BR',1,'Módulo de Containers'),
	(10,0,'pt_BR',1,'Relatórios'),
	(12,0,'pt_BR',1,'Módulo de Faturamento'),
	(13,0,'pt_BR',1,'Cadastros de Pessoas/Empresas'),
	(14,0,'pt_BR',1,'Cadastros para Estoque'),
	(15,0,'pt_BR',1,'Cadastros Diversos'),
	(16,0,'pt_BR',1,'Acesso do Cliente - Saldos'),
	(17,0,'pt_BR',1,'Acesso do Cliente - Programação'),
	(18,0,'pt_BR',1,'Colaborador Bloqueios/Imobilizações');

/*!40000 ALTER TABLE `gfw_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_permissions_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_permissions_links`;

CREATE TABLE `gfw_permissions_links` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `id_gfw_menus` bigint DEFAULT NULL,
  `id_gfw_permissions` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `MENU` (`id_gfw_menus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_permissions_links` WRITE;
/*!40000 ALTER TABLE `gfw_permissions_links` DISABLE KEYS */;

INSERT INTO `gfw_permissions_links` (`id`, `idd`, `id_gfw_menus`, `id_gfw_permissions`)
VALUES
	(1,0,2,2),
	(2,0,118,2),
	(3,0,76,2),
	(4,0,3,2),
	(5,0,42,2),
	(6,0,43,2),
	(7,0,44,2),
	(8,0,86,2),
	(9,0,111,2),
	(10,0,120,2),
	(11,0,7,3),
	(12,0,16,3),
	(13,0,117,3),
	(14,0,5,3),
	(15,0,9,3),
	(16,0,8,3),
	(17,0,24,3),
	(18,0,10,4),
	(19,0,107,4),
	(20,0,12,4),
	(21,0,11,4),
	(22,0,90,4),
	(24,0,101,4),
	(25,0,108,4),
	(26,0,121,4),
	(27,0,122,4),
	(28,0,103,5),
	(29,0,91,5),
	(30,0,57,6),
	(31,0,26,7),
	(32,0,25,7),
	(33,0,112,7),
	(34,0,119,7),
	(35,0,28,7),
	(36,0,129,7),
	(37,0,83,7),
	(38,0,28,7),
	(39,0,30,8),
	(40,0,31,8),
	(41,0,33,8),
	(42,0,34,8),
	(43,0,39,8),
	(44,0,127,9),
	(45,0,128,9),
	(46,0,27,7),
	(47,0,35,10),
	(48,0,106,10),
	(49,0,37,10),
	(50,0,95,10),
	(51,0,96,10),
	(52,0,38,10),
	(53,0,98,10),
	(54,0,102,10),
	(55,0,114,10),
	(56,0,92,10),
	(57,0,109,10),
	(58,0,94,11),
	(59,0,97,11),
	(60,0,97,10),
	(61,0,94,10),
	(62,0,123,10),
	(63,0,115,10),
	(64,0,62,12),
	(65,0,63,12),
	(66,0,65,12),
	(67,0,66,12),
	(68,0,45,13),
	(69,0,46,13),
	(70,0,48,14),
	(71,0,49,14),
	(72,0,47,14),
	(73,0,71,14),
	(74,0,50,14),
	(75,0,52,14),
	(76,0,51,14),
	(77,0,109,14),
	(78,0,88,14),
	(79,0,89,14),
	(80,0,87,7),
	(81,0,75,15),
	(82,0,82,15),
	(83,0,77,15),
	(84,0,81,15),
	(87,0,35,16),
	(88,0,38,16),
	(89,0,2,17),
	(90,0,90,5),
	(91,0,136,10),
	(92,0,134,3),
	(93,0,11,18),
	(94,0,121,18);

/*!40000 ALTER TABLE `gfw_permissions_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_permissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_permissions_users`;

CREATE TABLE `gfw_permissions_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `id_gfw_permissions` bigint DEFAULT '0',
  `id_gfw_users` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `USER` (`id_gfw_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_permissions_users` WRITE;
/*!40000 ALTER TABLE `gfw_permissions_users` DISABLE KEYS */;

INSERT INTO `gfw_permissions_users` (`id`, `idd`, `id_gfw_permissions`, `id_gfw_users`)
VALUES
	(1,0,2,3113),
	(2,0,14,3113),
	(3,0,10,3113),
	(4,0,13,3113),
	(5,0,12,3113),
	(6,0,5,3113),
	(7,0,16,4),
	(8,0,17,4);

/*!40000 ALTER TABLE `gfw_permissions_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela gfw_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_posts`;

CREATE TABLE `gfw_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `id_users` bigint DEFAULT '0',
  `locale` char(5) DEFAULT NULL,
  `keyword` varchar(60) DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '0',
  `date_creation` datetime DEFAULT '0000-00-00 00:00:00',
  `date_publication` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modification` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelation` datetime DEFAULT '0000-00-00 00:00:00',
  `tags` varchar(150) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `content` text,
  `url` varchar(100) DEFAULT NULL,
  `file_type` varchar(45) DEFAULT NULL,
  `shares` bigint DEFAULT '0',
  `likes` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `USER` (`idd`),
  KEY `KEYWORD` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela gfw_themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_themes`;

CREATE TABLE `gfw_themes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idd` bigint DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `gfw_themes` WRITE;
/*!40000 ALTER TABLE `gfw_themes` DISABLE KEYS */;

INSERT INTO `gfw_themes` (`id`, `idd`, `name`, `description`)
VALUES
	(1,0,'sindauto','Vermelho'),
	(2,0,'giusoft','GiuSoft'),
	(3,0,'seeit','Preto menor'),
	(4,0,'menuo','Laranja'),
	(5,0,'amelia','Divertido'),
	(6,0,'bootstrap','Branco com azul'),
	(7,0,'cosmo','Escuro'),
	(8,0,'cyborg','Preto'),
	(9,0,'cerulean','Azul claro'),
	(10,0,'flatly','Azul escuro com verde claro'),
	(11,0,'journal','Jornal salmon'),
	(12,0,'paper','Android'),
	(13,0,'simplex','Branco com vermelho'),
	(14,0,'slate','Cinza'),
	(15,0,'spacelab','Cinza degradee'),
	(16,0,'united','Laranja escuro'),
	(17,0,'yeti','Cinza e amarelo'),
	(18,0,'dodo','Amarelo sutil'),
	(19,0,'dodogreen','Verde sutil'),
	(20,0,'grass','Verde grama');

/*!40000 ALTER TABLE `gfw_themes` ENABLE KEYS */;
UNLOCK TABLES;




# Dump de tabela grupos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) DEFAULT '1',
  `codigo` varchar(15) DEFAULT NULL,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;

INSERT INTO `grupos` (`id`, `ativo`, `codigo`, `descricao`)
VALUES
	(1,1,'001','Matéria prima'),
	(2,1,'002','Produto acabado'),
	(3,1,'003','Imobilizado');

/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela grupos_combustivel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grupos_combustivel`;

CREATE TABLE `grupos_combustivel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) DEFAULT '',
  `descricao` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `grupos_combustivel` WRITE;
/*!40000 ALTER TABLE `grupos_combustivel` DISABLE KEYS */;

INSERT INTO `grupos_combustivel` (`id`, `codigo`, `descricao`)
VALUES
	(1,'610501001','OUTROS OLEOS LUBRIFICANTES BASICOS'),
	(2,'620101001','Hidraulico'),
	(3,'620101002','Engrenagens e sistem'),
	(4,'620101008','Outros Oleos Lubrifi'),
	(5,'620301001','Oleos Lubrificantes'),
	(6,'620501001','CICLO OTTO'),
	(7,'620501002','Ciclo Diesel'),
	(8,'620502001','OLEOS LUBRIFICANTES'),
	(9,'620503001','Transmissoes e siste'),
	(10,'620504001','Transmissao automati'),
	(11,'620505001','OUTROS OLEOS LUBRIFICANTES AUTOMOTIVOS'),
	(12,'620601004','OUTROS OLEOS LUBRIFI'),
	(13,'650101001','Graxas Minerais'),
	(14,'650101002','Outras Graxas'),
	(15,'650101003','GRAXAS'),
	(16,'110203073','ABO 3'),
	(17,'110204001','ABOOZAR'),
	(18,'110204002','ABU ASAFAH'),
	(19,'140101027','ACIDO GRAXO DE OLEO DE PALMA / DENDÊ'),
	(20,'140101026','ACIDO GRAXO DE OLEO DE SOJA'),
	(21,'740101005','ADITIVOS PARA BIODIESEL'),
	(22,'740101004','ADITIVOS PARA ETANOL HIDRATADO'),
	(23,'740101001','ADITIVOS PARA GASOLINA'),
	(24,'740101006','ADITIVOS PARA LUBRIFICANTES'),
	(25,'740101002','ADITIVOS PARA ÓLEO DIESEL'),
	(26,'110203083','AGBAMI'),
	(27,'910101001','AGUA'),
	(28,'110103001','AGUA GRANDE'),
	(29,'330101001','AGUARRAS MINERAL'),
	(30,'110203091','AKPO'),
	(31,'120204001','AL KHAYMAH'),
	(32,'110106001','ALAGOANO'),
	(33,'120206001','ALBA FIELD'),
	(34,'110101001','ALBACORA'),
	(35,'110101042','ALBACORA LESTE'),
	(36,'810201001','ALCOOL METILICO'),
	(37,'110201067','ALEN CONDENSATE'),
	(38,'110204003','ALIF'),
	(39,'330201005','ALQUILBENZENO AB10'),
	(40,'330201006','ALQUILBENZENO AB11'),
	(41,'330201004','ALQUILBENZENO AB9'),
	(42,'110105001','ALTO DO RODRIGUES'),
	(43,'110203072','AMENAN BLEND'),
	(44,'110203001','AMNA'),
	(45,'110201001','ANACO WAX'),
	(46,'110101002','ANEQUIM'),
	(47,'110203002','ANGOLANO'),
	(48,'120205010','ANOA'),
	(49,'110203003','ANTAN'),
	(50,'110204004','ARABE EXTRA LEVE'),
	(51,'110204005','ARABE LEVE'),
	(52,'110204006','ARABE MEDIO'),
	(53,'110204007','ARABE MEDIO BANOCO'),
	(54,'110204008','ARABE MEDIO ZULUF'),
	(55,'110204009','ARABE PESADO'),
	(56,'110204010','ARABE RECON'),
	(57,'110204011','ARABE SUPER LEVE'),
	(58,'110105027','ARACARI'),
	(59,'110103003','ARACAS'),
	(60,'110103002','ARATU'),
	(61,'110105002','ARATUM'),
	(62,'110205001','ARDJUNA'),
	(63,'120203002','ARGELINO'),
	(64,'120205001','ARUM'),
	(65,'110203004','ARZEW'),
	(66,'120203001','AR-720'),
	(67,'530102001','ASFALTO NATURAL'),
	(68,'530101002','ASFALTOS DILUÍDOS'),
	(69,'110206023','ASGARD BLEND'),
	(70,'110108001','ATUM'),
	(71,'110105017','AURI'),
	(72,'110206019','AZERJ LIGHT'),
	(73,'110205023','BACH HO'),
	(74,'110203092','BACH HO'),
	(75,'110201002','BACHAQUERO'),
	(76,'120202001','BADAK'),
	(77,'110101003','BADEJO'),
	(78,'110101004','BAGRE'),
	(79,'110103004','BAIANO BORDA NORDESTE'),
	(80,'110103005','BAIANO MISTURA'),
	(81,'110207010','BALNAVES'),
	(82,'110203097','BAOBAB'),
	(83,'110205037','BARANTAI'),
	(84,'110101005','BARRACUDA'),
	(85,'110203096','BARROW ISLAND'),
	(86,'110204012','BASRAH LEVE'),
	(87,'110204013','BASRAH MEDIO'),
	(88,'110204014','BASRAH PESADO'),
	(89,'110102001','BAS-60'),
	(90,'120207003','BAYU UNDAN'),
	(91,'110201003','BCF'),
	(92,'110201004','BCF 22'),
	(93,'110201005','BCF 23'),
	(94,'110201006','BCF 24'),
	(95,'110206001','BEATRICE'),
	(96,'110205002','BEKOK'),
	(97,'110203005','BELAYM'),
	(98,'110205003','BELIDA'),
	(99,'330201001','BENZENO'),
	(100,'110206002','BERYL'),
	(101,'110101006','BICUDO'),
	(102,'110101007','BIJUPIRÁ'),
	(103,'110101038','BIJUPIRA/SALEMA'),
	(104,'120205002','BINTULU'),
	(105,'820101001','BIODIESEL B100'),
	(106,'820101010','BIODIESEL FORA DE ESPECIFICAÇÃO'),
	(107,'820101999','BIODIESEL FORA DE ESPECIFICAÇÃO'),
	(108,'110206003','BLACK GASOIL CRUDE OIL'),
	(109,'110201007','BOLIVIAN BLEND'),
	(110,'120201001','BOLIVIANO'),
	(111,'110201008','BOLIVIANO'),
	(112,'110103017','BOM LUGAR'),
	(113,'110205004','BOMBAY HIGH'),
	(114,'110203077','BONGA'),
	(115,'110101008','BONITO'),
	(116,'110203006','BONNY LEVE'),
	(117,'110203007','BONNY MEDIO'),
	(118,'110201009','BOSCAN'),
	(119,'110203008','BOURI'),
	(120,'110203009','BRASS BLEND'),
	(121,'110203010','BRASS RIVER'),
	(122,'120203004','BREGA'),
	(123,'110206004','BRENT'),
	(124,'610101009','BRIGHT STOCK'),
	(125,'610801001','BRIGHT STOCK'),
	(126,'120205003','BRUNEI'),
	(127,'110205005','BRUNEI LIGHT'),
	(128,'610811001','BS'),
	(129,'610812001','BS'),
	(130,'610803003','BS'),
	(131,'610805001','BS 150'),
	(132,'610806003','BS 2500'),
	(133,'110203092','BU ATTIFEL'),
	(134,'110204015','BURGAN'),
	(135,'210202003','BUTADIENO'),
	(136,'210202001','BUTANO'),
	(137,'210202002','BUTANO ESPECIAL'),
	(138,'110105018','BV'),
	(139,'110203011','CABINA/TAKULA'),
	(140,'110203012','CABINDA'),
	(141,'110101009','CABIÚNAS MISTURA'),
	(142,'110104001','CAÇÃO'),
	(143,'110104006','CACHALOTE'),
	(144,'110106010','CAJUEIRO'),
	(145,'610802001','CALPAR 150'),
	(146,'610802002','CALPAR 500'),
	(147,'110202007','CALYPSO'),
	(148,'110106002','CAMORIM'),
	(149,'110111002','CANÁRIO'),
	(150,'110103006','CANDEIAS'),
	(151,'110105003','CANTO DO AMARO'),
	(152,'110201010','CAÑADON SECO'),
	(153,'110201011','CAÑO LIMÓN'),
	(154,'110201064','CARABOBO'),
	(155,'110201012','CARANDA'),
	(156,'110101010','CARAPEBA'),
	(157,'110101011','CARATINGA'),
	(158,'110108002','CARAUNAS'),
	(159,'110107001','CARAVELA'),
	(160,'120202002','CARLINE'),
	(161,'110202011','CASCADE CHINOOK'),
	(162,'110106003','CASTANHAL'),
	(163,'110201066','CASTILLA BLEND'),
	(164,'110108003','CEARÁ MAR'),
	(165,'110203085','CEIBA'),
	(166,'110201013','CEUTA'),
	(167,'110207001','CHALLIS'),
	(168,'110205034','CHAMPION'),
	(169,'110105023','CHAUÁ'),
	(170,'110101012','CHERNE'),
	(171,'110205031','CHIM SÃO'),
	(172,'110201014','CHUBUT'),
	(173,'620501002','CICLO DIESEL'),
	(174,'620501001','CICLO OTTO'),
	(175,'610101005','CILINDRO I'),
	(176,'610101006','CILINDRO II'),
	(177,'530101001','CIMENTOS ASFÁLTICOS'),
	(178,'530101020','CIMENTOS ASFÁLTICOS DE PETRÓLEO MODIFICADOS POR BORRACHA MOÍDA DE PNEUS (ASFALTOS BORRACHA)'),
	(179,'530101018','CIMENTOS ASFÁLTICOS DE PETRÓLEO MODIFICADOS POR POLÍMEROS'),
	(180,'110205006','CINTA'),
	(181,'110201015','COBLAN BLEND'),
	(182,'110203013','COCO'),
	(183,'110202001','COLD LAKE BLEND'),
	(184,'120104001','CONDENSADO CAMARUPIM'),
	(185,'120102001','CONDENSADO PARA PETROQUÍMICA'),
	(186,'120104002','CONDENSADO PEROA'),
	(187,'110205024','CONDENSADO SENIPAH'),
	(188,'120205009','CONDENSADO SENIPAH'),
	(189,'610804001','CONOSOL 260'),
	(190,'540101002','COQUE CALCINADO'),
	(191,'540101001','COQUE VERDE'),
	(192,'110107002','CORAL'),
	(193,'610806006','CORE 100'),
	(194,'610806007','CORE 150'),
	(195,'610806008','CORE 2500'),
	(196,'610806009','CORE 600'),
	(197,'620601003','CORRENTE DE MOTOSSERRA'),
	(198,'110201016','CORRIENTES'),
	(199,'110101013','CORVINA'),
	(200,'120207001','COSSACK'),
	(201,'110206020','CPC BLEND'),
	(202,'110104008','CREJOA'),
	(203,'110201017','CUPIAGUA'),
	(204,'110108004','CURIMÃ/ESPADA'),
	(205,'110201018','CUSIANA'),
	(206,'330201007','C9 DIHIDROGENADO (OU C9 DE PIRÓLISE)'),
	(207,'110205007','DAÍ HUNG'),
	(208,'110203086','DALIA'),
	(209,'110205008','DAQUING'),
	(210,'340101002','DERIVADOS LEVES INTERMEDIÁRIOS'),
	(211,'130202002','DERIVADOS LEVES PARA REPROCESSAMENTO'),
	(212,'430101002','DERIVADOS MÉDIOS INTERMEDIÁRIOS'),
	(213,'130202003','DERIVADOS MÉDIOS PARA REPROCESSAMENTO'),
	(214,'560101002','DERIVADOS PESADOS INTERMEDIÁRIOS'),
	(215,'130202004','DERIVADOS PESADOS PARA REPROCESSAMENTO'),
	(216,'820101032','DIESEL B S10 PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(217,'820101026','DIESEL B S1800 NÃO RODOVIÁRIO PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(218,'820101026','DIESEL B S1800 PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(219,'820101032','DIESEL B S50 PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(220,'820101027','DIESEL B S500 PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(221,'820101004','DIESEL B10'),
	(222,'820101005','DIESEL B15'),
	(223,'820101022','DIESEL B2 ESPECIAL - 200 PPM ENXOFRE'),
	(224,'820101007','DIESEL B2 INTERIOR ADITIVADO'),
	(225,'820101002','DIESEL B2 INTERIOR COMUM'),
	(226,'820101009','DIESEL B2 METROPOLITANO ADITIVADO'),
	(227,'820101008','DIESEL B2 METROPOLITANO COMUM'),
	(228,'820101014','DIESEL B20 INTERIOR ADITIVADO'),
	(229,'820101006','DIESEL B20 INTERIOR COMUM'),
	(230,'820101016','DIESEL B20 METROPOLITANDO ADITIVADO'),
	(231,'820101015','DIESEL B20 METROPOLITANO COMUM'),
	(232,'820101031','DIESEL B20 S10 ADITIVADO'),
	(233,'820101030','DIESEL B20 S10 COMUM'),
	(234,'820101014','DIESEL B20 S1800 - ADITIVADO'),
	(235,'820101006','DIESEL B20 S1800 - COMUM'),
	(236,'820101014','DIESEL B20 S1800 NÃO RODOVIÁRIO - ADITIVADO'),
	(237,'820101006','DIESEL B20 S1800 NÃO RODOVIÁRIO - COMUM'),
	(238,'820101031','DIESEL B20 S50 ADITIVADO'),
	(239,'820101030','DIESEL B20 S50 COMUM'),
	(240,'820101016','DIESEL B20 S500 - ADITIVADO'),
	(241,'820101015','DIESEL B20 S500 - COMUM'),
	(242,'820101025','DIESEL B30'),
	(243,'820101007','DIESEL B4 INTERIOR ADITIVADO'),
	(244,'820101002','DIESEL B4 INTERIOR COMUM'),
	(245,'820101026','DIESEL B4 INTERIOR PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(246,'820101009','DIESEL B4 METROPOLITANO ADITIVADO'),
	(247,'820101008','DIESEL B4 METROPOLITANO COMUM'),
	(248,'820101027','DIESEL B4 METROPOLITANO PARA GERAÇÃO DE ENERGIA ELÉTRICA'),
	(249,'820101007','DIESEL B4 S1800 - ADITIVADO'),
	(250,'820101002','DIESEL B4 S1800 - COMUM'),
	(251,'820101028','DIESEL B4 S50 ADITIVADO'),
	(252,'820101029','DIESEL B4 S50 COMUM'),
	(253,'820101009','DIESEL B4 S500 - ADITIVADO'),
	(254,'820101008','DIESEL B4 S500 - COMUM'),
	(255,'820101011','DIESEL B5 INTERIOR ADITIVADO'),
	(256,'820101003','DIESEL B5 INTERIOR COMUM'),
	(257,'820101013','DIESEL B5 METROPOLITANO ADITIVADO'),
	(258,'820101012','DIESEL B5 METROPOLITANO COMUM'),
	(259,'820101017','DIESEL MARÍTIMO - DMA B2'),
	(260,'820101018','DIESEL MARÍTIMO - DMA B5'),
	(261,'820101019','DIESEL MARÍTIMO - DMB B2'),
	(262,'820101020','DIESEL MARÍTIMO - DMB B5'),
	(263,'820101021','DIESEL NÁUTICO B2 ESPECIAL - 200 PPM ENXOFRE'),
	(264,'330101003','DILUENTE DE TINTAS'),
	(265,'130202006','DILUENTE PARA REPROCESSAMENTO'),
	(266,'110203014','DJENO BLEND'),
	(267,'420201001','DMA - MGO'),
	(268,'420201003','DMB - MDO'),
	(269,'120204010','DOLPHIN'),
	(270,'110103007','DOM JOÃO'),
	(271,'110204017','DOROOD'),
	(272,'110204051','DSL'),
	(273,'110204018','DUBAI'),
	(274,'110205035','DULANG'),
	(275,'110205022','DURI CRUDE OIL'),
	(276,'110203069','EA CRUDE'),
	(277,'110203015','EAST ZEIT MIX'),
	(278,'110203104','EBOME'),
	(279,'610903001','EHC 45'),
	(280,'610903002','EHC 60'),
	(281,'110206005','EKOFISH'),
	(282,'110203016','EL HUEMEL'),
	(283,'110203017','EL MORGAN'),
	(284,'110203018','EL ORIENTE'),
	(285,'110203088','EL SHARARA'),
	(286,'110203019','EMERAUDE'),
	(287,'530101003','EMULSÕES ASFÁLTICAS'),
	(288,'530101019','EMULSÕES ASFÁLTICAS CATIÔNICAS MODIFICADAS POR POLÍMEROS ELASTOMÉRICOS'),
	(289,'110101014','ENCHOVA'),
	(290,'620101002','ENGRENAGENS E SISTEMAS CIRCULATÓRIOS'),
	(291,'720101001','ENXOFRE LÍQUIDO'),
	(292,'720101002','ENXOFRE SÓLIDO'),
	(293,'120205004','ERAWAN'),
	(294,'110203079','ERHA'),
	(295,'110203020','ES SIDER'),
	(296,'110201019','ESCALANTE'),
	(297,'110203021','ESCRAVOS'),
	(298,'110108005','ESPADA'),
	(299,'110101015','ESPADARTE'),
	(300,'110104002','ESPIRITO SANTO'),
	(301,'110101016','ESPÍRITO SANTO SUBMARINO'),
	(302,'110206025','ESPO'),
	(303,'120203007','ESPOIR'),
	(304,'620101007','ESTAMPAGEM'),
	(305,'140102001','ÉSTER METÍLICO'),
	(306,'110105004','ESTREITO'),
	(307,'110107003','ESTRELA DO MAR'),
	(308,'110203095','ETAME'),
	(309,'210301001','ETANO'),
	(310,'810102001','ETANOL ANIDRO'),
	(311,'810102004','ETANOL ANIDRO COM CORANTE'),
	(312,'810102002','ETANOL ANIDRO FORA DE ESPECIFICAÇÃO'),
	(313,'130201002','ETANOL ANIDRO INSUMO PARA BIODIESEL'),
	(314,'810102003','ETANOL ANIDRO PADRÃO'),
	(315,'810101002','ETANOL HIDRATADO ADITIVADO'),
	(316,'810101001','ETANOL HIDRATADO COMUM'),
	(317,'810101003','ETANOL HIDRATADO FORA DE ESPECIFICAÇÃO'),
	(318,'210301002','ETENO'),
	(319,'330201010','ETILBENZENO'),
	(320,'611003001','ETRO 4'),
	(321,'611003002','ETRO 6'),
	(322,'611003003','ETRO 8'),
	(323,'110204016','FAO BLEND'),
	(324,'110105005','FAZENDA ALEGRE'),
	(325,'110105006','FAZENDA BELÉM'),
	(326,'110105007','FAZENDA POCINHO'),
	(327,'110104003','FAZENDA SÃO RAFAEL'),
	(328,'610904001','FLINT HILLS'),
	(329,'110206006','FLOTTA'),
	(330,'110206007','FLOTTA OCIDENTAL'),
	(331,'110203022','FORCADOS'),
	(332,'110204019','FOROOZAN'),
	(333,'110206008','FORTIES'),
	(334,'110206009','FORTIES BLEND'),
	(335,'110101043','FRADE'),
	(336,'110201020','FURRIAL'),
	(337,'110104009','GAIVOTA'),
	(338,'110203023','GAMBA'),
	(339,'110101017','GAROUPA'),
	(340,'110101018','GAROUPINHA'),
	(341,'210302004','GÁS ÁCIDO'),
	(342,'210101001','GÁS COMBUSTÍVEL'),
	(343,'210302003','GÁS DE XISTO'),
	(344,'210302002','GÁS INTERMEDIÁRIO'),
	(345,'210204001','GÁS LIQUEFEITO INTERMEDIÁRIO'),
	(346,'220101003','GÁS NATURAL COMPRIMIDO'),
	(347,'220101004','GÁS NATURAL LIQUEFEITO'),
	(348,'220101002','GÁS NATURAL SECO'),
	(349,'220101001','GÁS NATURAL ÚMIDO'),
	(350,'220101005','GÁS NATURAL VEICULAR'),
	(351,'220101006','GÁS NATURAL VEICULAR PADRÃO'),
	(352,'130202001','GASES LIQUEFEITOS PARA REPROCESSAMENTO'),
	(353,'130202005','GASÓLEO PARA REPROCESSAMENTO'),
	(354,'520101001','GASÓLEOS'),
	(355,'320101001','GASOLINA A COMUM'),
	(356,'320101003','GASOLINA A FORA DE ESPECIFICAÇÃO'),
	(357,'320101002','GASOLINA A PREMIUM'),
	(358,'320103001','GASOLINA AUTOMOTIVA PADRÃO'),
	(359,'320102002','GASOLINA C ADITIVADA'),
	(360,'320102001','GASOLINA C COMUM'),
	(361,'320102004','GASOLINA C FORA DE ESPECIFICAÇÃO'),
	(362,'320102003','GASOLINA C PREMIUM'),
	(363,'320201001','GASOLINA DE AVIAÇÃO'),
	(364,'320201002','GASOLINA DE AVIAÇÃO FORA DE ESPECIFICAÇÃO'),
	(365,'320103001','GASOLINA DE REFERÊNCIA'),
	(366,'220102001','GASOLINA NATURAL (C5+)'),
	(367,'320301002','GASOLINA PARA EXPORTAÇÃO'),
	(368,'110204020','GAVARZIN'),
	(369,'110203024','GEISUM'),
	(370,'120205012','GERAGAI'),
	(371,'110207002','GIPPSLAND BLEND'),
	(372,'110203087','GIRASSOL'),
	(373,'730101002','GLICERINA'),
	(374,'210203001','GLP'),
	(375,'210203002','GLP FORA DE ESPECIFICAÇÃO'),
	(376,'110104005','GOLFINHO'),
	(377,'140101023','GORDURA BOVINA'),
	(378,'140101024','GORDURA DE FRANGO'),
	(379,'140101025','GORDURA DE PORCO'),
	(380,'650101004','GRAXAS DE CALCIO'),
	(381,'650101003','GRAXAS DE LITIO'),
	(382,'650101001','GRAXAS MINERAIS'),
	(383,'110207003','GRIFFIN'),
	(384,'110201021','GUAFITA BLEND'),
	(385,'110103013','GUANAMBI'),
	(386,'110201022','GUANIPA'),
	(387,'110203025','GULF OF SUEZ'),
	(388,'110203026','GULF OF SUEZ MIX'),
	(389,'110206011','GULL FALKS'),
	(390,'110206010','GULL FALKS C'),
	(391,'110203027','HASSI MESSAOUD'),
	(392,'110203028','HASSI RMEL'),
	(393,'110203028','HASSI RMEL'),
	(394,'330101008','HEPTANO'),
	(395,'330101002','HEXANO'),
	(396,'330101009','HEXENO'),
	(397,'110202009','HIBERNIA'),
	(398,'110201068','HIDES'),
	(399,'620101001','HIDRÁULICO'),
	(400,'610201001','HIDROGENADO LEVE'),
	(401,'610201002','HIDROGENADO MÉDIO'),
	(402,'610201003','HIDROGENADO PESADO'),
	(403,'710101001','HIDROGÊNIO'),
	(404,'110203074','HUNGO'),
	(405,'610808001','HVI 120'),
	(406,'610808002','HVI 60'),
	(407,'110201023','HYDRA'),
	(408,'110103008','ILHÉUS'),
	(409,'110203029','IMA LIGHT'),
	(410,'120205005','INDIANO'),
	(411,'110204021','IRANIANO LEVE'),
	(412,'110204022','IRANIANO MISTURA'),
	(413,'110204023','IRANIANO PESADO'),
	(414,'620101004','ISOLANTE TIPO A'),
	(415,'620101005','ISOLANTE TIPO B'),
	(416,'330101010','ISOPENTANO'),
	(417,'110202002','ISTHMUS'),
	(418,'110202003','ISTHMUS MAYA'),
	(419,'110207004','JABIRU'),
	(420,'110101046','JABUTI'),
	(421,'110204024','JAMBUR BAR HASSAN'),
	(422,'110113001','JIRIBATUBA'),
	(423,'110105015','JOÃO DE BARRO'),
	(424,'110101019','JUBARTE'),
	(425,'110203098','JUBILEE'),
	(426,'110103015','JURITI'),
	(427,'110205025','KAJI SEMOGA'),
	(428,'110204025','KANGAN'),
	(429,'110204026','KHAFJI'),
	(430,'110204027','KHAFJI BLEND'),
	(431,'120204009','KHUFF'),
	(432,'110205026','KIKEH'),
	(433,'110204028','KIRKUK'),
	(434,'110204029','KIRKUK BLEND'),
	(435,'110203080','KISSANJE'),
	(436,'120207004','KITAN'),
	(437,'110203030','KITINA'),
	(438,'110105025','KOCH'),
	(439,'110203031','KOLE'),
	(440,'110203084','KUITO'),
	(441,'110203032','KUTUBU'),
	(442,'110204030','KUWAIT'),
	(443,'110205009','LABUAN'),
	(444,'110104004','LAGOA PARDA'),
	(445,'110201024','LAGOCINCO'),
	(446,'110201025','LAGOCINCO LIVIANO'),
	(447,'110201026','LAGOMEDIO'),
	(448,'110201027','LAGOTRECO'),
	(449,'110201028','LAGOTRECO HEAVY'),
	(450,'110201029','LAGOTRECO MEDIO'),
	(451,'110201030','LAGUNA'),
	(452,'110205036','LALANG'),
	(453,'110207005','LAMINARIA'),
	(454,'110204031','LAVAN BLEND'),
	(455,'110207006','LEGENDRE'),
	(456,'110201031','LEONA'),
	(457,'110201032','LEONA 21,9'),
	(458,'110201033','LEONA 24'),
	(459,'120204002','LIBIA'),
	(460,'110101020','LINGUADO'),
	(461,'120203006','LION'),
	(462,'220102002','LÍQUIDO DE GÁS NATURAL'),
	(463,'110105008','LIVRAMENTO'),
	(464,'110203033','LOKELE'),
	(465,'110105009','LORENA'),
	(466,'110201034','LORETO'),
	(467,'110204053','LOWER ZAKUM'),
	(468,'110203034','LUCINA MARINE'),
	(469,'110203035','LUCULA'),
	(470,'640201001','MACROOLEOSAS'),
	(471,'120205011','MALAMPAYA'),
	(472,'110101021','MALHADO'),
	(473,'120103001','MANATI'),
	(474,'110203036','MANDJI'),
	(475,'120204003','MARGHAM'),
	(476,'110201035','MARIA IGNES'),
	(477,'110204032','MARIB LIGHT'),
	(478,'110101022','MARIMBA'),
	(479,'110201036','MARLAGO'),
	(480,'110101023','MARLIM'),
	(481,'110101024','MARLIM LESTE'),
	(482,'110101025','MARLIM SUL'),
	(483,'110101039','MARLIN/VOADOR'),
	(484,'110204033','MASILA BLEND'),
	(485,'120207002','MAUI'),
	(486,'110202004','MAYA'),
	(487,'110202005','MAYA LEVE'),
	(488,'110201069','MAYNA'),
	(489,'110203037','MBIA'),
	(490,'110203037','MBIA'),
	(491,'110201037','MEDANITO'),
	(492,'110203078','MELLITAH'),
	(493,'120203005','MELLITAH'),
	(494,'120204010','MELLITAH'),
	(495,'110201038','MEREY'),
	(496,'110201039','MEREY/LEONA'),
	(497,'120101001','MERLUZA'),
	(498,'110201040','MESA'),
	(499,'110201041','MESCLA VENEZUELANO'),
	(500,'740101007','METIL TERC BUTIL ETER - MTBE'),
	(501,'420201003','MGO'),
	(502,'640101001','MICROOLEOSAS'),
	(503,'110205027','MINAS'),
	(504,'110103009','MIRANGA'),
	(505,'110103010','MIRANGA/ÁGUA GRANDE'),
	(506,'110205010','MIRI LEVE'),
	(507,'120203008','MISKAR'),
	(508,'820101018','MIST. DIESEL MARÍTIMO-95% / BIODIESEL-5%'),
	(509,'820101017','MIST. DIESEL MARÍTIMO-98% / BIODIESEL-2%'),
	(510,'820101006','MIST. DIESEL-80% / BIODIESEL-20% - B20'),
	(511,'820101014','MIST. DIESEL-80% / BIODIESEL-20% - B20 INT ADITIV'),
	(512,'820101006','MIST. DIESEL-80% / BIODIESEL-20% - B20 INT COMUM'),
	(513,'820101016','MIST. DIESEL-80% / BIODIESEL-20% - B20 MET ADITIV'),
	(514,'820101015','MIST. DIESEL-80% / BIODIESEL-20% - B20 MET COMUM'),
	(515,'820101006','MIST. DIESEL-80% / BIODIESEL-20% - B5 INT COMUM'),
	(516,'820101005','MIST. DIESEL-85% / BIODIESEL-15% - B15'),
	(517,'820101004','MIST. DIESEL-90% / BIODIESEL-10% - B10'),
	(518,'820101003','MIST. DIESEL-95% / BIODIESEL-5% - B5'),
	(519,'820101011','MIST. DIESEL-95% / BIODIESEL-5% - B5 INT ADITIVADO'),
	(520,'820101003','MIST. DIESEL-95% / BIODIESEL-5% - B5 INT COMUM'),
	(521,'820101013','MIST. DIESEL-95% / BIODIESEL-5% - B5 MET ADITIVADO'),
	(522,'820101012','MIST. DIESEL-95% / BIODIESEL-5% - B5 MET COMUM'),
	(523,'820101002','MIST. DIESEL-98% / BIODIESEL-2% - B2'),
	(524,'820101007','MIST. DIESEL-98% / BIODIESEL-2% - B2 INT ADITIVADO'),
	(525,'820101002','MIST. DIESEL-98% / BIODIESEL-2% - B2 INT COMUM'),
	(526,'820101009','MIST. DIESEL-98% / BIODIESEL-2% - B2 MET ADITIVADO'),
	(527,'820101008','MIST. DIESEL-98% / BIODIESEL-2% - B2 MET COMUM'),
	(528,'110301001','MISTURA DE PETRÓLEOS'),
	(529,'110208001','MISTURA DE PETRÓLEOS IMPORTADOS'),
	(530,'110203038','MOANDA'),
	(531,'110203089','MONDO'),
	(532,'110201042','MONOGAS'),
	(533,'110101026','MOREIA'),
	(534,'620502001','MOTORES 2 TEMPOS'),
	(535,'110203039','MOUDI'),
	(536,'110202008','MSW EDMONTON'),
	(537,'110204034','MURBAN'),
	(538,'110207009','MUTINEER'),
	(539,'611201002','MVI (N) 40 - NAFTÊNICO'),
	(540,'611201003','MVI 1050 - NAFTÊNICO'),
	(541,'611201001','MVI(N) 170 - NAFTÊNICO'),
	(542,'610803002','N 500'),
	(543,'110110001','NACIONAL MISTURA'),
	(544,'310102001','NAFTA DE XISTO'),
	(545,'310103001','NAFTA FORA DE ESPECIFICAÇÃO'),
	(546,'310101001','NAFTA PETROQUÍMICA'),
	(547,'611207003','NAFTALENOS ALQUILADOS (AN)'),
	(548,'110101027','NAMORADO'),
	(549,'110205011','NANHAI LIGHT'),
	(550,'110201062','NAPO'),
	(551,'110203040','NEMBA'),
	(552,'610801002','NEUTRAL OIL 150'),
	(553,'610801004','NEUTRAL OIL 500'),
	(554,'610801005','NEUTRAL OIL 60'),
	(555,'610801003','NEUTRAL OIL300'),
	(556,'610905001','NEUTRAL 110'),
	(557,'610101002','NEUTRO LEVE'),
	(558,'610401002','NEUTRO LEVE RR'),
	(559,'610813002','NEUTRO LEVE RR'),
	(560,'610906002','NEUTRO LEVE RR'),
	(561,'610101003','NEUTRO MÉDIO'),
	(562,'610401003','NEUTRO MÉDIO RR'),
	(563,'610813003','NEUTRO MÉDIO RR'),
	(564,'610906003','NEUTRO MÉDIO RR'),
	(565,'610101004','NEUTRO PESADO'),
	(566,'610401004','NEUTRO PESADO RR'),
	(567,'610906004','NEUTRO PESADO RR'),
	(568,'610813004','NEUTRO PESADO RR'),
	(569,'611102001','NEXBASE 2002'),
	(570,'611102002','NEXBASE 2004'),
	(571,'611102003','NEXBASE 2006'),
	(572,'611102004','NEXBASE 2008'),
	(573,'611001001','NEXBASE 3030'),
	(574,'611001002','NEXBASE 3043'),
	(575,'611001003','NEXBASE 3050'),
	(576,'611001004','NEXBASE 3060'),
	(577,'611001005','NEXBASE 3080'),
	(578,'611202001','NH 10 - NAFTÊNICO'),
	(579,'611202002','NH 140 - NAFTÊNICO'),
	(580,'611202003','NH 20 - NAFTÊNICO'),
	(581,'110203041','NIGERIANO BRASS LIGHT'),
	(582,'110203042','NIGERIANO LEVE'),
	(583,'110203043','NIGERIANO LEVE QUA IBOE'),
	(584,'110203094','NILE BLEND'),
	(585,'110206024','NINIAN'),
	(586,'110203044','NKOSSA'),
	(587,'110203044','NKOSSA'),
	(588,'430101001','NORMAL PARAFINAS'),
	(589,'110206021','NORNE BLEND'),
	(590,'120204004','NORTH FIELD'),
	(591,'110207007','NORTH WEST SHELF'),
	(592,'611203002','NYNAS T22 - NAFTÊNICO'),
	(593,'110203045','ODUDU'),
	(594,'110201043','OFICINA'),
	(595,'110203046','OGUENDJO'),
	(596,'110203047','OKAN'),
	(597,'110203048','OKONO'),
	(598,'110203099','OKORO'),
	(599,'110203081','OKWORI'),
	(600,'430101004','ÓLEO COMB. P/ TURBINA GERADORA DE ENERGIA ELÉTRICA'),
	(601,'510101003','ÓLEO COMBUSTÍVEL A FORA DE ESPECIFICAÇÃO'),
	(602,'510101001','ÓLEO COMBUSTÍVEL A1'),
	(603,'510101002','ÓLEO COMBUSTÍVEL A2'),
	(604,'510102003','ÓLEO COMBUSTÍVEL B FORA DE ESPECIFICAÇÃO'),
	(605,'510102001','ÓLEO COMBUSTÍVEL B1'),
	(606,'510102002','ÓLEO COMBUSTÍVEL B2'),
	(607,'510201001','ÓLEO COMBUSTÍVEL MARÍTIMO'),
	(608,'510201002','ÓLEO COMBUSTÍVEL MARÍTIMO FORA DE ESPECIFICAÇÃO'),
	(609,'510201003','ÓLEO COMBUSTÍVEL MARÍTIMO MISTURA (MF)'),
	(610,'510301003','ÓLEO COMBUSTÍVEL PARA GERAÇÃO ELÉTRICA'),
	(611,'140101015','ÓLEO DE ABACATE (PERSIA AMERICANA)'),
	(612,'140101009','ÓLEO DE ALGODÃO (GOSSYPIUM HIRSUT)'),
	(613,'140101016','ÓLEO DE AMENDOIM (ORACHIS HYPOGEAE)'),
	(614,'140101017','ÓLEO DE ANDIROBA (CARAPA GUIANERSIS)'),
	(615,'140101005','ÓLEO DE BABAÇU (ORBINYA MARTIANA)'),
	(616,'140101014','ÓLEO DE BURITI'),
	(617,'140101018','ÓLEO DE COCO (COCUS NUMIFERA)'),
	(618,'140101006','ÓLEO DE COLZA/CANOLA (BRESSICA CAMPESTRIS)'),
	(619,'140101028','ÓLEO DE CRAMBE'),
	(620,'140101021','ÓLEO DE FRITURA USADO'),
	(621,'140101010','ÓLEO DE GIRASSOL (HELLANTHUS ANNUS)'),
	(622,'140101012','ÓLEO DE LINHAÇA'),
	(623,'140101013','ÓLEO DE MACAÚBA'),
	(624,'140101001','ÓLEO DE MAMONA (RICINUS COMMUNIS)'),
	(625,'140101030','ÓLEO DE MILHO'),
	(626,'140101011','ÓLEO DE NABO-FORRAGEIRO'),
	(627,'140101003','ÓLEO DE PALMA/DENDÊ (ELAEIS GUINEENSIS OU ELAEIS O'),
	(628,'140101002','ÓLEO DE PALMISTE'),
	(629,'140101008','ÓLEO DE PEQUI (JATROPHA CURCAS)'),
	(630,'140101007','ÓLEO DE PINHÃO-MANSO'),
	(631,'140101019','ÓLEO DE SÉSAMO (SESAMUN INDICUM)'),
	(632,'140101004','ÓLEO DE SOJA (GLYCINE MAX)'),
	(633,'560101001','ÓLEO DE XISTO'),
	(634,'420105001','ÓLEO DIESEL A S10'),
	(635,'420101005','ÓLEO DIESEL A S1800 - ADITIVADO'),
	(636,'420101004','ÓLEO DIESEL A S1800 - COMUM'),
	(637,'420101003','ÓLEO DIESEL A S1800 - FORA DE ESPECIFICAÇÃO'),
	(638,'420101005','ÓLEO DIESEL A S1800 NÃO RODOVIÁRIO - ADITIVADO'),
	(639,'420101004','ÓLEO DIESEL A S1800 NÃO RODOVIÁRIO - COMUM'),
	(640,'420101003','ÓLEO DIESEL A S1800 NÃO RODOVIÁRIO - FORA DE ESPECIFICAÇÃO'),
	(641,'420102006','ÓLEO DIESEL A S50'),
	(642,'420102005','ÓLEO DIESEL A S500 - ADITIVADO'),
	(643,'420102004','ÓLEO DIESEL A S500 - COMUM'),
	(644,'420102003','ÓLEO DIESEL A S500 - FORA DE ESPECIFICAÇÃO'),
	(645,'420104001','ÓLEO DIESEL AUTOMOTIVO ESPECIAL - ENXOFRE 200 PPM'),
	(646,'820101033','ÓLEO DIESEL B S10 - ADITIVADO'),
	(647,'820101034','ÓLEO DIESEL B S10 - COMUM'),
	(648,'420106001','ÓLEO DIESEL B S10 AMD 10'),
	(649,'820101011','ÓLEO DIESEL B S1800 - ADITIVADO'),
	(650,'820101003','ÓLEO DIESEL B S1800 - COMUM'),
	(651,'820101011','ÓLEO DIESEL B S1800 NÃO RODOVIÁRIO - ADITIVADO'),
	(652,'820101003','ÓLEO DIESEL B S1800 NÃO RODOVIÁRIO - COMUM'),
	(653,'820101028','ÓLEO DIESEL B S50 - ADITIVADO'),
	(654,'820101029','ÓLEO DIESEL B S50 - COMUM'),
	(655,'820101013','ÓLEO DIESEL B S500 - ADITIVADO'),
	(656,'820101012','ÓLEO DIESEL B S500 - COMUM'),
	(657,'420106002','ÓLEO DIESEL B S500 AMD 10'),
	(658,'830101001','ÓLEO DIESEL DE CANA AMD 100'),
	(659,'420301004','OLEO DIESEL DE REFERÊNCIA S300'),
	(660,'420301003','ÓLEO DIESEL FORA DE ESPECIFICAÇÃO'),
	(661,'420101005','ÓLEO DIESEL INTERIOR ADITIVADO - ENXOFRE 1800 PPM'),
	(662,'420101002','ÓLEO DIESEL INTERIOR (B) ADITIVADO'),
	(663,'420101001','ÓLEO DIESEL INTERIOR (B) COMUM'),
	(664,'420101003','ÓLEO DIESEL INTERIOR (B) FORA DE ESPECIFICAÇÃO'),
	(665,'420101004','ÓLEO DIESEL INTERIOR COMUM - ENXOFRE 1800 PPM'),
	(666,'420101003','ÓLEO DIESEL INTERIOR FORA DE ESPECIFICAÇÃO'),
	(667,'420201001','ÓLEO DIESEL MARÍTIMO'),
	(668,'420201002','ÓLEO DIESEL MARÍTIMO FORA DE ESPECIFICAÇÃO'),
	(669,'420102005','ÓLEO DIESEL METROPOLITANO ADITIVADO - ENXOFRE 500 PPM'),
	(670,'420102004','ÓLEO DIESEL METROPOLITANO COMUM - ENXOFRE 500 PPM'),
	(671,'420102002','ÓLEO DIESEL METROPOLITANO (D) ADITIVADO'),
	(672,'420102001','ÓLEO DIESEL METROPOLITANO (D) COMUM'),
	(673,'420102003','ÓLEO DIESEL METROPOLITANO (D) FORA DE ESPECIFICAÇÃO'),
	(674,'420102003','ÓLEO DIESEL METROPOLITANO FORA DE ESPECIFICAÇÃO'),
	(675,'420202001','ÓLEO DIESEL NÁUTICO ESPECIAL - ENXOFRE 200 PPM'),
	(676,'420301001','ÓLEO DIESEL PADRÃO'),
	(677,'420102006','ÓLEO DIESEL S50'),
	(678,'420103002','ÓLEO DIESEL S500 ADITIVADO'),
	(679,'420103001','ÓLEO DIESEL S500 COMUM'),
	(680,'420103003','ÓLEO DIESEL S500 FORA DE ESPECIFICAÇÃO'),
	(681,'611207002','ÓLEO MINERAL BRANCO'),
	(682,'611301001','ÓLEOS BÁSICOS - GRUPO I'),
	(683,'610601001','ÓLEOS BÁSICOS - GRUPO II'),
	(684,'610701001','ÓLEOS BÁSICOS - GRUPO III'),
	(685,'510301002','ÓLEOS COMBUSTÍVEIS PARA EXPORTAÇÃO'),
	(686,'620601001','ÓLEOS EXTENSORES E PLASTIFICANTES'),
	(687,'660101001','ÓLEOS LUB. PARAF E GRAXAS INTERMEDIÁRIOS'),
	(688,'620401001','ÓLEOS LUBRIFICANTES FERROVIÁRIOS'),
	(689,'620301001','ÓLEOS LUBRIFICANTES MARÍTIMOS'),
	(690,'620201001','ÓLEOS LUBRIFICANTES PARA AVIAÇÃO'),
	(691,'630101001','ÓLEOS LUBRIFICANTES USADOS OU CONTAMINADOS'),
	(692,'611207004','ÓLEOS VEGETAIS'),
	(693,'110202006','OLMECA'),
	(694,'110203093','OLOWI'),
	(695,'110204035','OMAN'),
	(696,'110203049','ORIBI'),
	(697,'110201044','ORIENTE'),
	(698,'110201045','ORITO'),
	(699,'110206012','OSEBERG'),
	(700,'120203003','OSO'),
	(701,'320301001','OUTRAS GASOLINAS'),
	(702,'320103002','OUTRAS GASOLINAS AUTOMOTIVAS'),
	(703,'650101002','OUTRAS GRAXAS'),
	(704,'310102002','OUTRAS NAFTAS'),
	(705,'640401001','OUTRAS PARAFINAS'),
	(706,'610907001','OUTRO'),
	(707,'610814001','OUTRO'),
	(708,'611107001','OUTRO'),
	(709,'611007001','OUTRO'),
	(710,'611207006','OUTRO'),
	(711,'140101029','OUTROS ÁCIDOS GRAXOS'),
	(712,'740101003','OUTROS ADITIVOS'),
	(713,'810201002','OUTROS ALCOÓIS'),
	(714,'530103001','OUTROS ASFALTOS'),
	(715,'340101003','OUTROS DERIVADOS LEVES'),
	(716,'430101003','OUTROS DERIVADOS MÉDIOS'),
	(717,'560101003','OUTROS DERIVADOS PESADOS'),
	(718,'611207001','OUTROS ÉSTERES SINTÉTICOS'),
	(719,'210302001','OUTROS GASES'),
	(720,'210204002','OUTROS GASES LIQUEFEITOS'),
	(721,'130201001','OUTROS INSUMOS BRUTOS'),
	(722,'530104001','OUTROS INSUMOS PARA ASFALTOS'),
	(723,'140101022','OUTROS MATERIAIS GRAXOS'),
	(724,'140101999','OUTROS MATERIAIS GRAXOS'),
	(725,'610201004','OUTROS NAFTÊNICOS'),
	(726,'510301001','OUTROS ÓLEOS COMBUSTÍVEIS'),
	(727,'420301002','OUTROS ÓLEOS DIESEL'),
	(728,'620601004','OUTROS ÓLEOS LUBRIFICANTES ACABADOS'),
	(729,'620505001','OUTROS ÓLEOS LUBRIFICANTES AUTOMOTIVOS'),
	(730,'610501001','OUTROS ÓLEOS LUBRIFICANTES BÁSICOS'),
	(731,'620101008','OUTROS ÓLEOS LUBRIFICANTES INDUSTRIAIS'),
	(732,'610101010','OUTROS PARAFÍNICOS'),
	(733,'110208002','OUTROS PETRÓLEOS IMPORTADOS'),
	(734,'110110002','OUTROS PETRÓLEOS NACIONAIS'),
	(735,'130202008','OUTROS PRODUTOS PARA REPROCESSAMENTO'),
	(736,'410103001','OUTROS QUEROSENES'),
	(737,'610301002','OUTROS SINTÉTICOS'),
	(738,'610302001','OUTROS SINTÉTICOS'),
	(739,'330101007','OUTROS SOLVENTES ALIFÁTICOS'),
	(740,'330201009','OUTROS SOLVENTES AROMÁTICOS'),
	(741,'730101001','OUTROS SUB-PRODUTOS'),
	(742,'110205033','OYONG'),
	(743,'110203050','PALANCA'),
	(744,'110101028','PAMPO'),
	(745,'611103001','PAO 4'),
	(746,'611106002','PAO 4'),
	(747,'611104001','PAO 40'),
	(748,'611106003','PAO 6'),
	(749,'611101007','PAO 8'),
	(750,'611106001','PAO 8'),
	(751,'110101049','PAPATERRA'),
	(752,'110101029','PARATI'),
	(753,'110101030','PARGO'),
	(754,'110104007','PARQUE DAS CONCHAS'),
	(755,'110111001','PAU LAVADO'),
	(756,'110203102','PAZFLOR'),
	(757,'610809002','PBS 30'),
	(758,'610809001','PBS 33'),
	(759,'610809003','PCL 45'),
	(760,'610809004','PCL 60'),
	(761,'120205006','PEMBINA'),
	(762,'110205032','PENARA BLEND'),
	(763,'110203051','PENNINGTON'),
	(764,'110101050','PEREGRINO'),
	(765,'110201065','PERENCO PERU BLEND'),
	(766,'110105028','PERIQUITO'),
	(767,'110105016','PESCADA/ARABAIANA'),
	(768,'611204001','PIB 24 - POLIBUTENO'),
	(769,'110201046','PILON'),
	(770,'110106007','PIRANEMA'),
	(771,'110101031','PIRAUNA'),
	(772,'611207005','PLIGLICÓIS'),
	(773,'110207008','PLUTO CONDENSADO'),
	(774,'110203082','PLUTONIO'),
	(775,'610809005','PNL 30'),
	(776,'610809006','PNM 55'),
	(777,'610809007','PNM 80'),
	(778,'610809008','PNP 95'),
	(779,'610301001','POLIALFAOLEFINA'),
	(780,'110101032','POLO NORDESTE'),
	(781,'110101047','POLVO'),
	(782,'110105021','POTI'),
	(783,'110105010','POTIGUAR TERRA'),
	(784,'611206001','PRIOLUBE 3970 - ÉSTER'),
	(785,'611206002','PRIOLUBE 3999 - ÉSTER'),
	(786,'620101003','PROCESSO'),
	(787,'210201001','PROPANO'),
	(788,'210201002','PROPANO ESPECIAL'),
	(789,'210201003','PROPENO'),
	(790,'610809009','PSP 09'),
	(791,'610809010','PTL 25'),
	(792,'610809011','PTP 85'),
	(793,'110105020','PTX'),
	(794,'110105022','PTX-11'),
	(795,'110205012','PULAI'),
	(796,'620601002','PULVERIZAÇÃO AGRÍCOLA'),
	(797,'120206003','PUROVSKY'),
	(798,'110204036','QATAR DUKHAN'),
	(799,'110204037','QATAR LAND'),
	(800,'110204038','QATAR MARINE'),
	(801,'110203101','QUARUN'),
	(802,'410101001','QUEROSENE DE AVIAÇÃO'),
	(803,'410101002','QUEROSENE DE AVIAÇÃO FORA DE ESPECIFICAÇÃO'),
	(804,'410102001','QUEROSENE ILUMINANTE'),
	(805,'410102002','QUEROSENE ILUMINANTE FORA DE ESPECIFICAÇÃO'),
	(806,'110103014','QUIAMBINA'),
	(807,'110203052','RABI'),
	(808,'330101005','RAFINADO DE PIRÓLISE'),
	(809,'330101006','RAFINADO DE REFORMA'),
	(810,'110205029','RANG DONG'),
	(811,'110203053','RAS BUDRAN'),
	(812,'120204008','RAS GAS'),
	(813,'110203054','RAS GHARIB'),
	(814,'110204039','RATAWI'),
	(815,'110201047','RECON BOLIVIANO'),
	(816,'110201048','RECON MEREY'),
	(817,'110103011','RECÔNCAVO'),
	(818,'340101001','REFORMADOS'),
	(819,'550101001','RESÍDUO AROMÁTICO (RARO)'),
	(820,'550101005','RESÍDUO ASFÁLTICO(RASF)'),
	(821,'550101002','RESÍDUO ATMOSFÉRICO (RAT)'),
	(822,'550101003','RESÍDUO DE VÁCUO'),
	(823,'550101004','RESÍDUO DE VÁCUO DE ALTO TEOR DE ENXOGRE'),
	(824,'130202007','RESÍDUO PARA REPROCESSAMENTO'),
	(825,'110105011','RGN MISTURA'),
	(826,'110201049','RINCÓN DE LOS SAUCES'),
	(827,'110101048','RJS-609'),
	(828,'110101033','RONCADOR'),
	(829,'110101040','RONCADOR LESTE'),
	(830,'110101045','RONCADOR MISTURA'),
	(831,'110101041','RONCADOR OESTE'),
	(832,'110204040','ROSTAM'),
	(833,'110105019','RT'),
	(834,'110205030','RUBY'),
	(835,'110204041','RUMAILA'),
	(836,'110105024','RV-1'),
	(837,'110203070','SABLE CRUDE OIL'),
	(838,'110203055','SAHARA MISTURA'),
	(839,'110204042','SALMAN'),
	(840,'110203075','SALTPOND'),
	(841,'110201050','SAN SEBASTIAN'),
	(842,'110201051','SANTA BARBARA'),
	(843,'110201052','SANTA CRUZ'),
	(844,'110201053','SANTA CRUZ DO SUL'),
	(845,'120201002','SANTA ROSA'),
	(846,'110105029','SÃO MANOEL'),
	(847,'110203056','SARIR'),
	(848,'110204043','SARKHOON'),
	(849,'110203103','SATURNO BLEND'),
	(850,'110203090','SAXI BLEND'),
	(851,'140101020','SEBO'),
	(852,'110103018','SEMPRE VIVA'),
	(853,'110106004','SERGIPANO MAR'),
	(854,'110106005','SERGIPANO MISTURA'),
	(855,'110106006','SERGIPANO TERRA'),
	(856,'110205028','SERIA LIGHT'),
	(857,'110105012','SERRARIA'),
	(858,'120204005','SHARJAH'),
	(859,'110205013','SHENGLI'),
	(860,'110201054','SHIVIYACU'),
	(861,'110101044','SIRI'),
	(862,'110204044','SIRRI'),
	(863,'110203057','SIRTICA'),
	(864,'110203058','SKIKDA'),
	(865,'120206002','SLEIPNER'),
	(866,'610811002','SN 150'),
	(867,'610806001','SN 150'),
	(868,'610807001','SN 150'),
	(869,'610805002','SN 150'),
	(870,'610810001','SN 150'),
	(871,'610803001','SN 150'),
	(872,'610812002','SN 150'),
	(873,'610806004','SN 275'),
	(874,'610812003','SN 330'),
	(875,'610806005','SN 330'),
	(876,'610811003','SN 500'),
	(877,'610810002','SN 500'),
	(878,'610807002','SN 500'),
	(879,'610805003','SN 500'),
	(880,'610812004','SN 500'),
	(881,'610812005','SN 600'),
	(882,'610806002','SN 600'),
	(883,'610812006','SN 85'),
	(884,'120206004','SNOHVIT'),
	(885,'330201008','SOLVENTE C9 (OU C9 AROMÁTICO)'),
	(886,'330101004','SOLVENTE PARA BORRACHA'),
	(887,'110204045','SORROSH'),
	(888,'110204046','SOUEDIA'),
	(889,'110201063','SOUTH BLEND'),
	(890,'110204055','SOUTHERN PARS'),
	(891,'110206013','SOVIET EXPORT BLEND'),
	(892,'110203059','SOYO'),
	(893,'110203060','SOYO 38'),
	(894,'611101001','SPECTRASYN 100'),
	(895,'611101002','SPECTRASYN 2'),
	(896,'611101003','SPECTRASYN 4'),
	(897,'611101004','SPECTRASYN 40'),
	(898,'611101005','SPECTRASYN 6'),
	(899,'611101006','SPECTRASYN 8'),
	(900,'610101001','SPINDLE'),
	(901,'610401001','SPINDLE RR'),
	(902,'610906001','SPINDLE RR'),
	(903,'610813001','SPINDLE RR'),
	(904,'611203001','SR 130 - NAFTÊNICO'),
	(905,'610905002','STAR 10'),
	(906,'610905003','STAR 12'),
	(907,'610905004','STAR 4'),
	(908,'610905005','STAR 6'),
	(909,'110206015','STATFJORD'),
	(910,'110206014','STATFJORD LOW SULFUR'),
	(911,'110204052','SUEDIE'),
	(912,'110205015','SUMATRAN HEAVY'),
	(913,'110205014','SUMATRAN LIGHT'),
	(914,'611105001','SYNFLUID PAO 100'),
	(915,'611105002','SYNFLUID PAO 4'),
	(916,'611105003','SYNFLUID PAO 40'),
	(917,'611105004','SYNFLUID PAO 6'),
	(918,'611105005','SYNFLUID PAO 8'),
	(919,'110204047','SYRIAN LIGHT'),
	(920,'611203003','T 9 - NAFTÊNICO'),
	(921,'110205016','TACHING'),
	(922,'110203061','TAKULA'),
	(923,'110205017','TAPIS'),
	(924,'110204054','TAQ TAQ'),
	(925,'110106009','TARTARUGA'),
	(926,'110203062','TCHATAMBA'),
	(927,'110206016','TENGIZ'),
	(928,'120205007','TERENGANU'),
	(929,'120201003','TERRA DEL FUEGO'),
	(930,'620101006','TÊXTIL / AMACIANTE DE FIBRAS'),
	(931,'120205008','THAI'),
	(932,'120204006','THAMAMA'),
	(933,'110201055','TIA JUANA'),
	(934,'110201056','TIA JUANA MEDIO'),
	(935,'110201057','TIA JUANA PESADO'),
	(936,'110103016','TIGRE'),
	(937,'110205018','TIONG'),
	(938,'110107005','TIRO'),
	(939,'330201002','TOLUENO'),
	(940,'620504001','TRANSMISSÃO AUTOMÁTICA'),
	(941,'620503001','TRANSMISSÕES E SISTEMAS HIDRÁULICOS'),
	(942,'110101034','TRILHA'),
	(943,'110107004','TUPI'),
	(944,'610101007','TURBINA LEVE'),
	(945,'610101008','TURBINA PESADO'),
	(946,'110105014','UBARANA/AGULHA'),
	(947,'110205019','UDANG'),
	(948,'110103012','UIRAPURU'),
	(949,'110203063','UKPOKITI'),
	(950,'611004001','ULTRA-S 2'),
	(951,'611004002','ULTRA-S 4'),
	(952,'611004003','ULTRA-S 6'),
	(953,'611004004','ULTRA-S 8'),
	(954,'120204007','UMM SAIF'),
	(955,'110204048','UMM SHAIF'),
	(956,'110105013','UPANEMA'),
	(957,'110204049','UPPER ZAKUM'),
	(958,'110206017','URAL'),
	(959,'110109001','URUCU'),
	(960,'110107006','URUGUA-TAMBAU'),
	(961,'110203100','USAN BLEND'),
	(962,'110203100','USAN BLEND'),
	(963,'110206027','VARANDEY'),
	(964,'120207006','VARANUS'),
	(965,'110201059','VASCONIA BLEND'),
	(966,'110201058','VASCONIA 29,3'),
	(967,'640301001','VASELINA'),
	(968,'110101035','VERMELHO'),
	(969,'611002001','VHVI 4'),
	(970,'611002002','VHVI 6'),
	(971,'611002003','VHVI 8'),
	(972,'110101036','VIOLA'),
	(973,'611205001','VISTONE A-10 - ÉSTER'),
	(974,'110206022','VITYAZ'),
	(975,'110101037','VOADOR'),
	(976,'110202010','WHITE ROSE'),
	(977,'110205020','WIDURI'),
	(978,'120207005','WOOLLYBUTT CRUDE'),
	(979,'110206018','WYTCH FARM'),
	(980,'110108006','XAREU/ATUM'),
	(981,'611005001','XHVI 4'),
	(982,'611005002','XHVI 8'),
	(983,'110203076','XICOMBA'),
	(984,'110205021','XIJIANG'),
	(985,'330201003','XILENOS'),
	(986,'130101001','XISTO BRUTO'),
	(987,'110201060','YANAYACU'),
	(988,'110203071','YOHO'),
	(989,'611006001','YUBASE 3'),
	(990,'611006002','YUBASE 4'),
	(991,'611006003','YUBASE 6'),
	(992,'110203065','ZAFIRO'),
	(993,'110203064','ZAIRE'),
	(994,'110206026','ZAKINSKAYA'),
	(995,'110204050','ZAKUM'),
	(996,'110203066','ZARZAITINE'),
	(997,'110203067','ZEIT BAY'),
	(998,'110201061','ZUATA'),
	(999,'110203068','ZUEITINA'),
	(1000,'110105026','1-FAC-2-RN'),
	(1001,'110106008','1-WW-1-BA'),
	(1002,'610902001','100N'),
	(1003,'610901005','100N'),
	(1004,'610901001','100R'),
	(1005,'610901002','150R'),
	(1006,'610901003','220R'),
	(1007,'610902002','225N'),
	(1008,'610902003','600N'),
	(1009,'610901004','600R');

/*!40000 ALTER TABLE `grupos_combustivel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela imp_cofins_cst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imp_cofins_cst`;

CREATE TABLE `imp_cofins_cst` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela imp_icms_cst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imp_icms_cst`;

CREATE TABLE `imp_icms_cst` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela imp_icms_mod
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imp_icms_mod`;

CREATE TABLE `imp_icms_mod` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela imp_icms_origem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imp_icms_origem`;

CREATE TABLE `imp_icms_origem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela imp_ipi_cst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imp_ipi_cst`;

CREATE TABLE `imp_ipi_cst` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela imp_pis_cst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imp_pis_cst`;

CREATE TABLE `imp_pis_cst` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela importacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `importacoes`;

CREATE TABLE `importacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `grupo` varchar(30) DEFAULT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `id_pessoas_proprietario` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `importacoes` WRITE;
/*!40000 ALTER TABLE `importacoes` DISABLE KEYS */;

INSERT INTO `importacoes` (`id`, `grupo`, `descricao`, `id_pessoas_proprietario`)
VALUES
	(1,'itens','Importação de itens - padrão',0),
	(2,'programacao_entrada','Importação progr. entrada - padrão',0),
	(3,'programacao_saida','Importação prog. saída - padrão',0),
	(4,'programacao_saida','Pedido saída TOTVS',0),
	(5,'programacao_saida','NFe',0),
	(6,'programacao_saida','Importação prog. saída (7Lub)',218);

/*!40000 ALTER TABLE `importacoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela importacoes_cabecalho
# ------------------------------------------------------------

DROP TABLE IF EXISTS `importacoes_cabecalho`;

CREATE TABLE `importacoes_cabecalho` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_importacoes` bigint unsigned NOT NULL DEFAULT '0',
  `ordem` int NOT NULL DEFAULT '0',
  `nome` varchar(60) NOT NULL DEFAULT '',
  `descricao` text NOT NULL,
  `tipo` varchar(30) NOT NULL DEFAULT '',
  `tamanho` int NOT NULL DEFAULT '0',
  `validacao` varchar(60) DEFAULT '',
  `campo_chave` tinyint(1) DEFAULT '0',
  `campo_util` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `importacoes_cabecalho` WRITE;
/*!40000 ALTER TABLE `importacoes_cabecalho` DISABLE KEYS */;

INSERT INTO `importacoes_cabecalho` (`id`, `id_importacoes`, `ordem`, `nome`, `descricao`, `tipo`, `tamanho`, `validacao`, `campo_chave`, `campo_util`)
VALUES
	(1,3,1,'id_pessoas_proprietario','Código do proprietário da carga','Número inteiro',10,'>0',0,0),
	(2,3,2,'data','Data da saída','Data',10,'>HOJE',0,0),
	(3,2,1,'id_pessoas_proprietario','Código do proprietário da carga','Número inteiro',10,'>0',0,0),
	(4,2,2,'data','Previsão de entrada','Texto',10,'',0,0),
	(5,4,1,'I','Valor fixo','Texto',1,'',0,0),
	(6,4,2,'numseq','CODIGOINTERNO - Número da Nota Fiscal','Texto',20,'',0,1),
	(7,4,3,'numero_cliente','NUMPEDIDO - Número do Pedido','Texto',20,'',1,1),
	(8,4,4,'cnpj_depositante','CNPJ_DEPOSITANTE - CNPJ Depositante','CNPJ',20,'',0,1),
	(9,4,5,'cnpj_emitente','CNPJ_EMITENTE - Saída = CNPJ Depositante / Entrada = CNPJ Fornecedor','CNPJ',20,'',0,1),
	(10,4,6,'serie_nf','SEQUENCIA - Série da Nota Fiscal','Texto',20,'',0,1),
	(11,4,7,'tipo','TIPO - Entrada = E / Saida = S','Texto',1,'',0,0),
	(12,4,8,'descricao_operacao','DESCROPER - Descrição da Operação','Texto',100,'',0,0),
	(13,4,9,'cfop','CFOP','Texto',4,'',0,0),
	(14,4,10,'data_emissao','DATA_EMISSAO','Data',10,'',0,1),
	(15,4,11,'tipo_pessoa_destinatario','PESSOA_DEST','Texto',1,'',0,0),
	(16,4,12,'codigo_destinatario','CODIGO_DEST','Texto',20,'',0,0),
	(17,4,13,'nome_destinatario','NOME_DEST','Texto',60,'',0,1),
	(18,4,14,'nome_fantasia_destinatario','FANTASIA_DEST','Texto',60,'',0,0),
	(19,4,15,'cnpj_destinatario','CNPJ_DEST','CNPJ',20,'',0,1),
	(20,4,16,'endereco_destinatario','ENDERECO_DEST','Texto',80,'',0,1),
	(21,4,17,'numero_endereco_destinatario','NUMEND_DEST','Texto',10,'',0,1),
	(22,4,18,'complemento_endereco_destinatario','COMPLEMENTOEND_DEST','Texto',50,'',0,0),
	(23,4,19,'bairro_destinatario','BAIRRO_DEST','Texto',50,'',0,1),
	(24,4,20,'cep_destinatario','CEP_DEST','Texto',8,'',0,1),
	(25,4,21,'cidade_destinatario','CIDADE_DEST','Texto',40,'',0,1),
	(26,4,22,'telefone_destinatario','TELEFONE_DEST','Texto',20,'',0,0),
	(27,4,23,'estado_destinatario','ESTADO_DEST','Texto',2,'',0,1);

/*!40000 ALTER TABLE `importacoes_cabecalho` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela importacoes_registros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `importacoes_registros`;

CREATE TABLE `importacoes_registros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_importacoes` bigint unsigned NOT NULL DEFAULT '0',
  `ordem` int NOT NULL DEFAULT '0',
  `nome` varchar(60) NOT NULL DEFAULT '',
  `descricao` text NOT NULL,
  `tipo` varchar(30) NOT NULL DEFAULT '',
  `tamanho` int NOT NULL DEFAULT '0',
  `validacao` varchar(60) DEFAULT '',
  `campo_chave` tinyint(1) DEFAULT '0',
  `campo_util` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `importacoes_registros` WRITE;
/*!40000 ALTER TABLE `importacoes_registros` DISABLE KEYS */;

INSERT INTO `importacoes_registros` (`id`, `id_importacoes`, `ordem`, `nome`, `descricao`, `tipo`, `tamanho`, `validacao`, `campo_chave`, `campo_util`)
VALUES
	(1,1,1,'nome','Nome do item','Texto',60,'',0,0),
	(2,1,2,'codigo','Código do item','Texto',30,'',1,0),
	(3,1,3,'codigo_barras','Código de barras','Texto',30,'',1,0),
	(4,1,4,'ncm','Código NCM','Texto',10,'',0,0),
	(5,1,5,'id_unidades','Unidade do item','Número inteiro',20,'combo_unidades',0,0),
	(6,1,6,'quantidade','Quantidade neste SKU','Número decimal',5,'>0',0,0),
	(7,3,1,'codigo','Código do item','Texto',30,'',1,0),
	(8,3,2,'id_unidades','Código da unidade de saída','Número inteiro',20,'combo_unidades',0,0),
	(9,3,3,'quantidade','Quantidade desejada','Número decimal',5,'>0',0,0),
	(10,2,1,'codigo','Código do item','Texto',30,'',1,0),
	(11,2,2,'id_unidades','Unidade','Número inteiro',20,'combo_unidades',0,0),
	(12,2,3,'quantidade','Quantidade prevista','Número decimal',10,'>0',0,0),
	(13,4,1,'I','Valor Fixo','Texto',1,'',0,0),
	(14,4,2,'numero_nf','CODIGOINTERNO','Texto',20,'',0,0),
	(15,4,3,'numero_cliente','NUMPEDIDO','Texto',20,'',1,1),
	(16,4,4,'cnpj_depositante','CNPJ_DEPOSITANTE','CNPJ',20,'',0,0),
	(17,4,5,'cnpj_emitente','CNPJ_EMITENTE','CNPJ',20,'',0,0),
	(18,4,6,'serie','SERIE','Texto',20,'',0,0),
	(19,4,7,'tipo','TIPO - Entrada = E / Saida = S','Texto',1,'',0,0),
	(20,4,8,'ordem','IDSEQ - Sequencia do Item (Ordem de impressão dos itens)','Número inteiro',12,'',0,1),
	(21,4,9,'codigo','CODIGOINDUSTRIA - Código Interno do Produto - Depositante','Texto',20,'',0,1),
	(22,4,10,'descricao','DESCR_PROD','Texto',80,'',0,1),
	(23,4,11,'codigo_barras','BARRA - Código de Barras do Produto','Texto',20,'',0,1),
	(24,4,12,'classificacao_fiscal','CLASSIFICACAOFISCAL - Classificação Fiscal do Produto','Texto',5,'',0,0),
	(25,4,13,'situacao_tributaria','ST - Situação Tributária','Texto',2,'',0,0),
	(26,4,14,'quantidade','QTDE','Número inteiro',12,'',0,1),
	(27,4,15,'valor','VLRUNIT - Valor Unitário','Número decimal',12,'',0,1),
	(28,4,16,'valor_total','VLRTOTAL','Número decimal',12,'',0,1),
	(29,4,17,'icms','ALIQICMS','Número decimal',6,'',0,1),
	(30,4,18,'aliquota_ipi','ALIQIPI','Número decimal',6,'',0,1),
	(31,4,19,'ipi','IPI','Número decimal',12,'',0,1),
	(32,4,20,'valor_desconto','VLRDESC','Número decimal',12,'',0,1),
	(33,4,21,'percentual_desconto','PORCDESCONTO','Número decimal',6,'',0,1),
	(34,4,22,'desconto','DESCONTO','Número decimal',12,'',0,1),
	(35,4,23,'total_liquido','TOTALLIQUIDO','Número decimal',12,'',0,0),
	(36,4,24,'tipo_produto','TIPOPRODUTO - Produto = P / Serviço = S','Texto',1,'',0,0),
	(37,4,25,'quantidade_atendida','QTDEATENDIDA','Número inteiro',12,'',0,1),
	(38,4,26,'id_nota_fiscal','IDNOTAFISCAL','Texto',26,'',0,0),
	(39,6,1,'codigo','Código de barras do produto','Texto',20,'',0,1),
	(40,6,3,'lote','Lote do arquivo','Texto',20,'',0,1),
	(41,6,4,'quantidade','Quantidade','Número inteiro',20,'',0,1),
	(42,6,2,'descricao','Descricao','Texto',20,'',0,1);

/*!40000 ALTER TABLE `importacoes_registros` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela integracao_saldos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `integracao_saldos`;

CREATE TABLE `integracao_saldos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint DEFAULT '0',
  `codigo_item` varchar(50) DEFAULT '',
  `lote` varchar(100) DEFAULT NULL,
  `data_validade` date DEFAULT '0000-00-00',
  `data_fabricacao` date DEFAULT '0000-00-00',
  `valor` decimal(20,4) DEFAULT '0.0000',
  `data_validade_registro` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela inventarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inventarios`;

CREATE TABLE `inventarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_programacao_inventario` bigint DEFAULT '0',
  `id_programacao_inventario_posicoes` bigint DEFAULT '0',
  `saldo_atual` tinyint(1) DEFAULT '0',
  `conferida` tinyint DEFAULT '0',
  `uma_antiga` varchar(60) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `POSICAO` (`id_posicoes`),
  KEY `UMA` (`id_umas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela inventarios_finalizados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inventarios_finalizados`;

CREATE TABLE `inventarios_finalizados` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_aceitou` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_inventario_posicoes` bigint unsigned DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `lote` varchar(40) NOT NULL DEFAULT '',
  `quantidade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `valor` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `peso_bruto` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `peso_liquido` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `uma_antiga` varchar(60) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela inventarios_integracao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inventarios_integracao`;

CREATE TABLE `inventarios_integracao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `processado` tinyint(1) NOT NULL DEFAULT '0',
  `uma` varchar(15) NOT NULL DEFAULT '',
  `proprietario_cnpj` varchar(30) NOT NULL DEFAULT '',
  `nota_fiscal` varchar(30) DEFAULT NULL,
  `codigo` varchar(60) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `descricao` varchar(150) NOT NULL DEFAULT '',
  `unidade_sigla` char(2) NOT NULL DEFAULT '',
  `unidade` varchar(30) NOT NULL DEFAULT '',
  `quantidade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `valor` decimal(10,2) DEFAULT NULL,
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `lote` varchar(60) NOT NULL DEFAULT '',
  `serial` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela inventarios_skus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inventarios_skus`;

CREATE TABLE `inventarios_skus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_itens_skus` bigint DEFAULT '0',
  `id_inventarios` bigint DEFAULT '0',
  `lote` varchar(50) DEFAULT '',
  `data_fabricacao` date DEFAULT '0000-00-00',
  `data_validade` date DEFAULT '0000-00-00',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `quantidade` decimal(20,6) DEFAULT '0.000000',
  `bloqueada` tinyint DEFAULT '0',
  `avariada` tinyint DEFAULT '0',
  `contagem` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `INVENTARIO` (`id_inventarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens`;

CREATE TABLE `itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) DEFAULT '0',
  `apto` tinyint(1) DEFAULT '0',
  `faz_picking` tinyint(1) DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime DEFAULT '0000-00-00 00:00:00',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_fornecedor` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned DEFAULT '0',
  `id_grupos` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos` bigint unsigned NOT NULL DEFAULT '0',
  `id_prioridades_saida` bigint unsigned NOT NULL,
  `id_itens_skus_pedido` bigint unsigned DEFAULT '0',
  `id_itens_skus_operacao` bigint unsigned DEFAULT '0',
  `id_itens_skus_reposicao_picking` bigint unsigned DEFAULT '0',
  `codigo` varchar(20) NOT NULL,
  `codigo_anterior` varchar(60) DEFAULT NULL,
  `codigo_barras` varchar(60) DEFAULT NULL,
  `codigo_barras_alternativo` varchar(60) DEFAULT NULL,
  `ncm` varchar(11) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` longtext NOT NULL,
  `prazo_validade` int DEFAULT NULL,
  `shelf_life` int NOT NULL DEFAULT '0',
  `picking_quantidade_minima` int DEFAULT '0',
  `picking_quantidade_maxima` int DEFAULT '0',
  `temperatura_ideal` double DEFAULT NULL,
  `temperatura_limite` double DEFAULT NULL,
  `observacoes` text,
  `exige_lote` tinyint(1) DEFAULT '0',
  `exige_data_fabricacao` tinyint(1) DEFAULT '0',
  `exige_data_validade` tinyint(1) DEFAULT '0',
  `exige_serial` binary(1) DEFAULT '0',
  `produto_acabado` tinyint(1) DEFAULT '0',
  `id_grupos_combustivel` bigint DEFAULT '0',
  `regra_posicionamento` varchar(20) DEFAULT NULL,
  `critico` binary(1) DEFAULT '0',
  `curva` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_propr` (`id_pessoas_proprietario`),
  KEY `IX_grupos` (`id_grupos`),
  KEY `IX_tipos` (`id_tipos`),
  KEY `ativo` (`ativo`),
  KEY `PRODUCAO` (`produto_acabado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_anexos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_anexos`;

CREATE TABLE `itens_anexos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_itens` bigint unsigned DEFAULT '0',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `data` datetime DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `arquivo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_areas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_areas`;

CREATE TABLE `itens_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_itens` bigint unsigned DEFAULT '0',
  `id_areas` bigint unsigned DEFAULT '0',
  `ativo` tinyint unsigned DEFAULT '1',
  `prioridade` int NOT NULL DEFAULT '0',
  `id_posicoes` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_clientes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_clientes`;

CREATE TABLE `itens_clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_clientes` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ITENS` (`id_itens`),
  KEY `CLIENTE` (`id_clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_estruturas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_estruturas`;

CREATE TABLE `itens_estruturas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_itens_skus_produto` bigint DEFAULT NULL,
  `id_itens_skus_insumo` bigint DEFAULT NULL,
  `quantidade` decimal(20,6) DEFAULT NULL,
  `grupo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PAI` (`id_itens_skus_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_faltantes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_faltantes`;

CREATE TABLE `itens_faltantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint DEFAULT NULL,
  `id_itens_skus` bigint DEFAULT NULL,
  `id_umas` bigint DEFAULT NULL,
  `id_programacao` bigint DEFAULT NULL,
  `id_programacao_itens` bigint DEFAULT NULL,
  `id_areas_direcionar` bigint DEFAULT NULL,
  `numero_cliente` varchar(60) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `quantidade` decimal(20,6) DEFAULT NULL,
  `resolvido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SKU` (`id_itens_skus`),
  KEY `RESOLVIDO` (`resolvido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump de tabela itens_fornecedores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_fornecedores`;

CREATE TABLE `itens_fornecedores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_itens` bigint NOT NULL DEFAULT '0',
  `id_itens_skus` bigint NOT NULL DEFAULT '0',
  `cnpj` varchar(30) NOT NULL DEFAULT '',
  `codigo` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ITEM` (`id_itens`),
  KEY `CNPJ` (`cnpj`),
  KEY `CODIGO` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_ocorrencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_ocorrencias`;

CREATE TABLE `itens_ocorrencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_tipos_ocorrencias` bigint unsigned DEFAULT '0',
  `id_pessoas_funcionario` bigint unsigned DEFAULT '0',
  `id_pessoas_cadastrou` bigint unsigned DEFAULT '0',
  `id_itens` bigint unsigned DEFAULT '0',
  `data_digitacao` datetime DEFAULT NULL,
  `data_ocorrencia` datetime DEFAULT NULL,
  `publica` tinyint(1) DEFAULT '0',
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela itens_skus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `itens_skus`;

CREATE TABLE `itens_skus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ativo` bigint unsigned DEFAULT '0',
  `id_itens` bigint unsigned NOT NULL,
  `id_unidades` bigint unsigned NOT NULL DEFAULT '1',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned DEFAULT '0',
  `id_itens_skus_intermediario` bigint DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime DEFAULT '0000-00-00 00:00:00',
  `codigo` varchar(30) NOT NULL,
  `codigo_anterior` varchar(60) DEFAULT NULL,
  `codigo_barras` varchar(60) DEFAULT '',
  `codigo_barras_alternativo` varchar(60) DEFAULT '',
  `nome` varchar(30) NOT NULL,
  `quantidade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `peso_liquido` decimal(10,4) DEFAULT '0.0000',
  `peso_bruto` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `largura` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `altura` decimal(10,4) DEFAULT '0.0000',
  `comprimento` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `palete_lastro` decimal(10,4) DEFAULT '0.0000',
  `palete_altura` decimal(10,4) DEFAULT '0.0000',
  `empilhamento_maximo` int DEFAULT '0',
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `invisivel` tinyint(1) DEFAULT '0',
  `sigla` varchar(30) DEFAULT '',
  `codigo2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_itens_skus_cod` (`codigo`),
  KEY `IX_itens_skus_codbar` (`codigo_barras`),
  KEY `IX_itens` (`id_itens`),
  KEY `IX_unidades` (`id_unidades`),
  KEY `ativo` (`ativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela jung_webservice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jung_webservice`;

CREATE TABLE `jung_webservice` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint NOT NULL DEFAULT '0',
  `id_programacao` bigint NOT NULL DEFAULT '0',
  `id_umas` bigint NOT NULL DEFAULT '0',
  `id_equipamentos` bigint NOT NULL DEFAULT '0',
  `id_eventos` bigint NOT NULL DEFAULT '0',
  `data` datetime DEFAULT '0000-00-00 00:00:00',
  `data_envio` datetime DEFAULT '0000-00-00 00:00:00',
  `data_conclusao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enviado` tinyint(1) NOT NULL DEFAULT '0',
  `concluido` tinyint(1) NOT NULL DEFAULT '0',
  `erro` tinyint(1) NOT NULL DEFAULT '0',
  `nome` varchar(60) DEFAULT NULL,
  `metodo` varchar(60) DEFAULT NULL,
  `conteudo` text,
  `resposta` text,
  `backup` text,
  `com_problema` int NOT NULL DEFAULT '0',
  `tipo` char(1) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela maquina
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maquina`;

CREATE TABLE `maquina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cProd` varchar(100) DEFAULT '',
  `cEAN` varchar(100) DEFAULT '',
  `xProd` varchar(200) DEFAULT '',
  `NCM` varchar(100) DEFAULT '0',
  `id_cfops` bigint DEFAULT '0',
  `id_unidades` bigint DEFAULT '0',
  `qCom` decimal(20,8) DEFAULT '0.00000000',
  `vUnCom` decimal(20,8) DEFAULT '0.00000000',
  `vProd` decimal(20,8) DEFAULT '0.00000000',
  `cEANTrib` varchar(100) DEFAULT '',
  `uTrib` varchar(5) CHARACTER SET big5 COLLATE big5_chinese_ci DEFAULT '',
  `qTrib` decimal(20,8) DEFAULT '0.00000000',
  `vUnTrib` decimal(20,8) DEFAULT '0.00000000',
  `indTot` int DEFAULT '0',
  `pesoB` decimal(20,8) DEFAULT '0.00000000',
  `pesoL` decimal(20,8) DEFAULT '0.00000000',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_atualizacao` datetime DEFAULT '0000-00-00 00:00:00',
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  `id_pessoas_atualizou` bigint DEFAULT '0',
  `ativa` tinyint(1) DEFAULT '1',
  `id_pessoas_inativou` bigint DEFAULT '0',
  `data_inativacao` datetime DEFAULT '0000-00-00 00:00:00',
  `InfCpl` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela mensagens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mensagens`;

CREATE TABLE `mensagens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` int DEFAULT '0',
  `data` datetime DEFAULT NULL,
  `data_lida` date DEFAULT NULL,
  `data_respondida` date DEFAULT NULL,
  `id_pessoas_de` bigint unsigned DEFAULT '0',
  `id_pessoas_para` bigint DEFAULT '0',
  `id_relacionado` bigint unsigned DEFAULT '0',
  `lida` tinyint(1) DEFAULT '0',
  `respondida` tinyint(1) DEFAULT '0',
  `mensagem` text,
  `parametros` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `PARA` (`id_pessoas_para`),
  KEY `LIDA` (`lida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela nfe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nfe`;

CREATE TABLE `nfe` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sistema` varchar(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `serie` varchar(10) DEFAULT '1',
  `chave` varchar(50) DEFAULT NULL,
  `situacao` varchar(20) DEFAULT NULL,
  `data_recibo` datetime DEFAULT NULL,
  `id_os` bigint unsigned NOT NULL DEFAULT '0',
  `id_empresa` bigint unsigned NOT NULL DEFAULT '0',
  `id_cliente` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoa` bigint unsigned NOT NULL DEFAULT '0',
  `id_operacao` bigint unsigned NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `enviada` tinyint(1) NOT NULL DEFAULT '0',
  `confirmada` tinyint(1) NOT NULL DEFAULT '0',
  `xml` longtext,
  `txt` longtext,
  `recibo` longtext,
  `mensagens` longtext,
  `protocolo` varchar(60) DEFAULT NULL,
  `xml_cancelamento` longtext,
  PRIMARY KEY (`id`),
  KEY `DATA` (`data`),
  KEY `NUMERO` (`numero`),
  KEY `CHAVE` (`chave`),
  KEY `OS` (`id_os`),
  KEY `CLIENTE` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela nfe_carta_correcao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nfe_carta_correcao`;

CREATE TABLE `nfe_carta_correcao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_nfe` bigint unsigned NOT NULL DEFAULT '0',
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `texto` longtext,
  `confirmado` tinyint unsigned NOT NULL DEFAULT '0',
  `xml` longtext,
  `sequencial` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela nfe_informacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nfe_informacoes`;

CREATE TABLE `nfe_informacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `descricao` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela nfe_numeros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nfe_numeros`;

CREATE TABLE `nfe_numeros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned DEFAULT '0',
  `numero` bigint unsigned DEFAULT '0',
  `serie` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela nfe_operacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nfe_operacao`;

CREATE TABLE `nfe_operacao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_geral_pessoas_ativou` bigint unsigned NOT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `serie` varchar(10) NOT NULL,
  `modo_operacao` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas`;

CREATE TABLE `notas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipo` char(1) DEFAULT NULL,
  `confirmada` tinyint(1) DEFAULT '0',
  `cancelada` tinyint(1) DEFAULT '0',
  `ajuste` tinyint(1) DEFAULT '0',
  `numero` varchar(20) DEFAULT NULL,
  `serie` smallint DEFAULT '1',
  `observacoes` text,
  `data_emissao` char(10) DEFAULT '0000-00-00',
  `data_movimento` char(10) DEFAULT '0000-00-00',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `data_criou` datetime DEFAULT '0000-00-00 00:00:00',
  `id_cfops` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cliente` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_fornecedor` bigint unsigned NOT NULL DEFAULT '0',
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_transportadora` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_nfe` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_agrupar` bigint DEFAULT NULL,
  `id_pessoas_criou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `id_programacao` bigint DEFAULT '0',
  `id_nfe_informacoes` bigint DEFAULT NULL,
  `IE` tinyint DEFAULT NULL,
  `idDestino` tinyint DEFAULT NULL,
  `finNFe` tinyint DEFAULT NULL,
  `modFrete` tinyint DEFAULT NULL,
  `placa` char(12) DEFAULT NULL,
  `placaUF` char(4) DEFAULT NULL,
  `RNTC` varchar(50) DEFAULT NULL,
  `qVol` decimal(20,6) DEFAULT NULL,
  `esp` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `pesoB` decimal(20,8) DEFAULT NULL,
  `pesoL` decimal(20,8) DEFAULT NULL,
  `vSeg` decimal(20,4) DEFAULT NULL,
  `vFrete` decimal(20,4) DEFAULT NULL,
  `vOutro` decimal(20,4) DEFAULT NULL,
  `infAdFisco` text,
  `InfCpl` text,
  `vProd` decimal(20,4) DEFAULT NULL,
  `vDesc` decimal(20,4) DEFAULT NULL,
  `refNfe` text,
  `indIntermed` char(1) DEFAULT '0',
  `emails_enviar` text,
  `volume` int DEFAULT '0',
  `entrada_interna` tinyint DEFAULT '0',
  `venda` binary(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NUMERO` (`numero`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `VEICULOS` (`id_veiculos_acessos`),
  KEY `TIPO` (`tipo`),
  KEY `PRORIETARIO` (`id_pessoas_proprietario`),
  KEY `CLIENTE` (`id_pessoas_cliente`),
  KEY `VEICULO` (`id_veiculos_acessos`),
  KEY `NFE` (`id_nfe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_itens`;

CREATE TABLE `notas_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_notas` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_associada` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_unidades` bigint DEFAULT '0',
  `id_cfops` bigint DEFAULT '0',
  `quantidade` decimal(20,6) DEFAULT NULL,
  `peso_bruto` decimal(20,8) DEFAULT NULL,
  `peso_liquido` decimal(20,8) DEFAULT NULL,
  `m2` decimal(10,3) DEFAULT NULL,
  `m3` decimal(10,3) DEFAULT NULL,
  `valor` decimal(20,10) DEFAULT NULL,
  `valor_base_calculo` decimal(20,10) DEFAULT NULL,
  `lote` varchar(30) DEFAULT NULL,
  `serial` varchar(30) DEFAULT NULL,
  `data_fabricacao` char(10) DEFAULT NULL,
  `data_vencimento` char(10) DEFAULT '0000-00-00',
  `prazo_validade` int DEFAULT NULL,
  `shelflife` char(10) DEFAULT NULL,
  `icms` double DEFAULT '0',
  `ipi` double DEFAULT '0',
  `aliquota_ipi` double DEFAULT NULL,
  `desconto` double DEFAULT '0',
  `aliquota_icms` double DEFAULT '0',
  `base_icms` double DEFAULT '0',
  `id_grupos_combustivel` bigint DEFAULT '0',
  `cProdANP` varchar(30) DEFAULT '',
  `descANP` varchar(200) DEFAULT '',
  `CODIF` varchar(30) DEFAULT '',
  `UFCons` char(2) DEFAULT '',
  `valor_frete` decimal(10,2) DEFAULT '0.00',
  `valor_seguro` decimal(10,2) DEFAULT '0.00',
  `base_icms_st` double DEFAULT '0',
  `aliquota_icms_st` double DEFAULT '0',
  `icms_st` double DEFAULT '0',
  `percentual_adicional_icms_st` double DEFAULT '0',
  `percentual_reducao_icms_st` double DEFAULT '0',
  `total_icms_calc` float(24,0) DEFAULT NULL,
  `id_maquinas` varchar(45) DEFAULT '0',
  `id_notas_itens_saida` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_itens_cofins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_itens_cofins`;

CREATE TABLE `notas_itens_cofins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_imp_cofins_cst` bigint DEFAULT '0',
  `id_notas_itens` bigint DEFAULT '0',
  `vBC` decimal(13,2) DEFAULT '0.00',
  `pCOFINS` decimal(4,2) DEFAULT '0.00',
  `vCOFINS` decimal(13,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_itens_icms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_itens_icms`;

CREATE TABLE `notas_itens_icms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_notas_itens` bigint NOT NULL DEFAULT '0',
  `id_imp_icms_cst` bigint NOT NULL DEFAULT '0',
  `id_imp_icms_origem` bigint DEFAULT '0',
  `id_imp_icms_mod` bigint NOT NULL DEFAULT '0',
  `vBC` decimal(20,10) DEFAULT NULL,
  `pICMS` decimal(4,2) DEFAULT '0.00',
  `pRedBC` decimal(4,2) DEFAULT '0.00',
  `reducao_icms_aliquota` decimal(4,2) DEFAULT NULL,
  `pICMSST` decimal(10,6) DEFAULT '0.000000',
  `vICMSST` decimal(10,6) DEFAULT '0.000000',
  `vBCSTRet` decimal(10,6) DEFAULT '0.000000',
  `vICMSSTRet` decimal(10,6) DEFAULT '0.000000',
  `modBCST` char(1) DEFAULT NULL,
  `pMVAST` decimal(7,4) DEFAULT '0.0000',
  `pRedBCST` decimal(4,2) DEFAULT '0.00',
  `vBCST` decimal(13,2) DEFAULT '0.00',
  `vBCFCP` decimal(13,2) DEFAULT '0.00',
  `pFCP` decimal(4,2) DEFAULT '0.00',
  `vBCFCPST` decimal(13,2) DEFAULT '0.00',
  `pFCPST` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_itens_ipi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_itens_ipi`;

CREATE TABLE `notas_itens_ipi` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_notas_itens` bigint DEFAULT '0',
  `id_imp_ipi_cst` bigint DEFAULT '0',
  `vBC` decimal(13,2) DEFAULT '0.00',
  `pIPI` decimal(4,2) DEFAULT '0.00',
  `vIPI` decimal(13,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_itens_medicamentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_itens_medicamentos`;

CREATE TABLE `notas_itens_medicamentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint DEFAULT '0',
  `id_notas_itens` bigint DEFAULT '0',
  `data` datetime DEFAULT '0000-00-00 00:00:00',
  `cProdANVISA` varchar(15) DEFAULT NULL,
  `xMotivoIsencao` varchar(255) DEFAULT NULL,
  `vPMC` decimal(13,2) DEFAULT '0.00',
  `nLote` varchar(20) DEFAULT NULL,
  `qLote` decimal(8,3) DEFAULT '0.000',
  `dFab` date DEFAULT '0000-00-00',
  `dVal` date DEFAULT '0000-00-00',
  `cAgreg` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump de tabela notas_itens_pis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_itens_pis`;

CREATE TABLE `notas_itens_pis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_notas_itens` bigint DEFAULT '0',
  `id_imp_pis_cst` bigint DEFAULT '0',
  `vBC` decimal(13,2) DEFAULT '0.00',
  `pPIS` decimal(4,2) DEFAULT '0.00',
  `vPIS` decimal(13,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_maquina
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_maquina`;

CREATE TABLE `notas_maquina` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_armazens_destinatario` bigint DEFAULT '0',
  `id_pessoas_transportadora` bigint DEFAULT '0',
  `id_maquinas` bigint DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `id_notas` bigint DEFAULT '0',
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_paletes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_paletes`;

CREATE TABLE `notas_paletes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_notas` bigint unsigned DEFAULT '0',
  `id_pessoas_dono` bigint unsigned DEFAULT '0',
  `tipo` char(2) NOT NULL,
  `quantidade` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_umas`;

CREATE TABLE `notas_umas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numero` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela notas_umas_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notas_umas_itens`;

CREATE TABLE `notas_umas_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_notas_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela ocorrencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ocorrencias`;

CREATE TABLE `ocorrencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint DEFAULT NULL,
  `id_pessoas_criou` bigint DEFAULT NULL,
  `id_pessoas_atuou` bigint DEFAULT NULL,
  `id_tipos_ocorrencias` bigint DEFAULT NULL,
  `id_umas` bigint DEFAULT NULL,
  `id_umas_itens` bigint DEFAULT NULL,
  `id_programacao` bigint DEFAULT NULL,
  `id_veiculos_acessos` bigint DEFAULT NULL,
  `data_ocorrencia` datetime DEFAULT NULL,
  `data_atuacao` datetime DEFAULT NULL,
  `teve_atuacao` tinyint(1) DEFAULT '0',
  `complemento` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `id_itens_skus` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;



# Dump de tabela painel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `painel`;

CREATE TABLE `painel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `espera` int NOT NULL DEFAULT '10',
  `hoje` tinyint(1) NOT NULL DEFAULT '1',
  `dias30` tinyint(1) NOT NULL DEFAULT '1',
  `entradas` tinyint(1) NOT NULL DEFAULT '1',
  `saidas` tinyint(1) NOT NULL DEFAULT '1',
  `atividades` tinyint(1) NOT NULL DEFAULT '1',
  `resumo` tinyint(1) NOT NULL DEFAULT '1',
  `portaria` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `painel` WRITE;
/*!40000 ALTER TABLE `painel` DISABLE KEYS */;

INSERT INTO `painel` (`id`, `espera`, `hoje`, `dias30`, `entradas`, `saidas`, `atividades`, `resumo`, `portaria`)
VALUES
	(1,5,1,1,1,1,1,1,1);

/*!40000 ALTER TABLE `painel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela paises
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `codigo_area` varchar(10) NOT NULL DEFAULT '',
  `sigla` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;

INSERT INTO `paises` (`id`, `nome`, `codigo_area`, `sigla`)
VALUES
	(1,'Brasil','55','BRA'),
	(2,'África do Sul','',''),
	(3,'Albânia','',''),
	(4,'Alemanha','',''),
	(5,'Andorra','',''),
	(6,'Angola','',''),
	(7,'Anguilla','',''),
	(8,'Antártida','',''),
	(9,'Antígua e Barbuda','',''),
	(10,'Antilhas Holandesas','',''),
	(11,'Arábia Saudita','',''),
	(12,'Argélia','',''),
	(13,'Argentina','',''),
	(14,'Armênia','',''),
	(15,'Aruba','',''),
	(16,'Austrália','',''),
	(17,'Áustria','',''),
	(18,'Azerbaijão','',''),
	(19,'Bahamas','',''),
	(20,'Bahrein','',''),
	(21,'Bangladesh','',''),
	(22,'Barbados','',''),
	(23,'Belarus','',''),
	(24,'Bélgica','',''),
	(25,'Belize','',''),
	(26,'Benin','',''),
	(27,'Bermuda','',''),
	(28,'Bolívia','',''),
	(29,'Bósnia e Herzegovina','',''),
	(30,'Botsuana','',''),
	(31,'Afeganistão','',''),
	(32,'Brunei','',''),
	(33,'Bulgária','',''),
	(34,'Burkina Faso','',''),
	(35,'Burundi','',''),
	(36,'Butão','',''),
	(37,'Cabo Verde','',''),
	(38,'Camarões','',''),
	(39,'Camboja','',''),
	(40,'Canadá','',''),
	(41,'Catar','',''),
	(42,'Cazaquistão','',''),
	(43,'Chade','',''),
	(44,'Chile','',''),
	(45,'China','',''),
	(46,'Chipre','',''),
	(47,'Cidade do Vaticano (Santa Sé)','',''),
	(48,'Cingapura','',''),
	(49,'Colômbia','',''),
	(50,'Comores','',''),
	(51,'Congo','',''),
	(52,'Congo, República Popular do','',''),
	(53,'Coréia','',''),
	(54,'Coréia do Norte','',''),
	(55,'Costa do Marfim','',''),
	(56,'Costa Rica','',''),
	(57,'Croácia (Hrvatska)','',''),
	(58,'Cuba','',''),
	(59,'Dinamarca','',''),
	(60,'Djibuti','',''),
	(61,'Dominica','',''),
	(62,'Egito','',''),
	(63,'El Salvador','',''),
	(64,'Emirados Árabes Unidos','',''),
	(65,'Equador','',''),
	(66,'Eritréia','',''),
	(67,'Eslováquia','',''),
	(68,'Eslovênia','',''),
	(69,'Espanha','',''),
	(70,'Estados Unidos','',''),
	(71,'Estônia','',''),
	(72,'Etiópia','',''),
	(73,'Fiji','',''),
	(74,'Filipinas','',''),
	(75,'Finlândia','',''),
	(76,'França','',''),
	(77,'Gabão','',''),
	(78,'Gâmbia','',''),
	(79,'Gana','',''),
	(80,'Geórgia','',''),
	(81,'Gibraltar','',''),
	(82,'Grécia','',''),
	(83,'Grenada','',''),
	(84,'Groenlândia','',''),
	(85,'Guadalupe','',''),
	(86,'Guam','',''),
	(87,'Guatemala','',''),
	(88,'Guiana','',''),
	(89,'Guiana Francesa','',''),
	(90,'Guiné','',''),
	(91,'Guiné Equatorial','',''),
	(92,'Guiné-Bissau','',''),
	(93,'Haiti','',''),
	(94,'Holanda','',''),
	(95,'Honduras','',''),
	(96,'Hong Kong','',''),
	(97,'Hungria','',''),
	(98,'Iêmen','',''),
	(99,'Ilha Bouvet','',''),
	(100,'Ilha Norfolk','',''),
	(101,'Ilhas Cayman','',''),
	(102,'Ilhas Christmas','',''),
	(103,'Ilhas Cocos (Keeling)','',''),
	(104,'Ilhas Cook','',''),
	(105,'Ilhas Faroés','',''),
	(106,'Ilhas Geórgia do Sul e Sandwich do Sul','',''),
	(107,'Ilhas Heard e McDonald','',''),
	(108,'Ilhas Malvinas','',''),
	(109,'Ilhas Marianas do Norte','',''),
	(110,'Ilhas Marshall','',''),
	(111,'Ilhas Salomão','',''),
	(112,'Ilhas Svalbard e Jan Mayen','',''),
	(113,'Ilhas Turks e Caicos','',''),
	(114,'Ilhas Virgens Americanas','',''),
	(115,'Ilhas Virgens Britânicas','',''),
	(116,'Ilhas Wallis e Futuna','',''),
	(117,'Ãndia','',''),
	(118,'Indonésia','',''),
	(119,'Irã','',''),
	(120,'Iraque','',''),
	(121,'Irlanda','',''),
	(122,'Islândia','',''),
	(123,'Israel','',''),
	(124,'Itália','',''),
	(125,'Iugoslávia','',''),
	(126,'Jamaica','',''),
	(127,'Japão','',''),
	(128,'Jordânia','',''),
	(129,'Kiribati','',''),
	(130,'Kuwait','',''),
	(131,'Laos','',''),
	(132,'Lesoto','',''),
	(133,'Letônia','',''),
	(134,'Líbano','',''),
	(135,'Libéria','',''),
	(136,'Líbia','',''),
	(137,'Liechtenstein','',''),
	(138,'Lituânia','',''),
	(139,'Luxemburgo','',''),
	(140,'Macau','',''),
	(141,'Macedônia','',''),
	(142,'Madagascar','',''),
	(143,'Malásia','',''),
	(144,'Malaui','',''),
	(145,'Maldivas','',''),
	(146,'Mali','',''),
	(147,'Malta','',''),
	(148,'Marrocos','',''),
	(149,'Martinica','',''),
	(150,'Maurício','',''),
	(151,'Mauritânia','',''),
	(152,'Mayotte','',''),
	(153,'México','',''),
	(154,'Micronésia','',''),
	(155,'Moçambique','',''),
	(156,'Moldávia','',''),
	(157,'Mônaco','',''),
	(158,'Mongólia','',''),
	(159,'Montserrat','',''),
	(160,'Myanma','',''),
	(161,'Namíbia','',''),
	(162,'Nauru','',''),
	(163,'Nepal','',''),
	(164,'Nicarágua','',''),
	(165,'Níger','',''),
	(166,'Nigéria','',''),
	(167,'Niue','',''),
	(168,'Noruega','',''),
	(169,'Nova Caledônia','',''),
	(170,'Nova Zelândia','',''),
	(171,'Omã','',''),
	(172,'Palau','',''),
	(173,'Panamá','',''),
	(174,'Papua-Nova Guiné','',''),
	(175,'Paquistão','',''),
	(176,'Paraguai','',''),
	(177,'Peru','',''),
	(178,'Pitcairn','',''),
	(179,'Polinésia Francesa','',''),
	(180,'Polônia','',''),
	(181,'Porto Rico','',''),
	(182,'Portugal','',''),
	(183,'Quênia','',''),
	(184,'Quirguistão','',''),
	(185,'Reino Unido','',''),
	(186,'República Centro-Africana','',''),
	(187,'República Dominicana','',''),
	(188,'República Tcheca','',''),
	(189,'Reunião','',''),
	(190,'Romênia','',''),
	(191,'Ruanda','',''),
	(192,'Rússia','',''),
	(193,'Saara Ocidental','',''),
	(194,'Saint Kitts e Névis','',''),
	(195,'Samoa','',''),
	(196,'Samoa Americana','',''),
	(197,'San Marino','',''),
	(198,'Santa Helena','',''),
	(199,'Santa Lúcia','',''),
	(200,'São Tomé e Príncipe','',''),
	(201,'São Vicente e Granadinas','',''),
	(202,'Senegal','',''),
	(203,'Serra Leoa','',''),
	(204,'Seychelles','',''),
	(205,'Síria','',''),
	(206,'Somália','',''),
	(207,'Sri Lanka','',''),
	(208,'St. Pierre e Miquelon','',''),
	(209,'Suazilândia','',''),
	(210,'Sudão','',''),
	(211,'Suécia','',''),
	(212,'Suíça','',''),
	(213,'Suriname','',''),
	(214,'Tadjiquistão','',''),
	(215,'Tailândia','',''),
	(216,'Taiwan','',''),
	(217,'Tanzânia','',''),
	(218,'Território Britânico do Oceano Ãndico','',''),
	(219,'Territórios Franceses do Sul','',''),
	(220,'Territórios Insulares dos EUA','',''),
	(221,'Timor Oriental','',''),
	(222,'Togo','',''),
	(223,'Tokelau','',''),
	(224,'Tonga','',''),
	(225,'Trinidad e Tobago','',''),
	(226,'Tunísia','',''),
	(227,'Turcomenistão','',''),
	(228,'Turquia','',''),
	(229,'Tuvalu','',''),
	(230,'Ucrânia','',''),
	(231,'Uganda','',''),
	(232,'Uruguai','',''),
	(233,'Uzbequistão','',''),
	(234,'Vanuatu','',''),
	(235,'Venezuela','',''),
	(236,'Vietnã','',''),
	(237,'Zâmbia','',''),
	(238,'Zimbábue','','');

/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela parametros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `parametros`;

CREATE TABLE `parametros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) DEFAULT '0',
  `editavel` tinyint(1) DEFAULT '1',
  `grupo` varchar(30) DEFAULT NULL,
  `chave` varchar(40) DEFAULT NULL,
  `descricao` text,
  `valor` text,
  `perfil_mini` tinyint(1) DEFAULT '0',
  `perfil_armazem` tinyint(1) DEFAULT '0',
  `perfil_operador` tinyint(1) DEFAULT '0',
  `perfil_industria` tinyint(1) DEFAULT '0',
  `perfil_varejo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chave` (`chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;

INSERT INTO `parametros` (`id`, `ativo`, `editavel`, `grupo`, `chave`, `descricao`, `valor`, `perfil_mini`, `perfil_armazem`, `perfil_operador`, `perfil_industria`, `perfil_varejo`)
VALUES
	(1,1,1,'SISTEMA','ACESSO','Permitir acesso ao sistema','',1,1,1,1,1),
	(2,1,1,'SISTEMA','ACESSOCOL','Permitir acesso ao sistema via coletores de dados','',1,1,1,1,1),
	(3,1,1,'SISTEMA','ACESSOWEB','Permitir acesso ao sistema via web','',1,1,1,1,1),
	(4,1,1,'INTERFACE','ALERTAR_OCORRENCIA_ITEM_CRITICO','Emite alerta ao ocorrer entrada de item critico',NULL,1,1,1,1,1),
	(5,0,0,'OPERACAO','ALTERNAR_TIPO_ENTRADA_AUTO','Cria flag tela da OS para alternar tipo de entrada uma virgem e convencional','1',0,0,0,0,0),
	(6,1,0,'DADO_PREDEFINIDO','ALTURA_PALETE_VAZIO','Altura em centímetros do palete vazio','14,4',1,1,1,1,1),
	(7,0,0,'OPERACAO','APONTAR_COLABORADOR_ENTRADA','Permite selecionar um colaborador para associar a entrada','',0,0,0,0,0),
	(8,0,0,'OPERACAO','APONTAR_COLABORADOR_PALETIZAR','Permite selecionar um colaborador para associar a paletização','',0,0,0,0,0),
	(9,0,0,'OPERACAO','APONTAR_COLABORADOR_SAIDA','Permite selecionar um colaborador para associar a saída','',0,0,0,0,0),
	(10,0,0,'OPERACAO','APONTAR_COLABORADOR_SEPARACAO','Permite selecionar um colaborador para associar a separação','',0,0,0,0,0),
	(11,1,1,'OPERACAO','AREA_DIRECIONAMENTO_OBRIGATORIA','Torna obrigatorio o campo de direcionamento para',NULL,1,1,1,1,1),
	(12,1,0,'OPERACAO','ASSOCIA_UMA_ITEM_ENTRADA','Associa UMA gerada com item selecionado, mostra campos para tal','1',1,1,1,1,1),
	(13,0,0,'OPERACAO','ASSOCIAR_COLABORADOR_OS','Mostrar somente OS associadas ao colaborador ou sem associação na hora de executar no coletor','',0,0,0,0,0),
	(14,1,1,'SISTEMA','BACKUP','Horário do backup diário automático','22:00',1,1,1,1,1),
	(15,1,0,'SISTEMA','CLASSES','Arquivo que define o comportamento do sistema','padrao',1,1,1,1,1),
	(16,1,0,'OPERACAO','CONFERENCIA_CEGA_SAIDA','Realiza uma conferência cega minuciosa na saída de carga','',1,1,1,1,1),
	(17,1,1,'DADO_PREDEFINIDO','CONTAGENS_INVENTARIO','Define o mínimo de contagens para aceitar o inventário','2',1,1,1,1,1),
	(18,1,1,'DADO_PREDEFINIDO','CONTAGENS_INVENTARIO_SIMPLIFICADO','Define o mi­nimo de contagens para aceitar o inventario simplificado','2',1,1,1,1,1),
	(19,1,1,'OPERACAO','CRIAR_LISTA_ITENS_CRITICO_ENTRADA','Cria lista de localizacao de itens com itens criticos conferidos na ent. dinamica','',1,1,1,1,1),
	(20,0,1,'OPERACAO','DESFAZER_SEPARACAO_VOLTA_RESERVADO','Ao desfazer UMA separada, retorna ao status reservada','',0,0,0,0,0),
	(21,1,0,'DADO_PREDEFINIDO','DIGITOS_UMA','Quantidade de dígitos da UMA','15',1,1,1,1,1),
	(22,1,0,'OPERACAO','DIRECIONAR_EXPEDICAO_AO_RESERVAR','Direciona para primeira area de expedicao ao reservar e ativa a programacao','',0,0,0,0,0),
	(23,1,0,'OPERACAO','EDITAR_ITENS_NOTA','Permite editar itens da nota','',1,1,1,1,1),
	(24,1,1,'OPERACAO','EMITIR_NF_APROVADA','PERMITE A EMISSAO DE NF CANCELADA','',1,1,1,1,1),
	(25,1,0,'INTERFACE','ENTRADA_AVISO_QUANTIDADE_CONFERIDA','Aviso que a quantidade conferiada é maior ou igual a quantidade programada','1',1,1,1,1,1),
	(26,1,0,'OPERACAO','ENTRADA_DINAMICA_ANTIGA','Conferencia dinamica sem tratamento fiscal',NULL,1,1,1,1,1),
	(27,1,0,'DADO_PREDEFINIDO','ESPACO_MANOBRA','Distância de segurança para posicionamento de carga (altura ou largura em cm)','10',1,1,1,1,1),
	(28,1,0,'GERAL','ETIQUETA_UMA_ENTRADA','Nome do tipo de etiqueta a imprimir para UMAs de entrada','UMA',1,1,1,1,1),
	(29,1,0,'GERAL','ETIQUETA_UMA_PALETIZACAO','Nome do tipo de etiqueta a imprimir para UMAs de paletização','UMA',1,1,1,1,1),
	(30,1,0,'GERAL','ETIQUETA_UMA_SAIDA','Nome do tipo de etiqueta a imprimir para UMAs de saída','UMA',1,1,1,1,1),
	(31,1,1,'INTERFACE','EXIBE_NOTA_NA_PROGRAMACAO','EXIBE E NOTA EM PROGRAMACAO','',1,1,1,1,1),
	(32,0,0,'INTERFACE','EXIBIR_CAMPO_CODIGO2_ITENS','Adiciona campo codigo2 no cadastro de SKUs','',0,0,0,0,0),
	(33,0,0,'INTERFACE','EXIBIR_CAMPO_DATASUL_EMPRESA','Adiciona campo do código datasul no cadastro de empresas.','',0,0,0,0,0),
	(34,1,0,'INTERFACE','EXIBIR_QUANTIDADE_CONFERENCIA','Exibir quantidade dos itens para o conferente no coletor','',1,1,1,1,1),
	(35,0,0,'OPERACAO','EXIGE_CONFERENCIA_ARMAZENAR','Exige que seja feita uma conferência para posicionar em áreas de armazenagem','',0,0,0,0,0),
	(36,0,1,'OPERACAO','EXIGIR_COLABORADOR_DA_OS','Exigir o mesmo colaborador da OS, caso este esteja preenchido',NULL,0,0,0,0,0),
	(37,1,0,'OPERACAO','EXIGIR_CONFERENCIA_SAIDA','Exige que seja feita a conferência para liberar a saída da carga','',1,1,1,1,1),
	(38,1,0,'DADO_PREDEFINIDO','EXIGIR_CONTAGENS','Quantidade de contagens iguais exigida para a entrada','1',1,1,1,1,1),
	(39,0,0,'OPERACAO','EXIGIR_FILTRO_RELATORIOS','Exige que o usuário informe ao menos um filtro nos relatórios','',0,0,0,0,0),
	(40,0,0,'OPERACAO','EXIGIR_MESMA_POSICAO_OS','Exigir a mesma posição baseada na área selecionada na OS','0',0,0,0,0,0),
	(41,1,1,'OPERACAO','EXIGIR_MESMO_PROP_TRANSF','A transferência só é permitida quando as umas são de mesmo proprietário.','0',1,1,1,1,1),
	(42,0,0,'OPERACAO','EXIGIR_POSICIONAMENTO_UMA_VIRGEM','Exigir o posicionamento inicial da UMA em operações como ajuste de saldo e transferência.','',0,0,0,0,0),
	(43,0,0,'OPERACAO','EXIGIR_SKU_NA_SEPARACAO','Exigir informar o cód. de barras do SKU na separação','',0,0,0,0,0),
	(44,0,1,'OPERACAO','EXIGIR_TODOS_PASSOS_SEPARACAO','Exige todos os passos no momento da separação','0',1,1,1,1,1),
	(45,0,0,'AUTOMACAO','EXTRAIR_LOTE_TAG_XPROD','Ao importar nfe captura lote da tag xprod informado em parentesis','',0,0,0,0,0),
	(46,0,0,'OPERACAO','FAZ_UPDATE_AVARIA','Faz update nos registro de avarias, em vez de criar movimentações','1',0,0,0,0,0),
	(47,1,1,'OPERACAO','FINALIZAR_AUTO_APOS_CONFERENCIA','Finaliza OS automaticamente apos conferencia','1',1,1,1,1,1),
	(48,0,0,'SISTEMA','IMPRESSORA_ETIQ_ENTRADA','Etiquetas de Entrada','smbclient -U USUARIO //192.168.0.1/EPSON SENHA -c “print /tmp/etiquetas.prn“',0,0,0,0,0),
	(49,0,0,'SISTEMA','IMPRESSORA_ETIQ_ENTRADA_ALT','Etiquetas de Entrada Alternativa','smbclient -U IMPRESSORA //192.168.25.115/EPSON IMPRESSORA -c “print /tmp/etiquetas.prn“',0,0,0,0,0),
	(50,1,0,'SISTEMA','IMPRESSORA_ETIQ_GALPAO','IMPRESSORA_ETIQ_GALPAO','lpr -P Imp02 \"/tmp/etiquetas.prn\"',1,1,1,1,1),
	(51,0,0,'SISTEMA','IMPRESSORA_ETIQ_PALETIZACAO','Etiquetas de paletizacao','smbclient -U IMPRESSORA //192.168.25.115/EPSON IMPRESSORA -c “print /tmp/etiquetas.prn“',0,0,0,0,0),
	(52,0,0,'SISTEMA','IMPRESSORA_ETIQ_POSICIONAMENTO','Etiquetas de Posicionamento','smbclient -U USUARIO //192.168.0.1/EPSON SENHA -c “print /tmp/etiquetas.prn“',0,0,0,0,0),
	(53,0,0,'SISTEMA','IMPRESSORA_ETIQ_SAIDA','Etiquetas de Saída','smbclient -U USUARIO //192.168.0.1/EPSON SENHA -c “print /tmp/etiquetas.prn“',0,0,0,0,0),
	(54,1,0,'SISTEMA','IMPRESSORA_ETIQ_SUPERVISAO','IMPRESSORA_ETIQ_SUPERVISAO','lpr -P Imp01 \"/tmp/etiquetas.prn\"',1,1,1,1,1),
	(55,0,0,'SISTEMA','IMPRESSORA_ETIQUETAS_TSC','Imprimir etiquetas','lpr -P Argox.140 /tmp/etiqueta.pdf',0,0,0,0,0),
	(56,0,0,'SISTEMA','IMPRESSORA_ETIQUETAS_ZEBRA','Imprimir etiquetas','lpr -P Argox.141 /tmp/etiqueta.pdf',0,0,0,0,0),
	(58,0,0,'DADO_PREDEFINIDO','INDICAR_AREA_INICIAL','indicar não área inicial quando não for passado na programação e o item não tiver áreas.','86',0,0,0,0,0),
	(59,0,0,'OPERACAO','INSERE_DADOS_NA_UMA_ENTRADA','','',0,0,0,0,0),
	(60,0,0,'AUTOMACAO','INSERE_REFNFE_AUTO','Insere automaticamente o campo refNfe ( Chave das NFe de entrada) ao criar uma NFe ao finalizar uma ','1',0,0,0,0,0),
	(61,0,1,'OPERACAO','INTEGRACAO_DATA_FABRICACAO','Considera a menor data de fabricação dentro da UMA no momento da reserva',NULL,0,0,0,0,0),
	(62,0,0,'SISTEMA','INTEGRACAO_WINTHOR','Integração com o Winthor','1',0,0,0,0,0),
	(63,1,1,'SISTEMA','INTEGRAR_AVARIA_WINTHOR','Integração com avaria no Winthor','3098',1,1,1,1,1),
	(64,0,0,'SISTEMA','INTERFACE_JUNGHEINRICH','Caminho para o Webservice da Jungheinrich','http://localhost:8080/soap/LIExternalLink',0,0,0,0,0),
	(65,0,0,'SISTEMA','INTERFACE_PROTHEUS','Caminho para o Webservice do sistema Protheus/TOTVS','http://192.168.254.94:5996',0,0,0,0,0),
	(66,1,1,'DADO_PREDEFINIDO','LIBERAR_EVENTO_APOS','Tempo em minutos em que um evento fica bloqueado para o usuário que o abriu','5',1,1,1,1,1),
	(67,1,1,'SISTEMA','LIMITAR_VISUALIZACAO','Quantidade de registros a visualizar nas telas iniciais','400',1,1,1,1,1),
	(68,1,1,'DADO_PREDEFINIDO','LIMITE_DESFAZER_OS_ENTRADA','Limite de dias para desfazer a OS de entrada. por padrão é 1 dia.','120',1,1,1,1,1),
	(69,1,0,'DADO_PREDEFINIDO','LIMITE_DESFAZER_OS_GERAL','Define o limite de dias em que é possível desfazer uma OS.','120',1,1,1,1,1),
	(70,1,1,'OPERACAO','MANTER_UMA_OPERACOES','Reutiliza a UMA na operacao',NULL,1,1,1,1,1),
	(71,1,0,'OPERACAO','MODO_ENTRADA_SEM_UMA','Registra a entrada com conferência informando somente as quantidades totais','',0,0,0,0,0),
	(72,0,0,'OPERACAO','MODO_ENTRADA_UMA_UNICA','Realiza a entrada e gera somente 1 UMA','',0,0,0,0,0),
	(73,0,0,'INTERFACE','MOSTRA_REGISTROS_CANCELADOS_WINTHOR','Mostrar modal com registros que foram cancelados no Winthor na tela inicial','1',0,0,0,0,0),
	(74,1,0,'INTERFACE','MOSTRAR_APENAS_CAMPO_OS_ETIQUETA_PEDIDO','Mostra apenas o filtro OS na operação Etiquetas>Pedido','',1,1,1,1,1),
	(75,0,0,'INTERFACE','MOSTRAR_CODIGO_BARRAS_LISTA_ITEM','Mostra codigos de barras dos skus na lista de itens em Cadastros>Itens','',0,0,0,0,0),
	(76,1,1,'INTERFACE','MOSTRAR_DADOS_ITENS_CONF_ENTRADA','Mostra dados dos itens conferidos na entrada','0',1,1,1,1,1),
	(77,1,0,'INTERFACE','MOSTRAR_DESCRICAO_ITEM_SALDO_UMAS','Adiciona descricao do item no relatorio de saldo umas',NULL,1,1,1,1,1),
	(78,0,0,'INTERFACE','MOSTRAR_FILTRO_SEM_OS','Mostra filtro Sem OS na pesquisa de Nfe clientes para pesquisar NFEs sem OS atribuida','',0,0,0,0,0),
	(79,0,0,'INTERFACE','MOSTRAR_FORNECEDOR_SALDO_UMAS','Mostra coluna Fornecedor no relat Saldo UMAS',NULL,0,0,0,0,0),
	(80,0,0,'INTERFACE','MOSTRAR_ITENS_ATIVOS_PADRAO','Mostrar apenas itens ativos na pagina inicial de Cadastro>Itens','',0,0,0,0,0),
	(81,0,1,'INTERFACE','MOSTRAR_NOTA_CONF_ENTRADA','Mostra na tela de conferencia da entrada os campos Nota Fiscal e Placa do veículo','1',0,0,0,0,0),
	(82,0,0,'INTERFACE','MOSTRAR_OBSERVACOES_ETIQUETAS_UMAS','Permitir a insercao de uma observacao no cadastro de uma UMA e exibe na etiqueta.','1',0,0,0,0,0),
	(83,1,0,'INTERFACE','MOSTRAR_OBSERVACOES_RELATORIO_SAIDA','Exibe coluna Obervacoes da programacao no relatorio de saidas',NULL,1,1,1,1,1),
	(84,0,0,'INTERFACE','MOSTRAR_PRIMEIRA_MOVIMENTACAO_SALDO_UMAS','Mostra coluna Primeira Movimentacao da UMA no relat Saldo UMAS',NULL,0,0,0,0,0),
	(85,1,0,'INTERFACE','MOSTRAR_RELATORIO_ITENS_INDEVIDOS','Mostra botão para relatório de itens indevidos nas notas fiscais de saí­da nos relatórios de saldo','',1,1,1,1,1),
	(86,0,0,'OPERACAO','NAO_FORCAR_AREA_RECEBIMENTO','Não força a area de recebimento dentro da programação','',0,0,0,0,0),
	(87,0,0,'INTERFACE','OBRIGAR_PREENCHIMENTO_CAMPOS_PORTARIA','Obriga preencher todos os campos de portaria de veiculo exceto apelido e OS','1',0,0,0,0,0),
	(88,1,0,'INTERFACE','OCULTAR_POSICIONAREM_RELAT_SEPARACAO','','1',1,1,1,1,1),
	(89,1,1,'SISTEMA','PAGINACAO','Número de registros por página no pagination.','100',1,1,1,1,1),
	(90,1,1,'INTERFACE','PAGINACAO_RELATORIO_SALDO_UMAS','Ativa paginacao no relatorio de saldo umas','',0,0,0,0,0),
	(92,0,0,'GERAL','PERFIL_FABRICANTE','Permite cadatrar itens sem cliente associado ou com vários clientes','',0,0,0,0,0),
	(93,1,1,'GERAL','PERFIL_PRODUCAO','Permite cadastro de estrutura de itens e permite trabalhar com produção no armazém','',1,1,1,1,1),
	(94,0,0,'GERAL','PERFIL_PRODUCAO_COM_KITS','Perfil de empresa que tem produção usando Kits (Siemens por exemplo)','',1,1,1,1,1),
	(95,1,1,'PERMISSOES','PERMITE_APELIDO_PORTARIA','Habilitacao do campo Apelido na portaria','1',1,1,1,1,1),
	(96,0,1,'PERMISSAO','PERMITE_ENTRADA_DINAMICA_POR_ITEM','Habilita entrada dinamica por item','1',0,0,0,0,0),
	(97,0,0,'PERMISSAO','PERMITE_SEPARAR_MENOS_RESERVADA','Permite separar uma quantidade menor que a quantidade reservada','1',0,0,0,0,0),
	(98,1,0,'PERMISSAO','PERMITIR_AGRUPAMENTO_NOTA_SAIDA','Exibe botão para acessar a funcionalidade de agrupamento de nfs de saida','1',1,1,1,1,1),
	(99,1,0,'PERMISSAO','PERMITIR_ASSOCIAR_NFE','Permite associar NFe a programações de entrada/saída','',1,1,1,1,1),
	(100,0,0,'PERMISSOES','PERMITIR_BAIXAR_OS_SAIDA','Permitir baixar todas as umas de uma OS específica','',0,0,0,0,0),
	(102,1,0,'PERMISSAO','PERMITIR_CANCELAR_NOTA_SAIDA','Permitir o cancelamento de notas de saidas para usuários.','',1,1,1,1,1),
	(103,1,0,'OPERACAO','PERMITIR_CONTAGEM_DIFERENTE_OS','Permite inserir carga se a contagem for diferente da programada','',1,1,1,1,1),
	(104,0,0,'AUTOMACAO','PERMITIR_DESMEMBRAMENTO_NOTA_SAIDA','Desmembra itens da nota fiscal de saida em outras novas notas com cfop de entrada','1',0,0,0,0,0),
	(105,1,0,'OPERACAO','PERMITIR_DIVERGENCIA_ENTRADA','Permitir divergência na entrada de cargas após aprovação na programação','',1,1,1,1,1),
	(106,0,0,'PERMISSAO','PERMITIR_ENTRADA_ADIC_NUMSEQ','Permite adicionar a quantidade de outro NUMSEQ ao NUMSEQ da OS atual','',0,0,0,0,0),
	(107,1,0,'PERMISSOES','PERMITIR_ENTRADA_DINAMICA',NULL,NULL,1,1,1,1,1),
	(108,0,0,'OPERACAO','PERMITIR_ENTRADA_UMA_USADA','Pemitir registrar uma entrada em uma UMA já utilizada','',0,0,0,0,0),
	(109,0,0,'PERMISSAO','PERMITIR_EXIBIR_SALDO_BLOQUEADO','Permitir exibir o saldo bloqueado, avariada, separado e reservado no perfil do cliente','',0,0,0,0,0),
	(110,0,0,'PERMISSAO','PERMITIR_EXPORTAR_BLOCO_K',NULL,NULL,0,0,0,0,0),
	(111,0,0,'PERMISSAO','PERMITIR_FILTRAR_ARMAZEM_PORTARIA','Permite o filtro de armazém na portaria.','',0,0,0,0,0),
	(112,0,0,'AUTOMACAO','PERMITIR_GERAR_NFE_AUTOMATICA','Permite a geração de nota fiscal automaticamente, após a conclusão da OS de saída.','0',0,0,0,0,0),
	(113,1,0,'OPERACAO','PERMITIR_GERAR_NFE_NA_RESERVA','Permite gerar NFe na reserva (OS de saída) ao invés do final da separação','',1,1,1,1,1),
	(114,1,0,'PERMISSAO','PERMITIR_IMPORTAR_PROG_ENTRADA','Permite importar programação de entrada de carga','',1,1,1,1,1),
	(115,1,0,'PERMISSAO','PERMITIR_IMPORTAR_PROG_SAIDA','Permite importar programação de saída de carga','',1,1,1,1,1),
	(117,1,0,'PERMISSAO','PERMITIR_ITENS_IGUAIS','Permitir cadastro de itens iguais para clientes diferentes (o campo chave é o código de barras)','',1,1,1,1,1),
	(118,1,1,'PERMISSAO','PERMITIR_ITENS_INAPTOS','Permitir o trabalho com itens inaptos','',1,1,1,1,1),
	(119,0,0,'PERMISSAO','PERMITIR_MOSTRAR_SKU_ENTRADA','Informa o código do SKU na entrada automaticamente','',0,0,0,0,0),
	(120,0,1,'PERMISSAO','PERMITIR_POSICAO_INATIVA_RESERVA','Permitir utilizar posições inativas no momento da reserva','',0,0,0,0,0),
	(121,0,0,'PERMISSAO','PERMITIR_POSICIONAR_SEM_DIMENSAO','Permitir o posicionamento sem a verficação da dimensão','0',0,0,0,0,0),
	(122,1,0,'PERMISSAO','PERMITIR_RESERVAR_SEM_POSICAO','Permitir a reserva de umas sem posições.','',1,1,1,1,1),
	(123,1,0,'PERMISSAO','PERMITIR_RESERVAR_UMA_SEM_NOTA_ENTRADA','Permitir reservar umas sem referência de nota de entrada para os casos de cliente fiscal.','',1,1,1,1,1),
	(124,1,0,'PERMISSAO','PERMITIR_SAIDA_AO_SEPARAR','Efetua a saída automaticamente ao concluir a separação','',0,0,0,0,0),
	(125,1,0,'PERMISSAO','PERMITIR_SAIDA_AVULSA','Permitir efetivar saída avulsa','',0,0,0,0,0),
	(126,1,0,'PERMISSAO','PERMITIR_SEPARACAO_SAIDA_SIMULTANEA','Permitir exibir separação, e saídae separação simultâneamente no coletor.','',1,1,1,1,1),
	(127,0,0,'PERMISSAO','PERMITIR_SEPARACAO_SEM_POSICAO','Permite separar cargas mesmo sem estarem posicionadas','',0,0,0,0,0),
	(129,0,0,'PERMISSAO','PERMITIR_TRANFERIR_RESERVADA_SEPARADA','Permitir transferência da carga com status reservado ou separado','',0,0,0,0,0),
	(130,1,0,'PERMISSAO','PERMITIR_TRANSFERIR_CONFERENCIA_UMA','Possibilita flegar dados de conferencia para UMA de destino ao transferir',NULL,1,1,1,1,1),
	(131,1,0,'PERMISSAO','PERMITIR_UMA_INICIAL_FINAL','Permite solicitar faixa de UMAs para entrada','',1,1,1,1,1),
	(132,1,0,'PERMISSAO','PERMITIR_UMA_SEM_OS','Permite criar UMA sem especificar OS, podendo usar depois','',1,1,1,1,1),
	(133,0,0,'PERMISSAO','PERMITIR_VARIAS_UMAS_INVENTARIO','Permiti inventariar com várias umas','',0,0,0,0,0),
	(134,1,0,'PERMISSAO','PERMITIR_VERIFICAR_PROPRIETARIO','Verificar o proprietário','',1,1,1,1,1),
	(135,1,1,'AUTOMACAO','PERSISTIR_NOTA_PORTARIA','Persiste dados de nota na entrada de veiculo',NULL,1,1,1,1,1),
	(136,0,0,'OPERACAO','POSICIONAMENTO_LIVRE','Permite posicionar mesmo sem área/região para o item','',0,0,0,0,0),
	(137,0,0,'OPERACAO','POSICIONAMENTO_VALIDAR_AREA_AVARIA','Permitir apenas cargas avariadas nas posições da área de avaria.','',0,0,0,0,0),
	(138,0,0,'OPERACAO','POSICIONAMENTO_VALIDAR_PROPRIETARIO_AREA','Validar o proprietário vinculado a área da posição antes de posicionar.','',0,0,0,0,0),
	(139,1,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_ANDAR','Formato da identificação dos andares para cód. de barras','00',1,1,1,1,1),
	(140,1,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_APTO','Formato da identificação dos apartamentos para cód. de barras','00',1,1,1,1,1),
	(141,0,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_ARMAZEM','Formato da identificação do armazém para cód. de barras','0',1,1,1,1,1),
	(142,1,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_MODULO','Formato da posição modulo','00',1,1,1,1,1),
	(143,1,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_PREDIO','Formato da identificação dos prédos para cód. de barras','00',1,1,1,1,1),
	(144,1,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_RUA','Formato da identificação das ruas para cód. de barras','000',1,1,1,1,1),
	(145,1,0,'DADO_PREDEFINIDO','POSICOES_FORMATO_SEPARADOR','Separador de dígitos do cód. de barras de posição',' ',1,1,1,1,1),
	(146,1,1,'DADO_PREDEFINIDO','QUANTIDADE_MAX_UMA_NA_ENTRADA','Quantidade maxima de UMAs a conferir na Entrada UMA Virgem','1000',1,1,1,1,1),
	(147,0,1,'INTERFACE','REJEITAR_ITEM_NAO_PROGRAMADO_ENTRADA','Se item nao estiver programado na entrada, notificar','1',0,0,0,0,0),
	(148,0,0,'AUTOMACAO','REPLICAR_EXPEDIR_PARA_DIRECIONAR','Replica o valor do campo expedir na rea para o campo direcionar para area','1',0,0,0,0,0),
	(149,0,0,'PERMISSAO','SAIR_VEICULO_SEM_EXECUTAR_ENTRADA','Permitir a saída do veiculo no modulo de portaria, sem a necessidade de executar a OS de entrada.','',0,0,0,0,0),
	(150,0,0,'PERMISSAO','SAIR_VEICULO_SEM_EXECUTAR_SAIDA','Permitir a saída do veiculo no modulo de portaria, sem a necessidade de executar a OS de saída.','',0,0,0,0,0),
	(151,1,1,'PERMISSAO','SELECIONAR_OS_PROPRIETARIO_PORTARIA','Obriga preenchimento de OS do proprietario na portaria','1',1,1,1,1,1),
	(152,1,1,'OPERACAO','SEPARACAO_SIMPLIFICADA','Separação simplificada, com separação de quantidade e posicionamento.','0',1,1,1,1,1),
	(153,0,0,'OPERACAO','SUGERIR_POSICAO_EXPEDICAO','Apresenta o campo de posição de expedição já preenchido','',0,0,0,0,0),
	(154,0,1,'OPERACAO','SUGERIR_QUANTIDADE_SAIDA_AVULSA','Sugere saldo total do item na saida avulsa','',1,1,1,1,1),
	(155,1,0,'TEXTOS','TEXTO_OS_NUMERO_CLIENTE','Label para o campo Nº Cliente','Nº da OF',1,1,1,1,1),
	(156,1,0,'TEXTOS','TEXTO_REL_MOSTRAR_OP','Label para o filtro de relatório Mostrar OP','Mostrar OF',1,1,1,1,1),
	(157,1,1,'DADO_PREDEFINIDO','TURNO_1','Horário do turno 1','05:30-13:50',1,1,1,1,1),
	(158,1,1,'DADO_PREDEFINIDO','TURNO_2','Horário do turno 2','13:50-22:10',1,1,1,1,1),
	(159,1,1,'DADO_PREDEFINIDO','TURNO_3','Horário do turno 3','22:10-05:30',1,1,1,1,1),
	(160,1,0,'OPERACAO','USA_ANDAR_ZERO','Permite cadastrar posicao com andar 00','1',1,1,1,1,1),
	(161,0,0,'PERMISSAO','USA_ARMAZEM_EM_POSICOES_BLOCADO','Usar o código do armazém nos blocados.','',0,0,0,0,0),
	(162,0,0,'INTERFACE','USA_CARGAS_REFRIGERADAS','Solicita campos sobre temperatura','',0,0,0,0,0),
	(163,0,0,'DADO_PREDEFINIDO','USA_CODIGO_UMA_ANTIGO_INVENTARIO','Usar o campo código de barras antigo no inventário','logic_gsapp_wms',1,1,1,1,1),
	(164,0,0,'PERMISSAO','USA_CODIGOS_IGUAIS_PARA_SKUS','Permite usar códigos iguais para SKUs diferentes no mesmo item','',0,0,0,0,0),
	(165,0,0,'OPERACAO','USA_CONFERENCIA_SAIDA','Usar etapa de conferência na operação','',0,0,0,0,0),
	(166,1,0,'OPERACAO','USA_CONTAGEM_DADOS_OS','Privilegia dados da programação na contagem da entrada','',1,1,1,1,1),
	(167,1,0,'OPERACAO','USA_DATA_FABRICACAO','Solicita campo de data de fabricação','',1,1,1,1,1),
	(168,1,0,'OPERACAO','USA_DATA_VALIDADE','Solicita campo de data de validade','',1,1,1,1,1),
	(169,0,0,'OPERACAO','USA_DESTINATARIO','Habilitar o campo Destinatário na programação','',0,0,0,0,0),
	(170,1,1,'OPERACAO','USA_EVENTOS','Permitir inserir eventos na base de dados',NULL,1,1,1,1,1),
	(171,0,0,'SISTEMA','USA_IMPRESSORA','Usar impressora automaticamente, se desmarcado irá gerar o arquivo .prn','',0,0,0,0,0),
	(172,1,0,'OPERACAO','USA_M2','Solicita campos sobre m2','',1,1,1,1,1),
	(173,1,0,'OPERACAO','USA_M3','Solicita campos sobre m3','',1,1,1,1,1),
	(174,1,0,'OPERACAO','USA_MODULO_EM_POSICOES','Utilizar campo modulo em posições',NULL,1,1,1,1,1),
	(175,0,0,'OPERACAO','USA_PICKING','Cliente faz uso de picking','',0,0,0,0,0),
	(176,0,0,'OPERACAO','USA_PORTARIA','Habilitar o módulo de portaria para para controle de acessos de pessoas e veículos','',0,0,0,0,0),
	(177,1,0,'OPERACAO','USA_POSICAO_COMO_UMA','Codigo de barras da UMA igual a codigo da posicao','',1,1,1,1,1),
	(178,1,1,'DADO_PREDEFINIDO','USA_REFRESH_OS','Utiliza a opção de atualização automática na tela de programação','15000',1,1,1,1,1),
	(179,1,1,'OPERACAO','USA_REGRA_PALETIZACAO','A empresa utiliza de regra de paletização.','',1,1,1,1,1),
	(181,1,0,'OPERACAO','USA_SERIAL','Solicita campos sobre o serial',NULL,1,1,1,1,1),
	(182,0,0,'OPERACAO','USAR_REGRA_POSICIONAMENTO','Usar regra de posicionamento para indicar posições.','',0,0,0,0,0),
	(183,1,0,'OPERACAO','VALIDACAO_FISCAL_ENTRADA_DINAMICA','validar fiscalmente operacao entrada dinamica','',0,0,0,0,0),
	(184,1,0,'INTERFACE','VALIDAR_DATA_PREVISAO_PROGRAMACAO','Verifica se data de previsao e maior que (data atual - 5 min.)',NULL,1,1,1,1,1),
	(185,0,0,'OPERACAO','VALIDAR_RESTRICOES_PORTARIA','Subdivide permissoes de autorizacoes, entradas e saidas','1',0,0,0,0,0),
	(186,1,0,'DADO_PREDEFINIDO','VER_OS_ATE','Visualizar OS até a quantidade de dias Ã  frente','15',1,1,1,1,1),
	(187,1,0,'DADO_PREDEFINIDO','VER_OS_DE','Visualizar OS a partir de quantos dias atrás','15',1,1,1,1,1),
	(188,0,0,'INTERFACE','VER_OS_ORDENADA_NUM_CLIENTE','Ordena OS pelo nÂº do Cliente ao invés do número da OS','',0,0,0,0,0),
	(189,0,0,'INTERFACE','VER_OS_SOMENTE_DO_DONO','Na entrada e saída, só visualiza OS associadas ao usuário','',0,0,0,0,0),
	(191,0,0,'OPERACAO','VERIFICAR_SKU_POSICIONAMENTO','Verificar o sku no momento do posicionamento','',0,0,0,0,0),
	(192,0,0,'INTERFACE','VISUALIZAR_APENAS_DIRECIONADAS_SEPARACAO','Restringe a visualização das programações de separação apenas para o usuário designado','1',0,0,0,0,0),
	(193,0,0,'GERAL','RESERVAR_VALIDANDO_PRAZO_MINIMO','Ao reservar verifica se quantidade de dias até data de vencimento é maior do que o prazo mínimo definido pelo destinatário','',1,1,1,1,1),
	(194,1,0,'GERAL','PERMITE_ALTERAR_TIPO_PROGRAMACAO_SAIDA','Permite alterar o tipo de saída antes de realizar a reserva','',1,1,1,1,1),
	(195,1,0,'INTERFACE','EXIBIR_CAMPO_OBSERVACAO_SEPARACAO','Ao concluir a separação, exibe um campo de observações da programacão','',1,1,1,1,1),
	(196,0,1,NULL,'IMPORTAR_KIT','','',1,1,1,1,1),
	(197,0,1,NULL,'VER_OS_COM_ITEM_FALTANTE','VISUALIZAR OS COM FALTANTES NA OPERACAO DE ENTRADA','',1,1,1,1,1),
	(198,0,0,'AUTOMACAO','PERMITIR_SERIAL_COMO_LOTE','Persiste serial em umas_itens.lote. Na operacao de entrada solicita seriais conforme quantidade informada para item que exige serial.','',1,1,1,1,1),
	(199,0,1,'DADO_PREDEFINIDO','ACRESCIMO_MINUTOS_DATA_PREVISAO_IMPORTAR','Define o tempo em minutos que deve ser somado com a hora atual ao criar novas programacoes criadas atraves de importacao de arquivos, este resultado sera atribuido a data de previsao','120',1,1,1,1,1),
	(200,0,0,'','INTEGRACAO_KIMBERLY_SUZANO','Habilita a integraÃ§Ã£o entre Kimberly e Suzano','',1,1,1,1,1);

/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela periodicidades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `periodicidades`;

CREATE TABLE `periodicidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL DEFAULT '',
  `dias` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `periodicidades` WRITE;
/*!40000 ALTER TABLE `periodicidades` DISABLE KEYS */;

INSERT INTO `periodicidades` (`id`, `descricao`, `dias`)
VALUES
	(1,'Mensal',31),
	(2,'Quinzenal',15),
	(3,'Semanal',7);

/*!40000 ALTER TABLE `periodicidades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela pessoas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas`;

CREATE TABLE `pessoas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recno` bigint NOT NULL DEFAULT '0',
  `loja` char(2) NOT NULL DEFAULT '',
  `cliente_id` char(6) NOT NULL DEFAULT '',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cancelou` datetime DEFAULT '0000-00-00 00:00:00',
  `data_ultimo_acesso` datetime DEFAULT '0000-00-00 00:00:00',
  `id_pessoas_dono` bigint unsigned DEFAULT '0',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `tipo` char(1) DEFAULT 'F',
  `situacao` varchar(20) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `apelido` varchar(50) DEFAULT NULL,
  `senha` varchar(80) DEFAULT NULL,
  `cliente` tinyint unsigned DEFAULT '0',
  `fornecedor` tinyint unsigned DEFAULT '0',
  `terceirizado` tinyint unsigned DEFAULT '0',
  `concorrente` tinyint unsigned DEFAULT '0',
  `funcionario` tinyint(1) DEFAULT '0',
  `motorista` tinyint(1) DEFAULT '0',
  `transportadora` tinyint(1) DEFAULT '0',
  `fiscal` tinyint(1) DEFAULT '0',
  `venda` tinyint(1) DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  `ramal` varchar(10) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `imagem` blob,
  `imagem_tipo` varchar(20) DEFAULT '',
  `imagem_largura` int DEFAULT '0',
  `imagem_altura` int DEFAULT '0',
  `emitir_nfe` tinyint(1) DEFAULT '0',
  `tema` varchar(45) DEFAULT NULL,
  `fonte_padrao` varchar(45) DEFAULT NULL,
  `fonte_titulos` varchar(45) DEFAULT NULL,
  `ultimo_ip` varchar(45) DEFAULT NULL,
  `indicar_posicao` tinyint(1) DEFAULT '0',
  `priorizar_palete_aberto` tinyint(1) DEFAULT '0',
  `entrada_dinamica` tinyint(1) DEFAULT '0',
  `priorizar_palete_fechado` tinyint(1) DEFAULT '0',
  `tipo_separacao` int DEFAULT '0',
  `converter_sku` tinyint(1) DEFAULT '0',
  `armazem` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CLIENTE` (`cliente`),
  KEY `FUNCIONARIO` (`funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;

INSERT INTO `pessoas` (`id`, `recno`, `loja`, `cliente_id`, `data_cadastro`, `data_alteracao`, `data_cancelou`, `data_ultimo_acesso`, `id_pessoas_dono`, `id_pessoas_criou`, `id_pessoas_alterou`, `id_pessoas_cancelou`, `tipo`, `situacao`, `nome`, `apelido`, `senha`, `cliente`, `fornecedor`, `terceirizado`, `concorrente`, `funcionario`, `motorista`, `transportadora`, `fiscal`, `venda`, `email`, `telefone`, `celular`, `ramal`, `site`, `imagem`, `imagem_tipo`, `imagem_largura`, `imagem_altura`, `emitir_nfe`, `tema`, `fonte_padrao`, `fonte_titulos`, `ultimo_ip`, `indicar_posicao`, `priorizar_palete_aberto`, `entrada_dinamica`, `priorizar_palete_fechado`, `tipo_separacao`, `converter_sku`, `armazem`)
VALUES
	(1,0,'','',NULL,NULL,'0000-00-00 00:00:00',NULL,0,1,0,0,'J','Ativo','Suporte GS','root','8fd44b853704a4db03a4146a98bc8615',0,0,0,0,0,0,0,0,0,'suporte@giusoft.com.br',NULL,NULL,NULL,'www.giusoft.com.br',NULL,'',0,0,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0),
	(2,0,'','',NULL,NULL,'0000-00-00 00:00:00',NULL,0,1,0,0,'J','Ativo','Administrador','keyuser','89794b621a313bb59eed0d9f0f4e8205',0,0,0,0,0,0,0,0,0,'admin@email.com',NULL,NULL,NULL,NULL,NULL,'',0,0,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0),
	(3,0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0,'F','Ativo','Estoquista','estoquista','89794b621a313bb59eed0d9f0f4e8205',0,0,0,0,1,0,0,0,0,'','','',NULL,NULL,NULL,'',0,0,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0),
	(4,0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0,'J','Ativo','Primeiro Cliente','cliente','89794b621a313bb59eed0d9f0f4e8205',1,0,0,0,0,0,0,0,0,'','','',NULL,NULL,NULL,'',0,0,0,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0);

/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela pessoas_acessos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_acessos`;

CREATE TABLE `pessoas_acessos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint NOT NULL,
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `id_pessoas_entrada` bigint DEFAULT NULL,
  `id_pessoas_criou` bigint DEFAULT '0',
  `id_pessoas_saida` bigint DEFAULT NULL,
  `id_pessoas_autorizou_entrada` bigint unsigned NOT NULL,
  `id_pessoas_autorizou_saida` bigint DEFAULT NULL,
  `id_pessoas_funcionario` bigint NOT NULL,
  `id_setores` bigint unsigned NOT NULL,
  `motivo` varchar(60) DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `data_chegada` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_entrada` datetime DEFAULT '0000-00-00 00:00:00',
  `data_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `data_autorizou_entrada` datetime DEFAULT '0000-00-00 00:00:00',
  `data_autorizou_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `hora_chegada` char(5) NOT NULL,
  `hora_autorizacao` char(5) NOT NULL,
  `hora_entrada` char(5) NOT NULL,
  `hora_saida` char(5) NOT NULL,
  `observacoes` text,
  `datahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa` (`id_pessoas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela pessoas_anexos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_anexos`;

CREATE TABLE `pessoas_anexos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_pessoas` bigint unsigned DEFAULT '0',
  `id_pessoas_criou` bigint unsigned DEFAULT '0',
  `descricao` varchar(60) DEFAULT NULL,
  `arquivo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela pessoas_armazens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_armazens`;

CREATE TABLE `pessoas_armazens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint DEFAULT '0',
  `id_pessoas` bigint DEFAULT '0',
  `id_pessoas_criou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `data_criou` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cancelou` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelado` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `pessoas_armazens` WRITE;
/*!40000 ALTER TABLE `pessoas_armazens` DISABLE KEYS */;

INSERT INTO `pessoas_armazens` (`id`, `id_armazens`, `id_pessoas`, `id_pessoas_criou`, `id_pessoas_cancelou`, `data_criou`, `data_cancelou`, `cancelado`)
VALUES
	(1,1,3113,1,0,'2022-06-12 12:26:09','0000-00-00 00:00:00',0),
	(2,1,3114,1,0,'2022-06-12 12:52:54','0000-00-00 00:00:00',0),
	(3,1,4,1,0,'2022-06-13 08:45:32','0000-00-00 00:00:00',0);

/*!40000 ALTER TABLE `pessoas_armazens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela pessoas_cfops
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_cfops`;

CREATE TABLE `pessoas_cfops` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint DEFAULT '0',
  `id_cfops` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela pessoas_enderecos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_enderecos`;

CREATE TABLE `pessoas_enderecos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `aplicacao` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `id_enderecos_cidades` bigint unsigned NOT NULL DEFAULT '0',
  `id_enderecos_estados` bigint unsigned NOT NULL DEFAULT '0',
  `id_enderecos_paises` bigint unsigned NOT NULL DEFAULT '0',
  `cep` char(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela pessoas_fisicas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_fisicas`;

CREATE TABLE `pessoas_fisicas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `data_nascimento` date NOT NULL DEFAULT '0000-00-00',
  `telefone_comercial` varchar(30) NOT NULL DEFAULT '',
  `telefone_celular` varchar(30) NOT NULL DEFAULT '',
  `telefone_residencial` varchar(30) NOT NULL DEFAULT '',
  `cpf` varchar(30) NOT NULL DEFAULT '',
  `rg` varchar(30) NOT NULL DEFAULT '',
  `contato_principal` tinyint unsigned NOT NULL DEFAULT '0',
  `contato_comercial` tinyint unsigned NOT NULL DEFAULT '0',
  `contato_financeiro` tinyint unsigned NOT NULL DEFAULT '0',
  `contato_operacional` tinyint unsigned NOT NULL DEFAULT '0',
  `cnh` varchar(30) DEFAULT NULL,
  `cnh_categoria` varchar(5) DEFAULT NULL,
  `cnh_data_emissao` date DEFAULT '0000-00-00',
  `cnh_data_validade` date DEFAULT '0000-00-00',
  `observacoes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `pessoas_fisicas` WRITE;
/*!40000 ALTER TABLE `pessoas_fisicas` DISABLE KEYS */;

INSERT INTO `pessoas_fisicas` (`id`, `id_pessoas`, `data_nascimento`, `telefone_comercial`, `telefone_celular`, `telefone_residencial`, `cpf`, `rg`, `contato_principal`, `contato_comercial`, `contato_financeiro`, `contato_operacional`, `cnh`, `cnh_categoria`, `cnh_data_emissao`, `cnh_data_validade`, `observacoes`)
VALUES
	(1,3,'0000-00-00','','','','','',0,0,0,0,'','','0000-00-00','0000-00-00','');

/*!40000 ALTER TABLE `pessoas_fisicas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela pessoas_juridicas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_juridicas`;

CREATE TABLE `pessoas_juridicas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `matriz` tinyint unsigned NOT NULL DEFAULT '1',
  `unidade` varchar(30) DEFAULT NULL,
  `razao_social` varchar(100) DEFAULT NULL,
  `cnpj` varchar(30) DEFAULT NULL,
  `insc_municipal` varchar(30) DEFAULT NULL,
  `insc_estadual` varchar(30) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `id_pessoas_ramos` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_portes` bigint unsigned NOT NULL DEFAULT '0',
  `observacoes` text NOT NULL,
  `codigo_datasul` varchar(9) DEFAULT NULL,
  `faz_segunda_separacao` tinyint DEFAULT '0',
  `lote_xprod` tinyint(1) DEFAULT '0',
  `prazo` int DEFAULT '0',
  `lead_time` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PESSOA` (`id_pessoas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `pessoas_juridicas` WRITE;
/*!40000 ALTER TABLE `pessoas_juridicas` DISABLE KEYS */;

INSERT INTO `pessoas_juridicas` (`id`, `id_pessoas`, `matriz`, `unidade`, `razao_social`, `cnpj`, `insc_municipal`, `insc_estadual`, `site`, `id_pessoas_ramos`, `id_pessoas_portes`, `observacoes`, `codigo_datasul`, `faz_segunda_separacao`, `lote_xprod`, `prazo`, `lead_time`)
VALUES
	(1,4,1,'0','Primeiro Cliente Ltda.','','','','',0,0,'',NULL,0,0,0,0);

/*!40000 ALTER TABLE `pessoas_juridicas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela pessoas_ocorrencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_ocorrencias`;

CREATE TABLE `pessoas_ocorrencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime DEFAULT NULL,
  `data_ocorrencia` datetime DEFAULT NULL,
  `id_pessoas_criou` bigint DEFAULT '0',
  `id_tipos_ocorrencias` bigint unsigned DEFAULT '0',
  `id_pessoas_funcionario` bigint unsigned DEFAULT '0',
  `id_pessoas` bigint unsigned DEFAULT '0',
  `publica` tinyint(1) DEFAULT '0',
  `descricao` text,
  `data_digitacao` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela pessoas_prioridades_reservas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pessoas_prioridades_reservas`;

CREATE TABLE `pessoas_prioridades_reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_prioridade` int DEFAULT NULL,
  `id_pessoas` bigint DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1',
  `ordem` int DEFAULT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `pessoas_prioridades_reservas` WRITE;
/*!40000 ALTER TABLE `pessoas_prioridades_reservas` DISABLE KEYS */;

INSERT INTO `pessoas_prioridades_reservas` (`id`, `id_prioridade`, `id_pessoas`, `ativo`, `ordem`, `descricao`)
VALUES
	(1,1,0,0,0,'Ordem de prioridades'),
	(2,2,0,1,1,'Área de picking'),
	(3,3,0,1,2,'Prioridade do cadastro do item'),
	(4,4,0,1,3,'Menor número do prédio'),
	(5,5,0,0,4,'Maior número do prédio'),
	(6,6,0,0,5,'Palete aberto'),
	(7,7,0,0,6,'Palete fechado'),
	(8,8,0,0,7,'Palete não posicionado');

/*!40000 ALTER TABLE `pessoas_prioridades_reservas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela posicoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posicoes`;

CREATE TABLE `posicoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_areas` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime DEFAULT '0000-00-00 00:00:00',
  `codigo_barras` varchar(40) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `picking` tinyint(1) NOT NULL DEFAULT '0',
  `observacoes` varchar(60) DEFAULT NULL,
  `quantidade` int DEFAULT '1',
  `quantidade_posicionada` int DEFAULT '0',
  `separador` char(1) DEFAULT '.',
  `armazem` char(3) DEFAULT '1',
  `modulo` char(10) DEFAULT '0',
  `rua` char(3) DEFAULT 'A',
  `lado` char(1) DEFAULT 'P',
  `predio` char(3) DEFAULT '000',
  `andar` char(3) DEFAULT '000',
  `apartamento` char(3) DEFAULT '000',
  `altura` decimal(10,4) DEFAULT '0.0000',
  `largura` decimal(10,4) DEFAULT '0.0000',
  `comprimento` decimal(10,4) DEFAULT '0.0000',
  `peso_suportado` decimal(10,4) DEFAULT '0.0000',
  `palete_vazio` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_cb` (`codigo_barras`),
  KEY `IX_armazens` (`id_armazens`),
  KEY `AREA` (`id_areas`),
  KEY `ATIVO` (`ativo`),
  KEY `MODULO` (`modulo`,`rua`,`predio`,`andar`,`apartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela precos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `precos`;

CREATE TABLE `precos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_faturar` bigint unsigned NOT NULL DEFAULT '0',
  `data_criacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_inicio` date NOT NULL DEFAULT '0000-00-00',
  `data_final` date NOT NULL DEFAULT '0000-00-00',
  `id_grupos` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela precos_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `precos_itens`;

CREATE TABLE `precos_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_precos` bigint unsigned NOT NULL DEFAULT '0',
  `id_servicos` bigint unsigned NOT NULL DEFAULT '0',
  `id_periodicidades` bigint unsigned NOT NULL DEFAULT '0',
  `id_unidades_faturamento` bigint unsigned NOT NULL DEFAULT '0',
  `quantidade_minima` decimal(20,6) DEFAULT '0.000000',
  `valor_unitario` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela prioridades_saida
# ------------------------------------------------------------

DROP TABLE IF EXISTS `prioridades_saida`;

CREATE TABLE `prioridades_saida` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `prioridades_saida` WRITE;
/*!40000 ALTER TABLE `prioridades_saida` DISABLE KEYS */;

INSERT INTO `prioridades_saida` (`id`, `descricao`)
VALUES
	(1,'FIFO'),
	(2,'FEFO'),
	(3,'LIFO'),
	(4,'Ignorar');

/*!40000 ALTER TABLE `prioridades_saida` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela programacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao`;

CREATE TABLE `programacao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_reservou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_separou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_executou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_destinatario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_motorista` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_colaborador` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_conferiu_saida` bigint DEFAULT '0',
  `id_veiculos` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_areas` bigint unsigned NOT NULL DEFAULT '0',
  `id_areas_direcionar` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_apanha` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_origem` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_grupos` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus_kit` bigint DEFAULT '0',
  `data_criacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_alteracao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_previsao_inicial` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_previsao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_execucao_inicio` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_execucao_final` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_conferencia_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `data_reservada` datetime DEFAULT '0000-00-00 00:00:00',
  `data_separada` datetime DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `os` char(20) NOT NULL DEFAULT '',
  `numero_cliente` varchar(200) NOT NULL,
  `numseq` varchar(40) NOT NULL DEFAULT '',
  `recno` bigint NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `liberada` tinyint(1) DEFAULT '1',
  `iniciada` tinyint(1) NOT NULL DEFAULT '0',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `executada` tinyint(1) NOT NULL DEFAULT '0',
  `importada` tinyint DEFAULT '0',
  `divergencia` tinyint(1) NOT NULL DEFAULT '0',
  `conferida_saida` tinyint DEFAULT '0',
  `apanha_concluida` tinyint(1) DEFAULT '0',
  `carregando` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_reserva` tinyint(1) DEFAULT '0' COMMENT '0 - Não reservada\n1 - Reserva Manual\n2 - Reserva Normal\n',
  `entrada_dinamica` tinyint(1) DEFAULT '0',
  `crossdocking` tinyint(1) DEFAULT '0',
  `usar_saldos` tinyint(1) DEFAULT '1',
  `observacoes` longtext NOT NULL,
  `ocorrencias` longtext NOT NULL,
  `lote` varchar(50) NOT NULL DEFAULT '',
  `posicionar_em` varchar(30) DEFAULT '',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `prioridade` bigint NOT NULL DEFAULT '0',
  `reservando` tinyint(1) DEFAULT '0',
  `apanha_simplificada` tinyint(1) DEFAULT '0',
  `quantidade_programada` decimal(20,6) DEFAULT '0.000000',
  `quantidade_reservada` decimal(20,6) DEFAULT '0.000000',
  `detalhes_nfe` text,
  `criar_eventos` tinyint(1) DEFAULT '0',
  `liberada_saida` tinyint(1) DEFAULT '0',
  `rota` varchar(255) DEFAULT NULL,
  `usa_uma_virgem` tinyint(1) DEFAULT '0',
  `id_areas_direcionar_falta` bigint DEFAULT '0',
  `id_areas_direcionar_sobra` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `OS` (`os`),
  KEY `PROPRIETARIO` (`id_pessoas_proprietario`),
  KEY `DATA_PREVISAO` (`data_previsao`),
  KEY `NUMERO_CLIENTE` (`numero_cliente`(191)),
  KEY `NUMSEQ` (`numseq`),
  KEY `RECNO` (`recno`),
  KEY `APANHA` (`id_programacao_apanha`),
  KEY `ORIGEM` (`id_programacao_origem`),
  KEY `VEICULO` (`id_veiculos_acessos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `programacao` WRITE;
/*!40000 ALTER TABLE `programacao` DISABLE KEYS */;

INSERT INTO `programacao` (`id`, `id_armazens`, `id_pessoas_criou`, `id_pessoas_alterou`, `id_pessoas_reservou`, `id_pessoas_separou`, `id_pessoas_executou`, `id_pessoas_cancelou`, `id_pessoas_proprietario`, `id_pessoas_destinatario`, `id_pessoas_motorista`, `id_pessoas_colaborador`, `id_pessoas_conferiu_saida`, `id_veiculos`, `id_veiculos_acessos`, `id_tipos_programacao`, `id_areas`, `id_areas_direcionar`, `id_programacao_apanha`, `id_programacao_origem`, `id_programacao_grupos`, `id_itens_skus_kit`, `data_criacao`, `data_cadastro`, `data_alteracao`, `data_previsao_inicial`, `data_previsao`, `data_execucao_inicio`, `data_execucao_final`, `data_conferencia_saida`, `data_reservada`, `data_separada`, `ativo`, `os`, `numero_cliente`, `numseq`, `recno`, `cancelada`, `liberada`, `iniciada`, `reservada`, `separada`, `executada`, `importada`, `divergencia`, `conferida_saida`, `apanha_concluida`, `carregando`, `tipo_reserva`, `entrada_dinamica`, `crossdocking`, `usar_saldos`, `observacoes`, `ocorrencias`, `lote`, `posicionar_em`, `data_cancelamento`, `prioridade`, `reservando`, `apanha_simplificada`, `quantidade_programada`, `quantidade_reservada`, `detalhes_nfe`, `criar_eventos`, `liberada_saida`, `rota`, `usa_uma_virgem`, `id_areas_direcionar_falta`, `id_areas_direcionar_sobra`)
VALUES
	(1,1,1,0,0,0,0,0,4,0,0,0,0,0,0,33,0,0,0,0,0,NULL,'0000-00-00 00:00:00','2022-06-13 08:46:34','0000-00-00 00:00:00','2022-06-13 09:01:00','2022-06-13 09:01:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'10000000001/2022','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','','','0000-00-00 00:00:00',0,0,0,0.000000,0.000000,NULL,0,0,NULL,0,0,0),
	(2,1,1,0,0,0,0,0,4,0,0,0,0,0,0,1,0,0,0,0,0,NULL,'0000-00-00 00:00:00','2022-07-12 19:11:58','0000-00-00 00:00:00','2022-07-12 19:26:00','2022-07-12 19:26:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'10000000002/2022','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,'','','','','0000-00-00 00:00:00',0,0,0,0.000000,0.000000,NULL,0,0,NULL,0,0,0);

/*!40000 ALTER TABLE `programacao` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela programacao_atividades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_atividades`;

CREATE TABLE `programacao_atividades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_atividades` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `cancelada` tinyint unsigned DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `descricao` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `PESSOA` (`id_pessoas`),
  KEY `DATA` (`data`),
  KEY `TIPO` (`id_tipos_atividades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `programacao_atividades` WRITE;
/*!40000 ALTER TABLE `programacao_atividades` DISABLE KEYS */;

INSERT INTO `programacao_atividades` (`id`, `id_programacao`, `id_pessoas`, `id_tipos_atividades`, `id_itens_skus`, `cancelada`, `data`, `quantidade`, `descricao`)
VALUES
	(1,0,1,14,0,0,'2022-07-07 08:58:28',1.000000,'Gerou etiquetas de UMA '),
	(2,0,1,14,0,0,'2022-07-07 08:59:28',1.000000,'Gerou etiquetas de UMA ');

/*!40000 ALTER TABLE `programacao_atividades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela programacao_cortes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_cortes`;

CREATE TABLE `programacao_cortes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_winthor_motivos_avarias` bigint DEFAULT '0',
  `id_pessoas` bigint DEFAULT '0',
  `id_programacao` bigint DEFAULT '0',
  `id_umas` bigint DEFAULT '0',
  `id_itens_skus` bigint DEFAULT '0',
  `quantidade` int DEFAULT '0',
  `data` datetime DEFAULT NULL,
  `cancelado` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_entrada_fracionada
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_entrada_fracionada`;

CREATE TABLE `programacao_entrada_fracionada` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint DEFAULT '0',
  `id_primeira_programacao` bigint DEFAULT NULL,
  `id_pessoas` bigint DEFAULT '0',
  `quantidade` decimal(20,6) DEFAULT '0.000000',
  `data_finalizado` datetime DEFAULT '0000-00-00 00:00:00',
  `data_contagem` datetime DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint DEFAULT '0',
  `situacao` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_grupos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_grupos`;

CREATE TABLE `programacao_grupos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` int DEFAULT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_criacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prioridade` tinyint(1) NOT NULL DEFAULT '0',
  `descricao` varchar(60) DEFAULT NULL,
  `cancelado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_inventario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_inventario`;

CREATE TABLE `programacao_inventario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `modulo` char(3) DEFAULT '',
  `rua_de` char(3) NOT NULL DEFAULT '0',
  `rua_ate` char(3) NOT NULL DEFAULT '',
  `lado` char(1) NOT NULL DEFAULT '',
  `predio_de` char(3) NOT NULL DEFAULT '',
  `predio_ate` char(3) NOT NULL DEFAULT '',
  `andar_de` char(3) NOT NULL DEFAULT '',
  `andar_ate` char(3) NOT NULL DEFAULT '',
  `apartamento_de` char(3) NOT NULL DEFAULT '',
  `apartamento_ate` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_inventario_configuracoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_inventario_configuracoes`;

CREATE TABLE `programacao_inventario_configuracoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint DEFAULT '0',
  `item` tinyint(1) DEFAULT '0',
  `quantidade` tinyint(1) DEFAULT '0',
  `lote` tinyint(1) DEFAULT '0',
  `data_fabricacao` tinyint(1) DEFAULT '0',
  `data_validade` tinyint(1) DEFAULT '0',
  `uma` tinyint DEFAULT '1',
  `primeira_contagem_automatica` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `programacao_inventario_configuracoes` WRITE;
/*!40000 ALTER TABLE `programacao_inventario_configuracoes` DISABLE KEYS */;

INSERT INTO `programacao_inventario_configuracoes` (`id`, `id_programacao`, `item`, `quantidade`, `lote`, `data_fabricacao`, `data_validade`, `uma`, `primeira_contagem_automatica`)
VALUES
	(1,1,0,0,0,0,0,1,0);

/*!40000 ALTER TABLE `programacao_inventario_configuracoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela programacao_inventario_posicoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_inventario_posicoes`;

CREATE TABLE `programacao_inventario_posicoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_inventario` bigint DEFAULT NULL,
  `contagens` int NOT NULL DEFAULT '0',
  `conferida` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `POSICAO` (`id_posicoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_itens`;

CREATE TABLE `programacao_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned DEFAULT '0',
  `id_programacao_itens_produzir` bigint DEFAULT NULL,
  `conferida` tinyint(1) NOT NULL DEFAULT '0',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `quantidade_conferida` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `quantidade_aceita` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,3) NOT NULL DEFAULT '0.000',
  `m3` decimal(10,3) NOT NULL DEFAULT '0.000',
  `palete_lastro` int NOT NULL DEFAULT '0',
  `palete_altura` int NOT NULL DEFAULT '0',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `valor` decimal(20,4) DEFAULT NULL,
  `uma` char(20) NOT NULL DEFAULT '',
  `uma_destino` char(20) NOT NULL DEFAULT '',
  `recno` bigint NOT NULL DEFAULT '0',
  `grupo` varchar(50) NOT NULL DEFAULT '',
  `lote` varchar(20) NOT NULL DEFAULT '',
  `id_tipos_programacao` bigint DEFAULT NULL,
  `umas_necessarias` int DEFAULT '0',
  `numero_nota` varchar(30) DEFAULT '',
  `gerou_entrada_dinamica` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `PRODUCAO` (`id_programacao_itens_produzir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_itens_produzir
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_itens_produzir`;

CREATE TABLE `programacao_itens_produzir` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint NOT NULL DEFAULT '0',
  `id_tipos_programacao` bigint NOT NULL DEFAULT '0',
  `id_areas` bigint NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned DEFAULT '0',
  `conferida` tinyint(1) NOT NULL DEFAULT '0',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `quantidade_conferida` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `quantidade_aceita` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,3) NOT NULL DEFAULT '0.000',
  `m3` decimal(10,3) NOT NULL DEFAULT '0.000',
  `palete_lastro` int NOT NULL DEFAULT '0',
  `palete_altura` int NOT NULL DEFAULT '0',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `valor` decimal(20,10) DEFAULT '0.0000000000',
  `uma` char(20) NOT NULL DEFAULT '',
  `uma_destino` char(20) NOT NULL DEFAULT '',
  `recno` bigint NOT NULL DEFAULT '0',
  `grupo` varchar(50) NOT NULL DEFAULT '',
  `lote` varchar(20) NOT NULL DEFAULT '',
  `umas_necessarias` int DEFAULT '0',
  `numero_nota` varchar(30) DEFAULT '',
  `gerou_entrada_dinamica` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`),
  KEY `IX_id_notas_itens` (`id_notas_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_kits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_kits`;

CREATE TABLE `programacao_kits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint DEFAULT NULL,
  `id_itens_skus` bigint DEFAULT NULL,
  `quantidade` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump de tabela programacao_servicos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_servicos`;

CREATE TABLE `programacao_servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned DEFAULT NULL,
  `id_produtos` bigint unsigned DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela programacao_umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programacao_umas`;

CREATE TABLE `programacao_umas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint unsigned DEFAULT '0',
  `id_umas` bigint unsigned DEFAULT '0',
  `executada` tinyint DEFAULT '0',
  `data_execucao` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `PROGRAMACAO` (`id_programacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela regioes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regioes`;

CREATE TABLE `regioes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela regra_posicionamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regra_posicionamento`;

CREATE TABLE `regra_posicionamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `id_pessoas_atualizou` bigint DEFAULT '0',
  `id_areas` bigint DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `data_atualizacao` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelada` tinyint(1) DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '0',
  `unica_op_predio` tinyint(1) DEFAULT '0',
  `unico_lote_predio` tinyint(1) DEFAULT '0',
  `codigo` varchar(30) DEFAULT '',
  `descricao` varchar(100) DEFAULT '',
  `rua` varchar(10) DEFAULT 'ASC',
  `andar` varchar(10) DEFAULT 'ASC',
  `predio` varchar(10) DEFAULT 'ASC',
  PRIMARY KEY (`id`),
  KEY `CODIGO` (`cancelada`,`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela regra_posicionamento_areas_alternativas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regra_posicionamento_areas_alternativas`;

CREATE TABLE `regra_posicionamento_areas_alternativas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_regra_posicionamento` bigint DEFAULT '0',
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `id_pessoas_atualizou` bigint DEFAULT '0',
  `id_areas` bigint DEFAULT '0',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_atualizou` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelada` tinyint DEFAULT '0',
  `ordem` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `REGRA` (`id_regra_posicionamento`),
  KEY `CANCELADA` (`cancelada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela regra_posicionamento_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regra_posicionamento_itens`;

CREATE TABLE `regra_posicionamento_itens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_regra_posicionamento` bigint DEFAULT '0',
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  `id_pessoas_atualizou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_atualizacao` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelada` varchar(45) DEFAULT '0',
  `codigo` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `REGRA` (`id_regra_posicionamento`),
  KEY `CANCELADA` (`cancelada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela regra_posicionamento_posicoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regra_posicionamento_posicoes`;

CREATE TABLE `regra_posicionamento_posicoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_regra_posicionamento` bigint DEFAULT '0',
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  `id_pessoas_atualizou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint DEFAULT '0',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_atualizacao` datetime DEFAULT '0000-00-00 00:00:00',
  `data_cancelamento` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelada` tinyint(1) DEFAULT '0',
  `rua` varchar(30) DEFAULT '',
  `andar` varchar(30) DEFAULT '',
  `lado` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `REGRA` (`id_regra_posicionamento`),
  KEY `CANCELADA` (`cancelada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela separacao_movimentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `separacao_movimentos`;

CREATE TABLE `separacao_movimentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_programacao` bigint DEFAULT '0',
  `id_pessoas_conferiu_quantidade` bigint DEFAULT '0',
  `id_pessoas_conferiu_posicao` bigint DEFAULT '0',
  `id_umas` bigint DEFAULT '0',
  `conferida` tinyint DEFAULT '0',
  `passo` tinyint DEFAULT '0',
  `data_conferido_quantidade` datetime DEFAULT '0000-00-00 00:00:00',
  `data_conferido_posicionamento` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela separacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `separacoes`;

CREATE TABLE `separacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_programacao` bigint unsigned DEFAULT NULL,
  `id_veiculos_acessos` bigint unsigned DEFAULT NULL,
  `id_pessoas` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela separacoes_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `separacoes_itens`;

CREATE TABLE `separacoes_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_separacoes` bigint unsigned DEFAULT '0',
  `id_programacao_itens` bigint unsigned DEFAULT '0',
  `id_umas` bigint unsigned DEFAULT '0',
  `separado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela servicos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `servicos`;

CREATE TABLE `servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `observacoes` varchar(50) DEFAULT NULL,
  `coletor` tinyint(1) DEFAULT '0',
  `id_tipos_programacao` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;

INSERT INTO `servicos` (`id`, `descricao`, `observacoes`, `coletor`, `id_tipos_programacao`)
VALUES
	(1,'Armazenagem (A)','Saldo do período anterior',0,0),
	(2,'Armazenagem (B)','Saldo do período anterior + entradas',0,0),
	(3,'Armazenagem (C)','Pico de posições-palete por período',0,0),
	(4,'Armazenagem (D)','UMA/Paletes',0,0),
	(5,'Armazenagem (E)','* Reservado',0,0),
	(6,'Entrada batida','',0,0),
	(7,'Entrada paletizada','',0,0),
	(8,'Saída batida','',0,0),
	(9,'Saída paletizada','',0,0),
	(10,'Seguro de armazenagem','',0,0),
	(11,'Programação de atividade','',0,0),
	(12,'Hora extra','',0,0),
	(13,'Horário extraordinário','',0,0),
	(14,'Aluguel de sala','',0,0),
	(15,'Locação de mão-de-obra','',0,0),
	(16,'Estacionamento','',0,0),
	(17,'Faturamento mí­nimo','',0,0),
	(18,'Paletização','',0,0),
	(19,'Filmagem','',0,0),
	(20,'Inspeção','',0,0),
	(21,'Inventário','',0,0),
	(22,'Remontagem de palete','',0,0),
	(23,'Selagem','',0,0),
	(24,'Fumigação','',0,0),
	(25,'Diária de cross-docking','',0,0),
	(26,'Desenlonamento','',0,0),
	(27,'Picking de entrada','',0,0),
	(28,'Picking de saída','',0,0),
	(29,'Recuperação de embalagem','',0,0),
	(30,'Pesagem de palete','',0,0),
	(31,'Etiquetagem','',0,0),
	(32,'Montagem de kits','',0,0),
	(33,'Pesagem de SKU','',0,0),
	(34,'Reensaque','',0,0),
	(35,'Impressão de documentos','',0,0),
	(36,'Tonelada expedida','',0,2);

/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela servicos_adicionais
# ------------------------------------------------------------

DROP TABLE IF EXISTS `servicos_adicionais`;

CREATE TABLE `servicos_adicionais` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT '0000-00-00',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_servicos` bigint unsigned NOT NULL DEFAULT '0',
  `quantidade` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela setores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setores`;

CREATE TABLE `setores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela tipos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos`;

CREATE TABLE `tipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;

INSERT INTO `tipos` (`id`, `descricao`)
VALUES
	(1,'Alimentos'),
	(2,'Material de escritório'),
	(3,'Material de limpeza'),
	(4,'Ferramentas'),
	(5,'Equipamentos'),
	(6,'Peças'),
	(7,'Perecíveis'),
	(8,'Produtos'),
	(9,'Consumível');

/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_atividades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_atividades`;

CREATE TABLE `tipos_atividades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_atividades` WRITE;
/*!40000 ALTER TABLE `tipos_atividades` DISABLE KEYS */;

INSERT INTO `tipos_atividades` (`id`, `descricao`)
VALUES
	(1,'Conferência'),
	(2,'Posicionamento'),
	(3,'Separação'),
	(4,'Inventário'),
	(5,'Transferência'),
	(6,'Bloqueio'),
	(7,'Liberação'),
	(8,'Registro de avaria'),
	(9,'Cancelamento de avaria'),
	(10,'Busca de informação'),
	(11,'Entrada'),
	(12,'Saída'),
	(13,'Aceite de conferência'),
	(14,'Etiquetas'),
	(15,'Iniciou OS'),
	(16,'Finalizou OS'),
	(17,'Finalizou separação'),
	(18,'Erro'),
	(19,'Transferência de proprietário'),
	(20,'NFe'),
	(21,'Baixa de programação'),
	(22,'Reserva'),
	(23,'Inventário livre');

/*!40000 ALTER TABLE `tipos_atividades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_cargas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_cargas`;

CREATE TABLE `tipos_cargas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump de tabela tipos_carretas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_carretas`;

CREATE TABLE `tipos_carretas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump de tabela tipos_containers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_containers`;

CREATE TABLE `tipos_containers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_containers` WRITE;
/*!40000 ALTER TABLE `tipos_containers` DISABLE KEYS */;

INSERT INTO `tipos_containers` (`id`, `descricao`, `sigla`)
VALUES
	(1,'Dry Box','DB'),
	(2,'High Cube','HC'),
	(3,'Graneleiro Dry','GD'),
	(4,'Flat Rack','FR'),
	(5,'Tanque','T'),
	(6,'Ventilado','V'),
	(7,'Open Top','OT'),
	(8,'Plataforma','P'),
	(9,'Reefer','R');

/*!40000 ALTER TABLE `tipos_containers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_containers_movimentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_containers_movimentos`;

CREATE TABLE `tipos_containers_movimentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_containers_movimentos` WRITE;
/*!40000 ALTER TABLE `tipos_containers_movimentos` DISABLE KEYS */;

INSERT INTO `tipos_containers_movimentos` (`id`, `descricao`)
VALUES
	(1,'Cancelamento'),
	(2,'Entrada'),
	(3,'Saida'),
	(4,'Posicionamento'),
	(5,'Faturamento'),
	(6,'Cancelamento'),
	(7,NULL);

/*!40000 ALTER TABLE `tipos_containers_movimentos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_equipamentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_equipamentos`;

CREATE TABLE `tipos_equipamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_equipamentos` WRITE;
/*!40000 ALTER TABLE `tipos_equipamentos` DISABLE KEYS */;

INSERT INTO `tipos_equipamentos` (`id`, `descricao`)
VALUES
	(1,'Transpaleteira'),
	(2,'Transpaleteira elétrica'),
	(3,'Empilhadeira a combustão'),
	(4,'Empilhadeira a gás'),
	(5,'Empilhadeira elétrica'),
	(6,'Trilateral');

/*!40000 ALTER TABLE `tipos_equipamentos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_eventos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_eventos`;

CREATE TABLE `tipos_eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_eventos` WRITE;
/*!40000 ALTER TABLE `tipos_eventos` DISABLE KEYS */;

INSERT INTO `tipos_eventos` (`id`, `ativo`, `descricao`)
VALUES
	(1,1,'Separação'),
	(2,0,'Posicionamento'),
	(3,1,'Saída'),
	(4,0,'Conferência'),
	(5,0,'Posicionamento-PA'),
	(6,0,'Separação-PA'),
	(7,0,'Posicionamento Trilateral'),
	(8,0,'Picking Trilateral');

/*!40000 ALTER TABLE `tipos_eventos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_ocorrencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_ocorrencias`;

CREATE TABLE `tipos_ocorrencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) DEFAULT '1',
  `necessita_atuar` tinyint(1) DEFAULT '0',
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_ocorrencias` WRITE;
/*!40000 ALTER TABLE `tipos_ocorrencias` DISABLE KEYS */;

INSERT INTO `tipos_ocorrencias` (`id`, `ativo`, `necessita_atuar`, `descricao`)
VALUES
	(1,1,0,'Informação'),
	(2,1,1,'Reclamação'),
	(3,1,0,'Sugestão'),
	(4,1,0,'Outro'),
	(5,1,1,'Divergência'),
	(6,1,1,'Avaria'),
	(7,1,1,'Falta'),
	(8,1,1,'Acidente'),
	(9,1,0,'Incidente'),
	(10,1,0,'Desfazer operação'),
	(11,1,0,'Chegada item crítico'),
	(12,1,0,'Falta item crítico'),
	(13,1,0,'Chegada item faltante');

/*!40000 ALTER TABLE `tipos_ocorrencias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_operacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_operacao`;

CREATE TABLE `tipos_operacao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_operacao` WRITE;
/*!40000 ALTER TABLE `tipos_operacao` DISABLE KEYS */;

INSERT INTO `tipos_operacao` (`id`, `descricao`)
VALUES
	(1,'Reservada'),
	(2,'Separada'),
	(3,'Bloqueada'),
	(4,'Saida'),
	(5,'Separada parcial'),
	(6,'Faturada'),
	(7,'Transferencia'),
	(8,'Entrada bloqueada na conferencia'),
	(9,'Entrada de faltante pos conferencia');

/*!40000 ALTER TABLE `tipos_operacao` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_posicoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_posicoes`;

CREATE TABLE `tipos_posicoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `sigla` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_posicoes` WRITE;
/*!40000 ALTER TABLE `tipos_posicoes` DISABLE KEYS */;

INSERT INTO `tipos_posicoes` (`id`, `descricao`, `sigla`)
VALUES
	(1,'Blocado','BL'),
	(2,'Porta-palete','PP'),
	(3,'Drive-in','DI');

/*!40000 ALTER TABLE `tipos_posicoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_programacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_programacao`;

CREATE TABLE `tipos_programacao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) DEFAULT '1',
  `codigo` char(5) DEFAULT NULL,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_programacao` WRITE;
/*!40000 ALTER TABLE `tipos_programacao` DISABLE KEYS */;

INSERT INTO `tipos_programacao` (`id`, `ativo`, `codigo`, `descricao`)
VALUES
	(1,1,'ENT','Entrada'),
	(2,1,'SAI','Saída'),
	(3,0,'SEP-C','Separação com saída'),
	(4,0,'SEP-1','Separação-alternativa'),
	(5,0,'RES','Reserva'),
	(6,1,'INV','Inventário'),
	(7,1,'APAN','Apanha'),
	(8,0,'MKIT','Montagem de Kits'),
	(9,0,'CROSS','Cross docking'),
	(10,0,'TRFM','Transformação'),
	(11,0,'ARRUM','Arrumação'),
	(12,0,'TRFC','Transferência'),
	(13,0,'BLOQ','Bloqueio'),
	(14,0,'ENT-E','Entrada-excedente'),
	(15,0,'PAL','Paletização'),
	(16,0,'PER','Personalização'),
	(17,0,'FILM','Filmagem'),
	(18,1,'RESS','Ressuprimento'),
	(19,0,'ENT-1','Entrada-alternativa-1'),
	(20,0,'ENT-2','Entrada-alternativa-2'),
	(21,0,'ENT-3','Entrada-alternativa-3'),
	(22,1,'SAI-A','Saída-Avaria'),
	(23,0,'E-PFR','Entrada-Fracionada'),
	(24,0,'S-FA','Separação-FA'),
	(25,1,'SEP-S','Separação sem saída'),
	(26,1,'TRP','Transferência de proprietario'),
	(27,0,'E-PEF','Entrada-PE-FR'),
	(28,0,'E-TG','Entrada-TG'),
	(29,1,'DEV','Devolução'),
	(30,0,'INV-L','Inventário geográfico'),
	(31,1,'ENT','Coleta'),
	(32,1,'PRO','Produção'),
	(33,1,'INV-S','Inventario Simplificado');

/*!40000 ALTER TABLE `tipos_programacao` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_programacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_programacoes`;

CREATE TABLE `tipos_programacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idd` bigint unsigned DEFAULT '0',
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_programacoes` WRITE;
/*!40000 ALTER TABLE `tipos_programacoes` DISABLE KEYS */;

INSERT INTO `tipos_programacoes` (`id`, `idd`, `descricao`)
VALUES
	(1,0,'Entrada'),
	(2,0,'Saída'),
	(3,0,'Separação'),
	(4,0,'Separação consolidada'),
	(5,0,'Reserva'),
	(6,0,'Inventário'),
	(7,0,'Apanha'),
	(8,0,'Montagem de kit'),
	(9,0,'Cross docking'),
	(10,0,'Transformação'),
	(11,0,'Arrumação'),
	(12,0,'Transferência');

/*!40000 ALTER TABLE `tipos_programacoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_transformacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_transformacoes`;

CREATE TABLE `tipos_transformacoes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_transformacoes` WRITE;
/*!40000 ALTER TABLE `tipos_transformacoes` DISABLE KEYS */;

INSERT INTO `tipos_transformacoes` (`id`, `descricao`, `ativo`)
VALUES
	(1,'Paletizar',1),
	(2,'Filmar',1),
	(3,'Fumigar',1),
	(4,'Mudar SKU',1);

/*!40000 ALTER TABLE `tipos_transformacoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_umas`;

CREATE TABLE `tipos_umas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  `pode_entrar` tinyint(1) NOT NULL DEFAULT '1',
  `pode_sair` tinyint(1) NOT NULL DEFAULT '1',
  `pode_zerar` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_umas` WRITE;
/*!40000 ALTER TABLE `tipos_umas` DISABLE KEYS */;

INSERT INTO `tipos_umas` (`id`, `descricao`, `pode_entrar`, `pode_sair`, `pode_zerar`)
VALUES
	(1,'Normal',1,1,1),
	(2,'Permanente',1,1,0),
	(3,'Separação',1,1,1),
	(4,'Expedição',1,1,1),
	(5,'Picking',1,1,0),
	(6,'Produção',1,1,1);

/*!40000 ALTER TABLE `tipos_umas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_veiculos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_veiculos`;

CREATE TABLE `tipos_veiculos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `carga` tinyint(1) NOT NULL DEFAULT '1',
  `capacidade_umas` int DEFAULT '0',
  `capacidade_peso` decimal(12,2) NOT NULL DEFAULT '0.00',
  `capacidade_largura` decimal(12,2) NOT NULL DEFAULT '0.00',
  `capacidade_comprimento` decimal(12,2) NOT NULL DEFAULT '0.00',
  `capacidade_altura` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_veiculos` WRITE;
/*!40000 ALTER TABLE `tipos_veiculos` DISABLE KEYS */;

INSERT INTO `tipos_veiculos` (`id`, `descricao`, `carga`, `capacidade_umas`, `capacidade_peso`, `capacidade_largura`, `capacidade_comprimento`, `capacidade_altura`)
VALUES
	(1,'Caminhão',1,0,0.00,0.00,0.00,0.00),
	(2,'Truck',1,0,0.00,0.00,0.00,0.00),
	(3,'Carreta',1,0,0.00,0.00,0.00,0.00),
	(4,'Bitrem',1,0,0.00,0.00,0.00,0.00),
	(5,'Furgão',1,0,0.00,0.00,0.00,0.00),
	(6,'Cegonha',1,0,0.00,0.00,0.00,0.00),
	(7,'Passeio',0,0,0.00,0.00,0.00,0.00);

/*!40000 ALTER TABLE `tipos_veiculos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela tipos_veiculos_marcas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_veiculos_marcas`;

CREATE TABLE `tipos_veiculos_marcas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tipos_veiculos_marcas` WRITE;
/*!40000 ALTER TABLE `tipos_veiculos_marcas` DISABLE KEYS */;

INSERT INTO `tipos_veiculos_marcas` (`id`, `descricao`)
VALUES
	(1,'Lamborguini'),
	(2,'Porche'),
	(3,'Ferrari'),
	(4,'Fiat'),
	(5,'Ford'),
	(6,'GM'),
	(7,'Mercedes'),
	(8,'VW'),
	(9,'GMC'),
	(10,'Agrale'),
	(11,'Citroen'),
	(12,'Peugeot'),
	(13,'Honda'),
	(14,'Hyundai'),
	(15,'BMW'),
	(16,'Volvo'),
	(17,'Mitsubishi'),
	(18,'Troller'),
	(19,'Subaru'),
	(20,'Jeep'),
	(21,'Alfa Romeo');

/*!40000 ALTER TABLE `tipos_veiculos_marcas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela totvs_atualizacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_atualizacao`;

CREATE TABLE `totvs_atualizacao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `LimpaTabelas` AFTER UPDATE ON `totvs_atualizacao` FOR EACH ROW BEGIN
	DELETE FROM totvs_saldo_atual;
	DELETE FROM totvs_op_paletizacao;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump de tabela totvs_divergencia_saldos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_divergencia_saldos`;

CREATE TABLE `totvs_divergencia_saldos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela totvs_estornos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_estornos`;

CREATE TABLE `totvs_estornos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recno` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela totvs_inventario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_inventario`;

CREATE TABLE `totvs_inventario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_sku` varchar(30) NOT NULL DEFAULT '',
  `local` varchar(10) NOT NULL DEFAULT '',
  `lote` varchar(30) NOT NULL DEFAULT '',
  `quantidade` int NOT NULL DEFAULT '0',
  `id_programacao` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela totvs_op_paletizacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_op_paletizacao`;

CREATE TABLE `totvs_op_paletizacao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_itens_skus_intermediario` bigint DEFAULT '0',
  `id_itens_skus_paletizado` bigint DEFAULT '0',
  `data` date DEFAULT NULL,
  `op` varchar(20) DEFAULT NULL,
  `quantidade` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela totvs_produtos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_produtos`;

CREATE TABLE `totvs_produtos` (
  `codigo_paletizado` varchar(30) NOT NULL DEFAULT '',
  `codigo_intermediario` varchar(30) NOT NULL DEFAULT '',
  KEY `PALETIZADO` (`codigo_paletizado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela totvs_saldo_atual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_saldo_atual`;

CREATE TABLE `totvs_saldo_atual` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT '0000-00-00',
  `data_validade` date DEFAULT '0000-00-00',
  `data_fabricacao` date DEFAULT '0000-00-00',
  `codigo_sku` varchar(30) DEFAULT '',
  `id_itens_skus` bigint DEFAULT '0',
  `local` varchar(10) DEFAULT '',
  `lote` varchar(30) DEFAULT '',
  `quantidade` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SKU` (`id_itens_skus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela totvs_webservice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `totvs_webservice`;

CREATE TABLE `totvs_webservice` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint NOT NULL DEFAULT '0',
  `id_programacao` bigint NOT NULL DEFAULT '0',
  `id_umas` bigint NOT NULL DEFAULT '0',
  `data` datetime DEFAULT '0000-00-00 00:00:00',
  `data_envio` datetime DEFAULT '0000-00-00 00:00:00',
  `enviado` tinyint(1) NOT NULL DEFAULT '0',
  `erro` tinyint(1) NOT NULL DEFAULT '0',
  `nome` varchar(60) DEFAULT NULL,
  `metodo` varchar(60) DEFAULT NULL,
  `conteudo` text,
  `resposta` text,
  `backup` text,
  `com_problema` int NOT NULL DEFAULT '0',
  `id_itens_skus` bigint NOT NULL DEFAULT '0',
  `codigo_sku_saida` varchar(20) NOT NULL DEFAULT '',
  `codigo_sku_entrada` varchar(20) NOT NULL DEFAULT '',
  `lote` varchar(20) NOT NULL DEFAULT '',
  `quantidade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `saida` varchar(20) NOT NULL DEFAULT '',
  `entrada` varchar(20) NOT NULL DEFAULT '',
  `tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas`;

CREATE TABLE `umas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes_posicionar` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus_associar` bigint DEFAULT '0',
  `id_tipos_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_contagens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_conferiu` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_conferiu_saida` bigint DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_ativacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_desativacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_conferencia` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_conferencia_saida` datetime DEFAULT '0000-00-00 00:00:00',
  `data_paletizacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_filmagem` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fumigacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_saida` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `posicionada` tinyint(1) DEFAULT '0',
  `conferida` tinyint(1) NOT NULL DEFAULT '0',
  `conferida_saida` tinyint DEFAULT '0',
  `liberada` tinyint(1) DEFAULT '1',
  `paletizada` tinyint(1) DEFAULT '0',
  `filmada` tinyint(1) DEFAULT '0',
  `fumigada` tinyint(1) DEFAULT '0',
  `indivisivel` tinyint(1) DEFAULT '0',
  `imobilizada` tinyint(1) DEFAULT '0',
  `produzida` tinyint(1) DEFAULT '0',
  `incompleta` tinyint(1) DEFAULT '0',
  `codigo_barras` varchar(20) NOT NULL DEFAULT '',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `situacao` varchar(20) NOT NULL DEFAULT '',
  `complemento` text,
  `ordem` int NOT NULL DEFAULT '0',
  `ordem_movimentacao` int DEFAULT '0',
  `saida_avulsa` tinyint(1) DEFAULT '0',
  `id_pessoas_posicionou` bigint DEFAULT '0',
  `observacoes` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_umas_cod` (`codigo_barras`),
  KEY `IX_umas_prog` (`id_programacao`),
  KEY `ATIVO` (`ativo`),
  KEY `POSICAO` (`id_posicoes`),
  KEY `POSICIONAR` (`id_posicoes_posicionar`),
  KEY `IMOBILIZADA` (`imobilizada`),
  KEY `CODIGO_EXTERNO` (`codigo_externo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `umas` WRITE;
/*!40000 ALTER TABLE `umas` DISABLE KEYS */;

INSERT INTO `umas` (`id`, `id_armazens`, `id_posicoes`, `id_posicoes_posicionar`, `id_programacao`, `id_programacao_itens`, `id_notas`, `id_itens_skus_associar`, `id_tipos_umas`, `id_contagens`, `id_pessoas_conferiu`, `id_pessoas_conferiu_saida`, `data`, `data_ativacao`, `data_desativacao`, `data_conferencia`, `data_conferencia_saida`, `data_paletizacao`, `data_filmagem`, `data_fumigacao`, `data_saida`, `ativo`, `posicionada`, `conferida`, `conferida_saida`, `liberada`, `paletizada`, `filmada`, `fumigada`, `indivisivel`, `imobilizada`, `produzida`, `incompleta`, `codigo_barras`, `codigo_externo`, `situacao`, `complemento`, `ordem`, `ordem_movimentacao`, `saida_avulsa`, `id_pessoas_posicionou`, `observacoes`)
VALUES
	(2,0,0,0,0,0,0,0,0,0,0,0,'2022-07-07 08:58:28','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,0,1,0,0,0,0,0,0,0,'UMA000000000000002','','',NULL,0,0,0,0,NULL),
	(3,0,0,0,0,0,0,0,0,0,0,0,'2022-07-07 08:59:28','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,0,1,0,0,0,0,0,0,0,'UMA000000000000003','','',NULL,0,0,0,0,NULL);

/*!40000 ALTER TABLE `umas` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `defineCodigoBarras` BEFORE INSERT ON `umas` FOR EACH ROW BEGIN
IF NEW.codigo_barras='' THEN
	SET @novoCodigo =
		(
			SELECT CONCAT('UMA',
				LPAD
				(
					(SELECT MAX(id)+1 FROM umas),
					(SELECT CAST(valor AS UNSIGNED) FROM parametros WHERE chave='DIGITOS_UMA'),
					'0'
				)
			)
		);
	SET NEW.codigo_barras=@novoCodigo;
END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `atualizaPosicao` AFTER UPDATE ON `umas` FOR EACH ROW BEGIN
	IF OLD.id_posicoes<>NEW.id_posicoes THEN
		UPDATE posicoes P SET quantidade_posicionada=(SELECT count(id) ttl FROM umas WHERE ativo=1 AND id_posicoes=OLD.id_posicoes) WHERE P.id=OLD.id_posicoes;
	END IF;
	UPDATE posicoes P SET quantidade_posicionada=(SELECT count(id) ttl FROM umas WHERE ativo=1 AND id_posicoes=NEW.id_posicoes) WHERE P.id=NEW.id_posicoes;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump de tabela umas_conferencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_conferencias`;

CREATE TABLE `umas_conferencias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_itens_skus` bigint DEFAULT '0',
  `lote` varchar(20) DEFAULT NULL,
  `data_fabricacao` date DEFAULT '0000-00-00',
  `data_validade` date DEFAULT '0000-00-00',
  `data_conferencia` datetime DEFAULT '0000-00-00 00:00:00',
  `conferida` tinyint(1) DEFAULT '0',
  `saida` tinyint(1) DEFAULT '0',
  `entrada` tinyint(1) DEFAULT '0',
  `quantidade` decimal(20,6) DEFAULT '0.000000',
  `id_umas` bigint DEFAULT '0',
  `id_pessoas_conferiu` bigint DEFAULT '0',
  `id_programacao` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_itens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_itens`;

CREATE TABLE `umas_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas_origem` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_armazens` bigint unsigned NOT NULL DEFAULT '0',
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens` bigint unsigned NOT NULL DEFAULT '0',
  `id_notas_itens_saida` bigint DEFAULT '0',
  `id_notas_programacao` bigint DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_operacao` bigint DEFAULT '0',
  `id_areas_direcionar` bigint DEFAULT '0',
  `codigo_externo` varchar(40) NOT NULL DEFAULT '',
  `numero_cliente` varchar(60) DEFAULT NULL,
  `tipo` char(1) NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `faturar` tinyint(1) NOT NULL DEFAULT '0',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `avariada` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  `entrada` tinyint(1) DEFAULT '0',
  `saida` tinyint(1) DEFAULT '0',
  `data` datetime NOT NULL,
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data_validade_antiga` date NOT NULL DEFAULT '0000-00-00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `peso_liquido` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `peso_bruto` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `m2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `m3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `temperatura` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `quantidade_temp` decimal(20,6) DEFAULT NULL,
  `lote` varchar(30) NOT NULL,
  `serial` varchar(40) NOT NULL DEFAULT '',
  `inventario` tinyint unsigned DEFAULT '0',
  `observacoes` varchar(60) DEFAULT NULL,
  `ajuste_saldo` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_umas` (`id_umas`),
  KEY `IX_programacao` (`id_programacao`),
  KEY `IX_armazens` (`id_armazens`),
  KEY `IX_veiculos_acessos` (`id_veiculos_acessos`),
  KEY `IX_notas_itens` (`id_notas_itens`),
  KEY `IX_itens_skus` (`id_itens_skus`),
  KEY `CODIGO_EXTERNO` (`codigo_externo`),
  KEY `PROPRIETARIO` (`id_pessoas_proprietario`),
  KEY `CANCELADA` (`cancelada`),
  KEY `FLAGS` (`reservada`,`separada`,`avariada`,`bloqueada`),
  KEY `DATA` (`data`),
  KEY `DATA_VALIDADE` (`data_validade`),
  KEY `LOTE` (`lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `seZerarSaldoAoInserir` AFTER INSERT ON `umas_itens` FOR EACH ROW BEGIN

	IF (SELECT SUM(quantidade) FROM umas_itens WHERE id_umas=NEW.id_umas AND cancelada=0) = 0 THEN
		UPDATE umas SET data_desativacao=NOW(), ativo=0, posicionada=0 WHERE id=NEW.id_umas;
	ELSE
		UPDATE umas SET data_desativacao='0000-00-00 00:00:00',ativo=1, posicionada=1 WHERE id=NEW.id_umas;
	END IF;

	IF(SELECT SUM(quantidade) FROM umas_itens WHERE NEW.cancelada=0 AND id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada) = 0 THEN
		DELETE FROM umas_saldos WHERE id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada;
	ELSE
		IF (SELECT COUNT(id) qtd FROM umas_saldos WHERE id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada)>0 THEN
			UPDATE umas_saldos SET quantidade=(SELECT SUM(quantidade) FROM umas_itens WHERE cancelada=0 AND id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada) WHERE id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada;
		ELSE
			INSERT INTO umas_saldos (id_umas, id_itens_skus, lote, data_fabricacao, data_validade, quantidade, reservada, separada, avariada, bloqueada) VALUES (NEW.id_umas, NEW.id_itens_skus, NEW.lote, NEW.data_fabricacao, NEW.data_validade, NEW.quantidade, NEW.reservada, NEW.separada, NEW.avariada, NEW.bloqueada);
		END IF;
	END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `seZerarSaldoAoAlterar` AFTER UPDATE ON `umas_itens` FOR EACH ROW BEGIN

	IF (SELECT IFNULL(SUM(quantidade),0) FROM umas_itens WHERE id_umas=NEW.id_umas AND cancelada=0) <= 0 THEN
		UPDATE umas SET data_desativacao=NOW(), ativo=0, posicionada=0 WHERE id=NEW.id_umas;
	ELSE
		UPDATE umas SET data_desativacao='0000-00-00 00:00:00',ativo=1, posicionada=1 WHERE id=NEW.id_umas;
	END IF;


	DELETE FROM umas_saldos WHERE id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada;
	DELETE FROM umas_saldos WHERE id_umas=OLD.id_umas AND id_itens_skus=OLD.id_itens_skus AND lote=OLD.lote AND data_fabricacao=OLD.data_fabricacao AND data_validade=OLD.data_validade AND avariada=OLD.avariada AND bloqueada=OLD.bloqueada AND reservada=OLD.reservada AND separada=OLD.separada;

	SET @saldoOLD=(SELECT SUM(quantidade) quantidade FROM umas_itens WHERE cancelada=0 AND id_umas=OLD.id_umas AND id_itens_skus=OLD.id_itens_skus AND lote=OLD.lote AND data_fabricacao=OLD.data_fabricacao AND data_validade=OLD.data_validade AND avariada=OLD.avariada AND bloqueada=OLD.bloqueada AND reservada=OLD.reservada AND separada=OLD.separada);
	IF @saldoOLD>0 THEN
		INSERT INTO umas_saldos (id_umas, id_itens_skus, lote, data_fabricacao, data_validade, quantidade, reservada, separada, avariada, bloqueada) VALUES (OLD.id_umas, OLD.id_itens_skus, OLD.lote, OLD.data_fabricacao, OLD.data_validade, @saldoOLD, OLD.reservada, OLD.separada, OLD.avariada, OLD.bloqueada);
	END IF;

	IF OLD.id_umas!=NEW.id_umas OR OLD.id_itens_skus!=NEW.id_itens_skus OR OLD.lote!=NEW.lote OR OLD.data_fabricacao!=NEW.data_fabricacao OR OLD.data_validade!=NEW.data_validade OR OLD.avariada!=NEW.avariada OR OLD.bloqueada!=NEW.bloqueada OR OLD.reservada!=NEW.reservada OR OLD.separada!=NEW.separada THEN
		SET @saldoNEW=(SELECT SUM(quantidade) quantidade FROM umas_itens WHERE cancelada=0 AND id_umas=NEW.id_umas AND id_itens_skus=NEW.id_itens_skus AND lote=NEW.lote AND data_fabricacao=NEW.data_fabricacao AND data_validade=NEW.data_validade AND avariada=NEW.avariada AND bloqueada=NEW.bloqueada AND reservada=NEW.reservada AND separada=NEW.separada);
		IF @saldoNEW>0 THEN
			INSERT INTO umas_saldos (id_umas, id_itens_skus, lote, data_fabricacao, data_validade, quantidade, reservada, separada, avariada, bloqueada) VALUES (NEW.id_umas, NEW.id_itens_skus, NEW.lote, NEW.data_fabricacao, NEW.data_validade, @saldoNEW, NEW.reservada, NEW.separada, NEW.avariada, NEW.bloqueada);
		END IF;
	END IF;
END */;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `seZerarSaldoAoRemover` AFTER DELETE ON `umas_itens` FOR EACH ROW BEGIN

	UPDATE umas SET data_desativacao=IF((SELECT SUM(quantidade) FROM umas_itens WHERE id_umas=OLD.id_umas AND cancelada=0) = 0, NOW(), data_desativacao),ativo=IF((SELECT SUM(quantidade) FROM umas_itens WHERE id_umas=OLD.id_umas AND cancelada=0) = 0, 0, 1) WHERE id=OLD.id_umas;
	DELETE FROM umas_saldos WHERE id_umas=OLD.id_umas AND id_itens_skus=OLD.id_itens_skus AND lote=OLD.lote AND data_fabricacao=OLD.data_fabricacao AND data_validade=OLD.data_validade AND avariada=OLD.avariada AND bloqueada=OLD.bloqueada AND reservada=OLD.reservada AND separada=OLD.separada;
	SET @saldoOLD=(SELECT SUM(quantidade) quantidade FROM umas_itens WHERE cancelada=0 AND id_umas=OLD.id_umas AND id_itens_skus=OLD.id_itens_skus AND lote=OLD.lote AND data_fabricacao=OLD.data_fabricacao AND data_validade=OLD.data_validade AND avariada=OLD.avariada AND bloqueada=OLD.bloqueada AND reservada=OLD.reservada AND separada=OLD.separada);
	IF @saldoOLD>0 THEN
		INSERT INTO umas_saldos (id_umas, id_itens_skus, lote, data_fabricacao, data_validade, quantidade, reservada, separada, avariada, bloqueada) VALUES (OLD.id_umas, OLD.id_itens_skus, OLD.lote, OLD.data_fabricacao, OLD.data_validade, @saldoOLD, OLD.reservada, OLD.separada, OLD.avariada, OLD.bloqueada);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump de tabela umas_itens_tipos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_itens_tipos`;

CREATE TABLE `umas_itens_tipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT '',
  `cliente_visualiza` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_movimentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_movimentos`;

CREATE TABLE `umas_movimentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_umas_para` bigint unsigned NOT NULL DEFAULT '0',
  `id_posicoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `tipo` char(1) NOT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `descricao` varchar(60) DEFAULT NULL,
  `lote` varchar(60) DEFAULT NULL,
  `lote_para` varchar(60) DEFAULT NULL,
  `data_validade` date DEFAULT '0000-00-00',
  `data_fabricacao` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`),
  KEY `DATA` (`data`),
  KEY `TIPO` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `umas_movimentos` WRITE;
/*!40000 ALTER TABLE `umas_movimentos` DISABLE KEYS */;

INSERT INTO `umas_movimentos` (`id`, `id_pessoas`, `id_umas`, `id_umas_para`, `id_posicoes`, `id_pessoas_proprietario`, `tipo`, `data`, `descricao`, `lote`, `lote_para`, `data_validade`, `data_fabricacao`)
VALUES
	(2,1,2,0,0,0,'C','2022-07-07 08:58:28','Criada',NULL,NULL,'0000-00-00','0000-00-00'),
	(3,1,3,0,0,0,'C','2022-07-07 08:59:28','Criada',NULL,NULL,'0000-00-00','0000-00-00');

/*!40000 ALTER TABLE `umas_movimentos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela umas_movimentos_saldos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_movimentos_saldos`;

CREATE TABLE `umas_movimentos_saldos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_umas` bigint DEFAULT '0',
  `id_umas_movimentos` bigint DEFAULT '0',
  `id_itens_skus` bigint DEFAULT '0',
  `id_pessoas_cadastrou` bigint DEFAULT '0',
  `id_pessoas_atualizou` bigint DEFAULT '0',
  `lote` varchar(50) DEFAULT '',
  `data_validade` date DEFAULT '0000-00-00',
  `data_fabricacao` date DEFAULT '0000-00-00',
  `data_cadastro` datetime DEFAULT '0000-00-00 00:00:00',
  `data_atualizacao` datetime DEFAULT '0000-00-00 00:00:00',
  `saldo` decimal(20,8) DEFAULT '0.00000000',
  `tipo` char(1) DEFAULT '',
  `id_posicoes` bigint DEFAULT '0',
  `id_posicoes_posicionar` bigint DEFAULT '0',
  `id_umas_origem` bigint DEFAULT '0',
  `id_armazens` bigint DEFAULT '0',
  `id_programacao` varchar(45) DEFAULT '0',
  `reservada` tinyint(1) DEFAULT '0',
  `separada` tinyint(1) DEFAULT '0',
  `avariada` tinyint(1) DEFAULT '0',
  `bloqueada` tinyint(1) DEFAULT '0',
  `valor` decimal(20,6) DEFAULT '0.000000',
  `id_notas_itens` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_posicionamentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_posicionamentos`;

CREATE TABLE `umas_posicionamentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_umas` bigint DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id_pessoas` bigint DEFAULT '0',
  `id_posicoes` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_pulmao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_pulmao`;

CREATE TABLE `umas_pulmao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_proprietario` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `lote` varchar(30) NOT NULL DEFAULT '',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_saldos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_saldos`;

CREATE TABLE `umas_saldos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_umas` bigint unsigned NOT NULL DEFAULT '0',
  `id_itens_skus` bigint unsigned NOT NULL DEFAULT '0',
  `lote` varchar(30) NOT NULL DEFAULT '',
  `data_fabricacao` date NOT NULL DEFAULT '0000-00-00',
  `data_validade` date NOT NULL DEFAULT '0000-00-00',
  `quantidade` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reservada` tinyint(1) NOT NULL DEFAULT '0',
  `separada` tinyint(1) NOT NULL DEFAULT '0',
  `avariada` tinyint(1) NOT NULL DEFAULT '0',
  `bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`),
  KEY `SKU` (`id_itens_skus`),
  KEY `DATA_VALIDADE` (`data_validade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_transformacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_transformacoes`;

CREATE TABLE `umas_transformacoes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_tipos_transformacoes` bigint DEFAULT '0',
  `id_umas_de` bigint DEFAULT '0',
  `id_umas_para` bigint DEFAULT '0',
  `id_itens_skus_de` bigint DEFAULT '0',
  `id_itens_skus_para` bigint DEFAULT '0',
  `id_pessoas_iniciou` bigint DEFAULT '0',
  `id_pessoas_finalizou` bigint DEFAULT '0',
  `data_iniciou` datetime DEFAULT '0000-00-00 00:00:00',
  `data_finalizou` datetime DEFAULT '0000-00-00 00:00:00',
  `iniciada` tinyint(1) DEFAULT '0',
  `finalizada` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas_de`),
  KEY `UMA_PARA` (`id_umas_para`),
  KEY `SKU_DE` (`id_itens_skus_de`),
  KEY `SKU_PARA` (`id_itens_skus_para`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela umas_verificar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umas_verificar`;

CREATE TABLE `umas_verificar` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoas` bigint NOT NULL DEFAULT '0',
  `id_umas` bigint NOT NULL DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `observacoes` text,
  `verificado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `UMA` (`id_umas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela unidades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unidades`;

CREATE TABLE `unidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `sigla` char(3) NOT NULL DEFAULT '',
  `peso_liquido` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `peso_bruto` decimal(10,4) DEFAULT '0.0000',
  `largura` decimal(10,4) DEFAULT '0.0000',
  `altura` decimal(10,4) DEFAULT '0.0000',
  `comprimento` decimal(10,4) DEFAULT '0.0000',
  `palete_lastro` int DEFAULT '0',
  `palete_altura` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;

INSERT INTO `unidades` (`id`, `descricao`, `sigla`, `peso_liquido`, `peso_bruto`, `largura`, `altura`, `comprimento`, `palete_lastro`, `palete_altura`)
VALUES
	(59,'SACO 15 KG','15K',15.0000,15.0000,0.1500,0.7400,0.4000,5,6),
	(60,'SACO 20 KG','20K',20.0000,20.0000,0.0016,0.0077,0.0043,4,6),
	(61,'SACO 10 KG','S10',10.1000,10.1000,0.1000,0.6600,0.3600,5,10),
	(63,'FARDO 1 KG','F1',1.0000,1.0000,0.0000,0.0000,0.0000,5,6),
	(64,'FARDO 3 KG','F3',3.0000,3.0000,0.0000,0.0000,0.0000,0,0),
	(65,'SACO 12 KG','S12',12.0000,12.0000,0.1300,0.6700,0.3800,5,8),
	(66,'FARDO 2KG','F2',2.0000,2.0000,0.0000,0.0000,0.0000,0,0),
	(67,'FARDO 2,5','F25',2.5000,2.5000,0.0000,0.0000,0.0000,0,0),
	(68,'UN','UN',0.0000,0.0000,0.0000,0.0000,0.0000,0,0),
	(69,'CX','CX',0.0000,0.0000,0.0000,0.0000,0.0000,0,0);

/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela unidades_faturamento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unidades_faturamento`;

CREATE TABLE `unidades_faturamento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `unidades_faturamento` WRITE;
/*!40000 ALTER TABLE `unidades_faturamento` DISABLE KEYS */;

INSERT INTO `unidades_faturamento` (`id`, `descricao`)
VALUES
	(1,'Unidade'),
	(2,'UMA/Palete'),
	(3,'Peso bruto'),
	(4,'Peso líquido'),
	(5,'M2'),
	(6,'M3'),
	(7,'Mês'),
	(8,'Dia'),
	(9,'Hora'),
	(10,'Valor da mercadoria');

/*!40000 ALTER TABLE `unidades_faturamento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de tabela veiculos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `veiculos`;

CREATE TABLE `veiculos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_armazens` bigint unsigned NOT NULL,
  `id_tipos_veiculos` bigint unsigned NOT NULL,
  `id_tipos_veiculos_marcas` bigint unsigned NOT NULL,
  `id_enderecos_cidades` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `placa` char(7) NOT NULL,
  `placa1` char(7) DEFAULT NULL,
  `placa2` char(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TIPO` (`id_tipos_veiculos`),
  KEY `MARCA` (`id_tipos_veiculos_marcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela veiculos_acessos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `veiculos_acessos`;

CREATE TABLE `veiculos_acessos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_veiculos` bigint unsigned NOT NULL,
  `id_armazens` bigint DEFAULT '0',
  `id_pessoas_transportadora` bigint unsigned NOT NULL,
  `id_pessoas_cliente` bigint unsigned NOT NULL,
  `id_pessoas_autorizou_entrada` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_autorizou_saida` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_motorista` bigint unsigned NOT NULL DEFAULT '0',
  `id_tipos_operacoes` bigint unsigned NOT NULL DEFAULT '0',
  `id_crachas` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_alterou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_cancelou` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_entrada` bigint DEFAULT NULL,
  `id_pessoas_saida` bigint DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_cancelamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_chegada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_autorizacao_entrada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_entrada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_inicio_operacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_final_operacao` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_autorizacao_saida` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_saida` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `motivo` varchar(60) DEFAULT NULL,
  `peso_entrada` decimal(20,8) DEFAULT '0.00000000',
  `peso_saida` decimal(20,8) DEFAULT '0.00000000',
  `lacre_entrada` varchar(45) NOT NULL,
  `lacre_saida` varchar(45) NOT NULL,
  `observacoes` text,
  `motivo_cancelamento` varchar(50) DEFAULT NULL,
  `placa_adicional` char(23) DEFAULT NULL,
  `placa_adicional2` char(7) DEFAULT NULL,
  `container_1` char(11) DEFAULT NULL,
  `container_2` char(11) DEFAULT NULL,
  `transporte_tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `VEICULO` (`id_veiculos`),
  KEY `CLIENTE` (`id_pessoas_cliente`),
  KEY `DATA_CHEGADA` (`data_chegada`),
  KEY `DATA_AUT_ENTRADA` (`data_autorizacao_entrada`),
  KEY `DATA_ENTRADA` (`data_entrada`),
  KEY `DATA_SAIDA` (`data_saida`),
  KEY `DATA_CANCELAMENTO` (`data_cancelamento`),
  KEY `ARMAZEM` (`id_armazens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela veiculos_acessos_notas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `veiculos_acessos_notas`;

CREATE TABLE `veiculos_acessos_notas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_veiculos_acessos` bigint DEFAULT '0',
  `numero` varchar(20) DEFAULT NULL,
  `peso` decimal(20,8) DEFAULT '0.00000000',
  `volume` int DEFAULT '0',
  `especie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela veiculos_acessos_programacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `veiculos_acessos_programacoes`;

CREATE TABLE `veiculos_acessos_programacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_veiculos_acessos` bigint unsigned NOT NULL DEFAULT '0',
  `id_programacao` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `programacao` (`id_programacao`),
  KEY `id_veiculos_acessos` (`id_veiculos_acessos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela veiculos_ocorrencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `veiculos_ocorrencias`;

CREATE TABLE `veiculos_ocorrencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_veiculos` bigint unsigned NOT NULL DEFAULT '0',
  `id_pessoas_criou` bigint unsigned NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `veiculo` (`id_veiculos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump de tabela winthor_motivos_avarias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `winthor_motivos_avarias`;

CREATE TABLE `winthor_motivos_avarias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump da vista gfw_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gfw_users`; DROP VIEW IF EXISTS `gfw_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gfw_users`
AS SELECT
   `pessoas`.`id` AS `id`,0 AS `idd`,if((`pessoas`.`situacao` <> 'Inativo'),1,0) AS `active`,1 AS `app_active`,32 AS `id_countries`,
   `pessoas`.`apelido` AS `nickname`,
   `pessoas`.`nome` AS `name`,
   `pessoas`.`email` AS `email`,
   `pessoas`.`telefone` AS `phone`,if((`pessoas`.`tipo` = 'F'),1,0) AS `gender`,
   `pessoas`.`senha` AS `password`,'' AS `keycode`,'0000-00-00' AS `date_birth`,
   `pessoas`.`data_cadastro` AS `date_signon`,
   `pessoas`.`data_cadastro` AS `date_activation`,
   `pessoas`.`data_ultimo_acesso` AS `date_lastuse`,
   `pessoas`.`data_ultimo_acesso` AS `date_lastchange`,
   `pessoas`.`ultimo_ip` AS `last_ip`,if((`pessoas`.`id` = 1),1,0) AS `admin`,'' AS `signup_method`,if(((`pessoas`.`funcionario` = 1) or (`pessoas`.`cliente` = 1)),1,0) AS `user`,
   `pessoas`.`funcionario` AS `employee`,if((`pessoas`.`id` = 2),1,0) AS `employer`,
   `pessoas`.`cliente` AS `client`,
   `pessoas`.`fornecedor` AS `partner`,'' AS `address`,'' AS `neighborhood`,'' AS `complement`,'' AS `number`,'' AS `city`,'' AS `cep`,'' AS `state`,'' AS `facebook`,'' AS `twitter`,'' AS `localization`,
   `pessoas`.`tema` AS `theme`,
   `pessoas`.`fonte_padrao` AS `bodyfont`,
   `pessoas`.`fonte_titulos` AS `headersfont`
FROM `pessoas`;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
