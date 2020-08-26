//Hide spawn points
var layerID = layer_get_id("SpawnPoints");
layer_set_visible(layerID, false);

//Debug commands
restartButton = gp_start;
debugButton = gp_select;

//Init surfaces
instance_create_layer(0, 0, "Controllers", oSurfaceHandler);
instance_create_layer(0, 0, "Ground", oSplatterHandler);

//Init cinematic bars
instance_create_layer(0, 0, "Bars", oCinemaBars);

//Init wall drawing
instance_create_layer(0, 0, "Pits", oWallDrawer);