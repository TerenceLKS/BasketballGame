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
	var team1 = "";
	var team2 = "";
	var status = ""
	var winner = "";
	var score;
	team1 = document.getElementById("basketball_team1").value;
	team2 = document.getElementById("basketball_team2").value;
	status = document.getElementById("basketball_status").value;
	winner = document.getElementById("basketball_winner").value;
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
	
	// Team validation
	if ( team1 && team2 ) // They both have something
	{
		if ( team1 == team2 )
		{
			message += "The first team cannot be the opposing team at the same time";
			isValid = false;
		}
	}
	
	// Winner validation
	if ( winner ) // Has something? Then validate it
	{
		// Check if winner belongs in matched teams
		if ( !(winner == team1 || winner == team2) )
		{
			message += "The winner team must belong in one of the teams in play";
			isValid = false;
		}		
	}
	
	// Status validation
	if ( winner || score )
	{
		if ( status != "Finished" )
		{
			message += "Winner and/or score cannot exist without updating status to Finished";
			isValid = false;
		}
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