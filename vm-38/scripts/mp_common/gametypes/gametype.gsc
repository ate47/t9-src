#using script_1cc417743d7c262d;
#using script_335d0650ed05d36d;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\util.gsc;

#namespace gametype;

/*
	Name: function_377c40c0
	Namespace: gametype
	Checksum: 0xE3660234
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_377c40c0()
{
	level notify(269460270);
}

/*
	Name: init_mp
	Namespace: gametype
	Checksum: 0x43B808AC
	Offset: 0xB8
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function init_mp()
{
	if(!isdefined(level.var_d1455682))
	{
		level.var_d1455682 = function_302bd0b9();
	}
	if(!isdefined(level.var_d1455682))
	{
		return;
	}
	level.teambased = function_b2272884();
	globallogic_audio::set_leader_gametype_dialog(level.var_d1455682.var_ef0e6936, level.var_d1455682.var_92ea240c, level.var_d1455682.var_39d466bc, level.var_d1455682.var_fd58840f, level.var_d1455682.var_39f24ab5, level.var_d1455682.var_a254e69e);
	if(!isdefined(game.switchedsides))
	{
		game.switchedsides = 0;
	}
	level.onroundswitch = &on_round_switch;
}

/*
	Name: on_start_game_type
	Namespace: gametype
	Checksum: 0x7B2D5A1F
	Offset: 0x1C0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function on_start_game_type()
{
	bundle = level.var_d1455682;
	if(!isdefined(bundle))
	{
		return;
	}
	function_f2f4dfa7();
	if(level.teambased)
	{
		spawning::function_b4f071cd();
	}
	util::function_9540d9b6();
	if(!util::isoneround() && level.scoreroundwinbased)
	{
		globallogic_score::resetteamscores();
	}
}

/*
	Name: on_round_switch
	Namespace: gametype
	Checksum: 0xE1F609D3
	Offset: 0x268
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function on_round_switch()
{
	bundle = level.var_d1455682;
	if(!isdefined(bundle))
	{
		return;
	}
	if(is_true(level.var_d1455682.switchsides))
	{
		game.switchedsides = !game.switchedsides;
		userspawnselection::onroundchange();
	}
}

/*
	Name: function_f2f4dfa7
	Namespace: gametype
	Checksum: 0xC8E76E4A
	Offset: 0x2E0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_f2f4dfa7()
{
	if(is_true(level.var_d1455682.switchsides) && game.switchedsides)
	{
		util::set_team_mapping(game.defenders, game.attackers);
	}
	else
	{
		util::set_team_mapping(game.attackers, game.defenders);
	}
	level flag::set(#"hash_22ca95de91eb92b");
}

