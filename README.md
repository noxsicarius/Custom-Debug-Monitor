Custom Debug Monitor
============


This is a debug menu I have created and I figured it would be of use to some of you so here it is.


![Debug Monitor](https://www.dropbox.com/s/9wsllrc6fjdmjlm/Epoch%20debug%20monitor.jpg?dl=0)


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
	