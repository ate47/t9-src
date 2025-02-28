#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace achievements;

/*
	Name: function_ec8f1203
	Namespace: achievements
	Checksum: 0xF73083DF
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ec8f1203()
{
	level notify(1682463345);
}

/*
	Name: __init__system__
	Namespace: achievements
	Checksum: 0x356DC59D
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"achievements", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: achievements
	Checksum: 0xA193D1AF
	Offset: 0x1B0
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	callback::on_ai_spawned(&on_ai_spawned);
	callback::on_ai_damage(&on_ai_damage);
	callback::on_ai_killed(&on_ai_killed);
	callback::on_player_killed(&on_player_death);
	function_df1192a7();
}

/*
	Name: function_df1192a7
	Namespace: achievements
	Checksum: 0x80F724D1
	Offset: 0x270
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_df1192a7()
{
}

/*
	Name: give_achievement
	Namespace: achievements
	Checksum: 0xB2E1CAEF
	Offset: 0x280
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function give_achievement(achievement, var_a299f0b3)
{
	/#
		assert(ishash(var_a299f0b3), "");
	#/
	/#
		printtoprightln("" + function_9e72a96(var_a299f0b3), (1, 1, 1));
		println("" + function_9e72a96(var_a299f0b3));
	#/
	if(!isdefined(self.var_b34a7212))
	{
		self.var_b34a7212 = [];
	}
	if(isdefined(self.var_b34a7212[var_a299f0b3]))
	{
		return;
	}
	self.var_b34a7212[var_a299f0b3] = 1;
	self giveachievement(var_a299f0b3);
}

/*
	Name: on_player_connect
	Namespace: achievements
	Checksum: 0xFFFEB954
	Offset: 0x390
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self endon(#"disconnect");
	self.var_8e5e0541 = spawnstruct();
	self.var_8e5e0541.killindex = 0;
	self.var_8e5e0541.var_ca87baa4 = 0;
	self.var_8e5e0541.kills = [];
	self.var_8e5e0541.var_f79c95f9 = [];
	self thread function_fd51b8a8();
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"give_achievement");
		give_achievement(waitresult.id);
	}
}

/*
	Name: function_20254235
	Namespace: achievements
	Checksum: 0x34616DD1
	Offset: 0x468
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function function_20254235(eplayer, levelname, difficulty)
{
	levelname give_achievement(hash("cp_achievement_" + difficulty));
}

/*
	Name: function_cc2216e2
	Namespace: achievements
	Checksum: 0x36E73940
	Offset: 0x4C0
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_cc2216e2(eplayer)
{
	var_b0abc67b = [];
	for(index = 0; index <= 4; index++)
	{
		var_b0abc67b[index] = 0;
	}
	mission_list = skipto::function_228558fd(0, 0);
	var_d8222c25 = 0;
	foreach(msn in mission_list)
	{
		if(!eplayer stats::get_stat(#"mapdata", msn, #"complete"))
		{
			continue;
		}
		highestdifficulty = eplayer stats::get_stat(#"mapdata", msn, #"highestdifficulty");
		if(!isdefined(var_b0abc67b[highestdifficulty]))
		{
			var_b0abc67b[highestdifficulty] = 0;
		}
		var_b0abc67b[highestdifficulty]++;
		var_d8222c25++;
	}
	var_7a34e971 = mission_list.size - 1;
	if(var_d8222c25 == var_7a34e971)
	{
		eplayer give_achievement(#"hash_12bde4bff49c66ca");
	}
	if((var_b0abc67b[3] + var_b0abc67b[4]) == var_7a34e971)
	{
		eplayer give_achievement(#"hash_53a13cdbd8cdf8d7");
	}
}

/*
	Name: function_f854bc50
	Namespace: achievements
	Checksum: 0x23472D41
	Offset: 0x6D0
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function function_f854bc50(eplayer, levelname, difficulty)
{
	function_20254235(eplayer, levelname, difficulty);
	function_cc2216e2(eplayer);
}

/*
	Name: on_ai_spawned
	Namespace: achievements
	Checksum: 0x80F724D1
	Offset: 0x728
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
}

/*
	Name: on_ai_damage
	Namespace: achievements
	Checksum: 0x3005CFFC
	Offset: 0x738
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function on_ai_damage(s_params)
{
	self.var_e2f6147a = undefined;
	if(isplayer(s_params.eattacker))
	{
		if(s_params.idflags & 8)
		{
			self.var_e2f6147a = s_params.eattacker;
		}
	}
}

/*
	Name: on_player_death
	Namespace: achievements
	Checksum: 0x4FB48180
	Offset: 0x7A0
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function on_player_death(s_params)
{
	self.var_8e5e0541.killindex = 0;
	self.var_8e5e0541.var_ca87baa4 = 0;
	self.var_8e5e0541.kills = [];
	self.var_8e5e0541.var_f79c95f9 = [];
}

/*
	Name: function_467369b2
	Namespace: achievements
	Checksum: 0x7682AB43
	Offset: 0x7F8
	Size: 0x124
	Parameters: 2
	Flags: Linked, Private
*/
function private function_467369b2(var_668b29af, evictim)
{
	var_a8f62552 = distance(var_668b29af.origin, evictim.origin);
	if(var_a8f62552 >= 3937)
	{
		var_41db60bc = var_668b29af stats::get_stat(#"achievements", #"hash_5740a8698a4d0345");
		var_41db60bc++;
		/#
			printtoprightln((("" + var_a8f62552) + "") + var_41db60bc, (1, 1, 1));
		#/
		if(var_41db60bc >= 5)
		{
			var_668b29af give_achievement(#"hash_5740a8698a4d0345");
		}
		else
		{
			var_668b29af stats::set_stat(#"achievements", #"hash_5740a8698a4d0345", var_41db60bc);
		}
	}
}

/*
	Name: function_4239da84
	Namespace: achievements
	Checksum: 0x66244C7E
	Offset: 0x928
	Size: 0x14C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_4239da84(player, var_6d2d969a, weapon)
{
	weapon.var_8e5e0541.var_ca87baa4++;
	currentindex = weapon.var_8e5e0541.killindex;
	weapon.var_8e5e0541.kills[currentindex] = gettime();
	weapon.var_8e5e0541.killindex = (currentindex + 1) % 10;
	if(weapon.var_8e5e0541.var_ca87baa4 < 10)
	{
		return;
	}
	startindex = (currentindex + 1) % 10;
	starttime = weapon.var_8e5e0541.kills[startindex];
	endtime = weapon.var_8e5e0541.kills[currentindex];
	if(weapon.var_8e5e0541.var_ca87baa4 >= 10 && (endtime - starttime) <= 3000)
	{
		weapon give_achievement(#"hash_1e7fe721b8911e57");
	}
}

/*
	Name: function_b25a404e
	Namespace: achievements
	Checksum: 0x5071DE4E
	Offset: 0xA80
	Size: 0x16C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b25a404e(player, weapon)
{
	var_890c323c = getbaseweaponitemindex(weapon);
	if(!isdefined(var_890c323c) || (var_890c323c < 1 || var_890c323c > 60))
	{
		return;
	}
	player.var_8e5e0541.var_f79c95f9[weapon.rootweapon.name] = gettime();
	var_5f546d20 = 0;
	var_9aecaf58 = gettime() - 30000;
	if(var_9aecaf58 < 0)
	{
		var_9aecaf58 = 0;
	}
	foreach(lastkilltime in player.var_8e5e0541.var_f79c95f9)
	{
		if(lastkilltime > var_9aecaf58)
		{
			var_5f546d20++;
		}
	}
	if(var_5f546d20 >= 5)
	{
		player give_achievement(#"hash_1a6ca2f96f903656");
	}
}

/*
	Name: function_2240fcb8
	Namespace: achievements
	Checksum: 0x53936B65
	Offset: 0xBF8
	Size: 0x76
	Parameters: 3
	Flags: Linked
*/
function function_2240fcb8(eattacker, evictim, var_2d941c58)
{
	if(isdefined(var_2d941c58.iffowner) && isplayer(var_2d941c58.iffowner))
	{
		if(isdefined(var_2d941c58.killcount))
		{
			var_2d941c58.killcount++;
		}
		else
		{
			var_2d941c58.killcount = 1;
		}
	}
}

/*
	Name: function_8b531812
	Namespace: achievements
	Checksum: 0x37F303C
	Offset: 0xC78
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_8b531812(eplayer, evictim)
{
	if(isdefined(evictim.var_e2f6147a) && evictim.var_e2f6147a == eplayer && evictim.team !== #"allies")
	{
		eplayer give_achievement(#"hash_1f0a3ec94eff5513");
	}
}

/*
	Name: function_6e3f345f
	Namespace: achievements
	Checksum: 0x98E93194
	Offset: 0xD00
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_6e3f345f(eplayer)
{
	var_71c7cc3a = eplayer getmeleechaincount();
	if(2 <= var_71c7cc3a)
	{
		eplayer give_achievement(#"hash_42303e6214910391");
	}
}

/*
	Name: on_ai_killed
	Namespace: achievements
	Checksum: 0x5BCA1A40
	Offset: 0xD68
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(s_params)
{
	if(isplayer(s_params.eattacker))
	{
		player = s_params.eattacker;
		function_467369b2(player, self);
		function_6e3f345f(player);
		function_4239da84(player, self, s_params.weapon);
		function_b25a404e(player, s_params.weapon);
		function_8b531812(player, self);
		player function_1d62fbfa(1, s_params.weapon.weapclass, s_params.weapon.firetype);
	}
	else if(isai(s_params.eattacker))
	{
		function_2240fcb8(s_params.eattacker, self, s_params.weapon);
	}
}

/*
	Name: function_fd51b8a8
	Namespace: achievements
	Checksum: 0x6111222
	Offset: 0xEB8
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fd51b8a8()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"gun_level_complete");
		if(waitresult.is_last_rank && (waitresult.item_index >= 1 && waitresult.item_index <= 60))
		{
			self give_achievement(#"hash_30b6860e2869b596");
			break;
		}
	}
}

/*
	Name: checkweaponchallengecomplete
	Namespace: achievements
	Checksum: 0xD2E29DF5
	Offset: 0xF68
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function checkweaponchallengecomplete(var_71d636c6)
{
	if(var_71d636c6 == 3)
	{
		self give_achievement(#"hash_5f39b2b443875e95");
	}
}

/*
	Name: function_533e57d6
	Namespace: achievements
	Checksum: 0x3232722B
	Offset: 0xFB0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_533e57d6(player, count)
{
	player stats::function_dad108fa("cp_body_shield_count", count);
	var_69fa8154 = (isdefined(player stats::get_stat_global("cp_body_shield_count")) ? player stats::get_stat_global("cp_body_shield_count") : 0);
	if(var_69fa8154 >= 5)
	{
		player give_achievement(#"hash_7cfe4a58cd11b4f5");
	}
}

/*
	Name: function_1d62fbfa
	Namespace: achievements
	Checksum: 0xF551C6E1
	Offset: 0x1070
	Size: 0x2E4
	Parameters: 3
	Flags: Linked
*/
function function_1d62fbfa(count, weapclass, firetype)
{
	if(weapclass == "rifle" && firetype != "Single Shot")
	{
		self stats::function_dad108fa("cp_kills_ar", count);
	}
	else
	{
		if(weapclass == "spread")
		{
			self stats::function_dad108fa("cp_kills_sg", count);
		}
		else
		{
			if(weapclass == "mg")
			{
				self stats::function_dad108fa("cp_kills_lmg", count);
			}
			else
			{
				if(weapclass == "smg")
				{
					self stats::function_dad108fa("cp_kills_smg", count);
				}
				else
				{
					return;
				}
			}
		}
	}
	lmgkills = (isdefined(self stats::get_stat_global(#"cp_kills_lmg")) ? self stats::get_stat_global(#"cp_kills_lmg") : 0);
	smgkills = (isdefined(self stats::get_stat_global(#"cp_kills_smg")) ? self stats::get_stat_global(#"cp_kills_smg") : 0);
	arkills = (isdefined(self stats::get_stat_global(#"cp_kills_ar")) ? self stats::get_stat_global(#"cp_kills_ar") : 0);
	var_2f070c99 = (isdefined(self stats::get_stat_global(#"cp_kills_sg")) ? self stats::get_stat_global(#"cp_kills_sg") : 0);
	if(lmgkills >= 5 && smgkills >= 5 && arkills >= 5 && var_2f070c99 >= 5)
	{
		self give_achievement(#"hash_779bbce9266d0ae6");
	}
	if(arkills >= 200)
	{
		self give_achievement(#"hash_2e8492b0fa87ecf6");
	}
}

