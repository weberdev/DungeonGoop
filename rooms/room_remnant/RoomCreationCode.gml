if (global.active_character == obj_RemnantPC) {
    var remnant_instance = instance_create_layer(global.remnant_x, global.remnant_y, "Instances", obj_RemnantPC);
    instance_deactivate_object(obj_SlimePC);
} else {
    var slime_instance = instance_create_layer(global.slime_x, global.slime_y, "Instances", obj_SlimePC);
    instance_deactivate_object(obj_RemnantPC);
}
