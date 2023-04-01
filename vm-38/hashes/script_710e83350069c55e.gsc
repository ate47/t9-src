#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class cluielem_entity_bar : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielem_entity_bar
		Checksum: 0xC5AA3CDB
		Offset: 0x3A0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielem_entity_bar
		Checksum: 0x7F9354A3
		Offset: 0x980
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielem_entity_bar
		Checksum: 0xE963A6C9
		Offset: 0x528
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
		Name: set_offset_y
		Namespace: cluielem_entity_bar
		Checksum: 0x7F66E25D
		Offset: 0x840
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_offset_y(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_y", value);
	}

	/*
		Name: close
		Namespace: cluielem_entity_bar
		Checksum: 0xB7292602
		Offset: 0x570
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cLUIelem::function_a68f6e20(player);
	}

	/*
		Name: set_offset_x
		Namespace: cluielem_entity_bar
		Checksum: 0xE56D87B3
		Offset: 0x7F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_offset_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_x", value);
	}

	/*
		Name: set_offset_z
		Namespace: cluielem_entity_bar
		Checksum: 0x35A5B43E
		Offset: 0x890
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_offset_z(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cluielem_entity_bar
		Checksum: 0xAE3678BA
		Offset: 0x3C0
		Size: 0x15C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("LUIelem_entity_bar");
		cLUIelem::function_da693cbe("_state", 1, 3, "int");
		cLUIelem::function_da693cbe("progress_percent", 1, 7, "float");
		cLUIelem::function_da693cbe("entnum", 1, 7, "int");
		cLUIelem::function_da693cbe("offset_x", 1, 6, "int");
		cLUIelem::function_da693cbe("offset_y", 1, 6, "int");
		cLUIelem::function_da693cbe("offset_z", 1, 6, "int");
		cLUIelem::function_da693cbe("entityClamp", 1, 1, "int");
		cLUIelem::function_da693cbe("entityScale", 1, 1, "int");
	}

	/*
		Name: set_entityScale
		Namespace: cluielem_entity_bar
		Checksum: 0x9F301EC0
		Offset: 0x930
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entityScale(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entityScale", value);
	}

	/*
		Name: set_entNum
		Namespace: cluielem_entity_bar
		Checksum: 0x12DEA6EE
		Offset: 0x7A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entNum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entnum", value);
	}

	/*
		Name: set_state
		Namespace: cluielem_entity_bar
		Checksum: 0x7A48B576
		Offset: 0x5A0
		Size: 0x1A4
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"friendlyblue" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"green" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"yellow" == state_name)
					{
						player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 3);
					}
					else
					{
						if(#"red" == state_name)
						{
							player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 4);
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
			}
		}
	}

	/*
		Name: set_entityClamp
		Namespace: cluielem_entity_bar
		Checksum: 0x53CCCA41
		Offset: 0x8E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entityClamp(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entityClamp", value);
	}

	/*
		Name: set_progress_percent
		Namespace: cluielem_entity_bar
		Checksum: 0xD85DDA57
		Offset: 0x750
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progress_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress_percent", value);
	}

}

#namespace luielem_entity_bar;

/*
	Name: function_4ec91ba5
	Namespace: luielem_entity_bar
	Checksum: 0x7EB28414
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4ec91ba5()
{
	level notify(913304843);
}

/*
	Name: register
	Namespace: luielem_entity_bar
	Checksum: 0x4532DD21
	Offset: 0x150
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cluielem_entity_bar();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielem_entity_bar
	Checksum: 0x3A6790E3
	Offset: 0x190
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
	Namespace: luielem_entity_bar
	Checksum: 0x2AD0B106
	Offset: 0x1D0
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
	Namespace: luielem_entity_bar
	Checksum: 0x1E0592EA
	Offset: 0x1F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: luielem_entity_bar
	Checksum: 0xCA11B23C
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_progress_percent
	Namespace: luielem_entity_bar
	Checksum: 0x92DFFF0A
	Offset: 0x250
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress_percent(player, value)
{
	[[ self ]]->set_progress_percent(player, value);
}

/*
	Name: set_entNum
	Namespace: luielem_entity_bar
	Checksum: 0x6F50BEB6
	Offset: 0x280
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entNum(player, value)
{
	[[ self ]]->set_entNum(player, value);
}

/*
	Name: set_offset_x
	Namespace: luielem_entity_bar
	Checksum: 0xC08550A5
	Offset: 0x2B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_x(player, value)
{
	[[ self ]]->set_offset_x(player, value);
}

/*
	Name: set_offset_y
	Namespace: luielem_entity_bar
	Checksum: 0xD3655FE6
	Offset: 0x2E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_y(player, value)
{
	[[ self ]]->set_offset_y(player, value);
}

/*
	Name: set_offset_z
	Namespace: luielem_entity_bar
	Checksum: 0xA5242FFE
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(player, value)
{
	[[ self ]]->set_offset_z(player, value);
}

/*
	Name: set_entityClamp
	Namespace: luielem_entity_bar
	Checksum: 0x83523F7A
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entityClamp(player, value)
{
	[[ self ]]->set_entityClamp(player, value);
}

/*
	Name: set_entityScale
	Namespace: luielem_entity_bar
	Checksum: 0x771A426C
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entityScale(player, value)
{
	[[ self ]]->set_entityScale(player, value);
}

