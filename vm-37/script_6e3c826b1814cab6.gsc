#using script_2255a7ad3edc838f;
#using script_256b8879317373de;
#using script_3f9e0dc8454d98e1;
#using script_4d000493c57bb851;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_59ff1d6c;

/*
	Name: function_d776b402
	Namespace: namespace_59ff1d6c
	Checksum: 0x4CB13844
	Offset: 0x5A8
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_d776b402()
{
}

/*
	Name: function_901b751c
	Namespace: namespace_59ff1d6c
	Checksum: 0x9571D70C
	Offset: 0x7E8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_901b751c(var_c9db62d5)
{
	if(var_c9db62d5 === "")
	{
		return undefined;
	}
	setting = getgametypesetting(var_c9db62d5);
	/#
		/#
			assert(isdefined(setting), ("" + function_9e72a96(var_c9db62d5)) + "");
		#/
	#/
	return setting;
}

/*
	Name: function_16020b98
	Namespace: namespace_59ff1d6c
	Checksum: 0x9E394FBB
	Offset: 0x878
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_16020b98(var_c9db62d5)
{
	var_134dedef = function_a8e9a6c7();
	foreach(s_setting in var_134dedef)
	{
		if(var_c9db62d5 == s_setting.name)
		{
			return s_setting.default_val;
		}
	}
	return undefined;
}

/*
	Name: function_9be9c072
	Namespace: namespace_59ff1d6c
	Checksum: 0x68FB545F
	Offset: 0x938
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_9be9c072(var_c9db62d5)
{
	foreach(e_player in level.players)
	{
		e_player val::set(#"game_end", "freezecontrols", 1);
	}
	level notify(#"end_game");
}

/*
	Name: function_8b8fa6e5
	Namespace: namespace_59ff1d6c
	Checksum: 0xF70D8DBB
	Offset: 0xA00
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_8b8fa6e5(e_player)
{
	foreach(str_perk in level.var_b8be892e)
	{
		if(!e_player hasperk(str_perk))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_928be07c
	Namespace: namespace_59ff1d6c
	Checksum: 0x4819B588
	Offset: 0xAB0
	Size: 0x292
	Parameters: 1
	Flags: Linked
*/
function function_928be07c(var_6a59aecf)
{
	if(isdefined(var_6a59aecf))
	{
		var_7df0eb2d = var_6a59aecf;
		level.friendlyfire = var_6a59aecf;
		setgametypesetting(#"hash_3f8f02e8109b6e93", var_6a59aecf);
		setdvar(#"ui_friendlyfire", var_6a59aecf);
	}
	else
	{
		var_7df0eb2d = function_901b751c(#"hash_3f8f02e8109b6e93");
	}
	switch(var_7df0eb2d)
	{
		case 0:
		{
			zm_player::function_a8846426(&function_e57809dd);
			zm_player::function_a8846426(&function_4225c3b7);
			zm_player::function_a8846426(&function_6607cdee);
			break;
		}
		case 1:
		{
			zm_player::function_a8846426(&function_4225c3b7);
			zm_player::function_a8846426(&function_6607cdee);
			zm_player::register_player_friendly_fire_callback(&function_e57809dd);
			break;
		}
		case 2:
		{
			zm_player::function_a8846426(&function_e57809dd);
			zm_player::function_a8846426(&function_6607cdee);
			zm_player::register_player_friendly_fire_callback(&function_4225c3b7);
			break;
		}
		case 3:
		{
			zm_player::function_a8846426(&function_e57809dd);
			zm_player::function_a8846426(&function_4225c3b7);
			zm_player::register_player_friendly_fire_callback(&function_6607cdee);
			break;
		}
	}
}

/*
	Name: function_ff4557dc
	Namespace: namespace_59ff1d6c
	Checksum: 0x7450FC7B
	Offset: 0xD50
	Size: 0xC86
	Parameters: 1
	Flags: None
*/
function function_ff4557dc(s_talisman)
{
	if(!function_901b751c(#"hash_2d27d80d1acf8b31"))
	{
		return false;
	}
	switch(s_talisman.name)
	{
		case "talisman_box_guarantee_box_only":
		{
			if(!function_901b751c(#"hash_453fcfbee32e3655") || function_901b751c(#"hash_4e0ec3fe56f08b47") == 0)
			{
				return false;
			}
			break;
		}
		case "talisman_box_guarantee_lmg":
		{
			if(!function_901b751c(#"hash_1b59bb7608355512") || !function_901b751c(#"hash_2f6740b518dbeb8f") || function_901b751c(#"hash_4e0ec3fe56f08b47") == 0)
			{
				return false;
			}
			break;
		}
		case "talisman_coagulant":
		{
			if(!function_901b751c(#"hash_38a8f3cfef7b86d1"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_claymore":
		{
			if(!function_901b751c(#"hash_17917e00de6b437"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_frag":
		{
			if(!function_901b751c(#"hash_66a78ac345a3e2bb"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_miniturret":
		{
			if(!function_901b751c(#"hash_752eba9759a4a52a"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_molotov":
		{
			if(!function_901b751c(#"hash_76943d48d878715f"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_semtex":
		{
			if(!function_901b751c(#"hash_7c61b02fb56f7f"))
			{
				return false;
			}
			break;
		}
		case "talisman_impatient":
		{
			if(!function_901b751c(#"hash_2001987d25a3717a"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_mod_single":
		{
			if(!function_901b751c(#"hash_63bf3e5a51cb8fad"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_1":
		{
			if(!function_901b751c(#"hash_2f51e04634dafe36") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_2":
		{
			if(!function_901b751c(#"hash_2f51df4634dafc83") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_3":
		{
			if(!function_901b751c(#"hash_2f51de4634dafad0") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_4":
		{
			if(!function_901b751c(#"hash_2f51e54634db06b5") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_1":
		{
			if(!function_901b751c(#"hash_56db42b55542ec33") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_2":
		{
			if(!function_901b751c(#"hash_56db43b55542ede6") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_3":
		{
			if(!function_901b751c(#"hash_56db44b55542ef99") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_4":
		{
			if(!function_901b751c(#"hash_56db45b55542f14c") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_1":
		{
			if(!function_901b751c(#"hash_6fe0ba92c67980e8") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_2":
		{
			if(!function_901b751c(#"hash_6fe0bd92c6798601") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_3":
		{
			if(!function_901b751c(#"hash_6fe0bc92c679844e") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_4":
		{
			if(!function_901b751c(#"hash_6fe0bf92c6798967") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "talisman_shield_durability_legendary":
		{
			if(!function_901b751c(#"hash_4f973a92562bc3b6") || !function_901b751c(#"zmshieldisenabled"))
			{
				return false;
			}
			break;
		}
		case "talisman_shield_durability_rare":
		{
			if(!function_901b751c(#"hash_36d19199d37d4549") || !function_901b751c(#"zmshieldisenabled"))
			{
				return false;
			}
			break;
		}
		case "talisman_shield_price":
		{
			if(!function_901b751c(#"hash_42c6d1ca5eab82ab") || !function_901b751c(#"zmshieldisenabled"))
			{
				return false;
			}
			break;
		}
		case "talisman_special_startlv2":
		{
			if(!function_901b751c(#"hash_3efef475c9de052e"))
			{
				return false;
			}
			break;
		}
		case "talisman_special_startlv3":
		{
			if(!function_901b751c(#"hash_3efef575c9de06e1"))
			{
				return false;
			}
			break;
		}
		case "talisman_special_xp_rate":
		{
			if(!function_901b751c(#"hash_e1f30cc8f6f3150"))
			{
				return false;
			}
			break;
		}
		case "talisman_start_weapon_ar":
		{
			if(!function_901b751c(#"hash_19a9d40272333762"))
			{
				return false;
			}
			break;
		}
		case "talisman_start_weapon_lmg":
		{
			if(!function_901b751c(#"hash_711db227d86cc407"))
			{
				return false;
			}
			break;
		}
		case "talisman_start_weapon_smg":
		{
			if(!function_901b751c(#"hash_6a6e4728651aff36"))
			{
				return false;
			}
			break;
		}
		case "talisman_weapon_reducepapcost":
		{
			if(!function_901b751c(#"hash_4c81f5aeddae88f"))
			{
				return false;
			}
			break;
		}
		case "talisman_permanent_heroweap_armor":
		{
			if(!function_901b751c(#"hash_7f55e280d866341d"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_self_revive":
		{
			if(!function_901b751c(#"hash_12ee429bb9ce771c"))
			{
				return false;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(s_talisman.rarity))
	{
		switch(s_talisman.rarity)
		{
			case 0:
			{
				if(!function_901b751c(#"hash_47e07053890b9c29"))
				{
					return false;
				}
				break;
			}
			case 1:
			{
				if(!function_901b751c(#"hash_587f074e4104cfb0"))
				{
					return false;
				}
				break;
			}
			case 2:
			{
				if(!function_901b751c(#"hash_24ff1fa68e880afd"))
				{
					return false;
				}
				break;
			}
			case 3:
			{
				if(!function_901b751c(#"hash_e6a46ef644c01bd"))
				{
					return false;
				}
				break;
			}
			case 4:
			{
				if(!function_901b751c(#"hash_2979ae0cd8913eaa"))
				{
					return false;
				}
				break;
			}
			default:
			{
				break;
			}
		}
	}
	return true;
}

/*
	Name: function_3ac936c6
	Namespace: namespace_59ff1d6c
	Checksum: 0x13B3BD4F
	Offset: 0x19E0
	Size: 0x15AE
	Parameters: 1
	Flags: Linked
*/
function function_3ac936c6(var_ce5ed2e9)
{
	if(!isdefined(var_ce5ed2e9) || var_ce5ed2e9 == "" || !function_901b751c(#"hash_137eb8d53913f781"))
	{
		return false;
	}
	n_index = getitemindexfromref(var_ce5ed2e9);
	var_2ca2b333 = function_b143666d(n_index, 2);
	if(isdefined(var_2ca2b333) && isdefined(var_2ca2b333.var_f5aaa47e))
	{
		var_c16a4a5b = var_2ca2b333.var_f5aaa47e;
	}
	if(!isdefined(var_c16a4a5b))
	{
		var_c16a4a5b = 0;
	}
	switch(var_ce5ed2e9)
	{
		case "zm_bgb_always_done_swiftly":
		{
			if(!function_901b751c(#"hash_4006dac21ea0736"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_anywhere_but_here":
		{
			if(!function_901b751c(#"hash_6230ef2b089aad7f"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_arsenal_accelerator":
		{
			if(!function_901b751c(#"hash_1ce5566dde9ed686") || !function_901b751c(#"hash_b066c34278e6394"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_danger_closest":
		{
			if(!function_901b751c(#"hash_3a534a2a0f3eedd3"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_in_plain_sight":
		{
			if(!function_901b751c(#"hash_3ee97a6ab720cc15"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_newtonian_negation":
		{
			if(!function_901b751c(#"hash_4f82e568f5e2c04f"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_now_you_see_me":
		{
			if(!function_901b751c(#"hash_1a8ee5887f138e39"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_stock_option":
		{
			if(!function_901b751c(#"hash_3fecdaec6642d3ba"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_board_games":
		{
			if(!function_901b751c(#"hash_4aa214604d696f70") || !function_901b751c(#"hash_3386caa315211c88"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_burned_out":
		{
			if(!function_901b751c(#"hash_41f269ab6574b3bd"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_crawl_space":
		{
			if(!function_901b751c(#"hash_49b95e3ba4d2d2f8") || function_901b751c(#"hash_5946034af4372f2d") == 0)
			{
				return false;
			}
			break;
		}
		case "zm_bgb_pop_shocks":
		{
			if(!function_901b751c(#"hash_1929dd7083c365c5"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_temporal_gift":
		{
			if(!function_901b751c(#"hash_14aa3cb07d2c0db") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "hash_177ea318753f5418":
		{
			if(!function_901b751c(#"hash_6d490d5a824c0d83") || !function_901b751c(#"zmpowerupchaospoints") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_alchemical_antithesis":
		{
			if(!function_901b751c(#"hash_7aff42262b4eee32") || function_901b751c(#"hash_1735a88a32111a1b"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_sword_flay":
		{
			if(!function_901b751c(#"hash_3a7bd9c02b9fce98") || !function_901b751c(#"hash_716db8c2d7fcacfb"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_dead_of_nuclear_winter":
		{
			if(!function_901b751c(#"hash_4ca897d3295f6257") || !function_901b751c(#"zmpowerupnuke") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_licensed_contractor":
		{
			if(!function_901b751c(#"hash_3197061ec31dc27d") || !function_901b751c(#"zmpowerupcarpenter") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_undead_man_walking":
		{
			if(!function_901b751c(#"hash_7dadb18509506169"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_whos_keeping_score":
		{
			if(!function_901b751c(#"hash_716d4768994b25a5") || !function_901b751c(#"zmpowerupdouble") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_aftertaste":
		{
			if(!function_901b751c(#"hash_26468de196046e72"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_extra_credit":
		{
			if(!function_901b751c(#"hash_ddf4eed89a60b8e") || !function_901b751c(#"zmpowerupchaospoints") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_kill_joy":
		{
			if(!function_901b751c(#"hash_72581cab09b5c9f") || !function_901b751c(#"zmpowerupinstakill") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_soda_fountain":
		{
			if(!function_901b751c(#"hash_7d1fb9161dddf722") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "hash_6953696819bf1875":
		{
			if(!function_901b751c(#"hash_2a779251ef8c8568"))
			{
				return false;
			}
			break;
		}
		case "hash_b69b008e289ded4":
		{
			if(!function_901b751c(#"hash_7ae3c77e1ebdc90d"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_cache_back":
		{
			if(!function_901b751c(#"hash_560c19249d1b9390") || !function_901b751c(#"zmpowerupmaxammo") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_immolation_liquidation":
		{
			if(!function_901b751c(#"hash_78a2cab12f0c5a89") || !function_901b751c(#"zmpowerupfiresale") || !function_901b751c(#"zmpowerupsactive") || function_901b751c(#"hash_4e0ec3fe56f08b47") == 0)
			{
				return false;
			}
			break;
		}
		case "zm_bgb_phoenix_up":
		{
			if(!function_901b751c(#"hash_13ac6983716eb72b") || !function_901b751c(#"hash_70517c36d49b4ee0"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_power_keg":
		{
			if(!function_901b751c(#"hash_1dd3d19705899dbd") || !function_901b751c(#"hash_b066c34278e6394") || !function_901b751c(#"zmpowerupspecialweapon") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "hash_74496e1b656c6651":
		{
			if(!function_901b751c(#"hash_6e84a4012ddf8a24"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_near_death_experience":
		{
			if(!function_901b751c(#"hash_77ff67c16576e231"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_perkaholic":
		{
			if(!function_901b751c(#"hash_6df1564c342c831") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_wall_power":
		{
			if(!function_901b751c(#"hash_33d900f7b3d14128") || function_901b751c(#"hash_19d48a0d4490b0a2") == 0)
			{
				return false;
			}
			break;
		}
		case "hash_7c80df83e002a4d6":
		{
			if(!function_901b751c(#"hash_a0db64bb19e18af"))
			{
				return false;
			}
			break;
		}
		case "hash_18932d2054c58cd0":
		{
			if(!function_901b751c(#"hash_3a9e56ae10cf58c9"))
			{
				return false;
			}
			break;
		}
		case "hash_7822c558a509de9":
		{
			if(!function_901b751c(#"hash_792079610dfac24"))
			{
				return false;
			}
			break;
		}
		case "hash_39376ab9d627e38a":
		{
			if(!function_901b751c(#"hash_3e98c2376cacd382"))
			{
				return false;
			}
			break;
		}
		case "hash_a303f67afd6f4a8":
		{
			if(!function_901b751c(#"hash_3b83acfd4b361e44"))
			{
				return false;
			}
			break;
		}
		case "hash_560ca45c0a2daef2":
		{
			if(!function_901b751c(#"hash_5edb895e9d0880f9"))
			{
				return false;
			}
			break;
		}
		case "hash_56d3df5058c56523":
		{
			if(!function_901b751c(#"hash_5d9ddfa547ec765e") || !function_901b751c("zmShieldIsEnabled"))
			{
				return false;
			}
			break;
		}
		case "hash_4a6b297c85fafec1":
		{
			if(!function_901b751c(#"hash_45118b5f6d97c89a"))
			{
				return false;
			}
			break;
		}
		case "hash_465c22731c18755c":
		{
			if(!function_901b751c(#"hash_448716023024b395") || function_901b751c(#"hash_19d48a0d4490b0a2") == 0)
			{
				return false;
			}
			break;
		}
		case "hash_16f5a81348e35487":
		{
			if(!function_901b751c(#"hash_4b30109cd344258e") || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
			{
				return false;
			}
			break;
		}
		case "hash_242c2a18cea5e1":
		{
			if(!function_901b751c(#"hash_eef480bd7662082") || (!function_901b751c(#"hash_65a1298089d361f1") && !function_901b751c(#"hash_b066c34278e6394")))
			{
				return false;
			}
			break;
		}
		case "hash_2fd8f0866dbeda28":
		{
			if(!function_901b751c(#"hash_46436f50faf41689"))
			{
				return false;
			}
			break;
		}
		case "hash_53f12a7ebb3e91ac":
		{
			if(!function_901b751c(#"hash_165ba2184c27828f"))
			{
				return false;
			}
			break;
		}
		case "hash_40ff20dc353ceb63":
		{
			if(!function_901b751c(#"hash_16700855b131a427"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_bullet_boost":
		{
			if(!function_901b751c(#"hash_1b74d1759bd25756"))
			{
				return false;
			}
			break;
		}
		case "hash_1455490b99d4cbbb":
		{
			if(!function_901b751c(#"hash_176d5e7bffcf1e3d"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_near_death_experience":
		{
			if(!function_901b751c(#"hash_77ff67c16576e231"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_shopping_free":
		{
			if(!function_901b751c(#"hash_6bec3890ea83d709"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_phoenix_up":
		{
			if(!function_901b751c(#"hash_13ac6983716eb72b"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_perkaholic":
		{
			if(!function_901b751c(#"hash_6df1564c342c831"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_reign_drops":
		{
			if(!function_901b751c(#"hash_b0befcbac8aede6") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_head_drama":
		{
			if(!function_901b751c(#"hash_25aabd057794561c"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_power_vacuum":
		{
			if(!function_901b751c(#"hash_24e500e1b323daf7") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_secret_shopper":
		{
			if(!function_901b751c(#"hash_6821e81969996ece") || !function_901b751c(#"hash_51a2cf319e12d9ae"))
			{
				return false;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	switch(var_c16a4a5b)
	{
		case 0:
		{
			if(!function_901b751c(#"hash_3ab7cedcfef7eacc"))
			{
				return false;
			}
			break;
		}
		case 2:
		{
			if(!function_901b751c(#"hash_5374d50efd1e6b59"))
			{
				return false;
			}
			break;
		}
		case 3:
		{
			if(!function_901b751c(#"hash_5e1f08b8335a0ce0"))
			{
				return false;
			}
			break;
		}
		case 5:
		{
			if(!function_901b751c(#"hash_5746674cbab8264d"))
			{
				return false;
			}
			break;
		}
		case 4:
		{
			if(!function_901b751c(#"hash_7ea1426ffa93f34d"))
			{
				return false;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	return true;
}

/*
	Name: function_bce642a1
	Namespace: namespace_59ff1d6c
	Checksum: 0x5FD4C1A3
	Offset: 0x2F98
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_bce642a1(s_weap)
{
	if(s_weap.itemgroupname === "weapon_cqb" && !function_901b751c(#"hash_edfb07f798aaab5") || (s_weap.itemgroupname === "weapon_smg" && !function_901b751c(#"hash_1f6665b5581f6b6e")) || (s_weap.itemgroupname === "weapon_assault" && !function_901b751c(#"hash_1d5c8e6f0e20201a")) || (s_weap.itemgroupname === "weapon_tactical" && !function_901b751c(#"hash_1d88786f0e4535a3")) || (s_weap.itemgroupname === "weapon_lmg" && !function_901b751c(#"hash_2f6740b518dbeb8f")) || (s_weap.itemgroupname === "weapon_sniper" && !function_901b751c(#"hash_5bfd047c58816496")))
	{
		return false;
	}
	return true;
}

/*
	Name: function_d9f0defb
	Namespace: namespace_59ff1d6c
	Checksum: 0x10DE8468
	Offset: 0x3138
	Size: 0x496
	Parameters: 1
	Flags: None
*/
function function_d9f0defb(str_perk)
{
	if(!isdefined(str_perk) || !function_901b751c(#"hash_3d18f84f48bd5d1f"))
	{
		return false;
	}
	switch(str_perk)
	{
		case "hash_47d7a8105237c88":
		{
			if(!function_901b751c(#"hash_7520ccdc8dcaee8d"))
			{
				return false;
			}
			break;
		}
		case "hash_5930cf0eb070e35a":
		{
			if(!function_901b751c(#"hash_8edd17a31990450"))
			{
				return false;
			}
			break;
		}
		case "hash_7f98b3dd3cce95aa":
		{
			if(!function_901b751c(#"hash_4a827056d0e273fd"))
			{
				return false;
			}
			break;
		}
		case "specialty_widowswine":
		{
			if(!function_901b751c(#"hash_557e3edd7fe168c3"))
			{
				return false;
			}
			break;
		}
		case "hash_602a1b6107105f07":
		{
			if(!function_901b751c(#"hash_3a15ddcc25d689f6"))
			{
				return false;
			}
			break;
		}
		case "specialty_additionalprimaryweapon":
		{
			if(!function_901b751c(#"hash_5347ff402123307a"))
			{
				return false;
			}
			break;
		}
		case "specialty_electriccherry":
		{
			if(!function_901b751c(#"hash_77c5cc2d9b6ca16c"))
			{
				return false;
			}
			break;
		}
		case "hash_210097a75bb6c49a":
		{
			if(!function_901b751c(#"hash_26407356b81a1957"))
			{
				return false;
			}
			break;
		}
		case "hash_37aa3a5919757781":
		{
			if(!function_901b751c(#"hash_1e9fb2463e6eee58"))
			{
				return false;
			}
			break;
		}
		case "hash_5b141f82a55645a9":
		{
			if(!function_901b751c(#"hash_31b19618ca4f41"))
			{
				return false;
			}
			break;
		}
		case "specialty_phdflopper":
		{
			if(!function_901b751c(#"hash_402b9d6529500b72"))
			{
				return false;
			}
			break;
		}
		case "hash_34c7d1e8a059f87e":
		{
			if(!function_901b751c(#"hash_5690c4dcc61973ec"))
			{
				return false;
			}
			break;
		}
		case "specialty_extraammo":
		{
			if(!function_901b751c(#"hash_1bdfb5736ad174a3"))
			{
				return false;
			}
			break;
		}
		case "hash_5706909bc1db0f85":
		{
			if(!function_901b751c(#"hash_7d2a55a87f693582"))
			{
				return false;
			}
			break;
		}
		case "specialty_shield":
		{
			if(!function_901b751c(#"hash_2dd9d538ca5bc2d6"))
			{
				return false;
			}
			break;
		}
		case "hash_66e6fbe3cc2aff65":
		{
			if(!function_901b751c(#"hash_179ae09979e80714"))
			{
				return false;
			}
			break;
		}
		case "hash_6da63d760c1788e2":
		{
			if(!function_901b751c(#"hash_2635890f53e8633d"))
			{
				return false;
			}
			break;
		}
		case "hash_36b9957a693185ea":
		{
			if(!function_901b751c(#"hash_49c28f0b2a623fa5"))
			{
				return false;
			}
			break;
		}
		case "hash_4519dc1d3ac79139":
		{
			if(!function_901b751c(#"hash_75ec38c3f3487d5"))
			{
				return false;
			}
			break;
		}
		default:
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_2717f4b3
	Namespace: namespace_59ff1d6c
	Checksum: 0x4C7B4DC7
	Offset: 0x35D8
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_2717f4b3()
{
	var_17b7891d = "53d3ed6b43743770" + "talismanmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(9);
	self iprintlnbold(#"hash_329de7d3aa04177c");
}

/*
	Name: function_deae84ba
	Namespace: namespace_59ff1d6c
	Checksum: 0x6DCCC2FF
	Offset: 0x3688
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_deae84ba()
{
	var_17b7891d = "b004e24506319a1" + "elixirmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(10);
	self iprintlnbold(#"hash_6d446c2466f066ac");
}

/*
	Name: function_343353f8
	Namespace: namespace_59ff1d6c
	Checksum: 0xFB408A01
	Offset: 0x3738
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_343353f8()
{
	var_17b7891d = "782fe6896ef7bb67" + "weaponmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(8);
	self iprintlnbold(#"hash_1225b8e31a9ffb76");
}

/*
	Name: function_41ed4017
	Namespace: namespace_59ff1d6c
	Checksum: 0x9BD27A48
	Offset: 0x37E8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_41ed4017()
{
	var_17b7891d = "9762621e9270e3" + "perkmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(11);
	if(!is_true(level.var_5f7c5b5d))
	{
		self iprintlnbold(#"hash_d77fc2d11c6deb1");
	}
}

/*
	Name: function_928e94b9
	Namespace: namespace_59ff1d6c
	Checksum: 0x50CEBB09
	Offset: 0x38B0
	Size: 0x298
	Parameters: 1
	Flags: None
*/
function function_928e94b9(var_18f3c565)
{
	foreach(str_archetype in var_18f3c565)
	{
		str_archetype = hash(str_archetype);
		if(isinarray(array(#"blight_father", #"brutus", #"gegenees", #"mechz", #"hash_7c0d83ac1e845ac2"), str_archetype) && function_901b751c(#"hash_4269e873a0c207c") == 0)
		{
			return true;
		}
		if(isinarray(array(#"stoker", #"gladiator", #"gladiator_marauder", #"gladiator_destroyer", #"werewolf", #"avogadro", #"raz"), str_archetype) && function_901b751c(#"hash_69262a31e0f8f91c") == 0)
		{
			return true;
		}
		if(isinarray(array(#"bat", #"dog", #"zombie_dog", #"zombie"), str_archetype) && function_901b751c(#"hash_4035c12ee5837454") == 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_e1f04ede
	Namespace: namespace_59ff1d6c
	Checksum: 0x657C6EF2
	Offset: 0x3B50
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_e1f04ede()
{
	if(function_901b751c(#"zmpowerupsislimitedround") && level.powerup_drop_count >= function_901b751c(#"hash_d46a4e7a41e005c"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_318d417b
	Namespace: namespace_59ff1d6c
	Checksum: 0xC5AF4152
	Offset: 0x3BB8
	Size: 0x256
	Parameters: 1
	Flags: None
*/
function function_318d417b(e_player)
{
	self endon(#"death");
	e_player endon(#"disconnect");
	if(!zm_perks::vending_trigger_can_player_use(e_player, 1))
	{
		waitframe(1);
		return;
	}
	n_slot = self.stub.script_int;
	n_cost = 2000;
	var_ffc1cdd8 = e_player.var_c27f1e90[n_slot];
	if(!e_player zm_score::can_player_purchase(n_cost))
	{
		self playsound(#"evt_perk_deny");
		e_player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
		waitframe(1);
		return;
	}
	e_player zm_score::minus_to_player_score(n_cost);
	e_player.var_ec426a71 = 1;
	sound = "evt_bottle_dispense";
	playsoundatposition(sound, self.origin);
	var_cc1db3c1 = array::exclude(level.var_b8be892e, e_player.perks_active);
	e_player.var_62fef0f1 = array::random(var_cc1db3c1);
	if(!isdefined(e_player.var_62fef0f1))
	{
		waitframe(1);
		return;
	}
	e_player.var_c27f1e90[n_slot] = e_player.var_62fef0f1;
	e_player notify(#"perk_purchased", {#perk:e_player.var_62fef0f1});
	e_player thread zm_perks::function_4acf7b43(n_slot, e_player.var_62fef0f1);
	self thread zm_perks::taking_cover_tanks_(e_player, e_player.var_62fef0f1, n_slot);
	e_player.var_ec426a71 = 0;
}

/*
	Name: function_8e7a6cf
	Namespace: namespace_59ff1d6c
	Checksum: 0x27CBE889
	Offset: 0x3E18
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function function_8e7a6cf()
{
	if(function_3f3752ab())
	{
		return false;
	}
	return true;
}

/*
	Name: function_3f3752ab
	Namespace: namespace_59ff1d6c
	Checksum: 0xAFB58269
	Offset: 0x3E40
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_3f3752ab()
{
	if(util::function_5df4294() != "zclassic")
	{
		return false;
	}
	var_134dedef = function_a8e9a6c7();
	foreach(s_default in var_134dedef)
	{
		if(function_901b751c(s_default.name) !== s_default.default_val)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_db030433
	Namespace: namespace_59ff1d6c
	Checksum: 0x2A66254A
	Offset: 0x3F28
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_db030433()
{
	self clientfield::increment_uimodel("zmhud.damage_point_shake");
}

/*
	Name: function_74b79f63
	Namespace: namespace_59ff1d6c
	Checksum: 0xF956E73F
	Offset: 0x3F58
	Size: 0x1054
	Parameters: 0
	Flags: Linked, Private
*/
function private function_74b79f63()
{
	level thread function_214e109e();
	function_cd05a082();
	function_5b526135();
	function_928be07c();
	level waittill(#"all_players_spawned");
	function_7a8180ae();
	wait(5);
	switch(function_901b751c(#"hash_2c6b5594940cc305"))
	{
		case 1:
		default:
		{
			break;
		}
		case 2:
		{
			players = getplayers();
			var_4506f72b = getentarray("zombie_door", "targetname");
			foreach(door in arraycopy(var_4506f72b))
			{
				if(isdefined(level.var_f3a008f))
				{
					if(is_true(door [[level.var_f3a008f]]()))
					{
						arrayremovevalue(var_4506f72b, door);
					}
				}
			}
			if(isdefined(level.var_229f30cd))
			{
				level thread [[level.var_229f30cd]](var_4506f72b);
			}
			else
			{
				for(i = 0; i < var_4506f72b.size; i++)
				{
					if(!is_true(var_4506f72b[i].has_been_opened))
					{
						var_4506f72b[i] notify(#"trigger", {#is_forced:1});
					}
					waitframe(1);
				}
				var_38a6b7d0 = getentarray("zombie_airlock_buy", "targetname");
				for(i = 0; i < var_38a6b7d0.size; i++)
				{
					var_38a6b7d0[i] notify(#"trigger", {#is_forced:1});
					waitframe(1);
				}
				a_zombie_debris = getentarray("zombie_debris", "targetname");
				for(i = 0; i < a_zombie_debris.size; i++)
				{
					if(isdefined(a_zombie_debris[i]))
					{
						a_zombie_debris[i] notify(#"trigger", {#is_forced:1});
					}
					waitframe(1);
				}
			}
		}
	}
	switch(function_901b751c(#"hash_29004a67830922b6"))
	{
		case 1:
		default:
		{
			break;
		}
		case 2:
		{
			var_4506f72b = getentarray("zombie_door", "targetname");
			foreach(door in var_4506f72b)
			{
				if(!isdefined(door.script_noteworthy) || !isdefined(door.classname))
				{
					continue;
				}
				if(isdefined(level.var_f3a008f))
				{
					if(is_true(door [[level.var_f3a008f]]()))
					{
						continue;
					}
				}
				if(door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")
				{
					door thread zm_blockers::door_opened();
					if(isdefined(level.temporary_power_switch_logic))
					{
						door.power_on = 1;
					}
					continue;
				}
				if(door.script_noteworthy === "local_electric_door")
				{
					door thread zm_blockers::door_opened();
				}
			}
		}
	}
	switch(function_901b751c(#"zmpowerstate"))
	{
		case 1:
		{
			break;
		}
		case 2:
		{
			level flag::set("power_on");
			level flag::set(#"hash_3e80d503318a5674");
			if(function_901b751c(#"hash_29004a67830922b6") == 1)
			{
				var_4506f72b = getentarray("zombie_door", "targetname");
				foreach(door in var_4506f72b)
				{
					if(!isdefined(door.script_noteworthy) || !isdefined(door.classname))
					{
						continue;
					}
					if(isdefined(level.var_f3a008f))
					{
						if(is_true(door [[level.var_f3a008f]]()))
						{
							continue;
						}
					}
					if(door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")
					{
						door thread zm_blockers::door_opened();
						if(isdefined(level.temporary_power_switch_logic))
						{
							door.power_on = 1;
						}
						continue;
					}
					if(door.script_noteworthy === "local_electric_door")
					{
						door thread zm_blockers::door_opened();
					}
				}
			}
		}
		case 0:
		{
			a_trigs = getentarray("use_elec_switch", "targetname");
			foreach(trig in a_trigs)
			{
				trig notify(#"hash_21e36726a7f30458");
				trig delete();
			}
			break;
		}
		default:
		{
		}
	}
	if(!function_901b751c(#"zmpowerupnuke"))
	{
		zm_powerups::powerup_remove_from_regular_drops("nuke");
	}
	if(!function_901b751c(#"zmpowerupdouble"))
	{
		zm_powerups::powerup_remove_from_regular_drops("double_points");
	}
	if(!function_901b751c(#"zmpowerupinstakill"))
	{
		zm_powerups::powerup_remove_from_regular_drops("insta_kill");
	}
	if(!function_901b751c(#"zmpowerupchaospoints"))
	{
		zm_powerups::powerup_remove_from_regular_drops("bonus_points_player");
		zm_powerups::powerup_remove_from_regular_drops("bonus_points_team");
	}
	if(!function_901b751c(#"zmpowerupfiresale"))
	{
		zm_powerups::powerup_remove_from_regular_drops("fire_sale");
	}
	if(!function_901b751c(#"zmpowerupspecialweapon") || !function_901b751c(#"hash_b066c34278e6394"))
	{
		zm_powerups::powerup_remove_from_regular_drops("hero_weapon_power");
	}
	if(!function_901b751c(#"zmpowerupfreeperk"))
	{
		zm_powerups::powerup_remove_from_regular_drops("free_perk");
	}
	if(!function_901b751c(#"zmpowerupmaxammo"))
	{
		zm_powerups::powerup_remove_from_regular_drops("full_ammo");
	}
	if(!function_901b751c(#"zmpowerupcarpenter"))
	{
		zm_powerups::powerup_remove_from_regular_drops("carpenter");
	}
	if(!isdefined(level.var_cbc6587a))
	{
		level.var_cbc6587a = [];
	}
	foreach(s_weap in level.zombie_weapons)
	{
		if(s_weap.weapon_classname == "pistol" && !function_901b751c(#"hash_6f1440098d849316") || (s_weap.weapon_classname == "shotgun" && !function_901b751c(#"hash_edfb07f798aaab5")) || (s_weap.weapon_classname == "smg" && !function_901b751c(#"hash_1f6665b5581f6b6e")) || (s_weap.weapon_classname == "ar" && !function_901b751c(#"hash_1d5c8e6f0e20201a")) || (s_weap.weapon_classname == "tr" && !function_901b751c(#"hash_1d88786f0e4535a3")) || (s_weap.weapon_classname == "lmg" && !function_901b751c(#"hash_2f6740b518dbeb8f")) || (s_weap.weapon_classname == "sniper" && !function_901b751c(#"hash_5bfd047c58816496")) || (s_weap.weapon_classname == "melee" && !function_901b751c(#"hash_26f3528e8457207a")) || (s_weap.weapon_classname == "equipment" && !function_901b751c(#"hash_65a1298089d361f1")))
		{
			if(!isdefined(level.var_cbc6587a))
			{
				level.var_cbc6587a = [];
			}
			else if(!isarray(level.var_cbc6587a))
			{
				level.var_cbc6587a = array(level.var_cbc6587a);
			}
			if(!isinarray(level.var_cbc6587a, s_weap.weapon))
			{
				level.var_cbc6587a[level.var_cbc6587a.size] = s_weap.weapon;
			}
		}
	}
	if(!function_901b751c(#"zmshieldisenabled"))
	{
		foreach(var_b772a844 in array("zblueprint_shield", "zblueprint_shield_dual_wield", "zblueprint_zhield_zword", "zblueprint_shield_spectral_shield"))
		{
			zm_crafting::function_ca244624(hash(var_b772a844));
		}
	}
	if(!function_901b751c(#"hash_3386caa315211c88"))
	{
		level.no_board_repair = 1;
		level flag::wait_till("all_players_spawned");
		zm_blockers::function_22642075();
		level.no_board_repair = 1;
	}
	switch(function_901b751c(#"hash_446d18ebd8d50be6"))
	{
		case 1:
		{
			setgametypesetting("scoreEquipmentPowerTimeFactor", 1);
			break;
		}
		case 2:
		{
			setgametypesetting("scoreEquipmentPowerTimeFactor", 2);
			break;
		}
		case 0:
		{
			setgametypesetting("scoreEquipmentPowerTimeFactor", 0.5);
			break;
		}
	}
	level flag::wait_till("all_players_spawned");
}

/*
	Name: function_214e109e
	Namespace: namespace_59ff1d6c
	Checksum: 0x4BCD0704
	Offset: 0x4FB8
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_214e109e()
{
	level waittill(#"start_of_round");
	if(function_901b751c(#"zmroundcap") && function_901b751c(#"startround") > function_901b751c(#"zmroundcap"))
	{
		wait(1);
		function_9be9c072("zmRoundCap");
	}
}

/*
	Name: function_34c2aeb5
	Namespace: namespace_59ff1d6c
	Checksum: 0xB48EE972
	Offset: 0x5068
	Size: 0x5B2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_34c2aeb5()
{
	self endon(#"disconnect");
	player = self;
	level flag::wait_till("all_players_spawned");
	var_edd3eb35 = function_901b751c(#"hash_5fbcaf0a1daae566");
	n_regen_rate = function_901b751c(#"hash_5c47775ddd2e17dd");
	var_6162c5a7 = function_901b751c(#"hash_525617f00a59d92f");
	var_cab15939 = function_901b751c(#"hash_54dfa988db5db24c");
	switch(function_901b751c(#"hash_29d174e7d8ab76c8"))
	{
		case 3:
		default:
		{
			var_d75008e3 = 0;
			break;
		}
		case 4:
		{
			var_d75008e3 = 1;
			break;
		}
		case 5:
		{
			var_d75008e3 = 2;
			break;
		}
		case 6:
		{
			var_d75008e3 = 3;
			break;
		}
		case 2:
		{
			var_d75008e3 = -1;
			break;
		}
		case 1:
		{
			var_d75008e3 = -2;
			break;
		}
		case 0:
		{
			var_d75008e3 = -3;
			break;
		}
	}
	n_target = int(max(zombie_utility::function_d2dfacfd(#"player_base_health") + (50 * var_d75008e3), 1));
	n_mod = math::clamp(n_target - player.var_66cb03ad, 0, n_target);
	player player::function_2a67df65(#"hash_3d6fdba64710a6ae", n_mod);
	player.var_66cb03ad = n_target;
	player.maxhealth = n_target;
	player setmaxhealth(n_target);
	player zm_utility::function_e0448fec();
	/#
		println((("" + player.name) + "") + player.var_66cb03ad);
	#/
	switch(var_edd3eb35)
	{
		case 0:
		{
			player.var_edd3eb35 = 2;
			break;
		}
		case 1:
		{
			player.var_edd3eb35 = zombie_utility::function_d2dfacfd("player_health_regen_delay");
			break;
		}
		case 2:
		{
			player.var_edd3eb35 = 8;
			break;
		}
	}
	switch(n_regen_rate)
	{
		case 0:
		{
			player.var_44d52546 = 1;
			break;
		}
		case 1:
		{
			player.n_regen_rate = 50;
			break;
		}
		case 2:
		{
			player.n_regen_rate = zombie_utility::function_d2dfacfd("player_health_regen_rate");
			break;
		}
		case 3:
		{
			player.n_regen_rate = 12.5;
			break;
		}
		case 4:
		{
			player.n_regen_rate = 0;
			break;
		}
	}
	switch(var_6162c5a7)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			player.var_6162c5a7 = 10;
			break;
		}
		case 2:
		{
			player.var_6162c5a7 = 25;
			break;
		}
		case 3:
		{
			player.var_6162c5a7 = 50;
			break;
		}
	}
	switch(var_cab15939)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			player thread function_90f06996(6);
			break;
		}
		case 2:
		{
			player thread function_90f06996(3);
			break;
		}
		case 3:
		{
			player thread function_90f06996(1);
			break;
		}
	}
}

/*
	Name: function_90f06996
	Namespace: namespace_59ff1d6c
	Checksum: 0xC659C14E
	Offset: 0x5628
	Size: 0x190
	Parameters: 1
	Flags: Linked, Private
*/
function private function_90f06996(var_c454f44e)
{
	self notify(#"hash_13fcb28a561bd5fe");
	self endon(#"disconnect", #"hash_13fcb28a561bd5fe");
	level endon(#"game_ended");
	self val::set(#"hash_72744c83e92c5366", "health_regen", 0);
	while(zombie_utility::get_current_zombie_count() == 0)
	{
		waitframe(1);
	}
	while(true)
	{
		wait(var_c454f44e);
		if(self.health <= 0 || self laststand::player_is_in_laststand() || is_true(self.var_eb319d10))
		{
			waitframe(1);
			continue;
		}
		if(self.health <= 5)
		{
			if(zm_utility::is_magic_bullet_shield_enabled(self))
			{
				self util::stop_magic_bullet_shield();
			}
			self dodamage(self.health + 1000, self.origin);
		}
		else
		{
			self dodamage(5, self.origin);
		}
	}
}

/*
	Name: function_e57809dd
	Namespace: namespace_59ff1d6c
	Checksum: 0x1262036B
	Offset: 0x57C0
	Size: 0xA2
	Parameters: 11
	Flags: Linked, Private
*/
function private function_e57809dd(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(boneindex > 0)
	{
		boneindex = max(int(boneindex * 0.25), 1);
	}
	return boneindex;
}

/*
	Name: function_4225c3b7
	Namespace: namespace_59ff1d6c
	Checksum: 0x83CE19E3
	Offset: 0x5870
	Size: 0xBE
	Parameters: 11
	Flags: Linked, Private
*/
function private function_4225c3b7(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(boneindex > 0)
	{
		boneindex = max(int(boneindex * 0.25), 1);
	}
	psoffsettime dodamage(boneindex, self.origin);
	return false;
}

/*
	Name: function_6607cdee
	Namespace: namespace_59ff1d6c
	Checksum: 0x3B3C915C
	Offset: 0x5938
	Size: 0xC0
	Parameters: 11
	Flags: Linked, Private
*/
function private function_6607cdee(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(boneindex > 0)
	{
		boneindex = max(int((boneindex * 0.25) / 2), 1);
	}
	psoffsettime dodamage(boneindex, self.origin);
	return boneindex;
}

/*
	Name: function_cd05a082
	Namespace: namespace_59ff1d6c
	Checksum: 0x4E73312E
	Offset: 0x5A00
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cd05a082()
{
	var_320de887 = function_901b751c(#"hash_1735a88a32111a1b");
	var_46e28538 = function_901b751c(#"hash_1aefdca073b7d72b") * 100;
	var_1f9ee1b2 = function_901b751c(#"hash_5566698b97a6282e");
	var_58d18c72 = function_901b751c(#"hash_3326ed4311c47268");
	var_523e89f3 = function_901b751c(#"hash_696b8f3671d2baf1");
	var_39215b53 = function_901b751c(#"hash_3b279133f5b3371");
	if(var_46e28538 != 500)
	{
		level.player_starting_points = var_46e28538;
	}
	if(var_320de887)
	{
		level.var_894a83d8 = 1;
	}
	if(var_58d18c72)
	{
		if(var_58d18c72 == 1)
		{
			level.var_a2d8b7eb = var_523e89f3 / 100;
		}
		else
		{
			level.var_39e18a71 = var_39215b53;
		}
	}
}

/*
	Name: function_c25113
	Namespace: namespace_59ff1d6c
	Checksum: 0xE810BA38
	Offset: 0x5B80
	Size: 0x102
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c25113()
{
	self endon(#"disconnect");
	level flag::wait_till("start_zombie_round_logic");
	waitframe(1);
	var_629da31e = function_901b751c(#"hash_70517c36d49b4ee0");
	switch(var_629da31e)
	{
		case 0:
		{
			self.var_39c78617 = 1;
			self zm_laststand::function_3d685b5f(0);
			return;
		}
		case 1:
		{
			self.var_b92e42da = 20;
			break;
		}
		case 2:
		{
			break;
		}
		case 3:
		{
			self.var_b92e42da = 60;
			break;
		}
	}
}

/*
	Name: function_8abf3abd
	Namespace: namespace_59ff1d6c
	Checksum: 0xBD065C12
	Offset: 0x5C90
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8abf3abd()
{
	if(!function_901b751c(#"hash_716db8c2d7fcacfb"))
	{
		self allowmelee(0);
		self thread function_bfc2f3f1();
		self thread function_dc856fd8();
	}
}

/*
	Name: function_99c0cc77
	Namespace: namespace_59ff1d6c
	Checksum: 0x4A99C373
	Offset: 0x5D08
	Size: 0xC8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_99c0cc77()
{
	if(!function_901b751c(#"hash_65a1298089d361f1") && isdefined(self.var_49377865[#"lethal_grenade"]))
	{
		self takeweapon(self.var_49377865[#"lethal_grenade"]);
	}
}

/*
	Name: function_bfc2f3f1
	Namespace: namespace_59ff1d6c
	Checksum: 0x6D671D20
	Offset: 0x5DD8
	Size: 0x80
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bfc2f3f1()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"hero_weapon_power_on");
		self allowmelee(1);
		self waittill(#"hero_weapon_power_off");
		self allowmelee(0);
	}
}

/*
	Name: function_dc856fd8
	Namespace: namespace_59ff1d6c
	Checksum: 0x450029B3
	Offset: 0x5E60
	Size: 0x70
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dc856fd8()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"hash_7fd32c9551894e64", #"hash_424834e6dee13bc3", #"bgb_update");
		self allowmelee(0);
	}
}

/*
	Name: function_7a8180ae
	Namespace: namespace_59ff1d6c
	Checksum: 0xA8EE1AE1
	Offset: 0x5ED8
	Size: 0x45A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7a8180ae()
{
	var_52e65b4 = function_901b751c(#"hash_5946034af4372f2d");
	var_a98f5518 = function_901b751c(#"hash_513e1dcaadea0269");
	var_1b9aa497 = function_901b751c(#"hash_7b14ee93b27576a9");
	var_34f5f077 = function_901b751c(#"hash_58af4e73782aba2f");
	var_46e03bb6 = function_901b751c(#"hash_1f4a4976ecd7a486");
	var_c739ead9 = function_901b751c(#"hash_10457cddea07071");
	switch(var_52e65b4)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_41259f0d = 1;
			break;
		}
		case 2:
		{
			level.var_6d8a8e47 = 1;
			break;
		}
	}
	switch(var_a98f5518)
	{
		case 0:
		{
			level.zigzag_activation_distance = 256;
			level.inner_zigzag_radius = 0;
			level.outer_zigzag_radius = 16;
			level.zigzag_distance_min = 16;
			level.zigzag_distance_max = 512;
			break;
		}
		case 1:
		{
			break;
		}
		case 2:
		{
			level.zigzag_activation_distance = 16;
			level.inner_zigzag_radius = 256;
			level.outer_zigzag_radius = 2048;
			level.zigzag_distance_min = 128;
			level.zigzag_distance_max = 1024;
			break;
		}
	}
	switch(var_1b9aa497)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			level.var_43fb4347 = "run";
			break;
		}
		case 2:
		{
			level.var_43fb4347 = "sprint";
			break;
		}
		case 3:
		{
			level.var_43fb4347 = "super_sprint";
			break;
		}
	}
	switch(var_34f5f077)
	{
		case 0:
		{
			level.var_102b1301 = "walk";
			break;
		}
		case 1:
		{
			level.var_102b1301 = "run";
			break;
		}
		case 2:
		{
			level.var_102b1301 = "sprint";
			break;
		}
		case 3:
		{
			break;
		}
	}
	switch(var_c739ead9)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_c739ead9 = 0.5;
			break;
		}
		case 2:
		{
			level.var_c739ead9 = 2;
			break;
		}
	}
	switch(var_46e03bb6)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_46e03bb6 = 0.5;
			break;
		}
		case 2:
		{
			level.var_46e03bb6 = 2;
			break;
		}
	}
}

/*
	Name: function_5b526135
	Namespace: namespace_59ff1d6c
	Checksum: 0x6ED84682
	Offset: 0x6340
	Size: 0x9C4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5b526135()
{
	var_525c797b = function_901b751c(#"hash_69262a31e0f8f91c");
	var_cfbc34ae = function_901b751c(#"hash_47683a928d3b5c50");
	var_6a6ab4ce = function_901b751c(#"hash_260fe4ac4d0ee7c7");
	var_d46f8e18 = function_901b751c(#"hash_35ac79d2ca5673c8");
	var_9b9f6d3d = function_901b751c(#"hash_4269e873a0c207c");
	var_5a59b382 = function_901b751c(#"hash_407d7afcff755230");
	var_8593895d = function_901b751c(#"hash_3e1334207938d6a7");
	var_8670c016 = function_901b751c(#"hash_443cfbf2a6fbc040");
	var_47a77473 = function_901b751c(#"hash_4035c12ee5837454");
	var_97850f30 = function_901b751c(#"hash_2d0db902620447a8");
	var_f2b4495f = function_901b751c(#"hash_29b057ccce3ee75f");
	var_12c07114 = function_901b751c(#"hash_35ac79d2ca5673c8");
	switch(var_525c797b)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_ef0aada0 = 1;
			break;
		}
		case 2:
		{
			level.var_5931f93f = 1;
			level.var_78acec0a = 1;
			level.var_f38e5f93 = 0.2;
		}
	}
	switch(var_cfbc34ae)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_cfbc34ae = 0.5;
			break;
		}
		case 2:
		{
			level.var_cfbc34ae = 2;
			break;
		}
	}
	switch(var_6a6ab4ce)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_6a6ab4ce = 0.5;
			break;
		}
		case 2:
		{
			level.var_6a6ab4ce = 2;
			break;
		}
	}
	switch(var_d46f8e18)
	{
		case 1:
		default:
		{
			break;
		}
		case 0:
		{
			level.var_66682370 = 0.5;
			break;
		}
		case 2:
		{
			level.var_66682370 = 2;
			break;
		}
		case 3:
		{
			level.var_66682370 = 4;
			break;
		}
	}
	switch(var_9b9f6d3d)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_b38bb71 = 1;
			break;
		}
		case 2:
		{
			level.var_d3e01096 = 1;
			level.var_78acec0a = 1;
			level.var_f38e5f93 = 0.2;
		}
	}
	switch(var_5a59b382)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_5a59b382 = 0.5;
			break;
		}
		case 2:
		{
			level.var_5a59b382 = 2;
			break;
		}
	}
	switch(var_8593895d)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_8593895d = 0.5;
			break;
		}
		case 2:
		{
			level.var_8593895d = 2;
			break;
		}
	}
	switch(var_8670c016)
	{
		case 1:
		default:
		{
			break;
		}
		case 0:
		{
			level.var_397ca369 = 0.5;
			break;
		}
		case 2:
		{
			level.var_397ca369 = 2;
			break;
		}
		case 3:
		{
			level.var_397ca369 = 4;
			break;
		}
	}
	switch(var_47a77473)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_1931799d = 1;
			break;
		}
		case 2:
		{
			level.var_d56511a2 = 1;
		}
	}
	switch(var_97850f30)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_97850f30 = 0.5;
			break;
		}
		case 2:
		{
			level.var_97850f30 = 2;
			break;
		}
	}
	switch(var_f2b4495f)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_f2b4495f = 0.5;
			break;
		}
		case 2:
		{
			level.var_f2b4495f = 2;
			break;
		}
	}
	switch(var_12c07114)
	{
		case 1:
		default:
		{
			break;
		}
		case 0:
		{
			level.var_6a9f25ba = 0.5;
			break;
		}
		case 2:
		{
			level.var_6a9f25ba = 2;
			break;
		}
		case 3:
		{
			level.var_6a9f25ba = 4;
			break;
		}
	}
	if(is_true(level.var_d3e01096))
	{
		setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
		level.var_ef0aada0 = 1;
		level.var_1931799d = 1;
		level.var_81bce2c8 = 1;
	}
	else
	{
		if(is_true(level.var_5931f93f))
		{
			setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
			level.var_b38bb71 = 1;
			level.var_1931799d = 1;
			level.var_888f3e2 = 1;
		}
		else
		{
			if(is_true(level.var_90534a4f))
			{
				setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
				level.var_b38bb71 = 1;
				level.var_ef0aada0 = 1;
				level.var_1931799d = 1;
			}
			else if(is_true(level.var_d56511a2))
			{
				setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
				level.var_b38bb71 = 1;
				level.var_ef0aada0 = 1;
			}
		}
	}
}

/*
	Name: function_a00576dd
	Namespace: namespace_59ff1d6c
	Checksum: 0x57047D2D
	Offset: 0x6D10
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function function_a00576dd(var_59459749, var_7fe52f51, var_8ccdc1e3)
{
	if(is_true(level.var_d3e01096))
	{
		level.var_78afc69 = var_59459749;
	}
	else
	{
		if(is_true(level.var_5931f93f))
		{
			level.var_78afc69 = var_7fe52f51;
		}
		else if(is_true(level.var_d56511a2))
		{
			level.var_78afc69 = var_8ccdc1e3;
		}
	}
}

/*
	Name: function_6129676c
	Namespace: namespace_59ff1d6c
	Checksum: 0xEA4A59BF
	Offset: 0x6DC0
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6129676c()
{
	timer = function_901b751c(#"zmtimecap") * 60;
	if(timer === 0)
	{
		return;
	}
	level endon(#"game_ended");
	level flag::wait_till("gameplay_started");
	clientfield::set_world_uimodel("ZMHudGlobal.trials.gameStartTime", gettime());
	wait(timer);
	function_9be9c072("zmTimeCap");
}

/*
	Name: function_c2ebdc07
	Namespace: namespace_59ff1d6c
	Checksum: 0xF24CF999
	Offset: 0x6E78
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_c2ebdc07()
{
	self endon(#"disconnect");
	self waittill(#"spawned");
	if(level.players.size < 4)
	{
		bot::add_bot(self.team);
	}
}

/*
	Name: function_401f18e6
	Namespace: namespace_59ff1d6c
	Checksum: 0xDEFCD07B
	Offset: 0x6ED8
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_401f18e6()
{
	if(!function_901b751c(#"hash_4deb3ae7a73c87f3"))
	{
		while(!flag::exists(#"disable_special_rounds"))
		{
			waitframe(1);
		}
		level flag::set(#"disable_special_rounds");
	}
	n_start = function_901b751c(#"startround");
	if(n_start > 1)
	{
		level waittill(#"start_of_round");
		for(i = 0; i < n_start; i++)
		{
			if(isdefined(level.var_45827161) && isdefined(level.var_45827161[i]))
			{
				for(var_830a0b65 = i + n_start; isdefined(level.var_45827161[var_830a0b65]); var_830a0b65++)
				{
				}
				level.var_45827161[var_830a0b65] = level.var_45827161[i];
			}
		}
	}
}

/*
	Name: function_a8e9a6c7
	Namespace: namespace_59ff1d6c
	Checksum: 0xA70D06FD
	Offset: 0x7038
	Size: 0x2E52
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a8e9a6c7()
{
	return array({#default_val:1, #name:#"startround"}, {#default_val:0, #name:#"headshotsonly"}, {#default_val:0, #name:#"zmroundcap"}, {#default_val:0, #name:#"zmtimecap"}, {#default_val:0, #name:#"hash_2876dc918cc6666"}, {#default_val:0, #name:#"zmkillcap"}, {#default_val:1, #name:#"hash_2c6b5594940cc305"}, {#default_val:1, #name:#"hash_4deb3ae7a73c87f3"}, {#default_val:0, #name:#"hash_5277b3362aa77c72"}, {#default_val:2, #name:#"hash_4e0ec3fe56f08b47"}, {#default_val:0, #name:#"hash_5d65c0983698a539"}, {#default_val:0, #name:#"hash_1513b70c43495cc0"}, {#default_val:0, #name:#"hash_23fe21eb92ffbc2c"}, {#default_val:0, #name:#"hash_4ffb80b47c049c61"}, {#default_val:0, #name:#"hash_751384283abde22c"}, {#default_val:0, #name:#"hash_543954c3281a530f"}, {#default_val:1, #name:#"zmpowerstate"}, {#default_val:1, #name:#"hash_29004a67830922b6"}, {#default_val:1, #name:#"hash_3d18f84f48bd5d1f"}, {#default_val:1, #name:#"hash_7520ccdc8dcaee8d"}, {#default_val:1, #name:#"hash_8edd17a31990450"}, {#default_val:1, #name:#"hash_4a827056d0e273fd"}, {#default_val:1, #name:#"hash_557e3edd7fe168c3"}, {#default_val:1, #name:#"hash_3a15ddcc25d689f6"}, {#default_val:1, #name:#"hash_5347ff402123307a"}, {#default_val:1, #name:#"hash_77c5cc2d9b6ca16c"}, {#default_val:1, #name:#"hash_26407356b81a1957"}, {#default_val:1, #name:#"hash_1e9fb2463e6eee58"}, {#default_val:1, #name:#"hash_31b19618ca4f41"}, {#default_val:1, #name:#"hash_19d48a0d4490b0a2"}, {#default_val:1, #name:#"hash_57a5c7a9dcf94d61"}, {#default_val:1, #name:#"zmpowerupsactive"}, {#default_val:1, #name:#"zmpowerupnuke"}, {#default_val:1, #name:#"zmpowerupdouble"}, {#default_val:1, #name:#"zmpowerupinstakill"}, {#default_val:1, #name:#"zmpowerupchaospoints"}, {#default_val:1, #name:#"zmpowerupfiresale"}, {#default_val:1, #name:#"zmpowerupspecialweapon"}, {#default_val:1, #name:#"zmpowerupfreeperk"}, {#default_val:1, #name:#"zmpowerupmaxammo"}, {#default_val:1, #name:#"zmpowerupcarpenter"}, {#default_val:0, #name:#"zmpowerupsislimitedround"}, {#default_val:1, #name:#"hash_d46a4e7a41e005c"}, {#default_val:1, #name:#"hash_17aa8019b16bcb60"}, {#default_val:1, #name:#"hash_51a2cf319e12d9ae"}, {#default_val:0, #name:#"hash_120915b593862b66"}, {#default_val:1, #name:#"hash_137eb8d53913f781"}, {#default_val:1, #name:#"hash_3ea7e39b03dd4dd1"}, {#default_val:1, #name:#"hash_590749f63c2be0bb"}, {#default_val:1, #name:#"hash_3ab7cedcfef7eacc"}, {#default_val:1, #name:#"hash_5374d50efd1e6b59"}, {#default_val:1, #name:#"hash_5e1f08b8335a0ce0"}, {#default_val:1, #name:#"hash_7ea1426ffa93f34d"}, {#default_val:1, #name:#"hash_5746674cbab8264d"}, {#default_val:1, #name:#"hash_2d27d80d1acf8b31"}, {#default_val:1, #name:#"hash_5aef19a8668560b"}, {#default_val:1, #name:#"hash_47e07053890b9c29"}, {#default_val:1, #name:#"hash_587f074e4104cfb0"}, {#default_val:1, #name:#"hash_24ff1fa68e880afd"}, {#default_val:1, #name:#"hash_e6a46ef644c01bd"}, {#default_val:1, #name:#"hash_6f1440098d849316"}, {#default_val:1, #name:#"hash_edfb07f798aaab5"}, {#default_val:1, #name:#"hash_1f6665b5581f6b6e"}, {#default_val:1, #name:#"hash_1d5c8e6f0e20201a"}, {#default_val:1, #name:#"hash_1d88786f0e4535a3"}, {#default_val:1, #name:#"hash_2f6740b518dbeb8f"}, {#default_val:1, #name:#"hash_5bfd047c58816496"}, {#default_val:1, #name:#"hash_26f3528e8457207a"}, {#default_val:1, #name:#"hash_716db8c2d7fcacfb"}, {#default_val:1, #name:#"hash_b066c34278e6394"}, {#default_val:1, #name:#"hash_2f03c6055447a6b1"}, {#default_val:1, #name:#"hash_541a4d5c476468f4"}, {#default_val:1, #name:#"hash_65a1298089d361f1"}, {#default_val:1, #name:#"hash_446d18ebd8d50be6"}, {#default_val:1, #name:#"zmshieldisenabled"}, {#default_val:1, #name:#"hash_7ee9177eb922ddfa"}, {#default_val:0, #name:#"hash_4cb15aed177a8ef5"}, {#default_val:0, #name:#"hash_2f18b6a3d10318ef"}, {#default_val:0, #name:#"hash_11a7d7a641d526ef"}, {#default_val:1, #name:#"hash_5946034af4372f2d"}, {#default_val:1, #name:#"hash_513e1dcaadea0269"}, {#default_val:0, #name:#"hash_7b14ee93b27576a9"}, {#default_val:3, #name:#"hash_58af4e73782aba2f"}, {#default_val:1, #name:#"hash_10457cddea07071"}, {#default_val:1, #name:#"hash_1f4a4976ecd7a486"}, {#default_val:1, #name:#"hash_5e30739150832bd3"}, {#default_val:1, #name:#"hash_3b558172d2c08a74"}, {#default_val:1, #name:#"hash_6a1243c4126c219a"}, {#default_val:1, #name:#"hash_69262a31e0f8f91c"}, {#default_val:1, #name:#"hash_47683a928d3b5c50"}, {#default_val:1, #name:#"hash_260fe4ac4d0ee7c7"}, {#default_val:1, #name:#"hash_2f2281537f0463f7"}, {#default_val:1, #name:#"hash_4269e873a0c207c"}, {#default_val:1, #name:#"hash_407d7afcff755230"}, {#default_val:1, #name:#"hash_3e1334207938d6a7"}, {#default_val:1, #name:#"hash_4a23f5a8d8193e57"}, {#default_val:3, #name:#"hash_29d174e7d8ab76c8"}, {#default_val:1, #name:#"hash_5fbcaf0a1daae566"}, {#default_val:2, #name:#"hash_5c47775ddd2e17dd"}, {#default_val:0, #name:#"hash_525617f00a59d92f"}, {#default_val:0, #name:#"hash_54dfa988db5db24c"}, {#default_val:0, #name:#"hash_1735a88a32111a1b"}, {#default_val:5, #name:#"hash_1aefdca073b7d72b"}, {#default_val:0, #name:#"hash_5566698b97a6282e"}, {#default_val:0, #name:#"hash_3326ed4311c47268"}, {#default_val:1, #name:#"hash_696b8f3671d2baf1"}, {#default_val:100, #name:#"hash_3b279133f5b3371"}, {#default_val:2, #name:#"hash_70517c36d49b4ee0"}, {#default_val:0, #name:#"hash_12f776f6bc579bb4"}, {#default_val:0, #name:#"hash_2d34a5d9024db85f"}, {#default_val:1, #name:#"hash_3386caa315211c88"}, {#default_val:1, #name:#"hash_3c5363541b97ca3e"}, {#default_val:1, #name:#"hash_393fb6bd6c5874aa"}, {#default_val:1, #name:#"hash_453fcfbee32e3655"}, {#default_val:1, #name:#"hash_1b59bb7608355512"}, {#default_val:1, #name:#"hash_61695e52556ff2d1"}, {#default_val:1, #name:#"hash_38a8f3cfef7b86d1"}, {#default_val:1, #name:#"hash_17917e00de6b437"}, {#default_val:1, #name:#"hash_66a78ac345a3e2bb"}, {#default_val:1, #name:#"hash_752eba9759a4a52a"}, {#default_val:1, #name:#"hash_76943d48d878715f"}, {#default_val:1, #name:#"hash_7c61b02fb56f7f"}, {#default_val:1, #name:#"hash_2001987d25a3717a"}, {#default_val:1, #name:#"hash_63bf3e5a51cb8fad"}, {#default_val:1, #name:#"hash_2f51e04634dafe36"}, {#default_val:1, #name:#"hash_2f51df4634dafc83"}, {#default_val:1, #name:#"hash_2f51de4634dafad0"}, {#default_val:1, #name:#"hash_2f51e54634db06b5"}, {#default_val:1, #name:#"hash_56db42b55542ec33"}, {#default_val:1, #name:#"hash_56db43b55542ede6"}, {#default_val:1, #name:#"hash_56db44b55542ef99"}, {#default_val:1, #name:#"hash_56db45b55542f14c"}, {#default_val:1, #name:#"hash_6fe0ba92c67980e8"}, {#default_val:1, #name:#"hash_6fe0bd92c6798601"}, {#default_val:1, #name:#"hash_6fe0bc92c679844e"}, {#default_val:1, #name:#"hash_6fe0bf92c6798967"}, {#default_val:1, #name:#"hash_4f973a92562bc3b6"}, {#default_val:1, #name:#"hash_36d19199d37d4549"}, {#default_val:1, #name:#"hash_42c6d1ca5eab82ab"}, {#default_val:1, #name:#"hash_3efef475c9de052e"}, {#default_val:1, #name:#"hash_3efef575c9de06e1"}, {#default_val:1, #name:#"hash_e1f30cc8f6f3150"}, {#default_val:1, #name:#"hash_19a9d40272333762"}, {#default_val:1, #name:#"hash_711db227d86cc407"}, {#default_val:1, #name:#"hash_6a6e4728651aff36"}, {#default_val:1, #name:#"hash_4c81f5aeddae88f"}, {#default_val:1, #name:#"hash_2979ae0cd8913eaa"}, {#default_val:1, #name:#"hash_4006dac21ea0736"}, {#default_val:1, #name:#"hash_6230ef2b089aad7f"}, {#default_val:1, #name:#"hash_1ce5566dde9ed686"}, {#default_val:1, #name:#"hash_3a534a2a0f3eedd3"}, {#default_val:1, #name:#"hash_3ee97a6ab720cc15"}, {#default_val:1, #name:#"hash_4f82e568f5e2c04f"}, {#default_val:1, #name:#"hash_1a8ee5887f138e39"}, {#default_val:1, #name:#"hash_3fecdaec6642d3ba"}, {#default_val:1, #name:#"hash_4aa214604d696f70"}, {#default_val:1, #name:#"hash_41f269ab6574b3bd"}, {#default_val:1, #name:#"hash_49b95e3ba4d2d2f8"}, {#default_val:1, #name:#"hash_1929dd7083c365c5"}, {#default_val:1, #name:#"hash_14aa3cb07d2c0db"}, {#default_val:1, #name:#"hash_6d490d5a824c0d83"}, {#default_val:1, #name:#"hash_7aff42262b4eee32"}, {#default_val:1, #name:#"hash_3a7bd9c02b9fce98"}, {#default_val:1, #name:#"hash_4ca897d3295f6257"}, {#default_val:1, #name:#"hash_3197061ec31dc27d"}, {#default_val:1, #name:#"hash_7dadb18509506169"}, {#default_val:1, #name:#"hash_716d4768994b25a5"}, {#default_val:1, #name:#"hash_26468de196046e72"}, {#default_val:1, #name:#"hash_ddf4eed89a60b8e"}, {#default_val:1, #name:#"hash_72581cab09b5c9f"}, {#default_val:1, #name:#"hash_7d1fb9161dddf722"}, {#default_val:1, #name:#"hash_2a779251ef8c8568"}, {#default_val:1, #name:#"hash_7ae3c77e1ebdc90d"}, {#default_val:1, #name:#"hash_560c19249d1b9390"}, {#default_val:1, #name:#"hash_78a2cab12f0c5a89"}, {#default_val:1, #name:#"hash_13ac6983716eb72b"}, {#default_val:1, #name:#"hash_1dd3d19705899dbd"}, {#default_val:1, #name:#"hash_6e84a4012ddf8a24"}, {#default_val:1, #name:#"hash_77ff67c16576e231"}, {#default_val:1, #name:#"hash_6df1564c342c831"}, {#default_val:1, #name:#"hash_33d900f7b3d14128"}, {#default_val:0, #name:#"hash_429b520a87274afb"}, {#default_val:1, #name:#"hash_4b16b22d8a0d3301"}, {#default_val:1, #name:#"hash_7bc64c0823c87e41"}, {#default_val:1, #name:#"hash_35ac79d2ca5673c8"}, {#default_val:1, #name:#"hash_443cfbf2a6fbc040"}, {#default_val:0, #name:#"hash_21ae4d5b707b063"}, {#default_val:1, #name:#"hash_4035c12ee5837454"}, {#default_val:1, #name:#"hash_2d0db902620447a8"}, {#default_val:1, #name:#"hash_29b057ccce3ee75f"}, {#default_val:1, #name:#"hash_35ac79d2ca5673c8"}, {#default_val:1, #name:#"hash_589c0366b1458c7e"}, {#default_val:1, #name:#"hash_3ddb6198e7837062"}, {#default_val:0, #name:#"hash_2a5dc43e6de87347"}, {#default_val:0, #name:#"hash_1fed0d9afc0b0040"}, {#default_val:0, #name:#"hash_1158d006a3913ef6"}, {#default_val:0, #name:#"hash_64291919b16c489a"}, {#default_val:1, #name:#"hash_a0db64bb19e18af"}, {#default_val:1, #name:#"hash_3a9e56ae10cf58c9"}, {#default_val:1, #name:#"hash_792079610dfac24"}, {#default_val:1, #name:#"hash_3e98c2376cacd382"}, {#default_val:1, #name:#"hash_3b83acfd4b361e44"}, {#default_val:1, #name:#"hash_5edb895e9d0880f9"}, {#default_val:1, #name:#"hash_5d9ddfa547ec765e"}, {#default_val:1, #name:#"hash_45118b5f6d97c89a"}, {#default_val:1, #name:#"hash_1bdfb5736ad174a3"}, {#default_val:1, #name:#"hash_7d2a55a87f693582"}, {#default_val:1, #name:#"hash_402b9d6529500b72"}, {#default_val:1, #name:#"hash_179ae09979e80714"}, {#default_val:1, #name:#"hash_5690c4dcc61973ec"}, {#default_val:1, #name:#"hash_75ec38c3f3487d5"}, {#default_val:1, #name:#"hash_2dd9d538ca5bc2d6"}, {#default_val:0, #name:#"hash_3f8f02e8109b6e93"}, {#default_val:1, #name:#"hash_448716023024b395"}, {#default_val:1, #name:#"hash_4b30109cd344258e"}, {#default_val:1, #name:#"hash_eef480bd7662082"});
}

/*
	Name: function_185687d7
	Namespace: namespace_59ff1d6c
	Checksum: 0x434BAC97
	Offset: 0x9E98
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function function_185687d7(event)
{
	return false;
}

/*
	Name: function_3ca8ca85
	Namespace: namespace_59ff1d6c
	Checksum: 0xC6F90D0D
	Offset: 0x9EB0
	Size: 0x56C
	Parameters: 0
	Flags: Private
*/
function private function_3ca8ca85()
{
	/#
		if(getdvarint(#"hash_459b2d01242f9fd4", 0))
		{
			setgametypesetting("", 9);
			setgametypesetting("", 2);
			setgametypesetting("", 2);
			setgametypesetting("", 2);
			setgametypesetting("", 0);
			setgametypesetting("", 1);
			setgametypesetting("", 9);
			setgametypesetting("", 2);
			setgametypesetting("", 1);
			setgametypesetting("", 9);
		}
		if(getdvarint(#"hash_18b717f0d84d2ee6", 0))
		{
			setgametypesetting("", 4);
			setgametypesetting("", 6);
			setgametypesetting("", 1);
			setgametypesetting("", 2);
			setgametypesetting("", 2);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
		}
		if(getdvarint(#"hash_712656a2976e26c6", 0))
		{
			setgametypesetting("", 40);
			setgametypesetting("", 1);
			setgametypesetting("", 0);
			setgametypesetting("", 3);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 1);
			setgametypesetting("", 3);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
		}
		if(getdvarint(#"hash_6e1983b84de27c22", 0))
		{
			setgametypesetting("", 6);
			setgametypesetting("", 4);
			setgametypesetting("", 3);
			setgametypesetting("", 2);
			setgametypesetting("", 10);
			setgametypesetting("", 5);
			setgametypesetting("", 0);
			setgametypesetting("", 2);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 2);
		}
	#/
}

/*
	Name: function_172decfc
	Namespace: namespace_59ff1d6c
	Checksum: 0xC5F38991
	Offset: 0xA428
	Size: 0x474
	Parameters: 0
	Flags: Private
*/
function private function_172decfc()
{
	/#
		level endon(#"game_ended");
		level waittill(#"all_players_spawned");
		var_325bac97 = function_338abd6d();
		var_32d62863 = array();
		var_210f7603 = 0;
		var_ecc27a73 = 0;
		foreach(var_8258bc10 in var_325bac97)
		{
			if(var_8258bc10.name.size > var_ecc27a73)
			{
				var_ecc27a73 = var_8258bc10.name.size;
			}
		}
		for(i = 0; i < var_325bac97.size; i++)
		{
			var_2f572bbb = "";
			for(j = 0; j < var_ecc27a73 - var_325bac97[i].size; j++)
			{
				var_2f572bbb = var_2f572bbb + "";
			}
			var_2f572bbb = var_2f572bbb + (var_325bac97[i].name + "");
			if(var_325bac97[i].state[0] != "" && isdefined(var_325bac97[i].state[int(getgametypesetting(var_325bac97[i].name))]))
			{
				var_2f572bbb = var_2f572bbb + var_325bac97[i].state[int(getgametypesetting(var_325bac97[i].name))];
				for(j = 0; j < 13 - var_325bac97[i].state[int(getgametypesetting(var_325bac97[i].name))].size; j++)
				{
					var_2f572bbb = var_2f572bbb + "";
				}
			}
			else
			{
				var_2f572bbb = var_2f572bbb + getgametypesetting(var_325bac97[i].name);
				for(j = 0; j < 13 - string(getgametypesetting(var_325bac97[i].name)).size; j++)
				{
					var_2f572bbb = var_2f572bbb + "";
				}
			}
			array::add(var_32d62863, var_2f572bbb);
		}
		var_5f0a1940 = 0;
		var_af35ffa2 = 0;
		if(function_3f3752ab())
		{
			for(i = 0; i < var_325bac97.size; i++)
			{
				if(floor(getgametypesetting(var_325bac97[i].name)) != var_325bac97[i].default_val)
				{
					var_5f0a1940++;
					if(var_5f0a1940 > 29)
					{
						var_5f0a1940 = var_5f0a1940 - 29;
						var_af35ffa2++;
					}
					v_pos = 300 + (18 * var_5f0a1940);
					var_f993b45d = 200 + (400 * var_af35ffa2);
					debug2dtext((var_f993b45d, v_pos, 0), var_32d62863[i], (0, 1, 0), undefined, (0, 0, 0), 0.75, 0.85, 360);
				}
			}
		}
	#/
}

/*
	Name: function_338abd6d
	Namespace: namespace_59ff1d6c
	Checksum: 0x6D49E69F
	Offset: 0xA8A8
	Size: 0x4AE2
	Parameters: 0
	Flags: Private
*/
function private function_338abd6d()
{
	/#
		return array({#state:array(""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:2, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array(""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:3, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array(""), #default_val:3, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", "", ""), #default_val:2, #name:""}, {#state:array("", "", "", ""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:5, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:2, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:1, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""});
	#/
}

