#using scripts\core_common\lui_shared.csc;

class cinitial_black : cLUIelem
{

	/*
		Name: constructor
		Namespace: cinitial_black
		Checksum: 0x4D8CCE20
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cinitial_black
		Checksum: 0x672A1259
		Offset: 0x498
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cinitial_black
		Checksum: 0xA7BA79EA
		Offset: 0x430
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_developer_mode
		Namespace: cinitial_black
		Checksum: 0x81B6FC75
		Offset: 0x460
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_developer_mode(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "developer_mode", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: cinitial_black
		Checksum: 0xB732F866
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("initial_black");
	}

	/*
		Name: setup_clientfields
		Namespace: cinitial_black
		Checksum: 0x4DC96E5A
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_e303eae1)
	{
		cLUIelem::setup_clientfields("initial_black");
		cLUIelem::function_da693cbe("developer_mode", 1, 1, "int", var_e303eae1);
	}

	/*
		Name: function_fa582112
		Namespace: cinitial_black
		Checksum: 0x8024995A
		Offset: 0x3E8
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "developer_mode", 0);
	}

}

#namespace initial_black;

/*
	Name: function_fa3581f
	Namespace: initial_black
	Checksum: 0x7D83EC96
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fa3581f()
{
	level notify(1325468584);
}

/*
	Name: register
	Namespace: initial_black
	Checksum: 0x2DB4D5AC
	Offset: 0xE0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_e303eae1)
{
	elem = new cinitial_black();
	[[ elem ]]->setup_clientfields(var_e303eae1);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"initial_black"]))
	{
		level.var_ae746e8f[#"initial_black"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"initial_black"]))
	{
		level.var_ae746e8f[#"initial_black"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"initial_black"]))
	{
		level.var_ae746e8f[#"initial_black"] = array(level.var_ae746e8f[#"initial_black"]);
	}
	level.var_ae746e8f[#"initial_black"][level.var_ae746e8f[#"initial_black"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: initial_black
	Checksum: 0xA6C6E6F4
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new cinitial_black();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: initial_black
	Checksum: 0xAB7C1ABF
	Offset: 0x2A0
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
	Namespace: initial_black
	Checksum: 0x2C2BB37
	Offset: 0x2C8
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
	Namespace: initial_black
	Checksum: 0x71B19878
	Offset: 0x2F0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_developer_mode
	Namespace: initial_black
	Checksum: 0xBFBDA776
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_developer_mode(localclientnum, value)
{
	[[ self ]]->set_developer_mode(localclientnum, value);
}

