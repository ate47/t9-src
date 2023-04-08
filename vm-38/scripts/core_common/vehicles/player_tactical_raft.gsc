#using script_40fc784c60f9fa7b;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace player_tactical_raft;

/*
	Name: function_493e38c
	Namespace: player_tactical_raft
	Checksum: 0xEE9F4F68
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_493e38c()
{
	level notify(1018286051);
}

/*
	Name: __init__system__
	Namespace: player_tactical_raft
	Checksum: 0x296BE1C5
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_tactical_raft", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: player_tactical_raft
	Checksum: 0xBA46426F
	Offset: 0x120
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("tactical_raft_wz", &function_9941dc42);
	setdvar(#"phys_buoyancy", 1);
}

/*
	Name: function_9941dc42
	Namespace: player_tactical_raft
	Checksum: 0xBA6FFFE
	Offset: 0x180
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9941dc42()
{
	self setmovingplatformenabled(1, 0);
	self.var_93dc9da9 = "veh_zodiac_wall_imp";
	callback::function_d8abfc3d(#"hash_80ab24b716412e1", &function_a41bd019);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_a5838bb7);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_6d4de854);
}

/*
	Name: function_6d4de854
	Namespace: player_tactical_raft
	Checksum: 0x480CE6D1
	Offset: 0x248
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6d4de854(params)
{
}

/*
	Name: function_a5838bb7
	Namespace: player_tactical_raft
	Checksum: 0xF092257D
	Offset: 0x260
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a5838bb7(params)
{
	self thread player_vehicle::function_e8e41bbb();
}

/*
	Name: function_a41bd019
	Namespace: player_tactical_raft
	Checksum: 0xAE477339
	Offset: 0x290
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a41bd019(params)
{
}

