x_speed = 0 
y_speed = 0 


if (keyboard_check(ord("D"))) { // if the d key is pressed 
    x_speed = movement_speed // add the movement speed to the x_speed variable 
} 

if (keyboard_check(ord("A"))) { 
    x_speed = -movement_speed 
} 

if (keyboard_check(ord("W"))) { 
    y_speed = -movement_speed 
} 

if (keyboard_check(ord("S"))) { 
    y_speed = movement_speed 
}


if (keyboard_check(ord(" "))) {
	is_wiggling = true
	
} else {
	is_wiggling = false
}

if (is_wiggling) {
    wiggle_timer += wiggle_frequency;
	x_speed /= 4
	y_speed /= 4
}


move_and_collide(x_speed, y_speed, oSolid)
