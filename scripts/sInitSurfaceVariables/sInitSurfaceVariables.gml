/// @description sInitSurfaceVariables
/*Called by oControl to create all the universal surface variables that will be used.
The surfaces themselves aren't created here, but rather when called - there is a check that
creates the surfaces if they don't exist.
*/

globalvar shadowvsurface,shadowdsurface,shadowcsurface,vsurface32,csurface32,dsurface32,
vsurface64,csurface64,dsurface64,vsurface128,csurface128,dsurface128,vsurface256,csurface256,dsurface256,
vsurface512,csurface512,dsurface512;

shadowvsurface = -1
shadowcsurface = -1
shadowdsurface = -1

vsurface32 = -1
dsurface32 = -1
csurface32 = -1

vsurface64 = -1
dsurface64 = -1
csurface64 = -1

vsurface128 = -1
csurface128 = -1
dsurface128 = -1

vsurface256 = -1
csurface256 = -1
dsurface256 = -1

vsurface512 = -1
csurface512 = -1
dsurface512 = -1

