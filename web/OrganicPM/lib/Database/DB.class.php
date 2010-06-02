<?php
	
/**
 * DB.class.php
 * 
 * Provide methods to acess database.
 *
 * @author BlackNRoll
 */
class DB
	{
	    /**
	     * Connection data
	     * 
	     * @var string
	     */
	    private $username;
		private $password;
		private $connectionString;
		
		/**
		 * Connection identifier
		 * 
		 * @var resource
		 */
		private $connection;
		
		/**
		 * Error String
		 * Holds the last erros message
		 * 
		 * @var string
		 */
	    private $error;
	    
	    /**
	     * Result from parse function
	     * 
	     * @var resource
	     */
	    private $result;
	    
	    /**
	     * Number of rows
	     * 
	     * @var int
	     */
	    private $numRows;
	
	    /**
	     * SQL Object
	     * Store the sql query
	     * 
	     * @var object
	     */
	    private $sql;
	    		       
	    /**
	     * Constructor
	     * 
	     * @param void
	     * @return void
	     */
	    function __construct()
	   		{
			    $this->username 		= DB_USERNAME;
				$this->password 		= DB_PASSWORD;
				$this->connectionString = DB_CONNECTION_STRING;
			    
			    $this->connect();
	    	}
	     
	    /**
	     * Connect with database
	     * 
	     * @param void
	     * @return boolean
	     */
	    public function connect()
		    {
			    $this->connection = oci_connect($this->username, $this->password, $this->connectionString);
				    
				    if(!$this->connection)
				    	{
				    		$this->setError('Falha ao conectar no banco.');
				    		return false;
				    	}
				    else
				    	return true;
		    }
		   
		/**
		 * Select the query type and execute it
		 * 
		 * @param void
		 * @return resource
		 */
		public function run()
			{
				$return = '';
				
				switch ($this->sql->type)
					{
						case 'SELECT':
							$return = $this->select();
							break;
						case 'DELETE':
							$return = $this->delete();
							break;
						case 'INSERT':
							$return = $this->insert();
							break;
						case 'UPDATE':
							$return = $this->update();
							break;
					}
					
				return $return;
			}
	     
	    /**
	     * Select query
	     * 
	     * @param void
	     * @return resource
	     */
	    private function select()
		    {
		    	//Efetua o comando de select
				$this->result = oci_parse($this->connection, $this->sql->getSql());

				if(oci_execute($this->result))
					{
						return $this->result;
					}
				else
					{
						$this->setError('Falha ao selecionar o(s) registro(s).');
						return false;
					}
		    }
	       
	    /**
	     * Delete query
	     * 
	     * @param void
	     * @return resource
	     */
	    private function delete()
		    {
		    	$this->result = oci_parse($this->connection, $this->sql->getSqlQuery());
					
				if(oci_execute($this->result))
					{
						return $this->result;
					}
				else
					{
						$this->setError('Falha ao deletar o(s) registro(s).');
						return false;
					}
		    }
	       
	    /**
	     * Insert query
	     * 
	     * @param void
	     * @return resource
	     */
	    private function insert()
		    {
		    	$this->result = oci_parse($this->connection, $this->sql->getSql());
				
				if(oci_execute($this->result))
					{
						return $this->result;
					}
				else
					{
						$this->setError('Falha ao inserir o(s) registro(s).');
						return false;
					}
		    }
	     
	    /**
	     * Update query
	     * 
	     * @param void
	     * @return resource
	     */
	    private function update()
		    {
		    	$this->result = oci_parse($this->connection, $this->sql->getSql());
				
				if(oci_execute($this->result))
					{
						return $this->result;
					}
				else
					{
						$this->setError('Falha ao atualizar o(s) registro(s).');
						return false;
					}
		    }
		    
		/**
		 * Fetch all rows to an array
		 * 
		 * @param void
		 * @return array
		 */
	    public function fetchAll($indexMode = 'assoc')
		    {
		    	$data = array();
		    	
		    	if (strcmp(strtolower($indexMode), "assoc") == 0)
					$this->numRows = oci_fetch_all($this->result, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
				else
					$this->numRows = oci_fetch_all($this->result, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_NUM);
					
				if($this->numRows !== false)
					{
						return $data;
					}
				else
					{
						$this->setError('Falha ao recuperar registros.');
						return false;
					}
		    }
		    
		public function fetchRow()
			{
				$fetch = oci_fetch_array($this->result);
								
				if($fetch !== false)
					return $fetch;
				else
					{
						$this->setError('Falha ao recuperar registro.');
			    		return false;
					}
			}
			
		/**
		 * Fetch one field of given row
		 * @param $row
		 * @param $field
		 */
		function fetchField($field)
			{
				$fetch = oci_fetch($this->result);
				
				if ($fetch !== false)
					{
						$return = oci_result($this->result, $field);
						
						if ($return !== false)
							return $return;
						else
							{
								$this->setError('Falha ao recuperar campo.');
					    		return false;
							}
					}
				else
					{
						$this->setError('Falha ao buscar resultados.');
			    		return false;
					}
			}
		    
		/**
		 * Get the number of resulted rows
		 * 
		 * @param void
		 * @return int
		 */
		public function getNumRows()
			{					
				$this->numRows = oci_num_rows($this->result);
						
				if($this->numRows !== false)
					return $this->numRows;
				else
					{
						$this->setError('Falha ao recuperar número de registros.');
						return false;
					}
			}
	     
	    //Desconecta do banco de dados
	    /**
	     * Close the current connection
	     * 
	     * @param void
	     * @return boolean
	     */
	    public function close()
		    {
		    	return oci_close($this->connection);
		    }
		    
		/**
		 * Error controller
		 * 
		 * @param string $message
		 * @return void
		 */
		private function setError($message)
			{
				$this->error = $message;
			}
			
		/**
		 * Get the last error
		 * 
		 * @param void
		 * @return string
		 */
		public function getError()
			{
				return $this->error;
			}
			
		/**
		 * Set the sql object
		 * 
		 * @param object $sql
		 * @return void
		 */
		public function setSql($sql)
			{
				$this->sql = $sql;
			}
	};
	
/* Create database connection */
$db = new DB();