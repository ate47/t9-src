#using script_2c74a7b5eea1ec89;
#using script_383a3b1bb18ba876;
#using script_396f7d71538c9677;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_4a03c204316cf33;
#using script_56ca01b3b31455b5;
#using script_68d2ee1489345a1d;
#using script_8988fdbc78d6c53;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\placeables.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace killstreaks;

/*
	Name: init_shared
	Namespace: killstreaks
	Checksum: 0x51C16A8E
	Offset: 0x4B8
	Size: 0x384
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	level.killstreaks = [];
	level.killstreakweapons = [];
	level.var_b1dfdc3b = [];
	level.var_8997324c = [];
	level.droplocations = [];
	level.zoffsetcounter = 0;
	level.var_46c23c0f = 0;
	clientfield::function_a8bbc967("locSel.commandMode", 1, 1, "int");
	clientfield::function_a8bbc967("locSel.snapTo", 1, 1, "int");
	clientfield::register("vehicle", "timeout_beep", 1, 2, "int");
	clientfield::register("toplayer", "thermal_glow", 1, 1, "int");
	clientfield::register("toplayer", "thermal_glow_enemies_only", 12000, 1, "int");
	clientfield::register("vehicle", "standardTagFxSet", 1, 1, "int");
	clientfield::register("scriptmover", "standardTagFxSet", 1, 1, "int");
	clientfield::register("scriptmover", "lowHealthTagFxSet", 1, 1, "int");
	clientfield::register("scriptmover", "deathTagFxSet", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_524d30f5676b2070", 1, 1, "int");
	clientfield::register("vehicle", "scorestreakActive", 1, 1, "int");
	clientfield::register("scriptmover", "scorestreakActive", 1, 1, "int");
	namespace_f9b02f80::function_196f2c38();
	level.var_19a15e42 = undefined;
	level.killstreakmaxhealthfunction = &killstreak_bundles::get_max_health;
	level.var_239dc073 = getweapon(#"killstreak_remote");
	if(!isdefined(level.var_6cfbe5a))
	{
		level.var_6cfbe5a = new throttle();
		[[ level.var_6cfbe5a ]]->initialize(1, 0.1);
	}
	level.var_98769415 = &get_from_weapon;
	level.iskillstreakweapon = &is_killstreak_weapon;
	level.get_killstreak_for_weapon_for_stats = &get_killstreak_for_weapon_for_stats;
}

/*
	Name: function_447e6858
	Namespace: killstreaks
	Checksum: 0x190FAD9
	Offset: 0x848
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_447e6858()
{
	level.killstreakcorebundle = getscriptbundle("killstreak_core");
	if(!isdefined(level.roundstartkillstreakdelay))
	{
		level.roundstartkillstreakdelay = 0;
	}
	level.numkillstreakreservedobjectives = 0;
	level.killstreakcounter = 0;
	callback::on_spawned(&on_player_spawned);
	callback::on_joined_team(&on_joined_team);
}

/*
	Name: function_b5b6ef3e
	Namespace: killstreaks
	Checksum: 0x1B9E4304
	Offset: 0x8F0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_b5b6ef3e(func, obj)
{
	callback::add_callback(#"hash_45f35669076bc317", func, obj);
}

/*
	Name: function_f83b20be
	Namespace: killstreaks
	Checksum: 0x754894F7
	Offset: 0x938
	Size: 0x17A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f83b20be(killstreak_type, var_1624ed59)
{
	/#
		assert(isdefined(level.killstreaks[killstreak_type]), "");
	#/
	item_index = getitemindexfromref(var_1624ed59);
	killstreak_info = getunlockableiteminfofromindex(item_index, 0);
	var_ccab2c89 = 0;
	if(isdefined(killstreak_info))
	{
		var_ccab2c89 = killstreak_info.momentum;
	}
	level.killstreaks[killstreak_type].itemindex = item_index;
	level.killstreaks[killstreak_type].momentumcost = var_ccab2c89;
	level.killstreaks[killstreak_type].menuname = var_1624ed59;
	level.killstreaks[killstreak_type].uiname = "";
	/#
		if(isdefined(killstreak_info))
		{
			level.killstreaks[killstreak_type].uiname = killstreak_info.displayname;
		}
		if(level.killstreaks[killstreak_type].uiname == "")
		{
			level.killstreaks[killstreak_type].uiname = var_1624ed59;
		}
	#/
}

/*
	Name: killstreak_init
	Namespace: killstreaks
	Checksum: 0x151E4AAE
	Offset: 0xAC0
	Size: 0x116
	Parameters: 1
	Flags: Linked, Private
*/
function private killstreak_init(killstreak_type)
{
	/#
		assert(isdefined(killstreak_type), "");
	#/
	/#
		assert(!isdefined(level.killstreaks[killstreak_type]), ("" + killstreak_type) + "");
	#/
	level.killstreaks[killstreak_type] = spawnstruct();
	level.killstreaks[killstreak_type].killstreaklevel = 0;
	level.killstreaks[killstreak_type].quantity = 0;
	level.killstreaks[killstreak_type].overrideentitycameraindemo = 0;
	level.killstreaks[killstreak_type].teamkillpenaltyscale = 1;
	level.killstreaks[killstreak_type].var_b6c17aab = 0;
}

