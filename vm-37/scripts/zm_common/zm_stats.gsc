#using script_345bb77d6298356c;
#using script_47fb62300ac0bd60;
#using script_6021ce59143452c3;
#using script_68d2ee1489345a1d;
#using script_6ce38ab036223e6e;
#using script_ab890501c40b73c;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_stats;

/*
	Name: function_89f2df9
	Namespace: zm_stats
	Checksum: 0xF4391381
	Offset: 0x9E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_stats", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_stats
	Checksum: 0xF9F976E1
	Offset: 0xA30
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.player_stats_init = &player_stats_init;
	level.add_client_stat = &add_client_stat;
	level.increment_client_stat = &increment_client_stat;
	level.var_4e390265 = &function_7741345e;
	if(!level.rankedmatch)
	{
		level.zm_disable_recording_stats = 1;
	}
	if(!getdvarint(#"hash_83577689a2e58b3", 0))
	{
		setdvar(#"hash_83577689a2e58b3", 180);
	}
	function_a8758411();
}

/*
	Name: function_a8758411
	Namespace: zm_stats
	Checksum: 0x3C23AFC5
	Offset: 0xB18
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_a8758411()
{
	if(getdvarint(#"hash_27ff853067d7c38c", 0))
	{
		var_821f7fa0 = getdvarint(#"hash_74323bf8006c003f", 0);
		if(var_821f7fa0)
		{
			function_94335f4a(var_821f7fa0);
		}
		var_a4aebab9 = getdvarint(#"hash_4ef2b14c3bfef02a", 0);
		if(var_a4aebab9)
		{
			function_e8c496dd(var_a4aebab9);
		}
	}
}

/*
	Name: player_stats_init
	Namespace: zm_stats
	Checksum: 0x95022948
	Offset: 0xBE0
	Size: 0x1B44
	Parameters: 0
	Flags: Linked
*/
function player_stats_init()
{
	self callback::add_callback(#"hash_41c107b83320aba2", &function_1a222bee);
	self globallogic_score::initpersstat(#"kills", 0);
	self globallogic_score::initpersstat(#"hash_6013bccb7a4274b6", 0);
	self globallogic_score::initpersstat(#"wonder_weapon_kills", 0);
	self globallogic_score::initpersstat(#"damagedone", 0);
	self globallogic_score::initpersstat(#"suicides", 0);
	self.suicides = self globallogic_score::getpersstat(#"suicides");
	self globallogic_score::initpersstat(#"downs", 0);
	self.downs = self globallogic_score::getpersstat(#"downs");
	self globallogic_score::initpersstat(#"revives", 0);
	self.revives = self globallogic_score::getpersstat(#"revives");
	self globallogic_score::initpersstat(#"perks_drank", 0);
	self globallogic_score::initpersstat(#"bgbs_chewed", 0);
	self globallogic_score::initpersstat(#"headshots", 0);
	self globallogic_score::initpersstat(#"special_weapon_used", 0);
	self globallogic_score::initpersstat(#"melee_kills", 0);
	self globallogic_score::initpersstat(#"grenade_kills", 0);
	self globallogic_score::initpersstat(#"doors_purchased", 0);
	self globallogic_score::initpersstat(#"distance_traveled", 0);
	self.distance_traveled = self globallogic_score::getpersstat(#"distance_traveled");
	self globallogic_score::initpersstat(#"total_shots", 0);
	self.total_shots = self globallogic_score::getpersstat(#"total_shots");
	self globallogic_score::initpersstat(#"hits", 0);
	self.hits = self globallogic_score::getpersstat(#"hits");
	self globallogic_score::initpersstat(#"hits_taken", 0);
	self globallogic_score::initpersstat(#"misses", 0);
	self.misses = self globallogic_score::getpersstat(#"misses");
	self globallogic_score::initpersstat(#"deaths", 0);
	self.deaths = self globallogic_score::getpersstat(#"deaths");
	self globallogic_score::initpersstat(#"boards", 0);
	self globallogic_score::initpersstat(#"failed_revives", 0);
	self globallogic_score::initpersstat(#"sacrifices", 0);
	self globallogic_score::initpersstat(#"failed_sacrifices", 0);
	self globallogic_score::initpersstat(#"drops", 0);
	self globallogic_score::initpersstat(#"nuke_pickedup", 0);
	self globallogic_score::initpersstat(#"insta_kill_pickedup", 0);
	self globallogic_score::initpersstat(#"full_ammo_pickedup", 0);
	self globallogic_score::initpersstat(#"hash_65472fa120ebce1c", 0);
	self globallogic_score::initpersstat(#"double_points_pickedup", 0);
	self globallogic_score::initpersstat(#"hash_685c28b32c045f5c", 0);
	self globallogic_score::initpersstat(#"hash_17cd6f2f7e794f3d", 0);
	self globallogic_score::initpersstat(#"meat_stink_pickedup", 0);
	self globallogic_score::initpersstat(#"carpenter_pickedup", 0);
	self globallogic_score::initpersstat(#"fire_sale_pickedup", 0);
	self globallogic_score::initpersstat(#"hash_27399de28b76c5c6", 0);
	self globallogic_score::initpersstat(#"minigun_pickedup", 0);
	self globallogic_score::initpersstat(#"island_seed_pickedup", 0);
	self globallogic_score::initpersstat(#"hash_cdafe5cd6299b0c", 0);
	self globallogic_score::initpersstat(#"hash_3ec2a334a55d8215", 0);
	self globallogic_score::initpersstat(#"hash_7d6f5e2da0f7af67", 0);
	self globallogic_score::initpersstat(#"hash_636a6750788b3df0", 0);
	self globallogic_score::initpersstat(#"hash_29b45601d5e0d53f", 0);
	self globallogic_score::initpersstat(#"hash_79071dc310fc378f", 0);
	self globallogic_score::initpersstat(#"hash_1b192689f4c8c402", 0);
	self globallogic_score::initpersstat(#"bonus_points_team_pickedup", 0);
	self globallogic_score::initpersstat(#"ww_grenade_pickedup", 0);
	self globallogic_score::initpersstat(#"use_magicbox", 0);
	self globallogic_score::initpersstat(#"grabbed_from_magicbox", 0);
	self globallogic_score::initpersstat(#"use_perk_random", 0);
	self globallogic_score::initpersstat(#"grabbed_from_perk_random", 0);
	self globallogic_score::initpersstat(#"use_pap", 0);
	self globallogic_score::initpersstat(#"hash_1bcba3bbca05dee0", 0);
	self globallogic_score::initpersstat(#"hash_7f4d9be7afc10d0b", 0);
	self globallogic_score::initpersstat(#"hash_7f4d9ce7afc10ebe", 0);
	self globallogic_score::initpersstat(#"hash_7f4d9de7afc11071", 0);
	self globallogic_score::initpersstat(#"hash_731ce11cd7aabf49", 0);
	self globallogic_score::initpersstat(#"hash_28a20f25e5d2675b", 0);
	self globallogic_score::initpersstat(#"hash_3000f7041705064b", 0);
	self globallogic_score::initpersstat(#"hash_388f4347e28d7ab7", 0);
	self globallogic_score::initpersstat(#"hash_4241552ec3f4078b", 0);
	self globallogic_score::initpersstat(#"hash_52fec240a96cc85a", 0);
	self globallogic_score::initpersstat(#"hash_63236a6a7db7369c", 0);
	self globallogic_score::initpersstat(#"specialty_armorvest_drank", 0);
	self globallogic_score::initpersstat(#"specialty_quickrevive_drank", 0);
	self globallogic_score::initpersstat(#"specialty_fastreload_drank", 0);
	self globallogic_score::initpersstat(#"specialty_additionalprimaryweapon_drank", 0);
	self globallogic_score::initpersstat(#"specialty_staminup_drank", 0);
	self globallogic_score::initpersstat(#"specialty_doubletap2_drank", 0);
	self globallogic_score::initpersstat(#"specialty_widowswine_drank", 0);
	self globallogic_score::initpersstat(#"specialty_deadshot_drank", 0);
	self globallogic_score::initpersstat(#"specialty_electriccherry_drank", 0);
	self globallogic_score::initpersstat(#"hash_6fd20bc72bf9e498", 0);
	self globallogic_score::initpersstat(#"hash_583ff5f66fd10104", 0);
	self globallogic_score::initpersstat(#"hash_3cbaa7dc09e06bb7", 0);
	self globallogic_score::initpersstat(#"hash_539966dfa171abec", 0);
	self globallogic_score::initpersstat(#"hash_165df073a0d7a3c3", 0);
	self globallogic_score::initpersstat(#"hash_5061c06e56f8d741", 0);
	self globallogic_score::initpersstat(#"hash_3c548389d8524d38", 0);
	self globallogic_score::initpersstat(#"specialty_phdflopper_drank", 0);
	self globallogic_score::initpersstat(#"hash_6d567aa9deb5cb44", 0);
	self globallogic_score::initpersstat(#"hash_13a7a122d86f219b", 0);
	self globallogic_score::initpersstat(#"hash_1a58fe25d88d2b54", 0);
	self globallogic_score::initpersstat(#"hash_3d9b732ca303132b", 0);
	self globallogic_score::initpersstat(#"hash_48288866afddc0d4", 0);
	self globallogic_score::initpersstat(#"hash_1dc1fbd3fd2fe493", 0);
	self globallogic_score::initpersstat(#"hash_49cc8e6486122824", 0);
	self globallogic_score::initpersstat(#"hash_382854bc103fd553", 0);
	self globallogic_score::initpersstat(#"hash_4419d00a9f04f866", 0);
	self globallogic_score::initpersstat(#"hash_5a42a4d4accf00bf", 0);
	self globallogic_score::initpersstat(#"hash_dd2dc50d66eb166", 0);
	self globallogic_score::initpersstat(#"hash_79d41974c40c126e", 0);
	self globallogic_score::initpersstat(#"hash_5c9c943cd0cffc65", 0);
	self globallogic_score::initpersstat(#"hash_7d98fe4413e871a4", 0);
	self globallogic_score::initpersstat(#"hash_402bebef02213c02", 0);
	self globallogic_score::initpersstat(#"hash_2a63229e9bf23baa", 0);
	self globallogic_score::initpersstat(#"hash_41476f0bb1f7c683", 0);
	self globallogic_score::initpersstat(#"hash_254f75482929079b", 0);
	self globallogic_score::initpersstat(#"hash_3bd6bf00e8c71a5d", 0);
	self globallogic_score::initpersstat(#"hash_310ed4181d9aeddc", 0);
	self globallogic_score::initpersstat(#"hash_6505f09a128cba8d", 0);
	self globallogic_score::initpersstat(#"claymores_planted", 0);
	self globallogic_score::initpersstat(#"claymores_pickedup", 0);
	self globallogic_score::initpersstat(#"bouncingbetty_planted", 0);
	self globallogic_score::initpersstat(#"bouncingbetty_pickedup", 0);
	self globallogic_score::initpersstat(#"bouncingbetty_devil_planted", 0);
	self globallogic_score::initpersstat(#"bouncingbetty_devil_pickedup", 0);
	self globallogic_score::initpersstat(#"bouncingbetty_holly_planted", 0);
	self globallogic_score::initpersstat(#"bouncingbetty_holly_pickedup", 0);
	self globallogic_score::initpersstat(#"ballistic_knives_pickedup", 0);
	self globallogic_score::initpersstat(#"wallbuy_weapons_purchased", 0);
	self globallogic_score::initpersstat(#"ammo_purchased", 0);
	self globallogic_score::initpersstat(#"upgraded_ammo_purchased", 0);
	self globallogic_score::initpersstat(#"shields_purchased", 0);
	self globallogic_score::initpersstat(#"power_turnedon", 0);
	self globallogic_score::initpersstat(#"power_turnedoff", 0);
	self globallogic_score::initpersstat(#"planted_buildables_pickedup", 0);
	self globallogic_score::initpersstat(#"buildables_built", 0);
	self globallogic_score::initpersstat(#"time_played_total", 0);
	self globallogic_score::initpersstat(#"weighted_rounds_played", 0);
	self globallogic_score::initpersstat(#"zspiders_killed", 0);
	self globallogic_score::initpersstat(#"zthrashers_killed", 0);
	self globallogic_score::initpersstat(#"zraps_killed", 0);
	self globallogic_score::initpersstat(#"zwasp_killed", 0);
	self globallogic_score::initpersstat(#"zsentinel_killed", 0);
	self globallogic_score::initpersstat(#"zraz_killed", 0);
	self globallogic_score::initpersstat(#"zdog_rounds_finished", 0);
	self globallogic_score::initpersstat(#"zdog_rounds_lost", 0);
	self globallogic_score::initpersstat(#"killed_by_zdog", 0);
	self globallogic_score::initpersstat(#"killed_by_blightfather", 0);
	self globallogic_score::initpersstat(#"killed_by_brutus", 0);
	self globallogic_score::initpersstat(#"killed_by_gladiator", 0);
	self globallogic_score::initpersstat(#"killed_by_stoker", 0);
	self globallogic_score::initpersstat(#"killed_by_tiger", 0);
	self globallogic_score::initpersstat(#"killed_by_catalyst", 0);
	self globallogic_score::initpersstat(#"killed_by_catalyst_electric", 0);
	self globallogic_score::initpersstat(#"killed_by_catalyst_water", 0);
	self globallogic_score::initpersstat(#"killed_by_catalyst_plasma", 0);
	self globallogic_score::initpersstat(#"killed_by_catalyst_corrosive", 0);
	self globallogic_score::initpersstat(#"killed_by_nova_crawler", 0);
	self globallogic_score::initpersstat(#"killed_by_werewolf", 0);
	self globallogic_score::initpersstat(#"killed_by_nosferatu", 0);
	self globallogic_score::initpersstat(#"killed_by_crimson_nosferatu", 0);
	self globallogic_score::initpersstat(#"blightfathers_killed", 0);
	self globallogic_score::initpersstat(#"brutuses_killed", 0);
	self globallogic_score::initpersstat(#"gladiators_killed", 0);
	self globallogic_score::initpersstat(#"stokers_killed", 0);
	self globallogic_score::initpersstat(#"tigers_killed", 0);
	self globallogic_score::initpersstat(#"catalysts_killed", 0);
	self globallogic_score::initpersstat(#"catalyst_electrics_killed", 0);
	self globallogic_score::initpersstat(#"catalyst_waters_killed", 0);
	self globallogic_score::initpersstat(#"catalyst_plasmas_killed", 0);
	self globallogic_score::initpersstat(#"catalyst_corrosives_killed", 0);
	self globallogic_score::initpersstat(#"nova_crawlers_killed", 0);
	self globallogic_score::initpersstat(#"zdogs_killed", 0);
	self globallogic_score::initpersstat(#"werewolves_killed", 0);
	self globallogic_score::initpersstat(#"nosferatus_killed", 0);
	self globallogic_score::initpersstat(#"crimson_nosferatus_killed", 0);
	self globallogic_score::initpersstat(#"bats_killed", 0);
	self globallogic_score::initpersstat(#"cheat_too_many_weapons", 0);
	self globallogic_score::initpersstat(#"cheat_out_of_playable", 0);
	self globallogic_score::initpersstat(#"cheat_too_friendly", 0);
	self globallogic_score::initpersstat(#"cheat_total", 0);
	self globallogic_score::initpersstat(#"castle_tram_token_pickedup", 0);
	self globallogic_score::initpersstat(#"prison_tomahawk_acquired", 0);
	self globallogic_score::initpersstat(#"prison_brutus_killed", 0);
	self globallogic_score::initpersstat(#"prison_ee_spoon_acquired", 0);
	self globallogic_score::initpersstat(#"prison_fan_trap_used", 0);
	self globallogic_score::initpersstat(#"prison_acid_trap_used", 0);
	self globallogic_score::initpersstat(#"prison_spinning_trap_used", 0);
	self globallogic_score::initpersstat(#"towers_acid_trap_built_ra", 0);
	self globallogic_score::initpersstat(#"towers_acid_trap_built_danu", 0);
	self globallogic_score::initpersstat(#"towers_acid_trap_built_odin", 0);
	self globallogic_score::initpersstat(#"towers_acid_trap_built_zeus", 0);
	self globallogic_score::initpersstat(#"total_points", 0);
	self globallogic_score::initpersstat(#"rounds", 0);
	if(level.resetplayerscoreeveryround)
	{
		self.pers[#"score"] = 0;
	}
	self.pers[#"score"] = level.player_starting_points;
	self.score = self.pers[#"score"];
	self incrementplayerstat("score", self.score);
	self add_map_stat("score", self.score);
	self.score_total = self.score;
	self.var_f22ee5e = self.score_total;
	self globallogic_score::initpersstat(#"zteam", 0);
	if(isdefined(level.level_specific_stats_init))
	{
		[[level.level_specific_stats_init]]();
	}
	if(!isdefined(self.stats_this_frame))
	{
		self.stats_this_frame = [];
	}
	self globallogic_score::initpersstat(#"zm_daily_challenge_ingame_time", 1, 1);
	self add_global_stat("ZM_DAILY_CHALLENGE_GAMES_PLAYED", 1);
	if(isdefined(level.var_1aa5a6d6))
	{
		self stats::set_stat(#"hash_1c539a1b16b48b16", level.var_1aa5a6d6);
	}
	else
	{
		self stats::set_stat(#"hash_1c539a1b16b48b16", 0);
	}
	if(getdvarint(#"hash_27ff853067d7c38c", 0))
	{
		var_87b499fb = self stats::get_stat(#"hash_18e3320ccf4091e5", #"hash_487f0fce798b3a4b");
		var_8962d9b1 = (isdefined(level.var_d479261a) ? level.var_d479261a : 0);
		self stats::set_stat(#"hash_18e3320ccf4091e5", #"hash_487f0fce798b3a4b", var_8962d9b1);
		var_327c034e = self stats::get_stat(#"hash_18e3320ccf4091e5", #"hash_6ad32b22445c4828");
		var_d0ad64e3 = getutc();
		var_222b02a1 = var_d0ad64e3 - var_327c034e;
		var_ee21b34b = 86400;
		if(var_87b499fb !== var_8962d9b1 || var_327c034e == 0 || var_222b02a1 > var_ee21b34b)
		{
			self stats::set_stat(#"hash_18e3320ccf4091e5", #"progress", 0);
			self stats::set_stat(#"hash_18e3320ccf4091e5", #"hash_6ad32b22445c4828", var_d0ad64e3);
		}
	}
	if(getdvarint(#"hash_11da02ca40639de5", 0))
	{
		self zm_callings::function_f3393d6a();
	}
}

/*
	Name: update_players_stats_at_match_end
	Namespace: zm_stats
	Checksum: 0xC0D3BD45
	Offset: 0x2730
	Size: 0xCDC
	Parameters: 1
	Flags: Linked
*/
function update_players_stats_at_match_end(players)
{
	var_600fbe9f = zm_utility::get_round_number();
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(isbot(player))
		{
			continue;
		}
		player function_9daadcaa("total_points", player.score_total);
		player function_9daadcaa("HIGHEST_ROUND_REACHED", var_600fbe9f);
		if(isdefined(level.var_9b7bd0e8))
		{
			player function_9daadcaa("ELITES_ELIMINATED", level.var_9b7bd0e8);
		}
	}
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	game_mode = util::function_5df4294();
	game_mode_group = level.scr_zm_ui_gametype_group;
	map_location_name = level.scr_zm_map_start_location;
	zm_score::function_bc9de425();
	if(map_location_name == "")
	{
		map_location_name = "default";
	}
	recordmatchsummaryzombieendgamedata(game_mode_group, game_mode, map_location_name, var_600fbe9f);
	newtime = gettime();
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(isbot(player))
		{
			continue;
		}
		distance = player get_stat_distance_traveled();
		player stats::function_dad108fa(#"distance_traveled", distance);
		player incrementplayerstat(#"time_played_total", player.pers[#"time_played_total"]);
		player function_a6efb963(#"time_played_total", player.pers[#"time_played_total"]);
		player add_map_stat(#"time_played_total", player.pers[#"time_played_total"]);
		recordplayermatchend(player);
		recordplayerstats(player, "present_at_end", 1);
		player zm_weapons::updateweapontimingszm(newtime);
		if(isdefined(level._game_module_stat_update_func))
		{
			player [[level._game_module_stat_update_func]]();
		}
		if(isdefined(player.score_total))
		{
			old_high_score = player get_global_stat("score");
			if(!isdefined(old_high_score) || player.score_total > old_high_score)
			{
				player set_global_stat("score", player.score_total);
			}
			player function_ab006044("TOTAL_POINTS", player.score_total);
			player function_1b763e4("HIGHEST_SCORE", player.score_total);
			player function_d4e0d242(#"hash_4219bfdfa1237b29", player.score_total);
			player set_global_stat("total_points", player.score_total);
		}
		player function_1b763e4("HIGHEST_TEAM_SCORE", level.score_total);
		function_42677837("TEAM_SCORE", level.score_total);
		player function_9daadcaa("team_score", level.score_total);
		player set_global_stat("rounds", var_600fbe9f);
		player function_9daadcaa("rounds", var_600fbe9f);
		total_rounds_survived = var_600fbe9f - 1;
		if(zm_trial::function_b47f6aba() && is_true(level.var_7fe57c6b))
		{
			total_rounds_survived = level.round_number;
			player zm_challenges::function_bf0be8f1();
		}
		player function_9daadcaa("TOTAL_ROUNDS_SURVIVED", total_rounds_survived);
		if(level.onlinegame)
		{
			player highwater_global_stat("HIGHEST_ROUND_REACHED", var_600fbe9f);
			player highwater_map_stat("HIGHEST_ROUND_REACHED", var_600fbe9f);
			player function_d4e0d242("HIGHEST_ROUND_REACHED", var_600fbe9f);
			player function_1b763e4("HIGHEST_ROUND_REACHED", var_600fbe9f);
			player function_e8bfebb("HIGHEST_ROUND_REACHED", var_600fbe9f);
			player function_d4e0d242("MOST_KILLS", player.kills);
			player function_1b763e4("MOST_KILLS", player.kills);
			player function_e8bfebb("MOST_KILLS", player.kills);
			player function_d4e0d242("MOST_KILLS_ELITE", player.pers[#"hash_6013bccb7a4274b6"]);
			player function_1b763e4("MOST_KILLS_ELITE", player.pers[#"hash_6013bccb7a4274b6"]);
			player function_1b763e4("MOST_HEADSHOTS", player.headshots);
			player function_e8bfebb("MOST_HEADSHOTS", player.headshots);
			player function_f7885b2b("HIGHEST_ROUND_REACHED", var_600fbe9f);
			player function_f7885b2b("MOST_KILLS", player.kills);
			player function_f7885b2b("MOST_HEADSHOTS", player.headshots);
			player add_global_stat("TOTAL_ROUNDS_SURVIVED", total_rounds_survived);
			player add_map_stat("TOTAL_ROUNDS_SURVIVED", total_rounds_survived);
			player function_ab006044("TOTAL_ROUNDS_SURVIVED", total_rounds_survived);
			player function_a6efb963("TOTAL_ROUNDS_SURVIVED", total_rounds_survived);
			player function_9288c79b("TOTAL_ROUNDS_SURVIVED", total_rounds_survived);
			player add_global_stat("TOTAL_GAMES_PLAYED", 1);
			player add_map_stat("TOTAL_GAMES_PLAYED", 1);
			player function_ab006044("TOTAL_GAMES_PLAYED", 1);
			player function_a6efb963("TOTAL_GAMES_PLAYED", 1);
			player function_9288c79b("TOTAL_GAMES_PLAYED", 1);
			if(zm_utility::function_c200446c())
			{
				player function_585da839(#"time_played_total", player.pers[#"time_played_total"]);
				player function_585da839(#"total_games_played", 1);
				player function_de5c64c9(#"hash_50dc15187c54967c", level.var_9b7bd0e8);
				player function_de5c64c9(#"most_kills", player.kills);
				player function_de5c64c9(#"highest_score", player.score_total);
				player function_de5c64c9(#"highest_round_reached", var_600fbe9f);
			}
			if(zm_utility::is_standard() && level.var_5caadd40 > 1)
			{
				player contracts::function_5b88297d(#"hash_64983d80a1a8a0bc");
				if(player.var_9fc3ee66 === 1)
				{
					player function_7bc347f6("RUSH_FIRST_PLACE_FINISHES");
					player function_f1a1191d("RUSH_FIRST_PLACE_FINISHES");
					player contracts::function_5b88297d(#"hash_2d05bf381b6a45be");
				}
			}
		}
		if(gamemodeismode(0))
		{
			player gamehistoryfinishmatch(4, 0, 0, 0, 0, 0);
			if(isdefined(player.pers[#"matchesplayedstatstracked"]))
			{
				gamemode = util::getcurrentgamemode();
				player globallogic::incrementmatchcompletionstat(gamemode, "played", "completed");
				if(isdefined(player.pers[#"matcheshostedstatstracked"]))
				{
					player globallogic::incrementmatchcompletionstat(gamemode, "hosted", "completed");
					player.pers[#"matcheshostedstatstracked"] = undefined;
				}
				player.pers[#"matchesplayedstatstracked"] = undefined;
			}
		}
		if(!isdefined(player.pers[#"previous_distance_traveled"]))
		{
			player.pers[#"previous_distance_traveled"] = 0;
		}
		distancethisround = int(player.pers[#"distance_traveled"] - player.pers[#"previous_distance_traveled"]);
		player.pers[#"previous_distance_traveled"] = player.pers[#"distance_traveled"];
		player incrementplayerstat("distance_traveled", distancethisround);
	}
}

/*
	Name: function_4dd876ad
	Namespace: zm_stats
	Checksum: 0xCCDCA979
	Offset: 0x3418
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function function_4dd876ad()
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || isbot(self))
	{
		return;
	}
	self highwater_global_stat("HIGHEST_ROUND_REACHED", level.round_number);
	self highwater_map_stat("HIGHEST_ROUND_REACHED", level.round_number);
	self function_d4e0d242("HIGHEST_ROUND_REACHED", level.round_number);
	self function_1b763e4("HIGHEST_ROUND_REACHED", level.round_number);
	self function_e8bfebb("HIGHEST_ROUND_REACHED", level.round_number);
	self function_1b763e4("MOST_KILLS", self.kills);
	self function_e8bfebb("MOST_KILLS", self.kills);
	self function_1b763e4("MOST_HEADSHOTS", self.headshots);
	self function_e8bfebb("MOST_HEADSHOTS", self.headshots);
	self function_f7885b2b("HIGHEST_ROUND_REACHED", level.round_number);
	self function_f7885b2b("MOST_KILLS", self.kills);
	self function_f7885b2b("MOST_HEADSHOTS", self.headshots);
	self function_1b763e4("HIGHEST_SCORE", self.score_total);
	self function_1b763e4("HIGHEST_TEAM_SCORE", level.score_total);
}

/*
	Name: update_playing_utc_time
	Namespace: zm_stats
	Checksum: 0x79F7AC5C
	Offset: 0x36A0
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function update_playing_utc_time(matchendutctime)
{
	current_days = int(matchendutctime / 86400);
	last_days = self get_global_stat("TIMESTAMPLASTDAY1");
	last_days = int(last_days / 86400);
	diff_days = current_days - last_days;
	timestamp_name = "";
	if(diff_days > 0)
	{
		for(i = 5; i > diff_days; i--)
		{
			timestamp_name = "TIMESTAMPLASTDAY" + (i - diff_days);
			timestamp_name_to = "TIMESTAMPLASTDAY" + i;
			timestamp_value = self get_global_stat(timestamp_name);
			self set_global_stat(timestamp_name_to, timestamp_value);
		}
		for(i = 2; i <= diff_days && i < 6; i++)
		{
			timestamp_name = "TIMESTAMPLASTDAY" + i;
			self set_global_stat(timestamp_name, 0);
		}
		self set_global_stat("TIMESTAMPLASTDAY1", matchendutctime);
	}
}

/*
	Name: survival_classic_custom_stat_update
	Namespace: zm_stats
	Checksum: 0x80F724D1
	Offset: 0x3858
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function survival_classic_custom_stat_update()
{
}

/*
	Name: grief_custom_stat_update
	Namespace: zm_stats
	Checksum: 0x80F724D1
	Offset: 0x3868
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function grief_custom_stat_update()
{
}

/*
	Name: get_global_stat
	Namespace: zm_stats
	Checksum: 0x9B0FF0B6
	Offset: 0x3878
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function get_global_stat(stat_name)
{
	return self stats::get_stat(#"playerstatslist", stat_name, #"statvalue");
}

/*
	Name: set_global_stat
	Namespace: zm_stats
	Checksum: 0x844BE360
	Offset: 0x38C0
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function set_global_stat(stat_name, value)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::set_stat(#"playerstatslist", stat_name, #"statvalue", value);
	/#
		var_ba1fb8c1 = self stats::get_stat(#"playerstatslist", stat_name, #"statvalue");
		println(((("" + self getentitynumber()) + "") + function_9e72a96(stat_name) + "") + var_ba1fb8c1);
	#/
}

/*
	Name: add_global_stat
	Namespace: zm_stats
	Checksum: 0x51349E61
	Offset: 0x39D0
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function add_global_stat(stat_name, value)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(#"playerstatslist", stat_name, #"statvalue", value);
}

/*
	Name: increment_global_stat
	Namespace: zm_stats
	Checksum: 0x2AB1C7E8
	Offset: 0x3A40
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function increment_global_stat(stat_name)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(#"playerstatslist", stat_name, #"statvalue", 1);
}

/*
	Name: highwater_global_stat
	Namespace: zm_stats
	Checksum: 0xC9B4D1B8
	Offset: 0x3AA8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function highwater_global_stat(stat_name, value)
{
	if(value > get_global_stat(stat_name))
	{
		set_global_stat(stat_name, value);
	}
}

/*
	Name: function_eb50d9bf
	Namespace: zm_stats
	Checksum: 0xB8333BB
	Offset: 0x3AF8
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_eb50d9bf(stat_name)
{
	return self stats::get_stat(#"playerstatslist", stat_name, #"statvalue");
}

/*
	Name: add_client_stat
	Namespace: zm_stats
	Checksum: 0xAB4922E9
	Offset: 0x3B40
	Size: 0xA8
	Parameters: 3
	Flags: Linked
*/
function add_client_stat(stat_name, stat_value, include_gametype)
{
	if(is_true(level.zm_disable_recording_stats) || !isarray(self.pers))
	{
		return;
	}
	if(!isdefined(include_gametype))
	{
		include_gametype = 1;
	}
	self globallogic_score::incpersstat(hash(stat_name), stat_value, 0, include_gametype);
	self.stats_this_frame[stat_name] = 1;
}

/*
	Name: increment_player_stat
	Namespace: zm_stats
	Checksum: 0xB51C9E6A
	Offset: 0x3BF0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function increment_player_stat(stat_name)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self incrementplayerstat(stat_name, 1);
}

/*
	Name: increment_root_stat
	Namespace: zm_stats
	Checksum: 0x8F9950E9
	Offset: 0x3C40
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function increment_root_stat(stat_name, stat_value)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(stat_name, stat_value);
}

/*
	Name: increment_client_stat
	Namespace: zm_stats
	Checksum: 0xF5378D47
	Offset: 0x3C98
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function increment_client_stat(stat_name, include_gametype)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	add_client_stat(stat_name, 1, include_gametype);
}

/*
	Name: set_client_stat
	Namespace: zm_stats
	Checksum: 0x63AD3EB0
	Offset: 0x3CF0
	Size: 0xB8
	Parameters: 3
	Flags: None
*/
function set_client_stat(stat_name, stat_value, include_gametype)
{
	if(is_true(level.zm_disable_recording_stats) || !isarray(self.pers))
	{
		return;
	}
	current_stat_count = self globallogic_score::getpersstat(stat_name);
	self globallogic_score::incpersstat(hash(stat_name), stat_value - current_stat_count, 0, include_gametype);
	self.stats_this_frame[stat_name] = 1;
}

/*
	Name: zero_client_stat
	Namespace: zm_stats
	Checksum: 0x5427A249
	Offset: 0x3DB0
	Size: 0xB8
	Parameters: 2
	Flags: None
*/
function zero_client_stat(stat_name, include_gametype)
{
	if(is_true(level.zm_disable_recording_stats) || !isarray(self.pers))
	{
		return;
	}
	current_stat_count = self globallogic_score::getpersstat(stat_name);
	self globallogic_score::incpersstat(hash(stat_name), current_stat_count * -1, 0, include_gametype);
	self.stats_this_frame[stat_name] = 1;
}

/*
	Name: get_map_stat
	Namespace: zm_stats
	Checksum: 0x4DE5F074
	Offset: 0x3E70
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function get_map_stat(stat_name)
{
	return self stats::get_stat(#"playerstatsbymap", level.script, #"stats", stat_name, #"statvalue");
}

/*
	Name: set_map_stat
	Namespace: zm_stats
	Checksum: 0x4569465C
	Offset: 0x3ED0
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function set_map_stat(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::set_stat(#"playerstatsbymap", level.script, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: add_map_stat
	Namespace: zm_stats
	Checksum: 0x7F64033D
	Offset: 0x3F68
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function add_map_stat(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(#"playerstatsbymap", level.script, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: increment_map_stat
	Namespace: zm_stats
	Checksum: 0x104AF71A
	Offset: 0x4000
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function increment_map_stat(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(#"playerstatsbymap", level.script, #"stats", stat_name, #"statvalue", 1);
}

/*
	Name: highwater_map_stat
	Namespace: zm_stats
	Checksum: 0x746E3CE3
	Offset: 0x4090
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function highwater_map_stat(stat_name, value)
{
	if(value > get_map_stat(stat_name))
	{
		set_map_stat(stat_name, value);
	}
}

/*
	Name: increment_map_cheat_stat
	Namespace: zm_stats
	Checksum: 0x292866A8
	Offset: 0x40E0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function increment_map_cheat_stat(stat_name)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(#"playerstatsbymap", level.script, #"cheats", stat_name, 1);
}

/*
	Name: function_fd25ef51
	Namespace: zm_stats
	Checksum: 0x1576324
	Offset: 0x4158
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_fd25ef51(stat_name, map_name)
{
	return self stats::get_stat(#"hash_1ac2582ef7472ac3", map_name, #"stats", stat_name, #"statvalue");
}

/*
	Name: function_de5c64c9
	Namespace: zm_stats
	Checksum: 0x1E483F01
	Offset: 0x41B8
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_de5c64c9(stat_name, value)
{
	if(!isdefined(value))
	{
		return false;
	}
	if(value > function_c6b3eb96(stat_name))
	{
		function_6688e31d(stat_name, value);
		return true;
	}
	return false;
}

/*
	Name: function_c6b3eb96
	Namespace: zm_stats
	Checksum: 0xF6E5483A
	Offset: 0x4220
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_c6b3eb96(stat_name)
{
	return self stats::get_stat(#"hash_1ac2582ef7472ac3", level.script, #"stats", stat_name, #"statvalue");
}

/*
	Name: function_6688e31d
	Namespace: zm_stats
	Checksum: 0x9F76161B
	Offset: 0x4280
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_6688e31d(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::set_stat(#"hash_1ac2582ef7472ac3", level.script, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: function_585da839
	Namespace: zm_stats
	Checksum: 0x3A46BEE6
	Offset: 0x4318
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_585da839(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	self stats::inc_stat(#"hash_1ac2582ef7472ac3", level.script, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: function_56ec2437
	Namespace: zm_stats
	Checksum: 0x96095340
	Offset: 0x43B0
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_56ec2437(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return 0;
	}
	return stats::get_stat(#"playerstatsbygametype", level.gametype, stat_name, #"statvalue");
}

/*
	Name: function_4d4e2a78
	Namespace: zm_stats
	Checksum: 0x3E9B744A
	Offset: 0x4430
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_4d4e2a78(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::set_stat(#"playerstatsbygametype", level.gametype, stat_name, #"statvalue", value);
}

/*
	Name: function_ab006044
	Namespace: zm_stats
	Checksum: 0xA55DD96A
	Offset: 0x44B8
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_ab006044(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::inc_stat(#"playerstatsbygametype", level.gametype, stat_name, #"statvalue", value);
}

/*
	Name: function_7bc347f6
	Namespace: zm_stats
	Checksum: 0x85252F3F
	Offset: 0x4540
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_7bc347f6(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::inc_stat(#"playerstatsbygametype", level.gametype, stat_name, #"statvalue", 1);
}

/*
	Name: function_d4e0d242
	Namespace: zm_stats
	Checksum: 0x1AA9710
	Offset: 0x45C0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_d4e0d242(stat_name, value)
{
	if(value > function_56ec2437(stat_name))
	{
		function_4d4e2a78(stat_name, value);
	}
}

/*
	Name: function_b1520544
	Namespace: zm_stats
	Checksum: 0x27FEEEBF
	Offset: 0x4610
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_b1520544(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return 0;
	}
	return stats::get_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"stats", stat_name, #"statvalue");
}

/*
	Name: function_49469f35
	Namespace: zm_stats
	Checksum: 0x5596D2DA
	Offset: 0x46B8
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_49469f35(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::set_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: function_a6efb963
	Namespace: zm_stats
	Checksum: 0x12BADCF7
	Offset: 0x4768
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_a6efb963(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::inc_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: function_f1a1191d
	Namespace: zm_stats
	Checksum: 0x972E78FF
	Offset: 0x4818
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_f1a1191d(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::inc_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"stats", stat_name, #"statvalue", 1);
}

/*
	Name: function_1b763e4
	Namespace: zm_stats
	Checksum: 0x911537A2
	Offset: 0x48C0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_1b763e4(stat_name, value)
{
	if(!isdefined(value))
	{
		return;
	}
	if(!isdefined(stat_name))
	{
		return;
	}
	current = function_b1520544(stat_name);
	if(!isdefined(current))
	{
		return;
	}
	if(value > current)
	{
		function_49469f35(stat_name, value);
	}
}

/*
	Name: function_5addf1fc
	Namespace: zm_stats
	Checksum: 0xFAC06BFC
	Offset: 0x4940
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function function_5addf1fc(stat_name, value, var_48038375)
{
	if(!isdefined(var_48038375))
	{
		var_48038375 = 0;
	}
	if(!isdefined(value))
	{
		return;
	}
	if(!isdefined(stat_name))
	{
		return;
	}
	current = function_b1520544(stat_name);
	if(!isdefined(current))
	{
		return;
	}
	if(value < current || (value > 0 && current == 0 && !var_48038375))
	{
		function_49469f35(stat_name, value);
	}
}

/*
	Name: function_523fee8d
	Namespace: zm_stats
	Checksum: 0xDC84606F
	Offset: 0x4A00
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_523fee8d(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return 0;
	}
	return stats::get_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"hash_413b4abc26595b34", level.gamedifficulty, #"stats", stat_name, #"statvalue");
}

/*
	Name: function_7866854a
	Namespace: zm_stats
	Checksum: 0x66A44E29
	Offset: 0x4AC0
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function function_7866854a(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::set_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"hash_413b4abc26595b34", level.gamedifficulty, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: function_9288c79b
	Namespace: zm_stats
	Checksum: 0x44F9F367
	Offset: 0x4B88
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function function_9288c79b(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::inc_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"hash_413b4abc26595b34", level.gamedifficulty, #"stats", stat_name, #"statvalue", value);
}

/*
	Name: function_2726a7c2
	Namespace: zm_stats
	Checksum: 0x84241973
	Offset: 0x4C50
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_2726a7c2(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	stats::inc_stat(#"playerstatsbymap", level.script, #"hash_74e26ca9652802fb", level.gametype, #"hash_413b4abc26595b34", level.gamedifficulty, #"stats", stat_name, #"statvalue", 1);
}

/*
	Name: function_e8bfebb
	Namespace: zm_stats
	Checksum: 0xB1CA375B
	Offset: 0x4D10
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_e8bfebb(stat_name, value)
{
	if(value > function_523fee8d(stat_name))
	{
		function_7866854a(stat_name, value);
	}
}

/*
	Name: function_366b6fb9
	Namespace: zm_stats
	Checksum: 0x8DA470B0
	Offset: 0x4D60
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function function_366b6fb9(stat_name, value, var_48038375)
{
	if(!isdefined(var_48038375))
	{
		var_48038375 = 0;
	}
	var_cbd5530c = function_523fee8d(stat_name);
	if(value < var_cbd5530c || (value > 0 && var_cbd5530c == 0 && !var_48038375))
	{
		function_7866854a(stat_name, value);
	}
}

/*
	Name: function_8e274b32
	Namespace: zm_stats
	Checksum: 0xC7C048E5
	Offset: 0x4E00
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_8e274b32(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || !zm_utility::is_trials())
	{
		return 0;
	}
	/#
		assert(isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.name));
	#/
	return stats::get_stat(#"hash_5abf25946ab0ce9a", level.var_6d87ac05.name, stat_name);
}

/*
	Name: function_a05b3b23
	Namespace: zm_stats
	Checksum: 0x10FACFD
	Offset: 0x4ED8
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_a05b3b23(stat_name, value)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || !zm_utility::is_trials())
	{
		return;
	}
	/#
		assert(isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.name), "");
	#/
	stats::set_stat(#"hash_5abf25946ab0ce9a", level.var_6d87ac05.name, stat_name, value);
}

/*
	Name: registerchand_grow_
	Namespace: zm_stats
	Checksum: 0x8B7298BA
	Offset: 0x4FB8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function registerchand_grow_(stat_name)
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || !zm_utility::is_trials())
	{
		return;
	}
	/#
		assert(isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.name), "");
	#/
	stats::inc_stat(#"hash_5abf25946ab0ce9a", level.var_6d87ac05.name, stat_name, 1);
}

/*
	Name: function_f7885b2b
	Namespace: zm_stats
	Checksum: 0xEE5427CF
	Offset: 0x5090
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_f7885b2b(stat_name, n_value)
{
	if(n_value > function_8e274b32(stat_name))
	{
		function_a05b3b23(stat_name, n_value);
	}
}

/*
	Name: function_31931250
	Namespace: zm_stats
	Checksum: 0xEEF2DA86
	Offset: 0x50E0
	Size: 0x94
	Parameters: 3
	Flags: None
*/
function function_31931250(stat_name, n_value, var_48038375)
{
	if(!isdefined(var_48038375))
	{
		var_48038375 = 0;
	}
	var_cbd5530c = function_8e274b32(stat_name);
	if(n_value < var_cbd5530c || (n_value > 0 && var_cbd5530c == 0 && !var_48038375))
	{
		function_a05b3b23(stat_name, n_value);
	}
}

/*
	Name: increment_challenge_stat
	Namespace: zm_stats
	Checksum: 0x7714E987
	Offset: 0x5180
	Size: 0x1A4
	Parameters: 3
	Flags: Linked
*/
function increment_challenge_stat(stat_name, amount, var_b68b08b1)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(var_b68b08b1))
	{
		var_b68b08b1 = 0;
	}
	/#
		assert(function_7a600918(stat_name), "");
	#/
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || (var_b68b08b1 && zm_utility::is_standard()))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	self stats::function_dad108fa(stat_name, amount);
	/#
		var_ba1fb8c1 = self stats::function_441050ca(stat_name);
		if(isdefined(self.entity_num))
		{
			println(((("" + self.entity_num) + "") + function_9e72a96(stat_name) + "") + var_ba1fb8c1);
		}
		else
		{
			println((("" + function_9e72a96(stat_name)) + "") + var_ba1fb8c1);
		}
	#/
}

/*
	Name: function_a6b15f2c
	Namespace: zm_stats
	Checksum: 0x79908641
	Offset: 0x5330
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_a6b15f2c(var_d5fa8477, b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(is_true(level.zm_disable_recording_stats))
	{
		return false;
	}
	self stats::set_stat(#"hash_118b6e7581ca3893", var_d5fa8477, b_value);
}

/*
	Name: function_376778d3
	Namespace: zm_stats
	Checksum: 0x34DA64C
	Offset: 0x53A8
	Size: 0x32
	Parameters: 2
	Flags: Linked
*/
function function_376778d3(var_d5fa8477, b_value)
{
	return self stats::get_stat(#"hash_118b6e7581ca3893", b_value);
}

/*
	Name: function_b4cc2b13
	Namespace: zm_stats
	Checksum: 0x1F3A36B5
	Offset: 0x53E8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_b4cc2b13(var_9177621d, b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(is_true(level.zm_disable_recording_stats))
	{
		return false;
	}
	self stats::set_stat(#"hash_4fc98fa4f99fe608", var_9177621d, b_value);
}

/*
	Name: function_165a4e7b
	Namespace: zm_stats
	Checksum: 0x457A2FCD
	Offset: 0x5460
	Size: 0x32
	Parameters: 2
	Flags: None
*/
function function_165a4e7b(var_9177621d, b_value)
{
	return self stats::get_stat(#"hash_4fc98fa4f99fe608", b_value);
}

/*
	Name: function_c9d32eb9
	Namespace: zm_stats
	Checksum: 0xBEB6286B
	Offset: 0x54A0
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_c9d32eb9(stat_name)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return 0;
	}
	return match_record::get_stat(stat_name);
}

/*
	Name: function_42677837
	Namespace: zm_stats
	Checksum: 0x2F1DC8E4
	Offset: 0x54E8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_42677837(stat_name, value)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	match_record::set_stat(stat_name, value);
}

/*
	Name: function_4be7186e
	Namespace: zm_stats
	Checksum: 0xD2FDBEF2
	Offset: 0x5540
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_4be7186e(stat_name, value)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	match_record::inc_stat(stat_name, value);
}

/*
	Name: function_862d8623
	Namespace: zm_stats
	Checksum: 0x8DAFBA44
	Offset: 0x5598
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_862d8623(stat_name)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	match_record::inc_stat(stat_name, 1);
}

/*
	Name: function_57febe39
	Namespace: zm_stats
	Checksum: 0xD6F59860
	Offset: 0x55E8
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_57febe39(stat_name, value)
{
	if(value > function_c9d32eb9(stat_name))
	{
		function_42677837(stat_name, value);
	}
}

/*
	Name: function_529e1302
	Namespace: zm_stats
	Checksum: 0x75550F64
	Offset: 0x5638
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_529e1302(stat_name)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return 0;
	}
	return self match_record::get_player_stat(stat_name);
}

/*
	Name: function_ae547e45
	Namespace: zm_stats
	Checksum: 0x2681633F
	Offset: 0x5688
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_ae547e45(stat_name, value)
{
	if(is_true(level.zm_disable_recording_stats) && !issubstr(stat_name, "boas_"))
	{
		return;
	}
	self match_record::set_player_stat(stat_name, value);
}

/*
	Name: function_301c4be2
	Namespace: zm_stats
	Checksum: 0x4BC96B25
	Offset: 0x5700
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_301c4be2(stat_name, value)
{
	if(is_true(level.zm_disable_recording_stats) && !issubstr(stat_name, "boas_"))
	{
		return;
	}
	self match_record::function_34800eec(stat_name, value);
}

/*
	Name: function_8f10788e
	Namespace: zm_stats
	Checksum: 0x6F9E9CCB
	Offset: 0x5778
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_8f10788e(stat_name)
{
	if(is_true(level.zm_disable_recording_stats) && !issubstr(stat_name, "boas_"))
	{
		return;
	}
	self match_record::function_34800eec(stat_name, 1);
}

/*
	Name: function_5d0e6000
	Namespace: zm_stats
	Checksum: 0x1C906420
	Offset: 0x57F0
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_5d0e6000(stat_name, value)
{
	var_cbd5530c = self function_529e1302(stat_name);
	if(!isdefined(var_cbd5530c))
	{
		return;
	}
	if(value > var_cbd5530c)
	{
		self function_ae547e45(stat_name, value);
	}
}

/*
	Name: function_ef7d5199
	Namespace: zm_stats
	Checksum: 0x79CB560F
	Offset: 0x5860
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_ef7d5199(evictim, weapon)
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	if(isdefined(self.origin) && (isdefined(evictim.origin) && isdefined(weapon.name)))
	{
		var_74e5763 = 0;
		var_40fd58bf = distancesquared(self.origin, evictim.origin) * 0.0006451613;
		if(var_40fd58bf >= sqr(60))
		{
			var_74e5763 = 4;
		}
		else
		{
			if(var_40fd58bf >= sqr(40))
			{
				var_74e5763 = 3;
			}
			else
			{
				if(var_40fd58bf >= sqr(20))
				{
					var_74e5763 = 2;
				}
				else if(var_40fd58bf >= sqr(10))
				{
					var_74e5763 = 1;
				}
			}
		}
		self stats::function_6cdd992f(weapon.name, var_74e5763, 1);
	}
}

/*
	Name: function_e4358abd
	Namespace: zm_stats
	Checksum: 0x4E999041
	Offset: 0x59D0
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_e4358abd(stat_name)
{
	return self stats::get_stat(#"afteractionreportstats", stat_name);
}

/*
	Name: function_9daadcaa
	Namespace: zm_stats
	Checksum: 0x2802390
	Offset: 0x5A08
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_9daadcaa(stat_name, value)
{
	self stats::set_stat(#"afteractionreportstats", stat_name, value);
}

/*
	Name: function_96087e7
	Namespace: zm_stats
	Checksum: 0x410696AE
	Offset: 0x5A50
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_96087e7(stat_name, value)
{
	self stats::inc_stat(#"afteractionreportstats", stat_name, value);
}

/*
	Name: function_3468f864
	Namespace: zm_stats
	Checksum: 0xD3E30AFA
	Offset: 0x5A98
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_3468f864(stat_name)
{
	self stats::inc_stat(#"afteractionreportstats", stat_name, 1);
}

/*
	Name: function_69317807
	Namespace: zm_stats
	Checksum: 0x997DEF8
	Offset: 0x5AD8
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_69317807(stat_name, value)
{
	if(value > self function_e4358abd(stat_name))
	{
		self function_9daadcaa(stat_name, value);
	}
}

/*
	Name: function_61e39bb6
	Namespace: zm_stats
	Checksum: 0xDA6B761F
	Offset: 0x5B30
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_61e39bb6(var_b7b748b7, amount)
{
	gated = 0;
	if(getdvarint(#"hash_f46d80ea72f539c", 0) != 0)
	{
		gated = 1;
	}
	if(gated)
	{
		return;
	}
	self stats::function_dad108fa(var_b7b748b7, amount);
}

/*
	Name: handle_death
	Namespace: zm_stats
	Checksum: 0x663D62B9
	Offset: 0x5BB0
	Size: 0xF84
	Parameters: 4
	Flags: Linked
*/
function handle_death(einflictor, eattacker, weapon, smeansofdeath)
{
	entity = self;
	if(isplayer(entity) && isdefined(weapon.archetype))
	{
		switch(weapon.archetype)
		{
			case "blight_father":
			{
				entity increment_client_stat("killed_by_blightfather");
				entity increment_player_stat("killed_by_blightfather");
				entity function_8f10788e("boas_killed_by_blightfather");
				break;
			}
			case "brutus":
			{
				entity increment_client_stat("killed_by_brutus");
				entity increment_player_stat("killed_by_brutus");
				entity function_8f10788e("boas_killed_by_brutus");
				break;
			}
			case "gladiator":
			{
				entity increment_client_stat("killed_by_gladiator");
				entity increment_player_stat("killed_by_gladiator");
				entity function_8f10788e("boas_killed_by_gladiator");
				break;
			}
			case "stoker":
			{
				entity increment_client_stat("killed_by_stoker");
				entity increment_player_stat("killed_by_stoker");
				entity function_8f10788e("boas_killed_by_stoker");
				break;
			}
			case "tiger":
			{
				entity increment_client_stat("killed_by_tiger");
				entity increment_player_stat("killed_by_tiger");
				entity function_8f10788e("boas_killed_by_tiger");
				break;
			}
			case "catalyst":
			{
				entity increment_client_stat("killed_by_catalyst");
				entity increment_player_stat("killed_by_catalyst");
				entity function_8f10788e("boas_killed_by_catalyst");
				switch(weapon.var_9fde8624)
				{
					case "hash_266b62e342076a90":
					{
						entity increment_client_stat("killed_by_catalyst_electric");
						entity increment_player_stat("killed_by_catalyst_electric");
						entity function_8f10788e("boas_killed_by_catalyst_electric");
						break;
					}
					case "hash_5d6b55906fc82ff2":
					{
						entity increment_client_stat("killed_by_catalyst_water");
						entity increment_player_stat("killed_by_catalyst_water");
						entity function_8f10788e("boas_killed_by_catalyst_water");
						break;
					}
					case "hash_5cfa99582cc66c59":
					{
						entity increment_client_stat("killed_by_catalyst_plasma");
						entity increment_player_stat("killed_by_catalyst_plasma");
						entity function_8f10788e("boas_killed_by_catalyst_plasma");
						break;
					}
					case "hash_78ca8e8e6bdbc8ab":
					{
						entity increment_client_stat("killed_by_catalyst_corrosive");
						entity increment_player_stat("killed_by_catalyst_corrosive");
						entity function_8f10788e("boas_killed_by_catalyst_corrosive");
						break;
					}
				}
				break;
			}
			case "nova_crawler":
			{
				entity increment_client_stat("killed_by_nova_crawler");
				entity increment_player_stat("killed_by_nova_crawler");
				entity function_8f10788e("boas_killed_by_nova_crawler");
				break;
			}
			case "zombie_dog":
			{
				entity increment_client_stat("killed_by_zdog");
				entity increment_player_stat("killed_by_zdog");
				entity function_8f10788e("boas_killed_by_zdog");
				break;
			}
			case "nosferatu":
			{
				if(weapon.var_9fde8624 === #"crimson_nosferatu")
				{
					entity increment_client_stat("killed_by_crimson_nosferatu");
					entity increment_player_stat("killed_by_crimson_nosferatu");
					entity function_8f10788e("boas_killed_by_crimson_nosferatu");
				}
				else
				{
					entity increment_client_stat("killed_by_nosferatu");
					entity increment_player_stat("killed_by_nosferatu");
					entity function_8f10788e("boas_killed_by_nosferatu");
				}
				break;
			}
			case "werewolf":
			{
				entity increment_client_stat("killed_by_werewolf");
				entity increment_player_stat("killed_by_werewolf");
				entity function_8f10788e("boas_killed_by_werewolf");
				break;
			}
		}
	}
	else if(isplayer(weapon))
	{
		if(isdefined(entity.archetype))
		{
			switch(entity.archetype)
			{
				case "blight_father":
				{
					weapon increment_client_stat("blightfathers_killed");
					weapon increment_player_stat("blightfathers_killed");
					weapon function_8f10788e("boas_blightfathers_killed");
					break;
				}
				case "brutus":
				{
					weapon increment_client_stat("brutuses_killed");
					weapon increment_player_stat("brutuses_killed");
					weapon function_8f10788e("boas_brutuses_killed");
					break;
				}
				case "gladiator":
				{
					weapon increment_client_stat("gladiators_killed");
					weapon increment_player_stat("gladiators_killed");
					weapon function_8f10788e("boas_gladiators_killed");
					break;
				}
				case "stoker":
				{
					weapon increment_client_stat("stokers_killed");
					weapon increment_player_stat("stokers_killed");
					weapon function_8f10788e("boas_stokers_killed");
					break;
				}
				case "tiger":
				{
					weapon increment_client_stat("tigers_killed");
					weapon increment_player_stat("tigers_killed");
					weapon function_8f10788e("boas_tigers_killed");
					break;
				}
				case "catalyst":
				{
					weapon increment_client_stat("catalysts_killed");
					weapon increment_player_stat("catalysts_killed");
					weapon function_8f10788e("boas_catalysts_killed");
					switch(entity.var_9fde8624)
					{
						case "hash_266b62e342076a90":
						{
							weapon increment_client_stat("catalyst_electrics_killed");
							weapon increment_player_stat("catalyst_electrics_killed");
							weapon function_8f10788e("boas_catalyst_electrics_killed");
							break;
						}
						case "hash_5d6b55906fc82ff2":
						{
							weapon increment_client_stat("catalyst_waters_killed");
							weapon increment_player_stat("catalyst_waters_killed");
							weapon function_8f10788e("boas_catalyst_waters_killed");
							break;
						}
						case "hash_5cfa99582cc66c59":
						{
							weapon increment_client_stat("catalyst_plasmas_killed");
							weapon increment_player_stat("catalyst_plasmas_killed");
							weapon function_8f10788e("boas_catalyst_plasmas_killed");
							break;
						}
						case "hash_78ca8e8e6bdbc8ab":
						{
							weapon increment_client_stat("catalyst_corrosives_killed");
							weapon increment_player_stat("catalyst_corrosives_killed");
							weapon function_8f10788e("boas_catalyst_corrosives_killed");
							break;
						}
					}
					break;
				}
				case "nova_crawler":
				{
					weapon increment_client_stat("nova_crawlers_killed");
					weapon increment_player_stat("nova_crawlers_killed");
					weapon function_8f10788e("boas_nova_crawlers_killed");
					break;
				}
				case "zombie_dog":
				{
					weapon increment_client_stat("zdogs_killed");
					weapon increment_player_stat("zdogs_killed");
					weapon function_8f10788e("boas_zdogs_killed");
					break;
				}
				case "nosferatu":
				{
					if(entity.var_9fde8624 === #"crimson_nosferatu")
					{
						weapon increment_client_stat("crimson_nosferatus_killed");
						weapon increment_player_stat("crimson_nosferatus_killed");
						weapon function_8f10788e("boas_crimson_nosferatus_killed");
					}
					else
					{
						weapon increment_client_stat("nosferatus_killed");
						weapon increment_player_stat("nosferatus_killed");
						weapon function_8f10788e("boas_nosferatus_killed");
					}
					break;
				}
				case "werewolf":
				{
					weapon increment_client_stat("werewolves_killed");
					weapon increment_player_stat("werewolves_killed");
					weapon function_8f10788e("boas_werewolves_killed");
					break;
				}
				case "bat":
				{
					weapon increment_client_stat("bats_killed");
					weapon increment_player_stat("bats_killed");
					weapon function_8f10788e("boas_bats_killed");
					break;
				}
			}
		}
		if(zm_weapons::is_wonder_weapon(smeansofdeath))
		{
			weapon increment_client_stat("wonder_weapon_kills");
			weapon increment_player_stat("wonder_weapon_kills");
			weapon function_8f10788e("boas_wonder_weapon_kills");
		}
		if(isdefined(eattacker) && isdefined(eattacker.turret) && isdefined(eattacker.turret.item))
		{
			weapon stats::function_e24eec31(eattacker.turret.item, #"kills", 1);
		}
	}
}

/*
	Name: track_craftables_pickedup
	Namespace: zm_stats
	Checksum: 0x5ABE39E3
	Offset: 0x6B40
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function track_craftables_pickedup(craftable)
{
	player = self;
	if(is_true(craftable.isriotshield))
	{
		player increment_client_stat("shields_purchased");
		player increment_player_stat("shields_purchased");
		player function_8f10788e("boas_shields_purchased");
	}
}

/*
	Name: get_stat_distance_traveled
	Namespace: zm_stats
	Checksum: 0xB1CD8FED
	Offset: 0x6BE0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function get_stat_distance_traveled()
{
	miles = int(self.pers[#"distance_traveled"] / 63360);
	remainder = (self.pers[#"distance_traveled"] / 63360) - miles;
	if(miles < 1 && remainder < 0.5)
	{
		miles = 1;
	}
	else if(remainder >= 0.5)
	{
		miles++;
	}
	return miles;
}

/*
	Name: get_stat_round_number
	Namespace: zm_stats
	Checksum: 0xF2C28839
	Offset: 0x6CA0
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_stat_round_number()
{
	return namespace_a28acff3::get_round_number();
}

/*
	Name: get_stat_combined_rank_value_survival_classic
	Namespace: zm_stats
	Checksum: 0xFCE8109B
	Offset: 0x6CC0
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function get_stat_combined_rank_value_survival_classic()
{
	rounds = get_stat_round_number();
	kills = self.pers[#"kills"];
	if(rounds > 99)
	{
		rounds = 99;
	}
	result = (rounds * 10000000) + kills;
	return result;
}

/*
	Name: update_global_counters_on_match_end
	Namespace: zm_stats
	Checksum: 0x450FD5D4
	Offset: 0x6D40
	Size: 0x186E
	Parameters: 0
	Flags: Linked
*/
function update_global_counters_on_match_end()
{
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	deaths = 0;
	kills = 0;
	melee_kills = 0;
	wonder_weapon_kills = 0;
	headshots = 0;
	suicides = 0;
	downs = 0;
	revives = 0;
	perks_drank = 0;
	doors_purchased = 0;
	distance_traveled = 0;
	total_shots = 0;
	boards = 0;
	sacrifices = 0;
	drops = 0;
	nuke_pickedup = 0;
	insta_kill_pickedup = 0;
	full_ammo_pickedup = 0;
	var_be43e4a5 = 0;
	var_cb9feb27 = 0;
	var_f03b1308 = 0;
	double_points_pickedup = 0;
	meat_stink_pickedup = 0;
	carpenter_pickedup = 0;
	fire_sale_pickedup = 0;
	var_d61f06ce = 0;
	minigun_pickedup = 0;
	island_seed_pickedup = 0;
	var_3e74dc38 = 0;
	var_d858ee80 = 0;
	var_550709e6 = 0;
	var_b4012da = 0;
	var_47c42f82 = 0;
	var_dcc9d810 = 0;
	bonus_points_team_pickedup = 0;
	ww_grenade_pickedup = 0;
	zombie_blood_pickedup = 0;
	use_magicbox = 0;
	grabbed_from_magicbox = 0;
	use_perk_random = 0;
	grabbed_from_perk_random = 0;
	use_pap = 0;
	var_abebc1d4 = 0;
	var_da9f1d15 = 0;
	var_ed8842e7 = 0;
	var_ff36e644 = 0;
	blightfathers_killed = 0;
	killed_by_blightfather = 0;
	brutuses_killed = 0;
	killed_by_brutus = 0;
	gladiators_killed = 0;
	killed_by_gladiator = 0;
	stokers_killed = 0;
	killed_by_stoker = 0;
	tigers_killed = 0;
	killed_by_tiger = 0;
	catalysts_killed = 0;
	killed_by_catalyst = 0;
	catalyst_electrics_killed = 0;
	killed_by_catalyst_electric = 0;
	catalyst_waters_killed = 0;
	killed_by_catalyst_water = 0;
	catalyst_plasmas_killed = 0;
	killed_by_catalyst_plasma = 0;
	catalyst_corrosives_killed = 0;
	killed_by_catalyst_corrosive = 0;
	nova_crawlers_killed = 0;
	killed_by_nova_crawler = 0;
	werewolves_killed = 0;
	killed_by_werewolf = 0;
	nosferatus_killed = 0;
	killed_by_nosferatu = 0;
	crimson_nosferatus_killed = 0;
	killed_by_crimson_nosferatu = 0;
	bats_killed = 0;
	var_2407fa7f = 0;
	var_a45c0ec = 0;
	var_a1cab15d = 0;
	var_8e14f822 = 0;
	var_4b1715b8 = 0;
	var_693f9ce6 = 0;
	var_ac072054 = 0;
	specialty_armorvest_drank = 0;
	specialty_quickrevive_drank = 0;
	specialty_fastreload_drank = 0;
	specialty_additionalprimaryweapon_drank = 0;
	specialty_staminup_drank = 0;
	specialty_doubletap2_drank = 0;
	specialty_widowswine_drank = 0;
	specialty_deadshot_drank = 0;
	var_69a326a5 = 0;
	var_fe5dcda2 = 0;
	var_48fd5671 = 0;
	var_3b4ec51 = 0;
	var_aa97f0a6 = 0;
	var_a73cd9fe = 0;
	specialty_phdflopper_drank = 0;
	var_2da6115c = 0;
	var_de6ec86b = 0;
	var_b972d467 = 0;
	var_16a0e615 = 0;
	var_46c7e904 = 0;
	var_1e13347b = 0;
	var_c56462cf = 0;
	var_f6b5833a = 0;
	var_e984eacc = 0;
	var_aea053fa = 0;
	var_eb45709f = 0;
	var_33a5b509 = 0;
	var_ac975a7f = 0;
	var_8405e59d = 0;
	var_2ecaa90f = 0;
	var_4454cfa3 = 0;
	var_f512508c = 0;
	var_6f5b5ff = 0;
	claymores_planted = 0;
	claymores_pickedup = 0;
	bouncingbetty_planted = 0;
	ballistic_knives_pickedup = 0;
	wallbuy_weapons_purchased = 0;
	power_turnedon = 0;
	power_turnedoff = 0;
	planted_buildables_pickedup = 0;
	ammo_purchased = 0;
	upgraded_ammo_purchased = 0;
	shields_purchased = 0;
	buildables_built = 0;
	time_played = 0;
	cheat_too_many_weapons = 0;
	cheat_out_of_playable_area = 0;
	cheat_too_friendly = 0;
	cheat_total = 0;
	players = getplayers();
	foreach(player in players)
	{
		deaths = deaths + player.pers[#"deaths"];
		kills = kills + player.pers[#"kills"];
		wonder_weapon_kills = wonder_weapon_kills + player.pers[#"wonder_weapon_kills"];
		headshots = headshots + player.pers[#"headshots"];
		suicides = suicides + player.pers[#"suicides"];
		melee_kills = melee_kills + player.pers[#"melee_kills"];
		downs = downs + player.pers[#"downs"];
		revives = revives + player.pers[#"revives"];
		perks_drank = perks_drank + player.pers[#"perks_drank"];
		var_2407fa7f = var_2407fa7f + player.pers[#"hash_731ce11cd7aabf49"];
		var_a45c0ec = var_a45c0ec + player.pers[#"hash_28a20f25e5d2675b"];
		var_a1cab15d = var_a1cab15d + player.pers[#"hash_3000f7041705064b"];
		var_8e14f822 = var_8e14f822 + player.pers[#"hash_388f4347e28d7ab7"];
		var_4b1715b8 = var_4b1715b8 + player.pers[#"hash_4241552ec3f4078b"];
		var_693f9ce6 = var_693f9ce6 + player.pers[#"hash_52fec240a96cc85a"];
		var_ac072054 = var_ac072054 + player.pers[#"hash_63236a6a7db7369c"];
		specialty_armorvest_drank = specialty_armorvest_drank + player.pers[#"specialty_armorvest_drank"];
		specialty_quickrevive_drank = specialty_quickrevive_drank + player.pers[#"specialty_quickrevive_drank"];
		specialty_fastreload_drank = specialty_fastreload_drank + player.pers[#"specialty_fastreload_drank"];
		specialty_additionalprimaryweapon_drank = specialty_additionalprimaryweapon_drank + player.pers[#"specialty_additionalprimaryweapon_drank"];
		specialty_staminup_drank = specialty_staminup_drank + player.pers[#"specialty_staminup_drank"];
		specialty_doubletap2_drank = specialty_doubletap2_drank + player.pers[#"specialty_doubletap2_drank"];
		specialty_widowswine_drank = specialty_widowswine_drank + player.pers[#"specialty_widowswine_drank"];
		specialty_deadshot_drank = specialty_deadshot_drank + player.pers[#"specialty_deadshot_drank"];
		var_69a326a5 = var_69a326a5 + player.pers[#"hash_6fd20bc72bf9e498"];
		var_fe5dcda2 = var_fe5dcda2 + player.pers[#"hash_583ff5f66fd10104"];
		var_48fd5671 = var_48fd5671 + player.pers[#"hash_3cbaa7dc09e06bb7"];
		var_3b4ec51 = var_3b4ec51 + player.pers[#"hash_539966dfa171abec"];
		var_aa97f0a6 = var_aa97f0a6 + player.pers[#"hash_5061c06e56f8d741"];
		var_a73cd9fe = var_a73cd9fe + player.pers[#"hash_3c548389d8524d38"];
		specialty_phdflopper_drank = specialty_phdflopper_drank + player.pers[#"specialty_phdflopper_drank"];
		var_2da6115c = var_2da6115c + player.pers[#"hash_6d567aa9deb5cb44"];
		var_de6ec86b = var_de6ec86b + player.pers[#"hash_165df073a0d7a3c3"];
		var_b972d467 = var_b972d467 + player.pers[#"hash_3d9b732ca303132b"];
		var_16a0e615 = var_16a0e615 + player.pers[#"hash_48288866afddc0d4"];
		var_46c7e904 = var_46c7e904 + player.pers[#"hash_1dc1fbd3fd2fe493"];
		var_1e13347b = var_1e13347b + player.pers[#"hash_49cc8e6486122824"];
		var_c56462cf = var_c56462cf + player.pers[#"hash_382854bc103fd553"];
		var_f6b5833a = var_f6b5833a + player.pers[#"hash_4419d00a9f04f866"];
		var_e984eacc = var_e984eacc + player.pers[#"hash_5a42a4d4accf00bf"];
		var_aea053fa = var_aea053fa + player.pers[#"hash_dd2dc50d66eb166"];
		var_eb45709f = var_eb45709f + player.pers[#"hash_79d41974c40c126e"];
		var_33a5b509 = var_33a5b509 + player.pers[#"hash_5c9c943cd0cffc65"];
		var_ac975a7f = var_ac975a7f + player.pers[#"hash_7d98fe4413e871a4"];
		var_8405e59d = var_8405e59d + player.pers[#"hash_402bebef02213c02"];
		var_2ecaa90f = var_2ecaa90f + player.pers[#"hash_2a63229e9bf23baa"];
		var_4454cfa3 = var_4454cfa3 + player.pers[#"hash_41476f0bb1f7c683"];
		var_f512508c = var_f512508c + player.pers[#"hash_254f75482929079b"];
		var_6f5b5ff = var_6f5b5ff + player.pers[#"hash_3bd6bf00e8c71a5d"];
		doors_purchased = doors_purchased + player.pers[#"doors_purchased"];
		distance_traveled = distance_traveled + player get_stat_distance_traveled();
		boards = boards + player.pers[#"boards"];
		sacrifices = sacrifices + player.pers[#"sacrifices"];
		drops = drops + player.pers[#"drops"];
		nuke_pickedup = nuke_pickedup + player.pers[#"nuke_pickedup"];
		insta_kill_pickedup = insta_kill_pickedup + player.pers[#"insta_kill_pickedup"];
		full_ammo_pickedup = full_ammo_pickedup + player.pers[#"full_ammo_pickedup"];
		var_be43e4a5 = var_be43e4a5 + player.pers[#"hash_65472fa120ebce1c"];
		var_cb9feb27 = var_cb9feb27 + player.pers[#"hash_685c28b32c045f5c"];
		var_f03b1308 = var_f03b1308 + player.pers[#"hash_17cd6f2f7e794f3d"];
		double_points_pickedup = double_points_pickedup + player.pers[#"double_points_pickedup"];
		meat_stink_pickedup = meat_stink_pickedup + player.pers[#"meat_stink_pickedup"];
		carpenter_pickedup = carpenter_pickedup + player.pers[#"carpenter_pickedup"];
		fire_sale_pickedup = fire_sale_pickedup + player.pers[#"fire_sale_pickedup"];
		var_d61f06ce = var_d61f06ce + player.pers[#"hash_27399de28b76c5c6"];
		minigun_pickedup = minigun_pickedup + player.pers[#"minigun_pickedup"];
		island_seed_pickedup = island_seed_pickedup + player.pers[#"island_seed_pickedup"];
		var_3e74dc38 = var_3e74dc38 + player.pers[#"hash_cdafe5cd6299b0c"];
		var_d858ee80 = var_d858ee80 + player.pers[#"hash_3ec2a334a55d8215"];
		var_550709e6 = var_550709e6 + player.pers[#"hash_7d6f5e2da0f7af67"];
		var_b4012da = var_b4012da + player.pers[#"hash_636a6750788b3df0"];
		var_47c42f82 = var_47c42f82 + player.pers[#"hash_29b45601d5e0d53f"];
		var_dcc9d810 = var_dcc9d810 + player.pers[#"hash_79071dc310fc378f"];
		bonus_points_team_pickedup = bonus_points_team_pickedup + player.pers[#"bonus_points_team_pickedup"];
		ww_grenade_pickedup = ww_grenade_pickedup + player.pers[#"ww_grenade_pickedup"];
		use_magicbox = use_magicbox + player.pers[#"use_magicbox"];
		grabbed_from_magicbox = grabbed_from_magicbox + player.pers[#"grabbed_from_magicbox"];
		use_perk_random = use_perk_random + player.pers[#"use_perk_random"];
		grabbed_from_perk_random = grabbed_from_perk_random + player.pers[#"grabbed_from_perk_random"];
		use_pap = use_pap + player.pers[#"use_pap"];
		var_abebc1d4 = var_abebc1d4 + player.pers[#"hash_1bcba3bbca05dee0"];
		var_da9f1d15 = var_da9f1d15 + player.pers[#"hash_7f4d9be7afc10d0b"];
		var_ed8842e7 = var_ed8842e7 + player.pers[#"hash_7f4d9ce7afc10ebe"];
		var_ff36e644 = var_ff36e644 + player.pers[#"hash_7f4d9de7afc11071"];
		claymores_planted = claymores_planted + player.pers[#"claymores_planted"];
		claymores_pickedup = claymores_pickedup + player.pers[#"claymores_pickedup"];
		bouncingbetty_planted = bouncingbetty_planted + player.pers[#"bouncingbetty_planted"];
		ballistic_knives_pickedup = ballistic_knives_pickedup + player.pers[#"ballistic_knives_pickedup"];
		wallbuy_weapons_purchased = wallbuy_weapons_purchased + player.pers[#"wallbuy_weapons_purchased"];
		power_turnedon = power_turnedon + player.pers[#"power_turnedon"];
		power_turnedoff = power_turnedoff + player.pers[#"power_turnedoff"];
		planted_buildables_pickedup = planted_buildables_pickedup + player.pers[#"planted_buildables_pickedup"];
		buildables_built = buildables_built + player.pers[#"buildables_built"];
		ammo_purchased = ammo_purchased + player.pers[#"ammo_purchased"];
		upgraded_ammo_purchased = upgraded_ammo_purchased + player.pers[#"upgraded_ammo_purchased"];
		shields_purchased = shields_purchased + player.pers[#"shields_purchased"];
		if(!isdefined(player.total_shots))
		{
			player.total_shots = 0;
		}
		total_shots = total_shots + player.total_shots;
		time_played = time_played + player.pers[#"time_played_total"];
		cheat_too_many_weapons = cheat_too_many_weapons + player.pers[#"cheat_too_many_weapons"];
		cheat_out_of_playable_area = cheat_out_of_playable_area + player.pers[#"cheat_out_of_playable"];
		cheat_too_friendly = cheat_too_friendly + player.pers[#"cheat_too_friendly"];
		cheat_total = cheat_total + player.pers[#"cheat_total"];
		blightfathers_killed = blightfathers_killed + player.pers[#"blightfathers_killed"];
		killed_by_blightfather = killed_by_blightfather + player.pers[#"killed_by_blightfather"];
		brutuses_killed = brutuses_killed + player.pers[#"brutuses_killed"];
		killed_by_brutus = killed_by_brutus + player.pers[#"killed_by_brutus"];
		gladiators_killed = gladiators_killed + player.pers[#"gladiators_killed"];
		killed_by_gladiator = killed_by_gladiator + player.pers[#"killed_by_gladiator"];
		stokers_killed = stokers_killed + player.pers[#"stokers_killed"];
		killed_by_stoker = killed_by_stoker + player.pers[#"killed_by_stoker"];
		tigers_killed = tigers_killed + player.pers[#"tigers_killed"];
		killed_by_tiger = killed_by_tiger + player.pers[#"killed_by_tiger"];
		catalysts_killed = catalysts_killed + player.pers[#"catalysts_killed"];
		killed_by_catalyst = killed_by_catalyst + player.pers[#"killed_by_catalyst"];
		catalyst_electrics_killed = catalyst_electrics_killed + player.pers[#"catalyst_electrics_killed"];
		killed_by_catalyst_electric = killed_by_catalyst_electric + player.pers[#"killed_by_catalyst_electric"];
		catalyst_waters_killed = catalyst_waters_killed + player.pers[#"catalyst_waters_killed"];
		killed_by_catalyst_water = killed_by_catalyst_water + player.pers[#"killed_by_catalyst_water"];
		catalyst_plasmas_killed = catalyst_plasmas_killed + player.pers[#"catalyst_plasmas_killed"];
		killed_by_catalyst_plasma = killed_by_catalyst_plasma + player.pers[#"killed_by_catalyst_plasma"];
		catalyst_corrosives_killed = catalyst_corrosives_killed + player.pers[#"catalyst_corrosives_killed"];
		killed_by_catalyst_corrosive = killed_by_catalyst_corrosive + player.pers[#"killed_by_catalyst_corrosive"];
		nova_crawlers_killed = nova_crawlers_killed + player.pers[#"nova_crawlers_killed"];
		killed_by_nova_crawler = killed_by_nova_crawler + player.pers[#"killed_by_nova_crawler"];
		werewolves_killed = werewolves_killed + player.pers[#"werewolves_killed"];
		killed_by_werewolf = killed_by_werewolf + player.pers[#"killed_by_werewolf"];
		nosferatus_killed = nosferatus_killed + player.pers[#"nosferatus_killed"];
		killed_by_nosferatu = killed_by_nosferatu + player.pers[#"killed_by_nosferatu"];
		crimson_nosferatus_killed = crimson_nosferatus_killed + player.pers[#"crimson_nosferatus_killed"];
		killed_by_crimson_nosferatu = killed_by_crimson_nosferatu + player.pers[#"killed_by_crimson_nosferatu"];
		bats_killed = bats_killed + player.pers[#"bats_killed"];
	}
	game_mode = util::function_5df4294();
}

/*
	Name: get_specific_stat
	Namespace: zm_stats
	Checksum: 0xA6A8F684
	Offset: 0x85B8
	Size: 0x3A
	Parameters: 2
	Flags: None
*/
function get_specific_stat(stat_category, stat_name)
{
	return self stats::get_stat(stat_category, stat_name, #"statvalue");
}

/*
	Name: function_7741345e
	Namespace: zm_stats
	Checksum: 0x6DCDC95F
	Offset: 0x8600
	Size: 0x84
	Parameters: 4
	Flags: Linked
*/
function function_7741345e(player, w_current, n_shots_fired, n_hits)
{
	if(isdefined(n_shots_fired))
	{
		w_current function_301c4be2("boas_total_shots", n_shots_fired);
	}
	if(isdefined(n_hits) && n_hits > 0)
	{
		w_current function_301c4be2("boas_hits", n_hits);
	}
}

/*
	Name: function_b14863c1
	Namespace: zm_stats
	Checksum: 0x1A6DC1D6
	Offset: 0x8690
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_b14863c1()
{
	level endon(#"end_game");
	level thread function_cb8a5c29();
	level thread function_c5f9ea85();
	while(true)
	{
		level waittill(#"between_round_over", #"hash_5797e93787e36c6d");
		function_ea5b4947(0, 1);
	}
}

/*
	Name: function_cb8a5c29
	Namespace: zm_stats
	Checksum: 0x52418A6A
	Offset: 0x8730
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_cb8a5c29()
{
	while(true)
	{
		s_result = undefined;
		s_result = level waittilltimeout(60, #"hash_3fdaafe712252cf5", #"trap_kill");
		if(s_result._notify == "timeout")
		{
			level.var_b8cbd9e6 = 1;
			level waittill(#"hash_3fdaafe712252cf5", #"trap_kill");
			level.var_b8cbd9e6 = undefined;
		}
	}
}

/*
	Name: function_c5f9ea85
	Namespace: zm_stats
	Checksum: 0xD88EC067
	Offset: 0x87E8
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_c5f9ea85()
{
	level notify(#"hash_e3b3a7b31bbf19e");
	level endon(#"hash_e3b3a7b31bbf19e", #"end_game");
	foreach(player in level.players)
	{
		player.var_78c18942 = 0;
	}
	while(true)
	{
		wait(1);
		if(!is_true(level.var_b8cbd9e6))
		{
			foreach(player in level.players)
			{
				if(!isdefined(player.var_78c18942))
				{
					player.var_78c18942 = 0;
				}
				player.var_78c18942++;
			}
		}
	}
}

/*
	Name: function_ea5b4947
	Namespace: zm_stats
	Checksum: 0x72FE31D4
	Offset: 0x8960
	Size: 0x63C
	Parameters: 2
	Flags: Linked
*/
function function_ea5b4947(b_end_game, var_220c56da)
{
	if(!isdefined(b_end_game))
	{
		b_end_game = 0;
	}
	if(!isdefined(var_220c56da))
	{
		var_220c56da = 0;
	}
	if(!sessionmodeisonlinegame() || zm_utility::is_tutorial())
	{
		return;
	}
	players = getplayers();
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(is_true(var_220c56da) && !isbot(player) && isdefined(player.var_78c18942) && player.var_78c18942 > 0 && getdvarint(#"hash_2fd4aa73a8da1e9d", 1))
		{
			var_f406f7e3 = getdvarstring(#"hash_76753b91bfe8139b", "");
			total_time = int(player.var_78c18942 * getdvarfloat(#"hash_4ad8c9ef00dd61c3", 1));
			var_93480888 = int(player function_c52bcf79() * 100);
			if(var_f406f7e3 != "")
			{
				if(getdvarint(#"hash_69ce13758f53923d", 1))
				{
					currxp = player rank::getrankxp();
					xpearned = 0;
					if(isdefined(player.pers[#"hash_43ad5d1b08145b1f"]))
					{
						xpearned = currxp - player.pers[#"hash_43ad5d1b08145b1f"];
					}
					player.pers[#"hash_43ad5d1b08145b1f"] = currxp;
					/#
						println((((((("" + player.name) + "") + total_time) + "") + var_93480888) + "") + xpearned);
					#/
					var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 0);
					player function_cce105c8(hash(var_f406f7e3), 1, int(var_ae857992), 2, total_time, 3, var_93480888, 4, xpearned);
				}
				else
				{
					/#
						println((((("" + player.name) + "") + total_time) + "") + var_93480888);
					#/
					var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 0);
					player function_cce105c8(hash(var_f406f7e3), 1, int(var_ae857992), 2, total_time, 3, var_93480888);
				}
			}
		}
		if(isdefined(player.bgb_pack) && isarray(player.bgb_pack))
		{
			foreach(bgb in player.bgb_pack)
			{
				if(!isdefined(player.bgb_stats) || !isdefined(player.bgb_stats[bgb]) || !player.bgb_stats[bgb].bgb_used_this_game)
				{
					continue;
				}
				player reportlootconsume(bgb, player.bgb_stats[bgb].bgb_used_this_game);
				player.bgb_stats[bgb].var_c2a984f0 = player.bgb_stats[bgb].var_c2a984f0 - player.bgb_stats[bgb].bgb_used_this_game;
				player.bgb_stats[bgb].bgb_used_this_game = 0;
			}
		}
		player util::function_22bf0a4a();
	}
	if(!b_end_game)
	{
		level thread function_c5f9ea85();
	}
	contracts::function_4a56b14d();
	uploadstats();
	function_f4f6d8a1();
}

/*
	Name: function_94335f4a
	Namespace: zm_stats
	Checksum: 0x7002275E
	Offset: 0x8FA8
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_94335f4a(var_1aa5a6d6)
{
	level.var_1aa5a6d6 = var_1aa5a6d6;
	level.var_ad5d54b = [];
	n_row = 0;
	while(true)
	{
		n_event = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 0);
		if(!isdefined(n_event) || n_event > var_1aa5a6d6)
		{
			return;
		}
		if(n_event == var_1aa5a6d6)
		{
			if(!isdefined(level.var_6ad5a223))
			{
				level.var_6ad5a223 = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 1);
			}
			n_tier = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 2);
			var_e226ec4f = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 3);
			var_ad971622 = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 4);
			n_xp = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 6);
			var_1f2bdb95 = tablelookupcolumnforrow(#"hash_76ee9df26d2df66a", n_row, 7);
			/#
				var_6530064b = getdvarint(#"hash_74a04bcc32a59d68", 0);
				if(var_6530064b)
				{
					var_e226ec4f = var_6530064b;
				}
			#/
			level.var_ad5d54b[n_tier] = {#hash_1f2bdb95:var_1f2bdb95, #n_xp:n_xp, #hash_ad971622:var_ad971622, #hash_e226ec4f:var_e226ec4f};
		}
		n_row++;
	}
}

/*
	Name: function_c0c6ab19
	Namespace: zm_stats
	Checksum: 0xA4E38743
	Offset: 0x9218
	Size: 0x468
	Parameters: 3
	Flags: Linked
*/
function function_c0c6ab19(var_ad971622, n_value, var_b68b08b1)
{
	if(!isdefined(n_value))
	{
		n_value = 1;
	}
	if(!isdefined(var_b68b08b1))
	{
		var_b68b08b1 = 0;
	}
	/#
		assert(function_7a600918(var_ad971622), "");
	#/
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || (var_b68b08b1 && zm_utility::is_standard()))
	{
		return;
	}
	/#
		n_value = n_value * getdvarint(#"hash_56e2a9e5690e0373", 1);
	#/
	if(getdvarint(#"hash_27ff853067d7c38c", 0) && getdvarint(#"hash_74323bf8006c003f", 0) && isdefined(level.var_ad5d54b))
	{
		s_event_calling_task = level.var_ad5d54b[self function_3e561f63()];
		if(isdefined(s_event_calling_task) && s_event_calling_task.var_ad971622 == var_ad971622)
		{
			self function_7f377150(s_event_calling_task, n_value);
		}
	}
	if(getdvarint(#"hash_27ff853067d7c38c", 0) && getdvarint(#"hash_4ef2b14c3bfef02a", 0))
	{
		/#
			if(getdvar(#"hash_acdd08b365cb62f", 0))
			{
				var_a4aebab9 = getdvarint(#"hash_4ef2b14c3bfef02a", 0);
				if(var_a4aebab9)
				{
					function_e8c496dd(var_a4aebab9);
				}
				var_87b499fb = self stats::get_stat(#"hash_18e3320ccf4091e5", #"hash_487f0fce798b3a4b");
				var_8962d9b1 = (isdefined(level.var_d479261a) ? level.var_d479261a : 0);
				self stats::set_stat(#"hash_18e3320ccf4091e5", #"hash_487f0fce798b3a4b", var_8962d9b1);
				if(var_87b499fb !== var_8962d9b1)
				{
					self stats::set_stat(#"hash_18e3320ccf4091e5", #"progress", 0);
				}
			}
		#/
		if(isdefined(level.s_daily_calling_task) && level.s_daily_calling_task.var_ad971622 == var_ad971622)
		{
			self function_55109709(level.s_daily_calling_task, n_value);
		}
	}
	if(getdvarint(#"hash_11da02ca40639de5", 0))
	{
		if(isdefined(self.var_96d6f6d1))
		{
			foreach(var_4c74afc1 in self.var_96d6f6d1)
			{
				if(var_4c74afc1.var_ad971622 == var_ad971622)
				{
					self zm_callings::function_4368582a(var_4c74afc1, n_value);
				}
			}
		}
	}
}

/*
	Name: function_3e561f63
	Namespace: zm_stats
	Checksum: 0x66B80E65
	Offset: 0x9688
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_3e561f63()
{
	return self stats::get_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, "tierCompleted") + 1;
}

/*
	Name: function_7f377150
	Namespace: zm_stats
	Checksum: 0x3369F37A
	Offset: 0x96C8
	Size: 0x314
	Parameters: 2
	Flags: Linked
*/
function function_7f377150(s_event_calling_task, n_value)
{
	if(!isdefined(n_value))
	{
		n_value = 1;
	}
	var_e4edaaf0 = self stats::get_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, #"progress");
	if(var_e4edaaf0 < s_event_calling_task.var_e226ec4f)
	{
		if((var_e4edaaf0 + n_value) >= s_event_calling_task.var_e226ec4f)
		{
			self luinotifyevent(#"hash_675b38b81564449", 4, 0, level.var_1aa5a6d6, self function_3e561f63(), self getentitynumber());
			self stats::set_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, #"progress", 0);
			self stats::inc_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, #"tiercompleted", 1);
			self addrankxpvalue("event_calling_task", s_event_calling_task.n_xp, 5);
			self stats::set_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, s_event_calling_task.var_1f2bdb95, 1);
			uploadstats(self);
			/#
				println(((function_9e72a96(level.var_6ad5a223) + "") + self stats::get_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, "") + "") + function_9e72a96(s_event_calling_task.var_ad971622));
			#/
		}
		else
		{
			/#
				progress = var_e4edaaf0 + n_value;
				target = s_event_calling_task.var_e226ec4f;
				iprintln(((((self.name + "") + function_9e72a96(s_event_calling_task.var_ad971622) + "") + progress) + "") + target);
			#/
			self stats::inc_stat(#"hash_3b52e51401f0229c", level.var_6ad5a223, #"progress", n_value);
		}
	}
}

/*
	Name: function_e8c496dd
	Namespace: zm_stats
	Checksum: 0x157ADABE
	Offset: 0x99E8
	Size: 0x188
	Parameters: 1
	Flags: Linked
*/
function function_e8c496dd(var_d479261a)
{
	level.var_d479261a = var_d479261a;
	var_314051a1 = getscriptbundle(#"hash_7258efc12235efc9");
	if(isdefined(var_314051a1.var_4c2d4591) && isdefined(var_314051a1.var_4c2d4591[var_d479261a]))
	{
		task = var_314051a1.var_4c2d4591[var_d479261a];
		var_e199fb8a = getscriptbundle(task.task);
		if(isdefined(var_e199fb8a.var_38fc223d))
		{
			var_341c004b = undefined;
			for(i = 0; i < var_314051a1.var_df270379.size; i++)
			{
				if(var_314051a1.var_df270379[i].task == task.task)
				{
					var_341c004b = i;
					break;
				}
			}
			if(isdefined(var_341c004b))
			{
				level.s_daily_calling_task = {#hash_de86e878:var_341c004b, #n_xp:task.xp, #hash_ad971622:var_e199fb8a.var_38fc223d, #hash_e226ec4f:var_e199fb8a.var_61731cf1};
			}
		}
	}
}

/*
	Name: function_55109709
	Namespace: zm_stats
	Checksum: 0x2EE3A743
	Offset: 0x9B78
	Size: 0x304
	Parameters: 2
	Flags: Linked
*/
function function_55109709(s_daily_calling_task, n_value)
{
	if(!isdefined(n_value))
	{
		n_value = 1;
	}
	var_e4edaaf0 = self stats::get_stat(#"hash_18e3320ccf4091e5", #"progress");
	if(isdefined(var_e4edaaf0) && isdefined(s_daily_calling_task) && isdefined(s_daily_calling_task.var_e226ec4f) && var_e4edaaf0 < s_daily_calling_task.var_e226ec4f)
	{
		if((var_e4edaaf0 + n_value) >= s_daily_calling_task.var_e226ec4f)
		{
			self stats::set_stat(#"hash_18e3320ccf4091e5", #"progress", s_daily_calling_task.var_e226ec4f);
			self luinotifyevent(#"hash_675b38b81564449", 3, 1, s_daily_calling_task.var_de86e878, self getentitynumber());
			self addrankxpvalue("daily_calling_task", s_daily_calling_task.n_xp, 5);
			var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 2);
			uploadstats(self);
			self function_4835d26a();
			/#
				println("" + function_9e72a96(s_daily_calling_task.var_ad971622));
			#/
			/#
				iprintln((((self.name + "") + function_9e72a96(s_daily_calling_task.var_ad971622) + "") + s_daily_calling_task.n_xp) + "");
			#/
		}
		else
		{
			/#
				progress = var_e4edaaf0 + n_value;
				target = s_daily_calling_task.var_e226ec4f;
				iprintln(((((self.name + "") + function_9e72a96(s_daily_calling_task.var_ad971622) + "") + progress) + "") + target);
			#/
			self stats::inc_stat(#"hash_18e3320ccf4091e5", #"progress", n_value);
		}
	}
}

/*
	Name: function_12b698fa
	Namespace: zm_stats
	Checksum: 0x11DB7A87
	Offset: 0x9E88
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_12b698fa(statname)
{
	return self stats::function_6d50f14b(#"cacloadouts", #"hash_1b24e5b336f5ae8d", statname);
}

/*
	Name: function_1a222bee
	Namespace: zm_stats
	Checksum: 0xB89F970
	Offset: 0x9ED0
	Size: 0x472
	Parameters: 1
	Flags: Linked
*/
function function_1a222bee(params)
{
	if(isdefined(params.item.var_a6762160.weapon.statname) && !killstreaks::is_killstreak_weapon(params.item.var_a6762160.weapon))
	{
		switch(params.item.var_a6762160.weapon.statname)
		{
			case "energy_mine":
			case "hash_4ac3fda4add2a116":
			case "hash_4ac3fea4add2a2c9":
			case "hash_4ac3ffa4add2a47c":
			case "hash_4ac400a4add2a62f":
			case "hash_4ac402a4add2a995":
			{
				self stats::function_622feb0d(#"energy_mine", #"uses", 1);
				break;
			}
			case "hash_85edf3a63bb488c":
			case "hash_2f148f3f9c3812a8":
			case "hash_2f14913f9c38160e":
			case "hash_2f14923f9c3817c1":
			case "frost_blast_5":
			case "hash_2f14943f9c381b27":
			{
				self stats::function_622feb0d(#"hash_85edf3a63bb488c", #"uses", 1);
				break;
			}
			case "hash_379869d5b6da974b":
			case "hash_37986ad5b6da98fe":
			case "hash_37986bd5b6da9ab1":
			case "hash_37986cd5b6da9c64":
			case "hash_37986dd5b6da9e17":
			case "heal_aoe":
			{
				self stats::function_622feb0d(#"heal_aoe", #"uses", 1);
				break;
			}
			case "hash_6319e23758cd25e":
			case "hash_6319f23758cd411":
			case "hash_631a023758cd5c4":
			case "hash_631a123758cd777":
			case "hash_631a223758cd92a":
			case "ring_of_fire":
			{
				self stats::function_622feb0d(#"ring_of_fire", #"uses", 1);
				break;
			}
			case "hash_164c43cbd0ee958":
			case "hash_164c63cbd0eecbe":
			case "hash_164c73cbd0eee71":
			case "hash_164c83cbd0ef024":
			case "hash_164c93cbd0ef1d7":
			case "aether_shroud":
			{
				self stats::function_622feb0d(#"aether_shroud", #"uses", 1);
				break;
			}
			case "frag_grenade":
			{
				self stats::function_622feb0d(#"hash_34b7eb9fde56bd35", #"uses", 1);
				break;
			}
			case "hash_12f078ddc9b913c3":
			{
				self stats::function_622feb0d(#"nightingale", #"uses", 1);
				break;
			}
			default:
			{
				self stats::function_622feb0d(params.item.var_a6762160.weapon.statname, #"uses", 1);
				break;
			}
		}
	}
}

