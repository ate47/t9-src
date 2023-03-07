#using scripts\core_common\lui_shared.gsc;

class class_8ebbf51b : cLUIelem
{

	/*
		Name: constructor
		Namespace: namespace_8ebbf51b
		Checksum: 0x26EA4E8B
		Offset: 0x198
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8ebbf51b
		Checksum: 0x95BBD3FC
		Offset: 0x258
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8ebbf51b
		Checksum: 0x8EFC0DC
		Offset: 0x1E0
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
		cLUIelem::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_8ebbf51b
		Checksum: 0x335296BF
		Offset: 0x228
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cLUIelem::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8ebbf51b
		Checksum: 0xC3C53A14
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("sr_armor_menu");
	}

}

#namespace sr_armor_menu;

/*
	Name: function_a4d2f622
	Namespace: sr_armor_menu
	Checksum: 0x9BA3B0CE
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a4d2f622()
{
	level notify(1126452038);
}

/*
	Name: register
	Namespace: sr_armor_menu
	Checksum: 0xC8EB88C0
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_8ebbf51b();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_armor_menu
	Checksum: 0x83B95F3F
	Offset: 0x108
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: sr_armor_menu
	Checksum: 0xDE74B2A0
	Offset: 0x148
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: sr_armor_menu
	Checksum: 0x686D9D85
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

