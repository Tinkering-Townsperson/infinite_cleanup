if (oPlayer.is_wiggling) {
	with(oManager) {
	    game_won = true;
	}
	instance_destroy(); // Remove the object after touching it
}
