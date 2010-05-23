<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class FormacaoAdicional extends Transactions
	{
		private $codigo;
		private $tipo;
		private $nome;
		private $dataInicio;
		private $dataFim;
		private $cargaHoraria;
		
		private $pessoa;
		private $instituicao;
	}