Custom Debug Monitor
============

This is a debug menu I have created and I figured it would be of use to some of you so here it is.

![Debug Monitor](https://drive.google.com/file/d/0B8-fMeYSKkg_SmhDa214b2pkMGM/view?usp=sharing)

# Table of Contents:
* [Uninstall old version](https://github.com/noxsicarius/Custom-Debug-Monitor#uninstall-old-version)
* [Install](https://github.com/noxsicarius/Custom-Debug-Monitor#install)

###Uninstall old version
For any version before 2016

1. Open your ***init.sqf***

1. Find this line:

	~~~~java
	call compile preprocessFileLineNumbers "custom\compiles.sqf";
	~~~~
	
	and repplace it with this:
	~~~~java
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
	~~~~

	it should now look similar to this:
	~~~~java
	//Load in compiled functions
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
	progressLoadingScreen 0.1;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
	progressLoadingScreen 0.2;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
	progressLoadingScreen 0.4;
	// BELOW IS THE LINE WE CHANGED 
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
	progressLoadingScreen 0.5;
	call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
	progressLoadingScreen 1.0;
	~~~~
	
1. Find this and *delete it*:
	~~~~java
	if (isNil 'debugMonitor') then 
	{
		debugMonitor = true;
		_nill = execvm "custom\debug_monitor.sqf";
	};
	~~~~
	
1. Save the init.sqf

1. Delete the following files from the missionFolder\custom folder
*dayz_spaceInterrupt.sqf
*debug_monitor.sqf
*compiles.sqf

###Install

1. Click ***[Download Zip](https://github.com/noxsicarius/Custom-Debug-Monitor/archive/master.zip)*** on the right sidebar of this Github page.

	> Recommended PBO tool for all "pack", "repack", or "unpack" steps: ***[PBO Manager](http://www.armaholic.com/page.php?id=16369)***

1. Log into your server via FTP or your host's File Manager. Locate, download, and unpack your ***MPMissions/Your_Mission.pbo***, and open the resulting folder.
 
	> Note: "Your_Mission.pbo" is a placeholder name. Your mission might be called "DayZ_Epoch_11.Chernarus", "DayZ_Epoch_13.Tavi", or "dayz_mission" depending on hosting and chosen map.

1. Extract the downloaded folder.

1. Copy the ***custom folder*** (in the download) into your mission folder.

1. Navigate to your mission folder and open the ***init.sqf***
	Find this line:

	~~~~java
	progressLoadingScreen 1.0;
	~~~~
	
	And place this line ***ABOVE*** it:
	
	~~~~java
	call compile preprocessFileLineNumbers "custom\debug_monitor\compiles.sqf";
	~~~~
	
1. Open the ***init.sqf*** in the root of your mission folder and paste the following at the bottom of the if(!isDedicated) code:

	~~~~java
	if (isNil 'debugMonitor') then {
		debugMonitor = true;
		_nill = execvm "custom\debug_monitor\debug_monitor.sqf";
	};
	~~~~

	It should now look like this:
	
	~~~~java
	if (!isDedicated) then {
		
		
		**Some code found here**
		
		
		if (isNil 'debugMonitor') then {
			debugMonitor = true;
			_nill = execvm "custom\debug_monitor\debug_monitor.sqf";
		};
	};
	~~~~
	
