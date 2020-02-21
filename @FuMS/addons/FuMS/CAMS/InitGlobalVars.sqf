// Template.sqf
// TheOneWhoKnocks
// 6/14/19
//
// Global variables in this file are available to the AI creation and Loot creation portions of CAMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FrSB encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others
// ******* Clothing ********************


// Uniforms

CAMS_U_Civ = [];
CAMS_U_Soldier = [];	
CAMS_U_Guerilla = [];
CAMS_U_Ghillie = [];
CAMS_U_Aviation = [];
CAMS_U_Wetsuit = [];	
CAMS_U_ALL = CAMS_U_Civ + CAMS_U_Soldier + CAMS_U_Guerilla + CAMS_U_Ghillie + CAMS_U_Wetsuit + CAMS_U_Aviation;

// Vest / Chest container items
CAMS_V_Bandolliers = [];
CAMS_V_Chestrig = [];
CAMS_V_Vests = [];
CAMS_V_Harness = [];
CAMS_V_Plate = [];

CAMS_V_Rebreather = [];
CAMS_V_ALL = CAMS_V_Bandolliers + CAMS_V_Chestrig + CAMS_V_Vests + CAMS_V_Harness + CAMS_V_Plate;

// Head/Hat items
CAMS_H_Caps = [];
CAMS_H_MilitaryCaps = [];
CAMS_H_Beanies = [];
CAMS_H_Bandannas = [];
CAMS_H_Boonie = [];
CAMS_H_Hats = [];
CAMS_H_Berets = [];
CAMS_H_Shemags = [];
CAMS_H_LightHelmet = [];
CAMS_H_RegHelmet = [];
CAMS_H_SuperHelmet = [];
CAMS_H_SpecOps = [];
CAMS_H_Aviation = [];

CAMS_H_Civ = CAMS_H_Caps + CAMS_H_Beanies + CAMS_H_Bandannas + CAMS_H_Hats;
CAMS_H_Hunter = CAMS_H_Caps + CAMS_H_Boonie + CAMS_H_Shemags + CAMS_H_MilitaryCaps;
CAMS_H_Military = CAMS_H_MilitaryCaps + CAMS_H_Berets + CAMS_H_LightHelmet + CAMS_H_RegHelmet + CAMS_H_SuperHelmet + CAMS_H_SpecOps;
CAMS_H_ALL = CAMS_H_Military + CAMS_H_Civ + CAMS_H_Boonie + CAMS_H_Shemags + CAMS_H_Aviation;


// Glasses
CAMS_G_Regular = [];
CAMS_G_Tactical = [];
CAMS_G_Sport = [];
CAMS_G_Shades = [];
CAMS_G_Lady = [];
CAMS_G_Bandana = [];
CAMS_G_Balaclava = [];

CAMS_G_Guer_ALL = CAMS_G_Regular + CAMS_G_Tactical + CAMS_G_Sport + CAMS_G_Shades + CAMS_G_Bandana + CAMS_G_Balaclava;
CAMS_G_CIV_ALL = CAMS_G_Regular + CAMS_G_Sport + CAMS_G_Shades + CAMS_G_Lady;
CAMS_G_Military_ALL = CAMS_G_Tactical + CAMS_G_Sport + CAMS_G_Shades; 

CAMS_G_ALL =CAMS_G_Regular + CAMS_G_Tactical + CAMS_G_Sport + CAMS_G_Shades + CAMS_G_Lady + CAMS_G_Bandana + CAMS_G_Balaclava;

// Items
CAMS_I_Meds = [];

// Weapon attachments
CAMS_W_Pointer = [];
CAMS_W_Bipod = [];
CAMS_W_Muzzle = [];
CAMS_W_OpticsLv1 = [];
CAMS_W_OpticsLv2 = [];
CAMS_W_OpticsLv3 = [];

CAMS_W_Optics_ALL = CAMS_W_OpticsLv1 + CAMS_W_OpticsLv2 + CAMS_W_OpticsLv3;
CAMS_W_Attachments_ALL = CAMS_W_Pointer + CAMS_W_Bipod + CAMS_W_Muzzle + CAMS_W_Optics_ALL;	

// Navigation and Belt Items
CAMS_B_Navigation = [];
	
// Backpacks
CAMS_Packs_Lv1 = [];
CAMS_Packs_Lv2 = [];
CAMS_Packs_Lv3 = [];

CAMS_Packs_ALL = CAMS_Packs_Lv1 + CAMS_Packs_Lv2 + CAMS_Packs_Lv3;

// Ammo
CAMS_AmmoForEach = ["CAMS_AmmoForEach"];

// Flares
CAMS_Flares_Chemical =[];
CAMS_Flares_Normal =[];
CAMS_Flares_1Rnd = [];
CAMS_Flares_3Rnd = [];

CAMS_Flares_ALL = CAMS_Flares_Chemical + CAMS_Flares_Normal + CAMS_Flares_1Rnd + CAMS_Flares_3rnd;

//Smokes
CAMS_Smoke_Shell = [];
CAMS_Smoke_1Rnd = [];
CAMS_Smoke_3Rnd = [];

