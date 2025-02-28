#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_4b4f4cd9;

/*
	Name: function_89f2df9
	Namespace: namespace_4b4f4cd9
	Checksum: 0xDC2E6C41
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_41efdc9d4eb8f646", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4b4f4cd9
	Checksum: 0x82CF822E
	Offset: 0xF8
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zombie_doors = getentarray("zombie_door", "targetname");
	zombie_debris = getentarray("zombie_debris", "targetname");
	level.var_a0f5e369 = function_d34c075e(zombie_doors);
	level.var_3a748490 = function_d34c075e(zombie_debris);
	zm_trial::register_challenge(#"hash_9247e3d5df46347", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_4b4f4cd9
	Checksum: 0xB1ADF222
	Offset: 0x1F0
	Size: 0xDC
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(n_timer)
{
	level.var_d39baced = level.zombie_total_set_func;
	level.zombie_total_set_func = &function_60845be6;
	namespace_b22c99a5::function_2976fa44(function_d2a5d1f0());
	namespace_b22c99a5::function_2976fa44(function_e242d7a8());
	level thread function_b2fa4678();
	if(isdefined(n_timer))
	{
		self.n_timer = zm_trial::function_5769f26a(n_timer);
		level thread function_e04dd27a(self.n_timer);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_4b4f4cd9
	Checksum: 0xA568BF4C
	Offset: 0x2D8
	Size: 0x15A
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.zombie_total_set_func = level.var_d39baced;
	namespace_b22c99a5::function_f3dbeda7();
	if(!round_reset)
	{
		var_eeba6731 = function_d2a5d1f0();
		var_de1def71 = function_e242d7a8();
		if(var_eeba6731 < var_de1def71)
		{
			zm_trial::fail(#"hash_2c31c30f3d0b0484", getplayers());
		}
	}
	if(isdefined(self.n_timer))
	{
		foreach(player in getplayers())
		{
			player namespace_b22c99a5::function_885fb2c8();
		}
	}
	level.var_d0b04690 = undefined;
}

/*
	Name: function_60845be6
	Namespace: namespace_4b4f4cd9
	Checksum: 0x3052F629
	Offset: 0x440
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_60845be6()
{
	var_92217b88 = (level.var_a0f5e369 + level.var_3a748490) * 10;
	level.zombie_total = int(max(level.zombie_total, var_92217b88));
}

/*
	Name: function_d34c075e
	Namespace: namespace_4b4f4cd9
	Checksum: 0xAC053CE7
	Offset: 0x4B0
	Size: 0xC6
	Parameters: 1
	Flags: Private
*/
function private function_d34c075e(ents)
{
	arrayremovevalue(ents, undefined, 0);
	unique = [];
	foreach(ent in ents)
	{
		if(isdefined(ent.target))
		{
			unique[ent.target] = 1;
		}
	}
	return unique.size;
}

/*
	Name: function_a4cfa984
	Namespace: namespace_4b4f4cd9
	Checksum: 0xD92FD404
	Offset: 0x580
	Size: 0x11E
	Parameters: 2
	Flags: Private
*/
function private function_a4cfa984(door_ents, var_8c55197a)
{
	var_8b730c3e = [];
	foreach(door_ent in door_ents)
	{
		if(isdefined(door_ent.target) && is_true(door_ent.has_been_opened))
		{
			var_8b730c3e[door_ent.target] = 1;
		}
	}
	var_eeba6731 = var_8b730c3e.size;
	var_c5f7c25b = function_d34c075e(var_8c55197a);
	var_69310a8a = level.var_3a748490 - var_c5f7c25b;
	return var_eeba6731 + var_69310a8a;
}

/*
	Name: function_b2fa4678
	Namespace: namespace_4b4f4cd9
	Checksum: 0xB768E486
	Offset: 0x6A8
	Size: 0x100
	Parameters: 0
	Flags: Private
*/
function private function_b2fa4678()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	var_c43a6efa = 0;
	var_58161ed2 = function_e242d7a8();
	while(true)
	{
		var_54e16eaa = function_d2a5d1f0();
		if(var_54e16eaa != var_c43a6efa)
		{
			if(var_54e16eaa >= var_58161ed2)
			{
				namespace_b22c99a5::function_7d32b7d0(1);
				level notify(#"hash_6ba2e2da302282");
				level.var_d0b04690 = 1;
			}
			else
			{
				namespace_b22c99a5::function_dace284(var_54e16eaa);
			}
			var_c43a6efa = var_54e16eaa;
		}
		wait(0.5);
	}
}

/*
	Name: function_e04dd27a
	Namespace: namespace_4b4f4cd9
	Checksum: 0x3CEE2FF
	Offset: 0x7B0
	Size: 0x1CC
	Parameters: 1
	Flags: Private
*/
function private function_e04dd27a(n_timer)
{
	level endon(#"hash_7646638df88a3656");
	wait(12);
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_128378c9(n_timer, 1, #"hash_c2b77be4cf5b142");
	}
	level waittilltimeout(n_timer + 1, #"hash_6ba2e2da302282");
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_885fb2c8();
	}
	if(function_d2a5d1f0() < function_e242d7a8())
	{
		zm_trial::fail(#"hash_2c31c30f3d0b0484", getplayers());
	}
}

/*
	Name: function_d2a5d1f0
	Namespace: namespace_4b4f4cd9
	Checksum: 0x40B3C903
	Offset: 0x988
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_d2a5d1f0()
{
	zombie_doors = getentarray("zombie_door", "targetname");
	zombie_debris = getentarray("zombie_debris", "targetname");
	var_49a2fc65 = function_a4cfa984(zombie_doors, zombie_debris);
	return var_49a2fc65;
}

/*
	Name: function_e242d7a8
	Namespace: namespace_4b4f4cd9
	Checksum: 0x7EA59DAA
	Offset: 0xA10
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function function_e242d7a8()
{
	return level.var_a0f5e369 + level.var_3a748490;
}

