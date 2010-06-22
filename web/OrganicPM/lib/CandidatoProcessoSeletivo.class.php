<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class CandidatoProcessoSeletivo extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
		private $status;
		
		
		/**
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
		}
	
			/**
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}
			
		/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @return the $processoSeletivo
		 */
		public function getProcessoSeletivo() {
			return $this->processoSeletivo;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
	
			/**
		 * @param $processoSeletivo the $processoSeletivo to set
		 */
		public function setProcessoSeletivo($processoSeletivo) {
			$this->processoSeletivo = $processoSeletivo;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
								->pessoa_cod()
								->pro_sel_cod()
								->status()
								->data_cadastro()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->string("ativo")
							->string(date('d/m/Y'));
							
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
						->p()->descricao()
						->p()->data_inicio()
						->p()->data_fim()
						->cp()->status()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}("p")
						->{TBL_CANDIDATOS_PROCESSOS_SELETI}("cp")
					->where()
						->cp()->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo())
					->and()
						->cp()->pro_sel_cod()->equ()->p()->pro_sel_cod();
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
						
		public function updateStatus()
			{
				$this
   					->update()
   						->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
   					->set()
   						->status()->equ()->val($this->status)
   					->where()
   						->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
   					->and()
   						->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo());
   					 
				return $this->run();
			}
		
		public function listCandidatosProcSelPerDay()
			{
				$sql = "select to_char(data_cadastro, 'YYYY-MM-DD') as data, count(*) as total from rs_candidatos_processos_seleti group by to_char(data_cadastro, 'YYYY-MM-DD')";
				
				$this->setSql($sql, "select");

				$this->execute();
				
				$list = $this->db->fetchAll();
								
				$data = array();
				
				foreach ($list as $l)
					{
						$data[$l['DATA']] = $l['TOTAL'];
					}
				
				if ($list !== false)
					return $data;
				else
					return false;
			}
			
		public function listCandidatosAtivosByProcSel()
			{
				$this
					->select()
						->pessoa_cod()
					->from()
						->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
					->where()
						->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo())
					->and()
						->status()->neq()->string("desclassificado");
												
				$this->run();
													
				$data = $this->db->fetchAll();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function listCandidatosProcSelPerMonth()
			{
				$sql = "select to_char(data_cadastro, 'YYYY-MM') as data, count(*) as total from rs_candidatos_processos_seleti group by to_char(data_cadastro, 'YYYY-MM')";
				
				$this->setSql($sql, "select");

				$this->execute();
				
				$list = $this->db->fetchAll();
								
				$data = array();
				
				foreach ($list as $l)
					{
						$data[$l['DATA']] = $l['TOTAL'];
					}
				
				if ($list !== false)
					return $data;
				else
					return false;
			}
			
		public function getNumCandProcSel()
   			{
				$this
         			->select()
         				->count()->as()->num()
         			->from()
         				->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
         			->where()
         				->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo());
      		
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
	   					array('name' => 'p.pessoa_cod', 'display' => 'Código', 'width' => '50', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'p.nome', 'display' => 'Nome', 'width' => '120', 'sortable' => 'true', 'align' => 'left'),
	   					array('name' => 'cp.status', 'display' => 'Status', 'width' => '50', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'cp.data_cadastro', 'display' => 'Data de Inscrição', 'width' => '80', 'sortable' => 'true', 'align' => 'center'),
	   				);
	   				
	   			return $fields;
   			}
   			
   		public function getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $params)
   			{
   				//Get user data
   				$sql = "SELECT * FROM ".
   				"(SELECT p.pessoa_cod, p.nome, cp.status, cp.data_cadastro,".
   				" row_number() OVER (ORDER BY ".$sortName." ".$sortOrder.") rn".
   				" FROM ".TBL_CANDIDATOS_PROCESSOS_SELETI." cp, ".TBL_PESSOAS." p".
   				" WHERE p.pessoa_cod = cp.pessoa_cod".
   				" AND cp.pro_sel_cod = ".$this->processoSeletivo->getCodigo();
   					
   				if ($query)
   					{
   						if ($qType == "cp.data_cadastro")
   							$sql .= " AND LOWER(".$qType.") = '".strtolower($query)."'";
   						else
   							$sql .= " AND LOWER(".$qType.") LIKE '%".strtolower($query)."%'";
   					}
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
				$total = $this->getNumCandProcSel();
				
				//Format the data
				foreach ($result as $row)
					{						
						$rows[] = array
	                		( 
	                			"id" => $row['PESSOA_COD'], 
	                            "cell" => array
	                				(
										$row['PESSOA_COD'],
	                            		utf8_encode($row['NOME']),
	                            		$row['STATUS'],
	                            		$row['DATA_CADASTRO']
	                            	)
	                		); 
					}
										
				//Data array
				$data = array('page' => $page, 'total' => $total, 'params' => $params, 'rows' => $rows, 'sql' => $sql);

				return $data;
   			}
	}