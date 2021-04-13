<?php
   $host        = "host=127.0.0.1";
   $port        = "port=5432";
   $dbname      = "dbname = ARACFABRIKA";
   $credentials = "user = postgres password=kayhan78";

   $db = pg_connect( "$host $port $dbname $credentials"  );
   if(!$db) {
      echo "Error : Unable to open database<br>";
   } else {
      echo "Opened database successfully<br>";
   }
   $sql =<<<EOF
      UPDATE "PersonelBilgileri" set "Maaş" = 40000 where "PersonelId"=40;
EOF;
   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
      exit;
   } else {
      echo "Record updated successfully<br><br>";
   }
   
   $sql =<<<EOF
      SELECT * from "PersonelBilgileri";
EOF;

   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {
 echo "PersonelId = ". $row[0] . "<br>";
      echo "IsBaslangicTarihi = ". $row[1] ."<br>";
      echo "Maas = ". $row[2] ."<br>";
      echo "DepartmanId =  ".$row[3] ."<br><br>";
   }
   echo "Operation done successfully\n";
   pg_close($db);
?>