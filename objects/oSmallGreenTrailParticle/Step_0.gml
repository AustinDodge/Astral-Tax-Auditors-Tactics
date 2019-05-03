y -= 1
if starter = 1{
    var vpart;
    vpart = instance_create(x+irandom_range(-3,3),y+irandom_range(-3,3),oSmallGreenTrailParticle)
    vpart.starter = 0
    }
if image_index > (image_number-1){
    instance_destroy()
    }