/*
	Name: register_weapon
	Namespace: killstreaks
	Checksum: 0xE4B614DC
	Offset: 0xBE0
	Size: 0x10C
	Parameters: 3
	Flags: Linked, Private
*/
function private register_weapon(killstreak_type, bundle, weapon)
{
	if(weapon.name == #"none")
	{
		return;
	}
	/#
		assert(isdefined(killstreak_type), "");
	#/
	/#
		assert(weapon.name != #"none");
	#/
	/#
		assert(!isdefined(level.killstreakweapons[weapon]), "");
	#/
	level.killstreaks[killstreak_type].weapon = weapon;
	level.killstreakweapons[weapon] = killstreak_type;
	if(is_true(bundle.var_7f7b9887))
	{
		level.var_b1dfdc3b[weapon] = killstreak_type;
	}
}

/*
	Name: register_vehicle
	Namespace: killstreaks
	Checksum: 0xCC1F9A55
	Offset: 0xCF8
	Size: 0x8C
	Parameters: 2
	Flags: Linked, Private
*/
function private register_vehicle(killstreak_type, vehicle)
{
	/#
		assert(isdefined(killstreak_type), "");
	#/
	/#
		assert(!isdefined(level.var_8997324c[vehicle]), "");
	#/
	level.killstreaks[killstreak_type].vehicle = vehicle;
	level.var_8997324c[vehicle] = killstreak_type;
}

/*
	Name: function_e48aca4d
	Namespace: killstreaks
	Checksum: 0x3352ED6
	Offset: 0xD90
	Size: 0x35A
	Parameters: 6
	Flags: Linked, Private
*/
function private function_e48aca4d(type, bundle, weapon, vehicle, var_c0a31091, isinventoryweapon)
{
	killstreak_init(type);
	menukey = bundle.var_a99ef6da;
	if(!isdefined(menukey))
	{
		menukey = type;
	}
	else if(is_true(isinventoryweapon))
	{
		menukey = "inventory_" + menukey;
	}
	function_f83b20be(type, menukey);
	level.killstreaks[type].usagekey = type;
	level.killstreaks[type].delaystreak = bundle.var_daf6b7af;
	level.killstreaks[type].usefunction = var_c0a31091;
	register_weapon(type, bundle, weapon);
	level.menureferenceforkillstreak[menukey] = type;
	if(isdefined(bundle.altweapons))
	{
		foreach(alt_weapon in bundle.altweapons)
		{
			function_181f96a6(type, bundle, alt_weapon.var_359445cd);
		}
	}
	if(isdefined(vehicle))
	{
		register_vehicle(type, vehicle);
	}
	level.killstreaks[type].notavailabletext = bundle.var_502a0e23;
	level.killstreaks[type].script_bundle = bundle;
	namespace_f9b02f80::function_1110a5de(type);
	if(is_true(bundle.var_1bc9830d) && is_true(isinventoryweapon))
	{
		register_dev_dvars(type);
	}
	switch(bundle.var_c36eb69b)
	{
		case "none":
		{
			level.killstreaks[type].teamkillpenaltyscale = 0;
			break;
		}
		case "reduced":
		{
			level.killstreaks[type].teamkillpenaltyscale = level.teamkillreducedpenalty;
			break;
		}
		case "default":
		default:
		{
			level.killstreaks[type].teamkillpenaltyscale = 1;
			break;
		}
	}
}

/*
	Name: register_bundle
	Namespace: killstreaks
	Checksum: 0x588B3849
	Offset: 0x10F8
	Size: 0x118
	Parameters: 2
	Flags: Linked
*/
function register_bundle(bundle, var_c0a31091)
{
	function_e48aca4d(bundle.var_d3413870, bundle, bundle.var_1ab696c6, bundle.ksvehicle, var_c0a31091, 0);
	if(isdefined(bundle.var_fc0c8eae) && bundle.var_fc0c8eae.name != #"none")
	{
		function_e48aca4d("inventory_" + bundle.var_d3413870, bundle, bundle.var_fc0c8eae, undefined, var_c0a31091, 1);
		if(bundle.var_fc0c8eae.iscarriedkillstreak && bundle.var_1ab696c6.iscarriedkillstreak)
		{
			if(!isdefined(level.var_6110cb51))
			{
				level.var_6110cb51 = [];
			}
			level.var_6110cb51[bundle.var_1ab696c6] = bundle.var_fc0c8eae;
		}
	}
}

/*
	Name: function_e4ef8390
	Namespace: killstreaks
	Checksum: 0x3C04C504
	Offset: 0x1218
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_e4ef8390(bundlename, var_832677ec)
{
	bundle = getscriptbundle(bundlename);
	register_bundle(bundle, var_832677ec);
}

/*
	Name: function_94c74046
	Namespace: killstreaks
	Checksum: 0xD7A0CFD5
	Offset: 0x1270
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_94c74046(killstreaktype)
{
	/#
		assert(isdefined(killstreaktype), "");
	#/
	if(!isdefined(level.var_33c629ad))
	{
		level.var_33c629ad = [];
	}
	level.var_33c629ad[killstreaktype] = 1;
}

/*
	Name: function_6bde02cc
	Namespace: killstreaks
	Checksum: 0xE937BABB
	Offset: 0x12D8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_6bde02cc(killstreaktype)
{
	return isdefined(level.var_33c629ad[killstreaktype]);
}

/*
	Name: function_181f96a6
	Namespace: killstreaks
	Checksum: 0x41299FEC
	Offset: 0x1300
	Size: 0x100
	Parameters: 3
	Flags: Linked, Private
*/
function private function_181f96a6(killstreaktype, bundle, weapon)
{
	/#
		assert(isdefined(killstreaktype), "");
	#/
	/#
		assert(isdefined(level.killstreaks[killstreaktype]), "");
	#/
	if(weapon == level.weaponnone)
	{
		return;
	}
	if(level.killstreaks[killstreaktype].weapon === weapon)
	{
		return;
	}
	if(!isdefined(level.killstreakweapons[weapon]))
	{
		level.killstreakweapons[weapon] = killstreaktype;
	}
	if(is_true(bundle.var_7f7b9887))
	{
		if(!isdefined(level.var_b1dfdc3b[weapon]))
		{
			level.var_b1dfdc3b[weapon] = killstreaktype;
		}
	}
}

/*
	Name: register_alt_weapon
	Namespace: killstreaks
	Checksum: 0x9D9D66D4
	Offset: 0x1408
	Size: 0x4C
	Parameters: 2
	Flags: Private
*/
function private register_alt_weapon(killstreaktype, weapon)
{
	function_181f96a6(killstreaktype, weapon);
	function_181f96a6("inventory_" + killstreaktype, weapon);
}

/*
	Name: function_b013c2d3
	Namespace: killstreaks
	Checksum: 0xEBF762D2
	Offset: 0x1460
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_b013c2d3(killstreaktype, weapon)
{
	if(!isdefined(level.var_3ff1b984))
	{
		level.var_3ff1b984 = [];
	}
	level.var_3ff1b984[weapon] = killstreaktype;
}

/*
	Name: function_d8c32ca4
	Namespace: killstreaks
	Checksum: 0x88B034FA
	Offset: 0x14A8
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_d8c32ca4(killstreaktype, var_ae755d2f)
{
	if(!isdefined(level.var_a385666))
	{
		level.var_a385666 = [];
	}
	level.var_a385666[killstreaktype] = var_ae755d2f;
}

/*
	Name: register_dev_dvars
	Namespace: killstreaks
	Checksum: 0x638CABBF
	Offset: 0x14F0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function register_dev_dvars(killstreaktype)
{
	/#
		/#
			assert(isdefined(killstreaktype), "");
		#/
		/#
			assert(isdefined(level.killstreaks[killstreaktype]), "");
		#/
		level.killstreaks[killstreaktype].devdvar = ("" + killstreaktype) + "";
		level.killstreaks[killstreaktype].devenemydvar = ("" + killstreaktype) + "";
		level.killstreaks[killstreaktype].devtimeoutdvar = ("" + killstreaktype) + "";
		setdvar(level.killstreaks[killstreaktype].devtimeoutdvar, 0);
		level thread register_devgui(killstreaktype);
	#/
}

/*
	Name: register_dev_debug_dvar
	Namespace: killstreaks
	Checksum: 0xBBD99018
	Offset: 0x1630
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function register_dev_debug_dvar(killstreaktype)
{
	/#
		/#
			assert(isdefined(killstreaktype), "");
		#/
		/#
			assert(isdefined(level.killstreaks[killstreaktype]), "");
		#/
		level.killstreaks[killstreaktype].devdebugdvar = ("" + killstreaktype) + "";
		devgui_scorestreak_command_debugdvar(killstreaktype, level.killstreaks[killstreaktype].devdebugdvar);
	#/
}

/*
	Name: register_devgui
	Namespace: killstreaks
	Checksum: 0xCC277B82
	Offset: 0x16F8
	Size: 0x138
	Parameters: 1
	Flags: None
*/
function register_devgui(killstreaktype)
{
	/#
		level endon(#"game_ended");
		wait(randomintrange(2, 20) * (float(function_60d95f53()) / 1000));
		give_type_all = "";
		give_type_enemy = "";
		if(isdefined(level.killstreaks[killstreaktype].devdvar))
		{
			devgui_scorestreak_command_givedvar(killstreaktype, give_type_all, level.killstreaks[killstreaktype].devdvar);
		}
		if(isdefined(level.killstreaks[killstreaktype].devenemydvar))
		{
			devgui_scorestreak_command_givedvar(killstreaktype, give_type_enemy, level.killstreaks[killstreaktype].devenemydvar);
		}
	#/
}

/*
	Name: devgui_scorestreak_command_givedvar
	Namespace: killstreaks
	Checksum: 0x9FAF36B8
	Offset: 0x1838
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function devgui_scorestreak_command_givedvar(killstreaktype, give_type, dvar)
{
	/#
		devgui_scorestreak_command(killstreaktype, give_type, ("" + dvar) + "");
	#/
}

/*
	Name: devgui_scorestreak_command_timeoutdvar
	Namespace: killstreaks
	Checksum: 0xF11BBE9F
	Offset: 0x1890
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function devgui_scorestreak_command_timeoutdvar(killstreaktype, dvar)
{
	/#
		devgui_scorestreak_dvar_toggle(killstreaktype, "", dvar);
	#/
}

/*
	Name: devgui_scorestreak_command_debugdvar
	Namespace: killstreaks
	Checksum: 0xC4EED5FA
	Offset: 0x18D0
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function devgui_scorestreak_command_debugdvar(killstreaktype, dvar)
{
	/#
		devgui_scorestreak_dvar_toggle(killstreaktype, "", dvar);
	#/
}

/*
	Name: devgui_scorestreak_dvar_toggle
	Namespace: killstreaks
	Checksum: 0x44690628
	Offset: 0x1910
	Size: 0x6C
	Parameters: 3
	Flags: None
*/
function devgui_scorestreak_dvar_toggle(killstreaktype, title, dvar)
{
	setdvar(dvar, 0);
	devgui_scorestreak_command(killstreaktype, "Toggle " + title, ("toggle " + dvar) + " 1 0");
}

/*
	Name: devgui_scorestreak_command
	Namespace: killstreaks
	Checksum: 0x73852527
	Offset: 0x1988
	Size: 0x244
	Parameters: 3
	Flags: Linked
*/
function devgui_scorestreak_command(killstreaktype, title, command)
{
	/#
		/#
			assert(isdefined(killstreaktype), "");
		#/
		/#
			assert(isdefined(level.killstreaks[killstreaktype]), "");
		#/
		root = "";
		display_name = level.killstreaks[killstreaktype].menuname;
		killstreak_weapon = get_killstreak_weapon(killstreaktype);
		if(isdefined(killstreak_weapon) && killstreak_weapon != level.weaponnone)
		{
			if(killstreak_weapon.displayname == #"")
			{
				display_name = display_name + "";
			}
			else
			{
				display_name = makelocalizedstring(killstreak_weapon.displayname);
			}
			if(strstartswith(display_name, ""))
			{
				display_name = getsubstr(display_name, 10);
			}
		}
		else if(strstartswith(display_name, ""))
		{
			display_name = getsubstr(display_name, 10);
		}
		if(strstartswith(killstreaktype, ""))
		{
			killstreaktype = getsubstr(killstreaktype, 10);
		}
		util::add_queued_debug_command((((((((root + display_name) + "") + killstreaktype) + "") + title) + "") + command) + "");
	#/
}

/*
	Name: should_draw_debug
	Namespace: killstreaks
	Checksum: 0xF937005C
	Offset: 0x1BD8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function should_draw_debug(killstreak)
{
	/#
		/#
			assert(isdefined(killstreak), "");
		#/
		function_2459bd2f();
		if(isdefined(level.killstreaks[killstreak]) && isdefined(level.killstreaks[killstreak].devdebugdvar))
		{
			return getdvarint(level.killstreaks[killstreak].devdebugdvar, 0);
		}
	#/
	return 0;
}

/*
	Name: function_2459bd2f
	Namespace: killstreaks
	Checksum: 0x701B1C81
	Offset: 0x1C80
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_2459bd2f()
{
	/#
		/#
			assert(isdefined(level.killstreaks), "");
		#/
	#/
}

/*
	Name: is_available
	Namespace: killstreaks
	Checksum: 0xA8624EF7
	Offset: 0x1CC0
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function is_available(killstreak)
{
	if(isdefined(level.menureferenceforkillstreak[killstreak]))
	{
		return true;
	}
	return false;
}

/*
	Name: get_by_menu_name
	Namespace: killstreaks
	Checksum: 0x194CB8C9
	Offset: 0x1CF8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function get_by_menu_name(killstreak)
{
	return level.menureferenceforkillstreak[killstreak];
}

/*
	Name: get_menu_name
	Namespace: killstreaks
	Checksum: 0xAE51A602
	Offset: 0x1D20
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function get_menu_name(killstreaktype)
{
	/#
		assert(isdefined(level.killstreaks[killstreaktype]));
	#/
	return level.killstreaks[killstreaktype].menuname;
}

/*
	Name: get_level
	Namespace: killstreaks
	Checksum: 0x83450CB5
	Offset: 0x1D78
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function get_level(index, killstreak)
{
	killstreaklevel = level.killstreaks[get_by_menu_name(killstreak)].killstreaklevel;
	if(getdvarint(#"custom_killstreak_mode", 0) == 2)
	{
		if(isdefined(self.killstreak[index]) && killstreak == self.killstreak[index])
		{
			killsrequired = getdvarint((("custom_killstreak_" + index) + 1) + "_kills", 0);
			if(killsrequired)
			{
				killstreaklevel = getdvarint((("custom_killstreak_" + index) + 1) + "_kills", 0);
			}
		}
	}
	return killstreaklevel;
}

/*
	Name: give_if_streak_count_matches
	Namespace: killstreaks
	Checksum: 0x98CBAC60
	Offset: 0x1EA0
	Size: 0x218
	Parameters: 3
	Flags: Linked
*/
function give_if_streak_count_matches(index, killstreak, streakcount)
{
	pixbeginevent();
	/#
		if(!isdefined(killstreak))
		{
			println("");
		}
		if(isdefined(killstreak))
		{
			println(("" + killstreak) + "");
		}
		if(!is_available(killstreak))
		{
			println("");
		}
	#/
	if(self.pers[#"killstreaksearnedthiskillstreak"] > index && util::isroundbased())
	{
		hasalreadyearnedkillstreak = 1;
	}
	else
	{
		hasalreadyearnedkillstreak = 0;
	}
	if(isdefined(killstreak) && is_available(killstreak) && !hasalreadyearnedkillstreak)
	{
		killstreaklevel = get_level(index, killstreak);
		if(self hasperk(#"specialty_killstreak"))
		{
			reduction = getdvarint(#"perk_killstreakreduction", 0);
			killstreaklevel = killstreaklevel - reduction;
			if(killstreaklevel <= 0)
			{
				killstreaklevel = 1;
			}
		}
		if(killstreaklevel == streakcount)
		{
			self give(get_by_menu_name(killstreak), streakcount);
			self.pers[#"killstreaksearnedthiskillstreak"] = index + 1;
			pixendevent();
			return 1;
		}
	}
	pixendevent();
	return 0;
}

/*
	Name: give_for_streak
	Namespace: killstreaks
	Checksum: 0x65A38FA2
	Offset: 0x20C8
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function give_for_streak()
{
	if(!util::is_killstreaks_enabled())
	{
		return;
	}
	if(!isdefined(self.pers[#"totalkillstreakcount"]))
	{
		self.pers[#"totalkillstreakcount"] = 0;
	}
	given = 0;
	for(i = 0; i < self.killstreak.size; i++)
	{
		given = given | give_if_streak_count_matches(i, self.killstreak[i], self.pers[#"cur_kill_streak"]);
	}
}

/*
	Name: give
	Namespace: killstreaks
	Checksum: 0x9F805896
	Offset: 0x2190
	Size: 0x15A
	Parameters: 5
	Flags: Linked
*/
function give(killstreaktype, streak, suppressnotification, noxp, tobottom)
{
	pixbeginevent();
	self endon(#"disconnect");
	level endon(#"game_ended");
	killstreakgiven = 0;
	if(isdefined(noxp))
	{
		if(self give_internal(streak, undefined, noxp, tobottom))
		{
			killstreakgiven = 1;
			if(self.just_given_new_inventory_killstreak === 1)
			{
				self add_to_notification_queue(level.killstreaks[streak].menuname, suppressnotification, streak, noxp, 1);
			}
		}
	}
	else if(self give_internal(streak))
	{
		killstreakgiven = 1;
		if(self.just_given_new_inventory_killstreak === 1)
		{
			self add_to_notification_queue(level.killstreaks[streak].menuname, suppressnotification, streak, noxp, 1);
		}
	}
	pixendevent();
	return killstreakgiven;
}

/*
	Name: take
	Namespace: killstreaks
	Checksum: 0x9C354C9A
	Offset: 0x22F8
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function take(killstreak)
{
	self endon(#"disconnect");
	killstreak_weapon = get_killstreak_weapon(killstreak);
	remove_used_killstreak(killstreak);
	if(self getinventoryweapon() == killstreak_weapon)
	{
		self setinventoryweapon(level.weaponnone);
	}
	waittillframeend();
	currentweapon = self getcurrentweapon();
	if(currentweapon != killstreak_weapon || killstreak_weapon.iscarriedkillstreak)
	{
		return;
	}
	switch_to_last_non_killstreak_weapon();
	activate_next();
}

/*
	Name: remove_oldest
	Namespace: killstreaks
	Checksum: 0x8E5BFD08
	Offset: 0x23F8
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function remove_oldest()
{
	if(isdefined(self.pers[#"killstreaks"][0]))
	{
		currentweapon = self getcurrentweapon();
		if(currentweapon == get_killstreak_weapon(self.pers[#"killstreaks"][0]))
		{
			primaries = self getweaponslistprimaries();
			if(primaries.size > 0)
			{
				self switchtoweapon(primaries[0]);
			}
		}
		self notify(#"oldest_killstreak_removed", {#id:self.pers[#"killstreak_unique_id"][0], #type:self.pers[#"killstreaks"][0]});
		self remove_used_killstreak(self.pers[#"killstreaks"][0], self.pers[#"killstreak_unique_id"][0], 0);
	}
}

/*
	Name: give_internal
	Namespace: killstreaks
	Checksum: 0xA075EE5C
	Offset: 0x2578
	Size: 0x8F0
	Parameters: 4
	Flags: Linked
*/
function give_internal(killstreaktype, do_not_update_death_count, noxp, tobottom)
{
	self.just_given_new_inventory_killstreak = undefined;
	if(level.gameended)
	{
		return false;
	}
	if(!util::is_killstreaks_enabled())
	{
		return false;
	}
	if(!isdefined(level.killstreaks[do_not_update_death_count]))
	{
		return false;
	}
	if(!isdefined(self.pers[#"killstreaks"]))
	{
		self.pers[#"killstreaks"] = [];
	}
	if(!isdefined(self.pers[#"killstreak_has_been_used"]))
	{
		self.pers[#"killstreak_has_been_used"] = [];
	}
	if(!isdefined(self.pers[#"killstreak_unique_id"]))
	{
		self.pers[#"killstreak_unique_id"] = [];
	}
	if(!isdefined(self.pers[#"killstreak_ammo_count"]))
	{
		self.pers[#"killstreak_ammo_count"] = [];
	}
	just_max_stack_removed_inventory_killstreak = undefined;
	if(isdefined(tobottom) && tobottom)
	{
		size = self.pers[#"killstreaks"].size;
		if(self.pers[#"killstreaks"].size >= level.maxinventoryscorestreaks)
		{
			self remove_oldest();
			just_max_stack_removed_inventory_killstreak = self.just_removed_used_killstreak;
		}
		for(i = size; i > 0; i--)
		{
			self.pers[#"killstreaks"][i] = self.pers[#"killstreaks"][i - 1];
			self.pers[#"killstreak_has_been_used"][i] = self.pers[#"killstreak_has_been_used"][i - 1];
			self.pers[#"killstreak_unique_id"][i] = self.pers[#"killstreak_unique_id"][i - 1];
			self.pers[#"killstreak_ammo_count"][i] = self.pers[#"killstreak_ammo_count"][i - 1];
		}
		self.pers[#"killstreaks"][0] = do_not_update_death_count;
		self.pers[#"killstreak_unique_id"][0] = level.killstreakcounter;
		level.killstreakcounter++;
		if(isdefined(noxp))
		{
			self.pers[#"killstreak_has_been_used"][0] = noxp;
		}
		else
		{
			self.pers[#"killstreak_has_been_used"][0] = 0;
		}
		if(size == 0)
		{
			ammocount = give_weapon(do_not_update_death_count);
		}
		self.pers[#"killstreak_ammo_count"][0] = 0;
	}
	else
	{
		var_7b935486 = 0;
		if(self.pers[#"killstreaks"].size && self.currentweapon === (get_killstreak_weapon(self.pers[#"killstreaks"][self.pers[#"killstreaks"].size - 1])))
		{
			var_7b935486 = 1;
		}
		self.pers[#"killstreaks"][self.pers[#"killstreaks"].size] = do_not_update_death_count;
		self.pers[#"killstreak_unique_id"][self.pers[#"killstreak_unique_id"].size] = level.killstreakcounter;
		level.killstreakcounter++;
		if(self.pers[#"killstreaks"].size > level.maxinventoryscorestreaks)
		{
			self remove_oldest();
			just_max_stack_removed_inventory_killstreak = self.just_removed_used_killstreak;
		}
		if(!isdefined(noxp))
		{
			noxp = 0;
		}
		self.pers[#"killstreak_has_been_used"][self.pers[#"killstreak_has_been_used"].size] = noxp;
		ammocount = give_weapon(do_not_update_death_count);
		self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size] = ammocount;
		if(var_7b935486)
		{
			var_3522232f = self.pers[#"killstreaks"].size - 2;
			var_a1312679 = self.pers[#"killstreaks"].size - 1;
			var_3197d2aa = self.pers[#"killstreaks"][var_3522232f];
			var_c72e250a = self.pers[#"killstreak_unique_id"][var_3522232f];
			var_948e9ad0 = self.pers[#"killstreak_has_been_used"][var_3522232f];
			var_80931fe9 = self.pers[#"killstreak_ammo_count"][var_3522232f];
			self.pers[#"killstreaks"][var_3522232f] = self.pers[#"killstreaks"][var_a1312679];
			self.pers[#"killstreak_unique_id"][var_3522232f] = self.pers[#"killstreak_unique_id"][var_a1312679];
			self.pers[#"killstreak_has_been_used"][var_3522232f] = self.pers[#"killstreak_has_been_used"][var_a1312679];
			self.pers[#"killstreak_ammo_count"][var_3522232f] = self.pers[#"killstreak_ammo_count"][var_a1312679];
			self.pers[#"killstreaks"][var_a1312679] = var_3197d2aa;
			self.pers[#"killstreak_unique_id"][var_a1312679] = var_c72e250a;
			self.pers[#"killstreak_has_been_used"][var_a1312679] = var_948e9ad0;
			self.pers[#"killstreak_ammo_count"][var_a1312679] = var_80931fe9;
			self setinventoryweapon(get_killstreak_weapon(var_3197d2aa));
		}
	}
	self.just_given_new_inventory_killstreak = do_not_update_death_count !== just_max_stack_removed_inventory_killstreak && !is_true(var_7b935486);
	if(!isdefined(self.var_58d669ff))
	{
		self.var_58d669ff = [];
	}
	if(!isdefined(self.var_58d669ff[do_not_update_death_count]))
	{
		self.var_58d669ff[do_not_update_death_count] = [];
	}
	array::push(self.var_58d669ff[do_not_update_death_count], gettime(), self.var_58d669ff[do_not_update_death_count].size);
	return true;
}

/*
	Name: add_to_notification_queue
	Namespace: killstreaks
	Checksum: 0x8DE5D156
	Offset: 0x2E70
	Size: 0x1D4
	Parameters: 5
	Flags: Linked
*/
function add_to_notification_queue(menuname, streakcount, hardpointtype, nonotify, var_af825242)
{
	killstreaktablenumber = level.killstreakindices[streakcount];
	if(!isdefined(killstreaktablenumber))
	{
		if(sessionmodeiszombiesgame() && !is_true(nonotify))
		{
			self thread namespace_f9b02f80::play_killstreak_ready_dialog(hardpointtype, 1);
			self thread play_killstreak_ready_sfx(hardpointtype);
		}
		return;
	}
	if(is_true(nonotify))
	{
		return;
	}
	informdialog = namespace_f9b02f80::get_killstreak_inform_dialog(hardpointtype);
	killstreakslot = function_a2c375bb(hardpointtype);
	self thread namespace_f9b02f80::play_killstreak_ready_dialog(hardpointtype, 2.4);
	self thread play_killstreak_ready_sfx(hardpointtype);
	self luinotifyevent(#"killstreak_received", 3, killstreaktablenumber, informdialog, var_af825242);
	self function_8ba40d2f(#"killstreak_received", 3, killstreaktablenumber, informdialog, var_af825242);
	if(isdefined(killstreakslot))
	{
		self function_6bf621ea(#"hash_6a9cb800ad0ef395", 2, self getentitynumber(), killstreakslot);
	}
}

/*
	Name: has_equipped
	Namespace: killstreaks
	Checksum: 0x65A972DA
	Offset: 0x3050
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function has_equipped()
{
	currentweapon = self getcurrentweapon();
	foreach(killstreak in level.killstreaks)
	{
		if(killstreak.weapon == currentweapon)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: _get_from_weapon
	Namespace: killstreaks
	Checksum: 0xDF4E4D9F
	Offset: 0x3108
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function _get_from_weapon(weapon)
{
	return get_killstreak_for_weapon(weapon);
}

/*
	Name: get_from_weapon
	Namespace: killstreaks
	Checksum: 0x3B655207
	Offset: 0x3138
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function get_from_weapon(weapon)
{
	if(weapon == level.weaponnone)
	{
		return undefined;
	}
	res = _get_from_weapon(weapon);
	if(!isdefined(res))
	{
		return _get_from_weapon(weapon.rootweapon);
	}
	return res;
}

/*
	Name: function_ed34685
	Namespace: killstreaks
	Checksum: 0x11EF8AEC
	Offset: 0x31B8
	Size: 0x150
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ed34685(currentweapon)
{
	if(currentweapon != level.weaponnone && !is_true(level.usingmomentum))
	{
		weaponslist = self getweaponslist();
		foreach(carriedweapon in weaponslist)
		{
			if(currentweapon == carriedweapon)
			{
				continue;
			}
			var_6ddecf7f = get_killstreak_for_weapon(carriedweapon);
			if(isdefined(var_6ddecf7f))
			{
				if(level.killstreaks[var_6ddecf7f].script_bundle.var_301403ee)
				{
					continue;
				}
			}
			if(is_killstreak_weapon(carriedweapon))
			{
				self takeweapon(carriedweapon);
			}
		}
	}
}

/*
	Name: give_weapon
	Namespace: killstreaks
	Checksum: 0x8A04719E
	Offset: 0x3310
	Size: 0x4A8
	Parameters: 2
	Flags: Linked
*/
function give_weapon(killstreaktype, usestoredammo)
{
	currentweapon = self getcurrentweapon();
	function_ed34685(currentweapon);
	weapon = get_killstreak_weapon(killstreaktype);
	if(currentweapon != weapon && self hasweapon(weapon) == 0)
	{
		self takeweapon(weapon);
		self giveweapon(weapon);
	}
	if(is_true(level.usingmomentum))
	{
		self setinventoryweapon(weapon);
		if(weapon.iscarriedkillstreak)
		{
			if(!isdefined(self.pers[#"held_killstreak_ammo_count"][weapon]))
			{
				self.pers[#"held_killstreak_ammo_count"][weapon] = 0;
			}
			if(!isdefined(self.pers[#"held_killstreak_clip_count"][weapon]))
			{
				self.pers[#"held_killstreak_clip_count"][weapon] = weapon.clipsize;
			}
			if(!isdefined(self.pers[#"killstreak_quantity"][weapon]))
			{
				self.pers[#"killstreak_quantity"][weapon] = 0;
			}
			var_e93a65da = self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size - 1];
			if(currentweapon == weapon && !isheldinventorykillstreakweapon(weapon))
			{
				return weapon.maxammo;
			}
			if(is_true(usestoredammo) && (isdefined(var_e93a65da) ? var_e93a65da : 0) > 0)
			{
				if((isdefined(self.pers[#"held_killstreak_ammo_count"][weapon]) ? self.pers[#"held_killstreak_ammo_count"][weapon] : 0) > 0)
				{
					return self.pers[#"held_killstreak_ammo_count"][weapon];
				}
				self.pers[#"held_killstreak_ammo_count"][weapon] = var_e93a65da;
				self loadout::function_3ba6ee5d(weapon, var_e93a65da);
			}
			else
			{
				self.pers[#"held_killstreak_ammo_count"][weapon] = weapon.maxammo;
				self.pers[#"held_killstreak_clip_count"][weapon] = weapon.clipsize;
				self loadout::function_3ba6ee5d(weapon, self.pers[#"held_killstreak_ammo_count"][weapon]);
			}
			return self.pers[#"held_killstreak_ammo_count"][weapon];
		}
		switch(level.killstreaks[killstreaktype].script_bundle.var_514a90ee)
		{
			case "clip":
			{
				delta = weapon.clipsize;
				break;
			}
			case "one":
			{
				delta = 1;
				break;
			}
			default:
			{
				delta = 0;
				break;
			}
		}
		return change_killstreak_quantity(weapon, delta);
	}
	self setactionslot(4, "weapon", weapon);
	return 1;
}

/*
	Name: activate_next
	Namespace: killstreaks
	Checksum: 0x2E56D257
	Offset: 0x37C8
	Size: 0x248
	Parameters: 1
	Flags: Linked
*/
function activate_next(do_not_update_death_count)
{
	if(level.gameended)
	{
		return false;
	}
	if(is_true(level.usingmomentum))
	{
		self setinventoryweapon(level.weaponnone);
	}
	else
	{
		self setactionslot(4, "");
	}
	if(!isdefined(self.pers[#"killstreaks"]) || self.pers[#"killstreaks"].size == 0)
	{
		return false;
	}
	killstreaktype = self.pers[#"killstreaks"][self.pers[#"killstreaks"].size - 1];
	if(!isdefined(level.killstreaks[killstreaktype]))
	{
		return false;
	}
	weapon = level.killstreaks[killstreaktype].weapon;
	waitframe(1);
	if(self isremotecontrolling() && self.usingremote === weapon.statname)
	{
		while(self isremotecontrolling())
		{
			waitframe(1);
		}
	}
	ammocount = give_weapon(killstreaktype, 1);
	if(weapon.iscarriedkillstreak && !is_true(level.var_174c7c61))
	{
		self function_fa6e0467(weapon);
	}
	if(!isdefined(do_not_update_death_count) || do_not_update_death_count != 0)
	{
		self.pers["killstreakItemDeathCount" + killstreaktype] = self.deathcount;
	}
	return true;
}

/*
	Name: give_owned
	Namespace: killstreaks
	Checksum: 0x6D1538B7
	Offset: 0x3A18
	Size: 0x20E
	Parameters: 0
	Flags: Linked
*/
function give_owned()
{
	if(!isdefined(self.pers[#"killstreaks"]))
	{
		self.pers[#"killstreaks"] = [];
	}
	if(!isdefined(self.pers[#"killstreak_has_been_used"]))
	{
		self.pers[#"killstreak_has_been_used"] = [];
	}
	if(!isdefined(self.pers[#"killstreak_unique_id"]))
	{
		self.pers[#"killstreak_unique_id"] = [];
	}
	if(!isdefined(self.pers[#"killstreak_ammo_count"]))
	{
		self.pers[#"killstreak_ammo_count"] = [];
	}
	if(self.pers[#"killstreaks"].size > 0)
	{
		self activate_next(0);
	}
	size = self.pers[#"killstreaks"].size;
	if(size > 0)
	{
		self thread namespace_f9b02f80::play_killstreak_ready_dialog(self.pers[#"killstreaks"][size - 1]);
	}
	self.lastnonkillstreakweapon = (isdefined(self.currentweapon) ? self.currentweapon : level.weaponnone);
	if(self.lastnonkillstreakweapon == level.weaponnone)
	{
		weapons = self getweaponslistprimaries();
		if(weapons.size > 0)
		{
			self.lastnonkillstreakweapon = weapons[0];
		}
		else
		{
			self.lastnonkillstreakweapon = level.weaponbasemelee;
		}
	}
}

/*
	Name: get_killstreak_quantity
	Namespace: killstreaks
	Checksum: 0x455701A6
	Offset: 0x3C30
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function get_killstreak_quantity(killstreakweapon)
{
	if(!isdefined(self.pers[#"killstreak_quantity"]))
	{
		return false;
	}
	return true;
}

/*
	Name: change_killstreak_quantity
	Namespace: killstreaks
	Checksum: 0x686985DD
	Offset: 0x3CB0
	Size: 0x238
	Parameters: 2
	Flags: Linked
*/
function change_killstreak_quantity(killstreakweapon, delta)
{
	if(delta === 1 && killstreakweapon.statname == "remote_missile")
	{
		streamermodelhint(killstreakweapon.var_22082a57, 7);
	}
	quantity = get_killstreak_quantity(killstreakweapon);
	previousquantity = quantity;
	quantity = quantity + delta;
	if(quantity > level.scorestreaksmaxstacking)
	{
		quantity = level.scorestreaksmaxstacking;
	}
	if(self hasweapon(killstreakweapon) == 0)
	{
		self takeweapon(killstreakweapon);
		self giveweapon(killstreakweapon);
		self seteverhadweaponall(1);
	}
	self.pers[#"killstreak_quantity"][killstreakweapon] = quantity;
	self setweaponammoclip(killstreakweapon, quantity);
	self notify("killstreak_quantity_" + killstreakweapon.name);
	killstreaktype = get_killstreak_for_weapon(killstreakweapon);
	if(!isdefined(self.var_58d669ff))
	{
		self.var_58d669ff = [];
	}
	if(!isdefined(self.var_58d669ff[killstreaktype]))
	{
		self.var_58d669ff[killstreaktype] = [];
	}
	index = 0;
	while(delta - index > 0)
	{
		array::push(self.var_58d669ff[killstreaktype], function_f8d53445(), self.var_58d669ff[killstreaktype].size);
		index++;
	}
	return quantity;
}

/*
	Name: function_1f96e8f8
	Namespace: killstreaks
	Checksum: 0x5860E211
	Offset: 0x3EF0
	Size: 0x110
	Parameters: 1
	Flags: Linked
*/
function function_1f96e8f8(killstreakweapon)
{
	quantity = get_killstreak_quantity(killstreakweapon);
	if(quantity > level.scorestreaksmaxstacking)
	{
		quantity = level.scorestreaksmaxstacking;
	}
	if(self hasweapon(killstreakweapon) == 0 && !is_false(level.var_e2636f91))
	{
		self takeweapon(killstreakweapon);
		self giveweapon(killstreakweapon);
		self seteverhadweaponall(1);
	}
	if(self hasweapon(killstreakweapon))
	{
		self setweaponammoclip(killstreakweapon, quantity);
	}
	return quantity;
}

/*
	Name: has_killstreak_in_class
	Namespace: killstreaks
	Checksum: 0x13BABEC5
	Offset: 0x4008
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function has_killstreak_in_class(killstreakmenuname)
{
	foreach(equippedkillstreak in self.killstreak)
	{
		if(equippedkillstreak == killstreakmenuname)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: has_killstreak
	Namespace: killstreaks
	Checksum: 0xA268DCCF
	Offset: 0x40A0
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function has_killstreak(killstreak)
{
	player = self;
	if(!isdefined(killstreak) || !isdefined(player.pers[#"killstreaks"]))
	{
		return false;
	}
	for(i = 0; i < self.pers[#"killstreaks"].size; i++)
	{
		if(player.pers[#"killstreaks"][i] == killstreak)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: recordkillstreakbegindirect
	Namespace: killstreaks
	Checksum: 0x6C9445C4
	Offset: 0x4158
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function recordkillstreakbegindirect(killstreak, recordstreakindex)
{
	player = self;
	if(!isplayer(player) || !isdefined(recordstreakindex))
	{
		return;
	}
	if(!isdefined(player.killstreakevents))
	{
		player.killstreakevents = associativearray();
	}
	var_b16cd32d = 0;
	if(isdefined(self.var_58d669ff) && isdefined(self.var_58d669ff[killstreak]) && self.var_58d669ff[killstreak].size > 0)
	{
		var_b16cd32d = array::pop_front(self.var_58d669ff[killstreak], 0);
	}
	if(isdefined(self.killstreakevents[recordstreakindex]))
	{
		kills = player.killstreakevents[recordstreakindex];
		eventindex = player recordkillstreakevent(recordstreakindex, var_b16cd32d);
		player killstreakrules::recordkillstreakenddirect(eventindex, recordstreakindex, kills);
		player.killstreakevents[recordstreakindex] = undefined;
	}
	else
	{
		eventindex = player recordkillstreakevent(recordstreakindex, var_b16cd32d);
		player.killstreakevents[recordstreakindex] = eventindex;
	}
}

/*
	Name: remove_when_done
	Namespace: killstreaks
	Checksum: 0xC564564B
	Offset: 0x42E8
	Size: 0x354
	Parameters: 3
	Flags: Linked
*/
function remove_when_done(killstreaktype, haskillstreakbeenused, isfrominventory)
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"killstreak_done");
		if(waitresult.var_d3413870 == haskillstreakbeenused)
		{
			break;
		}
	}
	if(waitresult.is_successful)
	{
		self function_aa56f6a0(haskillstreakbeenused, isfrominventory);
		success = 1;
	}
	else
	{
		killstreak_weapon = get_killstreak_weapon(haskillstreakbeenused);
		if(!killstreak_weapon.iscarriedkillstreak)
		{
			self function_1f96e8f8(killstreak_weapon);
		}
	}
	waittillframeend();
	killstreak_weapon = get_killstreak_weapon(haskillstreakbeenused);
	if(killstreak_weapon.var_7d24272c)
	{
		if(!is_true(level.usingmomentum) || is_true(isfrominventory) && waitresult.is_successful)
		{
			activate_next();
		}
		return;
	}
	currentweapon = self getcurrentweapon();
	if(currentweapon == killstreak_weapon && killstreak_weapon.iscarriedkillstreak)
	{
		return;
	}
	if(waitresult.is_successful && (!self has_killstreak_in_class(get_menu_name(haskillstreakbeenused)) || is_true(isfrominventory)))
	{
		switch_to_last_non_killstreak_weapon();
	}
	else
	{
		killstreakforcurrentweapon = get_from_weapon(currentweapon);
		if(currentweapon.isgameplayweapon)
		{
			if(is_true(self.isplanting) || is_true(self.isdefusing))
			{
				return;
			}
		}
		if(!isdefined(killstreakforcurrentweapon) && isdefined(currentweapon))
		{
			return;
		}
		if(waitresult.is_successful || !isdefined(killstreakforcurrentweapon) || (killstreakforcurrentweapon == haskillstreakbeenused || killstreakforcurrentweapon == ("inventory_" + haskillstreakbeenused) && !currentweapon.iscarriedkillstreak))
		{
			switch_to_last_non_killstreak_weapon();
		}
	}
	if(!is_true(level.usingmomentum) || is_true(isfrominventory) && waitresult.is_successful)
	{
		activate_next();
	}
}

/*
	Name: function_aa56f6a0
	Namespace: killstreaks
	Checksum: 0xAADF2E6D
	Offset: 0x4648
	Size: 0x42C
	Parameters: 2
	Flags: Linked
*/
function function_aa56f6a0(killstreaktype, isfrominventory)
{
	/#
		print("" + get_menu_name(killstreaktype));
	#/
	if(!isdefined(self.pers[level.killstreaks[killstreaktype].usagekey]))
	{
		self.pers[level.killstreaks[killstreaktype].usagekey] = 0;
	}
	self.pers[level.killstreaks[killstreaktype].usagekey]++;
	killstreak_weapon = get_killstreak_weapon(killstreaktype);
	var_d86010cb = get_killstreak_for_weapon_for_stats(killstreak_weapon);
	if(isdefined(level.killstreaks[var_d86010cb].menuname))
	{
		recordstreakindex = level.killstreakindices[level.killstreaks[var_d86010cb].menuname];
		self recordkillstreakbegindirect(killstreaktype, recordstreakindex);
	}
	if(is_true(level.usingscorestreaks))
	{
		var_ad8ae78f = {#activatedby:getplayerspawnid(self), #killstreak:killstreaktype, #gametime:function_f8d53445()};
		function_92d1707f(#"hash_1aa07f199266e0c7", var_ad8ae78f);
		if(is_true(isfrominventory))
		{
			remove_used_killstreak(killstreaktype);
			if(self getinventoryweapon() == killstreak_weapon)
			{
				self setinventoryweapon(level.weaponnone);
			}
		}
		else
		{
			self change_killstreak_quantity(killstreak_weapon, -1);
		}
	}
	else
	{
		if(is_true(level.usingmomentum))
		{
			if(is_true(isfrominventory) && self getinventoryweapon() == killstreak_weapon)
			{
				remove_used_killstreak(killstreaktype);
				self setinventoryweapon(level.weaponnone);
			}
			else if(isdefined(level.var_b0dc03c7))
			{
				self [[level.var_b0dc03c7]](killstreaktype);
			}
		}
		else
		{
			remove_used_killstreak(killstreaktype);
		}
	}
	if(!is_true(level.usingmomentum))
	{
		self setactionslot(4, "");
	}
	killstreakslot = function_a2c375bb(killstreaktype);
	if(isdefined(killstreakslot))
	{
		self function_6bf621ea(#"hash_2e64558432f8b5b2", 2, self getentitynumber(), killstreakslot);
	}
	callback::callback(#"hash_4a1cdf56005f9fb3", {#killstreaktype:killstreaktype, #player:self});
}

/*
	Name: usekillstreak
	Namespace: killstreaks
	Checksum: 0xB3A86061
	Offset: 0x4A80
	Size: 0x10E
	Parameters: 2
	Flags: Linked
*/
function usekillstreak(killstreak, isfrominventory)
{
	haskillstreakbeenused = get_if_top_killstreak_has_been_used();
	if(isdefined(self.selectinglocation))
	{
		return;
	}
	if(isdefined(self.drone))
	{
		[[level.killstreaks[killstreak].usefunction]](killstreak);
	}
	else
	{
		killstreakslot = function_a2c375bb(killstreak);
		if(isdefined(killstreakslot))
		{
			self function_6bf621ea(#"hash_1d8e470838fb6dd3", 2, self getentitynumber(), killstreakslot);
		}
		self thread remove_when_done(killstreak, haskillstreakbeenused, isfrominventory);
		self thread trigger_killstreak(killstreak, isfrominventory);
	}
	self notify(#"hash_381bb741cb320f95");
}

/*
	Name: function_2ea0382e
	Namespace: killstreaks
	Checksum: 0x2260D899
	Offset: 0x4B98
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_2ea0382e()
{
	self.pers[#"killstreaks"] = [];
	self.pers[#"killstreak_has_been_used"] = [];
	self.pers[#"killstreak_unique_id"] = [];
	self.pers[#"killstreak_ammo_count"] = [];
}

/*
	Name: remove_used_killstreak
	Namespace: killstreaks
	Checksum: 0x91DCC4CA
	Offset: 0x4C08
	Size: 0x3DA
	Parameters: 3
	Flags: Linked
*/
function remove_used_killstreak(killstreak, killstreakid, take_weapon_after_use)
{
	if(!isdefined(take_weapon_after_use))
	{
		take_weapon_after_use = 1;
	}
	self.just_removed_used_killstreak = undefined;
	if(!isdefined(self.pers[#"killstreaks"]))
	{
		return;
	}
	killstreak_weapon = get_killstreak_weapon(killstreak);
	if(is_true(killstreak_weapon.iscarriedkillstreak))
	{
		if(isdefined(self.pers[#"held_killstreak_ammo_count"][killstreak_weapon]))
		{
			if(self.pers[#"held_killstreak_ammo_count"][killstreak_weapon] > 0)
			{
				return;
			}
		}
	}
	killstreakindex = undefined;
	for(i = self.pers[#"killstreaks"].size - 1; i >= 0; i--)
	{
		if(self.pers[#"killstreaks"][i] == killstreak)
		{
			if(isdefined(killstreakid) && self.pers[#"killstreak_unique_id"][i] != killstreakid)
			{
				continue;
			}
			killstreakindex = i;
			break;
		}
	}
	if(!isdefined(killstreakindex))
	{
		return false;
	}
	self.just_removed_used_killstreak = killstreak;
	if(take_weapon_after_use && !self has_killstreak_in_class(get_menu_name(killstreak)))
	{
		self thread take_weapon_after_use(get_killstreak_weapon(killstreak));
	}
	arraysize = self.pers[#"killstreaks"].size;
	for(i = killstreakindex; i < arraysize - 1; i++)
	{
		self.pers[#"killstreaks"][i] = self.pers[#"killstreaks"][i + 1];
		self.pers[#"killstreak_has_been_used"][i] = self.pers[#"killstreak_has_been_used"][i + 1];
		self.pers[#"killstreak_unique_id"][i] = self.pers[#"killstreak_unique_id"][i + 1];
		self.pers[#"killstreak_ammo_count"][i] = self.pers[#"killstreak_ammo_count"][i + 1];
	}
	self.pers[#"killstreaks"][arraysize - 1] = undefined;
	self.pers[#"killstreak_has_been_used"][arraysize - 1] = undefined;
	self.pers[#"killstreak_unique_id"][arraysize - 1] = undefined;
	self.pers[#"killstreak_ammo_count"][arraysize - 1] = undefined;
	return true;
}

/*
	Name: take_weapon_after_use
	Namespace: killstreaks
	Checksum: 0x2460AFA
	Offset: 0x4FF0
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function take_weapon_after_use(killstreakweapon)
{
	self endon(#"disconnect", #"death", #"joined_team", #"joined_spectators");
	self waittill(#"weapon_change");
	if(self getinventoryweapon() != killstreakweapon)
	{
		self takeweapon(killstreakweapon);
	}
	self.killstreakactivated = 1;
}

/*
	Name: get_top_killstreak
	Namespace: killstreaks
	Checksum: 0xC060BAC4
	Offset: 0x50A0
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function get_top_killstreak()
{
	if(self.pers[#"killstreaks"].size == 0)
	{
		return undefined;
	}
	return self.pers[#"killstreaks"][self.pers[#"killstreaks"].size - 1];
}

/*
	Name: get_if_top_killstreak_has_been_used
	Namespace: killstreaks
	Checksum: 0x42AEE31
	Offset: 0x5110
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function get_if_top_killstreak_has_been_used()
{
	if(!is_true(level.usingmomentum))
	{
		if(self.pers[#"killstreak_has_been_used"].size == 0)
		{
			return undefined;
		}
		return self.pers[#"killstreak_has_been_used"][self.pers[#"killstreak_has_been_used"].size - 1];
	}
}

/*
	Name: get_top_killstreak_unique_id
	Namespace: killstreaks
	Checksum: 0x4E093FC2
	Offset: 0x5198
	Size: 0x66
	Parameters: 0
	Flags: None
*/
function get_top_killstreak_unique_id()
{
	if(self.pers[#"killstreak_unique_id"].size == 0)
	{
		return undefined;
	}
	return self.pers[#"killstreak_unique_id"][self.pers[#"killstreak_unique_id"].size - 1];
}

/*
	Name: get_killstreak_index_by_id
	Namespace: killstreaks
	Checksum: 0x2CDFAA09
	Offset: 0x5208
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function get_killstreak_index_by_id(killstreakid)
{
	for(index = self.pers[#"killstreak_unique_id"].size - 1; index >= 0; index--)
	{
		if(self.pers[#"killstreak_unique_id"][index] == killstreakid)
		{
			return index;
		}
	}
	return undefined;
}

/*
	Name: wait_till_heavy_weapon_is_fully_on
	Namespace: killstreaks
	Checksum: 0xB699BF97
	Offset: 0x5288
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function wait_till_heavy_weapon_is_fully_on(weapon)
{
	self endon(#"death", #"disconnect");
	slot = self gadgetgetslot(weapon);
	while(weapon == self getcurrentweapon())
	{
		if(self util::gadget_is_in_use(slot))
		{
			self.lastnonkillstreakweapon = weapon;
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_4f415d8e
	Namespace: killstreaks
	Checksum: 0x4A3D87DC
	Offset: 0x5328
	Size: 0x222
	Parameters: 1
	Flags: Linked
*/
function function_4f415d8e(params)
{
	if(game.state == #"postgame" || !isdefined(self))
	{
		return;
	}
	/#
		assert(self.lastnonkillstreakweapon != level.weaponnone);
	#/
	lastvalidpimary = self.lastnonkillstreakweapon;
	weapon = params.weapon;
	if(weapons::is_primary_weapon(weapon))
	{
		lastvalidpimary = weapon;
	}
	if(weapon === self.lastnonkillstreakweapon || weapon === level.weaponnone || weapon === level.weaponbasemelee)
	{
		return;
	}
	if(weapon.isgameplayweapon)
	{
		return;
	}
	if(isdefined(self.resurrect_weapon) && weapon == self.resurrect_weapon)
	{
		return;
	}
	name = get_killstreak_for_weapon(weapon);
	if(isdefined(name) && !weapon.iscarriedkillstreak)
	{
		killstreak = level.killstreaks[name];
		return;
	}
	if(params.last_weapon.isequipment)
	{
		if(self.lastnonkillstreakweapon.iscarriedkillstreak)
		{
			self.lastnonkillstreakweapon = lastvalidpimary;
		}
		return;
	}
	if(ability_util::is_hero_weapon(weapon))
	{
		if(weapon.gadget_heroversion_2_0)
		{
			if(weapon.isgadget && self getammocount(weapon) > 0)
			{
				self thread wait_till_heavy_weapon_is_fully_on(weapon);
				return;
			}
		}
	}
	if(isdefined(name) && weapon.iscarriedkillstreak)
	{
		return;
	}
	self.lastnonkillstreakweapon = weapon;
}

/*
	Name: function_4167ea4e
	Namespace: killstreaks
	Checksum: 0x88A7CDDE
	Offset: 0x5558
	Size: 0x4D4
	Parameters: 1
	Flags: Linked
*/
function function_4167ea4e(params)
{
	weapon = params.weapon;
	var_783deeed = is_killstreak_weapon(weapon);
	if(self isonladder() || self function_b4813488())
	{
		lastweapon = params.last_weapon;
		if(isdefined(lastweapon) && lastweapon.iscarriedkillstreak && is_killstreak_weapon(lastweapon))
		{
		}
		else if(var_783deeed || weapon === level.weaponnone)
		{
			self switch_to_last_non_killstreak_weapon();
			return;
		}
	}
	if(self function_e128a831())
	{
		if(var_783deeed && !weapon.iscarriedkillstreak || weapon === level.weaponnone)
		{
			self switch_to_last_non_killstreak_weapon();
			return;
		}
	}
	if(self isinvehicle())
	{
		if(var_783deeed || weapon === level.weaponnone)
		{
			self switch_to_last_non_killstreak_weapon();
		}
		return;
	}
	if(game.state != #"playing")
	{
		if(var_783deeed || weapon === level.weaponnone)
		{
			self switch_to_last_non_killstreak_weapon();
			if(var_783deeed && !isdefined(level.starttime) && level.roundstartkillstreakdelay > 0)
			{
				display_unavailable_time();
			}
		}
		return;
	}
	if(!var_783deeed)
	{
		return;
	}
	if(function_f479a2ff(weapon))
	{
		return;
	}
	killstreak = get_killstreak_for_weapon(weapon);
	if(is_true(level.forceusekillstreak))
	{
		thread usekillstreak(killstreak, undefined);
		return;
	}
	if(!is_true(level.usingmomentum))
	{
		killstreak = get_top_killstreak();
		if(weapon != get_killstreak_weapon(killstreak))
		{
			return;
		}
	}
	if(level.killstreaks[killstreak].script_bundle.var_9e2fccd4 === weapon)
	{
		return;
	}
	waittillframeend();
	if(!isalive(self))
	{
		return;
	}
	if(is_true(self.usingkillstreakheldweapon) && weapon.iscarriedkillstreak)
	{
		return;
	}
	isfrominventory = undefined;
	if(is_true(level.usingscorestreaks))
	{
		if(weapon == self getinventoryweapon())
		{
			isfrominventory = 1;
		}
		else if(self getammocount(weapon) <= 0 && weapon.name != "killstreak_ai_tank")
		{
			self switch_to_last_non_killstreak_weapon();
			return;
		}
	}
	else if(is_true(level.usingmomentum))
	{
		if(weapon == self getinventoryweapon())
		{
			isfrominventory = 1;
		}
		else if(self.momentum < self function_dceb5542(level.killstreaks[killstreak].itemindex))
		{
			self switch_to_last_non_killstreak_weapon();
			return;
		}
	}
	if(!isdefined(level.starttime) && level.roundstartkillstreakdelay > 0)
	{
		display_unavailable_time();
		return;
	}
	thread usekillstreak(killstreak, isfrominventory);
}

/*
	Name: function_20263b9e
	Namespace: killstreaks
	Checksum: 0xDEEB37A4
	Offset: 0x5A38
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_20263b9e(params)
{
	grenade = params.projectile;
	grenadeweaponid = params.weapon;
	if(grenadeweaponid == level.var_239dc073)
	{
		return;
	}
	if(grenadeweaponid.inventorytype === "offhand")
	{
		if(is_killstreak_weapon(grenadeweaponid))
		{
			killstreak = get_killstreak_for_weapon(grenadeweaponid);
			isfrominventory = grenadeweaponid == self getinventoryweapon();
			thread usekillstreak(killstreak, isfrominventory);
		}
	}
}

/*
	Name: function_ce4a7c15
	Namespace: killstreaks
	Checksum: 0xDF4D7879
	Offset: 0x5B18
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_ce4a7c15(params)
{
	grenadeweaponid = params.weapon;
	if(grenadeweaponid == level.var_239dc073)
	{
		return;
	}
	if(is_killstreak_weapon(grenadeweaponid))
	{
		killstreak = get_killstreak_for_weapon(grenadeweaponid);
		isfrominventory = grenadeweaponid == self getinventoryweapon();
		thread usekillstreak(killstreak, isfrominventory);
	}
}

/*
	Name: should_delay_killstreak
	Namespace: killstreaks
	Checksum: 0x9BF998D
	Offset: 0x5BD0
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function should_delay_killstreak(killstreaktype)
{
	if(!isdefined(level.starttime))
	{
		return false;
	}
	if(level.roundstartkillstreakdelay < (float((gettime() - level.starttime) - level.discardtime)) / 1000)
	{
		return false;
	}
	if(!is_delayable_killstreak(killstreaktype))
	{
		return false;
	}
	killstreakweapon = get_killstreak_weapon(killstreaktype);
	if(killstreakweapon.iscarriedkillstreak)
	{
		return false;
	}
	if(util::isfirstround() || util::isoneround())
	{
		return false;
	}
	return true;
}

/*
	Name: is_delayable_killstreak
	Namespace: killstreaks
	Checksum: 0x62E2F0C6
	Offset: 0x5CC0
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function is_delayable_killstreak(killstreaktype)
{
	if(isdefined(level.killstreaks[killstreaktype]) && is_true(level.killstreaks[killstreaktype].delaystreak))
	{
		return true;
	}
	return false;
}

/*
	Name: display_unavailable_time
	Namespace: killstreaks
	Checksum: 0x9FDB1D75
	Offset: 0x5D18
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function display_unavailable_time()
{
	var_c18439df = [[level.gettimepassed]]();
	if(var_c18439df == 0 && (isdefined(level.var_fd167bf6) ? level.var_fd167bf6 : 0) > gettime())
	{
		var_c18439df = var_c18439df - (level.var_fd167bf6 - gettime());
		var_c18439df = var_c18439df - 900;
	}
	timeleft = int(level.roundstartkillstreakdelay - (float(var_c18439df) / 1000));
	if(timeleft <= 0)
	{
		timeleft = 1;
	}
	self iprintlnbold(#"hash_55a79f95e07a10bc", (" " + timeleft) + " ", #"hash_79a58948c3b976f5");
}

/*
	Name: trigger_killstreak
	Namespace: killstreaks
	Checksum: 0x3275CAA2
	Offset: 0x5E38
	Size: 0x20E
	Parameters: 2
	Flags: Linked
*/
function trigger_killstreak(killstreaktype, isfrominventory)
{
	/#
		assert(isdefined(level.killstreaks[killstreaktype].usefunction), "" + killstreaktype);
	#/
	self.usingkillstreakfrominventory = isfrominventory;
	if(is_true(level.infinalkillcam))
	{
		return;
	}
	if(should_delay_killstreak(killstreaktype))
	{
		display_unavailable_time();
	}
	else
	{
		killstreak_weapon = get_killstreak_weapon(killstreaktype);
		if(!killstreak_weapon.iscarriedkillstreak)
		{
			self setweaponammoclip(killstreak_weapon, killstreak_weapon.startammo);
		}
		success = [[level.killstreaks[killstreaktype].usefunction]](killstreaktype);
		if(is_true(success))
		{
			if(isdefined(self))
			{
				self notify(#"killstreak_used", killstreaktype);
				self notify(#"killstreak_done", {#hash_d3413870:killstreaktype, #is_successful:1});
				self.usingkillstreakfrominventory = undefined;
				self contracts::player_contract_event(#"hash_4da59ed3dbeca8c7", killstreaktype);
			}
			return;
		}
	}
	if(isdefined(self))
	{
		self.usingkillstreakfrominventory = undefined;
		self notify(#"killstreak_done", {#hash_d3413870:killstreaktype, #is_successful:0});
	}
}

/*
	Name: add_to_killstreak_count
	Namespace: killstreaks
	Checksum: 0x48B09007
	Offset: 0x6050
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function add_to_killstreak_count(weapon)
{
	if(!isdefined(self.pers[#"totalkillstreakcount"]))
	{
		self.pers[#"totalkillstreakcount"] = 0;
	}
	self.pers[#"totalkillstreakcount"]++;
}

/*
	Name: should_give_killstreak
	Namespace: killstreaks
	Checksum: 0xC1C65A5F
	Offset: 0x60B8
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function should_give_killstreak(weapon)
{
	rootweapon = (isdefined(weapon.rootweapon) ? weapon.rootweapon : weapon);
	if(getdvarint(#"scr_allow_killstreak_building", 0) == 0)
	{
		if(function_c5927b3f(rootweapon))
		{
			return true;
		}
		if(is_weapon_associated_with_killstreak(rootweapon))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: play_killstreak_ready_sfx
	Namespace: killstreaks
	Checksum: 0x9A3C4617
	Offset: 0x6168
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function play_killstreak_ready_sfx(killstreaktype)
{
	if(game.state != #"playing")
	{
		return;
	}
	if(isdefined(level.killstreaks[killstreaktype].script_bundle.var_c08f7089))
	{
		self playsoundtoplayer(level.killstreaks[killstreaktype].script_bundle.var_c08f7089, self);
	}
	else
	{
		self playsoundtoplayer("uin_kls_generic", self);
	}
}

/*
	Name: player_killstreak_threat_tracking
	Namespace: killstreaks
	Checksum: 0xA624938C
	Offset: 0x6218
	Size: 0x36E
	Parameters: 2
	Flags: None
*/
function player_killstreak_threat_tracking(killstreaktype, var_bdb26ff0)
{
	/#
		assert(isdefined(killstreaktype));
	#/
	self endon(#"death", #"delete", #"leaving");
	level endon(#"game_ended");
	while(true)
	{
		if(!isdefined(self.owner))
		{
			return;
		}
		players = function_f6f34851(self.owner.team);
		players = array::randomize(players);
		var_c3c784a5 = 5;
		var_9217cadc = 0;
		foreach(player in players)
		{
			if(!player battlechatter::can_play_dialog(1))
			{
				continue;
			}
			lookangles = player getplayerangles();
			if(lookangles[0] < -90 || lookangles[0] > -20)
			{
				continue;
			}
			lookdir = anglestoforward(lookangles);
			eyepoint = player geteye();
			streakdir = vectornormalize(self.origin - eyepoint);
			dot = vectordot(streakdir, lookdir);
			if(dot < var_bdb26ff0)
			{
				continue;
			}
			if(var_c3c784a5 == 0)
			{
				break;
			}
			traceresult = bullettrace(eyepoint, self.origin, 1, player);
			if(traceresult[#"fraction"] >= 1 || traceresult[#"entity"] === self)
			{
				if(battlechatter::dialog_chance("killstreakSpotChance"))
				{
					player battlechatter::function_cef454e8(killstreaktype);
				}
				var_9217cadc = battlechatter::mpdialog_value("killstreakSpotDelay", 0);
				break;
			}
			var_c3c784a5--;
		}
		wait((battlechatter::mpdialog_value("killstreakSpotInterval", float(function_60d95f53()) / 1000)) + var_9217cadc);
	}
}

/*
	Name: function_ece736e7
	Namespace: killstreaks
	Checksum: 0xCD448D82
	Offset: 0x6590
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function function_ece736e7(player, killstreak)
{
	if(!battlechatter::function_e1983f22() || function_c0c60634(killstreak))
	{
		return;
	}
	if(is_true(level.teambased))
	{
		enemies = function_f6f34851(player.team, player.origin, 1200);
	}
	else
	{
		enemies = function_f6f34851();
	}
	closestenemies = arraysort(enemies, player.origin);
	playereye = player geteye();
	foreach(enemy in closestenemies)
	{
		enemyeye = enemy geteye();
		enemyangles = enemy getplayerangles();
		if(util::within_fov(enemyeye, enemyangles, playereye, 0.5))
		{
			if(sighttracepassed(enemyeye, playereye, 0, enemy))
			{
				enemy battlechatter::function_cef454e8(get_from_weapon(killstreak));
				killstreak.var_95b0150d = gettime();
				return;
			}
		}
	}
}

/*
	Name: function_c0c60634
	Namespace: killstreaks
	Checksum: 0xCBE77130
	Offset: 0x67A8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_c0c60634(weapon)
{
	if(isdefined(weapon.var_95b0150d))
	{
		if((weapon.var_95b0150d + (int(10 * 1000))) >= gettime())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_killstreak_usage
	Namespace: killstreaks
	Checksum: 0x7AF76EEA
	Offset: 0x6808
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function get_killstreak_usage(usagekey)
{
	if(!isdefined(self.pers[usagekey]))
	{
		return 0;
	}
	return self.pers[usagekey];
}

/*
	Name: on_player_spawned
	Namespace: killstreaks
	Checksum: 0x2DFBEB7
	Offset: 0x6840
	Size: 0xDE
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	pixbeginevent();
	self thread give_owned();
	self.killcamkilledbyent = undefined;
	self callback::function_f77ced93(&function_4f415d8e);
	self callback::function_f77ced93(&function_4167ea4e);
	self callback::function_20263b9e(&function_20263b9e);
	self callback::function_ce4a7c15(&function_ce4a7c15);
	self thread initialspawnprotection();
	self function_f964dc1c();
	pixendevent();
}

/*
	Name: on_joined_team
	Namespace: killstreaks
	Checksum: 0xB4317DBD
	Offset: 0x6928
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self endon(#"disconnect");
	self setinventoryweapon(level.weaponnone);
	self.pers[#"cur_kill_streak"] = 0;
	self.pers[#"cur_total_kill_streak"] = 0;
	self setplayercurrentstreak(0);
	self.pers[#"totalkillstreakcount"] = 0;
	self.pers[#"killstreaks"] = [];
	self.pers[#"killstreak_has_been_used"] = [];
	self.pers[#"killstreak_unique_id"] = [];
	self.pers[#"killstreak_ammo_count"] = [];
	if(is_true(level.usingscorestreaks))
	{
		self.pers[#"killstreak_quantity"] = [];
		self.pers[#"held_killstreak_ammo_count"] = [];
		self.pers[#"held_killstreak_clip_count"] = [];
	}
}

/*
	Name: initialspawnprotection
	Namespace: killstreaks
	Checksum: 0x9C436D8F
	Offset: 0x6A90
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private initialspawnprotection()
{
	self endon(#"death", #"disconnect");
	if(isdefined(level.var_f81eb032) && isdefined(level.var_f81eb032.var_176dc082))
	{
		self thread [[level.var_f81eb032.var_176dc082]](level.spawnsystem.var_d9984264);
	}
	if(level.spawnsystem.var_d9984264 == 0)
	{
		return;
	}
	self.specialty_nottargetedbyairsupport = 1;
	self clientfield::set("killstreak_spawn_protection", 1);
	self val::set(#"killstreak_spawn_protection", "ignoreme", 1);
	wait(level.spawnsystem.var_d9984264);
	self clientfield::set("killstreak_spawn_protection", 0);
	self.specialty_nottargetedbyairsupport = undefined;
	self val::reset(#"killstreak_spawn_protection", "ignoreme");
}

/*
	Name: killstreak_debug_think
	Namespace: killstreaks
	Checksum: 0x1B759E29
	Offset: 0x6BF8
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function killstreak_debug_think()
{
	/#
		setdvar(#"debug_killstreak", "");
		for(;;)
		{
			cmd = getdvarstring(#"debug_killstreak");
			switch(cmd)
			{
				case "data_dump":
				{
					killstreak_data_dump();
					break;
				}
			}
			if(cmd != "")
			{
				setdvar(#"debug_killstreak", "");
			}
			wait(0.5);
		}
	#/
}

/*
	Name: killstreak_data_dump
	Namespace: killstreaks
	Checksum: 0x841AA880
	Offset: 0x6CE0
	Size: 0x32C
	Parameters: 0
	Flags: None
*/
function killstreak_data_dump()
{
	/#
		iprintln("");
		println("");
		println("");
		keys = getarraykeys(level.killstreaks);
		for(i = 0; i < keys.size; i++)
		{
			data = level.killstreaks[keys[i]];
			type_data = level.killstreaktype[keys[i]];
			print(keys[i] + "");
			print(data.killstreaklevel + "");
			print(data.weapon.name + "");
			alt = 0;
			if(isdefined(data.script_bundle.altweapons))
			{
				/#
					assert(data.script_bundle.altweapons.size <= 4);
				#/
				for(alt = 0; alt < data.script_bundle.altweapons.size; alt++)
				{
					print(data.script_bundle.altweapons[alt].name + "");
				}
			}
			while(alt < 4)
			{
				print("");
				alt++;
			}
			type = 0;
			if(isdefined(type_data))
			{
				/#
					assert(type_data.size < 4);
				#/
				type_keys = getarraykeys(type_data);
				while(type < type_keys.size)
				{
					if(type_data[type_keys[type]] == 1)
					{
						print(type_keys[type] + "");
					}
					type++;
				}
			}
			while(type < 4)
			{
				print("");
				type++;
			}
			println("");
		}
		println("");
	#/
}

/*
	Name: function_2b6aa9e8
	Namespace: killstreaks
	Checksum: 0x4339F680
	Offset: 0x7018
	Size: 0x94
	Parameters: 4
	Flags: None
*/
function function_2b6aa9e8(killstreak_ref, destroyed_callback, low_health_callback, emp_callback)
{
	self setcandamage(1);
	self thread monitordamage(killstreak_ref, killstreak_bundles::get_max_health(killstreak_ref), destroyed_callback, killstreak_bundles::get_low_health(killstreak_ref), low_health_callback, 0, emp_callback, 1);
}

/*
	Name: monitordamage
	Namespace: killstreaks
	Checksum: 0x31716E5A
	Offset: 0x70B8
	Size: 0x982
	Parameters: 8
	Flags: Linked
*/
function monitordamage(killstreak_ref, max_health, destroyed_callback, low_health, low_health_callback, emp_damage, emp_callback, allow_bullet_damage)
{
	self endon(#"death", #"delete");
	self setcandamage(1);
	self setup_health(killstreak_ref, max_health, low_health);
	self.damagetaken = 0;
	while(true)
	{
		weapon_damage = undefined;
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		damage = waitresult.amount;
		direction = waitresult.direction;
		point = waitresult.position;
		type = waitresult.mod;
		tagname = waitresult.tag_name;
		modelname = waitresult.model_name;
		partname = waitresult.part_name;
		weapon = waitresult.weapon;
		flags = waitresult.flags;
		inflictor = waitresult.inflictor;
		chargelevel = waitresult.charge_level;
		if(is_true(self.invulnerable))
		{
			continue;
		}
		if(!isdefined(attacker))
		{
			continue;
		}
		if(!isplayer(attacker))
		{
			if(isdefined(level.figure_out_attacker))
			{
				var_e7344d41 = attacker;
				attacker = self [[level.figure_out_attacker]](attacker);
				if(!isplayer(attacker))
				{
					continue;
				}
			}
			else
			{
				continue;
			}
		}
		friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
		if(!friendlyfire)
		{
			continue;
		}
		if(isdefined(self.owner) && attacker == self.owner)
		{
			continue;
		}
		isvalidattacker = 1;
		if(level.teambased)
		{
			isvalidattacker = isdefined(attacker.team) && util::function_fbce7263(attacker.team, self.team);
		}
		if(!isvalidattacker)
		{
			continue;
		}
		if(isdefined(self.killstreakdamagemodifier))
		{
			damage = [[self.killstreakdamagemodifier]](damage, attacker, direction, point, type, tagname, modelname, partname, weapon, flags, inflictor, chargelevel);
			if(damage <= 0)
			{
				continue;
			}
		}
		if(weapon.isemp && type == "MOD_GRENADE_SPLASH")
		{
			emp_damage_to_apply = killstreak_bundles::get_emp_grenade_damage(killstreak_ref, self.maxhealth);
			if(!isdefined(emp_damage_to_apply))
			{
				emp_damage_to_apply = (isdefined(emp_damage) ? emp_damage : 1);
			}
			if(isdefined(emp_callback) && emp_damage_to_apply > 0)
			{
				self [[emp_callback]](attacker);
			}
			weapon_damage = emp_damage_to_apply;
		}
		if(is_true(self.selfdestruct))
		{
			weapon_damage = self.maxhealth + 1;
		}
		if(!isdefined(weapon_damage))
		{
			weapon_damage = killstreak_bundles::get_weapon_damage(killstreak_ref, self.maxhealth, attacker, weapon, type, damage, flags, chargelevel);
			if(!isdefined(weapon_damage))
			{
				weapon_damage = get_old_damage(attacker, weapon, type, damage, allow_bullet_damage);
			}
		}
		if(weapon_damage > 0)
		{
			if(damagefeedback::dodamagefeedback(weapon, attacker))
			{
				if(!isvehicle(self))
				{
					attacker thread damagefeedback::update(type, undefined, undefined, weapon, self);
				}
			}
			self challenges::trackassists(attacker, weapon_damage, 0);
			if(isdefined(var_e7344d41.var_307aef8d))
			{
				var_e7344d41 [[var_e7344d41.var_307aef8d]](self);
			}
		}
		self.damagetaken = self.damagetaken + weapon_damage;
		if(!issentient(self) && weapon_damage > 0)
		{
			self.attacker = attacker;
		}
		if(self.damagetaken >= self.maxhealth)
		{
			level.globalkillstreaksdestroyed++;
			attacker stats::function_e24eec31(getweapon(killstreak_ref), #"destroyed", 1);
			if(isdefined(inflictor) && inflictor getentitytype() == 4)
			{
				bundle = get_script_bundle(killstreak_ref);
				if(isdefined(bundle.var_888a5ff7) && isdefined(waitresult.position))
				{
					var_74d40edb = inflictor getvelocity();
					if(lengthsquared(var_74d40edb) > sqr(50))
					{
						var_29edfc10 = vectornormalize(var_74d40edb);
						playfx(bundle.var_888a5ff7, waitresult.position, var_29edfc10, undefined, undefined, self.team);
					}
				}
			}
			self function_73566ec7(attacker, weapon, self.owner);
			self.var_d02ddb8e = weapon;
			if(isdefined(destroyed_callback))
			{
				self thread [[destroyed_callback]](attacker, weapon);
			}
			if(isdefined(var_e7344d41.var_d83b2e03))
			{
				var_e7344d41 [[var_e7344d41.var_d83b2e03]](self);
			}
			return;
		}
		if(isdefined(inflictor) && inflictor getentitytype() == 4)
		{
			bundle = get_script_bundle(killstreak_ref);
			if(isdefined(bundle.var_accc3277) && isdefined(bundle.var_7b7cd9b8))
			{
				var_43dd078e = bundle.var_7b7cd9b8.size;
				if(var_43dd078e > 0)
				{
					var_98f207d4 = randomint(var_43dd078e);
					var_f7901b1a = bundle.var_7b7cd9b8[var_98f207d4].var_53ba63fe;
					/#
						var_1a2e7367 = getdvarstring(#"hash_68da706138cf16e2", "");
						if(var_1a2e7367 != "")
						{
							var_f7901b1a = var_1a2e7367;
						}
					#/
					if(isdefined(var_f7901b1a))
					{
						var_e2465f33 = self gettagorigin(var_f7901b1a);
						if(isdefined(var_e2465f33))
						{
							playfxontag(bundle.var_accc3277, self, var_f7901b1a);
						}
					}
				}
			}
		}
		remaining_health = max_health - self.damagetaken;
		if(remaining_health < low_health && weapon_damage > 0)
		{
			if(isdefined(low_health_callback) && (!isdefined(self.currentstate) || self.currentstate != "damaged"))
			{
				self [[low_health_callback]](attacker, weapon);
			}
			self.currentstate = "damaged";
		}
		if(isdefined(self.extra_low_health) && remaining_health < self.extra_low_health && weapon_damage > 0)
		{
			if(isdefined(self.extra_low_health_callback) && !isdefined(self.extra_low_damage_notified))
			{
				self [[self.extra_low_health_callback]](attacker, weapon);
				self.extra_low_damage_notified = 1;
			}
		}
	}
}

/*
	Name: function_73566ec7
	Namespace: killstreaks
	Checksum: 0xA210FB4
	Offset: 0x7A48
	Size: 0x420
	Parameters: 3
	Flags: Linked
*/
function function_73566ec7(attacker, weapon, owner)
{
	if(!isdefined(self) || is_true(self.var_c5bb583d) || !isdefined(attacker) || !isplayer(attacker) || !isdefined(self.killstreaktype) || self.team === attacker.team)
	{
		return;
	}
	attacker contracts::function_a54e2068(#"hash_317a8b8df3aa8838");
	switch(self.killstreaktype)
	{
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		case "recon_car":
		case "inventory_recon_car":
		{
			attacker contracts::function_a54e2068(#"hash_3c21dc0c4de41bec");
			break;
		}
	}
	bundle = get_script_bundle(self.killstreaktype);
	if(isdefined(bundle) && isdefined(bundle.var_ebd92bbc))
	{
		scoreevents::processscoreevent(bundle.var_ebd92bbc, attacker, owner, weapon);
		attacker stats::function_dad108fa(#"stats_destructions", 1);
		self.var_c5bb583d = 1;
		if(isdefined(self.attackers) && self.attackers.size > 0)
		{
			maxhealth = 1 / self.maxhealth;
			if(!isdefined(bundle.var_74711af9))
			{
				return;
			}
			foreach(assister in self.attackers)
			{
				if(assister == attacker || !isplayer(assister) || !util::function_fbce7263(self.team, assister.team))
				{
					continue;
				}
				if(isdefined(bundle.var_93f7b1ae) && isdefined(self.attackerdamage))
				{
					timepassed = (float(gettime() - self.attackerdamage[assister.clientid].lastdamagetime)) / 1000;
					if(timepassed > bundle.var_93f7b1ae)
					{
						continue;
					}
				}
				if(isdefined(bundle.var_ebcd245a) && isdefined(self.attackerdamage))
				{
					damagepercent = self.attackerdamage[assister.clientid].damage * maxhealth;
					if(damagepercent < bundle.var_ebcd245a)
					{
						continue;
					}
				}
				scoreevents::processscoreevent(bundle.var_74711af9, assister, owner, self.attackerdamage[assister.clientid].weapon);
				assister stats::function_dad108fa(#"stats_destructions", 1);
				assister contracts::function_a54e2068(#"hash_317a8b8df3aa8838");
			}
		}
	}
}

/*
	Name: ondamageperweapon
	Namespace: killstreaks
	Checksum: 0x2DD8E448
	Offset: 0x7E70
	Size: 0x3C4
	Parameters: 15
	Flags: None
*/
function ondamageperweapon(killstreak_ref, attacker, damage, flags, type, weapon, max_health, destroyed_callback, low_health, low_health_callback, emp_damage, emp_callback, allow_bullet_damage, chargelevel, var_488beb6d)
{
	self.maxhealth = destroyed_callback;
	self.lowhealth = low_health_callback;
	tablehealth = killstreak_bundles::get_max_health(attacker);
	if(isdefined(tablehealth))
	{
		self.maxhealth = tablehealth;
	}
	tablehealth = killstreak_bundles::get_low_health(attacker);
	if(isdefined(tablehealth))
	{
		self.lowhealth = tablehealth;
	}
	if(is_true(self.invulnerable))
	{
		return 0;
	}
	if(!isplayer(damage))
	{
		if(isdefined(level.figure_out_attacker))
		{
			damage = self [[level.figure_out_attacker]](damage);
			if(!isplayer(damage))
			{
				return get_old_damage(damage, max_health, weapon, flags, allow_bullet_damage);
			}
		}
		else
		{
			return get_old_damage(damage, max_health, weapon, flags, allow_bullet_damage);
		}
	}
	friendlyfire = damage::friendlyfirecheck(self.owner, damage);
	if(!friendlyfire)
	{
		return 0;
	}
	if(!is_true(var_488beb6d))
	{
		isvalidattacker = 1;
		if(level.teambased)
		{
			isvalidattacker = isdefined(damage.team) && util::function_fbce7263(damage.team, self.team);
		}
		if(!isvalidattacker)
		{
			return 0;
		}
	}
	if(max_health.isemp && weapon == "MOD_GRENADE_SPLASH")
	{
		emp_damage_to_apply = killstreak_bundles::get_emp_grenade_damage(attacker, self.maxhealth);
		if(!isdefined(emp_damage_to_apply))
		{
			emp_damage_to_apply = (isdefined(emp_damage) ? emp_damage : 1);
		}
		if(isdefined(emp_callback) && emp_damage_to_apply > 0)
		{
			self [[emp_callback]](damage, max_health);
		}
		return emp_damage_to_apply;
	}
	weapon_damage = killstreak_bundles::get_weapon_damage(attacker, self.maxhealth, damage, max_health, weapon, flags, type, chargelevel);
	if(!isdefined(weapon_damage))
	{
		weapon_damage = get_old_damage(damage, max_health, weapon, flags, allow_bullet_damage);
	}
	if(!isdefined(weapon_damage) || weapon_damage <= 0)
	{
		return 0;
	}
	idamage = int(weapon_damage);
	if(idamage >= self.health)
	{
		self function_73566ec7(damage, max_health, self.owner);
		if(isdefined(low_health))
		{
			self thread [[low_health]](damage, max_health);
		}
	}
	return idamage;
}

/*
	Name: get_old_damage
	Namespace: killstreaks
	Checksum: 0x86F39CF
	Offset: 0x8240
	Size: 0x236
	Parameters: 6
	Flags: Linked
*/
function get_old_damage(attacker, weapon, type, damage, allow_bullet_damage, bullet_damage_scalar)
{
	switch(type)
	{
		case "mod_rifle_bullet":
		case "mod_pistol_bullet":
		{
			if(!allow_bullet_damage)
			{
				damage = 0;
				break;
			}
			if(isdefined(attacker) && isplayer(attacker))
			{
				hasfmj = attacker hasperk(#"specialty_armorpiercing");
			}
			if(is_true(hasfmj))
			{
				damage = int(damage * level.cac_armorpiercing_data);
			}
			if(isdefined(bullet_damage_scalar))
			{
				damage = int(damage * bullet_damage_scalar);
			}
			break;
		}
		case "mod_explosive":
		case "mod_projectile":
		case "mod_projectile_splash":
		{
			if(weapon.statindex === level.weaponpistolenergy.statindex || weapon.statindex !== level.weaponshotgunenergy.statindex || weapon.statindex === level.weaponspecialcrossbow.statindex)
			{
				break;
			}
			if(isdefined(self.remotemissiledamage) && isdefined(weapon) && weapon.name == #"remote_missile_missile")
			{
				damage = self.remotemissiledamage;
			}
			else if(isdefined(self.rocketdamage))
			{
				damage = self.rocketdamage;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	return damage;
}

/*
	Name: isheldinventorykillstreakweapon
	Namespace: killstreaks
	Checksum: 0x9D47364A
	Offset: 0x8480
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function isheldinventorykillstreakweapon(killstreakweapon)
{
	return killstreakweapon.iscarriedkillstreak && killstreakweapon.var_6f41c2a9;
}

/*
	Name: waitfortimecheck
	Namespace: killstreaks
	Checksum: 0x87CCFFEE
	Offset: 0x84B0
	Size: 0xAC
	Parameters: 5
	Flags: None
*/
function waitfortimecheck(duration, callback, endcondition1, endcondition2, endcondition3)
{
	self endon(#"hacked");
	if(isdefined(endcondition1))
	{
		self endon(endcondition1);
	}
	if(isdefined(endcondition2))
	{
		self endon(endcondition2);
	}
	if(isdefined(endcondition3))
	{
		self endon(endcondition3);
	}
	hostmigration::migrationawarewait(duration);
	self notify(#"time_check");
	self [[callback]]();
}

/*
	Name: waittillemp
	Namespace: killstreaks
	Checksum: 0xF511465F
	Offset: 0x8568
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function waittillemp(onempdcallback, arg)
{
	self endon(#"death", #"delete");
	waitresult = undefined;
	waitresult = self waittill(#"emp_deployed");
	if(isdefined(onempdcallback))
	{
		[[onempdcallback]](waitresult.attacker, arg);
	}
}

/*
	Name: is_killstreak_weapon_assist_allowed
	Namespace: killstreaks
	Checksum: 0x4EA02B84
	Offset: 0x85F0
	Size: 0x6E
	Parameters: 1
	Flags: None
*/
function is_killstreak_weapon_assist_allowed(weapon)
{
	killstreak = get_killstreak_for_weapon(weapon);
	if(!isdefined(killstreak))
	{
		return false;
	}
	if(is_true(level.killstreaks[killstreak].script_bundle.var_c4d802f4))
	{
		return true;
	}
	return false;
}

/*
	Name: should_override_entity_camera_in_demo
	Namespace: killstreaks
	Checksum: 0x56470FCF
	Offset: 0x8668
	Size: 0xC0
	Parameters: 2
	Flags: None
*/
function should_override_entity_camera_in_demo(player, weapon)
{
	killstreak = get_killstreak_for_weapon(weapon);
	if(!isdefined(killstreak))
	{
		return false;
	}
	bundle = get_script_bundle(killstreak);
	if(is_true(bundle.var_6648cf11))
	{
		return true;
	}
	if(isdefined(player.remoteweapon) && is_true(player.remoteweapon.controlled))
	{
		return true;
	}
	return false;
}

/*
	Name: watch_for_remove_remote_weapon
	Namespace: killstreaks
	Checksum: 0xECDDFCFC
	Offset: 0x8730
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function watch_for_remove_remote_weapon()
{
	self endon(#"endwatchforremoveremoteweapon");
	for(;;)
	{
		self waittill(#"remove_remote_weapon");
		self switch_to_last_non_killstreak_weapon();
		self enableusability();
	}
}

/*
	Name: clear_using_remote
	Namespace: killstreaks
	Checksum: 0x4A402DDF
	Offset: 0x8790
	Size: 0x13E
	Parameters: 3
	Flags: None
*/
function clear_using_remote(immediate, skipnotify, gameended)
{
	if(!isdefined(self))
	{
		return;
	}
	self.dofutz = 0;
	self.no_fade2black = 0;
	self clientfield::set_to_player("static_postfx", 0);
	self function_50b430e0();
	if(isdefined(self.carryicon))
	{
		self.carryicon.alpha = 1;
	}
	self.usingremote = undefined;
	self reset_killstreak_delay_killcam();
	self enableoffhandweapons();
	self enableweaponcycling();
	if(isalive(self))
	{
		self switch_to_last_non_killstreak_weapon(immediate, undefined, gameended);
	}
	if(!is_true(skipnotify))
	{
		self notify(#"stopped_using_remote");
	}
}

/*
	Name: reset_killstreak_delay_killcam
	Namespace: killstreaks
	Checksum: 0xF7512D1C
	Offset: 0x88D8
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function reset_killstreak_delay_killcam()
{
	self.killstreak_delay_killcam = undefined;
}

/*
	Name: init_ride_killstreak
	Namespace: killstreaks
	Checksum: 0x9D29FBF6
	Offset: 0x88F0
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function init_ride_killstreak(streak, always_allow)
{
	if(!isdefined(always_allow))
	{
		always_allow = 0;
	}
	self disableusability();
	result = self init_ride_killstreak_internal(streak, always_allow);
	if(isdefined(self))
	{
		self enableusability();
	}
	return result;
}

/*
	Name: init_ride_killstreak_internal
	Namespace: killstreaks
	Checksum: 0xE4C1855C
	Offset: 0x8970
	Size: 0x47A
	Parameters: 2
	Flags: Linked, Private
*/
function private init_ride_killstreak_internal(streak, always_allow)
{
	if(isdefined(streak))
	{
		laptopwait = "timeout";
		bundle = get_script_bundle(streak);
		start_delay = bundle.var_15b39264;
		var_58330f68 = bundle.var_daafb2f7;
		postfxbundle = bundle.var_bda68f72;
	}
	else
	{
		laptopwait = undefined;
		laptopwait = self waittilltimeout(0.2, #"disconnect", #"death", #"weapon_switch_started");
		laptopwait = laptopwait._notify;
	}
	if(!isdefined(start_delay))
	{
		start_delay = 0.2;
	}
	if(!isdefined(var_58330f68))
	{
		var_58330f68 = 0.2;
	}
	hostmigration::waittillhostmigrationdone();
	if(laptopwait == "weapon_switch_started")
	{
		return "fail";
	}
	if(!isalive(self) && !always_allow)
	{
		return "fail";
	}
	if(laptopwait == "disconnect" || laptopwait == "death")
	{
		if(laptopwait == "disconnect")
		{
			return "disconnect";
		}
		if(!isdefined(self.team) || self.team == #"spectator")
		{
			return "fail";
		}
		return "success";
	}
	if(self is_interacting_with_object())
	{
		return "fail";
	}
	if(isdefined(postfxbundle))
	{
		self thread function_cfa9cec5(start_delay);
	}
	else
	{
		self thread hud::fade_to_black_for_x_sec(start_delay, var_58330f68, 0.1, 0.1);
	}
	self thread watch_for_remove_remote_weapon();
	var_c3d5a8a9 = undefined;
	var_c3d5a8a9 = self waittilltimeout(start_delay + var_58330f68, #"disconnect", #"death");
	self notify(#"endwatchforremoveremoteweapon");
	hostmigration::waittillhostmigrationdone();
	if(self isinvehicle() === 1)
	{
		return "fail";
	}
	if(var_c3d5a8a9._notify != "disconnect")
	{
		self thread clear_ride_intro(1);
		if(!isdefined(self.team) || self.team == #"spectator")
		{
			return "fail";
		}
	}
	if(always_allow)
	{
		if(var_c3d5a8a9._notify == "disconnect")
		{
			return "disconnect";
		}
		return "success";
	}
	if(self isonladder() || self function_b4813488() || self function_e128a831())
	{
		return "fail";
	}
	if(!isalive(self))
	{
		return "fail";
	}
	if(is_true(self.laststand))
	{
		return "fail";
	}
	if(self is_interacting_with_object())
	{
		return "fail";
	}
	if(var_c3d5a8a9._notify == "disconnect")
	{
		return "disconnect";
	}
	return "success";
}

/*
	Name: clear_ride_intro
	Namespace: killstreaks
	Checksum: 0xF54A94EC
	Offset: 0x8DF8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private clear_ride_intro(delay)
{
	self endon(#"disconnect");
	if(isdefined(delay))
	{
		wait(delay);
	}
	self thread hud::screen_fade_in(0);
}

/*
	Name: function_cfa9cec5
	Namespace: killstreaks
	Checksum: 0xE9F2270D
	Offset: 0x8E48
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_cfa9cec5(startwait)
{
	self endon(#"disconnect");
	wait(startwait);
	if(!isdefined(self))
	{
		return;
	}
	self clientfield::set_to_player("" + #"hash_524d30f5676b2070", 1);
}

/*
	Name: function_50b430e0
	Namespace: killstreaks
	Checksum: 0x9D2A7B62
	Offset: 0x8EB0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_50b430e0()
{
	self clientfield::set_to_player("" + #"hash_524d30f5676b2070", 0);
}

/*
	Name: is_interacting_with_object
	Namespace: killstreaks
	Checksum: 0x38E9C779
	Offset: 0x8EE8
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function is_interacting_with_object()
{
	if(self iscarryingturret())
	{
		return true;
	}
	if(is_true(self.isplanting))
	{
		return true;
	}
	if(is_true(self.isdefusing))
	{
		return true;
	}
	return false;
}

/*
	Name: setup_health
	Namespace: killstreaks
	Checksum: 0xAAFF6BE
	Offset: 0x8F58
	Size: 0xEE
	Parameters: 3
	Flags: Linked
*/
function setup_health(killstreak_ref, max_health, low_health)
{
	self.maxhealth = max_health;
	self.lowhealth = low_health;
	self.hackedhealthupdatecallback = &defaulthackedhealthupdatecallback;
	tablemaxhealth = killstreak_bundles::get_max_health(killstreak_ref);
	if(isdefined(tablemaxhealth))
	{
		self.maxhealth = tablemaxhealth;
	}
	tablelowhealth = killstreak_bundles::get_low_health(killstreak_ref);
	if(isdefined(tablelowhealth))
	{
		self.lowhealth = tablelowhealth;
	}
	tablehackedhealth = killstreak_bundles::get_hacked_health(killstreak_ref);
	if(isdefined(tablehackedhealth))
	{
		self.hackedhealth = tablehackedhealth;
	}
	else
	{
		self.hackedhealth = self.maxhealth;
	}
}

/*
	Name: defaulthackedhealthupdatecallback
	Namespace: killstreaks
	Checksum: 0x61F16BF
	Offset: 0x9050
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function defaulthackedhealthupdatecallback(hacker)
{
	killstreak = self;
	/#
		assert(isdefined(self.maxhealth));
	#/
	/#
		assert(isdefined(self.hackedhealth));
	#/
	/#
		assert(isdefined(self.damagetaken));
	#/
	damageafterhacking = self.maxhealth - self.hackedhealth;
	if(self.damagetaken < damageafterhacking)
	{
		self.damagetaken = damageafterhacking;
	}
}

/*
	Name: function_8cd96439
	Namespace: killstreaks
	Checksum: 0x1C4A41F7
	Offset: 0x9110
	Size: 0x180
	Parameters: 19
	Flags: None
*/
function function_8cd96439(killstreakref, killstreakid, onplacecallback, oncancelcallback, onmovecallback, onshutdowncallback, ondeathcallback, onempcallback, model, validmodel, invalidmodel, spawnsvehicle, pickupstring, timeout, health, empdamage, placehintstring, invalidlocationhintstring, placeimmediately)
{
	if(!isdefined(placeimmediately))
	{
		placeimmediately = 0;
	}
	player = self;
	placeable = placeables::spawnplaceable(onplacecallback, oncancelcallback, onmovecallback, onshutdowncallback, ondeathcallback, onempcallback, undefined, undefined, model, validmodel, invalidmodel, spawnsvehicle, pickupstring, timeout, health, empdamage, placehintstring, invalidlocationhintstring, placeimmediately, &function_84da1341);
	if(isdefined(placeable.othermodel))
	{
		placeable.othermodel clientfield::set("enemyvehicle", 1);
	}
	placeable.killstreakref = killstreakref;
	placeable.killstreakid = killstreakid;
	placeable configure_team(killstreakref, killstreakid, player);
	return placeable;
}

/*
	Name: function_84da1341
	Namespace: killstreaks
	Checksum: 0xD6E81976
	Offset: 0x9298
	Size: 0x7C
	Parameters: 4
	Flags: Linked
*/
function function_84da1341(damagecallback, var_b6f10e7c, var_1891d3cd, var_2053fdc6)
{
	waitframe(1);
	placeable = self;
	if(isdefined(level.var_8ddb1b0e))
	{
		placeable thread [[level.var_8ddb1b0e]](placeable.killstreakref, placeable.health, var_b6f10e7c, 0, undefined, var_1891d3cd, var_2053fdc6, 1);
	}
}

/*
	Name: configure_team
	Namespace: killstreaks
	Checksum: 0x51A820A9
	Offset: 0x9320
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function configure_team(killstreaktype, killstreakid, owner, influencertype, configureteamprefunction, configureteampostfunction, ishacked)
{
	if(!isdefined(ishacked))
	{
		ishacked = 0;
	}
	killstreak = self;
	killstreak.killstreaktype = killstreaktype;
	killstreak.killstreakid = killstreakid;
	killstreak _setup_configure_team_callbacks(influencertype, configureteamprefunction, configureteampostfunction);
	killstreak configure_team_internal(owner, ishacked);
	owner thread trackactivekillstreak(killstreak);
}

/*
	Name: configure_team_internal
	Namespace: killstreaks
	Checksum: 0x16EC40A0
	Offset: 0x93E8
	Size: 0x1E4
	Parameters: 2
	Flags: Linked
*/
function configure_team_internal(owner, ishacked)
{
	killstreak = self;
	if(ishacked == 0)
	{
		killstreak.originalowner = owner;
		killstreak.originalteam = owner.team;
	}
	else
	{
		/#
			assert(killstreak.killstreakteamconfigured, "");
		#/
	}
	if(isdefined(killstreak.killstreakconfigureteamprefunction))
	{
		killstreak thread [[killstreak.killstreakconfigureteamprefunction]](owner, ishacked);
	}
	if(isdefined(killstreak.killstreakinfluencertype))
	{
		killstreak influencers::remove_influencers();
	}
	if(!isdefined(owner) || !isdefined(owner.team))
	{
		return;
	}
	killstreak setteam(owner.team);
	killstreak.team = owner.team;
	if(!isai(killstreak))
	{
		killstreak setowner(owner);
	}
	killstreak.owner = owner;
	killstreak.ownerentnum = owner.entnum;
	killstreak.pilotindex = killstreak.owner namespace_f9b02f80::get_random_pilot_index(killstreak.killstreaktype);
	if(isdefined(killstreak.killstreakinfluencertype))
	{
		killstreak influencers::create_entity_enemy_influencer(killstreak.killstreakinfluencertype, owner.team);
	}
	if(isdefined(killstreak.killstreakconfigureteampostfunction))
	{
		killstreak thread [[killstreak.killstreakconfigureteampostfunction]](owner, ishacked);
	}
}

/*
	Name: _setup_configure_team_callbacks
	Namespace: killstreaks
	Checksum: 0x1410C6BD
	Offset: 0x95D8
	Size: 0x5A
	Parameters: 3
	Flags: Linked, Private
*/
function private _setup_configure_team_callbacks(influencertype, configureteamprefunction, configureteampostfunction)
{
	killstreak = self;
	killstreak.killstreakteamconfigured = 1;
	killstreak.killstreakinfluencertype = influencertype;
	killstreak.killstreakconfigureteamprefunction = configureteamprefunction;
	killstreak.killstreakconfigureteampostfunction = configureteampostfunction;
}

/*
	Name: trackactivekillstreak
	Namespace: killstreaks
	Checksum: 0xD63F8A1B
	Offset: 0x9640
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function trackactivekillstreak(killstreak)
{
	killstreakindex = killstreak.killstreakid;
	if(isdefined(self) && isdefined(self.pers) && isdefined(killstreakindex))
	{
		self endon(#"disconnect");
		self.pers[#"activekillstreaks"][killstreakindex] = killstreak;
		killstreakslot = function_a2c375bb(killstreak.killstreaktype);
		if(isdefined(killstreakslot))
		{
			killstreak.killstreakslot = killstreakslot;
			self clientfield::set_player_uimodel(level.var_4b42d599[killstreakslot], 1);
		}
		killstreak waittill(#"killstreak_hacked", #"death");
		if(isdefined(self))
		{
			if(isdefined(killstreakslot))
			{
				self clientfield::set_player_uimodel(level.var_4b42d599[killstreakslot], 0);
			}
			self.pers[#"activekillstreaks"][killstreakindex] = undefined;
		}
	}
}

/*
	Name: processscoreevent
	Namespace: killstreaks
	Checksum: 0x49B9F2D4
	Offset: 0x97A0
	Size: 0x50
	Parameters: 4
	Flags: None
*/
function processscoreevent(event, player, victim, weapon)
{
	if(isdefined(level.var_19a15e42))
	{
		[[level.var_19a15e42]](event, player, victim, weapon);
	}
}

/*
	Name: update_player_threat
	Namespace: killstreaks
	Checksum: 0x129625E9
	Offset: 0x97F8
	Size: 0x256
	Parameters: 1
	Flags: None
*/
function update_player_threat(player)
{
	if(!isplayer(player))
	{
		return;
	}
	heli = self;
	player.threatlevel = 0;
	dist = distance(player.origin, heli.origin);
	var_b90cd297 = (isdefined(self.var_fc0dee44) ? self.var_fc0dee44 : level.heli_visual_range);
	player.threatlevel = player.threatlevel + (((var_b90cd297 - dist) / var_b90cd297) * 100);
	if(isdefined(heli.attacker) && player == heli.attacker)
	{
		player.threatlevel = player.threatlevel + 100;
	}
	if(isdefined(player.carryobject))
	{
		player.threatlevel = player.threatlevel + 200;
	}
	if(isdefined(player.score))
	{
		player.threatlevel = player.threatlevel + (player.score * 2);
	}
	if(player weapons::has_launcher())
	{
		if(player weapons::has_lockon(heli))
		{
			player.threatlevel = player.threatlevel + 1000;
		}
		else
		{
			player.threatlevel = player.threatlevel + 500;
		}
	}
	if(player weapons::has_heavy_weapon())
	{
		player.threatlevel = player.threatlevel + 300;
	}
	if(player weapons::has_lmg())
	{
		player.threatlevel = player.threatlevel + 200;
	}
	if(isdefined(player.antithreat))
	{
		player.threatlevel = player.threatlevel - player.antithreat;
	}
	if(player.threatlevel <= 0)
	{
		player.threatlevel = 1;
	}
}

/*
	Name: update_non_player_threat
	Namespace: killstreaks
	Checksum: 0xEF3343FF
	Offset: 0x9A58
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function update_non_player_threat(non_player)
{
	heli = self;
	non_player.threatlevel = 0;
	dist = distance(non_player.origin, heli.origin);
	var_b90cd297 = (isdefined(self.var_fc0dee44) ? self.var_fc0dee44 : level.heli_visual_range);
	non_player.threatlevel = non_player.threatlevel + (((var_b90cd297 - dist) / var_b90cd297) * 100);
	if(non_player.threatlevel <= 0)
	{
		non_player.threatlevel = 1;
	}
}

/*
	Name: update_actor_threat
	Namespace: killstreaks
	Checksum: 0x6E092E33
	Offset: 0x9B28
	Size: 0x1BE
	Parameters: 1
	Flags: None
*/
function update_actor_threat(actor)
{
	heli = self;
	actor.threatlevel = 0;
	dist = distance(actor.origin, heli.origin);
	var_b90cd297 = (isdefined(self.var_fc0dee44) ? self.var_fc0dee44 : level.heli_visual_range);
	actor.threatlevel = actor.threatlevel + (((var_b90cd297 - dist) / var_b90cd297) * 100);
	if(isdefined(actor.owner))
	{
		if(isdefined(heli.attacker) && actor.owner == heli.attacker)
		{
			actor.threatlevel = actor.threatlevel + 100;
		}
		if(isdefined(actor.owner.carryobject))
		{
			actor.threatlevel = actor.threatlevel + 200;
		}
		if(isdefined(actor.owner.score))
		{
			actor.threatlevel = actor.threatlevel + (actor.owner.score * 4);
		}
		if(isdefined(actor.owner.antithreat))
		{
			actor.threatlevel = actor.threatlevel - actor.owner.antithreat;
		}
	}
	if(actor.threatlevel <= 0)
	{
		actor.threatlevel = 1;
	}
}

/*
	Name: update_dog_threat
	Namespace: killstreaks
	Checksum: 0xF1FCBF4
	Offset: 0x9CF0
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function update_dog_threat(dog)
{
	heli = self;
	dog.threatlevel = 0;
	dist = distance(dog.origin, heli.origin);
	var_b90cd297 = (isdefined(self.var_fc0dee44) ? self.var_fc0dee44 : level.heli_visual_range);
	dog.threatlevel = dog.threatlevel + (((var_b90cd297 - dist) / var_b90cd297) * 100);
}

/*
	Name: missile_valid_target_check
	Namespace: killstreaks
	Checksum: 0x52FA237F
	Offset: 0x9DA0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function missile_valid_target_check(missiletarget)
{
	heli2target_normal = vectornormalize(missiletarget.origin - self.origin);
	heli2forward = anglestoforward(self.angles);
	heli2forward_normal = vectornormalize(heli2forward);
	heli_dot_target = vectordot(heli2target_normal, heli2forward_normal);
	if(heli_dot_target >= level.heli_valid_target_cone)
	{
		return true;
	}
	return false;
}

/*
	Name: update_missile_player_threat
	Namespace: killstreaks
	Checksum: 0xFC501B8A
	Offset: 0x9E60
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function update_missile_player_threat(player)
{
	player.missilethreatlevel = 0;
	dist = distance(player.origin, self.origin);
	player.missilethreatlevel = player.missilethreatlevel + (((level.heli_missile_range - dist) / level.heli_missile_range) * 100);
	if(self missile_valid_target_check(player) == 0)
	{
		player.missilethreatlevel = 1;
		return;
	}
	if(isdefined(self.attacker) && player == self.attacker)
	{
		player.missilethreatlevel = player.missilethreatlevel + 100;
	}
	if(isdefined(player.score))
	{
		player.missilethreatlevel = player.missilethreatlevel + (player.score * 4);
	}
	if(isdefined(player.antithreat))
	{
		player.missilethreatlevel = player.missilethreatlevel - player.antithreat;
	}
	if(player.missilethreatlevel <= 0)
	{
		player.missilethreatlevel = 1;
	}
}

/*
	Name: update_missile_dog_threat
	Namespace: killstreaks
	Checksum: 0xED3DAC84
	Offset: 0x9FB8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function update_missile_dog_threat(dog)
{
	dog.missilethreatlevel = 1;
}

/*
	Name: function_6d23c51c
	Namespace: killstreaks
	Checksum: 0x4A75B856
	Offset: 0x9FE0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_6d23c51c(dog)
{
	dog.missilethreatlevel = 2;
}

/*
	Name: function_fff56140
	Namespace: killstreaks
	Checksum: 0xFF7F4BBC
	Offset: 0xA008
	Size: 0xA8
	Parameters: 2
	Flags: None
*/
function function_fff56140(owner, var_4a025683)
{
	self notify(#"hash_4363bc1bae999ad3");
	self endon(#"hash_4363bc1bae999ad3", #"death");
	res = undefined;
	res = owner waittill(#"joined_team", #"disconnect", #"joined_spectators", #"changed_specialist");
	[[var_4a025683]]();
}

/*
	Name: should_not_timeout
	Namespace: killstreaks
	Checksum: 0xB9DD6309
	Offset: 0xA0B8
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function should_not_timeout(killstreak)
{
	/#
		/#
			assert(isdefined(killstreak), "");
		#/
		/#
			assert(isdefined(level.killstreaks[killstreak]), "");
		#/
		if(getdvarint(#"hash_e8bb2ce168acce0", 0))
		{
			return 1;
		}
		if(isdefined(level.killstreaks[killstreak].devtimeoutdvar))
		{
			return getdvarint(level.killstreaks[killstreak].devtimeoutdvar, 0);
		}
	#/
	return 0;
}

/*
	Name: waitfortimeout
	Namespace: killstreaks
	Checksum: 0x4060539F
	Offset: 0xA198
	Size: 0x54
	Parameters: 6
	Flags: None
*/
function waitfortimeout(killstreak, duration, callback, endcondition1, endcondition2, endcondition3)
{
	function_b86397ae(killstreak, duration, undefined, callback, endcondition1, endcondition2, endcondition3);
}

/*
	Name: function_b86397ae
	Namespace: killstreaks
	Checksum: 0x471E5C8C
	Offset: 0xA1F8
	Size: 0x334
	Parameters: 7
	Flags: Linked
*/
function function_b86397ae(killstreak, duration, var_c94af1de, callback, endcondition1, endcondition2, endcondition3)
{
	/#
		if(should_not_timeout(killstreak))
		{
			return;
		}
	#/
	self endon(#"killstreak_hacked", #"hash_602ae7ca650d6287");
	if(isdefined(endcondition1))
	{
		self endon(endcondition1);
	}
	if(isdefined(endcondition2))
	{
		self endon(endcondition2);
	}
	if(isdefined(endcondition3))
	{
		self endon(endcondition3);
	}
	self thread waitfortimeouthacked(killstreak, callback, endcondition1, endcondition2, endcondition3);
	killstreakbundle = get_script_bundle(killstreak);
	if(isdefined(var_c94af1de))
	{
		self.killstreakendtime = var_c94af1de + duration;
		waittime = self.killstreakendtime - gettime();
	}
	else
	{
		self.killstreakendtime = gettime() + duration;
		waittime = duration;
	}
	waittime = max(waittime, 0);
	if(isdefined(self.owner) && isplayer(self.owner) && isdefined(self.killstreakslot) && self.var_ec8ef668 !== 1)
	{
		self.owner function_a831f92c(self.killstreakslot, int(ceil(float(duration) / 1000)), 0);
		self.owner function_b3185041(self.killstreakslot, self.killstreakendtime);
	}
	if(isdefined(killstreakbundle) && isdefined(killstreakbundle.kstimeoutbeepduration))
	{
		self function_b00e94e0(killstreakbundle, waittime);
	}
	else
	{
		hostmigration::migrationawarewait(waittime);
	}
	self notify(#"kill_waitfortimeouthacked_thread");
	if(isdefined(self))
	{
		self.killstreaktimedout = 1;
		self.killstreakendtime = 0;
	}
	if(isdefined(self.owner) && isplayer(self.owner) && isdefined(self.killstreakslot))
	{
		self.owner function_b3185041(self.killstreakslot, 0);
	}
	self notify(#"timed_out");
	if(isdefined(self))
	{
		self [[callback]]();
	}
}

/*
	Name: function_b00e94e0
	Namespace: killstreaks
	Checksum: 0x2D80A72
	Offset: 0xA538
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_b00e94e0(killstreakbundle, duration)
{
	self waitfortimeoutbeep(killstreakbundle.kstimeoutbeepduration, killstreakbundle.kstimeoutfastbeepduration, duration);
}

/*
	Name: waitfortimeoutbeep
	Namespace: killstreaks
	Checksum: 0x50B70DA6
	Offset: 0xA580
	Size: 0x184
	Parameters: 3
	Flags: Linked
*/
function waitfortimeoutbeep(kstimeoutbeepduration, kstimeoutfastbeepduration, duration)
{
	self endon(#"death");
	beepduration = int(kstimeoutbeepduration * 1000);
	hostmigration::migrationawarewait(max(duration - beepduration, 0));
	if(isvehicle(self))
	{
		self clientfield::set("timeout_beep", 1);
	}
	if(isdefined(kstimeoutfastbeepduration))
	{
		fastbeepduration = int(kstimeoutfastbeepduration * 1000);
		hostmigration::migrationawarewait(max(beepduration - fastbeepduration, 0));
		if(isvehicle(self))
		{
			self clientfield::set("timeout_beep", 2);
		}
		hostmigration::migrationawarewait(fastbeepduration);
	}
	self function_67bc25ec();
}

/*
	Name: function_67bc25ec
	Namespace: killstreaks
	Checksum: 0xC492BA4E
	Offset: 0xA710
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_67bc25ec()
{
	if(isdefined(self) && isvehicle(self))
	{
		self clientfield::set("timeout_beep", 0);
	}
}

/*
	Name: waitfortimeouthacked
	Namespace: killstreaks
	Checksum: 0xA27954C2
	Offset: 0xA760
	Size: 0xF4
	Parameters: 5
	Flags: Linked
*/
function waitfortimeouthacked(killstreak, callback, endcondition1, endcondition2, endcondition3)
{
	self endon(#"kill_waitfortimeouthacked_thread");
	if(isdefined(endcondition1))
	{
		self endon(endcondition1);
	}
	if(isdefined(endcondition2))
	{
		self endon(endcondition2);
	}
	if(isdefined(endcondition3))
	{
		self endon(endcondition3);
	}
	self waittill(#"killstreak_hacked");
	hackedduration = self killstreak_hacking::get_hacked_timeout_duration_ms();
	self.killstreakendtime = gettime() + hackedduration;
	hostmigration::migrationawarewait(hackedduration);
	self.killstreakendtime = 0;
	self notify(#"timed_out");
	self [[callback]]();
}

/*
	Name: function_975d45c3
	Namespace: killstreaks
	Checksum: 0xA4E4DD38
	Offset: 0xA860
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_975d45c3()
{
	startheight = 200;
	switch(self getstance())
	{
		case "crouch":
		{
			startheight = 30;
			break;
		}
		case "prone":
		{
			startheight = 15;
			break;
		}
	}
	return startheight;
}

/*
	Name: set_killstreak_delay_killcam
	Namespace: killstreaks
	Checksum: 0x534511D8
	Offset: 0xA8E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function set_killstreak_delay_killcam(killstreak_name)
{
	self.killstreak_delay_killcam = killstreak_name;
}

/*
	Name: getactivekillstreaks
	Namespace: killstreaks
	Checksum: 0x8ADCB075
	Offset: 0xA908
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function getactivekillstreaks()
{
	return self.pers[#"activekillstreaks"];
}

/*
	Name: function_55e3fed6
	Namespace: killstreaks
	Checksum: 0xD4D2DA02
	Offset: 0xA930
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_55e3fed6(killstreaktype)
{
	var_98037a32 = self.var_8b9b1bba[killstreaktype];
	if(!isdefined(var_98037a32))
	{
		return false;
	}
	if(var_98037a32 > gettime())
	{
		return true;
	}
	return false;
}

/*
	Name: watchteamchange
	Namespace: killstreaks
	Checksum: 0x6C4E317
	Offset: 0xA980
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function watchteamchange(teamchangenotify)
{
	self notify("2b594b875e9ada10");
	self endon("2b594b875e9ada10");
	killstreak = self;
	killstreak endon(#"death", teamchangenotify);
	killstreak.owner waittill(#"joined_team", #"disconnect", #"joined_spectators", #"emp_jammed");
	killstreak notify(teamchangenotify);
}

/*
	Name: killstreak_assist
	Namespace: killstreaks
	Checksum: 0x569928B1
	Offset: 0xAA38
	Size: 0x3C
	Parameters: 3
	Flags: None
*/
function killstreak_assist(victim, assister, killstreak)
{
	victim recordkillstreakassist(victim, assister, killstreak);
}

/*
	Name: add_ricochet_protection
	Namespace: killstreaks
	Checksum: 0x8051DCC
	Offset: 0xAA80
	Size: 0x11A
	Parameters: 4
	Flags: None
*/
function add_ricochet_protection(killstreak_id, owner, origin, ricochet_distance)
{
	testing = 0;
	/#
		testing = getdvarint(#"scr_ricochet_protection_debug", 0) == 2;
	#/
	if(!level.hardcoremode && !testing)
	{
		return;
	}
	if(!isdefined(ricochet_distance) || ricochet_distance == 0)
	{
		return;
	}
	if(!isdefined(owner.ricochet_protection))
	{
		owner.ricochet_protection = [];
	}
	owner.ricochet_protection[killstreak_id] = spawnstruct();
	owner.ricochet_protection[killstreak_id].origin = origin;
	owner.ricochet_protection[killstreak_id].distancesq = sqr(ricochet_distance);
}

/*
	Name: set_ricochet_protection_endtime
	Namespace: killstreaks
	Checksum: 0xC73EECAC
	Offset: 0xABA8
	Size: 0x76
	Parameters: 3
	Flags: None
*/
function set_ricochet_protection_endtime(killstreak_id, owner, endtime)
{
	if(!isdefined(owner) || !isdefined(owner.ricochet_protection) || !isdefined(killstreak_id))
	{
		return;
	}
	if(!isdefined(owner.ricochet_protection[killstreak_id]))
	{
		return;
	}
	owner.ricochet_protection[killstreak_id].endtime = endtime;
}

/*
	Name: remove_ricochet_protection
	Namespace: killstreaks
	Checksum: 0x4C7ABD9
	Offset: 0xAC28
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function remove_ricochet_protection(killstreak_id, owner)
{
	if(!isdefined(owner) || !isdefined(owner.ricochet_protection) || !isdefined(killstreak_id))
	{
		return;
	}
	owner.ricochet_protection[killstreak_id] = undefined;
}

/*
	Name: thermal_glow
	Namespace: killstreaks
	Checksum: 0xB2CF4627
	Offset: 0xAC80
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function thermal_glow(enable)
{
	clientfield::set_to_player("thermal_glow", enable);
}

/*
	Name: thermal_glow_enemies_only
	Namespace: killstreaks
	Checksum: 0xE63325DE
	Offset: 0xACB0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function thermal_glow_enemies_only(enable)
{
	clientfield::set_to_player("thermal_glow_enemies_only", enable);
}

/*
	Name: is_ricochet_protected
	Namespace: killstreaks
	Checksum: 0x6E869A4A
	Offset: 0xACE0
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function is_ricochet_protected(player)
{
	if(!isdefined(player) || !isdefined(player.ricochet_protection))
	{
		return false;
	}
	foreach(protection in player.ricochet_protection)
	{
		if(!isdefined(protection))
		{
			continue;
		}
		if(isdefined(protection.endtime) && protection.endtime < gettime())
		{
			continue;
		}
		if(distancesquared(protection.origin, player.origin) < protection.distancesq)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_script_bundle
	Namespace: killstreaks
	Checksum: 0x2E3D774D
	Offset: 0xADF0
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function get_script_bundle(type)
{
	if(!isdefined(level.killstreaks[type]))
	{
		return undefined;
	}
	return level.killstreaks[type].script_bundle;
}

/*
	Name: function_e2c3bda3
	Namespace: killstreaks
	Checksum: 0x351C0779
	Offset: 0xAE38
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_e2c3bda3(killstreaktype, var_dee4d012)
{
	var_fc96f513 = level.var_8c83a621[killstreaktype];
	if(!isdefined(var_fc96f513))
	{
		var_fc96f513 = var_dee4d012;
	}
	return var_fc96f513;
}

/*
	Name: function_8c83a621
	Namespace: killstreaks
	Checksum: 0x71DD550F
	Offset: 0xAE88
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_8c83a621(killstreaktype, var_fc96f513)
{
	if(!isdefined(level.var_8c83a621))
	{
		level.var_8c83a621 = [];
	}
	level.var_8c83a621[killstreaktype] = var_fc96f513;
}

/*
	Name: function_257a5f13
	Namespace: killstreaks
	Checksum: 0x9037F4D1
	Offset: 0xAED0
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_257a5f13(killstreaktype, var_ba5a6782)
{
	if(!isdefined(level.var_257a5f13))
	{
		level.var_257a5f13 = [];
	}
	level.var_257a5f13[killstreaktype] = var_ba5a6782;
}

/*
	Name: function_b182645e
	Namespace: killstreaks
	Checksum: 0x12E1A1AE
	Offset: 0xAF18
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function function_b182645e(player, hardpointtype)
{
	if(isdefined(level.var_257a5f13[hardpointtype]))
	{
		killstreakslot = 3;
		var_1abcfdda = getarraykeys(player.killstreak);
		foreach(key in var_1abcfdda)
		{
			if(!isdefined(player.killstreak[key]))
			{
				continue;
			}
			if(player.killstreak[key] == hardpointtype)
			{
				killstreakslot = key;
				break;
			}
		}
		duration = level.var_257a5f13[hardpointtype];
		player function_a831f92c(killstreakslot, duration, 0);
		self.killstreakendtime = gettime() + (int(duration * 1000));
		player function_b3185041(killstreakslot, self.killstreakendtime);
	}
}

/*
	Name: function_f964dc1c
	Namespace: killstreaks
	Checksum: 0x75DDBBE6
	Offset: 0xB0A8
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_f964dc1c()
{
	for(slot = 0; slot < 4; slot++)
	{
		duration = (isdefined(self.pers[#"hash_6ae564fce4d70aff"][slot]) ? self.pers[#"hash_6ae564fce4d70aff"][slot] : 0);
		var_f63114ce = (isdefined(self.pers[#"hash_7b0ebc5ef8a8b896"][slot]) ? self.pers[#"hash_7b0ebc5ef8a8b896"][slot] : 0);
		self function_5249e8b8(slot, duration);
		self function_d5d8e662(slot, var_f63114ce);
		endtime = (isdefined(self.pers[#"hash_754e08b82fb3a121"][slot]) ? self.pers[#"hash_754e08b82fb3a121"][slot] : 0);
		self function_4051d1c6(slot, endtime);
	}
}

/*
	Name: function_a831f92c
	Namespace: killstreaks
	Checksum: 0x98F191B7
	Offset: 0xB218
	Size: 0xFC
	Parameters: 3
	Flags: Linked
*/
function function_a831f92c(killstreakslot, duration, var_f63114ce)
{
	if(!isdefined(self.pers[#"hash_6ae564fce4d70aff"]))
	{
		self.pers[#"hash_6ae564fce4d70aff"] = [];
	}
	if(!isdefined(self.pers[#"hash_7b0ebc5ef8a8b896"]))
	{
		self.pers[#"hash_7b0ebc5ef8a8b896"] = [];
	}
	self.pers[#"hash_6ae564fce4d70aff"][killstreakslot] = duration;
	self function_5249e8b8(killstreakslot, duration);
	self.pers[#"hash_7b0ebc5ef8a8b896"][killstreakslot] = var_f63114ce;
	self function_d5d8e662(killstreakslot, var_f63114ce);
}

/*
	Name: function_b3185041
	Namespace: killstreaks
	Checksum: 0x70E70B35
	Offset: 0xB320
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_b3185041(killstreakslot, endtime)
{
	if(!isdefined(self.pers[#"hash_754e08b82fb3a121"]))
	{
		self.pers[#"hash_754e08b82fb3a121"] = [];
	}
	self.pers[#"hash_754e08b82fb3a121"][killstreakslot] = endtime;
	self function_4051d1c6(killstreakslot, endtime);
}

/*
	Name: function_a781e8d2
	Namespace: killstreaks
	Checksum: 0x87519191
	Offset: 0xB3B0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_a781e8d2()
{
	self clientfield::set("standardTagFxSet", 1);
}

/*
	Name: function_90e951f2
	Namespace: killstreaks
	Checksum: 0xF8864616
	Offset: 0xB3E0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_90e951f2()
{
	self clientfield::set("standardTagFxSet", 0);
}

/*
	Name: function_8b4513ca
	Namespace: killstreaks
	Checksum: 0xF5BEF2DD
	Offset: 0xB410
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_8b4513ca()
{
	self clientfield::set("lowHealthTagFxSet", 1);
}

/*
	Name: function_7d265bd3
	Namespace: killstreaks
	Checksum: 0x7FDD8B36
	Offset: 0xB440
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_7d265bd3()
{
	self clientfield::set("deathTagFxSet", 1);
}

/*
	Name: function_ea21be29
	Namespace: killstreaks
	Checksum: 0x9DB25AC8
	Offset: 0xB470
	Size: 0x164
	Parameters: 3
	Flags: Linked
*/
function function_ea21be29(killstreaktype, killstreak_weapon, player_died)
{
	player = self;
	/#
		assert(isdefined(player));
	#/
	if(player_died)
	{
		var_38665394 = player getteam();
		var_27dca80 = undefined;
		var_27dca80 = player waittill(#"loadout_given", #"disconnect");
		if(var_27dca80._notify !== "loadout_given")
		{
			return false;
		}
		if(isdefined(player) && var_38665394 !== player getteam())
		{
			return false;
		}
	}
	if(isdefined(player))
	{
		if(!isdefined(killstreak_weapon))
		{
			return false;
		}
		if(player getammocount(killstreak_weapon) > 0)
		{
			return false;
		}
		var_f66fab06 = player killstreakrules::function_d9f8f32b(killstreaktype);
		player thread killstreakrules::function_9f635a5(var_f66fab06, killstreaktype);
		return true;
	}
	return false;
}

/*
	Name: function_119fdfcd
	Namespace: killstreaks
	Checksum: 0x84F0C9CD
	Offset: 0xB5E0
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_119fdfcd(killstreaktype)
{
	player = self;
	if(!isplayer(player))
	{
		/#
			assert(isplayer(player));
		#/
		return;
	}
	if(!isdefined(player.var_d01e44d1))
	{
		player.var_d01e44d1 = [];
	}
	var_4dd65320 = player.var_d01e44d1[killstreaktype];
	if(!isdefined(var_4dd65320) || (var_4dd65320 + (int(20 * 1000))) < gettime())
	{
		level thread popups::displaykillstreakteammessagetoall(killstreaktype, self);
		self battlechatter::function_576ff6fe(killstreaktype);
		player.var_d01e44d1[killstreaktype] = gettime();
	}
}

/*
	Name: function_fc82c544
	Namespace: killstreaks
	Checksum: 0xEFF7CC40
	Offset: 0xB6F8
	Size: 0x588
	Parameters: 1
	Flags: None
*/
function function_fc82c544(killstreaktype)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	function_119fdfcd(killstreaktype);
	player disableoffhandweapons();
	result = undefined;
	result = player waittill(#"weapon_change_complete", #"death", #"disconnect", #"joined_team", #"emp_jammed", #"emp_grenaded");
	if(isdefined(player))
	{
		player enableoffhandweapons();
	}
	var_36f4a15 = 0;
	var_64df9ac6 = gettime();
	if(!sessionmodeiscampaigngame())
	{
		if(!sessionmodeiszombiesgame())
		{
			stats::function_8fb23f94(function_73b4659(killstreaktype), #"uses", 1);
		}
		player function_eb52ba7(killstreaktype, player getteam(), -1);
	}
	if(result._notify == "weapon_change_complete")
	{
		if(isdefined(result.weapon))
		{
			function_ece736e7(player, result.weapon);
		}
		var_36f4a15 = 1;
		var_66970d93 = 1;
		killstreak_weapon = result.weapon;
		if(isdefined(level.var_fc6cd245))
		{
			player [[level.var_fc6cd245]](killstreak_weapon);
		}
		while(var_66970d93)
		{
			result = undefined;
			result = player waittill(#"weapon_change", #"death", #"disconnect", #"joined_team", #"emp_jammed", #"emp_grenaded");
			var_66970d93 = result._notify != "death" && isdefined(result.weapon) && result.weapon == killstreak_weapon;
		}
	}
	if(isdefined(player.var_8e94d71c[killstreak_weapon]))
	{
		player.var_8e94d71c[killstreak_weapon] = undefined;
	}
	if(result._notify === #"death")
	{
		if(isdefined(level.var_1d971504))
		{
			[[level.var_1d971504]](result.attacker, player, killstreak_weapon);
		}
	}
	if(isdefined(result.last_weapon) || result._notify === #"death" && isdefined(player))
	{
		var_37b0037 = player function_ea21be29(killstreaktype, killstreak_weapon, result._notify === "death");
		if(!var_37b0037)
		{
			return 0;
		}
		if(sessionmodeismultiplayergame() || function_f99d2668() || sessionmodeiszombiesgame())
		{
			mpkillstreakuses = {#team:player getteam(), #name:killstreaktype, #spawnid:-1, #endtime:gettime(), #starttime:var_64df9ac6};
			var_8756d70f = function_cb0594d5();
			function_92d1707f(var_8756d70f, mpkillstreakuses);
			if(result._notify === #"death")
			{
				end_reason = #"player_died";
				if(isdefined(result.weapon))
				{
					player function_4aad9803(killstreaktype, -1, result.weapon);
				}
			}
			player function_fda235cf(killstreaktype, -1, end_reason);
			if(isdefined(level.var_f9922f0b))
			{
				player [[level.var_f9922f0b]](killstreak_weapon);
			}
		}
	}
	return var_36f4a15;
}

/*
	Name: debug_ricochet_protection
	Namespace: killstreaks
	Checksum: 0x72BA1FA2
	Offset: 0xBC88
	Size: 0x2A8
	Parameters: 0
	Flags: None
*/
function debug_ricochet_protection()
{
	/#
		debug_wait = 0.5;
		debug_frames = (int(debug_wait / (float(function_60d95f53()) / 1000))) + 1;
		while(true)
		{
			if(getdvarint(#"scr_ricochet_protection_debug", 0) == 0)
			{
				wait(2);
				continue;
			}
			wait(debug_wait);
			foreach(player in level.players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				if(!isdefined(player.ricochet_protection))
				{
					continue;
				}
				foreach(protection in player.ricochet_protection)
				{
					if(!isdefined(protection))
					{
						continue;
					}
					if(isdefined(protection.endtime) && protection.endtime < gettime())
					{
						continue;
					}
					radius = sqrt(protection.distancesq);
					sphere(protection.origin, radius, (1, 1, 0), 0.25, 0, 36, debug_frames);
					circle(protection.origin, radius, (1, 0.5, 0), 0, 1, debug_frames);
					circle(protection.origin + vectorscale((0, 0, 1), 2), radius, (1, 0.5, 0), 0, 1, debug_frames);
				}
			}
		}
	#/
}

