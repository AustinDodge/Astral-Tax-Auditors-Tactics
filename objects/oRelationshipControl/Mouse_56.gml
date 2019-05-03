if instance_exists(oRelationshipUpWindow){
    with oRelationshipUpWindow{
        instance_destroy()
        }
    ds_list_destroy(uplist)
    canclick = 1
    instance_destroy()
    }

