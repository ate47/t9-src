#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_78f31cd9;

/*
	Name: function_a5e60ba8
	Namespace: namespace_78f31cd9
	Checksum: 0x3D11CD8C
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a5e60ba8()
{
	level notify(1752317388);
}

#namespace namespace_1e38a8f6;

/*
	Name: init
	Namespace: namespace_1e38a8f6
	Checksum: 0x625B856E
	Offset: 0xD8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function init()
{
	registerclientfield("toplayer", "RGB_keyboard_manager", 1, 3, "int");
	callback::on_game_playing(&function_ca0a1ea4);
}

/*
	Name: function_ca0a1ea4
	Namespace: namespace_1e38a8f6
	Checksum: 0xE1C8F518
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_ca0a1ea4()
{
	level waittill(#"player_spawned");
	if(sessionmodeismultiplayergame())
	{
		thread function_9e94a567();
	}
}

/*
	Name: function_9e94a567
	Namespace: namespace_1e38a8f6
	Checksum: 0x19BB31BB
	Offset: 0x188
	Size: 0x25C
	Parameters: 0
	Flags: Linked
*/
function function_9e94a567()
{
	while(!is_true(level.gameended))
	{
		wait(0.5);
		if(!isdefined(level.teams))
		{
			continue;
		}
		if(level.teams.size > 2)
		{
			continue;
		}
		score = 0;
		winning_teams = [];
		foreach(team, _ in level.teams)
		{
			team_score = game.stat[#"teamscores"][team];
			if(team_score > score)
			{
				score = team_score;
				winning_teams = [];
			}
			if(team_score == score)
			{
				winning_teams[winning_teams.size] = team;
			}
		}
		if(winning_teams.size != 1)
		{
			event = 1;
		}
		else
		{
			if(winning_teams[0] == "allies")
			{
				event = 2;
			}
			else if(winning_teams[0] == "axis")
			{
				event = 3;
			}
		}
		if(!isint(event))
		{
			continue;
		}
		foreach(player in level.players)
		{
			if(player function_8b1a219a())
			{
				player clientfield::set_to_player("RGB_keyboard_manager", event);
			}
		}
	}
}

