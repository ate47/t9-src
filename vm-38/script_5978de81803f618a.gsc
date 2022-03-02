#using scripts\core_common\lui_shared.csc;

class class_5c7b7dcc : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0x999020D4
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0x3D6E3C51
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5c7b7dcc
		Checksum: 0x3EB5E658
		Offset: 0x440
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_5c7b7dcc
		Checksum: 0x3DD4B28F
		Offset: 0x3D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_infect_timer");
	}

	/*
		Name: function_8c8674a4
		Namespace: namespace_5c7b7dcc
		Checksum: 0x74623191
		Offset: 0x470
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_8c8674a4(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "infectionTimeRemaining", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5c7b7dcc
		Checksum: 0x704929ED
		Offset: 0x378
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_7682811d)
	{
		namespace_6aaccc24::setup_clientfields("mp_infect_timer");
		namespace_6aaccc24::function_da693cbe("infectionTimeRemaining", 1, 4, "int", var_7682811d);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_5c7b7dcc
		Checksum: 0xB0DBC78A
		Offset: 0x3F8
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "infectionTimeRemaining", 0);
	}

}

#namespace mp_infect_timer;

/*
	Name: function_ff6918b6
	Namespace: mp_infect_timer
	Checksum: 0x3E6DFA38
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ff6918b6()
{
	level notify(1477909617);
}

/*
	Name: register
	Namespace: mp_infect_timer
	Checksum: 0xB6268730
	Offset: 0xF0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_7682811d)
{
	elem = new class_5c7b7dcc();
	[[ elem ]]->setup_clientfields(var_7682811d);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_infect_timer"]))
	{
		level.var_ae746e8f[#"mp_infect_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_infect_timer"]))
	{
		level.var_ae746e8f[#"mp_infect_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_infect_timer"]))
	{
		level.var_ae746e8f[#"mp_infect_timer"] = array(level.var_ae746e8f[#"mp_infect_timer"]);
	}
	level.var_ae746e8f[#"mp_infect_timer"][level.var_ae746e8f[#"mp_infect_timer"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mp_infect_timer
	Checksum: 0x50F579D3
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_5c7b7dcc();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mp_infect_timer
	Checksum: 0xD796C27F
	Offset: 0x2B0
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
	Namespace: mp_infect_timer
	Checksum: 0xCC475B03
	Offset: 0x2D8
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
	Namespace: mp_infect_timer
	Checksum: 0x99547063
	Offset: 0x300
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_8c8674a4
	Namespace: mp_infect_timer
	Checksum: 0x673B5144
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8c8674a4(localclientnum, value)
{
	[[ self ]]->function_8c8674a4(localclientnum, value);
}

