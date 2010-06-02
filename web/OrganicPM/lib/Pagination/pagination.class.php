<?php
/**
 * pagination.class.php
 *
 * Pagination
 *
 * @url		-		http://www.strangerstudios.com/sandbox/pagination/diggstyle.php   
*/

class pagination
	{
		/**
		 * Atributos
		*/
		private $page, $totalitems, $limit, $adjacents, $targetpage, $pagestring, $parameters;
		
		/**
		* Constructor
		* Initialize default values
		*/
		public function __construct($page = 0, $totalitems, $limit = 15, $adjacents = 1, $targetpage = "/")
			{
				$this->page				= $page;
				$this->totalitems		= $totalitems;
				$this->limit			= $limit;
				$this->adjacents		= $adjacents;
				$this->targetpage		= $targetpage;
			}
			
		/**
		* Get limits
		*/
		public function getLimits()
			{
				if($this->page) 
					$start = ($this->page - 1) * $this->limit;
				else
					$start = 0;
					
				return(array('start' => $start, 'limit' => $this->limit));
			}
		
		/**
		* Get pagenavi
		*/
		public function getPagenavi()
			{
				/* Setup page vars for display. */
				if($this->page == 0)
					$this->page = 1;								//if no page var is given, default to 1.
				$prev = $this->page - 1;							//previous page is page - 1
				$next = $this->page + 1;							//next page is page + 1
				$lastpage = ceil($this->totalitems/$this->limit);	//lastpage is = total pages / items per page, rounded up.
				$lpm1 = $lastpage - 1;								//last page minus 1
				
				$url = $this->targetpage."&page=";
				
				/* 
					Now we apply our rules and draw the pagination object. 
					We're actually saving the code to a variable in case we want to draw it more than once.
				*/
				$pagination = "";
				if($lastpage >= 1)
					{	
						//Div Pagenavi
						$pagination .= "\n\t\t\t\t\t<div id=\"pagenavi\">\n";
						$pagination .= "\n\t\t\t\t\t\t<ul>\n";
						//Info pages
						//$pagination .= "\t\t\t\t\t\t<li><span class=\"pages\">Page ".$this->page." of ".$lastpage."</span></li>\n";
						
						//Previous button
						if ($this->page > 1) 
							$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$prev."\" title=\"P&#225;gina ".$prev."\">&#171; Anterior</a></li>\n";
						else
							$pagination.= "\t\t\t\t\t\t<li><span class=\"extend\">&#171; Anterior</span></li>\n";	
						
						//Pages	
						if ($lastpage < 7 + ($this->adjacents * 2))	//not enough pages to bother breaking it up
							{	
								for ($counter = 1; $counter <= $lastpage; $counter++)
									{
										if ($counter == $this->page)
											$pagination .= "\t\t\t\t\t\t<li><span class=\"current\">".$counter."</span></li>\n";
										else
											$pagination .= "\t\t\t\t\t\t<li><a href=\"".$url.$counter."\" title=\"P&#225;gina ".$counter."\">".$counter."</a></li>\n";					
									}
							}
						elseif($lastpage > 5 + ($this->adjacents * 2))	//enough pages to hide some
							{
								//close to beginning; only hide later pages
								if($this->page < 1 + ($this->adjacents * 2))		
									{
										for ($counter = 1; $counter < 4 + ($this->adjacents * 2); $counter++)
											{
												if ($counter == $this->page)
													$pagination.= "\t\t\t\t\t\t<li><span class=\"current\">".$counter."</span></li>\n";
												else
													$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$counter."\" title=\"P&#225;gina ".$counter."\">".$counter."</a></li>\n";					
											}
										$pagination.= "\t\t\t\t\t\t<li><span class=\"extend\">...</span></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$lpm1."\" title=\"P&#225;gina ".$lpm1."\">".$lpm1."</a></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$lastpage."\" title=\"&#218;ltima P&#225;gina\">".$lastpage."</a></li>\n";		
									}
								//in middle; hide some front and some back
								elseif($lastpage - ($this->adjacents * 2) > $this->page && $this->page > ($this->adjacents * 2))
									{
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url."1\" title=\"P&#225;gina 1\">1</a></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url."2\" title=\"P&#225;gina 2\">2</a></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><span class=\"extend\">...</span></li>\n";
										for ($counter = $this->page - $this->adjacents; $counter <= $this->page + $this->adjacents; $counter++)
											{
												if ($counter == $this->page)
													$pagination.= "\t\t\t\t\t\t<li><span class=\"current\">".$counter."</span></li>\n";
												else
													$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$counter."\" title=\"P&#225;gina ".$counter."\">".$counter."</a></li>\n";					
											}
										$pagination.= "\t\t\t\t\t\t<li><span class=\"extend\">...</span></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$lpm1."\" title=\"P&#225;gina ".$lpm1."\">".$lpm1."</a></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$lastpage."\" title=\"&#218;ltima P&#225;gina\">".$lastpage."</a></li>\n";		
									}
								//close to end; only hide early pages
								else
									{
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url."1\" title=\"P&#225;gina 1\">1</a></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url."2\" title=\"P&#225;gina 2\">2</a></li>\n";
										$pagination.= "\t\t\t\t\t\t<li><span class=\"extend\">...</span></li>\n";
										for ($counter = $lastpage - (2 + ($this->adjacents * 2)); $counter <= $lastpage; $counter++)
											{
												if ($counter == $this->page)
													$pagination.= "\t\t\t\t\t\t<li><span class=\"current\">".$counter."</span></li>\n";
												else
													$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$counter."\" title=\"P&#225;gina ".$counter."\">".$counter."</a></li>\n";					
											}
									}
							}
						
						//next button
						if ($this->page < $counter - 1) 
							$pagination.= "\t\t\t\t\t\t<li><a href=\"".$url.$next."\" title=\"P&#225;gina ".$next."\">Pr&#243;xima &#187;</a></li>\n";
						else
							$pagination.= "\t\t\t\t\t\t<li><span class=\"extend\">Pr&#243;xima &#187;</span></li>\n";
						$pagination.= "\t\t\t\t\t\t</ul>\n";		
						$pagination.= "\t\t\t\t\t</div>\n";		
					}

					return($pagination);
			}
	}
?>