
//if the unit hasn't been knocked, make sure that it's mytile stuff is properly reset.
if myunit.mytile = unittile{
    myunit.mytile = unittile
    unittile.occupied = myunit
    ds_grid_set(unitposgrid,unittile.mx,unittile.my,myunit)
    }
    
if ds_exists(knocklist,ds_type_list){
    ds_list_destroy(knocklist)
    }

