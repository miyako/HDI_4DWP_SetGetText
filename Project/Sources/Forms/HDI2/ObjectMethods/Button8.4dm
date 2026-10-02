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
	: (rExpAsValue=1)
		$option:=wk expressions as value:K81:255
	: (rExpAsSource=1)
		$option:=wk expressions as source:K81:256
	: (rExpAsSpace=1)
		$option:=wk expressions as space:K81:257
End case 

vText2:=WP Get text:C1575($range; $option)
