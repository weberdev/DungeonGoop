if (global.active_character == obj_pcRemnant) {
    var remnant_instance = instance_create_layer(global.remnant_x, global.remnant_y, "Instances", obj_pcRemnant);
    instance_deactivate_object(obj_pcSlime);
} else {
    var slime_instance = instance_create_layer(global.slime_x, global.slime_y, "Instances", obj_pcSlime);
    instance_deactivate_object(obj_pcRemnant);
}
