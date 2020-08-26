//Init system
global.partSystem = part_system_create_layer("Particles", true);
global.topPartSystem = part_system_create_layer("Controllers", true);
global.botPartSystem = part_system_create_layer("Ground", true);

//Saw sparks
global.sawPart = part_type_create();
part_type_shape(global.sawPart,pt_shape_line);
part_type_size(global.sawPart,0.1,0.2,-0.02,0);
part_type_scale(global.sawPart,1,1);
part_type_color1(global.sawPart,global.colOrange);
part_type_alpha1(global.sawPart,1);
part_type_speed(global.sawPart,1,2,-0.002,0);
part_type_direction(global.sawPart,0,359,0,0);
part_type_gravity(global.sawPart,0,270);
part_type_orientation(global.sawPart,0,0,0,0,1);
part_type_blend(global.sawPart,false);
part_type_life(global.sawPart,10, 20);

//Player dash particles
global.dashPart = part_type_create();
part_type_shape(global.dashPart,pt_shape_disk);
part_type_size(global.dashPart,0.1,0.2,-0.01,0);
part_type_scale(global.dashPart,1,1);
part_type_color1(global.dashPart,global.colWhite);
part_type_alpha1(global.dashPart,1);
part_type_speed(global.dashPart,1,2,-0.002,0);
part_type_direction(global.dashPart,0,359,0,0);
part_type_gravity(global.dashPart,0,270);
part_type_orientation(global.dashPart,0,0,0,0,1);
part_type_blend(global.dashPart,false);
part_type_life(global.dashPart,10, 20);

//Player death particles
global.deathPart = part_type_create();
part_type_shape(global.deathPart,pt_shape_disk);
part_type_size(global.deathPart,0.1,0.4,-0.001,0);
part_type_speed(global.deathPart,0.1,1,-0.006,0);
part_type_scale(global.deathPart,1,1);
part_type_color1(global.deathPart,global.colWhite);
part_type_alpha1(global.deathPart,1);
part_type_direction(global.deathPart,0,359,0,0);
part_type_gravity(global.deathPart,0,270);
part_type_orientation(global.deathPart,0,0,0,0,1);
part_type_blend(global.deathPart,false);
part_type_life(global.deathPart,360, 360);

//Player ambient death particles
global.deathPart2 = part_type_create();
part_type_shape(global.deathPart2,pt_shape_disk);
part_type_size(global.deathPart2,0.1,0.2,-0.001,0);
part_type_speed(global.deathPart2,4,6,-0.04,0);
part_type_scale(global.deathPart2,1,1);
part_type_color1(global.deathPart2,global.colWhite);
part_type_alpha1(global.deathPart2,1);
part_type_direction(global.deathPart2,0,359,0,0);
part_type_gravity(global.deathPart2,0,270);
part_type_orientation(global.deathPart2,0,0,0,0,1);
part_type_blend(global.deathPart2,false);
part_type_life(global.deathPart2,180, 180);

//Wind particle things
global.windPart = part_type_create();
part_type_shape(global.windPart,pt_shape_line);
part_type_size(global.windPart,0.1,0.2,-0.01,0);
part_type_scale(global.windPart,1,1);
part_type_color1(global.windPart,global.colWhite);
part_type_alpha1(global.windPart,1);
part_type_speed(global.windPart,2,4,-0.002,0);
part_type_direction(global.windPart,0,359,0,0);
part_type_gravity(global.windPart,0,270);
part_type_orientation(global.windPart,0,0,0,0,1);
part_type_blend(global.windPart,false);
part_type_life(global.windPart,10, 20);

//Deflect particles
global.deflectPart = part_type_create();
part_type_shape(global.deflectPart,pt_shape_line);
part_type_size(global.deflectPart,0.2,0.4,-0.01,0);
part_type_scale(global.deflectPart,1,1);
part_type_color1(global.deflectPart,global.colOrange);
part_type_alpha1(global.deflectPart,1);
part_type_speed(global.deflectPart,4,8,-0.01,0);
part_type_direction(global.deflectPart,0,359,0,0);
part_type_gravity(global.deflectPart,0,270);
part_type_orientation(global.deflectPart,0,0,0,0,1);
part_type_blend(global.deflectPart,false);
part_type_life(global.deflectPart,60, 120);

//Hold particles
global.holdPart = part_type_create();
part_type_shape(global.holdPart,pt_shape_line);
part_type_size(global.holdPart,0.2,0.3,-0.01,0);
part_type_scale(global.holdPart,1,1);
part_type_color1(global.holdPart,global.colOrange);
part_type_alpha1(global.holdPart,1);
part_type_speed(global.holdPart,1,2,-0.002,0);
part_type_direction(global.holdPart,0,359,0,0);
part_type_gravity(global.holdPart,0,270);
part_type_orientation(global.holdPart,0,0,0,0,1);
part_type_blend(global.holdPart,false);
part_type_life(global.holdPart,30, 60);

//Saw ambient sparks
global.sawAmbientPart = part_type_create();
part_type_shape(global.sawAmbientPart,pt_shape_disk);
part_type_size(global.sawAmbientPart,0.05,0.1,-0.001,0);
part_type_scale(global.sawAmbientPart,1,1);
part_type_color1(global.sawAmbientPart,global.colYellow);
part_type_alpha1(global.sawAmbientPart,1);
part_type_speed(global.sawAmbientPart,0.2,0.5,-0.001,0);
part_type_direction(global.sawAmbientPart,0,359,0,0);
part_type_gravity(global.sawAmbientPart,0,270);
part_type_orientation(global.sawAmbientPart,0,0,0,0,1);
part_type_blend(global.sawAmbientPart,false);
part_type_life(global.sawAmbientPart,60, 120);

//Bully particles
global.bullyPart = part_type_create();
part_type_shape(global.bullyPart,pt_shape_line);
part_type_size(global.bullyPart,0.4,0.6,-0.03,0);
part_type_scale(global.bullyPart,1,1);
part_type_color1(global.bullyPart,global.colWhite);
part_type_alpha1(global.bullyPart,1);
part_type_speed(global.bullyPart,2,4,-0.003,0);
part_type_direction(global.bullyPart,0,359,0,0);
part_type_gravity(global.bullyPart,0,270);
part_type_orientation(global.bullyPart,0,0,0,0,1);
part_type_blend(global.bullyPart,false);
part_type_life(global.bullyPart,30, 60);