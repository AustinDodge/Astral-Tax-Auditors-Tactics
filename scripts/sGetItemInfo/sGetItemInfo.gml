/// @function sGetItemInfo(itemnum,1string 2sprite 3objind 4category 5uses 6durability 7price)
/// @param itemnum
/// @param 1string_2sprite_3objind_4category_5uses_6durability_7price
/*this script returns the requested type of information about an object.
Argument 1 key:
1 = string
2 = sprite
3 = object index
4 = item type
5 = item default max uses
6 = durability type for weapons; 0 consumes a use on attack(uses ammo), 1 consumes a use on hit(a knife being blunted),2 for never consumed
7 = price, base price paid for from a vending machine
vtype key:
0 = consumable
1 = trap
2 = weapon
3 = armor
*/
var wnum,vstring,vsp,vitem,vtype,varg,vuses,vdurability,vprice;
wnum = argument0
varg = argument1

vstring = "none"
vsp = -1
vitem = oCrowbarItem
vtype = -1
vuses = -1
vdurability = 1
vprice = 1

switch wnum{
    case 1: vstring = "Crowbar";        vsp = spcrowbar;    vitem = oCrowbarItem;       vtype = 2; vuses = 30; vdurability = 1; vprice = 300; break;
    case 2: vstring = "Shock Prod";     vsp = spshockprod;  vitem = oShockProdItem;      vtype = 2; vuses = 30; vdurability = 0; vprice = 300; break;
    case 3: vstring = "Tentacle";   vsp = sptentacleweapon;vitem = oTentacleWeaponItem;vtype = 2; vuses = 30; vdurability = 1;  vprice = 300; break;//tentacle
    case 4: vstring = "Nail Gun";       vsp = spnailgun;    vitem = oNailGunItem;       vtype = 2; vuses = 30; vdurability = 0; vprice = 400; break;
    case 5: vstring = "Weld Gun";       vsp = spweldgun;    vitem = oWeldGunItem;       vtype = 2; vuses = 30; vdurability = 0; vprice = 400; break;
    case 6: vstring = "Cursed Cutter"; vsp = spcursedcutter;vitem = oCursedCutterItem; vtype = 2; vuses = 20; vdurability = 0; vprice = 450; break;
    case 7: vstring = "Medkit";         vsp = spmedkit;     vitem = oMedKitItem;        vtype = 0; vuses = 3; vdurability = 0; vprice = 300; break;
    case 8: vstring = "Grenade";        vsp = spgrenade;    vitem = oGrenadeItem;       vtype = 1; vuses = 1; vdurability = 0; vprice = 300; break;
    case 9: vstring = "Big Mouth";      vsp = spbigmouth;   vitem = oItemParent;        vtype = 2;  vuses = -1; vdurability = 2; vprice = 300; break;//no item
    case 10: vstring = "Volatile Mix";  vsp = spnothing;    vitem = oItemParent;        vtype = 2; vuses = -1; vdurability = 2; vprice = 300; break;//no item
    case 11: vstring = "Spark Charger"; vsp = spnothing;    vitem = oItemParent;        vtype = 2; vuses = -1; vdurability = 2; vprice = 300; break;//no item
    case 12: vstring = "Goat Horns";    vsp = spnothing;    vitem = oItemParent;        vtype = 2; vuses = -1; vdurability = 2; vprice = 300; break;//no item
    case 13: vstring = "Devil Horns";   vsp = spnothing;    vitem = oItemParent;        vtype = 2; vuses = -1; vdurability = 2; vprice = 300; break;//no item
    case 14: vstring = "Electro Horns"; vsp = spnothing;    vitem = oItemParent;        vtype = 2; vuses = -1; vdurability = 2; vprice = 300; break;//no item
    case 15: vstring = "Rotary Saw";    vsp = spnothing;    vitem = oItemParent;        vtype = 2; vuses = -1; vdurability = 2; vprice = 200; break;//no item
    case 16: vstring = "Two by Four";   vsp = sptwobyfour;  vitem = oTwoByFourItem;     vtype = 2; vuses = 30; vdurability = 1; vprice = 200; break;//two by four weapon
    case 17: vstring = "Fire Axe";      vsp = spfireaxe;    vitem = oFireAxeItem;       vtype = 2; vuses = 30; vdurability = 1; vprice = 800; break;//axe weapon
    case 18: vstring = "Live Wires";    vsp = splivewires;  vitem = oLiveWiresItem;     vtype = 2; vuses = 30; vdurability = 0; vprice = 200; break;//live wires
    case 19: vstring = "Laser Saw";     vsp = splasersaw;   vitem = oLaserSawItem;      vtype = 2; vuses = 30; vdurability = 0; vprice = 800; break;//laser saw
    case 20: vstring = "Small Revolver";vsp = spsmallrevolver;vitem = oSmallRevolverItem;vtype = 2; vuses = 8; vdurability = 0; vprice = 950; break;//small revolver
    case 21: vstring = "Stun Pistol";   vsp = spstunpistol; vitem = oStunPistolItem;    vtype = 2; vuses = 30; vdurability = 0; vprice = 250; break;//stun pistol
    case 22: vstring = "Resin Chunk";    vsp = spresinchunk; vitem = oResinChunkItem;   vtype = 2; vuses = 30; vdurability = 1; vprice = 200; break;//resin chunk
    case 23: vstring = "Ritual Knife";  vsp = spritualknife;vitem = oRitualKnifeItem;   vtype = 2; vuses = 30; vdurability = 1; vprice = 900; break;//ritual knife
    case 24: vstring = "Plasma Rifle";  vsp = spplasmarifle;vitem = oPlasmaRifleItem;   vtype = 2; vuses = 20; vdurability = 0; vprice = 900; break;//plasma rifle
    case 25: vstring = "Yorick's Maw";  vsp = spyoricksmaw; vitem = oYoricksMawItem;    vtype = 2; vuses = 30; vdurability = 1; vprice = 1050; break;//yorick's maw
    case 26: vstring = "Heal Ray";      vsp = sphealray;    vitem = oHealRayItem;       vtype = 2; vuses = 20; vdurability = 0; vprice = 600; break;//heal ray
    }
    
switch varg{
    case 1: return vstring; break;
    case 2: return vsp; break;
    case 3: return vitem; break;
    case 4: return vtype; break;
    case 5: return vuses; break;
    case 6: return vdurability; break;
    case 7: return vprice; break;
    }
