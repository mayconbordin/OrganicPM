<?php

/**
 * Include Files
 */
include_once ROOT.'lib/LoginSystem/User.class.php';
include_once ROOT.'lib/LoginSystem/Mailer.class.php';
include_once ROOT.'lib/Form/Form.class.php';
include_once ROOT.'lib/LoginSystem/ChallengeGenerator.class.php';
include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'plugins/getIPAddress.function.php';
include_once ROOT.'plugins/validateEmail.function.php';
include_once ROOT.'plugins/validatePassword.function.php';
include_once ROOT.'plugins/validateUsername.function.php';

/**
 * Session.class.php
 * 
 * The Session class is meant to simplify the task of keeping
 * track of logged in users and also guests.
 * Strongly based on the "PHP Login System with Admin Features"
 * by Jpmaster77 a.k.a. The Grandmaster of C++ (GMC).
 *
 * @author BlackNRoll
 * @version 1.0
 */
class Session extends Transactions
	{
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
   		
	   	/**
	   	 * True if user is logged in, false otherwise
	   	 * @var boolean
	   	 */
		public  $loggedIn;
		
		/**
		 * The page url current being viewed
		 * @var string
		 */
	   	public  $url;
	   	
	   	/**
	   	 * Last recorded site page viewed
	   	 * @var string
	   	 */
	   	public  $referrer;
	   	
	   	public  $user;
	   	public  $form;	   
	   	public  $chap;	
	   	
	   	private $challenge;
	   	private $lastAttempt;
	   	private $attemptError;
	   	private $timeout;
			   	
	   	//==================================================================
   		// Accessors =======================================================
   		//==================================================================
   		
	   	private function setForm()
	   		{
	   			$this->form = new Form();
	   		}
	   		
	   	public function getForm()
	   		{
	   			return $this->form;
	   		}
	   		
	   	public function getLastAttempt()
	   		{
	   			return $this->lastAttempt;
	   		}
	   	
	   	
	   	//==================================================================
   		// Magic Methods ===================================================
   		//==================================================================
	
	   	/**
	   	 * Class constructor
	   	 */
	   	function __construct()
		   	{
		   		global $user, $mailer;
		   		
		    	$this->user 	= $user;
		    	$this->mailer 	= $mailer;
		    	$this->timeout 	= false;
		   		$this->user->setLastActivity(time());
						   		
		      	$this->startSession();
		   	}
		   	
		   	
		//==================================================================
   		// Methods =========================================================
   		//==================================================================
	
	   	/**
	   	 * startSession - Performs all the actions necessary to 
	   	 * initialize this session object. Tries to determine if the
	   	 * the user has logged in already, and sets the variables 
	   	 * accordingly. Also takes advantage of this page load to
	   	 * update the active visitors tables.
	   	 */
	   	function startSession()
	   		{
	   			//Tell PHP to start the session
	   			session_start();
	   			
	   			//Create the form object
	   			$this->setForm();

	   			//Start an instance of the class
		        $this->chap	= new ChallengeGenerator();
	
		      	// Determine if user is logged in
		      	$this->loggedIn = $this->checkLogin();
		
		      	/**
		      	 * Set guest value to users not logged in, and update
		      	 * active guests table accordingly.
		      	 */
		      	if(!$this->loggedIn)
		      		{
		      			$_SESSION['username'] = GUEST_NAME;
		      			
		      			$this->user->setUsername(GUEST_NAME);
		         		$this->user->setLevel(GUEST_LEVEL);
		         		
		         		if(!isset($_POST['challenge']))
		         			{
				         		//Generate an authentication key
				         		$this->chap->setChallengeVar();
		         			}
		         			
		         		if($this->timeout)
		         			{
		         				$_SESSION['value_array'] = $_POST;
         						$_SESSION['error_array'] = $this->form->getErrorArray();
		         			}
		      		}
		      	// Update users last active timestamp
		      	else
		      		{
		      			$this->user->recordLastActivity();
		      		}
		      				      
		      	// Set referrer page
		      	if(isset($_SESSION['url']))
			      	{
			         	$this->referrer = $_SESSION['url'];
			      	}
				else
					{
			         	$this->referrer = "/";
			      	}
		
		      	// Set current url
		      	$this->url = $_SESSION['url'] = $_SERVER['PHP_SELF'];
	   		}
	
	   	/**
	   	 * checkLogin - Checks if the user has already previously
	   	 * logged in, and a session with the user has already been
	   	 * established. Also checks to see if user has been remembered.
	   	 * If so, the database is queried to make sure of the user's 
	   	 * authenticity. Returns true if the user has logged in.
	   	 */
	   	function checkLogin()
	   		{	      
	   			$remember = false;
	   			
	   			// Check if user has been remembered
	   			if(isset($_COOKIE[COOKIE_REMEMBER_NAME]))
	      			{      				
	      				//Decode cookie
	      				$cookie = base64_decode($_COOKIE[COOKIE_REMEMBER_NAME]);
	      				
	      				//Unserialize cookie
	      				list($_SESSION['username'], $_SESSION['userkey']) = @unserialize($cookie);
	      				
	      				//Set remeber to true
	      				$remember = true;
	      			}
	      			
	      		// Username and userkey have been set and not guest
	      		if(isset($_SESSION['username']) && isset($_SESSION['userkey']) && strcmp($_SESSION['username'], GUEST_NAME) != 0)
	      			{
	         			$this->user->setUsername($_SESSION['username']);
	      				$this->user->setKey($_SESSION['userkey']);
	      					      				
	         			// Confirm that username and userkey are valid
	         			if($this->user->confirmUserKey() != 0)
	         				{
	            				// Variables are incorrect, user not logged in
	            				unset($_SESSION['username']);
	            				unset($_SESSION['userkey']);
	            				return false;
	         				}
	         				
	         			// Check for user session timeout	
	      				$field = "general";
			      		if($this->user->timeout() && $remember === false)
			   				{
			   					$this->form->setError($field, "You have been inactive for more than ".(USER_TIMEOUT/60)." minutes.");
			      				
			   					// Unset the session vars
	            				unset($_SESSION['username']);
	            				unset($_SESSION['userkey']);
	            				
	            				$this->timeout = true;
	            				
	            				return false;
			   				}
	
	         			// User is logged in, set class variables
	         			$this->user->getUserInfo();
	         			
	         			return true;
	      			}
	      		// User not logged in
	      		else
	      			{
	      				return false;
	      			}
	   		}
	
	   	/**
	   	 * CHAP Login - The user has submitted his username and password
	   	 * through the login form, this function checks the authenticity
	   	 * of that information in the database and creates the session.
	   	 * Effectively logging in the user if all goes well.
	   	 * 
	   	 * The password is ignored, what matters is the challenge, it stores
	   	 * an sha-1 encoded hash, made with the sum of the sha-1 password
	   	 * plus an generated string of 40 chars.
	   	 * 
	   	 * Note: the password field is cleaned before being sent to the server.
	   	 * 
	   	 * For more info: http://en.wikipedia.org/wiki/Challenge-handshake_authentication_protocol
	   	 * 
	   	 * @param $subuser
	   	 * @param $subpass
	   	 * @param $challenge
	   	 * @param $subremember
	   	 */
	   	function login($subuser, $subpass, $challenge, $subremember)
	   		{	
	   			$subuser = trim($subuser);
	   				
	   			// Set the login and challenge code
	      		$this->user->setUsername($subuser);
	      		$this->challenge = $challenge;
	   				
	   			// Check if number of attempts have been exceeded
	   			$field = "general";
	   			$this->checkLoginAttempts();
	      		if($this->attemptError == 1)
	   				{
	         			//IP attempts have been exeeded
	   					$this->form->setError($field, "Number of attempts exceeded (Wait ".round(((($this->lastAttempt+BLOCK_TIME) - time())/60))." minutes to try again)");
	      				return false;
	   				}
	   			elseif($this->attemptError == 2)
	   				{
	         			//Attempts through an username have been exceeded
	   					$this->form->setError($field, "Username temporarily blocked (Wait ".round(((($this->lastAttempt+BLOCK_TIME) - time())/60))." minutes to try again)");
	      				return false;
	   				}
	   			elseif($this->attemptError == 3)
	   				{
	         			//Both IP and username have exeeded attempt limit
	   					$this->form->setError($field, "Username and IP temporarily blocked (Wait ".round(((($this->lastAttempt+BLOCK_TIME) - time())/60))." minutes to try again)");
	      				return false;
	   				}

	      		// Username error checking
	      		$field = "user";  //Use field name for username
	      		if(!$subuser || strlen($subuser) == 0)
	      			{
	         			$this->form->setError($field, "* Username not entered");
	      			}
	      		else
	      			{
	         			// Check if username is not alphanumeric
	         			if(!validateUsername($subuser))
	         				{
	            				$this->form->setError($field, "* Username not alphanumeric");
	         				}
	      			}
	      			
	      		// Return if form errors exist
	      		if($this->form->numErrors > 0)
	      			{
	         			$this->recordLoginAttempt("failed");
	      				return false;
	      			}
	
	      		// Check if username exists and if the challenge code is correct
	      		$result = $this->auth();
	      			
	      		// Check error codes
	      		if($result == 1)
	      			{
	         			$field = "user";
	         			$this->form->setError($field, "* Username not found");
	      			}
	      		elseif($result == 2)
	      			{
	         			$field = "pass";
	         			$this->form->setError($field, "* Invalid password");
	      			}
	      
	      		// Return if form errors exist
	      		if($this->form->numErrors > 0)
	      			{
	         			$this->recordLoginAttempt("failed");
	      				return false;
	      			}
	
	      		// Username and password correct, register session variables
	      		$this->user->getUserInfo();
	      		$_SESSION['username']	= $this->user->getUsername();
	      		$_SESSION['userkey']	= $this->generateRandKey();
	      		$this->user->setKey($_SESSION['userkey']);
	      		
	      		// Insert userkey into database and update active users table
	      		$this->user->recordKey();
	      		$this->user->recordLastActivity();
	      		$this->recordLoginAttempt("sucess");
	      		
	      		/**
	      		 * This is the cool part: the user has requested that we remember that
	      		 * he's logged in, so we set two cookies. One to hold his username,
	      		 * and one to hold his random value userkey. It expires by the time
	      		 * specified in constants.php. Now, next time he comes to our site, we will
	      		 * log him in automatically, but only if he didn't log out before he left.
	      		 */
	      		if($subremember)
	      			{
	         			//Serialize the cookie
	         			$cookie = serialize(array($_SESSION['username'], $this->user->getKey()));
	         			
	         			//Encode the cookie
	         			$cookie = base64_encode($cookie);
	         			
	         			//Set the cookie
	         			setcookie(COOKIE_REMEMBER_NAME, $cookie, time()+COOKIE_EXPIRE, COOKIE_PATH);
	      			}
	
	      		// Login completed successfully
	      		return true;
	   		}
	   		
	   	/**
	   	 * User authentication - Check if username exists and if it's activated.
	   	 * Also authenticate the challenge code generated, part of the CHAP login
	   	 * system.
	   	 */
	   	private function auth()
	   		{
	   			//Get SHA-1 encoded password in database
	   			$password = $this->user->getPassword(true);
	   			
	   			//Check if user exist and if he's active
	   			if(!$password || $this->user->isInactive() || !$this->user->usernameTaken())
	   				{;
	   					return 1; //Username don't exist
	   				}
	   				
	   			//Recover the generated challenge code
	   			$challenge = $this->chap->getChallengeVar("challenge");
	   			
	   			//Encode the password + challenge code through SHA-1
	   			$challenge = sha1($password.$challenge);
	   			
	   			//Check if the codes match
	   			if (strcmp($this->challenge, $challenge) == 0)
	   				return 0; // Sucess
	   			else
	   				return 2; // Wrong password or challenge
	   		}
	
	   	/**
	     * logout - Gets called when the user wants to be logged out of the
	     * website. It deletes any cookies that were stored on the users
	     * computer as a result of him wanting to be remembered, and also
	     * unsets session variables and demotes his user level to guest.
	     */
	   	function logout()
	   		{	      		
	      		/**
	      		 * Delete cookies - the time must be in the past,
	      		 * so just negate what you added when creating the
	      		 * cookie.
	      		 */
	   			if(isset($_COOKIE[COOKIE_REMEMBER_NAME]))
	      			{
	         			setcookie(COOKIE_REMEMBER_NAME, "", time()-COOKIE_EXPIRE, COOKIE_PATH);
	      			}
	
	      		// Unset PHP session variables
	      		unset($_SESSION['username']);
	      		unset($_SESSION['userkey']);
	
	      		// Reflect fact that user has logged out
	      		$this->loggedIn = false;
	      
	      		// Set user level to guest
	      		$this->user->setUsername(GUEST_NAME);
	      		$this->user->setLevel(GUEST_LEVEL);
	   		}
	
	   	/**
	     * register - Gets called when the user has just submitted the
	     * registration form. Determines if there were any errors with
	     * the entry fields, if so, it records the errors and returns
	     * 1. If no errors were found, it registers the new user and
	     * returns 0. Returns 2 if registration failed.
	     */
	   	function register($subuser, $subpass, $subemail)
	   		{
	      		// Username error checking
	      		$subuser = trim($subuser);
	      		$subuser = stripslashes($subuser);
	   			$this->user->setUsername($subuser);
	   			
	      		$field = "user";  //Use field name for username
	      		if(!$subuser || strlen($subuser) == 0)
	      			{
	         			$this->form->setError($field, "* Username not entered");
	      			}
	      		else
	      			{
	         			// Spruce up username, check length
	         			if(strlen($subuser) < 5)
	         				{
	            				$this->form->setError($field, "* Username below 5 characters");
	         				}
	         			elseif(strlen($subuser) > 30)
	         				{
	            				$this->form->setError($field, "* Username above 30 characters");
	         				}
	         			// Check if username is not alphanumeric
	         			elseif(!validateUsername($subuser))
	         				{
	            				$this->form->setError($field, "* Username not alphanumeric");
	         				}
	         			// Check if username is reserved
	         			elseif(strcasecmp($subuser, GUEST_NAME) == 0)
	         				{
	            				$this->form->setError($field, "* Username reserved word");
	         				}
	         			// Check if username is already in use
	         			elseif($this->user->usernameTaken())
		         			{
		         				$this->form->setError($field, "* Username already in use");
		         			}
	      			}
	
	      		// Password error checking
	      		$field = "pass";  //Use field name for password
	      		if(!$subpass)
	      			{
	         			$this->form->setError($field, "* Password not entered");
	      			}
	      		else
	      			{
	         			// Spruce up password and check length
	         			if(strlen($subpass) < 4)
	         				{
	            				$this->form->setError($field, "* Password too short");
	         				}
	         			// Check if password is not alphanumeric
	         			elseif(!validatePassword($subpass = trim($subpass)))
	         				{
	            				$this->form->setError($field, "* Password not alphanumeric");
	         				}
	         			/**
	         			 * Note: I trimmed the password only after I checked the length
	         			 * because if you fill the password field up with spaces
	         			 * it looks like a lot more characters than 4, so it looks
	         			 * kind of stupid to report "password too short".
	         			 */
	      			}
	      
	      		// Email error checking
	      		$field = "email";  //Use field name for email
	      		if(!$subemail || strlen($subemail = trim($subemail)) == 0)
	      			{
	         			$this->form->setError($field, "* Email not entered");
	      			}
	      		else
	      			{
	         			// Check if valid email address
	         			if(!validateEmail($subemail))
	         				{
	            				$this->form->setError($field, "* Email invalid");
	         				}
	         			$subemail = stripslashes($subemail);
	      			}
	
	      		// Errors exist, have user correct them
	      		if($this->form->numErrors > 0)
	      			{
	         			return 1;  //Errors with form
	      			}
	      		// No errors, add the new account to the database
	      		else
	      			{
	         			$this->user->setPassword($subpass);
	      				$this->user->setEmail($subemail);
	      				
	      				if($this->user->addNewUser())
	         				{
	            				if(EMAIL_WELCOME)
	            					{
	               						$this->mailer->sendWelcome($subuser,$subemail,$subpass);
	            					}
	            				return 0;  //New user added succesfully
	         				}
	         			else
	         				{
	            				return 2;  //Registration attempt failed
	         				}
	      			}
	   		}
	   
	   	/**
	   	 * editAccount - Attempts to edit the user's account information
	   	 * including the password, which it first makes sure is correct
	   	 * if entered, if so and the new password is in the right
	   	 * format, the change is made. All other fields are changed
	   	 * automatically.
	   	 */
	   	function editAccount($subcurpass, $subnewpass, $subemail)
	   		{
	      		// New password entered
	      		if($subnewpass)
	      			{
	         			// Current Password error checking
	         			$field = "curpass";  //Use field name for current password
	         			if(!$subcurpass)
	         				{
	            				$this->form->setError($field, "* Current Password not entered");
	         				}
	         			else
	         				{
	            				// Check if password too short or is not alphanumeric
	            				$subcurpass = stripslashes($subcurpass);
	            				if(strlen($subcurpass) < 4 || !validatePassword($subcurpass = trim($subcurpass)))
	            					{
	               						$this->form->setError($field, "* Current Password incorrect");
	            					}
	            					
	            				$this->user->setPassword($subcurpass);
	            					
	            				// Password entered is incorrect
	            				if($this->user->confirmUserPass() != 0)
	            					{
	               						$this->form->setError($field, "* Current Password incorrect");
	            					}
	         				}
	         
	         			// New Password error checking
	         			$field = "newpass";  //Use field name for new password
	         			
	         			// Spruce up password and check length
	         			$subpass = stripslashes($subnewpass);
	         			if(strlen($subnewpass) < 4)
	         				{
	            				$this->form->setError($field, "* New Password too short");
	         				}
	         			// Check if password is not alphanumeric
	         			elseif(!validatePassword($subnewpass = trim($subnewpass)))
	         				{
	            				$this->form->setError($field, "* New Password not alphanumeric");
	         				}
	      			}
	      		// Change password attempted
	      		elseif($subcurpass)
	      			{
	         			// New Password error reporting
	         			$field = "newpass";  //Use field name for new password
	         			$this->form->setError($field, "* New Password not entered");
	      			}
	      
	      		// Email error checking
	      		$field = "email";  //Use field name for email
	      		if($subemail && strlen($subemail = trim($subemail)) > 0)
	      			{
	         			// Check if valid email address
	         			if(!validateEmail($subemail))
	         				{
	            				$this->form->setError($field, "* Email invalid");
	         				}
	         			$subemail = stripslashes($subemail);	         			
	      			}
	      
	      		// Errors exist, have user correct them
	      		if($this->form->numErrors > 0)
	      			{
	         			return false;  //Errors with form
	      			}
	      
	      		// Update password since there were no errors
	      		if($subcurpass && $subnewpass)
	      			{
	         			$this->user->setPassword($subnewpass);
	      				$this->user->recordPassword();
	      			}
	      
	      		// Change Email
	      		if($subemail)
	      			{
	         			$this->user->setEmail($subemail);
	      				$this->user->recordEmail();
	      			}
	      
	      		// Success!
	      		return true;
	   		}
	   		
	   	/**
	   	 * Register de attempt to login and if
	   	 * it was successful or not.
	   	 * Status will be 'sucess' or 'failed'
	   	 * 
	   	 * @var string $status
	   	 */
	   	public function recordLoginAttempt($status)
	   		{
	   			$ip 	= getIPAddress();
	   			$time	= time();
				
				$this
					->insert()
						->into()
							->{TBL_LOGIN_ATTEMPTS}()
						->values($ip, $time, $this->user->getUsername(), $status);
      				 
      			return $this->run();
	   		}
	   		
	   	/*
	   	 * Check Login Attempts - check if an IP have
	   	 * exceeded the number of login attempts. If 
	   	 * have, then return true.
	   	 */
	   	public function checkLoginAttempts()
	   		{
	   			$ip 	= getIPAddress();
	   			$now	= time();
	   			$max	= $now - ATTEMPT_INTERVAL;
	   			
	   			// Checking for IP exceeds
				$this
					->select()
						->count()->as()->loginAttempts()
						->ten_log_data()
					->from()
						->{TBL_LOGIN_ATTEMPTS}()
					->where()
						->ten_log_ip()->equ()->val($ip)
					->and()
						->ten_log_data()->geq()->val($max)
					->and()
						->status()->equ()->val("failed");
   				
				$this->run();
				
				// Set the las attempt date
				$this->lastAttempt = $this->db->fetchField("ten_log_data");
				
				// Checking IP errors
				$ipError = 0;
				
				// Set an error if limit reached
				if($this->db->fetchField("loginAttempts") >= MAX_IP_ATTEMPTS)
					$ipError = 1;
					
					
				// Checking for Username exceeds
				$this
					->select()
						->count()->as()->loginAttempts()
						->ten_log_data()
					->from()
						->{TBL_LOGIN_ATTEMPTS}()
					->where()
						->nome_usuario()->equ()->val($this->user->getUsername())
					->and()
						->ten_log_data()->geq()->val($max)
					->and()
						->status()->equ()->val("failed");
   				
				$this->run();
				
				// Checking User errors
				$userError = 0;
				
				// Set error if limit reached and block username
				if($this->db->fetchField("loginAttempts") >= MAX_USERNAME_ATTEMPTS && $this->user->usernameTaken())
					{
						$userError = 1;
						$this->user->changeStatus("blocked");
						$this->lastAttempt = $this->db->fetchField("ten_log_data");
					}
				// If the limit haven't been reached an user was block, activate him
				elseif ($this->user->isBlocked())
					$this->user->changeStatus("active");
					
				if ($ipError == 1 && $userError == 0)
					$this->attemptError = 1;
				elseif ($ipError == 0 && $userError == 1)
					$this->attemptError = 2;
				elseif ($ipError == 1 && $userError == 1)
					$this->attemptError = 3;
	   		}
	   
	   	/**
	   	 * isAdmin - Returns true if currently logged in user is
	   	 * an administrator, false otherwise.
	  	 */
	   	function isAdmin()
	   		{
	      		return ($this->user->getLevel() == ADMIN_LEVEL || $this->user->getUsername()  == ADMIN_NAME);
	   		}
	   
	   	/**
	     * generateRandID - Generates a string made up of randomized
	     * letters (lower and upper case) and digits and returns
	     * the md5 hash of it to be used as a userkey.
	     */
	   	function generateRandKey()
	   		{
	      		return md5($this->generateRandStr(16));
	   		}
	   
	   	/**
	     * generateRandStr - Generates a string made up of randomized
	     * letters (lower and upper case) and digits, the length
	     * is a specified parameter.
	     */
	   	function generateRandStr($length)
	   		{
	      		$randstr = "";
	      		for($i=0; $i<$length; $i++)
	      			{
	         			$randnum = mt_rand(0,61);
	         			if($randnum < 10)
	         				{
	            				$randstr .= chr($randnum+48);
	         				}
	         			elseif($randnum < 36)
	         				{
	            				$randstr .= chr($randnum+55);
	         				}
	         			else
	         				{
	            				$randstr .= chr($randnum+61);
	         				}
	      			}
	      		return $randstr;
	   		}

	};
//==================================================================
	
/**
 * Create an instance of Session and Form
 * 
 * @var object $session
 * @var object $form
 */
$session	= new Session();
$form		= $session->getForm();
