-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Maio-2023 às 02:06
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_redacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `email` varchar(45) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome_completo` varchar(70) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`email`, `senha`, `nome_completo`) VALUES
('prof@adm.com', 'tamires', 'Tamires');

-- --------------------------------------------------------

--
-- Estrutura da tabela `biografia`
--

CREATE TABLE `biografia` (
  `id_bio` int(11) NOT NULL,
  `nome_monitor` varchar(70) NOT NULL,
  `bio` text NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `biografia`
--

INSERT INTO `biografia` (`id_bio`, `nome_monitor`, `bio`, `foto`) VALUES
(3, 'Pessoa', 'Ele Ã© uma Ã³tima pessoa', 'Koala.jpg'),
(4, 'Yago', 'RedaÃ§Ã£o Ã© o ato de produzir um determinado texto escrito. Ela pode ser dividida em quatro tipos: dissertativa, descritiva, narrativa e informativa. O ato de escrever Ã© uma atividade cotidiana, desde um simples bilhete a uma prova de concurso. A redaÃ§Ã£o Ã© o ato de escrever, isto Ã©, produzir um texto escrito.', 'Lighthouse.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `monitor`
--

CREATE TABLE `monitor` (
  `email` varchar(45) NOT NULL,
  `senha_monitor` varchar(20) NOT NULL,
  `nome_completo` varchar(70) CHARACTER SET utf8 NOT NULL,
  `email_administrador` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `monitor`
--

INSERT INTO `monitor` (`email`, `senha_monitor`, `nome_completo`, `email_administrador`) VALUES
('leonce@20', 'leo', 'Leocion', 'prof@adm.com'),
('luigi@monitor', 'luigi', 'Luigi', 'prof@adm.com'),
('luigi@monitor.com', 'luigi', 'Luigi', 'prof@adm.com'),
('mario@monitor.com', 'mario', 'Mario', 'prof@adm.com'),
('ney@g', '1234', 'neymar Junior', 'prof@adm.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `redacoes`
--

CREATE TABLE `redacoes` (
  `id_redacao` int(11) NOT NULL,
  `tema` longtext CHARACTER SET utf8,
  `autor` longtext CHARACTER SET utf8,
  `nota` varchar(11) DEFAULT NULL,
  `redacao` text CHARACTER SET utf8,
  `comentarios` longtext CHARACTER SET utf8
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `redacoes`
--

INSERT INTO `redacoes` (`id_redacao`, `tema`, `autor`, `nota`, `redacao`, `comentarios`) VALUES
(24, 'kkkkl', 'lll', 'lll', '<p style=\"text-align: justify;\">Para o filÃ³sofo escocÃªs David Hume, a principal caracterÃ­stica que \r\ndifere o ser humano dos outros animais Ã© o poder de seu pensamento, \r\nhabilidade que o permite ver aquilo que nunca foi visto e ouvir aquilo \r\nque nunca foi ouvido. Sob essa Ã³tica, vÃª-se que o cinema representa a \r\ncapacidade de transpor para a tela as ideias e os pensamentos presentes \r\nno intelecto das pessoas, de modo a possibilitar a criaÃ§Ã£o de novos \r\nuniversos e, justamente por esse potencial cognitivo, ele Ã© muito \r\nrelevante. Ã‰ prudente apontar, diante disso, que a arte cinematogrÃ¡fica \r\ndeve ser democratizada, em especial no Brasil â€“ paÃ­s rico em expressÃµes \r\nculturais que podem dialogar com esse modelo artÃ­stico â€“, por razÃµes que\r\n dizem respeito tanto Ã  sociedade quanto Ã s leis.</p>', 'lcllclclcl'),
(25, ',', ',', ',', '<p style=\"text-align: justify;\">Norberto Bobbio, cientista polÃ­tico italiano, afirma que a democracia\r\n Ã© um processo que tem, em seu cerne, o objetivo de garantia a \r\nrepresentatividade polÃ­tica de todas as pessoas. Para que o mecanismo \r\ndemocrÃ¡tico funcione, entÃ£o, Ã© fundamental apresentar uma rede estatal \r\nque dÃª acesso a diversos recursos, como alimentaÃ§Ã£o, moradia, educaÃ§Ã£o, \r\nseguranÃ§a, saÃºde e participaÃ§Ã£o eleitoral. Contudo, muitos brasileiros, \r\npor nÃ£o terem uma certidÃ£o de nascimento, sÃ£o privados desses direitos \r\nbÃ¡sicos e tÃªm seus prÃ³prios papÃ©is de cidadÃ£os invisibilizados. Logo, \r\ndeve-se discutir as raÃ­zes histÃ³ricas desse problema e as suas \r\nconsequÃªncias nocivas.</p><p style=\"text-align: justify;\">Primeiramente, vÃª-se que o apagamento \r\nsocial gerado pela falta de registro civil apresenta suas origens no \r\npassado. Para o sociÃ³logo Karl Marx, as desigualdades sÃ£o geradas por \r\ncondiÃ§Ãµes econÃ´micas anteriores ao nascimento de cada ser, de forma que,\r\n infelizmente, nem todos recebam as mesmas oportunidades financeiras e \r\nsociais ao longo da vida. Sob esse viÃ©s, o materialismo histÃ³rico de \r\nMarx Ã© vÃ¡lido para analisar o drama dos que vivem sem certificado de \r\nnascimento no Brasil, pois Ã© provÃ¡vel que eles pertenÃ§am a linhagens \r\nfamiliares que tambÃ©m nÃ£o tiveram acesso ao registro. Assim, a \r\ndesigualdade social continua sendo perpetuada, afetando grupos que jÃ¡ \r\nforam profundamente atingidos pelas raÃ­zes coloniais e patriarcais da \r\nnaÃ§Ã£o. Dessa forma, Ã© essencial que o governo quebre esse ciclo que \r\nexclui, sobretudo, pobres, mulheres, indÃ­genas e pretos.</p><p style=\"text-align: justify;\">AlÃ©m \r\ndisso, nota-se que esse processo injusto cria chagas profundas na \r\ndemocracia nacional. No livro â€œVidas Secasâ€, de Graciliano Ramos, Ã© \r\napresentada a histÃ³ria de uma famÃ­lia sertaneja que luta para sobreviver\r\n sem apoio estatal. Nesse contexto, os personagens Fabiano e SinhÃ¡ \r\nVitÃ³ria tÃªm dois filhos que nÃ£o possuem certidÃ£o de nascimento. Por \r\nconta dessa situaÃ§Ã£o de registro irregular, os dois meninos sequer \r\napresentam nomes, o que Ã© impensÃ¡vel na sociedade contemporÃ¢nea, uma vez\r\n que o nome de um indivÃ­duo faz parte da construÃ§Ã£o integral da sua \r\nidentidade. Ademais, as crianÃ§as retratadas na obra sÃ£o semelhantes a \r\nmuitas outras do Brasil que nÃ£o usufruem de polÃ­ticas pÃºblicas da \r\ninfÃ¢ncia e da adolescÃªncia devido Ã  falta de documentos, o que precisa \r\nser modificado urgentemente para que se estabeleÃ§a uma democracia \r\nrealmente participativa tal qual aquela prevista por Bobbio.</p><p style=\"text-align: justify;\">Portanto,\r\n o registro civil deve ser incentivado de maneira mais efetiva no paÃ­s. O\r\n Estado criarÃ¡ um mutirÃ£o nacional intitulado â€œMeu Registro, Minha \r\nIdentidadeâ€. Esse projeto funcionarÃ¡ por meio da uniÃ£o entre movimentos \r\nsociais, comunidades locais e Ã³rgÃ£os governamentais municipais, \r\nestaduais e federais, visto que Ã© necessÃ¡ria uma aÃ§Ã£o coletiva visando a\r\n consolidaÃ§Ã£o da cidadania brasileira. Com o trabalho desses agentes, \r\nserÃ£o enviados profissionais a todas as cidades em busca de pessoas que,\r\n finalmente, terÃ£o suas certidÃµes de nascimento confeccionadas, alÃ©m de \r\nreceberem acompanhamento e incentivo para a realizaÃ§Ã£o de cadastro em \r\noutros serviÃ§os importantes do sistema nacional. Por conseguinte, o \r\nBrasil estarÃ¡ agindo ativamente para reparar suas injustiÃ§as histÃ³ricas e\r\n para solidificar sua democracia, de maneira que os seus cidadÃ£os sejam \r\nvistos igualmente.</p>', 'lllll'),
(23, 'DemocratizaÃ§Ã£o do acesso ao cinema no Brasil', 'Gabriel Melo Caldas Nogueira', '1000', '<p style=\"text-align: justify;\">Para o filÃ³sofo escocÃªs David Hume, a principal caracterÃ­stica que \r\ndifere o ser humano dos outros animais Ã© o poder de seu pensamento, \r\nhabilidade que o permite ver aquilo que nunca foi visto e ouvir aquilo \r\nque nunca foi ouvido. Sob essa Ã³tica, vÃª-se que o cinema representa a \r\ncapacidade de transpor para a tela as ideias e os pensamentos presentes \r\nno intelecto das pessoas, de modo a possibilitar a criaÃ§Ã£o de novos \r\nuniversos e, justamente por esse potencial cognitivo, ele Ã© muito \r\nrelevante. Ã‰ prudente apontar, diante disso, que a arte cinematogrÃ¡fica \r\ndeve ser democratizada, em especial no Brasil â€“ paÃ­s rico em expressÃµes \r\nculturais que podem dialogar com esse modelo artÃ­stico â€“, por razÃµes que\r\n dizem respeito tanto Ã  sociedade quanto Ã s leis.</p><p style=\"text-align: justify;\">Em primeiro \r\nlugar, Ã© vÃ¡lido frisar que o cinema dialoga com uma elementar \r\nnecessidade social e, consequentemente, nÃ£o pode ser deixada em segundo \r\nplano. Para entender essa lÃ³gica, pode-se mencionar o renomado \r\nhistoriador holandÃªs Johan Huizinga, o qual, no livro â€œHomo Ludensâ€, \r\nratifica a constante busca humana pelo prazer lÃºdico, pois ele promove \r\num proveitoso bem-estar. Ã‰ exatamente nessa conjuntura que se insere o \r\nfenÃ´meno cinematogrÃ¡fico, uma vez que ele, ao possibilitar a interaÃ§Ã£o \r\nde vÃ¡rios indivÃ­duos na contemplaÃ§Ã£o do espetÃ¡culo, faz com que a \r\nplateia participe das histÃ³rias, de forma a compartilhar experiÃªncias e \r\nvivÃªncias â€“ o que representa o fator lÃºdico mencionado pelo pensador. Ã‰ \r\nperceptÃ­vel, portanto, o louvÃ¡vel elemento benfeitor dessa criaÃ§Ã£o \r\nartÃ­stica, capaz de garantir a coesÃ£o da comunidade.</p><p style=\"text-align: justify;\">Em segundo \r\nlugar, Ã© oportuno comentar que o cenÃ¡rio do cinema supracitado remete ao\r\n que defende o arcabouÃ§o jurÃ­dico do paÃ­s. Isso porque o artigo 215 da \r\nConstituiÃ§Ã£o Federal Ã© claro em caracterizar os bens culturais como um \r\ndireito de todos, concebidos com absoluta prioridade por parte do \r\nEstado. Contudo, Ã© desanimador notar que tal diretriz nÃ£o dÃ¡ sinais de \r\nplena execuÃ§Ã£o e, para provar isso, basta analisar as vÃ¡rias pesquisas \r\ndo Instituto do PatrimÃ´nio HistÃ³rico e ArtÃ­stico Nacional (IPHAN ) que \r\ndemonstram a lamentÃ¡vel distribuiÃ§Ã£o irregular das prÃ¡ticas artÃ­sticas â€“\r\n dentre elas, o cinema â€“, uma vez que estÃ£o restritas a poucos \r\nmunicÃ­pios brasileiros. VÃª-se, entÃ£o, o perigo da norma apresentada \r\nfindar em desuso, sob pena de confirmar o que propunha Dante Alighiere, \r\nem â€œA Divina ComÃ©diaâ€: â€œAs leis existem, mas quem as aplica?â€. Esse \r\ncenÃ¡rio, certamente, configura-se como desagregador e nÃ£o pode ser \r\nnegligenciado.</p><p style=\"text-align: justify;\">Por fim, caminhos devem ser elucidados para \r\ndemocratizar o acesso ao cinema no Brasil, levando-se em consideraÃ§Ã£o as\r\n questÃµes sociais e legislativas abordadas. Sendo assim, cabe ao Governo\r\n Federal â€“ Ã³rgÃ£o responsÃ¡vel pelo bem-estar e lazer da populaÃ§Ã£o â€“ \r\nelaborar um plano nacional de incentivo Ã  prÃ¡tica cinematogrÃ¡fica, de \r\nmodo a instituir aÃ§Ãµes como a criaÃ§Ã£o de semanas culturais nacionais, \r\nbem como o desenvolvimento de atividades artÃ­sticas pÃºblicas. Isso pode \r\nser feito por meio de uma associaÃ§Ã£o entre prefeituras, governadores e \r\nsetores federais â€“ jÃ¡ que o fenÃ´meno envolve todos esses Ã¢mbitos \r\nadministrativos â€“, os quais devem executar periÃ³dicos eventos, ancorados\r\n por atores e diretores, que visem exibir filmes gratuitos para a \r\ncomunidade civil. Esse projeto deve se adaptar Ã  realidade de cada \r\ncidade para ser efetivo. Dessa forma, o cinema poderÃ¡ ser, enfim, \r\ndemocratizado, o que confirmarÃ¡ o que determina o artigo 215 da \r\nConstituiÃ§Ã£o. Assim, felizmente, os cidadÃ£os poderÃ£o desfrutar das \r\nbenesses advindas dessa engrandecedora aÃ§Ã£o artÃ­stica.</p>', 'Uma Ã“tima redaÃ§Ã£o !!!!!!!!!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `repertorio`
--

CREATE TABLE `repertorio` (
  `id_repertorio` int(11) NOT NULL,
  `data_citacao` int(11) NOT NULL,
  `nome_autor` varchar(45) NOT NULL,
  `citacao` varchar(70) NOT NULL,
  `id_tipo_repertorio` int(11) NOT NULL,
  `id_tematica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `repertorio`
