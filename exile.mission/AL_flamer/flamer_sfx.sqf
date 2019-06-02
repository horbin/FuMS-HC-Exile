// by ALIAS
fnc_flamer_SFX = {
	_r = [];
	_comp_obj_flamer = _this;
	{
		_part_gost = "#particlesource" createVehicleLocal (getPosATL _x);
		_part_gost setParticleCircle [0,[0,0,0]];
		_part_gost setParticleRandom [0.1,[0.1,0.1,0.5],[0,0,0.2],1,0.1,[0,0,0,0],1,0];
		_part_gost setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",16,15,10,1],"","Billboard",1,0.3,[0,0,0],[0,0,0],15,7,7.9,1,[0.5,0.5,0.1],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[2],1,0,"","",_x];
		_part_gost setDropInterval 0.05;
		_r pushBackUnique _part_gost;
	} forEach _comp_obj_flamer;
	_r
};

private ["_li_fire","_lit","_part_gost","_part_gost_sec","_comp_obj_casp","_tease_voice","_flamer"];
if (!hasInterface) exitWith {};

_flamer = _this # 0;
_damage_flamer = _this # 1;
_comp_obj_casp = [];

player setSpeaker "NoVoice";
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
eko_bomb = _soundPath + "sound\sound_flamer\eko_bomb.ogg";
eko_sharp = _soundPath + "sound\sound_flamer\eko_sharp.ogg";
enableCamShake true;

waitUntil {sleep 5; player distance _flamer <1000};
_flamer spawn {while {alive _this} do {if (_this getVariable "vizibil") then {[_this,["flamer_voice", 100]] remoteExec ["say3d"]}; sleep 5 + random 1}};

_pct_flamer=["spine3","leftshoulder","leftforearmroll","leftleg","leftfoot","leftupleg","rightshoulder","rightforearmroll","rightupleg","rightleg","rightfoot","pelvis","neck","leftforearm", "rightforearm"];
{_part_surs = "Land_HelipadEmpty_F" createVehiclelocal [0,0,0]; _comp_obj_casp pushBack _part_surs; _part_surs attachTo [_flamer, [0,0,0],_x]} forEach _pct_flamer;
_part_array_flamer = _comp_obj_casp call fnc_flamer_SFX;
_part_gost_sec = "#particlesource" createVehicleLocal (getPosATL _flamer);
_part_gost_sec setParticleCircle [0,[0,0,0]];
_part_gost_sec setParticleRandom [0,[0.3,0.5,0.5],[0,0,0.1],0,0,[0,0,0,0],0,0];
_part_gost_sec setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,0.5,[0,0,1],[0,0,0.2],5,10,7.9,0,[3,2,5],[[1,1,1,1],[1,1,1,0.5],[1,1,1,0]],[1],0,0,"","",_flamer];
_part_gost_sec setDropInterval 0.05;

_li_fire = "#lightpoint" createVehicle getPosATL _flamer;
_li_fire lightAttachObject [_flamer, [0,0,3]];
_li_fire setLightAttenuation [0,0,0,0,0.1,10];
_li_fire setLightBrightness 1;
_li_fire setLightDayLight true;	
_li_fire setLightAmbient[1,0.2,0.1];
_li_fire setLightColor[1,0.2,0.1];

while {(_flamer getVariable "vizibil")and(alive _flamer)} do 
{
	_li_fire setLightBrightness 5+(random 1);
	_li_fire setLightAttenuation [0,0,100,0,0.1,15+(random 1)];
	sleep 0.05+(random 0.1);
	sleep 1;
	if (player distance _flamer < 5) then {addCamShake [5,2,5]; call BIS_fnc_flamesEffect; [10] call BIS_fnc_bloodEffect;call BIS_fnc_indicateBleeding};
};
deleteVehicle _part_gost_sec; deleteVehicle _li_fire;
{deleteVehicle _x} forEach (_comp_obj_casp + _part_array_flamer);