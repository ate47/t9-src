#using scripts\core_common\lui_shared.csc;

class cfull_screen_black : cLUIelem
{

	/*
		Name: constructor
		Namespace: cfull_screen_black
		Checksum: 0x6087E2FF
		Offset: 0x4F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cfull_screen_black
		Checksum: 0xC13C2E7B
		Offset: 0x980
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_endAlpha
		Namespace: cfull_screen_black
		Checksum: 0x5233AF94
		Offset: 0x910
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_endAlpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "endAlpha", value);
	}

	/*
		Name: open
		Namespace: cfull_screen_black
		Checksum: 0x1E40A403
		Offset: 0x7C8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_green
		Namespace: cfull_screen_black
		Checksum: 0x5AFE5DB5
		Offset: 0x830
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_green(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "green", value);
	}

	/*
		Name: set_fadeOverTime
		Namespace: cfull_screen_black
		Checksum: 0x8C0150E4
		Offset: 0x8A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeOverTime(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: cfull_screen_black
		Checksum: 0x947C154E
		Offset: 0x688
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("full_screen_black");
	}

	/*
		Name: set_blue
		Namespace: cfull_screen_black
		Checksum: 0x67CFE0DE
		Offset: 0x868
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cfull_screen_black
		Checksum: 0xF169FCB6
		Offset: 0x510
		Size: 0x16C
		Parameters: 7
		Flags: Linked
	*/
	function setup_clientfields(redcallback, greencallback, bluecallback, fadeOverTimecallback, var_b046940, var_34291db, var_32445b2)
	{
		cLUIelem::setup_clientfields("full_screen_black");
		cLUIelem::function_da693cbe("red", 1, 3, "float", redcallback);
		cLUIelem::function_da693cbe("green", 1, 3, "float", greencallback);
		cLUIelem::function_da693cbe("blue", 1, 3, "float", bluecallback);
		cLUIelem::function_da693cbe("fadeOverTime", 1, 12, "int", fadeOverTimecallback);
		cLUIelem::function_da693cbe("startAlpha", 1, 5, "float", var_b046940);
		cLUIelem::function_da693cbe("endAlpha", 1, 5, "float", var_34291db);
		cLUIelem::function_da693cbe("drawHUD", 1, 1, "int", var_32445b2);
	}

	/*
		Name: set_startAlpha
		Namespace: cfull_screen_black
		Checksum: 0x9862E18D
		Offset: 0x8D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_startAlpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "startAlpha", value);
	}

	/*
		Name: set_drawHUD
		Namespace: cfull_screen_black
		Checksum: 0x2CFBE81C
		Offset: 0x948
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_drawHUD(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "drawHUD", value);
	}

	/*
		Name: set_red
		Namespace: cfull_screen_black
		Checksum: 0x6165FBDF
		Offset: 0x7F8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_red(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: cfull_screen_black
		Checksum: 0xA0B46827
		Offset: 0x6B0
		Size: 0x110
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "red", 0);
		[[ self ]]->set_data(localclientnum, "green", 0);
		[[ self ]]->set_data(localclientnum, "blue", 0);
		[[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
		[[ self ]]->set_data(localclientnum, "startAlpha", 0);
		[[ self ]]->set_data(localclientnum, "endAlpha", 0);
		[[ self ]]->set_data(localclientnum, "drawHUD", 0);
	}

}

#namespace full_screen_black;

/*
	Name: function_67a01b4b
	Namespace: full_screen_black
	Checksum: 0xB40B7DDF
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67a01b4b()
{
	level notify(526038684);
}

/*
	Name: register
	Namespace: full_screen_black
	Checksum: 0x44EEAE77
	Offset: 0x128
	Size: 0x1B6
	Parameters: 7
	Flags: Linked
*/
function register(redcallback, greencallback, bluecallback, fadeOverTimecallback, var_b046940, var_34291db, var_32445b2)
{
	elem = new cfull_screen_black();
	[[ elem ]]->setup_clientfields(redcallback, greencallback, bluecallback, fadeOverTimecallback, var_b046940, var_34291db, var_32445b2);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = array(level.var_ae746e8f[#"full_screen_black"]);
	}
	level.var_ae746e8f[#"full_screen_black"][level.var_ae746e8f[#"full_screen_black"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: full_screen_black
	Checksum: 0x9D65E6BC
	Offset: 0x2E8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new cfull_screen_black();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: full_screen_black
	Checksum: 0xD3A3A02F
	Offset: 0x328
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: full_screen_black
	Checksum: 0xC2853311
	Offset: 0x350
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: full_screen_black
	Checksum: 0xB8810DB7
	Offset: 0x378
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_red
	Namespace: full_screen_black
	Checksum: 0x7C92FCC5
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_red(localclientnum, value)
{
	[[ self ]]->set_red(localclientnum, value);
}

/*
	Name: set_green
	Namespace: full_screen_black
	Checksum: 0x2B68F8A6
	Offset: 0x3D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_green(localclientnum, value)
{
	[[ self ]]->set_green(localclientnum, value);
}

/*
	Name: set_blue
	Namespace: full_screen_black
	Checksum: 0xC96BCD26
	Offset: 0x400
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_fadeOverTime
	Namespace: full_screen_black
	Checksum: 0x113464FF
	Offset: 0x430
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeOverTime(localclientnum, value)
{
	[[ self ]]->set_fadeOverTime(localclientnum, value);
}

/*
	Name: set_startAlpha
	Namespace: full_screen_black
	Checksum: 0x4EF9E405
	Offset: 0x460
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_startAlpha(localclientnum, value)
{
	[[ self ]]->set_startAlpha(localclientnum, value);
}

/*
	Name: set_endAlpha
	Namespace: full_screen_black
	Checksum: 0xB5285A65
	Offset: 0x490
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_endAlpha(localclientnum, value)
{
	[[ self ]]->set_endAlpha(localclientnum, value);
}

/*
	Name: set_drawHUD
	Namespace: full_screen_black
	Checksum: 0xD61B3E86
	Offset: 0x4C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_drawHUD(localclientnum, value)
{
	[[ self ]]->set_drawHUD(localclientnum, value);
}

