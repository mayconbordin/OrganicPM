<?php

include_once ROOT.'lib/ProcessoSeletivo.class.php';
include_once ROOT.'lib/Fases.class.php';

class checkStatus
	{
		private $processoSeletivo;
		private $fase;
		
		function __construct()
			{
				$this->processoSeletivo = new ProcessoSeletivo();
				$this->fase = new Fases();
				
				$this->checkFases();
				$this->checkProcSel();
			}
			
		public function checkProcSel()
			{
				$this->processoSeletivo->updateStatus();
			}
			
		public function checkFases()
			{
				$this->fase->updateStatus();
			}
	}