<?php

/**
 * Date Validation
 * 
 * Source: http://roshanbh.com.np/2008/05/date-format-validation-php.html
 * 
 * @param $date
 */
function checkDateFormat($date)
	{
		//match the format of the date
		if (preg_match ("/^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/", $date, $parts))
			{
				//check weather the date is valid of not
				if(checkdate($parts[2],$parts[1],$parts[3]))
					return true;
				else
					return false;
			}
		else
			return false;
	}