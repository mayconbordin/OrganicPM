<?php

include ROOT.'plugins/checkDateFormat.function.php';

function compareDates($startDate, $endDate)
	{
		if (checkDateFormat($startDate) === false || checkDateFormat($endDate) === false)
			{
				return false;
			}
		
		//Start date
		$startDate = split('/', $startDate);
		$startTimestamp = mktime(0, 0, 0, $startDate[1], $startDate[0], $startDate[2]);
		
		//End date
		$endDate = split('/', $endDate);
		$endTimestamp = mktime(0, 0, 0, $endDate[1], $endDate[0], $endDate[2]);
				
		if ($startTimestamp >= $endTimestamp)
			return '>=';
		else
			return '<';
	}