#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class cwz_revive_prompt : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cwz_revive_prompt
		Checksum: 0x54ABEFC7
		Offset: 0x2B0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cwz_revive_prompt
		Checksum: 0xC183DF32
		Offset: 0x550
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cwz_revive_prompt
		Checksum: 0x699064BF
		Offset: 0x398
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
		cLUIelem::open_luielem(player, flags);
	}

	/*
		Name: set_clientnum
		Namespace: cwz_revive_prompt
		Checksum: 0x344F412B
		Offset: 0x410
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clientnum", value);
	}

	/*
		Name: set_reviveProgress
		Namespace: cwz_revive_prompt
		Checksum: 0xB0EC630E
		Offset: 0x4B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_reviveProgress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "reviveProgress", value);
	}

	/*
		Name: close
		Namespace: cwz_revive_prompt
		Checksum: 0x68FE9D0E
		Offset: 0x3E0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cLUIelem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cwz_revive_prompt
		Checksum: 0xDB4813D9
		Offset: 0x2D0
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("wz_revive_prompt");
		cLUIelem::add_clientfield("clientnum", 1, 7, "int");
		cLUIelem::add_clientfield("progress", 1, 5, "float");
		cLUIelem::add_clientfield("reviveProgress", 1, 5, "float");
		cLUIelem::add_clientfield("cowardsWay", 1, 1, "int");
	}

	/*
		Name: set_progress
		Namespace: cwz_revive_prompt
		Checksum: 0xD20548C6
		Offset: 0x460
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

	/*
		Name: set_cowardsWay
		Namespace: cwz_revive_prompt
		Checksum: 0x6116BEBC
		Offset: 0x500
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_cowardsWay(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "cowardsWay", value);
	}

}

#namespace wz_revive_prompt;

/*
	Name: function_f465100d
	Namespace: wz_revive_prompt
	Checksum: 0xC5ABB0BA
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f465100d()
{
	level notify(870198272);
}

/*
	Name: register
	Namespace: wz_revive_prompt
	Checksum: 0x78303AD3
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cwz_revive_prompt();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: wz_revive_prompt
	Checksum: 0xA4DF70D2
	Offset: 0x160
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
	Namespace: wz_revive_prompt
	Checksum: 0x2FDF789
	Offset: 0x1A0
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
	Namespace: wz_revive_prompt
	Checksum: 0xE6010A6A
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_clientnum
	Namespace: wz_revive_prompt
	Checksum: 0xB7ECE126
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(player, value)
{
	[[ self ]]->set_clientnum(player, value);
}

/*
	Name: set_progress
	Namespace: wz_revive_prompt
	Checksum: 0x5D3E40C5
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(player, value)
{
	[[ self ]]->set_progress(player, value);
}

/*
	Name: set_reviveProgress
	Namespace: wz_revive_prompt
	Checksum: 0xE488204D
	Offset: 0x250
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_reviveProgress(player, value)
{
	[[ self ]]->set_reviveProgress(player, value);
}

/*
	Name: set_cowardsWay
	Namespace: wz_revive_prompt
	Checksum: 0x4B070CCA
	Offset: 0x280
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_cowardsWay(player, value)
{
	[[ self ]]->set_cowardsWay(player, value);
}

