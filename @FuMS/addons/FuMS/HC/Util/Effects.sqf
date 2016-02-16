//Effects.sqf
// Horbin
// 4/20/15
// based upon coding example from : 
// http://forums.bistudio.com/showthread.php?149032-Spawning-fire&p=2344816&viewfull=1#post2344816
// Inputs: object to attach effect too.
//   effect "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL","SMOKE_MEDIUM","SMOKE_BIG",
//   
private["_effect","_pos","_fire","_smoke","_object","_eFire","_eSmoke"];
private["_light","_brightness","_color","_ambient","_intensity","_attenuation"];

        _object     = _this select 0;
        _effect = toupper (_this select 1);

        _fire    = "";
        _smoke    = "";
        _light    = objNull;

        _color        = [1,0.85,0.6];
        _ambient    = [1,0.3,0];

        switch (_effect) do
        {
            case "FIRE_SMALL":
            {
                _fire     = "SmallDestructionFire";
                _smoke     = "SmallDestructionSmoke";
            };
            case "FIRE_MEDIUM":
            {
                _fire     = "MediumDestructionFire";
                _smoke     = "MediumDestructionSmoke";
                _brightness    = 1.0;
                //_color    = [1,0.85,0.6];
                //_ambient    = [1,0.3,0];
                _intensity    = 400;
                _attenuation    = [0,0,0,2];
            };
            case "FIRE_BIG":
            {
                _fire     = "BigDestructionFire";
                _smoke     = "BigDestructionSmoke";
                _brightness    = 1.0;
                //_color    = [1,0.85,0.6];
                //_ambient    = [1,0.45,3];
                _intensity    = 1600;
                _attenuation    = [0,0,0,1.6];
            };
            case "SMOKE_SMALL":
            {
                _smoke     = "SmallDestructionSmoke";
            };
            case "SMOKE_MEDIUM":
            {
                _smoke     = "MediumSmoke";
            };
            case "SMOKE_BIG":
            {
                _smoke     = "BigDestructionSmoke";
            };
        };

      //  diag_log format ["<FuMS> Effects: Creating Effect :%1 %2 on %3",_fire, _smoke, _object];
        
        if (_fire != "") then
        {
            _eFire = "#particlesource" createVehicle (position _object) ;
            _eFire setParticleClass _fire;
            //_eFire setPosATL _pos;
			_eFire attachto [_object, [0,0,-1]];
        };

        if (_smoke != "") then
        {
            _eSmoke = "#particlesource" createVehicle (position _object);
            _eSmoke setParticleClass _smoke;
           // _eSmoke setPosATL _pos;
		   _eSmoke attachto [_object, [0,0,-1]];
        };

        //create lightsource
        if (_effect in ["FIRE_BIG","FIRE_MEDIUM"]) then
        {
			_pos = position _object;
            _pos   = [_pos select 0,_pos select 1,(_pos select 2)+1];
            _light = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
            //_light setPosATL _pos;
            _light attachto [_object, [0,0,-1]];
            _light setLightBrightness _brightness;
            _light setLightColor _color;
            _light setLightAmbient _ambient;
            _light setLightIntensity _intensity;
            _light setLightAttenuation _attenuation;
            _light setLightDayLight false;
        };

