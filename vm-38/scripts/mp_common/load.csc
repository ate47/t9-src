#using script_20055f2f97341caa;
#using script_26e61ae2e1d842a9;
#using script_30496ec6b1f696ca;
#using script_309ce7f5a9a023de;
#using scripts\core_common\item_inventory.csc;
#using scripts\core_common\map.csc;
#using script_446b64250de153ef;
#using scripts\core_common\vehicles\driving_fx.csc;
#using scripts\wz_common\wz_perk_paranoia.csc;
#using script_618d6f5ff5d18933;
#using script_644007a8c3885fc;
#using script_66e55245f6b76298;
#using script_6971dbf38c33bf47;
#using script_727042a075af51b7;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\gametype_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\mp_common\callbacks.csc;

#namespace load;

/*
	Name: function_60b31b7a
	Namespace: load
	Checksum: 0x939B1A94
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_60b31b7a()
{
	level notify(937338339);
}

/*
	Name: levelnotifyhandler
	Namespace: load
	Checksum: 0x56DE6CDD
	Offset: 0x178
	Size: 0x4E
	Parameters: 3
	Flags: Linked
*/
function levelnotifyhandler(clientnum, state, oldstate)
{
	if(oldstate != "")
	{
		level notify(oldstate, {#localclientnum:state});
	}
}

/*
	Name: function_aeb1baea
	Namespace: load
	Checksum: 0x14DCC720
	Offset: 0x1D0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_aeb1baea()
{
	/#
		assert(!isdefined(level.var_f18a6bd6));
	#/
	level.var_f18a6bd6 = &function_5e443ed1;
}

/*
	Name: function_5e443ed1
	Namespace: load
	Checksum: 0xB203BC8B
	Offset: 0x218
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_5e443ed1()
{
	/#
		assert(isdefined(level.first_frame), "");
	#/
	level thread util::init_utility();
	util::registersystem("levelNotify", &levelnotifyhandler);
	register_clientfields();
	level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
	setdvar(#"hash_7633a587d5705d08", 1);
	setdvar(#"hash_3fe46a1700f8faf6", 0.25);
	map::init();
	gametype::init();
	system::function_c11b0642();
	level flag::set(#"load_main_complete");
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x2A990F36
	Offset: 0x370
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("missile", "cf_m_proximity", 1, 1, "int", &callback::callback_proximity, 0, 0);
	clientfield::register("missile", "cf_m_emp", 1, 1, "int", &callback::callback_emp, 0, 0);
	clientfield::register("missile", "cf_m_stun", 1, 1, "int", &callback::callback_stunned, 0, 0);
}

