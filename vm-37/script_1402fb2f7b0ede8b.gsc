#using script_6021ce59143452c3;
#using script_ab890501c40b73c;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_dbd46b57;

/*
	Name: function_89f2df9
	Namespace: namespace_dbd46b57
	Checksum: 0xCFC33992
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6713646f83073129", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dbd46b57
	Checksum: 0x4A9A0D46
	Offset: 0xE0
	Size: 0xF0
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	level.var_5335b66f = associativearray(#"hash_53bd8d8afd745e0", 1, #"hash_7b56bdcba095cb41", 2, #"hash_68ca3d7404460abf", 3, #"hash_1d84c5587b7c3dd4", 4, #"hash_177ee254a5de65d8", 5, #"hash_3cf0f6c1e53f5282", 6, #"hash_5639494d7b07b79c", 7);
	zm_trial::register_challenge(#"give_reward", &function_d1de6a85, &function_9e7b3f4d);
	level.var_ee7ca64 = [];
}

/*
	Name: function_d1de6a85
	Namespace: namespace_dbd46b57
	Checksum: 0xEEC14C0
	Offset: 0x1D8
	Size: 0x76
	Parameters: 6
	Flags: Private
*/
function private function_d1de6a85(var_c2964c77, description, image, var_1ab324d7, var_191009a6, var_8d63de44)
{
	self.var_c2964c77 = image;
	self.var_1ab324d7 = var_1ab324d7;
	self.var_191009a6 = var_191009a6;
	self.var_8d63de44 = var_8d63de44 === #"1";
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_dbd46b57
	Checksum: 0x36AC1162
	Offset: 0x258
	Size: 0x118
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(!round_reset && !level flag::get(#"hash_6acab8bde7078239"))
	{
		self function_e7254828();
		if(is_true(self.var_8d63de44))
		{
			luinotifyevent(#"hash_7fe359bfb266e915");
			foreach(player in getplayers())
			{
				player zm_utility::give_achievement(#"zm_trials_round_30");
			}
		}
	}
}

/*
	Name: function_e7254828
	Namespace: namespace_dbd46b57
	Checksum: 0x19655FD2
	Offset: 0x378
	Size: 0x460
	Parameters: 0
	Flags: Private
*/
function private function_e7254828()
{
	/#
		assert(isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.name));
	#/
	/#
		assert(isdefined(level.var_5335b66f) && isdefined(level.var_5335b66f[level.var_6d87ac05.name]));
	#/
	var_93493c8 = level.var_5335b66f[level.var_6d87ac05.name];
	curr_time = gettime() - level.var_21e22beb;
	var_ee7ca64 = is_true(level.var_ee7ca64[level.round_number]);
	if(is_true(self.var_8d63de44))
	{
		level.var_bccd8271 = curr_time;
	}
	foreach(player in getplayers())
	{
		best_time = player zm_stats::function_8e274b32(self.var_c2964c77);
		if(best_time == 0 && !var_ee7ca64)
		{
			level.var_ee7ca64[level.round_number] = 1;
			player luinotifyevent(#"hash_8d33c3be569f08", 1, self.row);
			if(level.onlinegame)
			{
				player function_4835d26a();
			}
		}
		player zm_stats::function_31931250(self.var_c2964c77, curr_time);
		best_time = player zm_stats::function_b1520544(self.var_c2964c77);
		if(best_time == 0 || curr_time < best_time)
		{
			player zm_stats::function_49469f35(self.var_c2964c77, curr_time);
		}
		best_time = zm_stats::function_c9d32eb9(self.var_c2964c77);
		if(best_time == 0 || curr_time < best_time)
		{
			zm_stats::function_42677837(self.var_c2964c77, curr_time);
		}
		best_time = player zm_stats::function_e4358abd(self.var_c2964c77);
		if(best_time == 0 || curr_time < best_time)
		{
			player zm_stats::function_9daadcaa(self.var_c2964c77, curr_time);
		}
		if(is_true(self.var_8d63de44))
		{
			player notify(#"stop_player_monitor_time_played");
		}
		player zm_stats::increment_challenge_stat(self.var_1ab324d7, 1);
		if(level.round_number == 20)
		{
			player contracts::function_5b88297d(#"hash_4e5a4f28d918179c");
		}
		if(zm_trial::function_ba9853db() == 0)
		{
			if(isdefined(self.var_191009a6))
			{
				player zm_stats::increment_challenge_stat(self.var_191009a6, 1);
			}
			if(level.round_number == 10)
			{
				player contracts::function_5b88297d(#"hash_e0f3cb0f4c8c82d");
			}
		}
	}
}

