#using script_27c22e1d8df4d852;
#using script_4aeb3279b6b23a91;
#using script_58c342edd81589fb;
#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_c56530a8;

/*
	Name: function_89f2df9
	Namespace: namespace_c56530a8
	Checksum: 0x5D0B55B4
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4229d59c5b830185", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_c56530a8
	Checksum: 0xAE4DA1E9
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
	zm_trial::register_challenge(#"hash_3746f3c279f7a5ea", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_c56530a8
	Checksum: 0xE2633A11
	Offset: 0x138
	Size: 0x2FC
	Parameters: 4
	Flags: Private
*/
function private function_d1de6a85(var_49d0b42a, var_d2d5c522, var_17d04dfe, var_6a68f1d6)
{
	n_variant = getgametypesetting(#"zmtrialsvariant");
	switch(getplayers().size)
	{
		case 1:
		{
			level.var_88bac0b7 = zm_trial::function_5769f26a(var_49d0b42a);
			level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 15 : 15);
			break;
		}
		case 2:
		{
			level.var_88bac0b7 = zm_trial::function_5769f26a(var_d2d5c522);
			level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 15 : 15);
			break;
		}
		case 3:
		{
			level.var_88bac0b7 = zm_trial::function_5769f26a(var_17d04dfe);
			level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 10 : 10);
			break;
		}
		case 4:
		default:
		{
			level.var_88bac0b7 = zm_trial::function_5769f26a(var_6a68f1d6);
			level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 10 : 10);
			break;
		}
	}
	level.var_fb0b57a7 = 0;
	namespace_b22c99a5::function_2976fa44(level.var_88bac0b7);
	namespace_b22c99a5::function_dace284(level.var_fb0b57a7);
	level.var_1c7412f9 = #"catalyst";
	namespace_c3287616::function_c1571721(&namespace_fd89d870::function_51ec9e09);
	namespace_c3287616::function_54fee373(&namespace_fd89d870::function_1b1d71e7);
	namespace_c3287616::function_2876740e(level.var_1c7412f9, &namespace_fd89d870::function_a7c00976);
	level.var_ed006fe8 = array(1, 2, 3, 4);
	level thread function_cb35d440();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_c56530a8
	Checksum: 0x6E5D836A
	Offset: 0x440
	Size: 0xFE
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	namespace_b22c99a5::function_f3dbeda7();
	namespace_c3287616::function_510039c1(&namespace_fd89d870::function_51ec9e09);
	namespace_c3287616::function_375519eb(&namespace_fd89d870::function_1b1d71e7);
	namespace_c3287616::function_9bf14a10(level.var_1c7412f9, &namespace_fd89d870::function_a7c00976);
	if(!round_reset)
	{
		if(level.var_fb0b57a7 < level.var_88bac0b7)
		{
			zm_trial::fail(#"hash_3f700791572b0dcf");
		}
	}
	level.var_88bac0b7 = undefined;
	level.var_fb0b57a7 = undefined;
	level.var_1c7412f9 = undefined;
	level.var_e34a018e = undefined;
	level.var_ed006fe8 = undefined;
}

/*
	Name: function_cb35d440
	Namespace: namespace_c56530a8
	Checksum: 0x29238D46
	Offset: 0x548
	Size: 0x80
	Parameters: 0
	Flags: Private
*/
function private function_cb35d440()
{
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		level waittill(#"hash_166cac102910cdb3");
		level.var_fb0b57a7++;
		if(level.var_fb0b57a7 <= level.var_88bac0b7)
		{
			namespace_b22c99a5::function_dace284(level.var_fb0b57a7);
		}
	}
}

/*
	Name: is_active
	Namespace: namespace_c56530a8
	Checksum: 0xE0822BF3
	Offset: 0x5D0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_3746f3c279f7a5ea");
	return isdefined(challenge);
}

