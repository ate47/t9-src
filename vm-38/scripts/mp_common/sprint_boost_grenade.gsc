#using scripts\core_common\player\player_stats.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace sprint_boost_grenade;

/*
	Name: function_d9b29e8d
	Namespace: sprint_boost_grenade
	Checksum: 0xF221C878
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d9b29e8d()
{
	level notify(1319833831);
}

/*
	Name: __init__system__
	Namespace: sprint_boost_grenade
	Checksum: 0xA1BDEA9E
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"sprint_boost_grenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: sprint_boost_grenade
	Checksum: 0x9B6635BD
	Offset: 0xF0
	Size: 0x8C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level._effect[#"satchel_charge_enemy_light"] = #"weapon/fx_c4_light_orng";
	level._effect[#"satchel_charge_friendly_light"] = #"weapon/fx_c4_light_blue";
	weaponobjects::function_e6400478(#"sprint_boost_grenade", &create_grenade_watcher, 1);
}

/*
	Name: create_grenade_watcher
	Namespace: sprint_boost_grenade
	Checksum: 0xED46A578
	Offset: 0x188
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function create_grenade_watcher(watcher)
{
	watcher.watchforfire = 1;
	watcher.hackable = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.onspawn = &grenade_spawn;
}

/*
	Name: grenade_spawn
	Namespace: sprint_boost_grenade
	Checksum: 0xF24875AD
	Offset: 0x1F0
	Size: 0x194
	Parameters: 2
	Flags: None
*/
function grenade_spawn(watcher, owner)
{
	self endon(#"grenade_timeout");
	self thread grenade_timeout(10);
	self thread weaponobjects::onspawnuseweaponobject(watcher, owner);
	radius = self.weapon.sprintboostradius;
	duration = self.weapon.sprintboostduration;
	if(!is_true(self.previouslyhacked))
	{
		if(isdefined(owner))
		{
			owner stats::function_e24eec31(self.weapon, #"used", 1);
			origin = owner.origin;
		}
		boost_on_throw = 1;
		detonated = 0;
		if(!boost_on_throw)
		{
			waitresult = undefined;
			waitresult = self waittill(#"explode");
			detonated = 1;
		}
		level thread apply_sprint_boost_to_players(owner, waitresult.position, radius, duration);
		if(!detonated)
		{
			self detonate(owner);
		}
	}
}

/*
	Name: grenade_timeout
	Namespace: sprint_boost_grenade
	Checksum: 0x870CC94A
	Offset: 0x390
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function grenade_timeout(timeout)
{
	self endon(#"death");
	frames = int(timeout / (float(function_60d95f53()) / 1000));
	waitframe(frames);
	self notify(#"grenade_timeout");
}

/*
	Name: apply_sprint_boost_to_players
	Namespace: sprint_boost_grenade
	Checksum: 0x4FA8D011
	Offset: 0x420
	Size: 0x168
	Parameters: 4
	Flags: None
*/
function apply_sprint_boost_to_players(owner, origin, radius, duration)
{
	if(!isdefined(owner))
	{
		return;
	}
	if(!isdefined(owner.team))
	{
		return;
	}
	if(!isdefined(origin))
	{
		return;
	}
	radiussq = sqr((isdefined(radius) ? radius : 150));
	foreach(player in level.players)
	{
		if(!isplayer(player))
		{
			continue;
		}
		if(util::function_fbce7263(player.team, owner.team))
		{
			continue;
		}
		if(distancesquared(player.origin, origin) > radiussq)
		{
			continue;
		}
		player thread apply_sprint_boost(duration);
	}
}

/*
	Name: apply_sprint_boost
	Namespace: sprint_boost_grenade
	Checksum: 0x6EC15ECE
	Offset: 0x590
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function apply_sprint_boost(duration)
{
	player = self;
	player endon(#"death", #"disconnect");
	player notify(#"apply_sprint_boost_singleton");
	player endon(#"apply_sprint_boost_singleton");
	player setsprintboost(1);
	duration = math::clamp((isdefined(duration) ? duration : 10), 1, 1200);
	frames_to_wait = int(duration / (float(function_60d95f53()) / 1000));
	waitframe(frames_to_wait);
	player setsprintboost(0);
}

