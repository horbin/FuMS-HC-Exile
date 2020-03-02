# Fulcrum Mission System (FuMS)

------------------------------------------------------------------------------------
###### Read the information in the Docs folder, or you are missing out!
------------------------------------------------------------------------------------

v0.50d
****
Developer's Edition
###### This is nearly complete (updating documentation still) version with nearly all mission types turned back on
###### This will be completed soon and all functions turned back on
****

* I suck at updating the documentation but I do comment the code pretty heavily, and the missions do a pretty good job of showing you what options there are. *

System Changes:
- ALIAS anomolies mission spawner working (Random anomoly will spawn looking like small bandit camp until the player gets close enough...)
	- Anomolies supported:
	- Farty
	- Slimer
	- Suicide Bombers
	- Sparky
	- Flamer

- New Dynamic Mission Spawning system implemented for the following themes: (Lighter load on CPU for inactive missions, more immersion programmed in with counter attacks and reinforcements)
	- TownAttack - Now can be of different types of initial soldiers (West, East, Independent) that are guarding a town and as you approach, it comes under attack.
	- StaticSpawns - Reworked to be more efficient in CPU time and more fun to find
	- VehicleHijacks - Updated version of DynamicVehicles missions type missions.  Get in, steal a vehcile, kill anyone who tries to stop you.

- Added new AI Logic
	- Air Evac (AI can call in a transport helicopter to evacuate remaining soldiers.  Armed transport heli will come in and evac any units in area)
	- SADRoute (Search and Destroy type convoys, works better with helicopters) 

- Custom magazine spawns: standard mag (picks "default" mag), random mag (random selection of of all available types), and forbidden mags(WIP) as options.  	

// Radio Chatter is still heavy WIP
- Enabled basic radio chatter with audio from mission events (re-enforcements, counter attacks will gerate radio squak and message on screen)
	- Audio can be disabled in config files
	- Entire system can be disabled in config files

Code changes:
- Implemented CAMS (Common Asset Management System) for easy integration with custom content
- All mission themes updated for new CAMS system
- Added new trigger "TAKEVEHICLE" to monitor for stolen vehicles that have been moved a minimum distance
- Created new LOITER logic so soldiers use ambient animation and new LOITER waypoints
- Added ability to designate specific types of locations for individual missions, as opposed to one type for the whole theme (Missions can spawn in VILLAGES, MARINE, CITIES, ETC.)
- Rockets now offer a percentage chance to be spawned on AI (Controls randomization and rareness of loot)
- Began seperation of Exile code to support future stand alone system 
- Rewrote GlobalLoootData for more generic settings and compatability with CAMS
- Rewrote GlobalSoldierData to have better "classes" and different sides (East, West)
- Added in debug options in a lot of functions for development
- Lot of reformatting to clean up code

v0.49
****
Mission FX Upgrade
****
- Added Mission FX system to add ability to add ALIAS Anomolies to missions
- Included a mission generator to pop up camps randomly
- Added ability to give vehicles as loot
- Loot vehicles are air dropped in
- Major rework of mission loot, still WIP
- Added more reinforcemnt options including ground and vehicle based responses
- Fixed errors in server.rpt regarding poles
- Standardized all AI roaming vehicles to same model, same that is blocked from player usage
- Added Poptab bag as loot crate that you can add poptabs directly to
- Minor bug fixes
- Developing new "location scouting" engine to offer more control over mission spawn locations
- Trying out new functions to optimze performance

Additional missions:

STATIC BORNHOLM MISSIONS
	- Foothold 					([CiC]red_ned)
	
STATIC CHERNARUS MISSIONS
	- AI Base (NWAF)			
	- AI Base (N)				


	
STATIC NAMALSK MISSIONS
	- Lubjansk					([CiC]red_ned)
	
STATIC NAPF MISSIONS
	- Castle 					([CiC]red_ned)
	
STATIC TANOA MISSIONS
	- Comms Alpha 				([CiC]red_ned)
	- Georgetown 				([CiC]red_ned)
	- Hotel Invasion 			([CiC]red_ned)


