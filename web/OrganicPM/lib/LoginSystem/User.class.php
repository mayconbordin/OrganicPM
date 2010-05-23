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
   		
   		private $date;


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
						if($this->getField('user_password') == NULL)
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
		public function getEmail($fromDB = false)
			{				
				if($fromDB || !$this->email)
					{
						$this->getField('user_email');
					}
					
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
					 	->nome()->equ()->val($this->username);

				$this->run();
										
   				if(!$this->db->hasResults())
   					{
         				return 1; //Indicates username failure
      				}

      			/* Validate that password is correct */
      			if(strcmp($this->password, $this->db->fetchField('senha')) == 0)
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
   						->nome()->equ()->val($this->username);
					 
				$this->run();
				
      			if(!$this->db->hasResults())
      				{
      					return 1; //Indicates username failure
      				}
      				
      			/* Validate that userid is correct */
      			if(strcmp($this->key, $this->db->fetchField('chave')) == 0)
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
   						->nome()->equ()->val($this->username);
   				
				$this->run();

      			return $this->db->hasResults();
   			}
   
   		/**
   		 * addNewUser - Inserts the given (username, password, email)
   		 * info into the database. Appropriate user level is set.
   		 * Returns true on success, false otherwise.
   		 */
   		public function addNewUser()
   			{
   				$time = time();
      			$ulevel = USER_LEVEL;
				
				//Precisa receber o código da pessoa e não grava mais o email
      			
      			$this
      				->insert()
      					->into()
      						->{TBL_USERS}()
      					->values('null', $this->username, $this->password, $this->email, $ulevel, 0, 'pending', $time, $time);
      				 
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
   						->nome()->equ()->val($username);
   					 
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
   						->nome()->equ()->val($this->username);
   				
				$this->run();
				
				if(strcmp($this->db->fetchField('status'), 'active') == 0)
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
   						->nome()->equ()->val($this->username);
   				
				$this->run();
				
				if(strcmp($this->db->fetchField('status'), 'blocked') == 0)
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
   						->status()->equ()->val($status)
   					->where()
   						->nome()->equ()->val($this->username);
   					 
   				$this->run();
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
      					->nome()
      					->nivel()
      					->chave()
      				->from()
      					->{TBL_USERS}()
      				->where()
      					->nome()->equ()->val($this->username);
					 
				$this->run();
      			
      			/* Error occurred, return given name by default */
      			if(!$this->db->hasResults() || $this->db->getNumRows() < 1)
      				{
         				return NULL;
      				}
      			
      			$this->username = $this->db->fetchField("nome");
      			$this->key		= $this->db->fetchField("chave");
      			$this->level	= $this->db->fetchField("nivel");
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
						
						$this->numUsers = $this->db->fetchField('numUsers');
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
					 
				$this->run();
				
				return $this->sql->getSqlQuery();
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
      			
      			$this->numActiveUsers = $this->db->fetchField('numActiveUsers');   
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
   						->nome()->equ()->val($this->username)
   					->and()
   						->eq('('.$this->date.' - ultimo_acesso)')->leq()->val(USER_TIMEOUT);
   				
				$this->run();
								
				if (!$this->db->hasResults())
	      			return true;
	      		else
	      			return false;
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
   						->ultimo_acesso()->equ()->val($this->lastActivity)
   					->where()
   						->nome()->equ()->val($this->username);
   				
   				$this->run();
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
   						->chave()->equ()->val($this->key)
   					->where()
   						->nome()->equ()->val($this->username);
   					 
   				$this->run();
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
   						->senha()->equ()->val($this->password)
   					->where()
   						->nome()->equ()->val($this->username);
   					 
   				$this->run();
   			}
   			
   		private function getField($field)
   			{
   				$this
   					->select()
   						->$field()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->nome()->equ()->val($this->username);
					 
				$this->run();
      			
      			/* Error occurred, return given name by default */
      			if(!$this->db->hasResults() || $this->db->getNumRows() < 1)
      				{
         				return NULL;
      				}
      			
      			if(strcmp($field, 'nome') == 0)
      				$this->username = $this->db->fetchField("nome");
      			elseif(strcmp($field, 'chave') == 0)
      				$this->key		= $this->db->fetchField("chave");
      			elseif(strcmp($field, 'nivel') == 0)
      				$this->level	= $this->db->fetchField("nivel");
      			elseif(strcmp($field, 'senha') == 0)
      				$this->password	= $this->db->fetchField("senha");
      				
      			return true;
   			}
	};
//==================================================================
	
/**
 * Start an instance of the class
 * @var object $user 
 */
$user = new User();