get-item *.coffee | foreach { 
	coffee -b -o ext -c $_.FullName 
}