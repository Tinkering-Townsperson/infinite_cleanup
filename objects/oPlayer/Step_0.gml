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
    x_speed /= 4;
    y_speed /= 4;
	
	var _clean_list = ds_list_create();
    var _num = instance_place_list(x, y, oMess, _clean_list, false);
    
    if (_num > 0) {
        for (var i = 0; i < _num; i++) {
            var _inst = _clean_list[| i];
            
            // ONLY trigger if this mess isn't already fading!
            if (_inst.is_being_cleaned == false) {
				 _inst.is_being_cleaned = true;
    
				  // Update progress
				oManager.current_loop_progress += 1;
    
			    // Check if the loop is full
			    if (oManager.current_loop_progress >= oManager.messes_per_loop) {
				    oManager.current_loop_progress = 0; // Reset the loop
					oManager.total_loops_completed += 1;
        
					// THEME TWIST: Speed up the spawning every time a loop completes!
				    oManager.spawn_interval = max(0.5, oManager.spawn_interval - 0.5); 
				}
			}
        }
    }
    ds_list_destroy(_clean_list);
}


move_and_collide(x_speed, y_speed, oSolid)
