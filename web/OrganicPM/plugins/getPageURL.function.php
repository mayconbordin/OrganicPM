<?php

/**
 * getpageurl.function.php
 *
 * Get the current page URL that is shown in the browser URL window
 * Source: http://www.webcheatsheet.com/php/get_current_page_url.php
 *
 */
function getPageURL()
	{
		$pageURL = 'http';
		
		if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on")
			{
				$pageURL .= "s";
			}
			
 		$pageURL .= "://";
 		
 		if (isset($_SERVER["SERVER_PORT"]) && $_SERVER["SERVER_PORT"] != "80")
 			{
  				$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
			}
		else
			{
				$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
			}
		return $pageURL;
	}
