#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_score.gsc;

#namespace zm_trial_damage_drains_points;

/*
	Name: function_be2257a8
	Namespace: zm_trial_damage_drains_points
	Checksum: 0xD389448E
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_be2257a8()
{
	level notify(280320824);
}

/*
	Name: __init__system__
	Namespace: zm_trial_damage_drains_points
	Checksum: 0x5AE93D5C
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_damage_drains_points", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_damage_drains_points
	Checksum: 0xBCF0CBA1
	Offset: 0xF8
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"damage_drains_points", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_damage_drains_points
	Checksum: 0x70BF768
	Offset: 0x160
	Size: 0xB8
	Parameters: 2
	Flags: Linked, Private
*/
function private on_begin(var_66fe7443, var_ec90b685)
{
	if(isdefined(var_ec90b685))
	{
		self.var_ec90b685 = 1;
		callback::on_ai_killed(&function_8e0401ab);
		level.var_a58dc99e = zm_trial::function_5769f26a(var_66fe7443);
	}
	else
	{
		var_620e7dea = zm_trial::function_5769f26a(var_66fe7443) / 100;
		level.var_baf7ae7f = level.var_a2d8b7eb;
		level.var_a2d8b7eb = var_620e7dea;
	}
}

/*
	Name: on_end
	Namespace: zm_trial_damage_drains_points
	Checksum: 0x7DADCB96
	Offset: 0x220
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	if(is_true(self.var_ec90b685))
	{
		callback::remove_on_ai_killed(&function_8e0401ab);
		level.var_a58dc99e = undefined;
		self.var_ec90b685 = undefined;
	}
	else
	{
		level.var_a2d8b7eb = level.var_baf7ae7f;
		level.var_baf7ae7f = undefined;
	}
}

/*
	Name: is_active
	Namespace: zm_trial_damage_drains_points
	Checksum: 0xCAF5152B
	Offset: 0x2A0
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function is_active(var_a32bbdd)
{
	if(!isdefined(var_a32bbdd))
	{
		var_a32bbdd = 0;
	}
	s_challenge = zm_trial::function_a36e8c38(#"damage_drains_points");
	if(var_a32bbdd)
	{
		if(isdefined(s_challenge) && is_true(s_challenge.var_ec90b685))
		{
			return 1;
		}
		return 0;
	}
	return isdefined(s_challenge);
}

/*
	Name: function_8e0401ab
	Namespace: zm_trial_damage_drains_points
	Checksum: 0xC21B3754
	Offset: 0x330
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8e0401ab(params)
{
	if(is_true(self.nuked))
	{
		a_players = function_a1ef346b();
		var_fc97ca4d = array::random(a_players);
		if(isplayer(var_fc97ca4d))
		{
			var_fc97ca4d zm_score::minus_to_player_score(level.var_a58dc99e, 1);
		}
	}
	else if(isplayer(params.eattacker))
	{
		params.eattacker zm_score::minus_to_player_score(level.var_a58dc99e, 1);
	}
}

