#using script_1cc417743d7c262d;
#using script_2c49ae69cd8ce30c;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using script_47fb62300ac0bd60;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\hostmigration.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\util.gsc;

#namespace conf;

/*
	Name: main
	Namespace: conf
	Checksum: 0x452A8D7C
	Offset: 0xF8
	Size: 0x114
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	spawning::addsupportedspawnpointtype("tdm");
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	player::function_cf3aa03d(&onplayerkilled);
	level.teamscoreperkillconfirmed = getgametypesetting(#"teamscoreperkillconfirmed");
	level.teamscoreperkilldenied = getgametypesetting(#"teamscoreperkilldenied");
}

/*
	Name: onstartgametype
	Namespace: conf
	Checksum: 0x57DA0FD0
	Offset: 0x218
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	dogtags::init();
	if(!util::isoneround())
	{
		level.displayroundendtext = 1;
	}
}

/*
	Name: onplayerkilled
	Namespace: conf
	Checksum: 0xB5B381C7
	Offset: 0x258
	Size: 0x10C
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isplayer(psoffsettime) || psoffsettime.team == self.team)
	{
		return;
	}
	level thread dogtags::spawn_dog_tag(self, psoffsettime, &onuse, 0);
	if(!isdefined(killstreaks::get_killstreak_for_weapon(deathanimduration)) || is_true(level.killstreaksgivegamescore))
	{
		psoffsettime globallogic_score::giveteamscoreforobjective(psoffsettime.team, level.teamscoreperkill);
	}
}

/*
	Name: onuse
	Namespace: conf
	Checksum: 0x68026456
	Offset: 0x370
	Size: 0x282
	Parameters: 1
	Flags: None
*/
function onuse(player)
{
	tacinsertboost = 0;
	player.pers[#"objectives"]++;
	player.objectives = player.pers[#"objectives"];
	if(player.team != self.attackerteam)
	{
		tacinsertboost = self.tacinsert;
		if(isdefined(self.attacker) && self.attacker.team == self.attackerteam)
		{
			self.attacker luinotifyevent(#"player_callout", 2, #"hash_2645b0c08b8b19b9", player.entnum);
		}
		if(!tacinsertboost)
		{
			player globallogic_score::giveteamscoreforobjective(player.team, level.teamscoreperkilldenied);
		}
	}
	else
	{
		/#
			assert(isdefined(player.lastkillconfirmedtime));
			assert(isdefined(player.lastkillconfirmedcount));
		#/
		/#
		#/
		/#
		#/
		player.pers[#"killsconfirmed"]++;
		player.killsconfirmed = player.pers[#"killsconfirmed"];
		player globallogic_score::giveteamscoreforobjective(player.team, level.teamscoreperkillconfirmed);
		if(!tacinsertboost)
		{
			currenttime = gettime();
			if(player.lastkillconfirmedtime + 4000 > currenttime)
			{
				player.lastkillconfirmedcount++;
				if(player.lastkillconfirmedcount >= 3)
				{
					scoreevents::processscoreevent(#"kill_confirmed_multi", player, undefined, undefined);
					player stats::function_cc215323(#"hash_1b563e11d9caca7e", 1);
					player.lastkillconfirmedcount = 0;
				}
			}
			else
			{
				player.lastkillconfirmedcount = 1;
			}
			player.lastkillconfirmedtime = currenttime;
		}
	}
}

/*
	Name: onspawnplayer
	Namespace: conf
	Checksum: 0x846ADEF2
	Offset: 0x600
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	self.usingobj = undefined;
	if(spawning::usestartspawns() && !level.ingraceperiod)
	{
		spawning::function_7a87efaa();
	}
	self.lastkillconfirmedtime = 0;
	self.lastkillconfirmedcount = 0;
	spawning::onspawnplayer(predictedspawn);
	dogtags::on_spawn_player();
}

