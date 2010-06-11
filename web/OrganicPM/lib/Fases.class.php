<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Fases extends Transactions
	{
		private $codigo;
		private $ordem;
		private $dataInicio;
		private $dataFim;
		private $status;
		
		private $processoSeletivo;
		private $tipoFase;
		
		private $pessoa;
		
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
		 * @return the $ordem
		 */
		public function getOrdem() {
			return $this->ordem;
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
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
		}
	
			/**
		 * @return the $processoSeletivo
		 */
		public function getProcessoSeletivo() {
			return $this->processoSeletivo;
		}
	
			/**
		 * @return the $tipoFase
		 */
		public function getTipoFase() {
			return $this->tipoFase;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $ordem the $ordem to set
		 */
		public function setOrdem($ordem) {
			$this->ordem = $ordem;
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
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}
	
			/**
		 * @param $processoSeletivo the $processoSeletivo to set
		 */
		public function setProcessoSeletivo($processoSeletivo) {
			$this->processoSeletivo = $processoSeletivo;
		}
	
			/**
		 * @param $tipoFase the $tipoFase to set
		 */
		public function setTipoFase($tipoFase) {
			$this->tipoFase = $tipoFase;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_FASES}()
								->ordem()
								->data_inicio()
								->data_fim()
								->status()
								->pro_sel_cod()
								->tip_fas_cod()
							->number($this->ordem)
							->string($this->dataInicio)
							->string($this->dataFim)
							->string($this->status)
							->number($this->processoSeletivo->getCodigo())
							->number($this->tipoFase->getCodigo());
							
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
				$seq = "fase_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function listFasesByPageAndPessoa($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT f.fase_cod, f.ordem, to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio, to_char(f.data_fim, 'DD/MM/YYYY') as data_fim,".
							" f.status, c.descricao as cargo, t.fase, row_number() OVER (ORDER BY f.fase_cod) rn ".
							"FROM ".TBL_PROCESSOS_SELETIVOS." p, ".TBL_CARGOS." c, ".TBL_FASES." f, ".TBL_TIPOS_FASES." t, ".TBL_CANDIDATOS_PROCESSOS_SELETI." cp".
							" WHERE p.cargo_cod = c.cargo_cod".
							" AND p.data_inicio <= '".date('d/m/Y')."' AND p.data_fim >= '".date('d/m/Y')."'".
							" AND f.pro_sel_cod = p.pro_sel_cod AND f.tip_fas_cod = t.tip_fas_cod".
							" AND p.pro_sel_cod = cp.pro_sel_cod AND cp.pessoa_cod = ".$this->pessoa->getCodigo().
							" AND f.status = 'ativo' AND (cp.status = 'ativo' OR cp.status = 'Classificado')".
							" ORDER BY f.data_inicio)"}()
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
			
		public function isAtivo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_FASES}()
					->where()
						->status()->equ()->string("ativo")
					->and()
						->fase_cod()->equ()->number($this->codigo);
						
				$this->run();
								
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->t()->fase()
						->f()->data_inicio()
						->f()->data_fim()
						->f()->status()
					->from()
						->{TBL_FASES}("f")
						->{TBL_TIPOS_FASES}("t")
					->where()
						->fase_cod()->equ()->number($this->codigo)
					->and()
						->f()->tip_fas_cod()->equ()->t()->tip_fas_cod();
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function getProcessoSeletivoByCodigo()
			{
				$this
					->select()
						->pro_sel_cod()
					->from()
						->{TBL_FASES}()
					->where()
						->fase_cod()->equ()->number($this->codigo);
						
				$this->run();
									
				$cod = $this->db->fetchField("PRO_SEL_COD");
				
				$this->processoSeletivo = new ProcessoSeletivo();
				$this->processoSeletivo->setCodigo($cod);
				
				if ($cod === false)
					return false;
				else
					return true;
			}
			
		public function countByPessoa()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_FASES}("f")
						->{TBL_PROCESSOS_SELETIVOS}("p")
						->{TBL_CANDIDATOS_PROCESSOS_SELETI}("cp")
						
					->where()
						->f()->pro_sel_cod()->equ()->p()->pro_sel_cod()
					->and()
						->p()->pro_sel_cod()->equ()->cp()->pro_sel_cod()
					->and()
						->cp()->pessoa_cod()->equ()->number($this->pessoa->getCodigo());
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
		
		public function updateStatus()
			{
				$this
					->update()
						->{TBL_FASES}()
					->set()
						->status()->equ()->string("ativo")
					->where()
						->data_inicio()->equ()->string(date('d/m/Y'))
					->and()
						->status()->equ()->string("inativo");
				
				$this->run();
				
				$this
					->update()
						->{TBL_FASES}()
					->set()
						->status()->equ()->string("finalizado")
					->where()
						->data_fim()->lss()->string(date('d/m/Y'))
					->and()
						->status()->equ()->string("ativo");
				
				$this->run();
			}
	}