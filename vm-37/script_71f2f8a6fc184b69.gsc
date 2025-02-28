#using scripts\core_common\lui_shared.csc;

class class_b6e5ba9d : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b6e5ba9d
		Checksum: 0xC1C69FCE
		Offset: 0x330
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b6e5ba9d
		Checksum: 0x297A5532
		Offset: 0x480
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b6e5ba9d
		Checksum: 0xF7BE7806
		Offset: 0x418
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0x7AEED724
		Offset: 0x3A8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("insertion_passenger_count");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b6e5ba9d
		Checksum: 0x441BC31C
		Offset: 0x350
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_fbcc4763)
	{
		namespace_6aaccc24::setup_clientfields("insertion_passenger_count");
		namespace_6aaccc24::function_da693cbe("count", 1, 7, "int", var_fbcc4763);
	}

	/*
		Name: set_count
		Namespace: namespace_b6e5ba9d
		Checksum: 0x1B64CA6F
		Offset: 0x448
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_count(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "count", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b6e5ba9d
		Checksum: 0x908F770E
		Offset: 0x3D0
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "count", 0);
	}

}

#namespace insertion_passenger_count;

/*
	Name: register
	Namespace: insertion_passenger_count
	Checksum: 0x4904AE65
	Offset: 0xC8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_fbcc4763)
{
	elem = new class_b6e5ba9d();
	[[ elem ]]->setup_clientfields(var_fbcc4763);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"insertion_passenger_count"]))
	{
		level.var_ae746e8f[#"insertion_passenger_count"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"insertion_passenger_count"]))
	{
		level.var_ae746e8f[#"insertion_passenger_count"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"insertion_passenger_count"]))
	{
		level.var_ae746e8f[#"insertion_passenger_count"] = array(level.var_ae746e8f[#"insertion_passenger_count"]);
	}
	level.var_ae746e8f[#"insertion_passenger_count"][level.var_ae746e8f[#"insertion_passenger_count"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: insertion_passenger_count
	Checksum: 0xECCBFF15
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_b6e5ba9d();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: insertion_passenger_count
	Checksum: 0xC359A14B
	Offset: 0x288
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
	Namespace: insertion_passenger_count
	Checksum: 0x7498D461
	Offset: 0x2B0
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
	Namespace: insertion_passenger_count
	Checksum: 0x2E4503AC
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_count
	Namespace: insertion_passenger_count
	Checksum: 0xFDBA432C
	Offset: 0x300
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_count(localclientnum, value)
{
	[[ self ]]->set_count(localclientnum, value);
}

