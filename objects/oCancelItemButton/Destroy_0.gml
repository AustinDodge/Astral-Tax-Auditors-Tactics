//if the button is destroyed by clicking another oInventoryButton, destroy the item

if killitem = 1{
    with myitem{
        explodable = 0
        instance_destroy()
        }
    }

