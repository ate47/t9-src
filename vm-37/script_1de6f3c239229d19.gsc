#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_140ed462 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_140ed462
		Checksum: 0xAC540E2F
		Offset: 0x238
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_140ed462
		Checksum: 0x47CBD680
		Offset: 0x460
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_140ed462
		Checksum: 0x3AAB893F
		Offset: 0x2F8
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_21eb67aa
		Namespace: namespace_140ed462
		Checksum: 0x839602D9
		Offset: 0x3C0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_21eb67aa(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "minutes", value);
	}

	/*
		Name: close
		Namespace: namespace_140ed462
		Checksum: 0x38BD7D05
		Offset: 0x340
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_7954feaf
		Namespace: namespace_140ed462
		Checksum: 0xB3D3AE5E
		Offset: 0x410
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_7954feaf(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showzero", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_140ed462
		Checksum: 0x79BBEA8
		Offset: 0x258
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_game_timer");
		namespace_6aaccc24::function_da693cbe("seconds", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("minutes", 1, 9, "int");
		namespace_6aaccc24::function_da693cbe("showzero", 1, 1, "int");
	}

	/*
		Name: function_c48569e7
		Namespace: namespace_140ed462
		Checksum: 0x1695F4CB
		Offset: 0x370
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_c48569e7(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "seconds", value);
	}

}

#namespace zm_game_timer;

/*
	Name: register
	Namespace: zm_game_timer
	Checksum: 0xF9CEF295
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_140ed462();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_game_timer
	Checksum: 0x34E39DA0
	Offset: 0x118
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
	Namespace: zm_game_timer
	Checksum: 0x74CB4E3A
	Offset: 0x158
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
	Namespace: zm_game_timer
	Checksum: 0xA9AD379B
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_c48569e7
	Namespace: zm_game_timer
	Checksum: 0xE79020D9
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c48569e7(player, value)
{
	[[ self ]]->function_c48569e7(player, value);
}

/*
	Name: function_21eb67aa
	Namespace: zm_game_timer
	Checksum: 0x26C4050C
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_21eb67aa(player, value)
{
	[[ self ]]->function_21eb67aa(player, value);
}

/*
	Name: function_7954feaf
	Namespace: zm_game_timer
	Checksum: 0x7E0D8A1D
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7954feaf(player, value)
{
	[[ self ]]->function_7954feaf(player, value);
}

