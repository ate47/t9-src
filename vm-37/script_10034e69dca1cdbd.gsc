#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_d579463e;

/*
	Name: function_89f2df9
	Namespace: namespace_d579463e
	Checksum: 0xD8316961
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5993cb43cbe55c17", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d579463e
	Checksum: 0xC1D0F9D0
	Offset: 0xD0
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
	zm_trial::register_challenge(#"hash_4803a4a42dd83650", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_d579463e
	Checksum: 0xB4444B9F
	Offset: 0x138
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(weapon_name)
{
	namespace_b22c99a5::function_7d32b7d0(0);
	level thread function_83b71e7c();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_d579463e
	Checksum: 0x908D9506
	Offset: 0x180
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	namespace_b22c99a5::function_f3dbeda7();
	if(!round_reset)
	{
		if(!level flag::get(level.var_5bfd847e))
		{
			if(zm_utility::function_166646a6() == 1)
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
	Namespace: namespace_d579463e
	Checksum: 0xBD88ED97
	Offset: 0x238
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
		namespace_b22c99a5::function_7d32b7d0(1);
		level flag::wait_till_clear(level.var_5bfd847e);
		namespace_b22c99a5::function_7d32b7d0(0);
	}
}

