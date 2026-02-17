// Reduce the offset
offset_x *= shake_decay;
offset_y *= shake_decay;

// If the shake is tiny, just snap it to zero to save processing
if (abs(offset_x) < 0.1) offset_x = 0;
if (abs(offset_y) < 0.1) offset_y = 0;

if (is_being_cleaned) {
    image_alpha -= fade_speed;
    image_xscale -= fade_speed; // Shrink width
    image_yscale -= fade_speed; // Shrink height
    
    if (image_alpha <= 0) {
        instance_destroy();
    }
}
