// Time multiplier
// TheOneWhoKnocks
// 3/24/2020
// Heavily inspired by Occupation code

while {true} do
{

	private["_timeMultiplier"];
	if (daytime > 18 || daytime < 6 ) then // (After 6 PM but before 6 AM - Night)
	{ 
		_timeMultiplier = 12; 				// Time runs wheerr 1 hour is 12 (makes night go fast, then server reboot)
	} 
	else  
	{
		_timeMultiplier = 4;				// 3 hours from sun up to sun down (12 hours day)
	};

	if(timeMultiplier != _timeMultiplier) then { setTimeMultiplier _timeMultiplier; };

	_hour = floor daytime;
	_minute = floor ((daytime - _hour) * 60);
	_time24 = text format ["%1:%2",_hour,_minute];

	_logDetail = format ["<FuMS:FastNights>:  Current in game time is %1 multipler is %2",_time24,_timeMultiplier];
	diag_log _logDetail;
	sleep 300; // check every 5 minutes
};