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
	}