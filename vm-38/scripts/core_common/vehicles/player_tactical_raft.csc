#using script_2009cc4c4ecc010f;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace player_tactical_raft;

/*
	Name: function_663c320d
	Namespace: player_tactical_raft
	Checksum: 0xE8864A09
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_663c320d()
{
	level notify(1129656726);
}

/*
	Name: __init__system__
	Namespace: player_tactical_raft
	Checksum: 0x29EB67B5
	Offset: 0xB0
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
	Checksum: 0xF0C90D76
	Offset: 0x100
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("tactical_raft_wz", &function_9941dc42);
	setdvar(#"phys_buoyancy", 1);
}

/*
	Name: function_9941dc42
	Namespace: player_tactical_raft
	Checksum: 0xB23F1269
	Offset: 0x168
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9941dc42(localclientnum)
{
	self.var_917cf8e3 = &player_vehicle::function_b0d51c9;
	self.var_1a6ef836 = 0;
}

