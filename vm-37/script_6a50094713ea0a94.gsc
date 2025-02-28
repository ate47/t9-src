#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\callbacks.gsc;

#namespace namespace_3642494f;

/*
	Name: function_89f2df9
	Namespace: namespace_3642494f
	Checksum: 0x4B2D77B6
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_57deab0f67e4368c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3642494f
	Checksum: 0x21EFD4B4
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
	zm_trial::register_challenge(#"use_magicbox", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_3642494f
	Checksum: 0xCCCE0232
	Offset: 0x138
	Size: 0x118
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_519131bc)
{
	if(!isdefined(var_519131bc))
	{
		var_519131bc = 1;
	}
	callback::function_b3c9adb7(&function_b3c9adb7);
	if(function_7a600918(var_519131bc))
	{
		level.var_519131bc = zm_trial::function_5769f26a(var_519131bc);
	}
	else
	{
		level.var_519131bc = var_519131bc;
	}
	foreach(player in getplayers())
	{
		player thread function_1685cc9b();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_3642494f
	Checksum: 0x33773B6C
	Offset: 0x258
	Size: 0x1EC
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
			if(player.var_8f30dd57 < level.var_519131bc)
			{
				array::add(var_57807cdc, player, 0);
			}
			player.var_8f30dd57 = undefined;
		}
		if(var_57807cdc.size == 1)
		{
			zm_trial::fail(#"hash_9c83a93f783b8e4", var_57807cdc);
		}
		else if(var_57807cdc.size > 1)
		{
			zm_trial::fail(#"hash_484dffbaa43c048d", var_57807cdc);
		}
	}
	level.var_519131bc = undefined;
	callback::function_342b2f6(&function_b3c9adb7);
}

/*
	Name: function_1685cc9b
	Namespace: namespace_3642494f
	Checksum: 0x6608990A
	Offset: 0x450
	Size: 0x110
	Parameters: 0
	Flags: Private
*/
function private function_1685cc9b()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	var_fa5d7ea0 = 0;
	self.var_8f30dd57 = 0;
	var_6bec3070 = 0;
	self namespace_b22c99a5::function_2190356a(self.var_8f30dd57);
	self namespace_b22c99a5::function_c2cd0cba(level.var_519131bc);
	while(true)
	{
		self waittill(#"hash_b0cc77b1ab98c08");
		if(self.var_8f30dd57 == level.var_519131bc)
		{
			self namespace_b22c99a5::function_63060af4(1);
		}
		else if(self.var_8f30dd57 < level.var_519131bc)
		{
			self namespace_b22c99a5::function_2190356a(self.var_8f30dd57);
		}
	}
}

/*
	Name: function_b3c9adb7
	Namespace: namespace_3642494f
	Checksum: 0x10DCFD3F
	Offset: 0x568
	Size: 0x3E
	Parameters: 1
	Flags: Private
*/
function private function_b3c9adb7(weapon)
{
	self.var_8f30dd57++;
	self notify(#"hash_b0cc77b1ab98c08", {#weapon:weapon});
}

