//%attributes = {}
#DECLARE($params : Object)

var $splashWindowTitle : Text
$splashWindowTitle:=""

var $i; $window : Integer

If (Count parameters:C259=0)
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$splashWindowTitle)
			var $x; $y; $bottom; $right : Integer
			GET WINDOW RECT($x; $y; $bottom; $right; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $bottom; $right; $window)))
			return 
		End if 
	End for 
	
	var $dataClass; $project; $path : Text
	For each ($dataClass; ds:C1482)
		If (ds:C1482[$dataClass].getCount()=0)
			$path:=File:C1566("/RESOURCES/"+$dataClass+".4ie").platformPath
			If (Test path name:C476($path)=Is a document:K24:1)
				$project:=File:C1566("/RESOURCES/"+$dataClass+".4si").getText()
				IMPORT DATA:C665($path; $project)
			End if 
		End if 
	End for each 
	
	CALL WORKER(1; Current method name:C684; {})
	
Else 
	
	SET MENU BAR(1)
	
	var $options : Object
	$options:=New object:C1471
	
	$options.title:=Localized string("HDI_Title")
	$options.blog:="blog.4d.com"
	$options.info:=Localized string("HDI_Info")  //ex : "4D View Pro feature"
	
	$options.minimumVersion:="1700"  // 1720 means 17R2   1701 means 17.1 (do not use !)
	
	$options.license:=4D Write license:K44:2  // IF ANY NEEDED
	
	// THE BACKGROUND PICTURE IS IN THE RESOURCES : Resources/Images/HDIabout.png
	// the picture size is 724 * 364
	
	$window:=Open form window:C675("HDI"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE($splashWindowTitle; $window)
	DIALOG:C40("HDI"; $options; *)
	
End if 
