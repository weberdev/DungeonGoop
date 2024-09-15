// Create Event
x = global.respawn_x;
y = global.respawn_y;
last_x = x;
last_y = y;
tile_size = 64;  // Size of each tile
isMoving = false;  // Initialize as not moving
moveX = x;  // Set initial destination to current position
moveY = y;  // Set initial destination to current position
moveSpeed = 4;  // Speed of movement
active_trait = global.remnant_trait;
facing_x = x;
facing_y = y;
facing_tile_x = 0;
facing_tile_y = 0;
move_enabled = true;
