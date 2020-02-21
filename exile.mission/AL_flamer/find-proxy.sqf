private ["_worldPos","_ball","_modelPos","_inArray","_veh","_sortedArr","_unsortedArr"];
_unsortedArr =["spine","spine1","spine2","spine3","head","leftshoulder","leftarm","leftarmroll","leftforearm","leftforearmroll","lefthand","rightshoulder","rightarm","rightarmroll","rightforearm","rightforearmroll","righthand","pelvis","leftupleg","leftuplegroll","leftleg","leftlegroll","leftfoot","lefttoebase","rightupleg","rightuplegroll","rightleg","rightlegroll","rightfoot","righttoebase","weapon","launcher","nvg","lefthandindex1","lefthandindex2","lefthandindex3","lefthandmiddle1","lefthandmiddle2","lefthandmiddle3","lefthandring","lefthandpinky1","lefthandpinky2","lefthandpinky3","lefthandring1","lefthandring2","lefthandring3","lefthandthumb1","lefthandthumb2","lefthandthumb3","righthandindex1","righthandindex2","righthandindex3","righthandmiddle1","righthandmiddle2","righthandmiddle3","righthandring","righthandpinky1","righthandpinky2","righthandpinky3","righthandring1","righthandring2","righthandring3","righthandthumb1","righthandthumb2","righthandthumb3","neck","eyeleft","eyeright","neck1","proxy:\a3\characters_f\proxies\weapon.001","proxy:\a3\characters_f\proxies\pistol.001","proxy:\a3\characters_f\proxies\binoculars.001","proxy:\a3\characters_f\proxies\launcher.001","proxy:\a3\characters_f\proxies\nvg.001","proxy:\a3\characters_f\proxies\flag.001","proxy:\a3\characters_f\proxies\equipment.001","proxy:\a3\characters_f\proxies\backpack.001","proxy:\a3\characters_f\proxies\pistol_holstered.001","face_jowl","proxy:\a3\characters_f\proxies\glasses.001","proxy:\a3\characters_f\proxies\headgear.001","proxy:\a3\characters_f\proxies\hair.001","proxy:\a3\characters_f\proxies\backpack2.001","proxy:\a3\characters_f\proxies\radio.001","body_proxy","head_proxy","proxy:\a3\characters_f\proxies\hmd.001","face_jawbone","face_chopleft","face_cornerright","face_lipupperright","face_lipuppermiddle","face_lipupperleft","face_liplowermiddle","face_liplowerright","face_browfrontright","face_browsideright","face_cheeksideright","face_cheekupperright","face_chopright","face_eyelidupperright","face_forehead","face_nostrilright","face_cheekfrontright","face_eyelids","face_nostrilleft","face_eyelidlowerright","face_chin","face_browmiddle","face_tongue","face_cheeksideleft","face_cheekupperleft","face_browsideleft","face_browfrontleft","face_eyelidupperleft","face_eyelidlowerleft","face_cornerleft","face_liplowerleft","face_cheekfrontleft","l_eye","r_eye","camo1","camo2","malehead","personality","camo_head","camo_arm_left","camo_body","camo_arm_right","camo_leg_right","camo_leg_left","camo"];

_veh = cursorTarget;

if (not isNull _veh) then
{
_sortedArr = [];

{
	_inArray = _x in _sortedArr;
	if (not _inArray) then
	{
		_modelPos = _veh selectionPosition _x;
		if (not (_modelPos isEqualTo [0,0,0])) then
		{
			_sortedArr set [count _sortedArr, _x];
			_worldPos = _veh modelToWorld _modelPos;
			_ball = "Sign_Sphere10cm_F" createVehicleLocal _worldPos;
			//_ball = "Item_Rangefinder" createVehicleLocal _worldPos;
			_ball setPosATL _worldPos;
		};
	};
	hint str _x;
	sleep 0.1;
} forEach _unsortedArr;

diag_log "[";
{
	diag_log format ["%1", _x];
} forEach _sortedArr;
diag_log "];";
};