CAMS_Smoke_ALL = CAMS_Smoke_Shell + CAMS_Smoke_1Rnd + CAMS_Smoke_3rnd;

// Explosives
CAMS_E_Grenade = [];
CAMS_E_GrenadeIR =[];
CAMS_E_GrenadeStun =[];
CAMS_E_1Rnd = [];
CAMS_E_3Rnd = [];
CAMS_E_Mine =[];
CAMS_E_IED = [];

CAMS_E_Grenade_ALL = CAMS_E_Grenade + CAMS_E_GrenadeIR + CAMS_E_GrenadeStun;
CAMS_E_Shell_ALL = CAMS_E_1Rnd + CAMS_E_3Rnd;
CAMS_E_ALL = CAMS_E_Grenade_ALL + CAMS_E_Shell_ALL + CAMS_E_Mine + CAMS_E_IED;


// ******* WEAPONS ********************

//Guns
CAMS_Pistols = [];
CAMS_Shotguns = [];
CAMS_SubMGs = [];
CAMS_LightMGs = [];
CAMS_AssaultRifles = [];
CAMS_SniperRifles = [];

CAMS_Rifles_ALL = CAMS_LightMGs + CAMS_AssaultRifles + CAMS_SniperRifles;
CAMS_Guns_ALL = CAMS_Rifles_ALL + CAMS_SubMGs + CAMS_Pistols + CAMS_Shotguns;



// ******* VEHICLES ********************
//  Toy / small / man powered type vehicles
CAMS_Toy_Bikes = [];
CAMS_Toy_Quads = [];
CAMS_Toy_Transport = [];


//  Water vehicles - C
CAMS_H20_Boats_C = [];
CAMS_H20_Jetski_C = [];
CAMS_H20_RubberDucks_C = [];
CAMS_H20_ALL_C = [];

//  Water vehicles - W
CAMS_H20_Boats_W = [];
CAMS_H20_RubberDucks_W = [];
CAMS_H20_Patrol_W = [];
CAMS_H20_SDV_W = [];
CAMS_H20_ALL_W = [];


//  Water vehicles - E
CAMS_H20_Boats_E = [];
CAMS_H20_RubberDucks_E = [];
CAMS_H20_Patrol_E = [];
CAMS_H20_SDV_E = [];
CAMS_H20_ALL_E = [];

//  Water vehicles - G
CAMS_H20_Boats_G = [];
CAMS_H20_Assault_G = [];
CAMS_H20_Armed_G = [];
CAMS_H20_Sub_G = [];
CAMS_H20_SDV_G = [];




// Helicopters
CAMS_Heli_Unarmed_C = [];
CAMS_Heli_Transport_C = [];	


CAMS_Heli_Unarmed_W = [];
CAMS_Heli_Armed_W = [];
CAMS_Heli_Transport_W = [];

CAMS_Heli_Unarmed_E = []; 
CAMS_Heli_Armed_E = [];
CAMS_Heli_Transport_E = []; 

CAMS_Heli_Unarmed_G = [];
CAMS_Heli_Armed_G = [];
CAMS_Heli_Transport_G = [];



// Aircraft

CAMS_Plane_CAS_W = [];
CAMS_Plane_UAV_W = [];

CAMS_Plane_CAS_E = [];
CAMS_Plane_UAV_E = [];

CAMS_Plane_CAS_G = [];
CAMS_Plane_UAV_G = [];


// Civilian Vehicles
CAMS_Civ_Car = [];
CAMS_Civ_Offroad = [];
CAMS_Civ_Transport = [];
CAMS_Civ_SUV = [];
CAMS_Civ_Van = [];
CAMS_Civ_Other = [];

CAMS_Civ_Work = CAMS_Civ_Car + CAMS_Civ_Offroad + CAMS_Civ_Van; 
CAMS_Civ_Truck = CAMS_Civ_Offroad + CAMS_Civ_Transport + CAMS_Civ_SUV + CAMS_Civ_Van;

CAMS_Civ_ALL = CAMS_Civ_Work + CAMS_Civ_Truck;


// Military Vehicles

CAMS_Mil_ArmedOffroad_W = [];
CAMS_Mil_UnarmedOffroad_W = [];

CAMS_Mil_UGV_Armed_W = [];
CAMS_Mil_UGV_Unarmed_W = [];
CAMS_Mil_Toy_Quad_W	= [];


CAMS_Mil_OpenTransport_W = [];
CAMS_Mil_CoveredTransport_W = [];
CAMS_Mil_UtilityVehicle_W = [];
CAMS_Mil_ArmedTransport_W = [];

CAMS_Mil_Tank_W = [];
CAMS_Mil_Artillery_W = [];

CAMS_Mil_Transport_ALL_W = CAMS_Mil_OpenTransport_W + CAMS_Mil_CoveredTransport_W + CAMS_Mil_ArmedTransport_W;

