<?php

function getNumDays($fromYear, $fromMonth, $fromDay, $toYear, $toMonth, $toDay)
	{
		
		$fromTime = mktime(0,0,0,$fromMonth,$fromDay,$fromYear);
		$toTime = mktime(0,0,0,$toMonth,$toDay,$toYear);
		
		if($fromTime > $toTime){print("\"From\" date has to be before \"To\" date");exit;}
		
		$howManyDays = ceil(($toTime-$fromTime)/60/60/24);
	
		$dayListing = array();
		
		for( $day=0; $day <= $howManyDays; $day++ ) {
		
			$dateYear = date("Y",mktime(0,0,0,$fromMonth,($fromDay+$day),$fromYear));
			$dateMonth = date("n",mktime(0,0,0,$fromMonth,($fromDay+$day),$fromYear));
			$dateDay = date("j",mktime(0,0,0,$fromMonth,($fromDay+$day),$fromYear));
			
			$dayListing[$day]['YEAR'] = $dateYear;
			$dayListing[$day]['MONTH'] = $dateMonth;
			$dayListing[$day]['DAY'] = $dateDay;
		}
		
		return $day;
	}