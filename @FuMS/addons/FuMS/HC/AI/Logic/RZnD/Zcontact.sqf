//contact.sqf
// code built upon various Dayz arma2 scripts.
private ["_zombie","_return","_a","_b","_targetAngle","_eyeDir","_eyeAngle","_fogc","_target"];
 _zombie = _this select 0;
 _target = _this select 1;
_return = false;

//if ((_zombie distance _target) < 5) then {
    if (false) then {
        // removed 'smelling' to permit use of this function to keep zombies from attacking through objects!
	//Zombie smells player
	//hintSilent formatText ["Smelled: %1, Distance: %2", name _target, _zombie distance _target];
 //   diag_log format ["##Contact: %1 smells %2 within 5m'!",_zombie, _target];
	_return = true;
} else {
	_a = (getPos _target select 0) - (getPos _zombie select 0);
	_b = (getPos _target select 1) - (getPos _zombie select 1);
	_targetAngle = abs(_a atan2 _b);
	_eyeDir = eyeDirection _zombie;
	_eyeAngle = abs((_eyeDir select 0) atan2 (_eyeDir select 1));

	//DEBUG: Show angle towards player and angle of view
//	diag_log format ["##Contact: Angle: %1, Eyedirection: %2", _targetAngle, _eyeAngle];

	//FOV of the a grown up human is about 180 degrees, but that would be unbalanced
	if (abs(_targetAngle - _eyeAngle) < 60) then {
	
		if (!(terrainIntersectASL[eyePos _target, eyePos _zombie])) then {
			if (!(lineIntersects[eyePos _target, eyePos _zombie])) then {
				_fogc = 0 max (1 - fog);
				if (stance _target == "STAND") then {
					if ((_target distance _zombie) < (40+(60*_fogc))) then {
	//					diag_log format ["Spotted: %1, Distance: %2", name _target, _target distance _zombie];
						_return = true;
					};
				};
				if (stance _target == "CROUCH") then {
					if ((_target distance _zombie) < (25+(35*_fogc))) then {
	//					diag_log format ["Spotted: %1, Distance: %2", name _target, _target distance _zombie];
						_return = true;
					};
				} else {
					if ((_target distance _zombie) < (20+(10*_fogc))) then {
	//					diag_log format ["Spotted: %1, Distance: %2", name _target, _target distance _zombie];
						_return = true;
					};
				};
			};
		};
	};
};
_return
//};