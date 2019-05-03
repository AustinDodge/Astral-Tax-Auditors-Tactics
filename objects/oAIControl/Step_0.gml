switch stage{
    case 0: sAIMakeDMapLoop(); break;//initialize dmaps and activate units in player influence
    //case 1: sActivateAIUnitsLoop(); break;//no code, only in for compatibility. Unit activation is handled of oAIActivationControl.
    case 1: sAIMakeBarrelScores();
    case 2: sAITileCheckLoop(); break;//find the best move with current units
    case 3: sAIMoveCamera(); break;//move the camera over the unit
    case 4: sAIMoveBestUnit(); break;
    }
    
if delta_time > 35000{
    //show_message("AI is taking too long!")
    }

