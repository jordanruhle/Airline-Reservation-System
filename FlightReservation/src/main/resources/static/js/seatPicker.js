document.getElementById("plane").addEventListener("click", function(e){
	console.log("e.target.nodeValue: " + e.target.nodeValue +". e.target.value: "+ e.target.value)
	if(e.target && e.target.nodeName == "BUTTON" || e.target && e.target.nodeName == "IMG"){
		let popup = document.getElementById(e.target.value)
		
		popup.classList.add("show")
	}
	
}); 

