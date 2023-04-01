#using script_10034e69dca1cdbd;
#using script_106f162b6414fd57;
#using script_1254ac024174d9c0;
#using scripts\zm_common\trials\zm_trial_give_reward.gsc;
#using script_1496ada77dc2f2e2;
#using script_16ae23054b7712ef;
#using script_1827ef4caab1c237;
#using scripts\zm_common\trials\zm_trial_reset_loadout.gsc;
#using script_21ae8fb2d5ff7b5e;
#using script_225941405db7c1fd;
#using scripts\zm_common\zm_trial_util.gsc;
#using script_27d214e32f50853d;
#using scripts\zm_common\trials\zm_trial_no_sprint.gsc;
#using script_35d3717bf2cbee8f;
#using script_3657077a08b7f19e;
#using script_3688d332e17e9ac1;
#using script_368f7b7c47acabfe;
#using script_37e85b94c4152eae;
#using script_3c5fdcb080338059;
#using script_444bc5b4fa0fe14f;
#using script_457926d744ac1e76;
#using script_460f2e04fb3cff8a;
#using script_4aeb3279b6b23a91;
#using script_512d27609721ec85;
#using scripts\zm_common\trials\zm_trial_no_ads.gsc;
#using script_524d77ac3166c2bb;
#using script_536485e2fdf72e34;
#using script_559aef57a0fe3c60;
#using script_567f1ada8fe29a1c;
#using scripts\zm_common\trials\zm_trial_weapon_rotation.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using script_62945b40585a6812;
#using scripts\zm_common\trials\zm_trial_timeout.gsc;
#using script_68cf49837639e4f1;
#using script_6951ea86fdae9ae0;
#using script_698dd790cdc4965f;
#using scripts\zm_common\trials\zm_trial_use_magicbox.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using script_6d813fcbc979603a;
#using script_6ef496a1b77e83a4;
#using scripts\zm_common\trials\zm_trial_no_powerups.gsc;
#using script_7299aefe4149ed5d;
#using script_75f53105a210f2f7;
#using script_760b801e43fe3017;
#using script_770e34dfe9b07f3c;
#using script_7828033bc0ecda72;
#using script_7b843bf90a032750;
#using script_7baf2dd093830ed1;
#using script_c65026898539e6d;
#using script_db06eb511bd9b36;
#using script_e56ea76d6c36d39;
#using script_e59b4cddfde38fe;
#using script_fb16bd158a3e3e7;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_game_module.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace ztrials;

