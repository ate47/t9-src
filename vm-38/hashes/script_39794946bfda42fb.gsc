#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_c33e75d1 : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_c33e75d1
		Checksum: 0x8E032608
		Offset: 0x2B0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_c33e75d1
		Checksum: 0xC91979C9
		Offset: 0x550
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_c33e75d1
		Checksum: 0xD088FB62
		Offset: 0x398
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
		cLUIelem::open_luielem(player, flags);
	}

	/*
		Name: set_raceTotalLap
		Namespace: namespace_c33e75d1
		Checksum: 0xEFE7233D
		Offset: 0x4B0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_raceTotalLap(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "raceTotalLap", value);
	}

	/*
		Name: set_raceRanking
		Namespace: namespace_c33e75d1
		Checksum: 0x4DABA36B
		Offset: 0x410
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_raceRanking(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "raceRanking", value);
	}

	/*
		Name: set_raceRewardTier
		Namespace: namespace_c33e75d1
		Checksum: 0x7CDBA257
		Offset: 0x500
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_raceRewardTier(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "raceRewardTier", value);
	}

	/*
		Name: set_raceCurrentLap
		Namespace: namespace_c33e75d1
		Checksum: 0xEB6E0B96
		Offset: 0x460
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_raceCurrentLap(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "raceCurrentLap", value);
	}

	/*
		Name: close
		Namespace: namespace_c33e75d1
		Checksum: 0x7071C79A
		Offset: 0x3E0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cLUIelem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c33e75d1
		Checksum: 0x6027FA72
		Offset: 0x2D0
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("zm_tungsten_grandprix");
		cLUIelem::add_clientfield("raceRanking", 28000, 2, "int");
		cLUIelem::add_clientfield("raceCurrentLap", 28000, 2, "int");
		cLUIelem::add_clientfield("raceTotalLap", 28000, 2, "int");
		cLUIelem::add_clientfield("raceRewardTier", 28000, 2, "int", 0);
	}

}

#namespace zm_tungsten_grandprix;

/*
	Name: function_7412301b
	Namespace: zm_tungsten_grandprix
	Checksum: 0x6AA776DF
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7412301b()
{
	level notify(1265274883);
}

/*
	Name: register
	Namespace: zm_tungsten_grandprix
	Checksum: 0x759888E7
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_c33e75d1();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_tungsten_grandprix
	Checksum: 0x584B4B43
	Offset: 0x160
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: zm_tungsten_grandprix
	Checksum: 0x5189623B
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_tungsten_grandprix
	Checksum: 0xC3D6EA8D
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_raceRanking
	Namespace: zm_tungsten_grandprix
	Checksum: 0x88DFDB3D
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_raceRanking(player, value)
{
	[[ self ]]->set_raceRanking(player, value);
}

/*
	Name: set_raceCurrentLap
	Namespace: zm_tungsten_grandprix
	Checksum: 0xE25ED9EE
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_raceCurrentLap(player, value)
{
	[[ self ]]->set_raceCurrentLap(player, value);
}

/*
	Name: set_raceTotalLap
	Namespace: zm_tungsten_grandprix
	Checksum: 0xD1C97B0A
	Offset: 0x250
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_raceTotalLap(player, value)
{
	[[ self ]]->set_raceTotalLap(player, value);
}

/*
	Name: set_raceRewardTier
	Namespace: zm_tungsten_grandprix
	Checksum: 0x1AC53E22
	Offset: 0x280
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_raceRewardTier(player, value)
{
	[[ self ]]->set_raceRewardTier(player, value);
}

