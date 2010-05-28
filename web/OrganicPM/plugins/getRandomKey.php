<?php


function getRandomKey()
  	{
    	$length = 40;
  		
    	$chars 		= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    	$randstring = '';
    	$maxvalue 	= strlen($chars)-1;
    	
    	for($i = 0; $i < $length; $i++)
    		{
      			$randstring .= substr($chars,rand(0,$maxvalue),1);
    		}
    	
    	return md5($randstring.time());
  	}