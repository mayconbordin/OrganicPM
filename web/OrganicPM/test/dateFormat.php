<?php

include_once '../plugins/checkDateFormat.function.php';

$date = "10/10/2009";

if (checkDateFormat($date))
	echo "Data v�lida";
else
	echo "Data inv�lida";