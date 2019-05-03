/// @description sMapMakeRoom(makestep)
/// @param makestep
var xory,generations,generationsmade,vstep;

vstep = argument0
switch vstep{
    case 0:
        generations = irandom_range(3,5)
        generationsmade = 0
        
        if ds_list_size(playerunitlist) = 0{
            sMakePlayerUnits()
            }
        
        sMapMakeRoomInit()
        sMapMakeDoors()
        
        while generationsmade < generations{
            with oMapHeightCell{
                if (generation = divgeneration) and (height+width > 3){
                    ds_list_shuffle(divratiolist)
                    xory = ds_list_find_value(divratiolist,0)
                    sMapCellDivide(id,xory)
                    }
                }
                
            divgeneration += 1
            generationsmade += 1
            }
        
        //sMapDrawTestElevGrid()
        
        sMapPlaceTileIndex()//this script places tile image variations on the grid
        ; break;
    case 1:
        //ds_grid_clear(tileindexgrid,0)//debug
        
        sMapDrawRoomTiles()//this script also adds all the heights from oMapHeightCell to the mapheightgrid
        with oMapHeightCell{
            instance_destroy()
            }
        sCenterCameraOnMap()
        ; break;
    case 2:
        sTileFindNeighbors()
        sMapTileSetStartDepth()//this sets the depth at which each tile will draw
        ; break;
    case 3:
        sMapCorrectTiles()//play with
        sDoorsEvenElevation()//switching these two
        ; break;
    case 4:
        sMapCorrectTiles()//play with
        sDoorsEvenElevation()//switching these two
        with oMapTile{
            elevation += 4
            ds_grid_set(mapheightgrid,mx,my,elevation)
            }
        
        //original position of sMapMakePits
        
        
        maxelevation = 0
        with oMapTile{//find the highest tile elevation
            if elevation > oMapControl.maxelevation{
                oMapControl.maxelevation = elevation
                }
            }
        ; break;
    case 5:
            
        sBigWallsMakeWalls(maxelevation)
        ; break;
    case 6:
        sBigWallsDrawWalls()
        ; break;
        
        //at this point we locate all key objects and save their tiles to keytilelist
        //those key tiles are used in sMapMakeSaveTileGrid. The objects aren't actually made
        //until we get to sMapPlaceObstacles, which places random obstacles as well as key objects'
        
    case 7:
        //sMapPlaceDoorTerminals(irandom_range(3,3))
        sMapPlaceDoorTerminals(howmanydoorterminals)
        //sMapPlaceVendingMachines(irandom_range(1,2))
        
        ; break;
    case 8:
        sMapMakeSaveTileGrid(2)
        ; break;
        
    case 9:
        if maptype = 1{//catwalk map
            sMapMakeKeyTileIslands(2,4,2)
            //sMapChangeTileCatwalk()
            }
        
        sMapMakePits()//this script does different things depending on map type.
        
        if maptype = 1{
            sMapChangeTileCatwalk()
            }
        ; break;
        /*with oMapTile{//debug
            if ds_grid_get(tiletypegrid,mx,my) = 0{
                image_index = ds_grid_get(oMapControl.tileindexgrid,mx,my)
                }
            }*/
        
            
        //sPlaceElevatorsTemp()
    case 10:
        sTilesElevate()
        sMapPlaceVendingMachines(3)
        ; break;
        
    case 11:
        sTileFindNeighborsNoPits()
        sMapFindContinuityStartTile()
        sMapPlaceElevators()//was previously at step 15
        sTileFindNeighborsNoPits()
        //sMapFindContinuityStartTile()
        ; break;
        
    case 12:
        //sMapFindContinuityStartTile()//do it twice in case the start tile gets turned into an elevator
        if maptheme = 0{//only have 4 tile obstacles on industrial for now
            sMapPlaceObstaclesFour(5)//number is chance out of 100 that a valid tile will have an obstacle
            }
        //sMapMakeObstacles()
        ; break;
    case 13:
        sMapPlaceObstaclesTwo(8)
        ; break;
    case 14:
        sMapPlaceObstaclesOne(8)
        sMapDrawDoorTerminals()
        sMapDrawVendingMachines()
        
        ; break;
    case 15:
        
        sTileFindNeighbors()
        sTileDrawBorders()
        ; break;
    case 16:
        sTileFindNeighborsNoPits()//pits are accounted for again when we make elevators, but we don't want to count them for wall drawing
        sMapMakeWallTileGrid()
        sMakeTileWalls(maxelevation)
        sDrawTileWalls()
        sTileFindNeighbors()//reset it to how it was
        ; break;
    case 17:
        with oPitTile{
            depth += 2
            }
        with oCatwalkTile{
            depth += 2
            }
        sDrawCatwalkWalls()
        sMapMakeDoorPits()
        
        ; break;        
    case 18:
        switch maptheme{
            case 0: sIndustrialWallsSetDressing(); break;
            case 1: sParkWallsSetDressing(); break;
            }
       ; break
       
        //sTempPlaceAuditor()
    case 19:
        sMapMakeEnemyAttributes()
        ; break;
    case 20:
        //sMapMakeObstacles()
        sMapObstacleAddHeight()
        sMapFloorDressingInit()
        sMapMakeFloorDressing1()
        sMapFloorDressingDeInit()
        ; break;
    case 21:
        sMapPlaceUnits()
        ; break;
    case 22:
        //sMapActivateAIUnitsPlayerAttack()
        sMapActivateAIUnitsSight()
        sMapCatwalkFindShadows()
        ; break;
    case 23:
        //sMapActivateAIUnits()
        with oLightSource{
            event_perform(ev_other,ev_user0)
            }
        //sMapTilesDrawWallsTemp()
        sCenterCameraOnMap()
        //
        ds_grid_destroy(savetilegrid)
        
        
        donemakingroom = 1
        
        if oMapControl.mapissolvable = 0{
            /*sDestroyRangeTiles()
            with oButton{
                instance_destroy()
                }
            with oMapControl{
                sMapCreateInit()
                }*/
            oMapControl.makenewmap = 1
            }else{
            sMapCreateFinish()
            sTramAnimate(0)//only animate if the level is good!
            }
        ; break;
    }
    
    
return 23;//the maximum number of steps in this script
        

/*Data structures made by the end:
mapheightgrid 

mapitemgrid

unitposgrid

nbigwallgrid- destroyed at end of sBigWallsDrawWalls

ebigwallgrid- destroyed at end of sBigWallsDrawWalls


