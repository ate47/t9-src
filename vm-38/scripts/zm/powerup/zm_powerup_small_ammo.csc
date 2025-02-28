#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_small_ammo;

/*
	Name: function_63f2de07
	Namespace: zm_powerup_small_ammo
	Checksum: 0x95630C92
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_63f2de07()
{
	level notify(1708989449);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_small_ammo
	Checksum: 0x12328C77
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_small_ammo", &__init__, undefined, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_powerup_small_ammo
	Checksum: 0x1006A1BE
	Offset: 0xF0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	zm_powerups::include_zombie_powerup("small_ammo");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("small_ammo");
	}
}

