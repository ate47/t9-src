#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_87ea1cc;

/*
	Name: function_d7e26b9d
	Namespace: namespace_87ea1cc
	Checksum: 0x1CF213E7
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d7e26b9d()
{
	level notify(389055337);
}

/*
	Name: function_89f2df9
	Namespace: namespace_87ea1cc
	Checksum: 0xE48E8047
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_445fb98049b74edc", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_87ea1cc
	Checksum: 0x664CC0A3
	Offset: 0x110
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
	zm_trial::register_challenge(#"hash_3ee4fa74a546cbcd", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_87ea1cc
	Checksum: 0x533C9878
	Offset: 0x178
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	zm_powerups::function_74b8ec6b("carpenter");
	level thread function_4172344e();
}

/*
	Name: on_end
	Namespace: namespace_87ea1cc
	Checksum: 0x9650ED19
	Offset: 0x1B8
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	if(!round_reset && level.var_3de460b1 < level.var_70135c38)
	{
		zm_trial::fail(#"hash_e0fa688fb248886");
	}
	level.var_3de460b1 = undefined;
	level.var_70135c38 = undefined;
	zm_trial_util::function_f3dbeda7();
	zm_powerups::function_41cedb05("carpenter");
}

/*
	Name: function_4172344e
	Namespace: namespace_87ea1cc
	Checksum: 0xCBA84EE7
	Offset: 0x250
	Size: 0x192
	Parameters: 0
	Flags: None
*/
function function_4172344e()
{
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		level.var_70135c38 = level.exterior_goals.size;
		level.var_3de460b1 = 0;
		foreach(s_barrier in level.exterior_goals)
		{
			if(zm_utility::all_chunks_intact(s_barrier, s_barrier.barrier_chunks) || zm_utility::no_valid_repairable_boards(s_barrier, s_barrier.barrier_chunks))
			{
				level.var_3de460b1++;
			}
		}
		zm_trial_util::function_2976fa44(level.var_70135c38);
		zm_trial_util::function_dace284(level.var_3de460b1, 1);
		var_be17187b = undefined;
		var_be17187b = level waittill(#"zombie_board_tear", #"hash_747f63d86cb99870", #"carpenter_finished");
	}
}

