<?php

include_once '../plugins/checkDateFormat.function.php';

$date = "10/10/2009";

if (checkDateFormat($date))
	echo "Data válida";
else
	echo "Data inválida";