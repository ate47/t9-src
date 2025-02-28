#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_trial_turn_on_power;

/*
	Name: function_1d74249e
	Namespace: zm_trial_turn_on_power
	Checksum: 0xF3D39614
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1d74249e()
{
	level notify(1641436629);
}

/*
	Name: __init__system__
	Namespace: zm_trial_turn_on_power
	Checksum: 0x771ECE15
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_turn_on_power", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_turn_on_power
	Checksum: 0x1C1A97B5
	Offset: 0xF0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"turn_on_power", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_turn_on_power
	Checksum: 0x8CB112F5
	Offset: 0x158
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private on_begin(weapon_name)
{
	zm_trial_util::function_7d32b7d0(0);
	level thread function_83b71e7c();
}

/*
	Name: on_end
	Namespace: zm_trial_turn_on_power
	Checksum: 0x6583E502
	Offset: 0x1A0
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
	if(!round_reset)
	{
		if(!level flag::get(level.var_5bfd847e))
		{
			if(zm_utility::get_story() == 1)
			{
				zm_trial::fail(#"hash_ad3c47f53414b85");
			}
			else
			{
				zm_trial::fail(#"hash_765b6a6e9523c15a");
			}
		}
	}
}

/*
	Name: function_83b71e7c
	Namespace: zm_trial_turn_on_power
	Checksum: 0xF10FD80
	Offset: 0x258
	Size: 0xA8
	Parameters: 0
	Flags: Private
*/
function private function_83b71e7c()
{
	level endon(#"hash_7646638df88a3656");
	self endon(#"death");
	while(true)
	{
		level flag::wait_till(level.var_5bfd847e);
		zm_trial_util::function_7d32b7d0(1);
		level flag::wait_till_clear(level.var_5bfd847e);
		zm_trial_util::function_7d32b7d0(0);
	}
}

