#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace namespace_d2304f18;

/*
	Name: function_89f2df9
	Namespace: namespace_d2304f18
	Checksum: 0xBEBF66F
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_493e4f8e3fb8b3d7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d2304f18
	Checksum: 0xEBE69F5A
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("hero_weapon_power");
	zm_powerups::add_zombie_powerup("hero_weapon_power");
}

