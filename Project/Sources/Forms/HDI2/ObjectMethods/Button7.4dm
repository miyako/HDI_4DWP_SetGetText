var $ref; $range : Object
var $option : Integer

Case of 
	: (rHeader=1)
		$ref:=WP Get header:C1503(WParea; 1)
		$range:=WP Text range:C1341($ref; wk start text:K81:165; wk end text:K81:164)
	: (rBody=1)
		$ref:=WP Get body:C1516(WParea)
		$range:=WP Text range:C1341($ref; wk start text:K81:165; wk end text:K81:164)
	: (rFooter=1)
		$ref:=WP Get footer:C1504(WParea; 1)
		$range:=WP Text range:C1341($ref; wk start text:K81:165; wk end text:K81:164)
		
	: (rUserSelection=1)
		$range:=WP Selection range:C1340(WParea)
		
End case 

Case of 
	: (rBefore=1)
		$option:=wk prepend:K81:178
	: (rReplace=1)
		$option:=wk replace:K81:177
	: (rAfter=1)
		$option:=wk append:K81:179
End case 

WP SET TEXT:C1574($range; vText1; $option)
