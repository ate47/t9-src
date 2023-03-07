#using scripts\core_common\lui_shared.csc;

class crevive_hud : cLUIelem
{

	/*
		Name: constructor
		Namespace: crevive_hud
		Checksum: 0xE4B0DD50
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: crevive_hud
		Checksum: 0x96368AB0
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: crevive_hud
		Checksum: 0x5EDB62AD
		Offset: 0x568
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_fadeTime
		Namespace: crevive_hud
		Checksum: 0x53958265
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeTime(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeTime", value);
	}

	/*
		Name: set_clientnum
		Namespace: crevive_hud
		Checksum: 0x746A578D
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clientNum", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: crevive_hud
		Checksum: 0x1237B87A
		Offset: 0x4B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("revive_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: crevive_hud
		Checksum: 0x52FD5F42
		Offset: 0x3F8
		Size: 0xAC
		Parameters: 3
		Flags: Linked
	*/
	function setup_clientfields(var_f5852d69, var_c05c67e2, var_415094af)
	{
		cLUIelem::setup_clientfields("revive_hud");
		cLUIelem::function_dcb34c80("string", "text", 1);
		cLUIelem::function_da693cbe("clientNum", 1, 7, "int", var_c05c67e2);
		cLUIelem::function_da693cbe("fadeTime", 1, 5, "int", var_415094af);
	}

	/*
		Name: set_text
		Namespace: crevive_hud
		Checksum: 0x7C76AA5B
		Offset: 0x598
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: crevive_hud
		Checksum: 0xFC8B69C6
		Offset: 0x4D8
		Size: 0x84
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "clientNum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeTime", 0);
	}

}

#namespace revive_hud;

/*
	Name: function_2d8eb05
	Namespace: revive_hud
	Checksum: 0x1AE01011
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d8eb05()
{
	level notify(692296382);
}

/*
	Name: register
	Namespace: revive_hud
	Checksum: 0x55FB38B
	Offset: 0xF8
	Size: 0x18E
	Parameters: 3
	Flags: Linked
*/
function register(var_f5852d69, var_c05c67e2, var_415094af)
{
	elem = new crevive_hud();
	[[ elem ]]->setup_clientfields(var_f5852d69, var_c05c67e2, var_415094af);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"revive_hud"]))
	{
		level.var_ae746e8f[#"revive_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"revive_hud"]))
	{
		level.var_ae746e8f[#"revive_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"revive_hud"]))
	{
		level.var_ae746e8f[#"revive_hud"] = array(level.var_ae746e8f[#"revive_hud"]);
	}
	level.var_ae746e8f[#"revive_hud"][level.var_ae746e8f[#"revive_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: revive_hud
	Checksum: 0x68FF1A7F
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new crevive_hud();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: revive_hud
	Checksum: 0x37A0E45A
	Offset: 0x2D0
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
	Namespace: revive_hud
	Checksum: 0xC21D77EA
	Offset: 0x2F8
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
	Namespace: revive_hud
	Checksum: 0x10CA3097
	Offset: 0x320
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_text
	Namespace: revive_hud
	Checksum: 0x21E5D488
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_clientnum
	Namespace: revive_hud
	Checksum: 0xDC8A0C4
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_fadeTime
	Namespace: revive_hud
	Checksum: 0xA07F8B7E
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeTime(localclientnum, value)
{
	[[ self ]]->set_fadeTime(localclientnum, value);
}

