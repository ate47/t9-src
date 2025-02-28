#using scripts\core_common\ai\zombie_death.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_nuke;

/*
	Name: function_5ff1b08
	Namespace: zm_powerup_nuke
	Checksum: 0x9ECE234F
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5ff1b08()
{
	level notify(608520979);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_nuke
	Checksum: 0x5D4455F7
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_nuke", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_nuke
	Checksum: 0x63DDE1EF
	Offset: 0x120
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("nuke");
	zm_powerups::add_zombie_powerup("nuke");
	clientfield::register("actor", "zm_nuked", 1, 1, "int", &zombie_nuked, 0, 0);
	clientfield::register("vehicle", "zm_nuked", 1, 1, "int", &zombie_nuked, 0, 0);
}

/*
	Name: zombie_nuked
	Namespace: zm_powerup_nuke
	Checksum: 0x369BC325
	Offset: 0x1F0
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function zombie_nuked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self zombie_death::flame_death_fx(bwastimejump);
}

