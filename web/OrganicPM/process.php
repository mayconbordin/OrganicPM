<?php
/**
 * Process.php
 * 
 * The Process class is meant to simplify the task of processing
 * user submitted forms, redirecting the user to the correct
 * pages if errors are found, or if form is successful, either
 * way. Also handles the logout procedure.
 *
 * @author Jpmaster77 a.k.a. The Grandmaster of C++ (GMC)
 * @version August 19, 2004
 */
include_once 'config/config.inc.php';
include_once 'lib/LoginSystem/Session.class.php';
include_once 'plugins/validateUsername.function.php';



class Process
	{
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
   		
		public $session;
		public $form;
		public $mailer;
		public $user;
		
		//==================================================================
   		// Magic Methods ===================================================
   		//==================================================================
   		
		/* Class constructor */
   		function __construct()
   			{
      			global $session, $form, $mailer, $user;
   				$this->session 	= $session;
   				$this->form		= $form;
   				$this->mailer	= $mailer;
   				$this->user		= $user;
      			   				
      			/* User submitted login form */
      			if(isset($_POST['sublogin']))
      				{
         				$this->procLogin();
      				}
      
      			/* User submitted registration form */
      			elseif(isset($_POST['subjoin']))
      				{
         				$this->procRegister();
      				}
      				
      			/* User submitted forgot password form */
      			elseif(isset($_POST['subforgot']))
      				{
         				$this->procForgotPass();
      				}
      
      			/* User submitted edit account form */
      			elseif(isset($_POST['subedit']))
      				{
         				$this->procEditAccount();
      				}
      			
      			/**
      			 * The only other reason user should be directed here
      			 * is if he wants to logout, which means user is
      			 * logged in currently.
      			 */
      			elseif($session->loggedIn)
      				{
         				$this->procLogout();
      				}
      			/**
      			 * Should not get here, which means user is viewing this page
      			 * by mistake and therefore is redirected.
      			 */
       			else
       				{
          				header("Location: login.php");
       				}
   			}
   			
   			
   		//==================================================================
   		// Methods =========================================================
   		//==================================================================

   		/**
   		 * procLogin - Processes the user submitted login form, if errors
   		 * are found, the user is redirected to correct the information,
   		 * if not, the user is effectively logged in to the system.
   		 */
   		function procLogin()
   			{
      			/* Login attempt */
      			$retval = $this->session->login($_POST['user'], $_POST['pass'], $_POST['challenge'], isset($_POST['remember']));
      
      			/* Login successful */
      			if($retval)
      				{
      					if ($this->session->isCandidato())
      						{
      							header("Location: candidato/");
      						}
      						
      					elseif ($this->session->isAdmin())
      						{
      							header("Location: admin/");
      						}
      					
      					elseif ($this->session->isFuncionario())
      						{
      							header("Location: candidato/");
      						}
      						
      					elseif ($this->session->isFuncionarioRH())
      						{
      							header("Location: admin/");
      						}
      					else
      						{
      							header("Location: index.php");
      						}
      				}
      
      			/* Login failed */
      			else
      				{
         				$_SESSION['value_array'] = $_POST;
         				$_SESSION['error_array'] = $this->form->getErrorArray();
         				header("Location: login.php");
      				}
   			}
   
   		/**
   		 * procLogout - Simply attempts to log the user out of the system
   		 * given that there is no logout form to process.
   		 */
   		function procLogout()
   			{
      			$retval = $this->session->logout();
      			header("Location: login.php");
   			}
   
   		/**
   		 * procRegister - Processes the user submitted registration form,
   		 * if errors are found, the user is redirected to correct the
   		 * information, if not, the user is effectively registered with
   		 * the system and an email is (optionally) sent to the newly
   		 * created user.
   		 */
   		function procRegister()
   			{
      			/* Convert username to all lowercase (by option) */
      			if(ALL_LOWERCASE)
      				{
         				$_POST['user'] = strtolower($_POST['user']);
      				}
      
      			/* Registration attempt */
      			$retval = $this->session->register($_POST['user'], $_POST['pass'], $_POST['email']);
      
      			/* Registration Successful */
      			if($retval == 0)
      				{
         				$_SESSION['reguname'] = $_POST['user'];
         				$_SESSION['regsuccess'] = true;
         				header("Location: ".$this->session->referrer);
      				}
      
      			/* Error found with form */
      			elseif($retval == 1)
      				{
         				$_SESSION['value_array'] = $_POST;
         				$_SESSION['error_array'] = $this->form->getErrorArray();
         				header("Location: ".$this->session->referrer);
      				}
      
      			/* Registration attempt failed */
      			elseif($retval == 2)
      				{
         				$_SESSION['reguname'] = $_POST['user'];
         				$_SESSION['regsuccess'] = false;
         				header("Location: ".$this->session->referrer);
      				}
   			}
   
   		/**
   		 * procForgotPass - Validates the given username then if
   		 * everything is fine, a new password is generated and
   		 * emailed to the address the user gave on sign up.
   		 */
   		function procForgotPass()
   			{
      			/* Username error checking */
      			$subuser = $_POST['user'];
      			$field = "user";  //Use field name for username
      			if(!$subuser || strlen($subuser = trim($subuser)) == 0)
      				{
         				$this->form->setError($field, "Usuário não informado");
      				}
      			else
      				{
         				/* Make sure username is in database */
         				$subuser = stripslashes($subuser);
         				if(strlen($subuser) < 5 || strlen($subuser) > 30 || !validateUsername($subuser) || (!$this->user->usernameTaken($subuser)))
         					{
            					$this->form->setError($field, "Usuário não existe");
         					}
      				}
      
      			/* Errors exist, have user correct them */
      			if($this->form->numErrors > 0)
      				{
         				$_SESSION['value_array'] = $_POST;
         				$_SESSION['error_array'] = $this->form->getErrorArray();
      				}
      				
      			/* Generate new password and email it to user */
      			else
      				{
         				/* Generate new password */
         				$newpass = $this->session->generateRandStr(8);
         
	         			/* Get email of user */
	         			$usrinf = $this->user->getUserInfo($subuser);
	        	 		$email  = $usrinf['email'];
         
         				/* Attempt to send the email with new password */
         				if($this->mailer->sendNewPass($subuser,$email,$newpass))
         					{
            					/* Email sent, update database */
            					$this->user->updateUserField($subuser, "password", md5($newpass));
            					$_SESSION['forgotpass'] = true;
         					}
         
         				/* Email failure, do not change password */
         				else
         					{
            					$_SESSION['forgotpass'] = false;
         					}
      				}
				header("Location: ".$this->session->referrer);
   			}
   
   		/**
   		 * procEditAccount - Attempts to edit the user's account
   		 * information, including the password, which must be verified
   		 * before a change is made.
   		 */
   		function procEditAccount()
   			{
     			/* Account edit attempt */
      			$retval = $this->session->editAccount($_POST['curpass'], $_POST['newpass'], $_POST['email']);

      			/* Account edit successful */
      			if($retval)
      				{
         				$_SESSION['useredit'] = true;
         				header("Location: ".$this->session->referrer);
      				}
      
      			/* Error found with form */
      			else
      				{
         				$_SESSION['value_array'] = $_POST;
         				$_SESSION['error_array'] = $this->form->getErrorArray();
         				header("Location: ".$this->session->referrer);
      				}
   			}
	};

/* Initialize process */
$process = new Process;

?>
