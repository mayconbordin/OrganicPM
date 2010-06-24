<?php

include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'lib/FaseTeste.class.php';
include_once ROOT.'lib/AlternativaQuestao.class.php';
include_once ROOT.'lib/Questao.class.php';

class Teste extends Transactions
	{
		private $codigo;
		private $descricao;
		
		private $tipoTeste;
	
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
		 * @return the $tipoTeste
		 */
		public function getTipoTeste() {
			return $this->tipoTeste;
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
	
			/**
		 * @param $tipoTeste the $tipoTeste to set
		 */
		public function setTipoTeste($tipoTeste) {
			$this->tipoTeste = $tipoTeste;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TESTES}()
								->descricao()
								->tip_tes_cod()
							->string($this->descricao)
							->number($this->tipoTeste->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function deleteList($ids)
			{
				$ids = explode(",", $ids);
				
				foreach ($ids as $id)
					{
						$this->codigo = $id;
						$faseTeste = new FaseTeste();
						$faseTeste->setTeste($this);
						
						if (!$faseTeste->searchByTeste())
							{
								//Deletar alternativas
								$alter = new AlternativaQuestao();
								$alter->setTeste($this);
								$alter->deleteByTeste();
								
								//Deletar questões
								$questao = new Questao();
								$questao->setTeste($this);
								$questao->deleteByTeste();
								
								//Deletar testes
								$this
									->delete()
									->from()
										->{TBL_TESTES}()
									->where()
										->teste_cod()->equ()->number($id);
									 
								return $this->run();
							}
					}	
			}   
			
		public function alter()
			{
				$this
					->update()
						->{TBL_TESTES}()
					->set()
						->descricao()->equ()->string($this->descricao)
						->tip_tes_cod()->equ()->number($this->tipoTeste->getCodigo())
					->where()
						->teste_cod()->equ()->number($this->codigo);
						
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->descricao()
						->tip_tes_cod()
					->from()
						->{TBL_TESTES}()
					->where()
						->teste_cod()->equ()->number($this->codigo);
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function getInsertedCodigo()
			{
				$seq = "teste_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function listTestes()
			{
				$this
					->select()
						->teste_cod()
						->descricao()
					->from()
						->{TBL_TESTES}()
					->orderBy()
						->descricao();
						
				$this->run();
								
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function listTestesByPage($min, $max)
			{								
				$this
					->select()
						->from()
							->{"(SELECT teste_cod, descricao, row_number() OVER (ORDER BY teste_cod) rn FROM rs_testes)"}()
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
			
		public function count()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_TESTES}();
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_TESTES}()
					->where()
						->teste_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
		
		public function getNumTestes()
   			{
				$this
         			->select()
         				->count()->as()->num()
         			->from()
         				->{TBL_TESTES}();
      		
				$this->run();
				
				$num = $this->db->fetchField('NUM');

      			return $num;
   			}
		
		/**
   		 * Get the class field names and size
   		 * 
   		 * @return array
   		 */
   		public function getFieldNames()
   			{
   				$fields = array
	   				(
	   					array('name' => 't.teste_cod', 'display' => 'Código', 'width' => '80', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 't.descricao', 'display' => 'Descrição', 'width' => '200', 'sortable' => 'true', 'align' => 'left'),
	   					array('name' => 'tt.tipo', 'display' => 'Tipo', 'width' => '120', 'sortable' => 'true', 'align' => 'center'),
	   				);
	   				
	   			return $fields;
   			}
   			
   		public function getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $params)
   			{
   				//Get user data
   				$sql = "SELECT * FROM ".
   				"(SELECT t.teste_cod, t.descricao, tt.tipo,".
   				" row_number() OVER (ORDER BY ".$sortName." ".$sortOrder.") rn".
   				" FROM ".TBL_TESTES." t, ".TBL_TIPOS_TESTES." tt WHERE t.tip_tes_cod = tt.tip_tes_cod";
   					
   				if ($query)
   					$sql .= " AND LOWER(".$qType.") LIKE '%".strtolower($query)."%'";
				if ($letterPressed && $letterPressed != '#')
					$sql .= " AND LOWER(".$qType.") LIKE '".strtolower($letterPressed)."%'";
				if ($letterPressed == '#')
					$sql .= " AND ".$qType." LIKE '[[:digit:]]'";

				if (!$page)
					$page = 1;
				if (!$rp)
					$rp = 10;
				
				//Calculate the start point
   				$start = (($page-1) * $rp);
   				
   				$sql .= ") WHERE  rn > ".$start." AND  rn <= ".($start+$rp)." ORDER BY rn ASC";

				$this->setSql($sql, "select");

				$this->execute();
								
				//Get the user's data
				$result = $this->db->fetchAll();
								
				//Count the results
				$total = $this->getNumTestes();
				
				//Format the data
				foreach ($result as $row)
					{						
						$rows[] = array
	                		( 
	                			"id" => $row['TESTE_COD'], 
	                            "cell" => array
	                				(
										$row['TESTE_COD'],
	                            		utf8_encode($row['DESCRICAO']),
	                            		utf8_encode($row['TIPO'])
	                            	)
	                		); 
					}
										
				//Data array
				$data = array('page' => $page, 'total' => $total, 'params' => $params, 'rows' => $rows, 'sql' => $sql);
				
				return $data;
   			}
	}