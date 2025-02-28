#using script_1cc417743d7c262d;
#using scripts\killstreaks\mp\killstreaks.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\player\player_role.gsc;
#using script_44b0b8420eabacad;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\util.gsc;

#namespace fireteam;

/*
	Name: function_6e46cb9
	Namespace: fireteam
	Checksum: 0xE075955D
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6e46cb9()
{
	level notify(576044652);
}

/*
	Name: main
	Namespace: fireteam
	Checksum: 0xA4927062
	Offset: 0x190
	Size: 0x15C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	util::registerroundscorelimit(0, 10000);
	level.takelivesondeath = 1;
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	level.onroundswitch = &onroundswitch;
	level.onendround = &onendround;
	player::function_cf3aa03d(&onplayerkilled);
	spawning::addsupportedspawnpointtype("tdm");
	spawning::addsupportedspawnpointtype("fireteam");
	if(getdvarint(#"hash_5795d85dc4b1b0d9", 0))
	{
		level.var_49a15413 = getdvarint(#"hash_5795d85dc4b1b0d9", 0);
		level.scoremodifiercallback = &function_f9df98d3;
	}
}

/*
	Name: onstartgametype
	Namespace: fireteam
	Checksum: 0x1FAD1E09
	Offset: 0x2F8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.displayroundendtext = 0;
	level thread onscoreclosemusic();
	if(!util::isoneround())
	{
		level.displayroundendtext = 1;
		if(level.scoreroundwinbased)
		{
			globallogic_score::resetteamscores();
		}
	}
	if(is_true(level.droppedtagrespawn))
	{
		level.numlives = 1;
	}
}

/*
	Name: onspawnplayer
	Namespace: fireteam
	Checksum: 0xBAE5BCB5
	Offset: 0x390
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	self.usingobj = undefined;
	if(spawning::usestartspawns() && !level.ingraceperiod && !level.playerqueuedrespawn)
	{
		spawning::function_7a87efaa();
	}
	spawning::onspawnplayer(predictedspawn);
}

/*
	Name: onroundswitch
	Namespace: fireteam
	Checksum: 0xC30AEC68
	Offset: 0x418
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onroundswitch()
{
	gametype::on_round_switch();
	globallogic_score::function_9779ac61();
}

/*
	Name: onendround
	Namespace: fireteam
	Checksum: 0xE4E16BD
	Offset: 0x448
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function onendround(var_c1e98979)
{
	function_e596b745(var_c1e98979);
}

/*
	Name: onscoreclosemusic
	Namespace: fireteam
	Checksum: 0x8F4ACC22
	Offset: 0x478
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function onscoreclosemusic()
{
	teamscores = [];
	while(!level.gameended)
	{
		scorelimit = level.scorelimit;
		scorethreshold = scorelimit * 0.1;
		scorethresholdstart = abs(scorelimit - scorethreshold);
		scorelimitcheck = scorelimit - 10;
		topscore = 0;
		runnerupscore = 0;
		foreach(_ in level.teams)
		{
			score = [[level._getteamscore]](team);
			if(score > topscore)
			{
				runnerupscore = topscore;
				topscore = score;
				continue;
			}
			if(score > runnerupscore)
			{
				runnerupscore = score;
			}
		}
		scoredif = topscore - runnerupscore;
		if(topscore >= (scorelimit * 0.5))
		{
			level notify(#"sndmusichalfway");
			return;
		}
		wait(1);
	}
}

/*
	Name: onplayerkilled
	Namespace: fireteam
	Checksum: 0xB1380BF
	Offset: 0x620
	Size: 0x214
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(smeansofdeath == "MOD_META")
	{
		return;
	}
	if(is_true(level.droppedtagrespawn))
	{
		thread dogtags::checkallowspectating();
		should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
		should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
		if(should_spawn_tags)
		{
			level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
		}
	}
	if(isplayer(attacker) == 0 || attacker.team == self.team)
	{
		return;
	}
	if(!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || is_true(level.killstreaksgivegamescore))
	{
		attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
		self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperheadshot);
		}
	}
}

/*
	Name: function_e596b745
	Namespace: fireteam
	Checksum: 0x74AEA4CE
	Offset: 0x840
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_e596b745(var_c1e98979)
{
	var_1e866967 = spawnstruct();
	var_1e866967.remainingtime = max(0, globallogic_utils::gettimeremaining());
	switch(var_c1e98979)
	{
		case 2:
		{
			var_1e866967.wintype = "time_limit_reached";
			break;
		}
		case 3:
		{
			var_1e866967.wintype = "score_limit_reached";
			break;
		}
		case 9:
		case 10:
		default:
		{
			var_1e866967.wintype = "NA";
			break;
		}
	}
	bb::function_bf5cad4e(var_1e866967);
}

/*
	Name: function_f9df98d3
	Namespace: fireteam
	Checksum: 0xB6A2667E
	Offset: 0x950
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function function_f9df98d3(type, value)
{
	if(type === #"ekia")
	{
		return value + level.var_49a15413;
	}
	return value;
}

