#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_spawner.gsc;

#namespace namespace_ea9baedf;

/*
	Name: function_89f2df9
	Namespace: namespace_ea9baedf
	Checksum: 0xFF6EE217
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_c25f006b5e1726d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ea9baedf
	Checksum: 0x6D594A93
	Offset: 0xD8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_7735a2dc4298e55c", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_ea9baedf
	Checksum: 0x1D0BDD19
	Offset: 0x140
	Size: 0x184
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(kill_count)
{
	self.kill_count = zm_trial::function_5769f26a(kill_count);
	foreach(player in getplayers())
	{
		player.var_c957540c = 0;
	}
	zm_spawner::register_zombie_death_event_callback(&function_138aec8e);
	namespace_b22c99a5::function_c2cd0cba(self.kill_count);
	foreach(player in getplayers())
	{
		player thread function_7f62f098(self);
	}
	level thread function_69c5df45(self);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_ea9baedf
	Checksum: 0x945295CB
	Offset: 0x2D0
	Size: 0x254
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
	}
	if(!round_reset)
	{
		var_57807cdc = [];
		foreach(player in getplayers())
		{
			if(player.var_c957540c < self.kill_count)
			{
				array::add(var_57807cdc, player, 0);
			}
		}
		if(var_57807cdc.size == 1)
		{
			zm_trial::fail(#"hash_788ffc8d7448f05", var_57807cdc);
		}
		else if(var_57807cdc.size > 1)
		{
			zm_trial::fail(#"hash_2bf9eb58ed3ac518", var_57807cdc);
		}
	}
	foreach(player in getplayers())
	{
		player.var_c957540c = undefined;
	}
	zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

/*
	Name: function_7f62f098
	Namespace: namespace_ea9baedf
	Checksum: 0x9292F6B1
	Offset: 0x530
	Size: 0x9E
	Parameters: 1
	Flags: Private
*/
function private function_7f62f098(challenge)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		var_96936cca = self.var_c957540c;
		if(var_96936cca < 0)
		{
			var_96936cca = 0;
		}
		else if(var_96936cca > challenge.kill_count)
		{
			var_96936cca = challenge.kill_count;
		}
		self namespace_b22c99a5::function_2190356a(var_96936cca);
		waitframe(1);
	}
}

/*
	Name: function_69c5df45
	Namespace: namespace_ea9baedf
	Checksum: 0x75D5B438
	Offset: 0x5D8
	Size: 0x184
	Parameters: 1
	Flags: Private
*/
function private function_69c5df45(challenge)
{
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		/#
			assert(isdefined(challenge));
		#/
		end_round = 1;
		foreach(player in getplayers())
		{
			if(player.var_c957540c < challenge.kill_count)
			{
				end_round = 0;
			}
		}
		if(end_round)
		{
			enemies = getaiteamarray(level.zombie_team);
			if(isdefined(enemies))
			{
				for(i = 0; i < enemies.size; i++)
				{
					enemies[i] dodamage(enemies[i].health + 666, enemies[i].origin);
				}
			}
			level.zombie_total = 0;
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_138aec8e
	Namespace: namespace_ea9baedf
	Checksum: 0x816B3271
	Offset: 0x768
	Size: 0xD0
	Parameters: 1
	Flags: Private
*/
function private function_138aec8e(attacker)
{
	if(is_true(self.nuked))
	{
		foreach(player in getplayers())
		{
			player.var_c957540c++;
		}
		return;
	}
	if(isplayer(attacker))
	{
		attacker.var_c957540c++;
	}
}

