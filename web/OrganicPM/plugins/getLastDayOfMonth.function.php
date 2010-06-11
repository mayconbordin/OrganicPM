<?php

function getLastDayOfMonth($month, $year)
	{
		return idate('d', mktime(0, 0, 0, ($month + 1), 0, $year));
	}