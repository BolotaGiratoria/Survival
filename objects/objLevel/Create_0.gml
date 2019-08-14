randomize();

//Create the surface for the shadows
shadowSurface = noone;

// Get the tile layer map id
var wallMapID = layer_tilemap_get_id("WallTiles");

#region //Setup grid
	levelWidth = room_width/CELLWIDTH;
	levelHeight = room_height/CELLHEIGHT;
	levelGrid = ds_grid_create(levelWidth, levelHeight);
	ds_grid_set_region(levelGrid, 0, 0, levelWidth - 1, levelHeight - 1, VOID);
#endregion

#region //Create the controller
	var controllerX = levelWidth/2;
	var controllerY = levelHeight/2;
	var controllerDirection = irandom(3);
	var steps = 400;

	#region //Set player position
		var playerStartX = controllerX * CELLWIDTH + CELLWIDTH/2;
		var playerStartY = controllerY * CELLHEIGHT + CELLHEIGHT/2;
		instance_create_layer(playerStartX, playerStartY, "Player", objPlayer);
	#endregion
	// Choose the direction change odds
	var directionChangeOdds = 1;

	// Generate the level
	repeat (steps) {
		levelGrid[# controllerX, controllerY] = FLOOR;
	
		// Rnadomize the direction
		if (irandom(directionChangeOdds) == directionChangeOdds) {
			controllerDirection = irandom(3);	
		}
	
		// Move the controller
		var xDirection = lengthdir_x(1, controllerDirection * 90);
		var yDirection = lengthdir_y(1, controllerDirection * 90);
		controllerX += xDirection;
		controllerY += yDirection;
	
		// Make sure we don't move outside the room
		if (controllerX < 2 || controllerX >= levelWidth - 2) {
			controllerX += -xDirection * 2;
		}
		if (controllerY < 2 || controllerY >= levelHeight - 2) {
			controllerY += -yDirection * 2;
		}
	}
#endregion

#region // Create the walls tiles
	for (var tileY = 1; tileY < levelHeight-1; tileY++) {
		for (var tileX = 1; tileX < levelWidth-1; tileX++) {
			if (levelGrid[# tileX, tileY] != FLOOR) {
				var northTile = levelGrid[# tileX, tileY-1] == VOID;
				var westTile = levelGrid[# tileX-1, tileY] == VOID;
				var eastTile = levelGrid[# tileX+1, tileY] == VOID;
				var southTile = levelGrid[# tileX, tileY+1] == VOID;
		
				var _tile_index = NORTH*northTile + WEST*westTile + EAST*eastTile + SOUTH*southTile + 1;
				if (_tile_index == 1) {
					levelGrid[# tileX, tileY] = FLOOR	
				}
			}
		}
	}

	for (var tileY = 1; tileY < levelHeight-1; tileY++) {
		for (var tileX = 1; tileX < levelWidth-1; tileX++) {
			if (levelGrid[# tileX, tileY] != FLOOR) {
				var northTile = levelGrid[# tileX, tileY-1] == VOID;
				var westTile = levelGrid[# tileX-1, tileY] == VOID;
				var eastTile = levelGrid[# tileX+1, tileY] == VOID;
				var southTile = levelGrid[# tileX, tileY+1] == VOID;
		
				var _tile_index = NORTH*northTile + WEST*westTile + EAST*eastTile + SOUTH*southTile + 1;
				tilemap_set(wallMapID, _tile_index, tileX, tileY);
			}
		}
	}
#endregion