var $table; $row; $range : Object


$range:=WP Text range:C1341([INFO:1]Sample:5; wk end text:K81:164; wk end text:K81:164)

$table:=WP Insert table:C1473($range; wk append:K81:179; wk include in range:K81:180)

$row:=WP Table append row:C1474($table; "Alpha"; 20; "Bravo")
$row:=WP Table append row:C1474($table; "Charlie"; 17; "Delta")
$row:=WP Table append row:C1474($table; "Echo"; 23; "Foxtrot")



