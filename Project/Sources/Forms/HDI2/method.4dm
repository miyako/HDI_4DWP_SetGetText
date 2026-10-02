var $page : Integer

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		
		READ ONLY:C145([INFO:1])
		ALL RECORDS:C47([INFO:1])
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		rHeader:=0
		rBody:=1
		rFooter:=0
		rUserSelection:=0
		
		rBefore:=0
		rReplace:=0
		rAfter:=1
		
		rExpAsValue:=1
		rExpAsSource:=0
		rExpAsSpace:=0
		
		$page:=1
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4=$page)
		wpArea:=[INFO:1]Sample:5
		vText1:="Alpha Bravo Charlie Delta Echo Foxtrot Gold Hotel India"
		vText2:=""
		
		If (Is macOS:C1572)
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)  // macOS
		Else 
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 13)  // windows
		End if 
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (Is macOS:C1572)
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)  // macOS
		Else 
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 13)  // windows
		End if 
		
		$page:=FORM Get current page:C276
		
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4=$page)
		wpArea:=[INFO:1]Sample:5
		vText1:="Alpha Bravo Charlie Delta Echo Foxtrot Gold Hotel India"
		vText2:=""
		
End case 

