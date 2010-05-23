<?php

/**
 * validatepassword.function.php
 *
 * Password Validation
 *
 */
function validatePassword($password)
	{
		if (!preg_match('/^[a-zA-Z0-9\_$!@#%&\.\?\-]*$/i', $password))
			{
				return false; // password inválido
			}
		else
			{
				return true; // password válido
			}
	}
