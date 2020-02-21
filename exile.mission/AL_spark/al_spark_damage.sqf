//by ALIAS

if (!isServer) exitWith {};

_unit_dam_spark = _this select 0;

if (isNil (_unit_dam_spark getVariable "stare")) then {_unit_dam_spark setVariable ["stare", "liber"];};

if ((_unit_dam_spark getVariable "stare")=="ocupat") exitWith {};

//_unit_dam_spark setVariable ["stare", "ocupat", true];
_unit_dam_spark setVariable ["stare", "ocupat"];
//[str (_unit_dam_spark getVariable "stare")] remoteExec ["hint",0];
_damage_ante = getDammage _unit_dam_spark;
_unit_dam_spark setDamage [_damage_ante+0.2, true];
sleep 4;
_unit_dam_spark setVariable ["stare", "liber"];
//[str (_unit_dam_spark getVariable "stare")] remoteExec ["hint",0];
