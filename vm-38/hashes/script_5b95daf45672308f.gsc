#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_90c2e4ec : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_90c2e4ec
		Checksum: 0x65B0F98C
		Offset: 0x230
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_90c2e4ec
		Checksum: 0xAB499CBF
		Offset: 0x3E0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_90c2e4ec
		Checksum: 0xFE96C772
		Offset: 0x2C8
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cLUIelem::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_90c2e4ec
		Checksum: 0x2B55242D
		Offset: 0x310
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cLUIelem::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_90c2e4ec
		Checksum: 0x2023C517
		Offset: 0x250
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("sr_orda_health_bar");
		cLUIelem::function_da693cbe("health", 4000, 7, "float");
		cLUIelem::function_da693cbe("is_beast", 4000, 1, "int");
	}

	/*
		Name: set_is_beast
		Namespace: namespace_90c2e4ec
		Checksum: 0xB230FF97
		Offset: 0x390
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_is_beast(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "is_beast", value);
	}

	/*
		Name: set_health
		Namespace: namespace_90c2e4ec
		Checksum: 0x6CE0EB4C
		Offset: 0x340
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_health(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "health", value);
	}

}

#namespace namespace_e7b931aa;

/*
	Name: function_37e53dd1
	Namespace: namespace_e7b931aa
	Checksum: 0xA1C8AD0
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_37e53dd1()
{
	level notify(47547567);
}

/*
	Name: register
	Namespace: namespace_e7b931aa
	Checksum: 0xC6B82780
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_90c2e4ec();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_e7b931aa
	Checksum: 0x22B7D0A0
	Offset: 0x140
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: namespace_e7b931aa
	Checksum: 0xBEEC1AC2
	Offset: 0x180
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
	Namespace: namespace_e7b931aa
	Checksum: 0xD0CA6291
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_health
	Namespace: namespace_e7b931aa
	Checksum: 0x8B533391
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_health(player, value)
{
	[[ self ]]->set_health(player, value);
}

/*
	Name: set_is_beast
	Namespace: namespace_e7b931aa
	Checksum: 0xB6F369C1
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_is_beast(player, value)
{
	[[ self ]]->set_is_beast(player, value);
}

