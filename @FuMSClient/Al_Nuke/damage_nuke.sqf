// by ALIAS

#define MAP_TYPES_BUILDING			["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"]
#define MAP_TYPES_VEGETATION		["TREE","SMALL TREE","BUSH"]
#define MAP_TYPES_WALL				["WALL","FENCE"]
#define MAP_TYPES_MISC				["ROCK","ROCKS","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","CROSS","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE","QUAY","HIDE","BUSSTOP","ROAD","FOREST","TRANSMITTER","STACK","TOURISM","WATERTOWER","TRACK","MAIN ROAD","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","TRAIL"]
#define CUSTOM_TYPES_MISC			["HOUSE","MAN","CAR","TANK","PLANE","HELICOPTER"]
#define HIDE_OBJ					["Land_MilOffices_V1_F","Land_dp_smallFactory_F"]

all_obj = MAP_TYPES_BUILDING+MAP_TYPES_WALL+MAP_TYPES_VEGETATION+MAP_TYPES_MISC;

_mark_x = _this select 0;
_radius_x =  _this select 1;
_npos = position _mark_x;
obj_x = nearestTerrainObjects [_npos,all_obj,_radius_x,false];
c_obj = nearestObjects [_npos,CUSTOM_TYPES_MISC, _radius_x];
obj_x = obj_x + c_obj;
{if (_x !=_mark_x) then {if (typeof _x in HIDE_OBJ) then {_x hideObjectGlobal true} else {_x setDamage [1,false]}; sleep 0.01}} foreach obj_x;

/*
"Land_NavigLight","Land_runway_edgelight","Land_Flush_Light_red_F","Land_Flush_Light_green_F","Land_runway_edgelight_blue_F","Land_Flush_Light_yellow_F","Land_NavigLight_3_F"

"Land_Cargo40_military_green_F","Land_Cargo20_grey_F","Land_Cargo20_military_green_F","Land_Cargo20_cyan_F"