--

INSERT INTO `repertorio` (`id_repertorio`, `data_citacao`, `nome_autor`, `citacao`, `id_tipo_repertorio`, `id_tematica`) VALUES
(1, 1684608988, 'Paulo Freire', '\"A educaÃ§Ã£o Ã© deveras importante\"', 8, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tematica`
--

CREATE TABLE `tematica` (
  `id_tematica` int(11) NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tematica`
--

INSERT INTO `tematica` (`id_tematica`, `nome`) VALUES
(5, 'meio ambiente'),
(6, 'educaÃ§Ã£o'),
(7, 'Sociedade'),
(8, 'Direito'),
(9, 'SaÃºde');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_repertorio`
--

CREATE TABLE `tipo_repertorio` (
  `id_tipo_repertorio` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_repertorio`
--

INSERT INTO `tipo_repertorio` (`id_tipo_repertorio`, `nome`) VALUES
(7, 'filme'),
(8, 'legitimado'),
(9, 'JornalistÃ­co'),
(10, 'Linguistico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8 NOT NULL,
  `link` varchar(80) NOT NULL,
  `descricao` varchar(90) CHARACTER SET utf8 NOT NULL,
  `data_public` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `videos`
--

INSERT INTO `videos` (`id_video`, `nome`, `link`, `descricao`, `data_public`) VALUES
(7, 'introduÃ§Ã£o', 'uw1Tk-BdkXg', 'como montar a introduÃ§Ã£o da sua redaÃ§Ã£o', 1682212506);

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitante`
--

CREATE TABLE `visitante` (
  `email` varchar(45) NOT NULL,
  `senha` int(20) NOT NULL,
  `nome` varchar(70) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `visitante`
--

INSERT INTO `visitante` (`email`, `senha`, `nome`) VALUES
('diego9@gmail', 9, 'diego'),
('felipe@visitante.com', 0, 'Felipe'),
('paulo@gmail.com', 123, 'Paulo Marinho'),
('sjsjcsj', 0, 'yo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `biografia`
--
ALTER TABLE `biografia`
  ADD PRIMARY KEY (`id_bio`);

--
-- Indexes for table `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email_administrador` (`email_administrador`);

--
-- Indexes for table `redacoes`
--
ALTER TABLE `redacoes`
  ADD PRIMARY KEY (`id_redacao`);

--
-- Indexes for table `repertorio`
--
ALTER TABLE `repertorio`
  ADD PRIMARY KEY (`id_repertorio`),
  ADD KEY `id_tipo_repertorio` (`id_tipo_repertorio`),
  ADD KEY `id_tematica` (`id_tematica`);

--
-- Indexes for table `tematica`
--
ALTER TABLE `tematica`
  ADD PRIMARY KEY (`id_tematica`);

--
-- Indexes for table `tipo_repertorio`
--
ALTER TABLE `tipo_repertorio`
  ADD PRIMARY KEY (`id_tipo_repertorio`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`);

--
-- Indexes for table `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biografia`
--
ALTER TABLE `biografia`
  MODIFY `id_bio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `redacoes`
--
ALTER TABLE `redacoes`
  MODIFY `id_redacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `repertorio`
--
ALTER TABLE `repertorio`
  MODIFY `id_repertorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tematica`
--
ALTER TABLE `tematica`
  MODIFY `id_tematica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tipo_repertorio`
--
ALTER TABLE `tipo_repertorio`
  MODIFY `id_tipo_repertorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `monitor`
--
ALTER TABLE `monitor`
  ADD CONSTRAINT `monitor_ibfk_1` FOREIGN KEY (`email_administrador`) REFERENCES `administrador` (`email`);

--
-- Limitadores para a tabela `repertorio`
--
ALTER TABLE `repertorio`
  ADD CONSTRAINT `repertorio_ibfk_1` FOREIGN KEY (`id_tipo_repertorio`) REFERENCES `tipo_repertorio` (`id_tipo_repertorio`),
  ADD CONSTRAINT `repertorio_ibfk_2` FOREIGN KEY (`id_tematica`) REFERENCES `tematica` (`id_tematica`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
