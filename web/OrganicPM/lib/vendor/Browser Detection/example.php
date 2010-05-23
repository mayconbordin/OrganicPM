<?php

//Include de class file
include 'Browser.php';

//Create a new instance of the class
$browser = new BrowserDetection();

//Prints the browser name and version
echo 'Browser: '.$browser->getBrowser().' ('.$browser->getVersion().')';

//Prints the operational system name
echo '<br />OS: '.$browser->getPlatform();
