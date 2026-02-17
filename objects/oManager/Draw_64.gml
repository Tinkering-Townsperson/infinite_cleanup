if (game_won) {
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();

    // 1. Draw a semi-transparent black overlay
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, screen_w, screen_h, false);
    draw_set_alpha(1.0);

    // 2. Draw Win Text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_lime);
    
    draw_text_transformed(screen_w / 2, screen_h / 2 - 20, "Congratulations!", 4, 4, 0);
    
    draw_set_color(c_white);
    draw_text(screen_w / 2, screen_h / 2 + 40, "Press 'E' to exit the game fully because you're just that good");
	draw_text(screen_w / 2, screen_h / 2 + 60, "This will definitely not just make you play the game again in a loop");
	draw_text(screen_w / 2, screen_h / 2 + 80, "hehe");
	draw_text(screen_w / 2, screen_h / 2 + 100, "what are you waiting for, man? just press 'E' to not not loop back to the start");


    // 3. Simple Restart Logic
    if (keyboard_check_pressed(ord("E"))) {
		room_restart();
	}
}


var bar_width = 400;
var bar_height = 20;
var screen_mid = display_get_gui_width() / 2;
var x1 = screen_mid - (bar_width / 2);
var y1 = 40;
var x2 = x1 + bar_width;
var y2 = y1 + bar_height;

// Calculate percentage (0 to 100)
var pc = (current_loop_progress / messes_per_loop) * 100;

// Draw background
draw_set_color(c_dkgray);
draw_rectangle(x1, y1, x2, y2, false);

// Draw the "Progress" (The Loop Fill)
// Using a "toxic" green or "clean" blue
draw_healthbar(x1, y1, x2, y2, pc, c_black, c_aqua, c_lime, 0, true, true);

// Draw Loop Count
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(screen_mid, y2 + 10, "Level " + string(total_loops_completed + 1) + ", Total score: " + string(total_loops_completed * messes_per_loop + current_loop_progress));

//draw_set_color(c_white);
// Adjust the coordinates (20, 20) to wherever you want the text
//draw_text_transformed(20, 20, "Score: " + string(global.messes_cleaned), 4, 4, 0);
