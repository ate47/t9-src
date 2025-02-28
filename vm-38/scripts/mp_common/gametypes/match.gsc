#using script_3d703ef87a841fe4;
#using scripts\core_common\system_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\round.gsc;

#namespace match;

/*
	Name: function_acd2421a
	Namespace: match
	Checksum: 0x34772B8F
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_acd2421a()
{
	level notify(69160514);
}

/*
	Name: __init__system__
	Namespace: match
	Checksum: 0x6854AEFE
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"match", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: match
	Checksum: 0x888484ED
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_94003d29();
}

/*
	Name: function_37f04b09
	Namespace: match
	Checksum: 0x40447A44
	Offset: 0x150
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_37f04b09()
{
	if(!isdefined(game.outcome))
	{
		game.outcome = outcome::function_a1a81955();
		game.outcome.var_3c5fdf73 = [];
	}
}

/*
	Name: function_94003d29
	Namespace: match
	Checksum: 0xDF8ADCE0
	Offset: 0x198
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_94003d29()
{
	function_37f04b09();
	round::function_37f04b09();
	if(overtime::is_overtime_round())
	{
		set_overtime();
	}
}

/*
	Name: function_f37f02fc
	Namespace: match
	Checksum: 0x20D95E9A
	Offset: 0x1F0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_f37f02fc()
{
	return game.outcome;
}

/*
	Name: function_b6b94df8
	Namespace: match
	Checksum: 0xA0D22F0
	Offset: 0x208
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_b6b94df8()
{
	if(overtime::is_overtime_round())
	{
		set_overtime();
	}
}

/*
	Name: set_overtime
	Namespace: match
	Checksum: 0x186F4228
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function set_overtime()
{
	round::set_flag("overtime");
	set_flag("overtime");
}

/*
	Name: set_flag
	Namespace: match
	Checksum: 0xB7FEF231
	Offset: 0x280
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function set_flag(flag)
{
	outcome::set_flag(game.outcome, flag);
}

/*
	Name: get_flag
	Namespace: match
	Checksum: 0x48D60C11
	Offset: 0x2B8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function get_flag(flag)
{
	return outcome::get_flag(game.outcome, flag);
}

/*
	Name: clear_flag
	Namespace: match
	Checksum: 0xE4D16CC5
	Offset: 0x2F0
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function clear_flag(flag)
{
	return outcome::clear_flag(game.outcome, flag);
}

/*
	Name: function_897438f4
	Namespace: match
	Checksum: 0x349AE8A9
	Offset: 0x328
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_897438f4(var_c1e98979)
{
	outcome::function_897438f4(game.outcome, var_c1e98979);
}

/*
	Name: function_3624d032
	Namespace: match
	Checksum: 0xF30275F3
	Offset: 0x360
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_3624d032()
{
	return outcome::function_3624d032(game.outcome);
}

/*
	Name: function_c10174e7
	Namespace: match
	Checksum: 0xE8BA0388
	Offset: 0x388
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_c10174e7()
{
	if(isdefined(game.outcome.team) && isdefined(level.teams[game.outcome.team]))
	{
		return true;
	}
	if(game.outcome.players.size)
	{
		return true;
	}
	return false;
}

/*
	Name: get_winning_team
	Namespace: match
	Checksum: 0x845D40CE
	Offset: 0x3F8
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_winning_team()
{
	return outcome::get_winning_team(game.outcome);
}

/*
	Name: is_winning_team
	Namespace: match
	Checksum: 0xF58B48F0
	Offset: 0x420
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function is_winning_team(team)
{
	if(isdefined(game.outcome.team) && team == game.outcome.team)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a2b53e17
	Namespace: match
	Checksum: 0x3CAAD425
	Offset: 0x478
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_a2b53e17(player)
{
	if(game.outcome.team !== #"none" && player.pers[#"team"] === game.outcome.team)
	{
		return true;
	}
	if(game.outcome.players.size)
	{
		if(player == game.outcome.players[0])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_75f97ac7
	Namespace: match
	Checksum: 0x772085F2
	Offset: 0x528
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_75f97ac7()
{
	if(game.outcome.players.size)
	{
		return true;
	}
	return false;
}

/*
	Name: function_517c0ce0
	Namespace: match
	Checksum: 0x85DC6C8
	Offset: 0x558
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function function_517c0ce0()
{
	if(game.outcome.players.size)
	{
		return game.outcome.players[0] ishost();
	}
	return 0;
}

/*
	Name: function_b5f4c9d8
	Namespace: match
	Checksum: 0xF0DEA8DF
	Offset: 0x5A8
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_b5f4c9d8()
{
	return outcome::function_b5f4c9d8(game.outcome);
}

/*
	Name: get_winner
	Namespace: match
	Checksum: 0xBCC24596
	Offset: 0x5D0
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function get_winner()
{
	if(is_true(level.teambased))
	{
		return outcome::get_winning_team(game.outcome);
	}
	return outcome::function_b5f4c9d8(game.outcome);
}

/*
	Name: set_winner
	Namespace: match
	Checksum: 0x8B90F983
	Offset: 0x630
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function set_winner(team_or_player)
{
	outcome::set_winner(game.outcome, team_or_player);
}

/*
	Name: function_af2e264f
	Namespace: match
	Checksum: 0x4E9D9F09
	Offset: 0x668
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_af2e264f(winner)
{
	outcome::function_af2e264f(game.outcome, winner);
}

/*
	Name: function_870759fb
	Namespace: match
	Checksum: 0xC7CE2AFE
	Offset: 0x6A0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_870759fb()
{
	winner = function_6d0354e3();
	outcome::function_af2e264f(game.outcome, winner);
}

/*
	Name: function_6d0354e3
	Namespace: match
	Checksum: 0xDA837EF2
	Offset: 0x6E8
	Size: 0x10A
	Parameters: 0
	Flags: Linked
*/
function function_6d0354e3()
{
	winner = round::get_winner();
	if(game.outcome.var_aefc8b8d.var_c1e98979 != 7)
	{
		if(level.teambased && get_flag("overtime"))
		{
			if(!is_true(level.doubleovertime) || round::get_flag("tie"))
			{
				winner = teams::function_d85770f0("overtimeroundswon");
			}
		}
		else
		{
			if(level.scoreroundwinbased)
			{
				winner = teams::function_d85770f0("roundswon");
			}
			else
			{
				winner = teams::function_ef80de99();
			}
		}
	}
	return winner;
}