v0.420
****
- Added ability to import mission building info from ASL type missions (Old school missions that used Above Sea Level rules when exporting their data)
- Added "LOITER" AI logic to make AI stand guard in one spot until combat starts
- Added "TimerNoPlayers" trigger so that you can have a timer end a mission unless there are players withen 300 m
- Added ability to randomize loot drop locations by providing array in loot location
- Corrected issue where AI would start shooting at each other, especially crews and drivers
- Did some preliminary work on adding in Raptors and Destroyer static vehicle
- Added ability to add in more popcaps per mission loot box (default is 500 + up to 1000 more but you can specify random amount in loot file)
- Corrected issue when mission buildings are spawned in but didn't match terrain.  Now buildings will reset properly even on hillsides
- Corrected issue with mission buildings spawning in without simluation enabled.  They also cannot be destroyed
- Modified ZUPA code to use Exile Toasts to annouce status of mission capture points
- Corrected issue with Admin Menu that displayed error on menu
- Created mission template to fully document the mission system (WIP, this will be corrected soon)
- Ported over missions from these several great authors who were graciious enough to let me include in the base FuMS system
	
	STATIC ALTIS MISSIONS
	- Abandoned Village 		([CiC]red_ned)
	- AI Island					([CiC]red_ned)
	- Bosmos					([CiC]red_ned)
	- Castle-183				([CiC]red_ned)
	- Chelonisi					([CiC]red_ned)
	- Destroyer 				(=CF=Dragunov) (STILL WIP, DO NOT USE)
	- GraveRobbers				(Mythbuster)
	- Military Junkyard			([CiC]red_ned)
	- Kastro Castle				([CiC]red_ned)
	- Kavala Hospital			(=CF=Dragunov)
	- KoreFactory				(=CF=Dragunov)
	- Labrinthe					(Kimi_Hunters)
	- Marsh Battle				(Mythbuster)
	- Kill the Mayor			([CiC]red_ned)
	- Military Raid				(HeadlessRocket)
	- Open Harbor				(Mythbuster)
	- PowerPlant				(=CF=Dragunov)
	- Proteus					(=CF=Dragunov)
	- Radioactive				(=CF=Dragunov)
	- Storage Invasion			([CiC]red_ned)
	
	DYNAMIC AI TYPE MISSIONS
	
	- ned Bandit				([CiC]red_ned)
	- ned Reserach Mission		([CiC]red_ned)
	- ned Sniper Camp			([CiC]red_ned)
	- Pauls Bambi Slide			(GolovaRaoul)
	
	DYNAMIC LOOT TYPE MISSIONS
	
	- ned Building Materials	([CiC]red_ned)
	- ned Cash Bandits			([CiC]red_ned)
	- ned Drinks Transport		([CiC]red_ned)
	- ned Guns Guns Guns		([CiC]red_ned)
	- ned Medical Mission		([CiC]red_ned)
	- Pauls Beert Transport 	(GolovaRaoul)
	- Pauls IKEA loot			(GolovaRaoul)
	
	DYNAMIC VEHICLE MISSIONS
	
	- ned Civilian Car			([CiC]red_ned)
	- ned Hatch Back			([CiC]red_ned)
	- ned Huey 					([CiC]red_ned)
	- ned Hunter				([CiC]red_ned)
	- net Ifrit					([CiC]red_ned)
	- ned Offroad				([CiC]red_ned)
	- ned Strider				([CiC]red_ned)
	- ned Ural					([CiC]red_ned)
	- Paul Anti-Air				(GolovaRaoul)
	- Pauls Little Bird			(GolovaRaoul)
	
These missions help document the new features and options for mission spawning so pleaes look through them to see if answers your questions.




