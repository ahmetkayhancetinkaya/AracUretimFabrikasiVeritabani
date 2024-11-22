<?php
   $host        = "";
   $port        = "";
   $dbname      = "";
   $credentials = "";

   $db = pg_connect( "$host $port $dbname $credentials"  );
   if(!$db) {
      echo "Error : Unable to open database<br>";
   } else {
      echo "Opened database successfully<br>";
   }

   $sql =<<<EOF
      INSERT INTO "PersonelBilgileri" ("PersonelId","DepartmanId","Maaş","İşBaşlangıçTarihi")
      VALUES (40, 3, 32000, '2015-03-03' );

EOF;

   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
   } else {
      echo "Kayit veritabanina eklendi...<br>";
   }
   pg_close($db);
?>