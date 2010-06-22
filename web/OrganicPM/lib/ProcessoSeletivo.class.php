<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class ProcessoSeletivo extends Transactions
	{
		private $codigo;
		private $descricao;
		private $dataInicio;
		private $dataFim;
		private $inscricoesAte;
		private $vagas;
		private $cargo;
	
		private $pessoa;
		
		/**
		 * @return the $inscricoesAte
		 */
		public function getInscricoesAte() {
			return $this->inscricoesAte;
		}
	
			/**
		 * @param $inscricoesAte the $inscricoesAte to set
		 */
		public function setInscricoesAte($inscricoesAte) {
			$this->inscricoesAte = $inscricoesAte;
		}
			
		/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
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
		 * @return the $dataInicio
		 */
		public function getDataInicio() {
			return $this->dataInicio;
		}
	
			/**
		 * @return the $dataFim
		 */
		public function getDataFim() {
			return $this->dataFim;
		}
	
			/**
		 * @return the $vagas
		 */
		public function getVagas() {
			return $this->vagas;
		}
	
			/**
		 * @return the $cargo
		 */
		public function getCargo() {
			return $this->cargo;
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
		 * @param $dataInicio the $dataInicio to set
		 */
		public function setDataInicio($dataInicio) {
			$this->dataInicio = $dataInicio;
		}
	
			/**
		 * @param $dataFim the $dataFim to set
		 */
		public function setDataFim($dataFim) {
			$this->dataFim = $dataFim;
		}
	
			/**
		 * @param $vagas the $vagas to set
		 */
		public function setVagas($vagas) {
			$this->vagas = $vagas;
		}
	
			/**
		 * @param $cargo the $cargo to set
		 */
		public function setCargo($cargo) {
			$this->cargo = $cargo;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_PROCESSOS_SELETIVOS}()
								->descricao()
								->data_inicio()
								->data_fim()
								->vagas()
								->cargo_cod()
								->status()
							->string($this->descricao)
							->string($this->dataInicio)
							->string($this->dataFim)
							->number($this->vagas)
							->number($this->cargo->getCodigo())
							->string("inativo");
							
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
				$seq = "processo_seletivo_cod_seq.currval";
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
						->{TBL_PROCESSOS_SELETIVOS}()
					->set()
						->descricao()->equ()->string($this->descricao)
						->data_inicio()->equ()->string($this->dataInicio)
						->data_fim()->equ()->string($this->dataFim)
						->vagas()->equ()->number($this->vagas)
						->cargo_cod()->equ()->number($this->cargo->getCodigo())
					->where()
						->pro_sel_cod()->equ()->number($this->codigo);
						
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function listProcSelByPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT p.pro_sel_cod, SUBSTR(p.descricao, 0, 10), to_char(p.data_inicio, 'DD/MM/YYYY') as data_inicio, to_char(p.data_fim, 'DD/MM/YYYY') as data_fim,".
							" p.vagas, c.descricao as cargo, row_number() OVER (ORDER BY p.pro_sel_cod) rn ".
							"FROM ".TBL_PROCESSOS_SELETIVOS." p, ".TBL_CARGOS." c WHERE p.cargo_cod = c.cargo_cod)"}()
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
			
		public function listProcSelByPageAndPessoa($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT p.pro_sel_cod, p.descricao, cp.status,".
							" row_number() OVER (ORDER BY p.pro_sel_cod) rn ".
							"FROM ".TBL_PROCESSOS_SELETIVOS." p, ".TBL_CANDIDATOS_PROCESSOS_SELETI." cp".
							" WHERE cp.pessoa_cod = ".$this->pessoa->getCodigo().
							" AND p.pro_sel_cod = cp.pro_sel_cod ORDER BY p.data_fim)"}()
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
			
		public function listProcSelAtivosByPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT p.pro_sel_cod, SUBSTR(p.descricao, 0, 10), to_char(p.data_inicio, 'DD/MM/YYYY') as data_inicio, to_char(p.data_fim, 'DD/MM/YYYY') as data_fim,".
							" p.vagas, c.descricao as cargo, row_number() OVER (ORDER BY p.pro_sel_cod) rn ".
							"FROM ".TBL_PROCESSOS_SELETIVOS." p, ".TBL_CARGOS." c".
							" WHERE p.cargo_cod = c.cargo_cod".
							" AND p.status = 'inscricao')"}()
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
			
		public function listProcSelAtivos()
			{
				$this
					->select()
						->pro_sel_cod()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}()
					->where()
						->status()->equ()->string("ativo");
						
				$this->run();
								
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function cadastroExiste()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
					->where()
						->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->pro_sel_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
			}
			
		public function addCandidato()
			{
				$this
					->insert()
						->into()
							->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
						->number($this->pessoa->getCodigo())
						->number($this->codigo)
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
			
		public function isAtivo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}()
					->where()
						->status()->equ()->string("ativo")
					->and()
						->pro_sel_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
			}
			
		public function isAberto()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}()
					->where()
						->status()->equ()->string("inscricao")
					->and()
						->pro_sel_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
			}
			
		public function updateStatus()
			{
				//Inicia fase de inscrições dos processo seletivos
				$this
					->update()
						->{TBL_PROCESSOS_SELETIVOS}()
					->set()
						->status()->equ()->string("inscricao")
					->where()
						->data_inicio()->equ()->string(date('d/m/Y'))
					->and()
						->status()->equ()->string("inativo");
				
				$this->run();
								
				//Finaliza as incrições dos processos seletivos
				$this
					->update()
						->{TBL_PROCESSOS_SELETIVOS}()
					->set()
						->status()->equ()->string("ativo")
					->where()
						->{"inscricoes_ate + 1"}()->equ()->string(date('d/m/Y'))
					->and()
						->status()->equ()->string("inscricao");
				
				$this->run();
				
				//Finalizado os processo seletivos ativos
				$this
					->update()
						->{TBL_PROCESSOS_SELETIVOS}()
					->set()
						->status()->equ()->string("finalizado")
					->where()
						->data_fim()->lss()->string(date('d/m/Y'))
					->and()
						->status()->equ()->string("ativo");
				
				$this->run();
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->p()->descricao()
						->{"to_char(p.data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(p.data_fim, 'DD/MM/YYYY') as data_fim"}()
						->p()->vagas()
						->{"c.descricao as cargo"}()
						->p()->cargo_cod()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}("p")
						->{TBL_CARGOS}("c")
					->where()
						->pro_sel_cod()->equ()->number($this->codigo)
					->and()
						->p()->cargo_cod()->equ()->c()->cargo_cod();
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function countAtivos()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}()
					->where()
						->status()->equ()->string("ativo");
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
			
		public function count()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}();
						
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
						->{TBL_PROCESSOS_SELETIVOS}()
					->where()
						->pro_sel_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
			
		public function getNumProcSel()
   			{
				$this
         			->select()
         				->count()->as()->num()
         			->from()
         				->{TBL_PROCESSOS_SELETIVOS}();
      		
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
	   					array('name' => 'p.pro_sel_cod', 'display' => 'Código', 'width' => '50', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'p.descricao', 'display' => 'Descrição', 'width' => '120', 'sortable' => 'true', 'align' => 'left'),
	   					array('name' => 'p.data_inicio', 'display' => 'Data de Início', 'width' => '50', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'p.data_fim', 'display' => 'Data de Fim', 'width' => '80', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'p.vagas', 'display' => 'Vagas', 'width' => '120', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'c.descricao', 'display' => 'Cargo', 'width' => '120', 'sortable' => 'true', 'align' => 'center'),
	   					array('name' => 'p.status', 'display' => 'Status', 'width' => '120', 'sortable' => 'true', 'align' => 'center')
	   				
	   				);
	   				
	   			return $fields;
   			}
   			
   		public function getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $params)
   			{
   				//Get user data
   				$sql = "SELECT * FROM ".
   				"(SELECT p.pro_sel_cod, p.descricao, p.data_inicio, p.data_fim, p.vagas, c.descricao as cargo, p.status,".
   				" row_number() OVER (ORDER BY ".$sortName." ".$sortOrder.") rn".
   				" FROM ".TBL_PROCESSOS_SELETIVOS." p, ".TBL_CARGOS." c WHERE c.cargo_cod = p.cargo_cod";
   					
   				if ($query)
   					{
   						if ($qType == "p.data_inicio" || $qType == "p.data_fim")
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
				$total = $this->getNumProcSel();
				
				//Format the data
				foreach ($result as $row)
					{						
						$rows[] = array
	                		( 
	                			"id" => $row['PRO_SEL_COD'], 
	                            "cell" => array
	                				(
										$row['PRO_SEL_COD'],
	                            		utf8_encode($row['DESCRICAO']),
	                            		$row['DATA_INICIO'],
	                            		$row['DATA_FIM'], 
	                            		$row['VAGAS'],
	                            		utf8_encode($row['CARGO']),
	                            		$row['STATUS']
	                            	)
	                		); 
					}
										
				//Data array
				$data = array('page' => $page, 'total' => $total, 'params' => $params, 'rows' => $rows, 'sql' => $sql);

				return $data;
   			}
	}