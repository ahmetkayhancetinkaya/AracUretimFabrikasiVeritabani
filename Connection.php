<?php
   $host        = "";
   $port        = "";
   $dbname      = "";
   $credentials = "";

   $db = pg_connect( "$host $port $dbname $credentials"  );
   if(!$db) {
      echo "Error : Unable to open database\n";
   } else {
      echo "Opened database successfully\n";
   }
?>