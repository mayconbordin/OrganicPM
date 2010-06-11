<?php

/**
 * Include Files
 */
include_once ROOT.'lib/Database/Transactions.class.php';

/**
 * User.class.php
 * 
 * Class to access user's data and methods.
 * Strongly based on the "PHP Login System with Admin Features"
 * by Jpmaster77 a.k.a. The Grandmaster of C++ (GMC).
 *
 * @author BlackNRoll
 * @version 1.0
 */
class User extends Transactions
	{
   		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
		
		private $fields = array();
   		private $numActiveUsers;
   		private $numUsers;
   
   		private $id;
   		private $username;
   		private $password;
   		private $level;
   		private $email;
   		private $key;
   		private $status;
   		private $registerDate;
   		private $lastActivity;
   		
   		private $nivelAlias;
   		
   		private $date;
   		
   		private $pessoa;


   		//==================================================================
   		// Magic Methods ===================================================
   		//==================================================================
   		
   		/**
   		 *  Class constructor
   		 */
   		function __construct()
   			{
      			/**
      			 * Only query database to find out number of members
      			 * when getNumMembers() is called for the first time,
      			 * until then, default value set.
      			 */
      			$this->numUsers = -1;
      			
      			//Get the current time
      			$this->date = time();
   			}
   			
   			
   		//==================================================================
   		// Accessors =======================================================
   		//==================================================================
   		
		/**
		 * @return the $nivelAlias
		 */
		public function getNivelAlias() {
			return $this->nivelAlias;
		}
	
			/**
		 * @param $nivelAlias the $nivelAlias to set
		 */
		public function setNivelAlias($nivelAlias) {
			$this->nivelAlias = $nivelAlias;
		}
		/**
		 * @return the $fields
		 */
		public function getFields() {
			return $this->fields;
		}
	
			/**
		 * @return the $registerDate
		 */
		public function getRegisterDate() {
			return $this->registerDate;
		}
	
			/**
		 * @return the $date
		 */
		public function getDate() {
			return $this->date;
		}
	
			/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @param $fields the $fields to set
		 */
		public function setFields($fields) {
			$this->fields = $fields;
		}
	
			/**
		 * @param $registerDate the $registerDate to set
		 */
		public function setRegisterDate($registerDate) {
			$this->registerDate = $registerDate;
		}
	
			/**
		 * @param $date the $date to set
		 */
		public function setDate($date) {
			$this->date = $date;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
   			
   			
		/**
		 * @return the $numActiveUsers
		 */
		public function getNumActiveUsers()
			{
				return $this->numActiveUsers;
			}
	
		/**
		 * @param $numActiveUsers the $numActiveUsers to set
		 */
		public function setNumActiveUsers($numActiveUsers)
			{
				$this->numActiveUsers = $numActiveUsers;
			}

		/**
		 * @return the $id
		 */
		public function getId() {
			return $this->id;
		}
	
		/**
		 * @return the $username
		 */
		public function getUsername() {
			return $this->username;
		}
	
		/**
		 * Get Password
		 * 
		 * @param boolean $fromDB
		 * @return the $password
		 */
		public function getPassword($fromDB = false)
			{
				if($fromDB || !$this->password)
					{
						if($this->getPasswordField() === false)
							return false;
					}
					
				return $this->password;
			}
	
		/**
		 * @return the $level
		 */
		public function getLevel() {
			return $this->level;
		}
	
		/**
		 * Get E-mail
		 * 
		 * @param boolean $fromDB
		 * @return the $email
		 */
		public function getEmail()
			{				
				return $this->email;
			}
	
		/**
		 * @return the $key
		 */
		public function getKey() {
			return $this->key;
		}
	
		/**
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
		}
	
		/**
		 * @return the $lastActivity
		 */
		public function getLastActivity() {
			return $this->lastActivity;
		}
	
		/**
		 * @param $numUsers the $numUsers to set
		 */
		public function setNumUsers($numUsers) {
			$this->numUsers = $numUsers;
		}
	
		/**
		 * @param $id the $id to set
		 */
		public function setId($id) {
			$this->id = $id;
		}
	
		/**
		 * @param $username the $username to set
		 */
		public function setUsername($username) {
			$this->username = $username;
		}
	
		/**
		 * @param $password the $password to set
		 */
		public function setPassword($password) {
			$this->password = sha1($password);
		}
	
		/**
		 * @param $level the $level to set
		 */
		public function setLevel($level) {
			$this->level = $level;
		}
	
		/**
		 * @param $email the $email to set
		 */
		public function setEmail($email) {
			$this->email = $email;
		}
	
		/**
		 * @param $key the $key to set
		 */
		public function setKey($key) {
			$this->key = $key;
		}
	
		/**
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}
	
		/**
		 * @param $lastActivity the $lastActivity to set
		 */
		public function setLastActivity($lastActivity) {
			$this->lastActivity = $lastActivity;
		}
			
			
		//==================================================================
   		// Methods =========================================================
   		//==================================================================

   		/**
   		 * confirmUserPass - Checks whether or not the given
   		 * username is in the database, if so it checks if the
   		 * given password is the same password in the database
   		 * for that user. If the user doesn't exist or if the
   		 * passwords don't match up, it returns an error code
   		 * (1 or 2). On success it returns 0.
   		 */
		public function confirmUserPass()
   			{
				$this
					->select()
						->senha()
					->from()
						->{TBL_USERS}()
					 ->where()
					 	->nome()->equ()->string($this->username);

				$this->run();
				
				$pass = $this->db->fetchField('SENHA');
										
   				if($pass === false)
   					{
         				return 1; //Indicates username failure
      				}

      			/* Validate that password is correct */
      			if(strcmp($this->password, $pass) == 0)
      				{
         				if($this->isInactive())
         					return 1; // Username is not activated
         				else
      						return 0; //Success! Username and password confirmed
      				}
      			else
      				{
         				return 2; //Indicates password failure
      				}
   			}
   
   		/**
   		 * confirmUserID - Checks whether or not the given
   		 * username is in the database, if so it checks if the
   		 * given userid is the same userid in the database
   		 * for that user. If the user doesn't exist or if the
   		 * userids don't match up, it returns an error code
   		 * (1 or 2). On success it returns 0.
   		 */
   		public function confirmUserKey()
   			{
   				$this
   					->select()
   						->chave()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->string($this->username);
					 
				$this->run();
				
				$key = $this->db->fetchField('CHAVE');
				
      			if($key === false)
      				{
      					return 1; //Indicates username failure
      				}
      				
      			/* Validate that userid is correct */
      			if(strcmp($this->key, $key) == 0)
      				{
         				return 0; //Success! Username and userid confirmed
      				}
      			else
      				{
         				return 2; //Indicates userid invalid
      				}
   			}
   
   		/**
   		 * usernameTaken - Returns true if the username has
   		 * been taken by another user, false otherwise.
   		 */
   		public function usernameTaken()
   			{   				
   				$this
   					->select()
   						->nome()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->string($this->username);
   				
				$this->run();
				
				$username = $this->db->fetchField('NOME');
				
				if ($username === false)
					return false;
				else
					return true;
   			}
   
   		/**
   		 * addNewUser - Inserts the given (username, password, email)
   		 * info into the database. Appropriate user level is set.
   		 * Returns true on success, false otherwise.
   		 */
   		public function addNewUser()
   			{
   				$time = time();
				      			
      			$this
      				->insert()
      					->into()
      						->{TBL_USERS}()
      							->pessoa_cod()
      							->nome()
      							->senha()
      							->nivel()
      							->chave()
      							->status()
      							->data_registro()
      							->ultimo_acesso()
      						->number($this->pessoa->getCodigo())
      						->string($this->username)
      						->string($this->password)
      						->number($this->level)
      						->string($this->key)
      						->string($this->status)
      						->number($time)
      						->number($time);
      						      				 
				return $this->run();
   			}
   			
   		/**
   		 * updateUserField - Updates a field, specified by the field
   		 * parameter, in the user's row of the database.
   		 */
   		public function updateUserField($username, $field, $value)
   			{
   				$this
   					->update()
   						->{TBL_USERS}()
   					->set()
   						->$field()->equ()->val($value)
   					->where()
   						->nome()->equ()->string($username);
   					 
				return $this->run();
   			}
   			
   		/**
   		 * See if user is set to inactive
   		 */
   		public function isInactive()
   			{
   				$this
   					->select()
   						->status()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->string($this->username);
   				
				$this->run();
				
				if(strcmp($this->db->fetchField('STATUS'), 'active') == 0)
					return false;
				else
					return true;
   			}
   			
   		/**
   		 * Check if the user is blocked
   		 */
   		public function isBlocked()
			{
   				$this
   					->select()
   						->status()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->string($this->username);
   				
				$this->run();
				
				if(strcmp($this->db->fetchField('STATUS'), 'blocked') == 0)
					return true;
				else
					return false;
   			}
   			
   		/**
   		 * Alter the user status
   		 */
   		public function changeStatus($status)
   			{
   				$this
   					->update()
   						->{TBL_USERS}()
   					->set()
   						->status()->equ()->string($status)
   					->where()
   						->nome()->equ()->string($this->username);
   					 
   				return $this->run();
   			}
   		
   
   		/**
   		 * getUserInfo - Returns the result array from a mysql
   		 * query asking for all information stored regarding
   		 * the given username. If query fails, NULL is returned.
   		 */
   		public function getUserInfo()
   			{
      			$this
      				->select()
      					->pessoa_cod()
      					->nome()
      					->nivel()
      					->chave()
      				->from()
      					->{TBL_USERS}()
      				->where()
      					->nome()->equ()->string($this->username);
					 
				$this->run();
				
				$data = $this->db->fetchRow();
				
				$this->id		= $data["PESSOA_COD"];
				$this->username = $data["NOME"];
      			$this->key		= $data["CHAVE"];
      			$this->level	= $data["NIVEL"];
      			      			      			
      			/* Error occurred, return given name by default */
      			if($this->username === false || $this->key === false || $this->level === false)
      				{
         				return NULL;
      				}
   			}
   
   		/**
   		 * getNumUsers - Returns the number of signed-up users
   		 * of the website, banned members not included. The first
   		 * time the function is called on page load, the database
   		 * is queried, on subsequent calls, the stored result
   		 * is returned. This is to improve efficiency, effectively
   		 * not querying the database when no call is made.
   		 */
   		public function getNumUsers()
   			{
      			if($this->numUsers < 0)
      				{
         				$this
         					->select()
         						->count()->as()->numUsers()
         					->from()
         						->{TBL_USERS}();
      				
						$this->run();
						
						$this->numUsers = $this->db->fetchField('NUMUSERS');
      				}
      			
      			return $this->numUsers;
   			}
   		
		public function deleteUsers($ids)
			{
				$this
					->delete()
					->from()
						->{TBL_USERS}()
					->where()
						->pessoa_cod()->in()->vals($ids);
					 
				return $this->run();				
			}   
   		/**
   		 * calcNumActiveUsers - Finds out how many active users
   		 * are viewing site and sets class variable accordingly.
   		 */
   		public function calcNumActiveUsers()
   			{
      			$this
      				->select()
      					->count()->as()->numActiveUsers()
      				->from()
      					->{TBL_ACTIVE_USERS}();
   				
      			$this->run();
      			
      			$this->numActiveUsers = $this->db->fetchField('NUMACTIVEUSERS');   
   			}
   			
   		/**
   		 * timeout - return true if user is inactive for more
   		 * than the specified time.
   		 */
   		public function timeout()
   			{
   				$this
   					->select()
   						->nome()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->string($this->username)
   					->and()
   						->eq('('.$this->date.' - ultimo_acesso)')->leq()->number(USER_TIMEOUT);
   				
				$this->run();
							
				if ($this->db->fetchField('NOME') === false)
	      			return true;
	      		else
	      			return false;
   			}
   			
		public function getDataByPessoa()
   			{
      			$this
      				->select()
      					->u()->pessoa_cod()
      					->u()->nome()
      					->u()->chave()
      					->u()->nivel()
      					->n()->alias()
      					->u()->data_registro()
      				->from()
      					->{TBL_USERS}("u")
      					->{TBL_NIVEIS_USUARIO}("n")
      				->where()
      					->pessoa_cod()->equ()->string($this->pessoa->getCodigo())
      				->and()
      					->u()->nivel()->equ()->n()->nivel();
					 
				$this->run();
				
				$data = $this->db->fetchRow();
				
				$this->id			= $data["PESSOA_COD"];
				$this->username 	= $data["NOME"];
      			$this->key			= $data["CHAVE"];
      			$this->level		= $data["NIVEL"];
      			$this->nivelAlias 	= $data["ALIAS"];
      			$this->registerDate = $data["DATA_REGISTRO"];
      			      			      			
      			/* Error occurred, return given name by default */
      			if($this->username === false || $this->key === false || $this->level === false)
      				{
         				return NULL;
      				}
   			}
   			
   		/**
   		 * Record last activity
   		 */
		public function recordLastActivity()
   			{
   				$this
   					->update()
   						->{TBL_USERS}()
   					->set()
   						->ultimo_acesso()->equ()->string($this->lastActivity)
   					->where()
   						->nome()->equ()->string($this->username);
   				
   				return $this->run();
   			}
   			
   		/**
   		 * Record user key
   		 */
   		public function recordKey()
   			{
   				$this
   					->update()
   						->{TBL_USERS}()
   					->set()
   						->chave()->equ()->string($this->key)
   					->where()
   						->nome()->equ()->string($this->username);
   					 
   				return $this->run();
   			}
   			
   		/**
   		 * Record user password
   		 */
   		public function recordPassword()
   			{
   				$this
   					->update()
   						->{TBL_USERS}()
   					->set()
   						->senha()->equ()->string($this->password)
   					->where()
   						->nome()->equ()->string($this->username);
   					 
   				$this->run();
   			}
   			
   		/**
   		 * Get password from database
   		 */
   		public function getPasswordField()
   			{
   				$this
   					->select()
   						->senha()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->string($this->username);
   				
				$this->run();
				
				$this->password = $this->db->fetchField('SENHA');
							
				if ($this->password === false)
	      			return false;
	      		else
	      			return true;
   			}
   			
		public function listCadastrosPerDay()
			{
				$sql = "select to_char(to_date('1970-01-01','YYYY-MM-DD') + numtodsinterval(data_registro,'SECOND'), 'YYYY-MM-DD') as data, count(*) as total from rs_usuarios group by to_char(to_date('1970-01-01','YYYY-MM-DD') + numtodsinterval(data_registro,'SECOND'), 'YYYY-MM-DD')";
				
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
	};
//==================================================================
	
/**
 * Start an instance of the class
 * @var object $user 
 */
$user = new User();