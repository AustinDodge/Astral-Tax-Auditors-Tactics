/// @description sGetItemDescription(itemnum)
/// @param itemnum
/*this script returns the string that describes the object
*/
var wnum,vstring,vsp,vitem,vtype,varg,vuses,vdurability;
wnum = argument0
vstring = "no description!"

switch wnum{
    case 1: vstring = "A sturdy metal bar useful for breaking both crates and bones."; break;//crowbar
    case 2: vstring = "Close range crowd control device. Marketed as less-lethal, but it's all about how you use it."; break;//shock prod
    case 3: vstring = "Don't ask what this used to be attached to. The suckers still twitch and secrete... something.";  break;//tentacle
    case 4: vstring = "The built-in, rapid charge air compressor provides lightweight portability. Always wear eye protection.";  break;//nail gun
    case 5: vstring = "Allows for maintenance and repair of hard-to-reach areas.";  break;//weld gun
    case 6: vstring = "Something started growing out of this nail gun. It still shoots, but the nails won't stop screaming.";  break;//cursed cutter
    case 7: vstring = "Packed with bandages, painkillers, and vitamin C chewables.";  break;//medkit
    case 8: vstring = "Pull the pin and toss."; break;//grenade
    case 9: vstring = "It's breath is surprisingly sweet."; break;//big mouth
    case 10: vstring = "Volatile Mix"; break;//volatile mix
    case 11: vstring = "A droid-mounted crowd control device. The attack can chain to units near the target."; break;//spark charger
    case 12: vstring = "Goat Horns"; break;//goat horns
    case 13: vstring = "They almost look more like chrome than bone"; break;//devil horns
    case 14: vstring = "Electro Horns"; break;//electro horns
    case 15: vstring = "Rotary Saw"; break;//rotary saw
    case 16: vstring = "A lightweight plastifoam construction element. Wood would hit harder, but there aren't many trees in space."; break;//two by four weapon
    case 17: vstring = "In case of emergency, start chopping things in half."; break;//axe weapon
    case 18: vstring = "Some kind of gadget that's been broken open, explosing the wiring inside. Those could cause a nasty shock!"; break;//live wires
    case 19: vstring = "The focused light beam can go through steel like butter."; break;//laser saw
    case 20: vstring = "Concealed carry isn't a thing on the Palace, but that doesn't matter if you conceal it well enough."; break;//small revolver
    case 21: vstring = "Crowd control at a distance. It's hard to kill something with this, but that's by design."; break;//stun pistol
    case 22: vstring = "An organic resin has started growing over some of the walls. A piece of it broke off and would make a good club."; break;//resin chunk
    case 23: vstring = "Bad things have been done with this knife, but I'm sure you can find a constructive use for it."; break;//ritual knife
    case 24: vstring = "Used by elite security units when things go really wrong."; break;//plasma rifle
    case 25: vstring = "A faint glow emanates from it's mouth. Don't open the jaw unless it's pointed at something you don't want around."; break;//yorick's maw
    case 26: vstring = "Shoots a stream of healing nanobots across a distance."; break;//heal ray
    }
    
return vstring;
