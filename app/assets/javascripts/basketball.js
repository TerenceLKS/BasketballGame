// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function validateform()
{
	/*
	Assumptions:
		- Date, Time, Status, Winner does not have to be set immediately. Can be edited later by user
		- Date and Time is provided in a controlled input, hacking not considered
		- Only score is validated
	*/
	var isValid = true;
	var message = "";
	var score;
	score = document.getElementById("basketball_score").value;
	
	// Score validation
	if ( isNaN(score) ) // Check if not a valid number
	{
		message += "Score is not a valid number";
		isValid = false;
	}
	else if ( !(score % 1 === 0) ) // Else if it is, is it a whole num?
	{
		message += "Score must be a whole number";
		isValid = false;
	}
	
	// If isValid is still true, accept inputs
	if ( isValid ) 
	{
		return true;
	}
	else // Else fail, alert problem and return false
	{
		alert(message);
		return false;
	}
}