#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_629725b7;

/*
	Name: function_89f2df9
	Namespace: namespace_629725b7
	Checksum: 0x52C9494B
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_34f1ac5824b8f875", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_629725b7
	Checksum: 0x666DD199
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
	zm_trial::register_challenge(#"hash_5065d3f7d21bf9d4", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_629725b7
	Checksum: 0xB4BFC277
	Offset: 0x140
	Size: 0xD4
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(var_85af3be4, var_752d90ad)
{
	if(getplayers().size == 1)
	{
		level.var_b529249b = zm_trial::function_5769f26a(var_752d90ad);
	}
	else
	{
		level.var_b529249b = zm_trial::function_5769f26a(var_85af3be4);
	}
	level.var_4b9163d5 = 0;
	namespace_b22c99a5::function_2976fa44(level.var_b529249b);
	namespace_b22c99a5::function_dace284(level.var_b529249b, 1);
	callback::on_player_damage(&on_player_damage);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_629725b7
	Checksum: 0xF57F0632
	Offset: 0x220
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	namespace_b22c99a5::function_f3dbeda7();
	level.var_b529249b = undefined;
	level.var_4b9163d5 = undefined;
	callback::remove_on_player_damage(&on_player_damage);
}

/*
	Name: is_active
	Namespace: namespace_629725b7
	Checksum: 0x42883E9F
	Offset: 0x280
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_5065d3f7d21bf9d4");
	return isdefined(challenge);
}

/*
	Name: on_player_damage
	Namespace: namespace_629725b7
	Checksum: 0x1FBD452E
	Offset: 0x2C0
	Size: 0x9C
	Parameters: 1
	Flags: Private
*/
function private on_player_damage(params)
{
	if(params.idamage >= 0)
	{
		level.var_4b9163d5++;
		namespace_b22c99a5::function_dace284(level.var_b529249b - level.var_4b9163d5);
		if(level.var_4b9163d5 >= level.var_b529249b)
		{
			zm_trial::fail(#"hash_404865fbf8dd5cc2", array(self));
		}
	}
}