/*
	Name: function_423e7f82
	Namespace: ztrials
	Checksum: 0xBBC80965
	Offset: 0x2F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_423e7f82()
{
	level notify(231007137);
}

/*
	Name: main
	Namespace: ztrials
	Checksum: 0xDB5C5905
	Offset: 0x310
	Size: 0x164
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &zm_round_logic::round_start;
	level.var_57cc29f3 = &function_491101ba;
	level.var_d0b54199 = &function_b8839207;
	level.var_9093a47e = &function_b8839207;
	level.round_end_custom_logic = &function_61fd0e87;
	level.round_number = 0;
	level.var_df8480a0 = 0;
	level flag::init(#"ztrial", 1);
	callback::on_connect(&function_8277ff43);
	level._supress_survived_screen = 1;
}

/*
	Name: levelinit
	Namespace: ztrials
	Checksum: 0x789C63A2
	Offset: 0x480
	Size: 0x164
	Parameters: 1
	Flags: Event
*/
event levelinit(eventstruct)
{
	var_189d26ca = "";
	/#
		var_189d26ca = getdvarstring(#"hash_14ee5e66e7bb1ed7");
	#/
	var_3b363b7a = getgametypesetting(#"zmtrialsvariant");
	if(isdefined(var_3b363b7a) && var_3b363b7a > 0)
	{
		var_189d26ca = (util::get_map_name() + "_variant_") + var_3b363b7a;
	}
	else if(var_189d26ca == "")
	{
		var_189d26ca = util::get_map_name() + "_default";
	}
	/#
		assert(var_189d26ca != "", "");
	#/
	level.var_6d87ac05 = zm_trial::function_d02ffd(var_189d26ca);
	/#
		assert(isdefined(level.var_6d87ac05), "");
	#/
	/#
		function_9a6b2309();
	#/
}

/*
	Name: onprecachegametype
	Namespace: ztrials
	Checksum: 0x2F0CDC76
	Offset: 0x5F0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: ztrials
	Checksum: 0xFFD2B5C8
	Offset: 0x618
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	zm_behavior::function_70a657d8();
	zm_cleanup::function_70a657d8();
	zm_spawner::init();
	zm_behavior::function_8ac3bea9();
	zm_cleanup::function_8ac3bea9();
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
	changeadvertisedstatus(0);
}

/*
	Name: function_8277ff43
	Namespace: ztrials
	Checksum: 0x1E3AE1F2
	Offset: 0x7E0
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_8277ff43()
{
	self endon(#"disconnect");
	level flag::wait_till("start_zombie_round_logic");
	waitframe(1);
	self zm_laststand::function_3d685b5f(0);
}

/*
	Name: function_491101ba
	Namespace: ztrials
	Checksum: 0xB170DBBF
	Offset: 0x840
	Size: 0x2AE
	Parameters: 1
	Flags: Private
*/
function private function_491101ba(player)
{
	if(player hasperk(#"hash_5b141f82a55645a9") && !is_true(player.var_a4630f64))
	{
		return true;
	}
	if(level flag::get("round_reset"))
	{
		return true;
	}
	var_57807cdc = [];
	foreach(player in getplayers())
	{
		if(!isdefined(var_57807cdc))
		{
			var_57807cdc = [];
		}
		else if(!isarray(var_57807cdc))
		{
			var_57807cdc = array(var_57807cdc);
		}
		if(!isinarray(var_57807cdc, player))
		{
			var_57807cdc[var_57807cdc.size] = player;
		}
	}
	if(var_57807cdc.size > 1)
	{
		zm_trial::fail(#"hash_60e5e8df8709ad64", var_57807cdc);
	}
	else
	{
		if(var_57807cdc.size == 1)
		{
			zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
		}
		else
		{
			if(!isdefined(var_57807cdc))
			{
				var_57807cdc = [];
			}
			else if(!isarray(var_57807cdc))
			{
				var_57807cdc = array(var_57807cdc);
			}
			if(!isinarray(var_57807cdc, player))
			{
				var_57807cdc[var_57807cdc.size] = player;
			}
			zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
		}
	}
	if(level flag::get("round_reset"))
	{
		return true;
	}
	/#
		assert(level flag::get(#"hash_6acab8bde7078239"));
	#/
	return false;
}

/*
	Name: function_61fd0e87
	Namespace: ztrials
	Checksum: 0x15DB5BCF
	Offset: 0xAF8
	Size: 0xF4
	Parameters: 0
	Flags: Private
*/
function private function_61fd0e87()
{
	/#
		assert(isdefined(level.var_6d87ac05));
	#/
	if(!level flag::get("round_reset") && level.round_number >= level.var_6d87ac05.rounds.size)
	{
		level thread zm_trial::function_361e2cb0();
	}
	if(!level flag::get("round_reset") && !level flag::get(#"hash_6acab8bde7078239"))
	{
		zm_trial_util::function_96e10d88(1);
		wait(3);
	}
}

/*
	Name: function_b8839207
	Namespace: ztrials
	Checksum: 0x5129F9EB
	Offset: 0xBF8
	Size: 0xEE
	Parameters: 2
	Flags: Private
*/
function private function_b8839207(e_door, n_cost)
{
	level flag::wait_till("start_zombie_round_logic");
	e_door notify(#"hash_42c191c31ed08a4");
	e_door endon(#"hash_42c191c31ed08a4", #"death");
	while(true)
	{
		if(n_cost > 0 && namespace_497ab7da::is_active())
		{
			e_door sethintstring(#"hash_55d25caf8f7bbb2f");
		}
		else
		{
			e_door zm_utility::set_hint_string(self, "default_buy_door", n_cost);
		}
		wait(1);
	}
}

/*
	Name: complete_current_round
	Namespace: ztrials
	Checksum: 0x3B825EE8
	Offset: 0xCF0
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private complete_current_round()
{
	/#
		level.devcheater = 1;
		level.zombie_total = 0;
		level notify(#"kill_round");
		wait(1);
		zombies = getaiteamarray(level.zombie_team);
		if(isdefined(zombies))
		{
			for(i = 0; i < zombies.size; i++)
			{
				if(is_true(zombies[i].ignore_devgui_death))
				{
					continue;
				}
				zombies[i] dodamage(zombies[i].health + 666, zombies[i].origin);
			}
		}
	#/
}

/*
	Name: function_1201b5da
	Namespace: ztrials
	Checksum: 0x112C9A79
	Offset: 0xDE8
	Size: 0x186
	Parameters: 1
	Flags: Private
*/
function private function_1201b5da(medal)
{
	/#
		round = undefined;
		switch(medal)
		{
			case "gold":
			{
				round = 30;
				break;
			}
			case "silver":
			{
				round = 20;
				break;
			}
			case "hash_5a4a42ab8880ab1":
			{
				round = 10;
				break;
			}
			default:
			{
				/#
					assert(0);
				#/
				break;
			}
		}
		/#
			assert(isdefined(round));
		#/
		var_48c6ec2e = level.var_6d87ac05.rounds[round - 1];
		/#
			assert(isdefined(var_48c6ec2e));
		#/
		for(i = 0; i < var_48c6ec2e.challenges.size; i++)
		{
			challenge = var_48c6ec2e.challenges[i];
			if(challenge.name == #"give_reward")
			{
				return challenge;
			}
		}
		/#
			assert(0);
		#/
		return undefined;
	#/
}

/*
	Name: function_9a6b2309
	Namespace: ztrials
	Checksum: 0xF3B3DC94
	Offset: 0xF78
	Size: 0x87E
	Parameters: 0
	Flags: Private
*/
function private function_9a6b2309()
{
	/#
		/#
			assert(isdefined(level.var_6d87ac05));
		#/
		foreach(var_48c6ec2e in level.var_6d87ac05.rounds)
		{
			adddebugcommand((((((("" + var_48c6ec2e.round) + "") + function_9e72a96(var_48c6ec2e.name) + "") + var_48c6ec2e.round) + "") + var_48c6ec2e.round) + "");
		}
		for(i = 0; i <= 3; i++)
		{
			adddebugcommand(((("" + i) + "") + i) + "");
		}
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		while(true)
		{
			string = getdvarstring(#"hash_57e97658cd1d89e2", "");
			cmd = strtok(string, "");
			if(cmd.size > 0)
			{
				round_number = int(cmd[0]);
				if(isdefined(level.var_b9714a5d))
				{
					[[level.var_b9714a5d]](round_number);
				}
				level thread zm_game_module::zombie_goto_round(round_number);
				setdvar(#"hash_57e97658cd1d89e2", "");
			}
			string = getdvarstring(#"hash_25a4cfc19b09ae41", "");
			cmd = strtok(string, "");
			if(cmd.size > 0)
			{
				strikes = int(cmd[0]);
				if(strikes == 3)
				{
					zm_trial::function_fe2ecb6(strikes - 1);
					zm_trial::fail();
				}
				else
				{
					zm_trial::function_fe2ecb6(strikes);
				}
				setdvar(#"hash_25a4cfc19b09ae41", "");
			}
			string = getdvarstring(#"hash_2446ebd1d15f0dab", "");
			cmd = strtok(string, "");
			if(cmd.size > 0)
			{
				complete_current_round();
				setdvar(#"hash_2446ebd1d15f0dab", "");
			}
			string = getdvarstring(#"hash_5a32209acb1f54a0", "");
			cmd = strtok(string, "");
			if(cmd.size > 0)
			{
				zm_trial::fail(undefined, getplayers());
				setdvar(#"hash_5a32209acb1f54a0", "");
			}
			string = getdvarstring(#"hash_1576c65ebdf43de0", "");
			cmd = strtok(string, "");
			if(cmd.size > 0)
			{
				foreach(player in getplayers())
				{
					player zm_stats::function_49469f35("", 0);
					player zm_stats::function_49469f35("", 0);
					player zm_stats::function_49469f35("", 0);
				}
				level.var_ee7ca64 = [];
				setdvar(#"hash_1576c65ebdf43de0", "");
			}
			string = getdvarstring(#"hash_2f6ef50454652bf2", "");
			cmd = strtok(string, "");
			if(cmd.size > 0)
			{
				challenge = function_1201b5da(cmd[0]);
				foreach(player in getplayers())
				{
					player luinotifyevent(#"hash_8d33c3be569f08", 1, challenge.row);
					stat_name = challenge.params[1];
					curr_time = gettime();
					player zm_stats::function_49469f35(stat_name, curr_time);
				}
				setdvar(#"hash_2f6ef50454652bf2", "");
			}
			if(getdvarint(#"hash_145033f5271f2651", 0) == 1)
			{
				zm_trial_util::function_9c1092f6();
				setdvar(#"hash_145033f5271f2651", 0);
			}
			waitframe(1);
		}
	#/
}

