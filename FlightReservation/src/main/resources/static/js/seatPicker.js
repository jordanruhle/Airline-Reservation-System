document.getElementById("plane").addEventListener("click", function(e){
	console.log("e.target.nodeValue: " + e.target.nodeValue +". e.target.value: "+ e.target.value)
	if(e.target && e.target.nodeName == "BUTTON" || e.target && e.target.nodeName == "IMG"){
		let popup = document.getElementById(e.target.value)
		
		popup.classList.add("show")
	}
	
}); 

function addSeatToCart(){
	let cartSeats = session.getAttribute(cartSeats)
	cartSeats.push(e.target.value)
	session.addAttribute("cartSeats", cartSeats)
	console.log(session.cartSeats)
};