CAMS_Mil_Unarmed_W = CAMS_Mil_UnarmedOffroad_W + CAMS_Mil_OpenTransport_W + CAMS_Mil_CoveredTransport_W;
CAMS_Mil_Armed_W = CAMS_Mil_ArmedOffroad_W + CAMS_Mil_ArmedTransport_W;
CAMS_Mil_ALL_W = CAMS_Mil_Unarmed_W + CAMS_Mil_Armed_W;


CAMS_Mil_ArmedOffroad_E = [];
CAMS_Mil_UnarmedOffroad_E = [];

CAMS_Mil_UGV_Armed_E = [];
CAMS_Mil_UGV_Unarmed_E = [];
CAMS_Mil_Toy_Quad_E	= [];
CAMS_Mil_SUV_Armed_E = [];

CAMS_Mil_OpenTransport_E = [];
CAMS_Mil_CoveredTransport_E = [];
CAMS_Mil_UtilityVehicle_E = [];
CAMS_Mil_ArmedTransport_E = [];

CAMS_Mil_Tank_E = [];
CAMS_Mil_Artillery_E = [];

CAMS_Mil_Transport_ALL_E = CAMS_Mil_OpenTransport_E + CAMS_Mil_CoveredTransport_E + CAMS_Mil_ArmedTransport_E;

CAMS_Mil_Unarmed_E = CAMS_Mil_UnarmedOffroad_E + CAMS_Mil_OpenTransport_E + CAMS_Mil_CoveredTransport_E;
CAMS_Mil_Armed_E = CAMS_Mil_ArmedOffroad_E + CAMS_Mil_ArmedTransport_E;
CAMS_Mil_ALL_E = CAMS_Mil_Unarmed_E + CAMS_Mil_Armed_E;



CAMS_Mil_ArmedOffroad_G = [];
CAMS_Mil_UnarmedOffroad_G = [];

CAMS_Mil_UGV_Armed_G = [];
CAMS_Mil_UGV_Unarmed_G = [];
CAMS_Mil_Toy_Quad_G	= [];
CAMS_Mil_SUV_Armed_G = [];

CAMS_Mil_OpenTransport_G = [];
CAMS_Mil_CoveredTransport_G = [];
CAMS_Mil_UtilityVehicle_G = [];
CAMS_Mil_ArmedTransport_G = [];

CAMS_Mil_Tank_G = [];
CAMS_Mil_Artillery_G = [];

CAMS_Mil_Transport_ALL_G = CAMS_Mil_OpenTransport_G + CAMS_Mil_CoveredTransport_G + CAMS_Mil_ArmedTransport_G;

CAMS_Mil_Unarmed_G = CAMS_Mil_UnarmedOffroad_G + CAMS_Mil_OpenTransport_G + CAMS_Mil_CoveredTransport_G;
CAMS_Mil_Armed_G = CAMS_Mil_ArmedOffroad_G + CAMS_Mil_ArmedTransport_G;
CAMS_Mil_ALL_G = CAMS_Mil_Unarmed_G + CAMS_Mil_Armed_G;


//////////////////////////// Misc

// Static Guns
CAMS_Mil_StaticGuns_W = [];
CAMS_Mil_StaticGL_W = [];
CAMS_Mil_Mortar_W = [];
CAMS_Mil_StaticAA_W = [];
CAMS_Mil_StaticAT_W = [];

CAMS_Mil_StaticGuns_E = [];
CAMS_Mil_StaticGL_E = [];
CAMS_Mil_Mortar_E = [];
CAMS_Mil_StaticAA_E = [];
CAMS_Mil_StaticAT_E = [];

CAMS_Mil_StaticGuns_G = [];
CAMS_Mil_StaticGL_G = [];
CAMS_Mil_Mortar_G = [];
CAMS_Mil_StaticAA_G = [];
CAMS_Mil_StaticAT_G = [];



// Wrecks
CAMS_Hist_Wreck = [];
CAMS_Car_Wreck = [];
CAMS_Truck_Wreck = [];
CAMS_Vehicle_Wreck = [];
CAMS_Tank_Wreck = [];
CAMS_Heli_Wreck = [];
CAMS_Plane_Wreck = [];
CAMS_Boat_Wreck = [];

CAMS_Wreck_Land = CAMS_Car_Wreck + CAMS_Truck_Wreck + CAMS_Vehicle_Wreck + CAMS_Heli_Wreck + CAMS_Plane_Wreck + CAMS_Hist_Wreck;


// Global Collections





CAMS_ListofCAMSGlobalItems =
[


"CAMS_AmmoForEach",

  //Vehicle
"CAMS_Toy_ALL"

];

//Admin ATTENTION!
// Any new global arrays you want to have available on the headless client need to be defined in this file.
// Define the array below, then place the name of the array in the 'CAMS_ListofCustomGlobalItems' variable below.
// At initialization your global variable will be passed onto the HC prior to it attempting to initialize any missions.
CAMS_MyExampleGlobalVariable = ["Chemlight_blue","Chemlight_green","Chemlight_red"];

CAMS_ListofCustomGlobalItems =
[
	"CAMS_MyExampleGlobalVariable"
];

    
	
	
	

