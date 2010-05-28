<?php

/**
 * Include files
 */
include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'plugins/getPageURL.function.php';

/**
 * VisitedPage.class.php
 * 
 * Class to deal with visited pages.
 *
 * @author BlackNRoll
 * @version 1.0
 */
class VisitedPage extends Transactions
	{
		private $id;
		private $url;
		
		function __construct()
			{
				$this->url = getPageURL();
			}
			
		
		public function getID()
			{
				$this->id = $this->search();
				
				if (!$this->id)
					{
						$this->id = $this->add();
					}
					
				return $this->id;
			}
			
		public function add()
			{
				$this
					->insert()
						->into()
							->{TBL_VISITED_PAGES}()
								->url()
								->contador()
							->string($this->url)
							->number(0);
	      			 
	      		$this->run();
	      		
	      		$this->getInsertedCodigo();
	      		
	      		return $this->id;
			}
			
		public function getInsertedCodigo()
			{
				$seq = "pagina_visitada_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->id = $this->db->fetchField("CURRVAL");
			}
			
		public function search()
			{
				$this
					->select()
						->pag_vis_cod()
					->from()
						->{TBL_VISITED_PAGES}()
					->where()
						->url()->equ()->string($this->url);
	   				
				$this->run();
				
				$cod = $this->db->fetchField("PAG_VIS_COD");
				
				if ($cod === false)
	      			return false;
	      		else
	      			return $cod;
			}
			
		public function updateCount()
			{
				$this
					->update()
						->{TBL_VISITED_PAGES}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->url()->equ()->string($this->url);
						
	   			return $this->run();
			}
	}