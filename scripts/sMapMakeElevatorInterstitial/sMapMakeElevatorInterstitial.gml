/// @description sMapMakeElevatorInterstitial(makestep)
/// @param makestep
var xory,generations,generationsmade,vstep;

vstep = argument0
switch vstep{
    case 0:
        entrydoor = 1//force north door
        exitdoor = 1//force north door again
        if ds_list_size(playerunitlist) = 0{
            sMakePlayerUnits()
            }
        sMapMakeInterstitialDoor()
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
        sTileFindNeighborsNoPits()
        //sMapFindContinuityStartTile()
        //sMapPlaceElevators()//was previously at step 15
        //sTileFindNeighborsNoPits()
        //sMapFindContinuityStartTile()
        ; break;
        
    
    case 4:
        
        sTileFindNeighbors()
        sTileDrawBorders()
        ; break;
    case 5:
        //sTileFindNeighborsNoPits()//pits are accounted for again when we make elevators, but we don't want to count them for wall drawing
        //sMapMakeWallTileGrid()
        //sMakeTileWalls(maxelevation)
        //sDrawTileWalls()
        sTileFindNeighbors()//reset it to how it was
        ; break;
    
    case 6:
        //sMapPlaceUnits()
        sMapPlacePlayerUnits()
        ; break;
    case 7:
        //sMapActivateAIUnits()
        with oLightSource{
            event_perform(ev_other,ev_user0)
            }
        //sMapTilesDrawWallsTemp()
        sCenterCameraOnMap()
        //
        ds_grid_destroy(savetilegrid)
        sMapMakeElevatorScrollingWalls()
        sMapCreateFinish()
        sInterTramAnimate(0)//only animate if the level is good!

        ; break;
    }
    
    
return 7;//the maximum number of steps in this script
        

/*Data structures made by the end:
mapheightgrid 

mapitemgrid

unitposgrid

nbigwallgrid- destroyed at end of sBigWallsDrawWalls

ebigwallgrid- destroyed at end of sBigWallsDrawWalls


