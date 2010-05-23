<?php

/**
 * validateemail.function.php
 *
 * E-mail validation - returns true if
 * email is valid or false if it isn't.
 *
 */
function validateEmail($email)
	{
		if (!preg_match("/^[[:alnum:]][a-z0-9_.-]*@[a-z0-9.-]+\.[a-z]{2,4}$/i", $email))
			{
				return false; // invalid email
			}
		else
			{
				return true; // valid email
			}
	}
