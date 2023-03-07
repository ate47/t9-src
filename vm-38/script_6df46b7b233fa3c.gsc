#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_70ee35b1 : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_70ee35b1
		Checksum: 0x53D202E8
		Offset: 0x2A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_70ee35b1
		Checksum: 0xF4979702
		Offset: 0x548
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_movieName
		Namespace: namespace_70ee35b1
		Checksum: 0x16440DFE
		Offset: 0x408
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_movieName(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_70ee35b1
		Checksum: 0xA0D0D6B6
		Offset: 0x390
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
		Name: set_additive
		Namespace: namespace_70ee35b1
		Checksum: 0xCD2D4D53
		Offset: 0x4F8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_additive(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "additive", value);
	}

	/*
		Name: close
		Namespace: namespace_70ee35b1
		Checksum: 0xEEA0D326
		Offset: 0x3D8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cLUIelem::function_a68f6e20(player);
	}

	/*
		Name: set_looping
		Namespace: namespace_70ee35b1
		Checksum: 0xBDE610BC
		Offset: 0x4A8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_looping(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "looping", value);
	}

	/*
		Name: set_showBlackScreen
		Namespace: namespace_70ee35b1
		Checksum: 0xD4705E89
		Offset: 0x458
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_showBlackScreen(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_70ee35b1
		Checksum: 0x6263552E
		Offset: 0x2C8
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("pip_menu");
		cLUIelem::function_dcb34c80("moviefile", "movieName", 1);
		cLUIelem::function_da693cbe("showBlackScreen", 1, 1, "int");
		cLUIelem::function_da693cbe("looping", 1, 1, "int");
		cLUIelem::function_da693cbe("additive", 1, 1, "int");
	}

}

#namespace pip_menu;

/*
	Name: function_7626f1a4
	Namespace: pip_menu
	Checksum: 0x9133A7A3
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7626f1a4()
{
	level notify(556647788);
}

/*
	Name: register
	Namespace: pip_menu
	Checksum: 0x12BDB5
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_70ee35b1();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: pip_menu
	Checksum: 0xF79EBB64
	Offset: 0x158
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
	Namespace: pip_menu
	Checksum: 0x8223FA61
	Offset: 0x198
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
	Namespace: pip_menu
	Checksum: 0xC4970C2C
	Offset: 0x1C0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_movieName
	Namespace: pip_menu
	Checksum: 0xFC159FEA
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_movieName(player, value)
{
	[[ self ]]->set_movieName(player, value);
}

/*
	Name: set_showBlackScreen
	Namespace: pip_menu
	Checksum: 0x2DC7A400
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showBlackScreen(player, value)
{
	[[ self ]]->set_showBlackScreen(player, value);
}

/*
	Name: set_looping
	Namespace: pip_menu
	Checksum: 0xAF442DBE
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_looping(player, value)
{
	[[ self ]]->set_looping(player, value);
}

/*
	Name: set_additive
	Namespace: pip_menu
	Checksum: 0x771CEFA5
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_additive(player, value)
{
	[[ self ]]->set_additive(player, value);
}