v0.41 (Bug Squashin') 
**** 
- Repaired "Bodycount" trigger to function properly, now Convoy and TownInvasion missions complete properly  
- Modified Convoy to spawn in Cities or Capitols as opposed to randomly, which ended up leaving trucks in the middle of forests on small or dense maps  
- Modified convoy to use Cities as waypoints instead of villages which are often in densely forested areas  
- Updated all mission themes to make them easier to read and customize  
- Added announcements to missions spawned on players to give hints of trouble. (Might spawn on all players???) 
- Corrected spawn points of Roadblock_pato theme so AI doesn’t get stuck  
- Minor adjustments to several default themes  
- Disabled zombie missions on default load (still supported,  but not ON by default)  
- Changed out road patrol vehicle to Exile Off-road ( not everyone uses UGVs but easy to add)  
- Removed specific weapons and rounds from some missions, trying to use FuMS groups for all missions 
 
v0.4 (The ReLaunch)
****
NOTE TO ADMINS: Some changes to the Themes was neccesary to utilize the Exile Toast system.  Previously the mission annoucement had
three lines, but the new system only has two, a title and a message body.  This is the only change needed to update your missions
to display properly using Exile Toasts.  Please see updated Themes in the download to see what changes you need to make.
***

+ Added Exile Toasts and replaced current FuMS_Global Message system (code will be deprecated in next version and removed)
+ Updated AI difficulty engine to include setting the "general" setting which seemed to be preventing AI from doing anything at times
+ Updated AI difficulty settings to "MODERATE" level simliar to other AI systems (will be variable int the future)
+ Added poptabs to mission crates (Preset values of 500 + up to 1000 more per create, will be customizable in the future)
+ Added poptabs to soldiers (Preset value of up to 500 poptabs per soldier, will be customizable in the future)
+ Added Tanoa based versions of base locations for Roadblock Pato (Currently supports Altis and Tanoa)

v0.3a (bug fixes and tweaks)
****
NOTE TO ADMINS: Save your \FuMS\Themes folder! Unless specifically indicated after updating to any newer version of FUMS you will be able to copy over the \FuMS\Themes
folder with your current folder. This should prevent any rework on your part and permit you to immediately use any new functionality added while keeping
your server configured as it was prior to the update.
****

+ changed zombie missions the the 'Zombies' theme to not require bombs. Missions now complete when all zombies are dead.
  towns infected will 'repopulate' 1 hour after the town is cleared of zombies.

+ coded added to force zombies to die if they attack a player within 150m of a safe zone.

+ verified code to prevent zombies from damaging players when within 200m of a safe zone. No code changes made. If players still experiencing
death by zombie in safe zones, they are lying to you :) or some other mod is being used for your safe zones. (or I still have not found the bug?)

+ corrected bug in Playerwatch that was using spawn zone locations for 'safezone' position logic.
   Safe zones are now properly identified by PlayerWatch.
   
+ changed failure condition of captive missions from a 'timeout' to 'lowcaptive' count of zero. Captive missions will now
  remain active until either completed, or no captives remain alive.  
  
+ added "CAPTIVE" as an option to LowUnitCount and HighUnitCount triggers. 


v0.3
-fixed typo in @FuMS config.cpp
-removed legacy startup code for FuMS on server
    Thank you Terd Fergasen
-fixed 'multiple building' bug in the Zombies theme.
-fixed a bug with the server FPS monitor was not properly capturing server FPS
-tweaked Heartbeat values to reduce excessive server logging of non-HC error conditions
-added code to prevent zombies from doing damage witin 200m of exile designated trader zones.
-fixed 'safe mission position spawn' code to recognize Exile Territories (only when players are near them). This should prevent
a mission from randomly spawning on top of a player's base while he is at the base.
- fixed a bug with the ProxPlayer trigger that was causing some missions to not behave correctly (specifically zombie missions ending)

+ Roadblock theme
Based upon the concept and building layout of Pato!
1. Specific to ALTIS
2. Can be modified to other maps or other locations in altis by changing the mission spawn locations in ThemeData.sqf
3. See "RoadBlock" loot in GlobalLootData.sqf for customization of loot left by the occupying soldiers.

