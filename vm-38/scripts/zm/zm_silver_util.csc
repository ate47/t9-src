#using script_4025715c32ab0436;

#namespace zm_silver_util;

/*
	Name: function_1161d15f
	Namespace: zm_silver_util
	Checksum: 0x21A9882
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1161d15f()
{
	level notify(1763086227);
}

/*
	Name: init
	Namespace: zm_silver_util
	Checksum: 0x2D1803B
	Offset: 0x88
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.zm_silver_hud = zm_silver_hud::register();
}

