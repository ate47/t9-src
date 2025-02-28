#using scripts\zm_common\zm_customgame.csc;
#using script_20055f2f97341caa;
#using scripts\zm_common\zm_aoe.csc;
#using script_26e61ae2e1d842a9;
#using script_30496ec6b1f696ca;
#using script_309ce7f5a9a023de;
#using scripts\core_common\item_inventory.csc;
#using script_446b64250de153ef;
#using scripts\core_common\vehicles\driving_fx.csc;
#using script_618d6f5ff5d18933;
#using script_644007a8c3885fc;
#using script_66e55245f6b76298;
#using script_6971dbf38c33bf47;
#using script_727042a075af51b7;
#using scripts\weapons\zm\weaponobjects.csc;
#using scripts\core_common\clientfaceanim_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\turret_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\zm_common\ambient.csc;
#using scripts\zm_common\global_fx.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_audio.csc;
#using scripts\zm_common\zm_magicbox.csc;
#using scripts\zm_common\zm_score.csc;
#using scripts\zm_common\zm_traps.csc;

#namespace load;

/*
	Name: function_bfb937af
	Namespace: load
	Checksum: 0x2931EA48
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bfb937af()
{
	level notify(609349004);
}

/*
	Name: __init__system__
	Namespace: load
	Checksum: 0x105E2130
	Offset: 0x1B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_load", &function_aeb1baea, undefined, undefined, undefined);
}

/*
	Name: levelnotifyhandler
	Namespace: load
	Checksum: 0x1E0158ED
	Offset: 0x1F8
	Size: 0x3A
	Parameters: 3
	Flags: Linked
*/
function levelnotifyhandler(clientnum, state, oldstate)
{
	if(oldstate != "")
	{
		level notify(oldstate, state);
	}
}

/*
	Name: warnmissilelocking
	Namespace: load
	Checksum: 0x72EEF915
	Offset: 0x240
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function warnmissilelocking(localclientnum, set)
{
}

/*
	Name: warnmissilelocked
	Namespace: load
	Checksum: 0x7F0FBDC5
	Offset: 0x260
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function warnmissilelocked(localclientnum, set)
{
}

/*
	Name: warnmissilefired
	Namespace: load
	Checksum: 0x1FCFDBEA
	Offset: 0x280
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function warnmissilefired(localclientnum, set)
{
}

/*
	Name: function_aeb1baea
	Namespace: load
	Checksum: 0xED3AB1BD
	Offset: 0x2A0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_aeb1baea()
{
	/#
		assert(!isdefined(level.var_f18a6bd6));
	#/
	level.var_f18a6bd6 = &function_5e443ed1;
}

/*
	Name: function_5e443ed1
	Namespace: load
	Checksum: 0x977BDF92
	Offset: 0x2E8
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_5e443ed1()
{
	/#
		/#
			assert(isdefined(level.first_frame), "");
		#/
	#/
	zm::init();
	level thread util::init_utility();
	util::register_system(#"levelnotify", &levelnotifyhandler);
	register_clientfields();
	level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
	system::function_c11b0642();
	level thread art_review();
	level flag::set(#"load_main_complete");
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x720566C6
	Offset: 0x408
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("allplayers", "zmbLastStand", 1, 1, "int", &zm::laststand, 0, 1);
}

