<?php

/**
 * ChallengeGenerator.class.php
 * 
 * Challenge Generator Class - class to generate random seeds
 * for an CHAP Login System.
 * 
 * Source: http://www.devarticles.com/c/a/JavaScript/Building-a-CHAP-Login-System-An-ObjectOriented-Approach/
 * 
 * @author Alejandro Gervasio
 * 
 */
class ChallengeGenerator
	{
  		/**
  		 * Constructor
  		 * 
  		 * @param boolean $clearSession
  		 */
  		public function __construct($clearSession = false)
  			{
				if($clearSession)
					{
	  					$this->clearVars();
					}
				
				if(!session_id())
					session_start();
  			}
  			
		/**
		 * CleanVars - clean the session
		 */
		public function clearVars()
			{
				session_start();
				$_SESSION = array(); 			 
				session_destroy();
				session_regenerate_id();
			}
		
		/**
		 * Generate the challenge string
		 * 
		 * @param string $name
		 */
  		public function setChallengeVar($name = 'challenge')
  			{
    			if(!is_string($name)||!$name)
    				{
      					return false;
    				}
    			// register session variable
    			$_SESSION[$name] = $this->getRandomString();
  			}
  			
  		/**
  		 * Get the challenge string
  		 * @param string $name
  		 */
  		public function getChallengeVar($name)
  			{
    			if(!isset($_SESSION[$name]))
    				{
      					return false;
    				}
    			return $_SESSION[$name];
  			}
  		
  		/**
  		 * Delete the Challenge string
  		 * 
  		 * @param string $name
  		 */
  		function deleteChallengeVar($name)
  			{
            	if(!isset($_SESSION[$name]))
            		{
						return false;
    				}
            	unset($_SESSION[$name]);
  			}
  			
  		/**
  		 * Generate an random string
  		 * 
  		 * @param int $length
  		 */
  		private function getRandomString($length = 40)
  			{
    			if(!is_int($length) || $length < 1)
    				{
      					return false;
    				}
    			
    			$chars 		= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    			$randstring = '';
    			$maxvalue 	= strlen($chars)-1;
    			
    			for($i = 0; $i < $length; $i++)
    				{
      					$randstring .= substr($chars,rand(0,$maxvalue),1);
    				}
    			return $randstring;
  			}
	};
//==================================================================