+ Player Watch
New Theme process model called 'player watch'.
This monitors a player's location and based upon configurable options from the admin will launch missions.
Config file \FuMS\Themes\PlayerWatch\PlayerWatchConfig.sqf

Player watch performs a check every few minutes (configurable). If the check passes, information
about the players location is gathered and a mission is spawned near the player.
See PlayerWatchConfig.sqf for what mission will be launched.

List of locations and default mission type:
In trader zone - NONE
In own territory - small band of friendly armed civilians
In another territory - helo drop of 1-3 AI
In air vehicle - armed helo
In vehicle on land - armed Unmanned Vehicle
In vehicle in water - armed attack boat
In water - 3 man hostile dive squad
In spawn zone - zombies
In a town - squad of AI w/ a UAV
near a road - zombies
default (wilderness) - 2 squads of AI fighting each other

See Docs folder and comments in PlayerWatchConfig.sqf file to customize!






v0.2a
- corrected code to properly monitor server FPS is above the specified threshold before spawning a new mission.

- corrected mission configuration error with Zombie theme that was spawning multiple structures and excessive zombies.

  Sorry guys...but I did say happy halloween ;) Trick or Treat!

v0.2 Ryan's Zombies and Demons Support!
   Happy Halloween!!!
   
ADMIN NOTE: ENSURE mpmission.pbo HC folder is updated with this distro, not just the @FuMS folder!

- AI vehicles will maintain fuel level as long as original driver is alive.
- Old Mod dependency:
   Fixed AI cleanup
   Fixed ProxPlayer trigger

+ Ryan Zombie and Demons support:
1) Install it per the mod's instructions
2) Players WILL need to install/use this mod also, but trust me, its worth it.
3) Zombie Theme
  Background: Out of the list of Villages, Cities, and Captials of the land, Nine are infected by an evil presense. 
  It is up to the Exiled to located the source of this presense and destroy it before the area becomes totally overrun!
  
  What to expect:
  Civilian zombies = not too smart, but quick on their feet
  Soldier zombies = a little stronger, able to move vehicles around, and perform other feats of strength.
  Spider zombies = acute senses, hard to lose once they have you trail. Able to leap most obsticles in pursuit of their prey.
  Rumored to be able to take down low flying helocopers when attacking in mass.
  Zombie Boss = zombie on steroids, best bet, Run!
  
  Smoking obelisk in the center of town is guarded by a Horde. Use the explosives that are nearby to destroy the obelisk, 
  stop the infection and claim your reward!
  
  Note: For initial install, the infected towns are indicated on the map. Change the 'Show encounter' setting in the Zombies\SpawnTrigger.sqf
  mission to 'false' for your production servers if you do not want your players knowing where the infected are hiding.
  
1.	syntax: ["ZOMBIE", [spawnloc], [actionloc],[Detection_range, FlagCanThrow, WonderRange]]
2.	-spawnloc: offset or specific map location group will spawn
3.	-actionloc: --no functionality-- leave as [0,0]
4.	-options 
	a.	Detection_range = distance in meters beyond which zombies will not identify/engage AI and players.
		1.	Zombies have an accute sense of vehicles and will detect players in vehicles if they come within this range regardless of Line of sight.
	b.	FlagCanThrow: true = zombies have a chance to move vehicles out of their way when pursing players.
	c.	Wonder_range = distance a target must get away from the zombie to lose it. 
		1.	Players can lose the zombie in a range shorter than this, but it depends on their ability to block LOS/detection of the zombie to cause it to forget about the player(zombie types have different memories!)
5.	Behavior: Full implementation of Ryan's Zombie and Demons AI.
	a.	Zombies will wonder around until they locate a player or non-side "WEST" AI.
	b.	Zombies will pursue until dead or distracted by a closer target, or player can 'shake' them.
	c.	Zombies will attack cars, boats, helicopters, and static weapons when they are occupied by players/AI.
	d.	Zombies will not attack unoccupied vehicles, but will throw them!
	e.  It is rumored that spiderzombies will attack flying helo's and are even able to board them in search of their prey!
