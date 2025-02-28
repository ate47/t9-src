#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_double_points;

/*
	Name: function_4f1319cd
	Namespace: zm_powerup_double_points
	Checksum: 0x2D547011
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4f1319cd()
{
	level notify(252136184);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_double_points
	Checksum: 0xBC316D3
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_double_points", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_double_points
	Checksum: 0x226953E8
	Offset: 0x110
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("double_points");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("double_points", "powerup_double_points");
	}
}

