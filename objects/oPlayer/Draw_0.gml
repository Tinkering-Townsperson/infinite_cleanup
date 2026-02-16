// Draw Event
var x_offset = 0;
var y_offset = 0;

if (is_wiggling) {
    // Calculate an offset using a sine wave
    // The sin function returns a value between -1 and 1
    x_offset = sin(wiggle_timer) * wiggle_amplitude;
    // To wiggle vertically, you would add a y_offset as well, e.g.,
    y_offset = cos(wiggle_timer*1.5) * wiggle_amplitude; 
}

// Draw the sprite with the calculated offset
draw_sprite_ext(sprite_index, image_index, x + x_offset, y + y_offset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