6.	Type Zombies:
	a.	Zombie  Jump 0%/10m ThrowCar 0% Memory 2sec
	b.	ZombieSoldier Jump 5%/20m ThrowCar 60% Memory 4sec
	c.	ZombieSpider Jump 50%/40m ThrowCar 5% Memory 8sec
	d.	ZombieBoss Jump 80%/35m ThrowCar 80% Memory 12sec



v0.1 Initial Port
   See : https://github.com/horbin/FuMS-HC-Server/blob/master/README.md
   for original development path under EPOCH mod.


Installation: (see file in this distro, or read below)
1. Headless Client Installation:

2. See Exile Dedicated server installation here:
3. http://www.exilemod.com/topic/12150-server-installationupgrade-guide-096-pomelo-namalsk/

NOTE: Logs created by the HC will be located in the C:\Arma\Server\HCLogs folder.

	e. See \Docs\Install Examples\mission.sqm
	Modify your mpmissions\Exile.Altis.pbo 's  mission.sqm file
	
		i. Locate:
		
			Class Groups
			
			{
				items = 1;
				
				class Item 0
				
				{
				
		ii. Change items =1; to items=2;
		
		iii. Add the following AFTER the closing }; for the 'class Item 0' definition
		
class Item1

{

	 side="LOGIC";
	 
	class Vehicles
	
            	{
            	
                	items=1;
                	
	                class Item0
	                
	                {
	                
	                    position[]={10720.502,12.714643,11356.243};
	                    
                	    id=100;
                	    
	                    side="LOGIC";
	                    
	                    vehicle="HeadlessClient_F";
	                    
	                    player="PLAY CDG";
	                    
                	    init="this enableSimulation false; this allowDamage false";
                	    
	                    leader=1;
	                    
	                    skill=0.60000002;
	                    
	                    text="HC_HAL";
	                    
                	};
                	
	};
	
 };

	f. Save the mission.sqm file.

## Your server is now ready to accept an HC!

2) FuMS Installation 
	a.   Copy the HC folder in the distribution to your mpmissions/Exile.Altis.pbo
		Add []execVM "HC\init.sqf" to the TOP of the initPlayerLocal.sqf file.
	
	b.  Copy the @FuMS folder to your base server directory (C:\Arma\Server)
		Do this on your SERVER. No need to put this folder on your HC!
	c. Modify your server start parameters to include -servermods=@FuMS;
	
	d. Don't forget to repack your mpmissions pbo!

3) Start your HC, feel free to leave it running.

4) Start your Server.  You should see the HC connect as soon as the server unlocks. 
Default FuMS distribution has some theme sets starting with no players. All others are defaulted to start when at least one player is logged in.

5) Go read the \Docs\ Folder to learn how to customize the themes and missions to meet your server's needs!

6) Still can't figure it out. Send me a PM, or post on the thread!

************************************************
Optional
************************************************
****Jurassic Raptor Addon Support **************
http://makearmanotwar.com/entry/ec2EDrOCkM#.VT0zFfnF9EK

1) Download the addon.

2) Place the '@Jurassic Arma - Raptor Pack' folder in the base folder of your server. At the same folder level as the @Exile folder.

3) Place this folder in the same location on your HC, IF your HC does not share the same source folder as your server.

4) add @Jurrasic Arma - Raptor Pack to the -mod option of your server command line

5) add this to the -mod option for your HC.

6) add this to the -mod option for your client.

7) Ensure your players download the mod, and add the proper @Jurassic.... to their start parameters.

8) Enable the "Jurassic" theme in BaseServer.sqf.

9) Learn to generate a bi-key for the mod and add it.

   OR
   
   edit your config.cfg file and set 'verifySignatures = 0;'
   
10) repack and play!

Note: Raptors use the same AI patrol logics as regular FuMS soldiers, so BoxPatrol, building searching, PatrolRoute, etc logics will all work with the "RaptorM", and "RaptorF" AI types.

Note: Feel free to add Raptors to your own encounters!, see the Jurassic theme for examples.

