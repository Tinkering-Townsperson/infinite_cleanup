randomize()

global.messes_cleaned = 0;
spawn_interval = 3

mess_list = [oBook, oCup, oSlime];

// How many messes to complete one full cycle
messes_per_loop = 20; 
current_loop_progress = 0;
total_loops_completed = 0;
happi = false;
game_won = false;


function spawn_obj_somewhere(object_to_spawn) {
	var padding = 16;
    var spawned = false;
    var max_attempts = 20; // Lower this to prevent long freezes
    var attempts = 0;

    while (!spawned && attempts < max_attempts) {
        var rx = floor(random_range(padding, room_width - padding) / 16) * 16;
        var ry = floor(random_range(padding, room_height - padding) / 16) * 16;

        // Use position_meeting to specifically check for walls
        if (!position_meeting(rx + 8, ry + 8, all)) {
            instance_create_layer(rx, ry, "Instances", object_to_spawn);
            spawned = true;
            // show_message("Spawned " + object_get_name(object_to_spawn) + " at " + string(rx) + "," + string(ry));
        }
        attempts++;
    }
    
    if (!spawned) {
        // show_message("Could not find a spot for the mess!");
    }
}

function spawn_mess_at_random() {
	// show_message("Attempting to spawn " + string(object_to_spawn))
	var object_to_spawn = mess_list[irandom(array_length(mess_list) - 1)];
	spawn_obj_somewhere(object_to_spawn)
}


alarm[0] = 1;
