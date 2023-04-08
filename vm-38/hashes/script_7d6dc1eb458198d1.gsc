#using scripts\core_common\lui_shared.csc;

class class_a0b518ca : cLUIelem
{

	/*
		Name: constructor
		Namespace: namespace_a0b518ca
		Checksum: 0xEBE96DB9
		Offset: 0x4B8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a0b518ca
		Checksum: 0xC0102AB4
		Offset: 0x8B8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a0b518ca
		Checksum: 0x6CB4A5E9
		Offset: 0x738
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_hasDamage
		Namespace: namespace_a0b518ca
		Checksum: 0xF919D998
		Offset: 0x880
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_hasDamage(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "hasDamage", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_a0b518ca
		Checksum: 0x50681D08
		Offset: 0x620
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("zm_control_point_hud");
	}

	/*
		Name: set_chargePct
		Namespace: namespace_a0b518ca
		Checksum: 0xC7C85E5C
		Offset: 0x768
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_chargePct(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "chargePct", value);
	}

	/*
		Name: set_hasCharge
		Namespace: namespace_a0b518ca
		Checksum: 0xD9B3B77
		Offset: 0x848
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_hasCharge(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "hasCharge", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0b518ca
		Checksum: 0x2E323B83
		Offset: 0x4D8
		Size: 0x13C
		Parameters: 6
		Flags: None
	*/
	function setup_clientfields(var_4bf38eea, var_7cc0b11d, var_14431277, var_db1c4294, var_87048abd, var_dd55685a)
	{
		cLUIelem::setup_clientfields("zm_control_point_hud");
		cLUIelem::function_da693cbe("chargePct", 8000, 7, "float", var_4bf38eea);
		cLUIelem::function_da693cbe("damagePct", 8000, 7, "float", var_7cc0b11d);
		cLUIelem::function_da693cbe("ordaHealthPct", 16000, 7, "float", var_14431277);
		cLUIelem::function_da693cbe("hasOrda", 16000, 1, "int", var_db1c4294);
		cLUIelem::function_da693cbe("hasCharge", 16000, 1, "int", var_87048abd);
		cLUIelem::function_da693cbe("hasDamage", 16000, 1, "int", var_dd55685a);
	}

	/*
		Name: set_damagePct
		Namespace: namespace_a0b518ca
		Checksum: 0x4D120C86
		Offset: 0x7A0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_damagePct(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "damagePct", value);
	}

	/*
		Name: set_ordaHealthPct
		Namespace: namespace_a0b518ca
		Checksum: 0x8F220BEE
		Offset: 0x7D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_ordaHealthPct(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "ordaHealthPct", value);
	}

	/*
		Name: set_hasOrda
		Namespace: namespace_a0b518ca
		Checksum: 0x1427C44F
		Offset: 0x810
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_hasOrda(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "hasOrda", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a0b518ca
		Checksum: 0x327E3D77
		Offset: 0x648
		Size: 0xE4
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "chargePct", 0);
		[[ self ]]->set_data(localclientnum, "damagePct", 0);
		[[ self ]]->set_data(localclientnum, "ordaHealthPct", 0);
		[[ self ]]->set_data(localclientnum, "hasOrda", 0);
		[[ self ]]->set_data(localclientnum, "hasCharge", 0);
		[[ self ]]->set_data(localclientnum, "hasDamage", 0);
	}

}

#namespace zm_control_point_hud;

/*
	Name: function_4552498
	Namespace: zm_control_point_hud
	Checksum: 0x77F7A34B
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4552498()
{
	level notify(697194221);
}

/*
	Name: register
	Namespace: zm_control_point_hud
	Checksum: 0x593FE275
	Offset: 0x130
	Size: 0x1A6
	Parameters: 6
	Flags: None
*/
function register(var_4bf38eea, var_7cc0b11d, var_14431277, var_db1c4294, var_87048abd, var_dd55685a)
{
	elem = new class_a0b518ca();
	[[ elem ]]->setup_clientfields(var_4bf38eea, var_7cc0b11d, var_14431277, var_db1c4294, var_87048abd, var_dd55685a);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_control_point_hud"]))
	{
		level.var_ae746e8f[#"zm_control_point_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_control_point_hud"]))
	{
		level.var_ae746e8f[#"zm_control_point_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_control_point_hud"]))
	{
		level.var_ae746e8f[#"zm_control_point_hud"] = array(level.var_ae746e8f[#"zm_control_point_hud"]);
	}
	level.var_ae746e8f[#"zm_control_point_hud"][level.var_ae746e8f[#"zm_control_point_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_control_point_hud
	Checksum: 0x715F0657
	Offset: 0x2E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_a0b518ca();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_control_point_hud
	Checksum: 0xB48954B
	Offset: 0x320
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
	Namespace: zm_control_point_hud
	Checksum: 0x1F89F37C
	Offset: 0x348
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
	Namespace: zm_control_point_hud
	Checksum: 0x68A997EB
	Offset: 0x370
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_chargePct
	Namespace: zm_control_point_hud
	Checksum: 0xFB1617AF
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_chargePct(localclientnum, value)
{
	[[ self ]]->set_chargePct(localclientnum, value);
}

/*
	Name: set_damagePct
	Namespace: zm_control_point_hud
	Checksum: 0x55D47F1F
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_damagePct(localclientnum, value)
{
	[[ self ]]->set_damagePct(localclientnum, value);
}

/*
	Name: set_ordaHealthPct
	Namespace: zm_control_point_hud
	Checksum: 0x979D2497
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_ordaHealthPct(localclientnum, value)
{
	[[ self ]]->set_ordaHealthPct(localclientnum, value);
}

/*
	Name: set_hasOrda
	Namespace: zm_control_point_hud
	Checksum: 0xAB8A1C2
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_hasOrda(localclientnum, value)
{
	[[ self ]]->set_hasOrda(localclientnum, value);
}

/*
	Name: set_hasCharge
	Namespace: zm_control_point_hud
	Checksum: 0x2A676EA9
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_hasCharge(localclientnum, value)
{
	[[ self ]]->set_hasCharge(localclientnum, value);
}

/*
	Name: set_hasDamage
	Namespace: zm_control_point_hud
	Checksum: 0x64D1EE95
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_hasDamage(localclientnum, value)
{
	[[ self ]]->set_hasDamage(localclientnum, value);
}

