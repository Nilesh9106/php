<?php

define('DB_SERVER', '192.168.29.150');
define('DB_USERNAME', 'ce2_200');
define('DB_PASSWORD', 'ce2_200');
define('DB_NAME', 'e2_200');
try{
/* Attempt to connect to MySQL/MariaDB database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Check connection
if ($link === false) {
    throw new Exception("ERROR: Could not connect to The Database Please try again later. ");
}else{
        echo "connected successfully</br>";
}
}
catch(Exception $e){
        echo $e->getmessage();
}


?>
