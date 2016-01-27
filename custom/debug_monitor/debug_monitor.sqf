while {debugMonitor} do
{
	_serverTitle = "SERVER NAME HERE";
	_serverSubtitle = "WEBSITE/MESSAGE HERE"; // DELETE line 36 if you don't want this to show
	_teamspeak = "Teamspeak: TEAMSPEAK IP HERE"; // DELETE line 46 if you don't want this to show
	
	//Change MINUTES to total time before server restart
	//Want it to count up instead of down? use _time = (round serverTime)/60;
	//_time = (round(MINUTES-(serverTime)/60));
	_time = (round(180-(serverTime)/60)); // EDIT THIS LINE TO CHANGE SERVER TIME
	_hours = (floor(_time/60));
	_minutes = (_time - (_hours * 60));
	
	switch(_minutes) do
	{
		case 9: {_minutes = "09"};
		case 8: {_minutes = "08"};
		case 7: {_minutes = "07"};
		case 6: {_minutes = "06"};
		case 5: {_minutes = "05"};
		case 4: {_minutes = "04"};
		case 3: {_minutes = "03"};
		case 2: {_minutes = "02"};
		case 1: {_minutes = "01"};
		case 0: {_minutes = "00"};
	};
	
	// Want to change the colors? http://www.w3schools.com/colors/colors_picker.asp
	// Use the #xxxxxx color code you get on that website and place it with any of the
	//<t size..... lines below format: color='#xxxxxx'
	
	// You can delete any of the <t size..... lines that you do not want
	// THE LAST LINE MUST HAVE A ,
	hintSilent parseText format ["
		<t size='1.25' font='Bitstream' align='center' color='#5882FA'>%1</t><br/>
		<t size='1.05' font='Bitstream' align='center' color='#5882FA'>%2</t><br/> 
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'></t><t size='0.95 'font='Bitstream' align='right'></t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Players Online: </t><t size='0.95 'font='Bitstream' align='right'>%3</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Humanity: </t><t size='0.95' font='Bitstream' align='right'>%7</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%8</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='0.95' font='Bitstream' align='right'>%9</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'></t><t size='0.95 'font='Bitstream' align='right'></t><br/>
		<t size='1.15' font='Bitstream'align='center' color='#5882FA'>%10</t><br/>
		<t size='1.15' font='Bitstream'align='center' color='#5882FA'>Server restart in %11:%12</t><br/>", //ONLY last line needs the ,
			
		_serverTitle, // Used on line 35 for server title
		_serverSubtitle, // Used on line 36 for server subtitle
		(count playableUnits), // Used on line 38 for player count
		(player getVariable['humanKills', 0]), // Used on line 39 for murder count
		(player getVariable['banditKills', 0]), // Used on line 40 for bandit kill count
		(player getVariable['zombieKills', 0]), // Used on line 41 for zombie kill count
		(player getVariable['humanity', 0]), // Used on line 42 for humanity count
		(player getVariable['USEC_BloodQty', r_player_blood]), // Used on line 43 for player blood amount
		(round diag_fps), // Used on line 44 for frames per second
		_teamspeak, // Used on line 46 for frames per second
		_hours, // Used on line 47 to display hours
		_minutes // Used on line 47 to display minutes
	];
	
	//Don't modify this part
	sleep 0.5;
};