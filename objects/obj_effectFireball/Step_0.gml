// Move the fireball according to its speed and direction
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Check if the fireball has reached or passed its target position
show_debug_message(string(direction));
switch(direction) {
    case 0:
        end_x = start_x + 640;
        break;
    case 90:
        end_y = start_y - 640;
        break;
    case 180:
        end_x = start_x - 640;
        break;
    case 270:
        end_y = start_y + 640;
        break;
}
image_angle = direction;
switch (direction) {
    case 0: // Moving right
        if (x >= end_x) instance_destroy();
        break;
    case 90: // Moving down
        if (y <= end_y) instance_destroy();
        break;
    case 180: // Moving left
        if (x <= end_x) instance_destroy();
        break;
    case 270: // Moving up
        if (y >= end_y) instance_destroy();
        break;
}
