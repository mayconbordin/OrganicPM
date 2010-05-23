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
						->values(null, $this->url, 0);
	      			 
	      		$this->run();
	      		
	      		return $this->db->getID();
			}
			
		public function search()
			{
				$this
					->select()
						->pag_vis_cod()
					->from()
						->{TBL_VISITED_PAGES}()
					->where()
						->url()->equ()->val($this->url);
	   				
				$this->run();
				
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField("pag_vis_cod");
			}
			
		public function updateCount()
			{
				$this
					->update()
						->{TBL_VISITED_PAGES}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->url()->equ()->val($this->url);
						
	   			return $this->run();
			}
	}