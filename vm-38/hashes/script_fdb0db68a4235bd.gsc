#using script_164a456ce05c3483;
#using script_16910aff9d97c520;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ce46999727f2f2b;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using script_36fc02e86719d0f5;
#using script_3bbf85ab4cb9f3c2;
#using script_3faf478d5b0850fe;
#using script_413ab8fe25a61c50;
#using script_4780230832eb22a9;
#using script_47851dbeea22fe66;
#using scripts\core_common\player\player_stats.gsc;
#using script_5133d88c555e460;
#using script_5549681e1669c11a;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_634ae70c663d1cc9;
#using script_67c9a990c0db216c;
#using script_68cdf0ca5df5e;
#using script_6b6510e124bad778;
#using script_717759a5d2a40e63;
#using script_774302f762d76254;
#using script_f38dc50f0e82277;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_8b9bbbb3;

/*
	Name: function_9931df4c
	Namespace: namespace_8b9bbbb3
	Checksum: 0xDEE252D1
	Offset: 0xE30
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9931df4c()
{
	level notify(1607841150);
}

/*
	Name: main
	Namespace: namespace_8b9bbbb3
	Checksum: 0x83A9AF9E
	Offset: 0xE50
	Size: 0x3F0
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level thread lui::add_luimenu("full_screen_movie", &full_screen_movie::register);
	level.var_fb6c6113 = 0;
	serverfield::register("crab_behavior", 1, 1, "int", &function_bfd9c561);
	/#
		assert(isdefined(level.var_f18a6bd6), "");
	#/
	load::main();
	level.callbackvehicleradiusdamage = &globallogic_vehicle::callback_vehicleradiusdamage;
	level.var_2511b5f1 = 1;
	level.var_3146aa25 = 1;
	level.var_5495fbf1 = 0;
	level.friendlyfire = 0;
	level.trackweaponstats = 0;
	level.var_6e2d52c5 = 1;
	level.var_20ad5db3 = sessionmodeiszombiesgame();
	level.var_4f69a0e8 = sessionmodeiswarzonegame();
	level.doa.var_16411829 = [];
	setclearanceceiling(142);
	setsaveddvar(#"hash_61cbea77be1b7b36", 1);
	setsaveddvar(#"hash_53fc4669dcc6b181", 0);
	setsaveddvar(#"ik_enable_ai_terrain", 0);
	setsaveddvar(#"hkai_maxpathlengthchecksenabled", 1);
	setsaveddvar(#"hkai_navmeshusehierarchialpathfind", 1);
	setsaveddvar(#"player_strafespeedscale", 1);
	setsaveddvar(#"player_backspeedscale", 1);
	setsaveddvar(#"hash_5784cae91fb32baa", 0);
	setsaveddvar(#"ai_threatsight", 0);
	setsaveddvar(#"ai_secondarythreats", 0);
	setsaveddvar(#"ai_threatupdateinterval", 0);
	setsaveddvar(#"hash_61eba98da1c9944a", 0);
	setsaveddvar(#"sv_assistworkers", 0);
	if(!is_true(getdvar(#"hash_613a0a3fd49510cd")))
	{
		setsaveddvar(#"hash_5b054b4a96c8fed0", 0);
	}
	level flag::wait_till("doa_game_initialized");
	function_725dd341();
	level waittill(#"hash_671684f03a58b3a3");
	level.var_8e3a3faf = 0;
}

/*
	Name: function_bfd9c561
	Namespace: namespace_8b9bbbb3
	Checksum: 0xD05258A6
	Offset: 0x1248
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_bfd9c561(oldval, newval)
{
	if(!isplayer(self))
	{
		return;
	}
	level.var_fb6c6113 = newval;
}

/*
	Name: function_725dd341
	Namespace: namespace_8b9bbbb3
	Checksum: 0x19184CD8
	Offset: 0x1290
	Size: 0x73C
	Parameters: 0
	Flags: None
*/
function function_725dd341()
{
	var_3177c2d3 = array({#shutdown:&function_ffeaed15, #activation:&function_863ffeba, #name:"island"}, {#shutdown:&function_f1ec9045, #activation:&function_529acb04, #name:"jungle"}, {#shutdown:&function_8025b684, #activation:&function_15692944, #name:"cartel"}, {#shutdown:&function_682069ef, #activation:&function_7773730f, #name:"mausoleum"}, {#shutdown:&function_6d60789, #activation:&function_d723726a, #name:"graveyard"}, {#shutdown:&function_6800d147, #activation:&function_f7295a2d, #name:"temple"}, {#shutdown:&function_507356f3, #activation:&function_eb41fd02, #name:"watertemple"}, {#shutdown:&function_e68b172f, #activation:&function_79604b5e, #name:"geothermal"}, {#shutdown:&function_d9967798, #activation:&function_8ff5e09, #name:"wintercave"}, {#shutdown:&function_ef053c43, #activation:&function_4eaa5cb4, #name:"icecave"}, {#shutdown:&function_cd588c9f, #activation:&function_db874c99, #name:"bloodlake"}, {#shutdown:&function_d70d8d1, #activation:&function_b5abde0c, #name:"witchwood"}, {#shutdown:&function_e584ce9d, #activation:&function_a077af19, #name:"alpine"}, {#shutdown:&function_f66db708, #activation:&function_a80babc3, #name:"frontyard"}, {#shutdown:&function_a9f65217, #activation:&function_c32a6622, #name:"greatroom"}, {#shutdown:&function_7519f916, #activation:&function_e26b3847, #name:"boss"});
	foreach(entry in var_3177c2d3)
	{
		arena = namespace_8c04284b::function_85c7d70e(entry.name);
		[[ arena ]]->function_b6954aba(entry.activation);
		[[ arena ]]->function_774497ee(entry.shutdown);
	}
	wild = doa_wild::function_d5e7454f("jungle_1");
	[[ wild ]]->function_b6954aba(&function_89315f8a);
	[[ wild ]]->function_774497ee(&function_1f77ea0e);
	arena = namespace_8c04284b::function_85c7d70e("island");
	var_ec67aff2 = [[ arena ]]->function_ffcf1d1();
	level thread namespace_ec06fe4a::function_87612422(var_ec67aff2, vectorscale((0, 1, 0), 180), 100, 20, [[ wild ]]->function_c8fbcc3f(0));
}

/*
	Name: function_d85a809b
	Namespace: namespace_8b9bbbb3
	Checksum: 0x83AE31FC
	Offset: 0x19D8
	Size: 0x31C
	Parameters: 1
	Flags: None
*/
function function_d85a809b(section)
{
	self notify("53ff6347c742440b");
	self endon("53ff6347c742440b");
	level endon(#"game_over", #"hash_77e4bcc14697c018");
	if(section.id != 1)
	{
		if(!level flag::get("doa_wild_section_j2_visited"))
		{
			level waittill(#"doa_wild_section_j2_visited");
		}
	}
	vehiclespawners = getentarray("jungle1_wild_vehicle", "targetname");
	while(isdefined(level.doa.var_182fb75a))
	{
		wait(1);
	}
	foreach(vehicle in vehiclespawners)
	{
		veh = vehicle spawner::spawn(1, "wild_vehicle", vehicle.origin, vehicle.angles);
		if(isdefined(veh))
		{
			veh makeusable();
			if(!isdefined(level.doa.var_16411829))
			{
				level.doa.var_16411829 = [];
			}
			else if(!isarray(level.doa.var_16411829))
			{
				level.doa.var_16411829 = array(level.doa.var_16411829);
			}
			level.doa.var_16411829[level.doa.var_16411829.size] = veh;
		}
	}
	level waittill(#"dungeon_building");
	foreach(veh in level.doa.var_16411829)
	{
		if(isdefined(veh))
		{
			veh delete();
		}
	}
	level.doa.var_16411829 = [];
	thread function_d85a809b(section);
}

/*
	Name: function_89315f8a
	Namespace: namespace_8b9bbbb3
	Checksum: 0x4FABD38E
	Offset: 0x1D00
	Size: 0x16C
	Parameters: 1
	Flags: None
*/
function function_89315f8a(section)
{
	/#
		assert(level.doa.var_16411829.size == 0);
	#/
	level thread function_d85a809b(section);
	if(section.id == 2)
	{
		objective_setstate(12, "invisible");
	}
	if(section.id == 3)
	{
		trig = getent("skeleton_cave_warp", "targetname");
		if(isdefined(trig))
		{
			trig thread function_4b556c52();
		}
		result = undefined;
		result = level waittill(#"hash_245c04a2fa4ed1d0");
		var_d8e073bd = result.ai;
		var_4c610a3f = getent("giant_skeleton_throne", "targetname");
		level thread function_4ab4dc9f(var_d8e073bd, var_4c610a3f);
	}
}

/*
	Name: function_4b556c52
	Namespace: namespace_8b9bbbb3
	Checksum: 0x91FBE1E2
	Offset: 0x1E78
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_4b556c52()
{
	self notify("11d3d19940ff1faf");
	self endon("11d3d19940ff1faf");
	self endon(#"death");
	result = undefined;
	result = self waittill(#"trigger");
	if(isplayer(result.activator))
	{
		i = 0;
		warpspots = struct::get_array("skeleton_cave_warp_spot", "targetname");
		/#
			assert(warpspots.size >= 3);
		#/
		foreach(player in getplayers())
		{
			if(player === result.activator)
			{
				continue;
			}
			player setorigin(warpspots[i].origin);
			player setplayerangles(warpspots[i].angles);
			i++;
		}
	}
	else
	{
		self thread function_4b556c52();
	}
}

/*
	Name: function_43cc18d2
	Namespace: namespace_8b9bbbb3
	Checksum: 0xA6D5B68B
	Offset: 0x2030
	Size: 0x1E6
	Parameters: 0
	Flags: None
*/
function function_43cc18d2()
{
	self endon(#"death");
	level endon(#"game_over", #"hash_77e4bcc14697c018");
	models = [];
	foreach(generator in level.doa.var_8acd67ef)
	{
		if(!isdefined(models))
		{
			models = [];
		}
		else if(!isarray(models))
		{
			models = array(models);
		}
		models[models.size] = [[ generator ]]->getmodel();
	}
	var_27d6c1c7 = arraysortclosest(models, self.origin, 2);
	models = [];
	while(true)
	{
		function_1eaaceab(var_27d6c1c7);
		if(var_27d6c1c7.size != 2)
		{
			break;
		}
		result = undefined;
		result = self waittilltimeout(1, #"damage");
		if(result._notify != #"timeout")
		{
			break;
		}
	}
	var_27d6c1c7 = [];
	self notify(#"hash_324ed30049158b16");
}

/*
	Name: function_4ab4dc9f
	Namespace: namespace_8b9bbbb3
	Checksum: 0x2373BE59
	Offset: 0x2220
	Size: 0x244
	Parameters: 2
	Flags: None
*/
function function_4ab4dc9f(var_d8e073bd, var_4c610a3f)
{
	level endon(#"game_over", #"hash_77e4bcc14697c018");
	if(isdefined(var_d8e073bd) && isdefined(var_4c610a3f))
	{
		var_d8e073bd endon(#"death");
		var_d8e073bd thread function_43cc18d2();
		var_73eec401 = "ai_t9_zm_doa_giant_skel_throne_sit_idle";
		var_26d497ed = "ai_t9_zm_doa_giant_skel_throne_sit_stand";
		var_d8e073bd.ignoreall = 1;
		tagorigin = var_4c610a3f gettagorigin("tag_throne_animate");
		tagangles = var_4c610a3f gettagangles("tag_throne_animate");
		tagorigin = var_4c610a3f.origin;
		tagangles = var_4c610a3f.angles;
		var_d8e073bd forceteleport(tagorigin, tagangles);
		while(true)
		{
			var_d8e073bd animscripted(var_73eec401, tagorigin, tagangles, var_73eec401, "normal", undefined, 1, 0.2);
			result = undefined;
			result = var_d8e073bd waittill(var_73eec401, #"hash_324ed30049158b16");
			if(result._notify == #"hash_324ed30049158b16")
			{
				namespace_9fc66ac::function_5e3127a5(undefined, "bossfight_00");
				break;
			}
		}
		var_d8e073bd animscripted(var_26d497ed, tagorigin, tagangles, var_26d497ed, "normal", undefined, 1, 0.2);
		var_d8e073bd.ignoreall = 0;
	}
	while(isdefined(var_d8e073bd))
	{
		wait(0.5);
	}
	namespace_9fc66ac::function_5e3127a5(undefined, "doa_bossdefeated");
}

/*
	Name: function_1f77ea0e
	Namespace: namespace_8b9bbbb3
	Checksum: 0x95CDF38E
	Offset: 0x2470
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_1f77ea0e(var_5f148163)
{
	foreach(veh in level.doa.var_16411829)
	{
		if(isdefined(veh))
		{
			veh delete();
		}
	}
	level.doa.var_16411829 = [];
}

/*
	Name: function_ffeaed15
	Namespace: namespace_8b9bbbb3
	Checksum: 0xDD934BC6
	Offset: 0x2530
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_ffeaed15()
{
	level.var_7dcdbe16 = undefined;
	level.doa.var_13e8f9c9 = undefined;
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("cutscene", 0);
	}
}

/*
	Name: function_bd65dc78
	Namespace: namespace_8b9bbbb3
	Checksum: 0x5A5B8F29
	Offset: 0x25F0
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function function_bd65dc78(var_cec7d4d0)
{
	var_e1dd1170 = int(var_cec7d4d0 / 4);
	if((var_cec7d4d0 % 4) == 0)
	{
		var_e1dd1170 = math::clamp(var_e1dd1170 - 1, 0, var_e1dd1170);
	}
	level thread namespace_8c04284b::function_41e097fc(var_e1dd1170);
	return var_e1dd1170;
}

/*
	Name: function_9dbdc114
	Namespace: namespace_8b9bbbb3
	Checksum: 0x4F6C4D7F
	Offset: 0x2678
	Size: 0x550
	Parameters: 0
	Flags: None
*/
function function_9dbdc114()
{
	level endon(#"arena_switching", #"game_over", #"hash_62332fcf2ebc16d1");
	level namespace_a6ddb172::function_7a0e5387(55);
	var_7f432780 = array::randomize(struct::get_array("island_fate_rock_loc", "targetname"));
	var_fe92efd8 = array::randomize(level.doa.var_fe92efd8);
	for(i = 0; i < var_7f432780.size; i++)
	{
		/#
			assert(i < var_fe92efd8.size);
		#/
		fate = var_fe92efd8[i];
		model = fate.model;
		var_ea5e17f4 = namespace_ec06fe4a::function_e22ae9b3(var_7f432780[i].origin + vectorscale((0, 0, 1), 1500), model);
		if(isdefined(var_ea5e17f4))
		{
			var_ea5e17f4 solid();
			var_ea5e17f4.data = fate;
			var_ea5e17f4.context = 1;
			var_ea5e17f4.dest = var_7f432780[i].origin;
			var_ea5e17f4.angles = fate.var_d75b5b21 + (0, randomint(180), 0);
			var_ea5e17f4.objectiveid = 14 + i;
			var_ea5e17f4 thread doa_fate::function_e4867f1d(fate);
			var_7f432780[i].model = var_ea5e17f4;
			objective_onentity(var_ea5e17f4.objectiveid, var_ea5e17f4);
			objective_setstate(var_ea5e17f4.objectiveid, "active");
			namespace_1e25ad94::debugmsg((((("$$$ ROCK " + i) + " set to model: ") + model) + " and assigned to fate: ") + fate.var_c8386627);
		}
	}
	timeout = 45000 + gettime();
	warning = timeout - 15000;
	lasttime = gettime();
	var_f5a8d3a4 = 0;
	level thread namespace_9fc66ac::announce(8);
	while(!var_f5a8d3a4)
	{
		time = gettime();
		if(time > timeout)
		{
			break;
		}
		if(lasttime <= warning && time > warning)
		{
			level namespace_a6ddb172::function_7a0e5387(43);
			level thread namespace_9fc66ac::announce(11);
		}
		lasttime = time;
		wait(1);
		var_f5a8d3a4 = 1;
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(!isdefined(player.doa.rof))
			{
				var_f5a8d3a4 = 0;
				break;
			}
		}
	}
	level notify(#"hash_60341577c9ac6277");
	for(i = 0; i < var_7f432780.size; i++)
	{
		objective_setstate(14 + i, "invisible");
		if(isdefined(var_7f432780[i].model.trigger))
		{
			var_7f432780[i].model.trigger delete();
		}
		if(isdefined(var_7f432780[i].model))
		{
			var_7f432780[i].model moveto(var_7f432780[i].model.origin + vectorscale((0, 0, 1), 1500), 1);
			wait(0.2);
			if(isdefined(var_7f432780[i].model))
			{
				var_7f432780[i].model delete();
			}
		}
	}
	level thread namespace_9fc66ac::announce(9);
	return var_f5a8d3a4;
}

/*
	Name: function_863ffeba
	Namespace: namespace_8b9bbbb3
	Checksum: 0x7377BFFA
	Offset: 0x2BD0
	Size: 0xEB0
	Parameters: 0
	Flags: None
*/
function function_863ffeba()
{
	self notify("6dfca8bece2702f0");
	self endon("6dfca8bece2702f0");
	level endon(#"arena_switching", #"game_over", #"hash_62332fcf2ebc16d1");
	level thread function_a14d2338();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((28 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	while(true)
	{
		level waittill(#"round_about_to_start");
		level.doa.var_c003ac17 = undefined;
		if(level.doa.roundnumber == 1)
		{
			if(getplayers().size == 1 && getdvarint(#"hash_29afb60660d7bc06", 0))
			{
				level.doa.advancedStart = 1;
				level.doa.var_a87ecf08 = 1;
				player = getplayers()[0];
				var_b0fa9a8d = player stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_5a6bd78423046ffb");
				var_76fa0c6b = player stats::get_stat(#"hash_7eb2e5e9d5a52fbe", 0, #"hash_1ba322b9218ca4e8");
				var_f0ac2041 = (var_b0fa9a8d > var_76fa0c6b ? var_b0fa9a8d : var_76fa0c6b);
				if(var_f0ac2041 > 4)
				{
					maxrounds = level.doa.arenas.size * 4;
					if(var_f0ac2041 > maxrounds)
					{
						var_f0ac2041 = maxrounds;
					}
					if(var_f0ac2041 > 20)
					{
						level flag::set("doa_round_paused");
						level notify(#"hash_1cf1c429bb1c9a07");
						level notify(#"hash_3afec527659c7cd9");
						level waittill(#"hash_28b51ed78ee920f1");
						chosen = function_9dbdc114();
						if(chosen == 0)
						{
							player thread doa_fate::function_42755584(3.5);
						}
						level flag::clear("doa_round_paused");
					}
					var_e1dd1170 = level function_bd65dc78(var_f0ac2041);
					var_d68f41fc = int(var_e1dd1170 / 6);
					player.doa.score.lives = player.doa.score.lives + var_d68f41fc;
					var_3961fa26 = int(var_e1dd1170 / 5);
					player.doa.score.bombs = player.doa.score.bombs + var_3961fa26;
					var_840025ed = int(var_e1dd1170 / 5);
					player.doa.score.boosts = player.doa.score.boosts + var_840025ed;
					return;
				}
			}
			level.doa.var_13e8f9c9 = "walk";
			function_2a6cdb09();
			level thread namespace_9fc66ac::announce(1);
			origin = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
			level doa_pickups::function_ad7ac41b(origin, 1, 72, 14, 1);
			level thread namespace_6e90e490::function_c28bc3eb(14, 1, 5);
			if(!is_true(level.doa.var_318aa67a))
			{
				level thread namespace_6e90e490::function_c28bc3eb(9, 1, 15);
			}
		}
		if(level.doa.roundnumber == 2)
		{
			level.doa.var_13e8f9c9 = undefined;
			level thread namespace_6e90e490::function_c28bc3eb(10, 1, 15);
		}
		if(level.doa.roundnumber == 3)
		{
			namespace_1e25ad94::debugmsg(((("Arena (" + ([[ level.doa.var_39e3fa99 ]]->getname())) + ") special event triggered at: ") + gettime() + " RoundNumber: ") + level.doa.roundnumber);
			level.doa.var_cfa10fcf = 3;
			level.doa.var_c003ac17 = 1;
			level thread namespace_6e90e490::function_c28bc3eb(11, 1, 15);
			if(isdefined(level.doa.var_39e3fa99) && !is_true(level.doa.var_318aa67a))
			{
				var_65bccf6 = doa_pickups::function_57160cba(3);
				spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
				doa_pickups::function_83aea294(spot.origin, 1, 128, var_65bccf6, undefined, 1);
			}
		}
		if(level.doa.roundnumber == 4)
		{
			changeadvertisedstatus(0);
			wild = doa_wild::function_d5e7454f("jungle_1");
			var_ec67aff2 = [[ wild ]]->function_70111aa4(0);
			level thread namespace_ec06fe4a::function_87612422(var_ec67aff2.origin, var_ec67aff2.angles, 0.25, 9999999, [[ wild ]]->function_c8fbcc3f(0));
			if(isdefined(level.doa.var_39e3fa99) && !is_true(level.doa.var_318aa67a))
			{
				var_65bccf6 = doa_pickups::function_57160cba(3);
				spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
				doa_pickups::function_83aea294(spot.origin, 1, 128, var_65bccf6, undefined, 1);
			}
			level flag::set("arena_hold_presentation");
			level flag::set("arena_hold_banner_presentation");
			level waittill(#"hash_de33bd076cde122");
			namespace_ec06fe4a::function_445bad70(1);
			level.var_7dcdbe16 = 1;
			foreach(player in getplayers())
			{
				player notify(#"hash_7893364bd228d63e");
				player notify(#"hash_562d458e34274132");
				if(!isalive(player) || is_true(player.doa.respawning))
				{
					player namespace_7f5aeb59::function_513831e1();
				}
			}
			wait(1.2);
			namespace_ec06fe4a::function_445bad70(1);
			var_a3f4cb78 = [[ level.doa.var_39e3fa99 ]]->function_51dd0a59();
			spots = [[ level.doa.var_39e3fa99 ]]->function_8054e011();
			var_dbfa4ffb = [];
			foreach(spot in spots)
			{
				distsq = distancesquared(spot.origin, var_a3f4cb78.origin);
				if(distsq < sqr(160))
				{
					continue;
				}
				distsq = distancesquared(spot.origin, [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1());
				if(distsq < sqr(160))
				{
					continue;
				}
				var_dbfa4ffb[var_dbfa4ffb.size] = spot;
			}
			foreach(player in getplayers())
			{
				if(!isalive(player) || is_true(player.doa.respawning))
				{
					player namespace_7f5aeb59::function_513831e1();
				}
				var_e3f22e99 = 0;
				distsq = distancesquared(player.origin, var_a3f4cb78.origin);
				if(distsq < sqr(160))
				{
					var_e3f22e99 = 1;
				}
				distsq = distancesquared(player.origin, [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1());
				if(distsq < sqr(160))
				{
					var_e3f22e99 = 1;
				}
				if(var_e3f22e99)
				{
					spot = arraysortclosest(var_dbfa4ffb, player.origin, 1, 160)[0];
					arrayremoveindex(var_dbfa4ffb, 0);
					player setorigin(spot.origin);
				}
				player clientfield::set_to_player("cutscene", 1);
			}
			level thread function_ae378de8();
			if(!is_true(level.var_a095060b))
			{
				level thread function_dc41b38();
				level waittill(#"hash_5579b42bba29dd0f");
				wild = doa_wild::function_d5e7454f("jungle_1");
				var_ec67aff2 = [[ wild ]]->function_70111aa4(0);
				level thread namespace_ec06fe4a::function_87612422(var_ec67aff2.origin, var_ec67aff2.angles, 0.5, 999999, [[ wild ]]->function_c8fbcc3f(0));
			}
		}
	}
}

/*
	Name: function_f1ec9045
	Namespace: namespace_8b9bbbb3
	Checksum: 0xBCC35041
	Offset: 0x3A88
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_f1ec9045()
{
	level.doa.var_13e8f9c9 = undefined;
}

/*
	Name: function_529acb04
	Namespace: namespace_8b9bbbb3
	Checksum: 0x24FBA957
	Offset: 0x3AA8
	Size: 0x378
	Parameters: 0
	Flags: None
*/
function function_529acb04()
{
	self notify("25bf52df9830abdb");
	self endon("25bf52df9830abdb");
	level endon(#"arena_switching", #"arena_completed", #"game_over", #"hash_62332fcf2ebc16d1");
	if(level.doa.var_6c58d51 == 0)
	{
		level.doa.var_13e8f9c9 = "run";
	}
	var_5afe9cea = 40;
	var_73d54dd1 = 0;
	level thread function_a14d2338(8);
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(40);
	while(true)
	{
		level waittill(#"round_about_to_start");
		if(level.doa.roundnumber == 5)
		{
			foreach(player in getplayers())
			{
				player namespace_6e90e490::showhint(6);
			}
		}
		if(!isdefined(level.doa.var_8dc464fe) && !var_73d54dd1)
		{
			if(randomint(100) < var_5afe9cea)
			{
				var_73d54dd1 = 1;
				room = namespace_5a917022::function_3db4a0b1();
				if(isdefined(room))
				{
					level.doa.var_848746c8 = room.name;
				}
			}
			else
			{
				var_5afe9cea = var_5afe9cea + 30;
			}
		}
		if(level.doa.roundnumber == 5 && !is_true(level.doa.var_318aa67a))
		{
			namespace_1e25ad94::debugmsg(((("Arena (" + ([[ level.doa.var_39e3fa99 ]]->getname())) + ") special event triggered at: ") + gettime() + " RoundNumber: ") + level.doa.roundnumber);
			var_65bccf6 = doa_pickups::function_57160cba(3);
			spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
			doa_pickups::function_83aea294(spot.origin, 1, 128, var_65bccf6, undefined, 1);
		}
	}
}

/*
	Name: function_15692944
	Namespace: namespace_8b9bbbb3
	Checksum: 0x1BFADB2F
	Offset: 0x3E28
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_15692944()
{
	level thread function_a14d2338();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(40);
}

/*
	Name: function_8025b684
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x3E70
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_8025b684()
{
}

/*
	Name: function_7773730f
	Namespace: namespace_8b9bbbb3
	Checksum: 0x278426F1
	Offset: 0x3E80
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_7773730f()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((28 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	setdvar(#"hash_2b73855c34966f6b", 8);
}

/*
	Name: function_682069ef
	Namespace: namespace_8b9bbbb3
	Checksum: 0xA783602A
	Offset: 0x3F28
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_682069ef()
{
	setdvar(#"hash_4c0888d26878c503", 3);
	setdvar(#"hash_2b73855c34966f6b", 12);
	setdvar(#"hash_6bb8a71eee3d3d15", 47);
}

/*
	Name: function_b11eca29
	Namespace: namespace_8b9bbbb3
	Checksum: 0xBD3084DF
	Offset: 0x3FB0
	Size: 0x282
	Parameters: 0
	Flags: None
*/
function function_b11eca29()
{
	self notify("5e9ad74fedca404c");
	self endon("5e9ad74fedca404c");
	var_750f1960 = struct::get("rof_keyspawn_loc", "targetname");
	while(isdefined(level.doa.var_a77e6349))
	{
		while(true)
		{
			result = undefined;
			result = level waittilltimeout(1, #"hash_3bbf4237ccea5dd5");
			if(result._notify == #"hash_3bbf4237ccea5dd5")
			{
				return;
			}
			var_c5f022a9 = 0;
			foreach(player in namespace_7f5aeb59::function_23e1f90f())
			{
				if(player.doa.score.keys > 0)
				{
					var_c5f022a9++;
				}
			}
			if(var_c5f022a9 > 0)
			{
				continue;
			}
			if(!isdefined(var_750f1960.var_3a6f3e1f))
			{
				var_750f1960.var_3a6f3e1f = 1;
				if(isdefined(level.doa.var_a77e6349))
				{
					[[ level.doa.var_a77e6349 ]]->function_39d2eb74(var_750f1960, "zombietron_skeleton_key", 100, 1, 1);
				}
				while(!isdefined(var_750f1960.pickups))
				{
					waitframe(1);
				}
			}
			arrayremovevalue(var_750f1960.pickups, undefined);
			if(var_750f1960.pickups.size > 0)
			{
				continue;
			}
			var_750f1960.activated = 0;
			var_750f1960.canspawn = 1;
			var_750f1960.var_c4f9b5c = 0;
			var_750f1960.totalspawned = 0;
			var_750f1960.count = 1;
			while(var_750f1960.pickups.size == 0)
			{
				waitframe(1);
			}
		}
	}
}

/*
	Name: function_d723726a
	Namespace: namespace_8b9bbbb3
	Checksum: 0xC813CAB8
	Offset: 0x4240
	Size: 0x344
	Parameters: 0
	Flags: None
*/
function function_d723726a()
{
	level endon(#"game_over");
	self notify("642fddd6938a9cd7");
	self endon("642fddd6938a9cd7");
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(40);
	var_72bee225 = 1;
	level waittill(#"hash_2a3cff0bb22ed26d");
	[[ level.doa.var_39e3fa99 ]]->function_68400720(0);
	if(level flag::get("doa_rof_visited"))
	{
		var_72bee225 = 0;
		[[ level.doa.var_39e3fa99 ]]->setWild(undefined);
		[[ level.doa.var_39e3fa99 ]]->function_68400720(1);
	}
	else
	{
		level.doa.var_6b57e2f = &function_9e356c78;
		wild = doa_wild::function_d5e7454f("jungle_1");
		var_ec67aff2 = [[ wild ]]->function_70111aa4(2);
		level thread namespace_ec06fe4a::function_87612422(var_ec67aff2.origin, var_ec67aff2.angles, 0.1, 999999, [[ wild ]]->function_c8fbcc3f(2));
	}
	result = undefined;
	result = level waittill(#"waiting_on_player_exit_teleporteronly", #"waiting_on_player_exit_decidechoice");
	foreach(player in namespace_7f5aeb59::function_23e1f90f())
	{
		player notify(#"hash_279998c5df86c04d");
	}
	if(!is_true(level.var_a095060b))
	{
		if(var_72bee225)
		{
			level waittill(#"hash_62332fcf2ebc16d1", #"hash_2a3cff0bb22ed26d");
			/#
				assert(isdefined(level.doa.var_a77e6349));
			#/
			if(isdefined(level.doa.var_a77e6349))
			{
				[[ level.doa.var_a77e6349 ]]->function_1137c8bb();
			}
			level thread function_96372153();
			level thread function_b11eca29();
		}
	}
}

/*
	Name: function_6d60789
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x4590
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_6d60789()
{
}

/*
	Name: function_96372153
	Namespace: namespace_8b9bbbb3
	Checksum: 0x886159AD
	Offset: 0x45A0
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_96372153()
{
	blocker = getent("ROF_backblocker", "targetname");
	startloc = blocker.origin;
	blocker.origin = blocker.origin + vectorscale((0, 0, 1), 160);
	blocker solid();
	blocker disconnectpaths();
	level waittill(#"game_over");
	blocker connectpaths();
	blocker.origin = startloc;
}

/*
	Name: function_f7295a2d
	Namespace: namespace_8b9bbbb3
	Checksum: 0xA5439FC9
	Offset: 0x4678
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_f7295a2d()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((26 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	level thread function_9dfe2f0b();
}

/*
	Name: function_6800d147
	Namespace: namespace_8b9bbbb3
	Checksum: 0xB94BA67B
	Offset: 0x4710
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_6800d147()
{
	setdvar(#"hash_4c0888d26878c503", 3);
	setdvar(#"hash_6bb8a71eee3d3d15", 47);
}

/*
	Name: function_eb41fd02
	Namespace: namespace_8b9bbbb3
	Checksum: 0xFB3DE9DD
	Offset: 0x4770
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_eb41fd02()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((36 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
}

/*
	Name: function_507356f3
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x47F0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_507356f3()
{
}

/*
	Name: function_79604b5e
	Namespace: namespace_8b9bbbb3
	Checksum: 0xCA29BDCD
	Offset: 0x4800
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_79604b5e()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((32 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	level thread function_821f3d71();
	model = spawncollision("collision_slick_64x64x64", "collider", (25378, -28644.3, -42.625), vectorscale((0, 1, 0), 330));
	if(isdefined(model))
	{
		model thread namespace_ec06fe4a::function_d55f042c(level, "teleporter_taken");
		model thread namespace_ec06fe4a::function_d55f042c(level, "arena_switching");
	}
}

/*
	Name: function_e68b172f
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x4928
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_e68b172f()
{
}

/*
	Name: function_a2bf31a9
	Namespace: namespace_8b9bbbb3
	Checksum: 0xC895AFB8
	Offset: 0x4938
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_a2bf31a9()
{
	self endon(#"death");
	level waittill(#"game_over", #"arena_switching", #"teleporter_taken");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_231e7cd8
	Namespace: namespace_8b9bbbb3
	Checksum: 0xF1A9CB8E
	Offset: 0x49B0
	Size: 0x1AE
	Parameters: 6
	Flags: None
*/
function function_231e7cd8(fxname, type, min, max, stop, delay)
{
	if(!isdefined(min))
	{
		min = 0.6;
	}
	if(!isdefined(max))
	{
		max = 2;
	}
	if(!isdefined(stop))
	{
		stop = 1;
	}
	if(!isdefined(delay))
	{
		delay = 4;
	}
	self notify("5fbe12cc6083f6d9");
	self endon("5fbe12cc6083f6d9");
	self endon(#"death");
	if(isdefined(self.script_noteworthy))
	{
		type = self.script_noteworthy;
		stop = 0;
		delay = 0;
		var_47242ffa = 3;
	}
	if(delay)
	{
		wait(delay);
	}
	while(true)
	{
		self namespace_83eb6304::function_3ecfde67(type);
		delay = randomfloatrange(min, max);
		/#
		#/
		result = undefined;
		result = self waittilltimeout(delay, #"stop_fx");
		if(stop || result._notify == #"stop_fx")
		{
			if(isdefined(var_47242ffa))
			{
				wait(var_47242ffa);
			}
			self namespace_83eb6304::turnofffx(type);
		}
		if(result._notify != #"timeout")
		{
			return;
		}
	}
}

/*
	Name: function_821f3d71
	Namespace: namespace_8b9bbbb3
	Checksum: 0x1B705C09
	Offset: 0x4B68
	Size: 0x6D8
	Parameters: 0
	Flags: None
*/
function function_821f3d71()
{
	self notify("5c37516b23832aac");
	self endon("5c37516b23832aac");
	level endon(#"game_over", #"arena_switching", #"teleporter_taken");
	var_99cb14eb = getent("geothermal_pool", "targetname");
	var_3a602ebe = struct::get_array("geothermal_pool_fx_warn", "targetname");
	var_83a77edd = struct::get_array("geothermal_pool_fx_death", "targetname");
	foreach(var_f2c21fb9 in var_3a602ebe)
	{
		var_f2c21fb9.fakemodel = namespace_ec06fe4a::function_e22ae9b3(var_f2c21fb9.origin, undefined, undefined, "geothermal fxlocModel");
		if(isdefined(var_f2c21fb9.fakemodel))
		{
			var_f2c21fb9.fakemodel.script_noteworthy = var_f2c21fb9.script_noteworthy;
			var_f2c21fb9.fakemodel thread function_a2bf31a9();
		}
	}
	foreach(var_f2c21fb9 in var_83a77edd)
	{
		var_f2c21fb9.fakemodel = namespace_ec06fe4a::function_e22ae9b3(var_f2c21fb9.origin, undefined, undefined, "geothermal fxlocModel");
		if(isdefined(var_f2c21fb9.fakemodel))
		{
			var_f2c21fb9.fakemodel.script_noteworthy = var_f2c21fb9.script_noteworthy;
			var_f2c21fb9.fakemodel thread function_a2bf31a9();
		}
	}
	var_35a2ef3d = namespace_ec06fe4a::function_e22ae9b3(var_99cb14eb.origin, undefined, undefined, "geothermal trigModel");
	var_35a2ef3d thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	var_35a2ef3d thread namespace_ec06fe4a::function_d55f042c(level, "teleporter_taken");
	var_35a2ef3d thread namespace_ec06fe4a::function_d55f042c(level, "arena_switching");
	var_76feb3c3 = namespace_ec06fe4a::function_e22ae9b3(var_99cb14eb.origin, undefined, undefined, "geothermal trigModel");
	var_76feb3c3 thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	var_76feb3c3 thread namespace_ec06fe4a::function_d55f042c(level, "teleporter_taken");
	var_76feb3c3 thread namespace_ec06fe4a::function_d55f042c(level, "arena_switching");
	while(true)
	{
		var_99cb14eb triggerenable(0);
		foreach(var_f2c21fb9 in var_83a77edd)
		{
			var_f2c21fb9.fakemodel notify(#"stop_fx");
		}
		foreach(var_f2c21fb9 in var_3a602ebe)
		{
			var_f2c21fb9.fakemodel notify(#"stop_fx");
		}
		wait(randomintrange(12, 20));
		var_35a2ef3d namespace_e32bb68::function_3a59ec34("zmb_water_geyser_sm_warn");
		foreach(var_f2c21fb9 in var_3a602ebe)
		{
			var_f2c21fb9.fakemodel thread function_231e7cd8("water_geyser_sm", "warn", 2, 4);
		}
		wait(randomintrange(10, 16));
		var_35a2ef3d namespace_e32bb68::function_ae271c0b("zmb_water_geyser_sm_warn");
		var_76feb3c3 namespace_e32bb68::function_3a59ec34("zmb_water_geyser_active");
		foreach(var_f2c21fb9 in var_83a77edd)
		{
			var_f2c21fb9.fakemodel thread function_231e7cd8("water_geyser", "active", 0.4, 1.4, 0, 0);
		}
		var_99cb14eb triggerenable(1);
		wait(randomintrange(9, 15));
		var_76feb3c3 namespace_e32bb68::function_ae271c0b("zmb_water_geyser_active");
	}
}

/*
	Name: function_8ff5e09
	Namespace: namespace_8b9bbbb3
	Checksum: 0x1BA087B1
	Offset: 0x5248
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_8ff5e09()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((30 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	level waittill(#"hash_de33bd076cde122");
	if(level flag::get("doa_wild_section_j2_visited"))
	{
		var_72bee225 = 0;
		[[ level.doa.var_39e3fa99 ]]->setWild(undefined);
	}
}

/*
	Name: function_d9967798
	Namespace: namespace_8b9bbbb3
	Checksum: 0xA419A98B
	Offset: 0x5330
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_d9967798()
{
	level flag::set("doa_wild_section_j2_visited");
}

/*
	Name: function_ef053c43
	Namespace: namespace_8b9bbbb3
	Checksum: 0xFF8B2809
	Offset: 0x5360
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_ef053c43()
{
	if(isdefined(level.doa.var_4e7fa15))
	{
		setsaveddvar(#"hash_70e9b7babe37bd", level.doa.var_4e7fa15.var_68196321);
		setsaveddvar(#"hash_49d79caf54cdbf0e", level.doa.var_4e7fa15.var_64e8274c);
		setsaveddvar(#"hash_334540b72330f0d0", level.doa.var_4e7fa15.var_751c4256);
		level.doa.var_4e7fa15 = undefined;
	}
	setdvar(#"hash_4c0888d26878c503", 3);
	setdvar(#"hash_6bb8a71eee3d3d15", 47);
}

/*
	Name: function_4eaa5cb4
	Namespace: namespace_8b9bbbb3
	Checksum: 0xBAF8BB39
	Offset: 0x5490
	Size: 0x300
	Parameters: 0
	Flags: None
*/
function function_4eaa5cb4()
{
	level endon(#"game_over", #"arena_switching", #"teleporter_taken");
	self notify("6fd54a8072d7ee05");
	self endon("6fd54a8072d7ee05");
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((32 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	setdvar(#"hash_6bb8a71eee3d3d15", 70);
	setdvar(#"hash_4c0888d26878c503", 2);
	var_736dd93a = getdvar(#"hash_70e9b7babe37bd");
	var_b2f4c996 = getdvar(#"hash_49d79caf54cdbf0e");
	var_2e3fc95e = getdvar(#"hash_334540b72330f0d0");
	level.doa.var_4e7fa15 = {#hash_751c4256:var_2e3fc95e, #hash_64e8274c:var_b2f4c996, #hash_68196321:var_736dd93a};
	while(true)
	{
		setsaveddvar(#"hash_70e9b7babe37bd", 0.8);
		setsaveddvar(#"hash_49d79caf54cdbf0e", 20);
		setsaveddvar(#"hash_334540b72330f0d0", 60);
		result = undefined;
		result = level waittill(#"hash_7270a59e1f502d96");
		setsaveddvar(#"hash_70e9b7babe37bd", var_736dd93a);
		setsaveddvar(#"hash_49d79caf54cdbf0e", var_b2f4c996);
		setsaveddvar(#"hash_334540b72330f0d0", var_2e3fc95e);
		level waittill(#"hash_7dd47c99b7707b1c");
	}
}

/*
	Name: function_db874c99
	Namespace: namespace_8b9bbbb3
	Checksum: 0x657B0973
	Offset: 0x5798
	Size: 0x182
	Parameters: 0
	Flags: None
*/
function function_db874c99()
{
	var_b282ad2f = struct::get_array("bloodlake_loot_spot", "targetname");
	foreach(item in var_b282ad2f)
	{
		item = doa_pickups::function_d080f0db(doa_pickups::function_6265bde4(item.script_noteworthy), item.origin, item.angles, undefined, 1);
		if(isdefined(item))
		{
			item notify(#"stopidle");
			item notify(#"hash_2a866f50cc161ca8");
		}
	}
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(40);
	var_94f3b914 = doa_enemy::function_251ee3bd("blood_riser");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	level.doa.var_65a70dc = var_94f3b914;
}

/*
	Name: function_cd588c9f
	Namespace: namespace_8b9bbbb3
	Checksum: 0xA21F839F
	Offset: 0x5928
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_cd588c9f()
{
	level.doa.var_65a70dc = doa_enemy::function_d7c5adee("basic_zombie");
}

/*
	Name: function_b5abde0c
	Namespace: namespace_8b9bbbb3
	Checksum: 0x2F84BFB9
	Offset: 0x5960
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function function_b5abde0c()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((32 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	/#
		assert(level.doa.var_65a70dc != doa_enemy::function_d7c5adee(""), "");
	#/
	level.doa.var_65a70dc = doa_enemy::function_d7c5adee("basic_zombie");
}

/*
	Name: function_d70d8d1
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x5A50
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_d70d8d1()
{
}

/*
	Name: function_a077af19
	Namespace: namespace_8b9bbbb3
	Checksum: 0xCAEE2B74
	Offset: 0x5A60
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_a077af19()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((32 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
}

/*
	Name: function_e584ce9d
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x5AE0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_e584ce9d()
{
}

/*
	Name: function_a80babc3
	Namespace: namespace_8b9bbbb3
	Checksum: 0x2376E4AF
	Offset: 0x5AF0
	Size: 0x3B0
	Parameters: 0
	Flags: None
*/
function function_a80babc3()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((28 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	var_36a503f5 = struct::get_array("frontyard_mowers");
	foreach(var_30f23074 in var_36a503f5)
	{
		/#
			assert(!isdefined(var_30f23074.spawnedmodel), "");
		#/
		if(isdefined(var_30f23074.spawnedmodel))
		{
			continue;
		}
		args = strtok(var_30f23074.script_noteworthy, ";");
		modelname = args[0];
		scale = float(args[1]);
		speed = 4;
		if(args.size > 2)
		{
			speed = float(args[2]);
		}
		var_30f23074.spawnedmodel = namespace_ec06fe4a::function_e22ae9b3(var_30f23074.origin, modelname, var_30f23074.angles, "frontyard_lawnMower");
		if(isdefined(var_30f23074.spawnedmodel))
		{
			trigger = namespace_ec06fe4a::spawntrigger("trigger_box", (0, 0, 0), (((1 | 2) | 4) | 4096) | 512, 82, 50, 60);
			if(!isdefined(trigger))
			{
				var_30f23074.spawnedmodel delete();
				continue;
			}
			trigger.var_f83032a3 = "frontyard_lawnMowerTrigger";
			trigger.angles = var_30f23074.angles;
			trigger.origin = var_30f23074.origin;
			trigger.owner = var_30f23074.spawnedmodel;
			var_30f23074.trigger = trigger;
			var_30f23074.spawnedmodel.target = var_30f23074.target;
			var_30f23074.spawnedmodel.speed = speed;
			var_30f23074.spawnedmodel.trigger = trigger;
			var_30f23074.type = #"hash_1af42a1c565c45de";
			trigger thread namespace_ec06fe4a::function_73d79e7d(var_30f23074.spawnedmodel);
			trigger thread function_577f978a();
			var_30f23074.spawnedmodel setscale(scale);
			var_30f23074.spawnedmodel thread function_2d612a87();
		}
	}
}

/*
	Name: function_577f978a
	Namespace: namespace_8b9bbbb3
	Checksum: 0x991FD7D7
	Offset: 0x5EA8
	Size: 0x2A8
	Parameters: 0
	Flags: None
*/
function function_577f978a()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		guy = result.activator;
		if(!isdefined(guy))
		{
			continue;
		}
		if(is_true(guy.boss))
		{
			continue;
		}
		if(is_true(guy.launched))
		{
			continue;
		}
		if(is_true(guy.laststand))
		{
			continue;
		}
		if(!isalive(guy))
		{
			continue;
		}
		if(!isdefined(guy.var_a138f7e0))
		{
			guy.var_a138f7e0 = 0;
		}
		time = gettime();
		if(guy.var_a138f7e0 > gettime())
		{
			continue;
		}
		guy.var_a138f7e0 = time + 250;
		if(isplayer(guy))
		{
			guy dodamage(guy.health + 100, guy.origin, self.owner);
			guy playrumbleonentity("damage_light");
		}
		else
		{
			if(!is_true(guy.no_ragdoll) && randomint(100) < 20)
			{
				guy.launched = 1;
				guy thread namespace_ec06fe4a::function_5678f0d(vectorscale((0, 0, 1), 220), 180, 0.3, self.owner);
				guy thread namespace_ec06fe4a::function_570729f0(0.2, self.owner);
				guy namespace_e32bb68::function_3a59ec34("zmb_ragdoll_launched");
			}
			else
			{
				guy thread namespace_ec06fe4a::function_570729f0(0.1);
				guy thread namespace_ed80aead::function_586ef822();
			}
		}
	}
}

/*
	Name: function_2d612a87
	Namespace: namespace_8b9bbbb3
	Checksum: 0x41D9DACC
	Offset: 0x6158
	Size: 0x1C8
	Parameters: 0
	Flags: None
*/
function function_2d612a87()
{
	self endon(#"death");
	target = struct::get(self.target);
	while(true)
	{
		for(var_afd55d27 = randomint(6); var_afd55d27; var_afd55d27--)
		{
			self.trigger triggerenable(1);
			self moveto(target.origin, self.speed, 0.5, 0.5);
			self namespace_83eb6304::function_3ecfde67("lawn_mower");
			self waittill(#"movedone");
			self.trigger triggerenable(0);
			self namespace_83eb6304::turnofffx("lawn_mower");
			wait(1);
			self rotateto(self.angles + vectorscale((0, 1, 0), 180), 4);
			self waittill(#"rotatedone");
			target = struct::get(target.target);
		}
		wait(randomintrange(10, 20));
	}
}

/*
	Name: function_f66db708
	Namespace: namespace_8b9bbbb3
	Checksum: 0x8D631966
	Offset: 0x6328
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function function_f66db708()
{
	var_36a503f5 = struct::get_array("frontyard_mowers");
	foreach(var_30f23074 in var_36a503f5)
	{
		if(isdefined(var_30f23074.trigger))
		{
			var_30f23074.trigger delete();
			var_30f23074.trigger = undefined;
		}
		if(isdefined(var_30f23074.spawnedmodel))
		{
			var_30f23074.spawnedmodel delete();
			var_30f23074.spawnedmodel = undefined;
		}
	}
}

/*
	Name: function_c32a6622
	Namespace: namespace_8b9bbbb3
	Checksum: 0x131891A
	Offset: 0x6428
	Size: 0x22C
	Parameters: 0
	Flags: None
*/
function function_c32a6622()
{
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((26 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	setdvar(#"hash_6bb8a71eee3d3d15", 90);
	setdvar(#"hash_4c0888d26878c503", 2);
	level waittill(#"hash_2a3cff0bb22ed26d");
	[[ level.doa.var_39e3fa99 ]]->function_68400720(0);
	if(level.doa.var_6c58d51 > 0)
	{
		[[ level.doa.var_39e3fa99 ]]->setWild(undefined);
		[[ level.doa.var_39e3fa99 ]]->function_68400720(1);
	}
	result = undefined;
	result = level waittill(#"waiting_on_player_exit_teleporteronly", #"waiting_on_player_exit_decidechoice");
	if(result._notify == "waiting_on_player_exit_DecideChoice")
	{
		wild = doa_wild::function_d5e7454f("jungle_1");
		var_ec67aff2 = [[ wild ]]->function_70111aa4(3);
		level thread namespace_ec06fe4a::function_87612422(var_ec67aff2.origin, var_ec67aff2.angles, 0.1, 999999, [[ wild ]]->function_c8fbcc3f(3));
	}
}

/*
	Name: function_a9f65217
	Namespace: namespace_8b9bbbb3
	Checksum: 0x364F7844
	Offset: 0x6660
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_a9f65217()
{
	setdvar(#"hash_4c0888d26878c503", 3);
	setdvar(#"hash_6bb8a71eee3d3d15", 47);
}

/*
	Name: function_86431fee
	Namespace: namespace_8b9bbbb3
	Checksum: 0xF4DD7420
	Offset: 0x66C0
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_86431fee(var_2c7cecea)
{
	self endon(#"death");
	var_4c5fe7c6 = var_2c7cecea.origin + vectorscale((0, 0, 1), 450);
	anchor = namespace_ec06fe4a::function_e22ae9b3(var_2c7cecea.origin);
	anchor enablelinkto();
	anchor thread namespace_ec06fe4a::function_d55f042c(self, "death");
	while(true)
	{
		distsq = distancesquared(self.origin, var_2c7cecea.origin);
		if(distsq > sqr(800))
		{
			self.origin = var_4c5fe7c6;
			self moveto(var_2c7cecea.origin, 0.4);
			wait(0.4);
			self linkto(anchor);
			return;
		}
		wait(0.2);
	}
}

/*
	Name: function_e26b3847
	Namespace: namespace_8b9bbbb3
	Checksum: 0x7177322F
	Offset: 0x6820
	Size: 0xB94
	Parameters: 0
	Flags: None
*/
function function_e26b3847()
{
	level endon(#"exit_level", #"end_game", #"game_over");
	var_77f9aad3 = gettime();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc((28 + (getplayers().size - 1) * getdvarint(#"hash_f59b123b8f7c868", 4)) + (level.doa.var_6c58d51 * 8));
	var_2c7cecea = struct::get("fidolina_egg", "targetname");
	if(isdefined(var_2c7cecea))
	{
		var_35b85488 = namespace_ec06fe4a::function_e22ae9b3(var_2c7cecea.origin, "zombietron_egg", var_2c7cecea.angles, "fidolina_egg");
		if(isdefined(var_35b85488))
		{
			var_35b85488 setscale(4);
		}
	}
	level flag::set("arena_hold_presentation");
	level waittill(#"hash_de33bd076cde122");
	level notify(#"hash_4a13bd350867b4ae");
	level flag::clear("arena_hold_presentation");
	level.doa.var_41adf604 = 1;
	foreach(player in getplayers())
	{
		player.doa.var_2d965438 = 0;
	}
	var_5598fe58 = 1 + level.doa.var_6c58d51;
	level namespace_a6ddb172::function_7a0e5387(61);
	namespace_9fc66ac::function_5e3127a5(undefined, "bossfight_01");
	wait(6);
	level namespace_8c04284b::function_3d25cb06();
	level thread namespace_8c04284b::function_81282ad3(5, 1);
	level thread namespace_8c04284b::function_16902251();
	level thread namespace_8c04284b::function_e1916608();
	level thread doa_enemy::function_7495bd30();
	[[ level.doa.var_39e3fa99 ]]->function_4aca7529(0);
	org = namespace_ec06fe4a::function_e22ae9b3((0, 0, 0));
	if(isdefined(org))
	{
		org thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	}
	while(var_5598fe58 > 0)
	{
		var_5598fe58--;
		spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
		if(isdefined(org))
		{
			org.origin = spot.origin;
			org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
			earthquake(0.5, 0.75, org.origin, 1000);
			org namespace_83eb6304::function_3ecfde67("lightningStrike");
			wait(1);
			earthquake(0.5, 0.75, org.origin, 1000);
			org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
			org namespace_83eb6304::function_3ecfde67("lightningStrike");
		}
		silverback = namespace_58e19d6::function_6ae08d6c(spot.origin);
		if(isdefined(silverback))
		{
			/#
				if(is_true(level.var_a095060b))
				{
					silverback thread namespace_ec06fe4a::function_3b3bb5c(0.1, 100);
				}
			#/
			wait(0.1);
			silverback thread namespace_58e19d6::function_27adf2ff(0);
			silverback namespace_ec06fe4a::function_2f4b0f9(silverback.health);
			silverback callback::function_d8abfc3d(#"on_ai_killed", &function_9002816a);
			if(var_5598fe58 > 0)
			{
				wait(10);
			}
		}
	}
	if(isdefined(org))
	{
		org delete();
	}
	while(level.doa.var_5598fe58.size > 0)
	{
		wait(1);
	}
	namespace_9fc66ac::function_5e3127a5(undefined, "doa_bossdefeated");
	level notify(#"round_over");
	level notify(#"arena_completed");
	level.doa.var_41adf604 = undefined;
	level thread namespace_ec06fe4a::function_de70888a();
	namespace_ec06fe4a::function_b6b79fd1();
	level namespace_7f5aeb59::function_67f054d7();
	[[ level.doa.var_39e3fa99 ]]->function_464d882c();
	if(isdefined(var_35b85488))
	{
		var_35b85488 delete();
	}
	var_2c7cecea = struct::get("fidolina_egg_hatch", "targetname");
	var_ae0093c9 = doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_egg"), var_2c7cecea.origin, var_2c7cecea.angles, 1, 1);
	if(isdefined(var_ae0093c9))
	{
		var_ae0093c9 setscale(4);
		var_ae0093c9 thread function_86431fee(var_2c7cecea);
		var_ae0093c9.prize = doa_pickups::function_6265bde4("zombietron_chicken");
		level thread function_99072b0f(var_ae0093c9);
	}
	level util::set_lighting_state(0, 0);
	level clientfield::set("setTOD", 0);
	level namespace_7f5aeb59::function_836aeb74();
	level namespace_a6ddb172::function_7a0e5387(62);
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_f5602976) || !isdefined(player.doa))
		{
			continue;
		}
		if(player.var_90b81208 <= 4 && player.var_f5602976 <= var_77f9aad3)
		{
			player giveachievement(#"hash_4fd5239967bfd36e");
			if(player.doa.var_2d965438 === 0)
			{
				player namespace_d2efac9a::function_267c2183();
			}
		}
		player namespace_d2efac9a::function_4ac57fbe();
	}
	for(i = 0; i <= 3; i++)
	{
		spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
		level doa_pickups::function_68442ee7(spot.origin, 50, 128, 1);
		wait(1);
	}
	wait(10);
	for(i = 0; i <= 3; i++)
	{
		spot = [[ level.doa.var_39e3fa99 ]]->function_fdea25f1();
		level doa_pickups::function_68442ee7(spot.origin, 50, 128, 1);
		wait(1);
	}
	wait(10);
	flag::set("arena_pauseAdvancement");
	level notify(#"arena_completed");
	level thread namespace_8c04284b::function_3f18205d();
	level waittill(#"teleporter_taken");
	level thread namespace_7f5aeb59::function_67f054d7();
	level notify(#"hash_352e6b62a3ee888b");
	level thread doa_pickups::function_19fa261e();
	function_1ae998fb();
	flag::clear("arena_pauseAdvancement");
	var_94f3b914 = doa_enemy::function_251ee3bd("wolf_hellhound");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	var_94f3b914 = doa_enemy::function_251ee3bd("skeleton");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	var_94f3b914 = doa_enemy::function_251ee3bd("steiner");
	[[ var_94f3b914 ]]->function_7edd7727(3);
}

/*
	Name: donothing
	Namespace: namespace_8b9bbbb3
	Checksum: 0xFFA8487D
	Offset: 0x73C0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function donothing(unused)
{
}

/*
	Name: function_99072b0f
	Namespace: namespace_8b9bbbb3
	Checksum: 0x3947DB6A
	Offset: 0x73D8
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_99072b0f(var_ae0093c9)
{
	self notify("4f90d92ec1313fb0");
	self endon("4f90d92ec1313fb0");
	level endon(#"game_over");
	result = undefined;
	result = level waittill(#"hash_1ebd993fc32acc25");
	if(result.egg !== var_ae0093c9)
	{
		level thread function_99072b0f(var_ae0093c9);
	}
	result.prize setscale(4);
	result.prize notify(#"hash_2a866f50cc161ca8");
	result.prize.var_54dddc17 = level;
	result.prize.var_1ad5202b = 1;
	level namespace_a6ddb172::function_7a0e5387(60);
	namespace_9fc66ac::function_5e3127a5(undefined, "doa_fidosaved");
	foreach(player in getplayers())
	{
		wait(randomfloatrange(1, 2));
		if(isdefined(player))
		{
			player thread namespace_6e90e490::function_47e11416(4, undefined, 1);
		}
	}
}

/*
	Name: function_7519f916
	Namespace: namespace_8b9bbbb3
	Checksum: 0x80F724D1
	Offset: 0x75C8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_7519f916()
{
}

/*
	Name: function_9002816a
	Namespace: namespace_8b9bbbb3
	Checksum: 0xB36D7D1E
	Offset: 0x75D8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_9002816a()
{
	origin = self.origin;
	level thread doa_pickups::function_d06cbfe8(origin, randomintrange(20, 30), 32, 1);
}

/*
	Name: function_1ae998fb
	Namespace: namespace_8b9bbbb3
	Checksum: 0x36EE854
	Offset: 0x7638
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_1ae998fb(movie)
{
	if(!isdefined(movie))
	{
		movie = "wz_doa_outro";
	}
	namespace_ec06fe4a::function_445bad70(1);
	level thread lui::play_movie(hash(movie), "fullscreen", 0, 0, 1);
	level waittill(#"movie_done");
	namespace_ec06fe4a::function_445bad70(0);
}

/*
	Name: function_a14d2338
	Namespace: namespace_8b9bbbb3
	Checksum: 0xE982BEE4
	Offset: 0x76E0
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_a14d2338(var_f1280ed2)
{
	if(!isdefined(level.doa))
	{
		return;
	}
	if(getplayers().size > 1 || level.doa.var_6c58d51 > 0)
	{
		return;
	}
	if(is_true(level.var_fb6c6113))
	{
		return;
	}
	level thread function_89106e27(var_f1280ed2);
}

/*
	Name: function_89106e27
	Namespace: namespace_8b9bbbb3
	Checksum: 0x382BAB6E
	Offset: 0x7780
	Size: 0x2B4
	Parameters: 1
	Flags: None
*/
function function_89106e27(var_f1280ed2)
{
	if(!isdefined(var_f1280ed2))
	{
		var_f1280ed2 = 2;
	}
	targetname = ([[ level.doa.var_39e3fa99 ]]->getname()) + "_tutorial";
	spot = struct::get(targetname, "targetname");
	if(!isdefined(spot))
	{
		return;
	}
	var_9958214e = namespace_ec06fe4a::function_e22ae9b3(spot.origin, spot.script_noteworthy, spot.angles, (targetname + "_") + spot.script_noteworthy);
	var_9958214e.takedamage = 0;
	var_9958214e.doa = spawnstruct();
	var_9958214e.doa.hints = 0;
	var_9958214e.doa.var_578b6ad4 = 0;
	var_9958214e clientfield::set("setTutorialEnt", 1);
	var_9958214e thread namespace_ec06fe4a::function_d55f042c(level, "arena_switching");
	var_9958214e thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	var_9958214e thread namespace_ec06fe4a::function_d55f042c(level, "wild_taken");
	var_9958214e thread namespace_ec06fe4a::function_d55f042c(level, "advancedStart");
	if(randomint(100) > 50)
	{
		sword = namespace_ec06fe4a::function_e22ae9b3(var_9958214e.origin, "zombietron_crab_pirate_sword", var_9958214e.angles, targetname + "_sword");
		if(isdefined(sword))
		{
			var_9958214e enablelinkto();
			sword thread namespace_ec06fe4a::function_d55f042c(var_9958214e, "death");
			sword linkto(var_9958214e, "tag_crab_animate", (23, -26, -12), vectorscale((0, -1, 0), 12));
		}
	}
	wait(var_f1280ed2);
	if(isdefined(var_9958214e))
	{
		var_9958214e function_b64568e2();
	}
}

/*
	Name: function_520814d5
	Namespace: namespace_8b9bbbb3
	Checksum: 0x158B33AA
	Offset: 0x7A40
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_520814d5(player, minlevel)
{
	if(!isdefined(self) || !isdefined(self.doa))
	{
		return false;
	}
	if(!isdefined(level.doa.var_39e3fa99))
	{
		return false;
	}
	if(level.doa.roundnumber < minlevel)
	{
		return false;
	}
	if(is_true(self.doa.var_91fab440))
	{
		return false;
	}
	if(gettime() < self.doa.var_578b6ad4)
	{
		return false;
	}
	if(isdefined(player) && distancesquared(self.origin, player.origin) > sqr(160))
	{
		return false;
	}
	return true;
}

/*
	Name: function_762b14b0
	Namespace: namespace_8b9bbbb3
	Checksum: 0xC6A841F0
	Offset: 0x7B48
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_762b14b0(var_acbf7fe7, var_25f4de97)
{
	if(!isdefined(var_25f4de97))
	{
		var_25f4de97 = 0;
	}
	level.doa.var_1e31cd70 = level.doa.var_1e31cd70 | var_25f4de97;
	self namespace_83eb6304::function_3ecfde67("crab_bubbles");
	self thread namespace_6e90e490::function_47e11416(var_acbf7fe7, 5, 1);
}

/*
	Name: function_30e6e8e9
	Namespace: namespace_8b9bbbb3
	Checksum: 0xB4C7F803
	Offset: 0x7BD8
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function function_30e6e8e9(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 2)
	{
		return;
	}
	self notify("4b3a195867a445cc");
	self endon("4b3a195867a445cc");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(level.doa.var_25f4de97 & 0)
		{
		}
		self function_762b14b0(26, 2);
		return;
	}
}

/*
	Name: function_c139c0cd
	Namespace: namespace_8b9bbbb3
	Checksum: 0x1EDB23B3
	Offset: 0x7CE0
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function function_c139c0cd(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 4)
	{
		return;
	}
	self notify("7713d0256e8133e6");
	self endon("7713d0256e8133e6");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(player.doa.score.var_194c59ae != 1)
		{
		}
		self function_762b14b0(22, 4);
		return;
	}
}

/*
	Name: function_5f282dbb
	Namespace: namespace_8b9bbbb3
	Checksum: 0x404BAC1B
	Offset: 0x7DF0
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function function_5f282dbb(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	self notify("59cf25d3d2936e9e");
	self endon("59cf25d3d2936e9e");
	self endon(#"death");
	while(true)
	{
		wait(1);
		player = getplayers()[0];
		if(!function_520814d5(player, minlevel))
		{
			continue;
		}
		exits = [[ level.doa.var_39e3fa99 ]]->function_dfb49846();
		if(exits.size == 0)
		{
			continue;
		}
		self function_762b14b0(23);
	}
}

/*
	Name: function_6b8cf507
	Namespace: namespace_8b9bbbb3
	Checksum: 0x273EF348
	Offset: 0x7EE8
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_6b8cf507(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	self notify("4c98b5ecdb48553");
	self endon("4c98b5ecdb48553");
	self endon(#"death");
	while(true)
	{
		wait(1);
		player = getplayers()[0];
		if(!function_520814d5(player, minlevel))
		{
			continue;
		}
		if(!isdefined(level.doa.teleporter))
		{
			continue;
		}
		self function_762b14b0(21);
	}
}

/*
	Name: function_b5812513
	Namespace: namespace_8b9bbbb3
	Checksum: 0x5D953F68
	Offset: 0x7FC0
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_b5812513(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	self notify("6f04111b21c87102");
	self endon("6f04111b21c87102");
	self endon(#"death");
	while(true)
	{
		wait(1);
		player = getplayers()[0];
		if(!function_520814d5(player, minlevel))
		{
			continue;
		}
		if(!isdefined(level.doa.var_6c225512))
		{
			continue;
		}
		self function_762b14b0(24);
	}
}

/*
	Name: function_3346623b
	Namespace: namespace_8b9bbbb3
	Checksum: 0xF97BCDF
	Offset: 0x8098
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function function_3346623b(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 8)
	{
		return;
	}
	self notify("7ef8bd1f6a929e76");
	self endon("7ef8bd1f6a929e76");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(player.doa.score.keys == 0)
		{
		}
		self function_762b14b0(25, 8);
		return;
	}
}

/*
	Name: function_aa9cc9d2
	Namespace: namespace_8b9bbbb3
	Checksum: 0x45757FB3
	Offset: 0x81A8
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function function_aa9cc9d2(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 16)
	{
		return;
	}
	self notify("57d21fd7a584458");
	self endon("57d21fd7a584458");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(!isdefined(level.doa.weaponcharger))
		{
		}
		self function_762b14b0(32, 16);
		return;
	}
}

/*
	Name: function_249cea33
	Namespace: namespace_8b9bbbb3
	Checksum: 0x3A3C4981
	Offset: 0x82B0
	Size: 0x162
	Parameters: 1
	Flags: None
*/
function function_249cea33(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 32)
	{
		return;
	}
	if(is_true(level.doa.var_318aa67a))
	{
		return;
	}
	self notify("462bcb5e73de7fc4");
	self endon("462bcb5e73de7fc4");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(is_true(player.doa.var_3e81d24c) == 0)
		{
		}
		if(!util::within_fov(player.origin, player.angles, self.origin, 0.7))
		{
		}
		self function_762b14b0(27, 32);
		return;
	}
}

/*
	Name: function_6b42d44
	Namespace: namespace_8b9bbbb3
	Checksum: 0x8D8C0A5E
	Offset: 0x8420
	Size: 0x122
	Parameters: 1
	Flags: None
*/
function function_6b42d44(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 64)
	{
		return;
	}
	self notify("1fc2c1c1b0c4aee7");
	self endon("1fc2c1c1b0c4aee7");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(level.doa.var_25f4de97 & 0)
		{
		}
		if(player.doa.var_fd5fcb75 == player.doa.var_ed8fde10)
		{
		}
		self function_762b14b0(28, 64);
		return;
	}
}

/*
	Name: function_22c260e
	Namespace: namespace_8b9bbbb3
	Checksum: 0x66C129DB
	Offset: 0x8550
	Size: 0x11A
	Parameters: 1
	Flags: None
*/
function function_22c260e(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 128)
	{
		return;
	}
	self notify("1266378a3294a9ab");
	self endon("1266378a3294a9ab");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(player.doa.score.bombs == 0)
		{
		}
		if(level.doa.var_25f4de97 & 0)
		{
		}
		self function_762b14b0(30, 128);
		return;
	}
}

/*
	Name: function_13471cec
	Namespace: namespace_8b9bbbb3
	Checksum: 0x6477F88C
	Offset: 0x8678
	Size: 0x11A
	Parameters: 1
	Flags: None
*/
function function_13471cec(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 256)
	{
		return;
	}
	self notify("1bcfb629dded9004");
	self endon("1bcfb629dded9004");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(player.doa.score.boosts == 0)
		{
		}
		if(level.doa.var_25f4de97 & 0)
		{
		}
		self function_762b14b0(31, 256);
		return;
	}
}

/*
	Name: function_570d7b0b
	Namespace: namespace_8b9bbbb3
	Checksum: 0x7D4056E0
	Offset: 0x87A0
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function function_570d7b0b(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 512)
	{
		return;
	}
	self notify("6f995eecc59f1953");
	self endon("6f995eecc59f1953");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		self function_762b14b0(29, 512);
		return;
	}
}

/*
	Name: function_b170f79d
	Namespace: namespace_8b9bbbb3
	Checksum: 0x8C952A17
	Offset: 0x8888
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function function_b170f79d(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 1024)
	{
		return;
	}
	self notify("394b074b01f6bfec");
	self endon("394b074b01f6bfec");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(level.doa.var_5598fe58.size == 0)
		{
		}
		self function_762b14b0(33, 1024);
		return;
	}
}

/*
	Name: function_be3d7906
	Namespace: namespace_8b9bbbb3
	Checksum: 0x721F0861
	Offset: 0x8990
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function function_be3d7906(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	if(level.doa.var_1e31cd70 & 2048)
	{
		return;
	}
	self notify("7932e628cc08a001");
	self endon("7932e628cc08a001");
	self endon(#"death");
	if(1)
	{
		for(;;)
		{
			wait(1);
			player = getplayers()[0];
		}
		for(;;)
		{
		}
		if(!function_520814d5(player, minlevel))
		{
		}
		if(!is_true(level.doa.var_c003ac17))
		{
		}
		self function_762b14b0(34, 2048);
		return;
	}
}

/*
	Name: function_e8a512e2
	Namespace: namespace_8b9bbbb3
	Checksum: 0xCDA66B6E
	Offset: 0x8AA0
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_e8a512e2(minlevel)
{
	if(!isdefined(minlevel))
	{
		minlevel = 1;
	}
	self notify("394f2c29d0364d89");
	self endon("394f2c29d0364d89");
	self endon(#"death");
	while(true)
	{
		wait(1);
		player = getplayers()[0];
		if(!function_520814d5(player, minlevel))
		{
			continue;
		}
		self namespace_83eb6304::function_3ecfde67("crab_bubbles");
		self thread namespace_6e90e490::function_47e11416(7, 5);
	}
}

/*
	Name: function_880094bd
	Namespace: namespace_8b9bbbb3
	Checksum: 0x1F5C0B47
	Offset: 0x8B80
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_880094bd(minlevel)
{
	self notify("50173b418fa536db");
	self endon("50173b418fa536db");
	self endon(#"death");
	wait(6);
	player = getplayers()[0];
	if(distancesquared(self.origin, player.origin) > sqr(256))
	{
		self namespace_83eb6304::function_3ecfde67("crab_bubbles");
		self thread namespace_6e90e490::function_47e11416(8, 5, 1, 1);
	}
}

/*
	Name: function_b64568e2
	Namespace: namespace_8b9bbbb3
	Checksum: 0x570058C0
	Offset: 0x8C70
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_b64568e2()
{
	if(!isdefined(self) || getplayers().size > 1)
	{
		return;
	}
	self function_880094bd();
	self thread function_be3d7906();
	self thread function_b5812513();
	self thread function_6b8cf507();
	self thread function_b170f79d(5);
	self thread function_5f282dbb();
	self thread function_aa9cc9d2(9);
	self thread function_3346623b(1);
	self thread function_30e6e8e9(1);
	self thread function_c139c0cd(2);
	self thread function_6b42d44(2);
	self thread function_22c260e(3);
	self thread function_13471cec(4);
	self thread function_249cea33(4);
	self thread function_570d7b0b(5);
	self thread function_e8a512e2();
}

/*
	Name: function_9e356c78
	Namespace: namespace_8b9bbbb3
	Checksum: 0xB749B3CC
	Offset: 0x8E28
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_9e356c78(name)
{
	level namespace_a6ddb172::function_7a0e5387(47);
	level thread namespace_9fc66ac::announce(10);
}

/*
	Name: function_9dfe2f0b
	Namespace: namespace_8b9bbbb3
	Checksum: 0xD1D859B9
	Offset: 0x8E70
	Size: 0xD6
	Parameters: 0
	Flags: None
*/
function function_9dfe2f0b()
{
	self notify("29905afac0d44806");
	self endon("29905afac0d44806");
	level endon(#"arena_switching", #"arena_completed");
	var_94f3b914 = doa_enemy::function_251ee3bd("smoke_zombie");
	while(true)
	{
		level waittill(#"hash_46fa6c5088941b95", #"hash_c1cceae4479f2e5");
		if([[ level.doa.var_39e3fa99 ]]->ispaused())
		{
			continue;
		}
		level thread namespace_77eccc4f::function_d1603826(var_94f3b914);
		wait(10);
	}
}

/*
	Name: function_3e4c2ba0
	Namespace: namespace_8b9bbbb3
	Checksum: 0x4F4D2A17
	Offset: 0x8F50
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function function_3e4c2ba0()
{
	self endon(#"death");
	var_1736b9f0 = 0;
	while(true)
	{
		if(randomint(100) < 4)
		{
			self namespace_83eb6304::function_3ecfde67("teleporter_disabled");
			self namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_spark");
		}
		if(randomint(100) < 2)
		{
			self namespace_83eb6304::function_3ecfde67("hazard_electric");
			self namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_spark");
		}
		if(!var_1736b9f0 && randomint(100) > 95)
		{
			self namespace_83eb6304::function_3ecfde67("teleporter_dungeon_light");
			var_1736b9f0 = 1;
		}
		else if(var_1736b9f0)
		{
			var_1736b9f0 = 0;
			self namespace_83eb6304::turnofffx("teleporter_dungeon_light");
		}
		wait(0.1);
	}
}

/*
	Name: function_a14b5631
	Namespace: namespace_8b9bbbb3
	Checksum: 0x845432B
	Offset: 0x90C0
	Size: 0x188
	Parameters: 0
	Flags: None
*/
function function_a14b5631()
{
	self notify(#"hash_7bf2519960a3852a");
	self endon(#"death");
	self rotateto(self.var_c9f66f0d, 4, 0, 3.8);
	self waittilltimeout(4, #"rotatedone");
	wait(randomfloatrange(2, 3));
	while(isdefined(self))
	{
		angle = (0, randomfloatrange(40, 180) * -1, 0);
		lap = randomfloatrange(4, 8);
		self rotateto(self.angles + angle, lap, randomfloatrange(lap * 0.15, lap * 0.25), randomfloatrange(lap * 0.25, lap * 0.45));
		wait(randomfloatrange(lap, lap * 2));
	}
}

/*
	Name: function_dc41b38
	Namespace: namespace_8b9bbbb3
	Checksum: 0xAD053219
	Offset: 0x9250
	Size: 0x2A0
	Parameters: 0
	Flags: None
*/
function function_dc41b38()
{
	result = undefined;
	result = level waittill(#"teleporter_spawned");
	teleporter = result.teleporter;
	teleporter endon(#"death");
	teleporter.malfunction = 1;
	level waittill(#"hash_53cf824d8cd53237");
	teleporter thread function_a14b5631();
	teleporter setmodel("zombietron_teleporter_damaged");
	teleporter namespace_83eb6304::function_3ecfde67("wild_portal_radial_burst");
	teleporter namespace_83eb6304::function_3ecfde67("electrical_fire");
	teleporter namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_burst");
	teleporter namespace_e32bb68::function_ae271c0b("evt_doa_teleporter_lp");
	teleporter thread function_3e4c2ba0();
	wait(5);
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("cutscene", 0);
	}
	level.var_7dcdbe16 = undefined;
	level notify(#"hash_5579b42bba29dd0f");
	namespace_ec06fe4a::function_445bad70(0);
	while(true)
	{
		if(!isdefined(teleporter.trigger))
		{
			waitframe(1);
			continue;
		}
		result = undefined;
		result = teleporter.trigger waittill(#"trigger");
		if(isdefined(result.activator))
		{
			player = result.activator;
			player thread namespace_6e90e490::function_47e11416(10);
		}
	}
}

/*
	Name: function_ae378de8
	Namespace: namespace_8b9bbbb3
	Checksum: 0x92BF49CA
	Offset: 0x94F8
	Size: 0x10F4
	Parameters: 0
	Flags: None
*/
function function_ae378de8()
{
	streamermodelhint("c_zom_doa_simianaut_body", 20);
	streamermodelhint("c_zom_doa_simianaut_wig", 20);
	streamermodelhint("c_zom_doa_simianaut_glasses", 20);
	streamermodelhint("zombietron_spoon", 20);
	wait(1);
	var_a3f4cb78 = [[ level.doa.var_39e3fa99 ]]->function_51dd0a59();
	silverback = namespace_58e19d6::function_6ae08d6c(var_a3f4cb78.origin);
	silverback.ignoreall = 1;
	silverback.takedamage = 0;
	silverback.collector = 1;
	silverback.var_6e5b38d9 = 99999999;
	silverback clientfield::set("show_health_bar", 0);
	silverback namespace_58e19d6::function_27adf2ff(0, 0);
	silverback thread namespace_ec06fe4a::function_d55f042c(level, "arena_switching");
	silverback thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	silverback thread namespace_ec06fe4a::function_d55f042c(level, "wild_taken");
	silverback namespace_ec06fe4a::function_8c808737();
	silverback pathmode("dont move");
	silverback orientmode("face enemy");
	if(is_true(level.doa.var_318aa67a))
	{
		foreach(player in getplayers())
		{
			var_993aabe1 = var_a3f4cb78.origin - player.origin;
			v_angles = vectortoangles(var_993aabe1);
			player setplayerangles(v_angles);
		}
	}
	org = spawn("script_model", var_a3f4cb78.origin);
	org setmodel("tag_origin");
	org thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	org thread namespace_ec06fe4a::function_d55f042c(level, "arena_switching");
	org thread namespace_ec06fe4a::function_d55f042c(level, "wild_taken");
	earthquake(0.5, 0.75, var_a3f4cb78.origin, 1000);
	org namespace_83eb6304::function_3ecfde67("lightningStrike");
	org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
	wait(randomfloat(1.2));
	org namespace_83eb6304::function_3ecfde67("lightningStrike");
	org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
	wait(randomfloat(2));
	org namespace_83eb6304::function_3ecfde67("lightningStrike");
	org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
	waitframe(1);
	org namespace_83eb6304::function_3ecfde67("lightningStrike");
	org namespace_83eb6304::function_3ecfde67("wild_portal");
	wait(randomfloat(1));
	org namespace_83eb6304::function_3ecfde67("lightningStrike");
	org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
	earthquake(0.5, 0.75, var_a3f4cb78.origin, 1000);
	var_f8999e14 = struct::get("island_cutscene_camloc", "targetname");
	if(isdefined(silverback))
	{
		angle = vectortoangles(var_f8999e14.origin - silverback.origin);
		angles = (silverback.angles[0], angle[1], silverback.angles[2]);
		silverback dontinterpolate();
		silverback forceteleport(var_a3f4cb78.origin, angles);
		org.angles = angles;
		silverback linkto(org);
		silverback namespace_ec06fe4a::function_4f72130c();
		silverback namespace_58e19d6::function_27adf2ff(1, 0);
		wait(0.5);
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
	}
	if(isdefined(silverback))
	{
		silverback thread namespace_6e90e490::function_47e11416(11, 3, 1);
		level thread doa_pickups::function_ad7ac41b(silverback.origin, 20, 700, 1);
		silverback.taunting = 1;
		silverback waittilltimeout(2, #"taunt_end", #"death");
	}
	if(isdefined(silverback))
	{
		silverback.taunting = undefined;
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		level flag::clear("arena_hold_presentation");
		wait(3.1);
	}
	if(isdefined(silverback))
	{
		silverback thread namespace_6e90e490::function_47e11416(11, 3, 1);
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		wait(1.25);
	}
	if(isdefined(silverback))
	{
		var_26e4879c = ([[ level.doa.var_39e3fa99 ]]->function_ffcf1d1()) + vectorscale((0, 0, 1), 20);
		bombmodel = namespace_ec06fe4a::function_e22ae9b3(silverback gettagorigin("j_wrist_le"), "zombietron_silverback_bomb", (0, 0, 0), "zombietron_silverback_bomb");
		v1 = 0.77;
		var_812cd671 = 440;
		var_5e2edb24 = 1.1;
		v2 = 0.4;
		var_60c0e048 = 0.55;
		v3 = 0.2;
		var_730384cd = 0.25;
		velocity = (var_26e4879c - bombmodel.origin) * v1;
		velocity = (velocity[0], velocity[1], var_812cd671);
		bombmodel movegravity(velocity, var_5e2edb24);
		wait(var_5e2edb24);
		bombmodel namespace_e32bb68::function_3a59ec34("evt_doa_pickup_barrel_active_impact");
		bombmodel movegravity(velocity * v2, var_60c0e048);
		wait(var_60c0e048);
		bombmodel namespace_e32bb68::function_3a59ec34("evt_doa_pickup_barrel_active_impact");
		bombmodel movegravity(velocity * v3, var_730384cd);
		wait(var_730384cd);
		bombmodel namespace_e32bb68::function_3a59ec34("evt_doa_pickup_barrel_active_impact");
		bombmodel thread namespace_ec06fe4a::function_f506b4c7();
		wait(1);
	}
	if(isdefined(silverback))
	{
		level.doa.var_537a3e29[level.doa.var_537a3e29.size] = silverback;
		silverback thread namespace_6e90e490::function_47e11416(11, 3, 1);
		silverback.taunting = 1;
		silverback waittilltimeout(2, #"taunt_end", #"death");
		wait(3.1);
	}
	if(isdefined(silverback))
	{
		silverback.taunting = undefined;
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		silverback thread namespace_6e90e490::function_47e11416(11, 3, 1);
	}
	wait(3.1);
	if(isdefined(silverback))
	{
		fxorg = namespace_ec06fe4a::function_e22ae9b3(silverback gettagorigin("tag_eye"), "tag_origin");
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		wait(0.1);
	}
	if(isdefined(silverback))
	{
		silverback unlink();
		silverback.var_febfd0.angles = silverback.angles;
		silverback.var_febfd0.origin = silverback.origin;
		silverback linkto(silverback.var_febfd0);
		destination = silverback.var_febfd0.origin + (vectorscale((0, 0, -1), 400));
		silverback.var_febfd0 thread function_dbe90b58();
		silverback.var_febfd0 moveto(destination, 5, 4);
	}
	if(isdefined(fxorg))
	{
		fxorg.targetname = "tesla_trail";
		fxorg namespace_83eb6304::function_3ecfde67("tesla_trail");
		fxorg moveto(bombmodel.origin + vectorscale((0, 0, 1), 42), 0.6);
		fxorg waittilltimeout(0.6, #"movedone");
		fxorg namespace_83eb6304::function_3ecfde67("hazard_electric");
		bombmodel namespace_83eb6304::function_3ecfde67("bombFuse");
		bombmodel namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_bomb_fuse_lp");
		wait(1.5);
		bombmodel hidepart("tag_fuse");
		wait(1.2);
		fxorg delete();
	}
	else
	{
		wait(3);
	}
	if(isdefined(silverback))
	{
		silverback playsound("zmb_doa_ai_silverback_vocal_roar_short");
		wait(1);
	}
	if(isdefined(silverback) && isdefined(org))
	{
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		silverback.var_febfd0 waittilltimeout(1, #"movedone");
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		if(isdefined(silverback))
		{
			silverback playsound("zmb_doa_ai_silverback_vocal_roar_short");
		}
		waitframe(1);
	}
	if(isdefined(silverback))
	{
		silverback delete();
	}
	if(isdefined(org))
	{
		org namespace_83eb6304::function_3ecfde67("wild_portal_radial_burst");
		org namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_burst");
		wait(1);
		org namespace_83eb6304::function_3ecfde67("lightningStrike");
		org namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		if(isdefined(org))
		{
			org delete();
		}
	}
	wait(1);
	level flag::clear("arena_hold_banner_presentation");
	level notify(#"hash_53cf824d8cd53237");
	if(isdefined(bombmodel))
	{
		bombmodel namespace_83eb6304::function_3ecfde67("monkey_detonate");
		bombmodel namespace_83eb6304::turnofffx("bombFuse");
		bombmodel namespace_e32bb68::function_ae271c0b("evt_doa_teleporter_bomb_fuse_lp");
		bombmodel namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_bomb_explo");
		bombmodel namespace_ec06fe4a::function_8c808737();
		bombmodel thread namespace_ec06fe4a::function_52afe5df(0.5);
	}
}

/*
	Name: function_dbe90b58
	Namespace: namespace_8b9bbbb3
	Checksum: 0xE9523528
	Offset: 0xA5F8
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function function_dbe90b58()
{
	self endon(#"death");
	dir = 180;
	time = 0.4;
	while(true)
	{
		self rotateto(self.angles + (0, dir, 0), time);
		wait(time);
		time = math::clamp(time * 0.78, 0.05, 1);
	}
}

/*
	Name: function_2a6cdb09
	Namespace: namespace_8b9bbbb3
	Checksum: 0x1EA4797B
	Offset: 0xA6A8
	Size: 0x198
	Parameters: 0
	Flags: None
*/
function function_2a6cdb09()
{
	players = getplayers();
	foreach(player in players)
	{
		player.doa.var_57b93c27 = 1;
		if(sessionmodeisonlinegame() == 0)
		{
			continue;
		}
		if(player stats::function_f94325d3() == 0)
		{
			continue;
		}
		player.doa.var_25f4de97 = player stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_191ee9b05c5a28d0");
		var_515ca345 = player stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_37fcc31e34bbeb9e");
		if(!isdefined(var_515ca345) || var_515ca345 > 0)
		{
			player.doa.var_57b93c27 = 0;
			continue;
		}
		uploadstats(player);
	}
}

