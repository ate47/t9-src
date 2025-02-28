#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\weapons\satchel_charge.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_4dc6a9b234b838e1;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace satchel_charge;

/*
	Name: function_fd72bda2
	Namespace: satchel_charge
	Checksum: 0xB1C1F657
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fd72bda2()
{
	level notify(2064334068);
}

/*
	Name: __init__system__
	Namespace: satchel_charge
	Checksum: 0x6D960A9D
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"satchel_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: satchel_charge
	Checksum: 0xB78D7A9C
	Offset: 0x110
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	namespace_cc411409::function_70a657d8();
	callback::add_callback(#"on_ai_killed", &function_7c8d1738);
	zm_weapons::function_404c3ad5(getweapon(#"satchel_charge"), &function_558ac85a);
}

/*
	Name: function_558ac85a
	Namespace: satchel_charge
	Checksum: 0x7D23899E
	Offset: 0x1B0
	Size: 0xDA
	Parameters: 15
	Flags: Linked
*/
function function_558ac85a(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal)
{
	if(isentity(surfacetype) && isplayer(vsurfacenormal) && self.var_6f84b820 === #"normal")
	{
		self.var_8efbca7e = surfacetype.origin;
	}
}

/*
	Name: function_7c8d1738
	Namespace: satchel_charge
	Checksum: 0x272C6BFD
	Offset: 0x298
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_7c8d1738(params)
{
	if(params.weapon.name === #"satchel_charge" && isplayer(params.eattacker) && self.var_6f84b820 === #"normal" && isvec(self.var_8efbca7e))
	{
		self namespace_cc411409::function_706a56ae(self.var_8efbca7e, 2);
		self thread function_3fb4ce3b();
	}
}

/*
	Name: function_3fb4ce3b
	Namespace: satchel_charge
	Checksum: 0xC4755EAD
	Offset: 0x368
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_3fb4ce3b()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		self zombie_utility::gib_random_parts();
	}
}

