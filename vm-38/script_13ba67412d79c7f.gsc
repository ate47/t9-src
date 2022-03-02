#using scripts\core_common\lui_shared.csc;

class class_3df1eeda : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_3df1eeda
		Checksum: 0xDEE7B245
		Offset: 0x3A0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_3df1eeda
		Checksum: 0xE6A7EED4
		Offset: 0x580
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_3df1eeda
		Checksum: 0xA9294514
		Offset: 0x4E0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_3df1eeda
		Checksum: 0xE4905A51
		Offset: 0x448
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_trial_timer");
	}

	/*
		Name: function_6ad54036
		Namespace: namespace_3df1eeda
		Checksum: 0xEC3D7553
		Offset: 0x548
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_6ad54036(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "under_round_rules", value);
	}

	/*
		Name: function_8ede8e82
		Namespace: namespace_3df1eeda
		Checksum: 0x6A56D6D5
		Offset: 0x510
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_8ede8e82(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "timer_text", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_3df1eeda
		Checksum: 0xB78A7FFD
		Offset: 0x3C0
		Size: 0x7C
		Parameters: 2
		Flags: Linked
	*/
	function setup_clientfields(var_96b8e5ea, var_33be6591)
	{
		namespace_6aaccc24::setup_clientfields("zm_trial_timer");
		namespace_6aaccc24::function_dcb34c80("string", "timer_text", 1);
		namespace_6aaccc24::function_da693cbe("under_round_rules", 1, 1, "int", var_33be6591);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_3df1eeda
		Checksum: 0x46309204
		Offset: 0x470
		Size: 0x68
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "timer_text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "under_round_rules", 0);
	}

}

#namespace zm_trial_timer;

/*
	Name: function_6df52484
	Namespace: zm_trial_timer
	Checksum: 0x60A6152C
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6df52484()
{
	level notify(1684658858);
}

/*
	Name: register
	Namespace: zm_trial_timer
	Checksum: 0x1A09C66C
	Offset: 0x100
	Size: 0x17E
	Parameters: 2
	Flags: Linked
*/
function register(var_96b8e5ea, var_33be6591)
{
	elem = new class_3df1eeda();
	[[ elem ]]->setup_clientfields(var_96b8e5ea, var_33be6591);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_timer"]))
	{
		level.var_ae746e8f[#"zm_trial_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_timer"]))
	{
		level.var_ae746e8f[#"zm_trial_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_trial_timer"]))
	{
		level.var_ae746e8f[#"zm_trial_timer"] = array(level.var_ae746e8f[#"zm_trial_timer"]);
	}
	level.var_ae746e8f[#"zm_trial_timer"][level.var_ae746e8f[#"zm_trial_timer"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_trial_timer
	Checksum: 0xA0FB9D13
	Offset: 0x288
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_3df1eeda();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_timer
	Checksum: 0xEBC29BF4
	Offset: 0x2C8
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
	Namespace: zm_trial_timer
	Checksum: 0xFE874146
	Offset: 0x2F0
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
	Namespace: zm_trial_timer
	Checksum: 0x62973A6A
	Offset: 0x318
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_8ede8e82
	Namespace: zm_trial_timer
	Checksum: 0xAD4A2609
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8ede8e82(localclientnum, value)
{
	[[ self ]]->function_8ede8e82(localclientnum, value);
}

/*
	Name: function_6ad54036
	Namespace: zm_trial_timer
	Checksum: 0x118895AA
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6ad54036(localclientnum, value)
{
	[[ self ]]->function_6ad54036(localclientnum, value);
}

