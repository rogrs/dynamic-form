SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



CREATE TABLE IF NOT EXISTS `AUTHENTICATION_CREDENTIALS` (
`id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pwd` varchar(1024) NOT NULL,
  `salt` varchar(512) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `AUTHORIZATION_PROFILE_ID` bigint(20) NOT NULL,
  `dtcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enable` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `casoteste` (
`id` bigint(20) NOT NULL,
  `dtcreate` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `idprojeto` bigint(20) DEFAULT NULL,
  `nmcasoteste` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `evento` (
`id` bigint(20) NOT NULL,
  `dtcreate` datetime DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `sistema` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `formulario` (
`id` bigint(20) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `estuda` varchar(10) DEFAULT NULL,
  `cumprimenta` varchar(10) DEFAULT NULL,
  `domesticos` varchar(100) DEFAULT NULL,
  `compra` varchar(100) DEFAULT NULL,
  `fuma` varchar(100) DEFAULT NULL,
  `olhos` varchar(100) DEFAULT NULL,
  `altura` varchar(100) DEFAULT NULL,
  `aparelho` varchar(100) DEFAULT NULL,
  `caros` varchar(100) DEFAULT NULL,
  `crescer` varchar(100) DEFAULT NULL,
  `amigo` varchar(100) DEFAULT NULL,
  `animal` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `filme` varchar(100) DEFAULT NULL,
  `tv` varchar(100) DEFAULT NULL,
  `livro` varchar(100) DEFAULT NULL,
  `bebida` varchar(100) DEFAULT NULL,
  `loja` varchar(100) DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `rede` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `filhos` varchar(100) DEFAULT NULL,
  `deus` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `fazer` varchar(100) DEFAULT NULL,
  `assistiu` varchar(100) DEFAULT NULL,
  `torcida` varchar(100) DEFAULT NULL,
  `oculos` varchar(100) DEFAULT NULL,
  `moram` varchar(100) DEFAULT NULL,
  `dtcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--ALTER TABLE formulario ADD  `filepath` VARCHAR( 300 )

CREATE TABLE IF NOT EXISTS `pergunta` (
`id` bigint(20) NOT NULL,
  `pergunta` varchar(200) NOT NULL,
  `componente` varchar(80) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--ALTER TABLE `pergunta` CHANGE `seguencia` `sequencia` INT(11) NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `pergunta_values` (
`id` bigint(20) NOT NULL,
  `idpergunta` bigint(20) NOT NULL,
  `chave` varchar(30) NOT NULL,
  `valor` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `projeto` (
`id` bigint(20) NOT NULL,
  `dtcreate` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `nmprojeto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `propriedades` (
`id` bigint(20) NOT NULL,
  `chave` varchar(255) DEFAULT NULL,
  `dtcreate` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `respostas` (
`id` bigint(20) NOT NULL,
  `idpergunta` bigint(20) NOT NULL,
  `resposta` varchar(100) NOT NULL,
  `dtcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE formulario ADD  `filepath` varchar(300);

CREATE TABLE IF NOT EXISTS `formulario_files` (
  `id` bigint(20) NOT NULL,
  `idformulario` bigint(20) NOT NULL,
  `filepath` varchar(300) NOT NULL,
  `dtcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tarefa` (
`id` bigint(20) NOT NULL,
  `dtcreate` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `nmtarefa` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `usuarios` (
`id` bigint(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `pwd` varchar(1024) NOT NULL,
  `salt` varchar(512) NOT NULL,
  `role` varchar(30) NOT NULL,
  `dtcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enable` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


ALTER TABLE `AUTHENTICATION_CREDENTIALS` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casoteste`
--
ALTER TABLE `casoteste` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formulario`
--
ALTER TABLE `formulario` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pergunta`
--
ALTER TABLE `pergunta` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pergunta_values`
--
ALTER TABLE `pergunta_values` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projeto`
--
ALTER TABLE `projeto` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propriedades`
--
ALTER TABLE `propriedades` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `respostas`
--
ALTER TABLE `respostas` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarefa`
--
ALTER TABLE `tarefa` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios` ADD PRIMARY KEY (`id`);


ALTER TABLE `formulario_files` ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `AUTHENTICATION_CREDENTIALS`

ALTER TABLE `formulario_files`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
ALTER TABLE `AUTHENTICATION_CREDENTIALS`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `casoteste`
--
ALTER TABLE `casoteste`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `formulario`
--
ALTER TABLE `formulario`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pergunta`
--
ALTER TABLE `pergunta`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `pergunta_values`
--
ALTER TABLE `pergunta_values`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `projeto`
--
ALTER TABLE `projeto`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `propriedades`
--
ALTER TABLE `propriedades`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tarefa`
--
ALTER TABLE `tarefa`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;