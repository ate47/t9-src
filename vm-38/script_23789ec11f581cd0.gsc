#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class cmulti_stage_friendly_lockon : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0xA2707E35
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
		Namespace: cmulti_stage_friendly_lockon
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x57CF496E
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x8E92AFC9
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x6631B3C5
		Offset: 0x250
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("multi_stage_friendly_lockon");
		cLUIelem::function_da693cbe("entNum", 1, 10, "int");
		cLUIelem::function_da693cbe("targetState", 1, 3, "int");
	}

	/*
		Name: set_entNum
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0xC53AA018
		Offset: 0x340
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entNum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entNum", value);
	}

	/*
		Name: set_targetState
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0xE447BD57
		Offset: 0x390
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_targetState(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "targetState", value);
	}

}

#namespace multi_stage_friendly_lockon;

/*
	Name: function_7913bd8
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xDDB4A497
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7913bd8()
{
	level notify(1020791429);
}

/*
	Name: register
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x273875D0
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmulti_stage_friendly_lockon();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xF79EBB64
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x8223FA61
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xC4970C2C
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
	Name: set_entNum
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x7641D6BB
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entNum(player, value)
{
	[[ self ]]->set_entNum(player, value);
}

/*
	Name: set_targetState
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xFA8F3B42
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_targetState(player, value)
{
	[[ self ]]->set_targetState(player, value);
}

