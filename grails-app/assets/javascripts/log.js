function log(msg, type) {
	
	if(type == "i") {
		console.log("%cINFO : "+"%c"+msg , "color : blue" , "color : #000");
	}
	
	else if(type == "s") {
		console.log("%cSUCCESS : "+"%c"+msg , "color : green" , "color : #000");
	}
	
	else if(type == "f") {
		console.log("%cFAILURE : "+"%c"+msg , "color : red" , "color : #000");
	}
	
	else if(type == "w") {
		console.log("%cWARNING : "+"%c"+msg , "color : orange" , "color : #000");
	}
	
	else if(type == "e") {
		console.log("%cERROR : "+"%c"+msg , "color : crimson" , "color : #000");
	}

	else {
		console.log("%cDATA : "+"%c"+msg , "color : black" , "color : #000");	
	}
}