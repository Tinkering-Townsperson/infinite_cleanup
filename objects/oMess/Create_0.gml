// How intense the shake is
shake_amount = 4;
// how fast it settles down (0.9 means it loses 10% of its energy every frame)
shake_decay = 0.85; 

// The current visual offset
offset_x = 0;
offset_y = 0;

// Kick off the shake immediately on spawn
offset_x = random_range(-shake_amount, shake_amount);
offset_y = random_range(-shake_amount, shake_amount);

is_being_cleaned = false;
fade_speed = 0.1; // How fast it fades (0.1 is 10% per frame)
