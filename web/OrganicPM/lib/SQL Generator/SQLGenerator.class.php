<?php

class SQL
	{
		private $sql;
		
		private $sqlClass;
		
		public $isSqlClass		= false;
		public $lastFunction;
		
		public  $type;
		private $isType			= false;
		
		private $quote			= '';
		
		private $logicOperators	= array(
										'EQU' 		=> '=',
										'NEQ' 		=> '<>',
										'LSS' 		=> '<',
										'LEQ' 		=> '<=',
										'GTR' 		=> '>',
										'GEQ' 		=> '>=',
										'NOT'		=> 'NOT',
										'IN' 		=> 'IN',
										'NOTIN' 	=> 'NOT IN',
										'LIKE' 		=> 'LIKE',
										'NOTLIKE' 	=> 'NOT LIKE',
										'BTW' 		=> 'BETWEEN',
										'REGEXP'	=> 'REGEXP'
										);
										
		private $functions		= array('AVG', 'COUNT', 'MAX', 'MIN', 'SUM');
		
		private $column 		= array();
		private $columnCount	= 0;
		private $columnFunc		= false;
		
		private $from 			= array();
		private $fromCount 		= 0;
		private $isFrom			= false;
		
		private $where 			= array();
		private $whereCount		= 0;
		private $isWhere		= false;
		private $whereCondCount	= 0;
		private $whereTabPx		= false;
		private $whereBtw		= false;
		private $whereIn		= false;
		private $whereOper		= array();
		private $whereBackets	= array();
		
		private $orderBy 		= array();
		private $orderByCount	= 0;
		private $isOrderBy		= false;
		private $orderByTabPx	= false;
		
		private $having			= array();
		private $havingCount	= 0;
		private $isHaving		= false;
		private $havingTabPx	= false;
		private $havingCondCount= 0;
		private $havingBtw		= false;
		private $havingIn		= false;
		private $havingOper		= array();
		private $havingFunc		= false;
		private $havingBrackets	= array();
		
		private $groupBy 		= array();
		private $groupByCount	= 0;
		private $isGroupBy		= false;
		private $groupByTabPx	= false;
		
		private $set			= array();
		private $setCount		= 0;
		private $isSet			= false;
		private $setTabPx		= false;
		private $setCondCount	= 0;
		private $setEqual		= false;
		
		private $isInto			= false;
		private $values			= array();
		private $valuesCount	= 0;
		
		private $limit;
		
		private $offset;
		
		public function __construct($sqlClass = NULL)
			{
				$this->sqlClass = $sqlClass;
			}
			
		public function __call($func, $args)
			{	
				//Last function
				$this->lastFunction = $func;
				
				if ((strcmp(strtoupper($func), "AND") == 0 || strcmp(strtoupper($func), "OR") == 0) && $this->whereBtw === false && $this->isWhere === true)
					{
						$this->whereCount++;
						$this->whereCondCount = 0;
						$this->whereOper[] = strtoupper($func);
						
						return $this;
					}
					
				if ((strcmp(strtoupper($func), "AND") == 0 || strcmp(strtoupper($func), "OR") == 0) && $this->havingBtw === false && $this->isHaving === true)
					{
						$this->havingCount++;
						$this->havingCondCount = 0;
						$this->havingOper[] = strtoupper($func);
						
						return $this;
					}
					
				if (strcmp(strtoupper($func), "VALUES") == 0)
					{
						$this->valuesCount = count($args);
												
						for ($i = 0; $i <= $this->valuesCount; $i++)
							{
								$this->values[$i] = $args[$i];
							}
						
						return $this;
					}
					
				if (strcmp(strtoupper($func), "VAL") == 0 && strcmp($this->type, "INSERT") == 0)
					{											
						$this->values[$this->valuesCount] = $args[0];
						$this->valuesCount++;
						
						return $this;
					}
					
				if ($this->isType)
					{
						//Select columns
						if (strcmp($this->type, "SELECT") == 0)
							{
								$this->column[$this->columnCount] = $func;
								$this->columnCount++;
							}
							
						//Update table
						if (strcmp($this->type, "UPDATE") == 0)
							{
								$this->from[0]['table'] = $func;
								
								if (isset($args[0]))
									$this->from[0]['abrev'] = $args[0];
								else
									$this->from[0]['abrev'] = $func;
							}
					}
				
				//Call related to FROM statement
				if ($this->isFrom)
					{
						//Table abreviation
						$abrev = '';
						
						if (isset($args[0]))
							$abrev = $args[0];
						else
							$abrev = $func;
						
						//Add the new table to the sql
						$this->from[$this->fromCount] = array('table' => $func, 'abrev' => $abrev);
						
						//Increase the count of tables
						$this->fromCount++;
					}
					
				//Call related to WHERE statement
				if ($this->isWhere)
					{
						if ($this->whereCondCount == 0)
							{
								$this->where[$this->whereCount] = '';
							}
								
						//Table prefix
						if ($this->inTable($func))
							{
								$this->where[$this->whereCount] .= $this->quote . $func . $this->quote . '.';
								$this->whereTabPx = true;
							}
						//Multiple Values
						elseif (isset($args[0]) && $this->whereIn && (strcmp($func, 'vals') == 0 || strcmp($func, 'val') == 0))
							{
								//Start the values
								$this->where[$this->whereCount] .= ' (';
								
								//Count the number of paramenters
								$count = count($args);
								
								if ($count == 1 && is_array($args[0]))
									{
										$args = $args[0];
										$count = count($args);
									}
								
								for($i = 0; $i < $count; $i++)
									{
										//Sanitize var
										$args[$i] = (get_magic_quotes_gpc()) ? $args[$i] : addslashes($args[$i]);
										
										if (is_numeric($args[$i]))
											$this->where[$this->whereCount] .= $args[$i];
										else
											$this->where[$this->whereCount] .= "'" . $args[$i] . "'";
										
										if ($i != ($count-1))
											$this->where[$this->whereCount] .= ', ';
									}
									
								//Finish the values
								$this->where[$this->whereCount] .= ')';

								$this->whereIn = false;
							}
						//Values
						elseif (isset($args[0]) && strcmp($func, 'val') == 0)
							{
								$args[0] = (get_magic_quotes_gpc()) ? $args[0] : addslashes($args[0]);
								
								if (is_numeric($args[0]))
									$this->where[$this->whereCount] .= ' ' . $args[0];
								else
									$this->where[$this->whereCount] .= " '" . $args[0] . "'";
							}
						//Equations
						elseif (isset($args[0]) && strcmp($func, 'eq') == 0)
							{								
								$this->where[$this->whereCount] .= ' ' . $args[0];
							}
						//Functions
						elseif (isset($args[0]))
							{
								//Start the function
								$this->where[$this->whereCount] .= strtoupper($func) . '(';
								
								//Count the number of paramenters
								$count = count($args);
								
								for($i = 0; $i < $count; $i++)
									{
										$this->where[$this->whereCount] .= $args[$i];
										
										if ($i != ($count-1))
											$this->where[$this->whereCount] .= ', ';
									}
								
								//Finish the function
								$this->where[$this->whereCount] .= ')';
							}
						//Logic Operators
						elseif ($this->inLogOper($func))
							{
								if (!$this->isSqlClass)
									{
										$this->where[$this->whereCount] .= ' ' . $this->logicOperators[strtoupper($func)];
									
										if (strcmp(strtoupper($func), "BTW") == 0)
											$this->whereBtw = true;
										elseif (strcmp(strtoupper($func), "IN") == 0 || strcmp(strtoupper($func), "NOTIN") == 0)
											$this->whereIn = true;
									}
								else
									{
										$this->sqlClass->build();
										$this->where[$this->whereCount] .= ' (' . $this->sqlClass->getSql() . ')';
										$this->isSqlClass = false;
										
										if (strcmp(strtoupper($func), "IN") == 0 || strcmp(strtoupper($func), "NOTIN") == 0)
											$this->whereIn = false;
									}
							}
						//AND operator (BETWEEN logic operator)
						elseif (strcmp(strtoupper($func), "AND") == 0 && $this->whereBtw)
							{
								$this->where[$this->whereCount] .= ' AND';
								
								$this->whereBtw = false;
							}
						//Columns
						else
							{
								if ($this->whereTabPx)
									$this->where[$this->whereCount] .= $this->quote . $func . $this->quote;
								else
									$this->where[$this->whereCount] .= ' ' . $this->quote . $func . $this->quote;
								
								$this->whereTabPx = false;
							}

						$this->whereCondCount++;
					}
					
				//Call related to HAVING statement
				if ($this->isHaving)
					{
						if ($this->whereCondCount == 0)
							{
								$this->having[$this->havingCount] = '';
							}
								
						//Table prefix
						if ($this->inTable($func))
							{
								$this->having[$this->havingCount] .= $this->quote . $func . $this->quote . '.';
								$this->havingTabPx = true;
							}
						//Multiple Values
						elseif (isset($args[0]) && $this->havingIn && (strcmp($func, 'vals') == 0 || strcmp($func, 'val') == 0))
							{
								//Start the values
								$this->having[$this->havingCount] .= ' (';
								
								//Count the number of paramenters
								$count = count($args);
								
								if ($count == 1 && is_array($args[0]))
									{
										$args = $args[0];
										$count = count($args);
									}
								
								for($i = 0; $i < $count; $i++)
									{
										//Sanitize var
										$args[$i] = (get_magic_quotes_gpc()) ? $args[$i] : addslashes($args[$i]);
										
										if (is_numeric($args[$i]))
											$this->having[$this->havingCount] .= $args[$i];
										else
											$this->having[$this->havingCount] .= "'" . $args[$i] . "'";
										
										if ($i != ($count-1))
											$this->having[$this->havingCount] .= ', ';
									}
									
								//Finish the values
								$this->having[$this->havingCount] .= ')';

								$this->havingIn = false;
							}
						//Values
						elseif (isset($args[0]) && strcmp($func, 'val') == 0)
							{
								$args[0] = (get_magic_quotes_gpc()) ? $args[0] : addslashes($args[0]);
								
								if (is_numeric($args[0]))
									$this->having[$this->havingCount] .= ' ' . $args[0];
								else
									$this->having[$this->havingCount] .= " '" . $args[0] . "'";
							}
						//Equations
						elseif (isset($args[0]) && strcmp($func, 'eq') == 0)
							{								
								$this->having[$this->havingCount] .= ' ' . $args[0];
							}
						//Functions
						elseif (isset($args[0]) || in_array(strtoupper($func), $this->functions))
							{
								//Start the function
								$this->having[$this->havingCount] .= strtoupper($func) . '(';
								
								$this->havingFunc = true;
							}
						//Logic Operators
						elseif ($this->inLogOper($func))
							{
								if (!$this->isSqlClass)
									{
										$this->having[$this->havingCount] .= ' ' . $this->logicOperators[strtoupper($func)];
									
										if (strcmp(strtoupper($func), "BTW") == 0)
											$this->havingBtw = true;
										elseif (strcmp(strtoupper($func), "IN") == 0 || strcmp(strtoupper($func), "NOTIN") == 0)
											$this->havingIn = true;
									}
								else
									{
										$this->sqlClass->build();
										$this->having[$this->havingCount] .= ' (' . $this->sqlClass->getSql() . ')';
										$this->isSqlClass = false;
										
										if (strcmp(strtoupper($func), "IN") == 0 || strcmp(strtoupper($func), "NOTIN") == 0)
											$this->havingIn = false;
									}
							}
						//AND operator (BETWEEN logic operator)
						elseif (strcmp(strtoupper($func), "AND") == 0 && $this->havingBtw)
							{
								$this->having[$this->havingCount] .= ' AND';
								
								$this->havingBtw = false;
							}
						//Columns
						else
							{
								if ($this->havingTabPx)
									$this->having[$this->havingCount] .= $this->quote . $func . $this->quote;
								else
									$this->having[$this->havingCount] .= ' ' . $this->quote . $func . $this->quote;
									
								if($this->havingFunc)
									$this->having[$this->havingCount] .= ') ';
								
								$this->havingTabPx = false;
								$this->havingFunc = false;
							}

						$this->havingCondCount++;
					}
					
				//Call related to GROUP BY statement
				if ($this->isGroupBy)
					{
						if ($this->inTable($func))
							{
								$this->groupBy[$this->groupByCount] = ' ' . $this->quote . $func . $this->quote . '.';
								$this->groupByTabPx = true;
							}
						else
							{
								if ($this->groupByTabPx)
									$this->groupBy[$this->groupByCount] .= $this->quote . $func . $this->quote;
								else
									{
										$this->groupBy[$this->groupByCount] = $this->quote . $func . $this->quote;
									}

								$this->groupByTabPx = false;
								$this->groupByCount++;
							}
					}
					
				//Call related to ORDER BY statement
				if ($this->isOrderBy)
					{
						if ($this->inTable($func))
							{
								$this->checkOrderBy();

								$this->orderBy[$this->orderByCount] = ' ' . $this->quote . $func . $this->quote . '.';
								$this->orderByTabPx = true;
							}
						elseif (strcmp(strtoupper($func), "ASC") == 0 || strcmp(strtoupper($func), "DESC") == 0)
							{
								$this->orderBy[$this->orderByCount] .= ' ' . strtoupper($func);
								
								$this->orderByCount++;
							}
						else
							{
								if ($this->orderByTabPx)
									$this->orderBy[$this->orderByCount] .= $this->quote . $func . $this->quote;
								else
									{
										$this->checkOrderBy();
										$this->orderBy[$this->orderByCount] = $this->quote . $func . $this->quote;
									}

								$this->orderByTabPx = false;
							}
					}
					
				//Call related to SET statement
				if ($this->isSet)
					{
						if ($this->setCondCount == 0)
							{
								$this->set[$this->setCount] = '';
							}
							
						//Table prefix
						if ($this->inTable($func))
							{
								$this->set[$this->setCount] .= $this->quote . $func . $this->quote . '.';
								$this->setTabPx = true;
							}
						//Equations
						elseif (isset($args[0]) && strcmp($func, 'eq') == 0)
							{								
								$this->set[$this->setCount] .= ' (' . $args[0] . ')';
								
								if ($this->setEqual)
									{
										$this->setCount++;
										$this->setEqual = false;
									}
							}
						//Equal
						elseif (strcmp($func, 'equ') == 0)
							{
								if (!$this->isSqlClass)
									{
										$this->set[$this->setCount] .= ' = ';
										$this->setEqual = true;
									}
								else
									{
										$this->sqlClass->build();
										$this->set[$this->setCount] .= ' (' . $this->sqlClass->getSql() . ')';
										$this->isSqlClass = false;
									}
							}
						//Value
						elseif (isset($args[0]) && strcmp($func, 'val') == 0)
							{								
								if (is_numeric($args[0]))
									$this->set[$this->setCount] .= $args[0];
								else
									$this->set[$this->setCount] .= " '" . $args[0] . "'";
																	
								if ($this->setEqual)
									{
										$this->setCount++;
										$this->setEqual = false;
									}
							}
						//Columns
						else
							{
								if ($this->setTabPx)
									$this->set[$this->setCount] .= $this->quote . $func . $this->quote;
								else
									$this->set[$this->setCount] .= ' ' . $this->quote . $func . $this->quote;
								
								$this->setTabPx = false;
								
								if ($this->setEqual)
									{
										$this->setCount++;
										$this->setEqual = false;
									}
							}

						$this->setCondCount++;
					}
					
				//Call related to INTO statement
				if ($this->isInto)
					{
						if ($this->columnCount == 0)
							{
								$this->from[0]['table'] = $func;
										
								if (isset($args[0]))
									$this->from[0]['abrev'] = $args[0];
								else
									$this->from[0]['abrev'] = $func;
							}
						else
							{
								$this->column[$this->columnCount-1] = $this->quote . $func . $this->quote;
							}
							
						$this->columnCount++;
					}
					
				return $this;
		    }
		    
		//====================================================
		// Accessors Functions
		//====================================================
		
		public function getSql()
			{
				return $this->sql;
			}
			
		//====================================================
		// Query Functions
		//====================================================
		
		public function select()
			{
				$this->type = "SELECT";
				
				$this->setAllFalse();
				$this->isType = true;
				
				return $this;
			}
		
		public function insert()
			{
				$this->type = "INSERT";
				
				$this->setAllFalse();
				$this->isType = true;
				
				return $this;
			}
			
		public function delete()
			{
				$this->type = "DELETE";
				
				$this->setAllFalse();
				$this->isType = true;
				
				return $this;
			}
			
		public function update()
			{
				$this->type = "UPDATE";
				
				$this->setAllFalse();
				$this->isType = true;
				
				return $this;
			}

		public function from()
			{
				$this->setAllFalse();
				
				if ($this->type && in_array($this->type, array("SELECT", "DELETE")))
					{
						$this->isFrom = true;
						return $this;
					}
				else
					die("'FROM' statement can be only used with 'SELECT' and 'DELETE' queries.");
			}
			
		public function where()
			{
				$this->setAllFalse();
				
				if ($this->type && strcmp($this->type, "INSERT") != 0)
					{
						$this->isWhere = true;
						return $this;
					}
				else
					die("'WHERE' statement can only be used with 'SELECT', 'DELETE' and 'UPDATE' statements.");
			}
			
		public function groupBy()
			{
				$this->setAllFalse();
				
				if ($this->type && strcmp($this->type, "SELECT") == 0)
					{
						$this->isGroupBy = true;
						return $this;
					}
				else
					die("'GROUP BY' statement can only be used with the 'SELECT' statement.");
			}
			
		public function having()
			{
				$this->setAllFalse();
				
				if ($this->type && strcmp($this->type, "SELECT") == 0)
					{
						$this->isHaving = true;
						return $this;
					}
				else
					die("'HAVING' statement can only be used with the 'SELECT' statement.");
			}
			
		public function orderBy()
			{
				$this->setAllFalse();
				
				if ($this->type && strcmp($this->type, "SELECT") == 0)
					{
						$this->isOrderBy = true;
						return $this;
					}
				else
					die("'ORDER BY' statement can only be used with the 'SELECT' statement.");
			}
			
		public function limit($value)
			{
				$this->setAllFalse();
				
				if ($this->type && in_array($this->type, array("SELECT", "UPDATE", "DELETE")))
					{
						if (is_numeric($value))
							$this->limit = $value;
						else
							die("'LIMIT' statement must be numeric.");
							
						return $this;
					}
				else
					die("'LIMIT' statement can only be used with 'SELECT', 'UPDATE' or 'DELETE' statements.");
			}
			
		public function offset($value)
			{
				$this->setAllFalse();
				
				if ($this->type && in_array($this->type, array("SELECT", "UPDATE", "DELETE")))
					{
						if (is_numeric($value))
							$this->offset = $value;
						else
							die("The offset statement must be numeric");
							
						return $this;
					}
				else
					die("'OFFSET' statement can only be used with 'SELECT', 'UPDATE' or 'DELETE' statements.");
			}
			
		public function set()
			{
				$this->setAllFalse();
				
				if ($this->type && strcmp($this->type, "UPDATE") == 0)
					{
						$this->isSet = true;
						return $this;
					}
				else
					die("'SET' statement can only be used with the 'UPDATE' statement.");
			}
			
		public function begin()
			{
				if ($this->isWhere)
					$this->whereBrackets[$this->whereCount]['begin'] = true;
				elseif ($this->isHaving)
					$this->havingBrackets[$this->havingCount]['begin'] = true;
				
				return $this;
			}
			
		public function end()
			{
				if ($this->isWhere)
					$this->whereBrackets[$this->whereCount]['end'] = true;
				elseif ($this->isHaving)
					$this->havingBrackets[$this->havingCount]['end'] = true;
				
				return $this;
			}
			
		public function into()
			{
				$this->setAllFalse();
				
				if ($this->type && strcmp($this->type, "INSERT") == 0)
					{
						$this->isInto = true;
						return $this;
					}
				else
					die("'INTO' statement can only be used with the 'INSERT' statement.");
			}
			
		public function open()
			{
				$this->sqlClass = new SQL($this);
				
				return $this->sqlClass;
			}
			
		public function close()
			{
				$this->sqlClass->isSqlClass = true;
								
				$function = $this->sqlClass->lastFunction;
				
				return $this->sqlClass->$function();
			}

		//====================================================
		// Build Functions
		//====================================================
		
		public function build()
			{
				//SELECT
				if (strcmp($this->type, "SELECT") == 0)
					{
						//Start the sql
						$this->sql = 'SELECT ';
						
						//Columns
						if ($this->columnCount == 0)
							$this->sql .= '*';
						else
							for($i = 0; $i < $this->columnCount; $i++)
								{
									//Enabled Functions
									if (in_array(strtoupper($this->column[$i]), $this->functions))
										{
											$this->sql .= strtoupper($this->column[$i]) . '(';
											$this->columnFunc = true;
											
											if (strcmp(strtoupper($this->column[$i+1]), "AS") == 0)
												{
													$this->sql .= '*)';
													$this->columnFunc = false;
												}
										}
									//Attribution
									elseif (strcmp(strtoupper($this->column[$i]), "AS") == 0)
										{
											$this->sql .= ' AS ';
										}
									//Column prefix
									elseif ($this->inTable($this->column[$i]))
										{
											$this->sql .= $this->quote . $this->column[$i] . $this->quote . '.';
										}
									//Column names
									else
										{
											$this->sql .= $this->quote . $this->column[$i] . $this->quote;
									
											if (!$this->columnFunc)
												{
													if ($i != ($this->columnCount - 1))
														$this->sql .= ', ';
												}
											else
												{
													$this->sql .= ') ';
													$this->columnFunc = false;
												}
										}
								}
							
						//Tables
						$this->sql .= ' FROM ';
						if ($this->fromCount == 0)
							die("'SELECT' query must have at least one table referenced.");
						else
							for($i = 0; $i < $this->fromCount; $i++)
								{
									$this->sql .= $this->quote . $this->from[$i]['table'] . $this->quote;
									
									if (strcmp($this->from[$i]['table'], $this->from[$i]['abrev']) != 0)
										$this->sql .= ' AS ' . $this->quote . $this->from[$i]['abrev'] . $this->quote;
									
									if ($i != ($this->fromCount - 1))
										$this->sql .= ', ';
								}
								
						//Where
						if (isset($this->where[0]))
							{
								$this->sql .= ' WHERE ';
								for($i = 0; $i <= $this->whereCount; $i++)
									{
										if (isset($this->whereBrackets[$i]['begin']) && $this->whereBrackets[$i]['begin'] === true)
											$this->sql .= '(';
											
										$this->sql .= $this->where[$i];
										
										if (isset($this->whereBrackets[$i]['end']) && $this->whereBrackets[$i]['end'] === true)
											$this->sql .= ')';
										
										if (isset($this->whereOper[$i]))
											$this->sql .= ' ' . $this->whereOper[$i] . ' ';
									}
							}
							
						//Group By
						if (isset($this->groupBy[0]))
							{
								$this->sql .= ' GROUP BY ';
								for($i = 0; $i <= $this->groupByCount; $i++)
									{								
										$this->sql .= $this->groupBy[$i];
										
										if (!isset($this->groupBy[$i+1]))
											break;
										else
											$this->sql .= ', ';
									}
							}
							
						//Having
						if (isset($this->having[0]))
							{
								$this->sql .= ' HAVING ';
								for($i = 0; $i <= $this->havingCount; $i++)
									{
										if (isset($this->havingBrackets[$i]['begin']) && $this->havingBrackets[$i]['begin'] === true)
											$this->sql .= '(';
											
										$this->sql .= $this->having[$i];
										
										if (isset($this->havingBrackets[$i]['end']) && $this->havingBrackets[$i]['end'] === true)
											$this->sql .= ')';
										
										if (isset($this->havingOper[$i]))
											$this->sql .= ' ' . $this->havingOper[$i] . ' ';
									}
							}
							
						//Order By
						if (isset($this->orderBy[0]))
							{
								$this->sql .= ' ORDER BY ';
								for($i = 0; $i <= $this->orderByCount; $i++)
									{
										$this->checkOrderBy();
										
										$this->sql .= $this->orderBy[$i];
										
										if (!isset($this->orderBy[$i+1]))
											break;
										else
											$this->sql .= ', ';
									}
							}
							
						//Limit
						if (isset($this->limit))
							{
								$this->sql .= ' LIMIT ' . $this->limit;
							}
							
						//Offset
						if (isset($this->offset))
							{
								$this->sql .= ' OFFSET ' . $this->offset;
							}
					}
					
				//UPDATE
				if (strcmp($this->type, "UPDATE") == 0)
					{
						$this->sql = 'UPDATE ';
						
						if ($this->from[0])
							{
								$this->sql .= $this->quote . $this->from[0]['table'] . $this->quote;
								
								if (strcmp($this->from[0]['table'], $this->from[0]['abrev']) != 0)
									$this->sql .= ' AS ' . $this->quote . $this->from[0]['abrev'] . $this->quote;
							}
						else
							die("'UPDATE' query must have one table referenced.");
							
						//Set
						if (isset($this->set[0]))
							{
								$this->sql .= ' SET ';
								for($i = 0; $i <= $this->setCount; $i++)
									{
										$this->sql .= $this->set[$i];
										
										if (!isset($this->set[$i+1]))
											break;
										else
											$this->sql .= ', ';
									}
							}
							
						//Where
						if (isset($this->where[0]))
							{
								$this->sql .= ' WHERE ';
								for($i = 0; $i <= $this->whereCount; $i++)
									{
										if (isset($this->whereBrackets[$i]['begin']) && $this->whereBrackets[$i]['begin'] === true)
											$this->sql .= '(';
											
										$this->sql .= $this->where[$i];
										
										if (isset($this->whereBrackets[$i]['end']) && $this->whereBrackets[$i]['end'] === true)
											$this->sql .= ')';
										
										if (isset($this->whereOper[$i]))
											$this->sql .= ' ' . $this->whereOper[$i] . ' ';
									}
							}
							
						//Limit
						if (isset($this->limit))
							{
								$this->sql .= ' LIMIT ' . $this->limit;
							}
							
						//Offset
						if (isset($this->offset))
							{
								$this->sql .= ' OFFSET ' . $this->offset;
							}
					}
					
				//INSERT
				if (strcmp($this->type, "INSERT") == 0)
					{
						$this->sql = 'INSERT ';
						
						//Table name
						if ($this->from[0])
							{
								$this->sql .= 'INTO ' . $this->quote . $this->from[0]['table'] . $this->quote;
								
								if (strcmp($this->from[0]['table'], $this->from[0]['abrev']) != 0)
									$this->sql .= ' AS ' . $this->quote . $this->from[0]['abrev'] . $this->quote;
							}
						else
							die("'INSERT' query must have one table referenced.");
						
						//Columns
						if ($this->column)
							{
								$this->sql .= '(';
								
								for($i = 0; $i < $this->columnCount; $i++)
									{
										$this->sql .= $this->column[$i];
										
										if (!isset($this->column[$i+1]))
											break;
										else
											$this->sql .= ', ';
									}
									
								$this->sql .= ') ';
							}
						
						//Values
						if ($this->values)
							{	
								if (($this->columnCount - 1) == $this->valuesCount || ($this->columnCount - 1) == 0)
									{
										$this->sql .= ' VALUES(';
										
										for($i = 0; $i < $this->valuesCount; $i++)
											{
												if (strtoupper($this->values[$i]) == "NULL")
													$this->sql .= 'NULL';
												elseif (is_numeric($this->values[$i]))
													$this->sql .= $this->values[$i];
												else
													$this->sql .= "'" . $this->values[$i] . "'";
												
												if ($i == ($this->valuesCount-1))
													break;
												else
													$this->sql .= ', ';													
											}
										
										$this->sql .= ')';
									}
								else
									die("Number of columns doesn't match the number of values.");
							}
						else
							die("'INSERT' query must have values to insert.");
							
					}
					
				//DELETE
				if (strcmp($this->type, "DELETE") == 0)
					{
						$this->sql = 'DELETE ';
						
						//Table name
						if ($this->from[0])
							{
								$this->sql .= 'FROM ' . $this->quote . $this->from[0]['table'] . $this->quote;
								
								if (strcmp($this->from[0]['table'], $this->from[0]['abrev']) != 0)
									$this->sql .= ' AS ' . $this->quote . $this->from[0]['abrev'] . $this->quote;
							}
						else
							die("'DELETE' query must have one table referenced.");
							
						//Where
						if (isset($this->where[0]))
							{
								$this->sql .= ' WHERE ';
								for($i = 0; $i <= $this->whereCount; $i++)
									{
										if (isset($this->whereBrackets[$i]['begin']) && $this->whereBrackets[$i]['begin'] === true)
											$this->sql .= '(';
											
										$this->sql .= $this->where[$i];
										
										if (isset($this->whereBrackets[$i]['end']) && $this->whereBrackets[$i]['end'] === true)
											$this->sql .= ')';
										
										if (isset($this->whereOper[$i]))
											$this->sql .= ' ' . $this->whereOper[$i] . ' ';
									}
							}
							
						//Limit
						if (isset($this->limit))
							{
								$this->sql .= ' LIMIT ' . $this->limit;
							}
							
						//Offset
						if (isset($this->offset))
							{
								$this->sql .= ' OFFSET ' . $this->offset;
							}
					}
					
				return $this;
			}
		
		//====================================================
		// Other Functions
		//====================================================
		
		public function setAllFalse()
			{
				//Set where
				$this->isWhere		= false;
				
				//Set from
				$this->isFrom 		= false;
				
				//Set type
				$this->isType 		= false;
				
				//Set group by
				$this->isGroupBy	= false;
				
				//Set having
				$this->isHaving		= false;
				
				//Set order by
				$this->isOrderBy	= false;
				
				//Set set
				$this->isSet		= false;
				
				//Set into
				$this->into			= false;
			}
			
		public function inTable($value)
			{
				foreach ($this->from as $table)
					{
						if (in_array($value, $table))
							return true;
					}
					
				return false;
			}
			
		public function inLogOper($value)
			{
				$count = count($this->logicOperators);
				
				for ($i = 0; $i < $count; $i++)
					{
						if (isset($this->logicOperators[strtoupper($value)]))
							return true;
					}
					
				return false;
			}
			
		public function checkOrderBy()
			{
				//If last order by has no order, set it before start new order by
				if (isset($this->orderBy[$this->orderByCount]) && strlen($this->orderBy[$this->orderByCount]) > 0 && (!strpos($this->orderBy[$this->orderByCount], "ASC") || !strpos($this->orderBy[$this->orderByCount], "DESC")))
					{
						$this->orderBy[$this->orderByCount] .= ' ASC';
						$this->orderByCount++;
					}
			}
	}
