#using scripts\core_common\lui_shared.csc;

class class_ad2941a0 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_ad2941a0
		Checksum: 0x360A6CDE
		Offset: 0x370
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ad2941a0
		Checksum: 0xC6E89526
		Offset: 0x5C8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ad2941a0
		Checksum: 0x9573B5DB
		Offset: 0x4A8
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
		Namespace: namespace_ad2941a0
		Checksum: 0xA4308DB3
		Offset: 0x410
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("VehicleTurretOverheat");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ad2941a0
		Checksum: 0x3700E6BE
		Offset: 0x390
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_661989d5)
	{
		namespace_6aaccc24::setup_clientfields("VehicleTurretOverheat");
		namespace_6aaccc24::function_da693cbe("_state", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("bar_percent", 1, 6, "float", var_661989d5);
	}

	/*
		Name: set_state
		Namespace: namespace_ad2941a0
		Checksum: 0x732A4FA7
		Offset: 0x4D8
		Size: 0xAC
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"overheat" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

	/*
		Name: function_fa582112
		Namespace: namespace_ad2941a0
		Checksum: 0xFD40AB06
		Offset: 0x438
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", 0);
	}

	/*
		Name: function_fd8c13fb
		Namespace: namespace_ad2941a0
		Checksum: 0xDBB13155
		Offset: 0x590
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_fd8c13fb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", value);
	}

}

#namespace vehicleturretoverheat;

/*
	Name: register
	Namespace: vehicleturretoverheat
	Checksum: 0xC1FA0EA8
	Offset: 0xD8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_661989d5)
{
	elem = new class_ad2941a0();
	[[ elem ]]->setup_clientfields(var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"vehicleturretoverheat"]))
	{
		level.var_ae746e8f[#"vehicleturretoverheat"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"vehicleturretoverheat"]))
	{
		level.var_ae746e8f[#"vehicleturretoverheat"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"vehicleturretoverheat"]))
	{
		level.var_ae746e8f[#"vehicleturretoverheat"] = array(level.var_ae746e8f[#"vehicleturretoverheat"]);
	}
	level.var_ae746e8f[#"vehicleturretoverheat"][level.var_ae746e8f[#"vehicleturretoverheat"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: vehicleturretoverheat
	Checksum: 0xD2F681AA
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_ad2941a0();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: vehicleturretoverheat
	Checksum: 0xA013B51C
	Offset: 0x298
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
	Namespace: vehicleturretoverheat
	Checksum: 0x26818F9B
	Offset: 0x2C0
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
	Namespace: vehicleturretoverheat
	Checksum: 0x4631A662
	Offset: 0x2E8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: vehicleturretoverheat
	Checksum: 0x25E5CC91
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: function_fd8c13fb
	Namespace: vehicleturretoverheat
	Checksum: 0x1551F3EB
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(localclientnum, value)
{
	[[ self ]]->function_fd8c13fb(localclientnum, value);
}

