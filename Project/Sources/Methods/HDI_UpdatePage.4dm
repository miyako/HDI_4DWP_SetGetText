//%attributes = {}
//C_LONGINT($1)
//C_LONGINT($Page;$i;$n)

//C_COLLECTION($col)
//C_OBJECT($table)

//$Page:=$1

//OBJECT SET ENABLED(*;"btnApplySettings";False)
//OBJECT SET VISIBLE(*;"docElements";False)

//QUERY([INFO];[INFO]PageNumber=$page)

//  //WParea:=WP New([INFO]Sample)

//If ($page#6)
//WParea:=[INFO]
//Else 
//WParea2:=[INFO]
//End if 

//If ($page=7)
//ARRAY TEXT(_elemIDs;0)

//$col:=WP Get elements([INFO];wk type table)
//$n:=$col.length
//For ($i;0;$n-1)
//APPEND TO ARRAY(_elemIDs;$col[$i].id)
//End for 

//ARRAY TEXT(_elemColors;0)
//APPEND TO ARRAY(_elemColors;"rosybrown")
//APPEND TO ARRAY(_elemColors;"lightskyblue")
//APPEND TO ARRAY(_elemColors;"lightpink")
//APPEND TO ARRAY(_elemColors;"olive")
//APPEND TO ARRAY(_elemColors;"purple")
//APPEND TO ARRAY(_elemColors;"coral")
//APPEND TO ARRAY(_elemColors;"moccasin")

//_elemIDs:=1
//_elemColors:=1

//End if 
