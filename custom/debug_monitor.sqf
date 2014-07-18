//Let Zeds know
[player,4,true,(getPosATL player)] spawn player_alertZombies;

while {debugMonitor} do
{
	_time = (round(180-(serverTime)/60));
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
	
	// You can delete the server website here line (entire line) if you want
	// You can also delete the entire TeamSpeak IP line if you want
	hintSilent parseText format ["
		<t size='1.25' font='Bitstream' align='center' color='#5882FA'>Server Name Here</t><br/>
		<t size='1.05' font='Bitstream' align='center' color='#5882FA'>Server Website Here</t><br/> 
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'></t><t size='0.95 'font='Bitstream' align='right'></t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Players Online: </t><t size='0.95 'font='Bitstream' align='right'>%1</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='0.95' font='Bitstream' align='right'>%3</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='0.95' font='Bitstream' align='right'>%2</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Humanity: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='0.95' font='Bitstream' align='right'>%7</t><br/>
		<t size='0.95' font='Bitstream' align='left' color='#FFBF00'></t><t size='0.95 'font='Bitstream' align='right'></t><br/>
		<t size='1.15' font='Bitstream'align='center' color='#5882FA'>TeamSpeak IP Here</t><br/>
		<t size='1.15' font='Bitstream'align='center' color='#5882FA'>Server restart in %8:%9</t><br/>",
			
		(count playableUnits),
		(player getVariable['zombieKills', 0]),
		(player getVariable['humanKills', 0]),
		(player getVariable['banditKills', 0]),
		(player getVariable['USEC_BloodQty', r_player_blood]),
		(player getVariable['humanity', 0]),
		(round diag_fps),
		_hours,
		_minutes
	];
	
	//Don't modify below this line
	sleep 1;
};