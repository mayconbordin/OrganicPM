<?php

require_once '..\lib\LoginSystem\User.class.php';

/**
 * User test case.
 */
class UserTest {
	
	private $user;
	
	function __construct()
		{
			$this->user = new User();
		}
		
 	function addNewUserTest()
 		{
 			
 			
 			$this->user->addNewUser();
 		}


}

