if initialized = 1{//if the values are finalized
    if !surface_exists(sketchsurface){
        sketchsurface = surface_create(radius*2,radius*2)
        }
    if !surface_exists(drawsurface){
        drawsurface = surface_create(radius*2,radius*2)
        }
    }

