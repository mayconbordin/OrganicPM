<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Pessoa extends Transactions
	{
		
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
   		
		private $codigo;
		private $nome;
		private $dataNasc;
		private $cpf;
		private $endereco;
		private $bairro;
		private $emailPrimario;
		private $emailSecundario;
		private $naturalidade;
		private $cidade;
		private $cep;
		private $pais;
		private $numero;
		private $complemento;
		private $sexo;
		
		private $unidadeFederativa;
		private $estadoCivil;
		
		private $usuario;
		
		//==================================================================
   		// Accessors =======================================================
   		//==================================================================
   		
		/**
		 * @return the $usuario
		 */
		public function getUsuario() {
			return $this->usuario;
		}
	
			/**
		 * @param $usuario the $usuario to set
		 */
		public function setUsuario($usuario) {
			$this->usuario = $usuario;
		}
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
		
		/**
		 * @return the $sexo
		 */
		public function getSexo() {
			return $this->sexo;
		}
	
		/**
		 * @return the $nome
		 */
		public function getNome() {
			return $this->nome;
		}
	
			/**
		 * @return the $data_nasc
		 */
		public function getDataNasc() {
			return $this->dataNascasc;
		}
	
			/**
		 * @return the $cpf
		 */
		public function getCpf() {
			return $this->cpf;
		}
	
			/**
		 * @return the $endereco
		 */
		public function getEndereco() {
			return $this->endereco;
		}
	
			/**
		 * @return the $bairro
		 */
		public function getBairro() {
			return $this->bairro;
		}
	
			/**
		 * @return the $emailPrimario
		 */
		public function getEmailPrimario() {
			return $this->emailPrimario;
		}
	
			/**
		 * @return the $emailSecundario
		 */
		public function getEmailSecundario() {
			return $this->emailSecundario;
		}
	
			/**
		 * @return the $naturalidade
		 */
		public function getNaturalidade() {
			return $this->naturalidade;
		}
	
			/**
		 * @return the $cidade
		 */
		public function getCidade() {
			return $this->cidade;
		}
	
			/**
		 * @return the $cep
		 */
		public function getCep() {
			return $this->cep;
		}
	
			/**
		 * @return the $pais
		 */
		public function getPais() {
			return $this->pais;
		}
	
			/**
		 * @return the $numero
		 */
		public function getNumero() {
			return $this->numero;
		}
	
			/**
		 * @return the $complemento
		 */
		public function getComplemento() {
			return $this->complemento;
		}
	
			/**
		 * @return the $unidadeFederativa
		 */
		public function getUnidadeFederativa() {
			return $this->unidadeFederativa;
		}
	
			/**
		 * @return the $estadoCivil
		 */
		public function getEstadoCivil() {
			return $this->estadoCivil;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $nome the $nome to set
		 */
		public function setNome($nome) {
			$this->nome = $nome;
		}
	
			/**
		 * @param $data_nasc the $data_nasc to set
		 */
		public function setDataNasc($dataNasc) {
			$this->dataNasc = $dataNasc;
		}
	
			/**
		 * @param $cpf the $cpf to set
		 */
		public function setCpf($cpf) {
			$this->cpf = $cpf;
		}
		
		/**
		 * @param $sexo the $sexo to set
		 */
		public function setSexo($sexo) {
			$this->sexo = $sexo;
		}
	
			/**
		 * @param $endereco the $endereco to set
		 */
		public function setEndereco($endereco) {
			$this->endereco = $endereco;
		}
	
			/**
		 * @param $bairro the $bairro to set
		 */
		public function setBairro($bairro) {
			$this->bairro = $bairro;
		}
	
			/**
		 * @param $emailPrimario the $emailPrimario to set
		 */
		public function setEmailPrimario($emailPrimario) {
			$this->emailPrimario = $emailPrimario;
		}
	
			/**
		 * @param $emailSecundario the $emailSecundario to set
		 */
		public function setEmailSecundario($emailSecundario) {
			$this->emailSecundario = $emailSecundario;
		}
	
			/**
		 * @param $naturalidade the $naturalidade to set
		 */
		public function setNaturalidade($naturalidade) {
			$this->naturalidade = $naturalidade;
		}
	
			/**
		 * @param $cidade the $cidade to set
		 */
		public function setCidade($cidade) {
			$this->cidade = $cidade;
		}
	
			/**
		 * @param $cep the $cep to set
		 */
		public function setCep($cep) {
			$this->cep = $cep;
		}
	
			/**
		 * @param $pais the $pais to set
		 */
		public function setPais($pais) {
			$this->pais = $pais;
		}
	
			/**
		 * @param $numero the $numero to set
		 */
		public function setNumero($numero) {
			$this->numero = $numero;
		}
	
			/**
		 * @param $complemento the $complemento to set
		 */
		public function setComplemento($complemento) {
			$this->complemento = $complemento;
		}
	
			/**
		 * @param $unidadeFederativa the $unidadeFederativa to set
		 */
		public function setUnidadeFederativa($unidadeFederativa) {
			$this->unidadeFederativa = $unidadeFederativa;
		}
	
			/**
		 * @param $estadoCivil the $estadoCivil to set
		 */
		public function setEstadoCivil($estadoCivil) {
			$this->estadoCivil = $estadoCivil;
		}
		
		//==================================================================
   		// Methods =========================================================
   		//==================================================================

		public function record()
			{
				if ($this->unidadeFederativa)
					$uf = $this->unidadeFederativa->getCodigo();
				else
					$uf = null;
					
				if ($this->estadoCivil)
					$estadoCivil = $this->estadoCivil->getCodigo();
				else
					$estadoCivil = null;
				
				$this
					->insert()
						->into()
							->{TBL_PESSOAS}()
								->nome()
								->data_nasc()
								->cpf()
								->endereco()
								->bairro()
								->email_1()
								->email_2()
								->naturalidade()
								->cidade()
								->cep()
								->pais()
								->uni_fed_cod()
								->numero()
								->complemento()
								->est_civ_cod()
								->sexo()
							->string($this->nome)
							->string($this->dataNasc)
							->string($this->cpf)
							->string($this->endereco)
							->string($this->bairro)
							->string($this->emailPrimario)
							->string($this->emailSecundario)
							->string($this->naturalidade)
							->string($this->cidade)
							->string($this->cep)
							->string($this->pais)
							->number($uf)
							->number($this->numero)
							->string($this->complemento)
							->number($estadoCivil)
							->string($this->sexo);

				$result = $this->run();
												
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function getInsertedCodigo()
			{
				$seq = "pessoa_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}

		public function searchByCpf()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_PESSOAS}()
					->where()
						->cpf()->equ()->string($this->cpf);
						
				$this->run();
								
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
								
			}
			
		public function getCodigoByUsuario()
			{
				$this
					->select()
						->p()->pessoa_cod()
					->from()
						->{TBL_PESSOAS}('p')
						->{TBL_USUARIOS}('u')
					->where()
						->p()->pessoa_cod()->equ()->u()->pessoa_cod()
					->and()
						->u()->nome()->equ()->string($this->usuario->getUsername());
						
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("PESSOA_COD");
				
				if ($this->codigo === false)
					return false;
				else
					return true;
			}
			
		public function getDataByUsuario()
			{
				$this
					->select()
						->p()->pessoa_cod()
						->p()->nome()
						->p()->data_nasc()
						->p()->cpf()
						->p()->endereco()
						->p()->bairro()
						->p()->email_1()
						->p()->email_2()
						->p()->naturalidade()
						->p()->cidade()
						->p()->cep()
						->p()->pais()
						->p()->uni_fed_cod()
						->p()->numero()
						->p()->complemento()
						->p()->est_civ_cod()
						->p()->sexo()
					->from()
						->{TBL_PESSOAS}('p')
						->{TBL_USUARIOS}('u')
					->where()
						->p()->pessoa_cod()->equ()->u()->pessoa_cod()
					->and()
						->u()->nome()->equ()->string($this->usuario->getUsername());
						
						
				$this->run();
				
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function alter()
			{
				if ($this->unidadeFederativa)
					$uf = $this->unidadeFederativa->getCodigo();
				else
					$uf = null;
					
				if ($this->estadoCivil)
					$estadoCivil = $this->estadoCivil->getCodigo();
				else
					$estadoCivil = null;
				
				$this
					->update()
						->{TBL_PESSOAS}()
					->set()
						->nome()->equ()->string($this->nome)
						->data_nasc()->equ()->string($this->dataNasc)
						->cpf()->equ()->string($this->cpf)
						->endereco()->equ()->string($this->endereco)
						->bairro()->equ()->string($this->bairro)
						->email_1()->equ()->string($this->emailPrimario)
						->email_2()->equ()->string($this->emailSecundario)
						->naturalidade()->equ()->string($this->naturalidade)
						->cidade()->equ()->string($this->cidade)
						->cep()->equ()->string($this->cep)
						->pais()->equ()->string($this->pais)
						->uni_fed_cod()->equ()->number($uf)
						->numero()->equ()->number($this->numero)
						->complemento()->equ()->string($this->complemento)
						->est_civ_cod()->equ()->number($estadoCivil)
						->sexo()->equ()->string($this->sexo)
					->where()
						->pessoa_cod()->equ()->number($this->pessoa);
						
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
	}