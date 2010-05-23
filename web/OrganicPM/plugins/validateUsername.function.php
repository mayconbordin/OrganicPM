<?php

/**
 * validateusername.function.php
 *
 * Username validation - returns true if
 * username is valid or false if it isn't.
 *
 */
function validateUsername($username)
	{
		if (!preg_match('/^[A-Za-z0-9_.\-)\]]+$/', $username))
			{
				return false; // username inválido
			}
		else
			{
				return true; // username válido
			}
	}
