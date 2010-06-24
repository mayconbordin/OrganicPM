<?php

include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'lib/TipoGabarito.class.php';

class AlternativaQuestao extends Transactions
	{
		private $teste;
		private $questao;
		private $valorGabarito;
		
		private $codigo;
		private $descricao;
	
	
		/**
		 * @return the $teste
		 */
		public function getTeste() {
			return $this->teste;
		}
	
			/**
		 * @return the $questao
		 */
		public function getQuestao() {
			return $this->questao;
		}
	
			/**
		 * @return the $valorGabarito
		 */
		public function getValorGabarito() {
			return $this->valorGabarito;
		}
	
			/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $descricao
		 */
		public function getDescricao() {
			return $this->descricao;
		}
	
			/**
		 * @param $teste the $teste to set
		 */
		public function setTeste($teste) {
			$this->teste = $teste;
		}
	
			/**
		 * @param $questao the $questao to set
		 */
		public function setQuestao($questao) {
			$this->questao = $questao;
		}
	
			/**
		 * @param $valorGabarito the $valorGabarito to set
		 */
		public function setValorGabarito($valorGabarito) {
			$this->valorGabarito = $valorGabarito;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $descricao the $descricao to set
		 */
		public function setDescricao($descricao) {
			$this->descricao = $descricao;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_ALTERNATIVAS_QUESTOES}()
								->teste_cod()
								->questao_cod()
								->descricao()
								->val_gab_cod()
							->number($this->teste->getCodigo())
							->number($this->questao->getCodigo())
							->string($this->descricao)
							->number($this->valorGabarito->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function deleteByTeste()
			{
				$this
					->delete()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->where()
						->teste_cod()->equ()->number($this->teste->getCodigo());
					 
				return $this->run();
			}   
			
		public function getInsertedCodigo()
			{
				$seq = "alternativa_questao_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function alter()
			{
				$this
					->update()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->set()
						->descricao()->equ()->string($this->descricao)
						->val_gab_cod()->equ()->number($this->valorGabarito->getCodigo())
					->where()
						->alt_que_cod()->equ()->number($this->codigo);
						
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->where()
						->alt_que_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
			
		public function getTipoGabaritoByCodigo()
			{
				$this
					->select()
						->v()->tip_gab_cod()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}("a")
						->{TBL_VALORES_GABARITO}("v")
					->where()
						->alt_que_cod()->equ()->number($this->codigo)
					->and()
						->a()->val_gab_cod()->equ()->v()->val_gab_cod();
						
				$this->run();
				
				$cod = $this->db->fetchField("TIP_GAB_COD");
				
				$tipoGabarito = new TipoGabarito();
				$tipoGabarito->setCodigo($cod);
				
				if ($cod !== false)
					return $tipoGabarito;
				else
					return false;
			}
			
		public function listAlternativasByQuestaoAndPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT a.alt_que_cod, a.descricao, v.valor, v.val_gab_cod, row_number() OVER (ORDER BY a.alt_que_cod) rn ".
							"FROM ".TBL_ALTERNATIVAS_QUESTOES." a, ".TBL_VALORES_GABARITO." v".
							" WHERE a.questao_cod = ".$this->questao->getCodigo().
							" AND a.val_gab_cod = v.val_gab_cod)"}()
						->where()
							->rn()->gtr()->number($min)
						->and()
							->rn()->leq()->number($max)
						->orderBy()
							->rn();
						
				$this->run();
																				
				$list = $this->db->fetchAll("num");
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
		
		public function listAlternativasByQuestao()
			{
				$this
					->select()
						->a()->alt_que_cod()
						->a()->descricao()
						->v()->valor()
						->v()->val_gab_cod()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}("a")
						->{TBL_VALORES_GABARITO}("v")
					->where()
						->a()->questao_cod()->equ()->number($this->questao->getCodigo())
					->and()
						->a()->val_gab_cod()->equ()->v()->val_gab_cod();
						
				$this->run();
																
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function listAlternativasCorretasByQuestao()
			{
				$this
					->select()
						->alt_que_cod()
						->count()->as()->total()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->where()
						->questao_cod()->equ()->number($this->questao->getCodigo())
					->and()
						->val_gab_cod()->equ()->number($this->valorGabarito->getCodigo())
					->groupBy()
						->alt_que_cod();
						
				$this->run();
																
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->descricao()
						->val_gab_cod()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->where()
						->alt_que_cod()->equ()->number($this->codigo);
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function countByQuestao()
			{
				$this
					->select()
						->count()->as()->total()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->where()
						->questao_cod()->equ()->number($this->questao->getCodigo());
						
				$this->run();
																
				$total = $this->db->fetchField("TOTAL");
				
				if ($total !== false)
					return $total;
				else
					return false;
			}
	}