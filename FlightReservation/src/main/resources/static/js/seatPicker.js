document.getElementById("plane").addEventListener("click", function(e){
	console.log("e.target.nodeValue: " + e.target.nodeValue +". e.target.value: "+ e.target.value)
	console.log(document.getElementsByClassName("show"))
	if (document.getElementsByClassName("show").length > 0){
		let allPopups = document.getElementsByClassName("show")
		while (allPopups.length){
			allPopups[0].classList.remove("show");
		}
	}
	
	if(e.target && e.target.nodeName == "BUTTON"){
		let popup = document.getElementById(e.target.value)
		
		popup.classList.add("show")
	}
	
}); 

