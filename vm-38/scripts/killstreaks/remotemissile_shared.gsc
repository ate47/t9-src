#using script_342e0d1a78771d3f;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using script_396f7d71538c9677;
#using script_4721de209091b1a6;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using script_5afbda9de6000ad9;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace remotemissile_shared;

/*
	Name: function_88b7fbf0
	Namespace: remotemissile_shared
	Checksum: 0x906A998F
	Offset: 0x560
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_88b7fbf0()
{
	level notify(454897496);
}

#namespace remotemissile;

/*
	Name: init_shared
	Namespace: remotemissile
	Checksum: 0x67F9A9C3
	Offset: 0x580
	Size: 0x3F4
	Parameters: 2
	Flags: Linked
*/
function init_shared(bundlename, var_bbc86faf)
{
	if(!is_true(level.var_e3049e92) && !isdefined(level.remotemissile_shared))
	{
		level.remotemissile_shared = {};
		airsupport::init_shared();
		level.rockets = [];
		killstreak_detect::init_shared();
		/#
			assert(!isdefined(var_bbc86faf) || isfunctionptr(var_bbc86faf));
		#/
		if(!isdefined(bundlename))
		{
			bundlename = "killstreak_remote_missile";
		}
		bundle = getscriptbundle(bundlename);
		killstreaks::register_bundle(bundle, (isdefined(var_bbc86faf) ? var_bbc86faf : &tryusepredatormissile));
		killstreaks::function_1e016087("remote_missile", &function_4fc6a285);
		clientfield::register("missile", "remote_missile_brakes", 1, 1, "int");
		clientfield::register("missile", "remote_missile_bomblet_fired", 1, 1, "int");
		clientfield::register("missile", "remote_missile_fired", 1, 2, "int");
		clientfield::register("missile", "remote_missile_phase2", 1, 1, "int");
		clientfield::register("toplayer", "remote_missile_piloting", 1, 1, "int");
		clientfield::register_clientuimodel("hudItems.remoteMissilePhase2", 1, 1, "int");
		clientfield::register("scriptmover", "hellstorm_camera", 1, 1, "int");
		clientfield::register("scriptmover", "hellstorm_deploy", 1, 1, "int");
		clientfield::register("scriptmover", "remote_missile_child_rocket_fx", 1, 1, "int");
		level.missilesforsighttraces = [];
		level.missileremotelaunchvert = 12000;
		level.missileremotelaunchhorz = 7000;
		level.missileremotelaunchtargetdist = 1500;
		level.remote_missile_targets = remote_missile_targets::register();
		level.var_aac98621 = [];
		for(var_3eaf95a4 = 0; var_3eaf95a4 < 2; var_3eaf95a4++)
		{
			level.var_aac98621[var_3eaf95a4] = remote_missile_target_lockon::register();
		}
		callback::on_spawned(&on_player_spawned);
		callback::on_laststand(&on_player_laststand);
		callback::on_finalize_initialization(&function_3675de8b);
	}
}

/*
	Name: function_3675de8b
	Namespace: remotemissile
	Checksum: 0xB3CD6322
	Offset: 0x980
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function function_3675de8b()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon("remote_missile"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: remotemissile
	Checksum: 0x29712A00
	Offset: 0x9D0
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(remotemissile, attackingplayer)
{
	remotemissile dodamage(1000, remotemissile.origin, attackingplayer);
	if(isdefined(remotemissile.bomblets))
	{
		foreach(bomblet in remotemissile.bomblets)
		{
			if(!isdefined(bomblet))
			{
				continue;
			}
			bomblet detonate();
			bomblet notify(#"bombletdestroyed");
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: remotemissile
	Checksum: 0xBB9B205F
	Offset: 0xAD0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self.var_f85f9b4d = undefined;
	self destroy_missile_hud();
}

/*
	Name: on_player_laststand
	Namespace: remotemissile
	Checksum: 0xB31F0C55
	Offset: 0xB00
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_player_laststand()
{
	self.var_f85f9b4d = undefined;
}

/*
	Name: function_4fc6a285
	Namespace: remotemissile
	Checksum: 0x7577593B
	Offset: 0xB18
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_4fc6a285(params)
{
	self thread function_497d916d(params);
}

/*
	Name: function_497d916d
	Namespace: remotemissile
	Checksum: 0x9E4F7BFC
	Offset: 0xB48
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_497d916d(params)
{
	if(!isdefined(params.killstreak_id))
	{
		return;
	}
	var_17b7891d = "278ccfb410ce2979" + params.killstreak_id;
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	wait(1);
	killstreaks::function_79e49b15(params);
}

/*
	Name: tryusepredatormissile
	Namespace: remotemissile
	Checksum: 0x6B626DF8
	Offset: 0xBD0
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function tryusepredatormissile(killstreaktype)
{
	waterdepth = self depthofplayerinwater();
	if(!self isonground() || self util::isusingremote() || waterdepth > 2)
	{
		self iprintlnbold(#"hash_3f750164757cd400");
		return 0;
	}
	team = self.team;
	killstreak_id = self killstreakrules::killstreakstart(killstreaktype, team, 0, 1);
	if(killstreak_id == -1)
	{
		return 0;
	}
	self.remotemissilepilotindex = namespace_f9b02f80::get_random_pilot_index("remote_missile");
	returnvar = _fire(killstreaktype, self, team, killstreak_id);
	return returnvar;
}

/*
	Name: function_203098f4
	Namespace: remotemissile
	Checksum: 0x484CF982
	Offset: 0xD18
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_203098f4(waittime)
{
	self endon(#"disconnect");
	wait(waittime);
	lui::screen_fade_in(0.1);
}

/*
	Name: _fire
	Namespace: remotemissile
	Checksum: 0xC69CFD5C
	Offset: 0xD60
	Size: 0x1428
	Parameters: 4
	Flags: Linked
*/
function _fire(killstreaktype, player, team, killstreak_id)
{
	player notify(#"remote_missile_fired");
	bundle = killstreaks::get_script_bundle("remote_missile");
	weapon = bundle.ksweapon;
	missileweapon = getweapon(#"remote_missile_missile");
	streamermodelhint(weapon.var_22082a57, 7);
	streamermodelhint(missileweapon.projectilemodel, 7);
	player forcestreambundle(#"hash_76778620dcab91dd");
	player setmodellodbias((isdefined(level.remotemissile_lod_bias) ? level.remotemissile_lod_bias : 12));
	remotemissilespawnarray = getentarray("remoteMissileSpawn", "targetname");
	foreach(spawn in remotemissilespawnarray)
	{
		if(isdefined(spawn.target))
		{
			spawn.targetent = getent(spawn.target, "targetname");
		}
	}
	if(remotemissilespawnarray.size > 0)
	{
		remotemissilespawn = player get_best_spawn_point(remotemissilespawnarray);
	}
	else
	{
		remotemissilespawn = undefined;
	}
	if(isdefined(remotemissilespawn))
	{
		startpos = remotemissilespawn.origin;
		targetpos = level.mapcenter;
		/#
		#/
		vector = vectornormalize(startpos - targetpos);
		startpos = (vector * level.missileremotelaunchvert) + targetpos;
	}
	else
	{
		upvector = (0, 0, level.missileremotelaunchvert);
		backdist = level.missileremotelaunchhorz;
		targetdist = level.missileremotelaunchtargetdist;
		if(isdefined(level.var_eb6a7fa3))
		{
			angles = level.var_eb6a7fa3;
		}
		else
		{
			angles = player.angles;
		}
		if(isdefined(level.var_2743a7e2))
		{
			origin = level.var_2743a7e2;
		}
		else
		{
			origin = player.origin;
		}
		forward = anglestoforward(angles);
		startpos = (origin + upvector) + ((forward * backdist) * -1);
		targetpos = origin + (forward * targetdist);
	}
	if(isdefined(level.var_eb6a7fa3))
	{
		var_77689551 = startpos;
	}
	else
	{
		offset = level.var_46c23c0f * 200;
		level.var_46c23c0f++;
		if(level.var_46c23c0f > 3)
		{
			level.var_46c23c0f = 0;
		}
		loc_00001216:
		loc_0000123E:
		var_77689551 = ((targetpos[0] + (isdefined(level.var_5d4b4923) ? level.var_5d4b4923 : 0)) + offset, (targetpos[1] + (isdefined(level.var_462a6e1e) ? level.var_462a6e1e : 0)) + offset, startpos[2] + (isdefined(level.var_654c4b25) ? level.var_654c4b25 : 0));
	}
	if(!getdvarint(#"hash_6e8eff11c6fb1621", 0))
	{
		if(offset == 0)
		{
			var_8044a08f = var_77689551 - startpos;
		}
		else
		{
			var_8044a08f = targetpos - var_77689551;
		}
		var_8044a08f = vectornormalize((var_8044a08f[0], var_8044a08f[1], 0));
		var_b5c6bf5f = vectortoangles(var_8044a08f);
		startpos = var_77689551 - vectorscale(var_8044a08f, 5000);
		veh = spawn("script_model", startpos);
		veh.angles = var_b5c6bf5f;
		veh ghost();
		veh setmodel(weapon.var_22082a57);
		veh setenemymodel(weapon.stowedmodel);
		veh setforcenocull();
	}
	self util::setusingremote("remote_missile");
	self val::set(#"remote_missile_fire", "freezecontrols");
	player disableweaponcycling();
	result = self killstreaks::init_ride_killstreak("remote_missile");
	if(result != "success" || level.gameended)
	{
		if(result != "disconnect")
		{
			player val::reset(#"remote_missile_fire", "freezecontrols");
			player killstreaks::clear_using_remote();
			player killstreaks::thermal_glow(0);
			player enableweaponcycling();
			killstreakrules::killstreakstop(killstreaktype, team, killstreak_id, 0);
		}
		if(isdefined(veh))
		{
			veh delete();
		}
		return false;
	}
	if(isdefined(player))
	{
		player callback::callback(#"hash_247d67dbf83dbc1a");
	}
	self namespace_f9b02f80::play_pilot_dialog("arrive", "remote_missile", killstreak_id, self.remotemissilepilotindex);
	self namespace_f9b02f80::play_killstreak_start_dialog("remote_missile", team, killstreak_id);
	if(!getdvarint(#"hash_6e8eff11c6fb1621", 0))
	{
		veh show();
		veh.weapon = weapon;
		veh setweapon(weapon);
		veh.owner = player;
		veh setowner(player);
		/#
			recordent(veh);
		#/
		veh playsound("veh_hellstorm_dropship_boom");
		veh playloopsound("veh_hellstorm_dropship_base");
		var_52df21ae = veh gettagorigin("tag_camera");
		cam = spawn("script_model", var_52df21ae);
		cam.angles = veh.angles;
		cam setmodel(#"tag_origin");
		cam linkto(veh, "tag_camera");
		cam setowner(player);
		cam clientfield::set("hellstorm_camera", 1);
		player clientfield::set("remote_killstreak_static", 1);
		veh moveto(var_77689551, 2.5);
		player val::set(#"hellstorm_intro", "show_hud", 0);
		player camerasetposition(cam.origin);
		player camerasetlookat(cam.angles);
		player cameraactivate(1);
		while(is_true(level.var_e891c5ba))
		{
			waitframe(1);
		}
		veh clientfield::set("hellstorm_deploy", 1);
		veh useanimtree("generic");
		veh setanim(#"hash_21fa3a72d877f87a", 1);
		if(isdefined(level.var_5951cb24))
		{
			self [[level.var_5951cb24]](killstreak_id, team);
		}
		player playsoundtoplayer(#"hash_1f70287e92a32746", player);
		animlen = getanimlength(#"hash_21fa3a72d877f87a");
		wait(animlen - 0.5);
		if(!isdefined(player))
		{
			return false;
		}
	}
	player clientfield::set_to_player("remote_missile_piloting", 1);
	wait(0.5);
	if(!isdefined(player))
	{
		return false;
	}
	player function_66b6e720(#"hash_76778620dcab91dd");
	if(isdefined(cam))
	{
		startpos = cam.origin - vectorscale((0, 0, 1), 100);
	}
	else
	{
		startpos = var_77689551;
	}
	missileweapon = getweapon(#"remote_missile_missile");
	rocket = magicbullet(missileweapon, startpos, targetpos, player);
	rocket.forceonemissile = 1;
	forceanglevector = vectornormalize(targetpos - startpos);
	rocket.angles = vectortoangles(forceanglevector);
	rocket missile_settarget(undefined);
	var_36c78ec = (-70, 100, 0);
	var_f5a6dd61 = (-70, -100, 0);
	rocket.rocket1 = spawn("script_model", startpos);
	rocket.rocket1 setmodel(missileweapon.projectilemodel);
	rocket.rocket1 clientfield::set("remote_missile_child_rocket_fx", 1);
	rocket.rocket2 = spawn("script_model", startpos);
	rocket.rocket2 setmodel(missileweapon.projectilemodel);
	rocket.rocket2 clientfield::set("remote_missile_child_rocket_fx", 1);
	rocket.rocket1 linkto(rocket, "tag_origin", var_36c78ec);
	rocket.rocket2 linkto(rocket, "tag_origin", var_f5a6dd61);
	rocket.targetname = "remote_missile";
	rocket killstreaks::configure_team(killstreaktype, killstreak_id, self, undefined, undefined, undefined);
	rocket killstreak_hacking::enable_hacking("remote_missile", undefined, &hackedpostfunction);
	killstreak_detect::killstreaktargetset(rocket);
	rocket.hackedhealthupdatecallback = &hackedhealthupdate;
	rocket clientfield::set("enemyvehicle", 1);
	rocket clientfield::set("remote_missile_phase2", 0);
	rocket.identifier_weapon = getweapon("remote_missile");
	if(!isdefined(rocket.bomblets))
	{
		rocket.bomblets = [];
	}
	player clientfield::set_player_uimodel("hudItems.remoteMissilePhase2", 0);
	self clientfield::set_player_uimodel("vehicle.vehicleAttackMode", 0);
	player killstreaks::thermal_glow(1);
	rocket.killstreak_id = killstreak_id;
	rocket killstreaks::function_2b6aa9e8("remote_missile", &function_b4f589cc);
	rocket.var_48d842c3 = 1;
	player unlink();
	player linktomissile(rocket, 1, 1);
	player.rocket = rocket;
	rocket.owner = player;
	rocket.killcament = player;
	player val::reset(#"hellstorm_intro", "show_hud");
	if(isdefined(cam))
	{
		cam clientfield::set("hellstorm_camera", 0);
	}
	if(isdefined(veh))
	{
		veh clientfield::set("hellstorm_deploy", 0);
	}
	waitframe(1);
	if(!isdefined(player))
	{
		waitframe(1);
		if(isdefined(rocket))
		{
			rocket notify(#"death");
			rocket deletedelay();
		}
		if(isdefined(veh))
		{
			veh delete();
		}
		return false;
	}
	if(isdefined(cam))
	{
		cam delete();
	}
	player cameraactivate(0);
	player thread cleanupwaiter(rocket, player.team, killstreak_id, killstreaktype);
	self clientfield::set("operating_predator", 1);
	self stats::function_e24eec31(getweapon(#"remote_missile"), #"used", 1);
	player.var_a8c5fe4e = 1;
	player val::reset(#"remote_missile_fire", "freezecontrols");
	player thread create_missile_hud(rocket);
	rocket thread function_9761dd1d();
	if(isdefined(veh))
	{
		var_57243a4b = veh.origin;
	}
	else
	{
		var_57243a4b = var_77689551;
	}
	rocket function_17485b5(var_57243a4b, 0, 0);
	if(isdefined(veh))
	{
		veh unlink();
		fwd = anglestoforward(veh.angles);
		endpos = veh.origin + vectorscale(fwd, 20000);
		time = 5;
		veh moveto(endpos, time);
		veh thread waitthendelete(time);
	}
	rocket thread watch_missile_kill_z();
	rocket missile_sound_play(player);
	rocket playsound("wpn_remote_missile_launch_npc");
	rocket thread missile_brake_timeout_watch();
	rocket thread missile_sound_impact(player, 3800);
	player thread missile_sound_boost(rocket);
	player thread function_8fba4483(rocket);
	player thread remote_missile_game_end_think(rocket, player.team, killstreak_id, killstreaktype);
	player thread watch_missile_death(rocket, player.team, killstreak_id, killstreaktype);
	player thread sndwatchexplo();
	rocket influencers::create_entity_enemy_influencer("small_vehicle", rocket.team);
	player waittill(#"remotemissle_killstreak_done");
	return true;
}

/*
	Name: remote_missile_game_end_think
	Namespace: remotemissile
	Checksum: 0xD48D55A9
	Offset: 0x2190
	Size: 0x96
	Parameters: 4
	Flags: Linked
*/
function remote_missile_game_end_think(rocket, team, killstreak_id, killstreaktype)
{
	self endon(#"remotemissle_killstreak_done");
	level waittill(#"game_ended", #"pre_potm");
	self thread function_97f822ec(rocket, 1, 1, team, killstreak_id, killstreaktype);
	self notify(#"remotemissle_killstreak_done");
}

/*
	Name: get_best_spawn_point
	Namespace: remotemissile
	Checksum: 0x77840883
	Offset: 0x2230
	Size: 0x40A
	Parameters: 1
	Flags: Linked
*/
function get_best_spawn_point(remotemissilespawnpoints)
{
	validenemies = [];
	foreach(spawnpoint in remotemissilespawnpoints)
	{
		spawnpoint.validplayers = [];
		spawnpoint.spawnscore = 0;
	}
	foreach(player in level.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(!player util::isenemyteam(self.team))
		{
			continue;
		}
		if(player.team == #"spectator")
		{
			continue;
		}
		bestdistance = 999999999;
		bestspawnpoint = undefined;
		foreach(spawnpoint in remotemissilespawnpoints)
		{
			spawnpoint.validplayers[spawnpoint.validplayers.size] = player;
			potentialbestdistance = distance2dsquared(spawnpoint.targetent.origin, player.origin);
			if(potentialbestdistance <= bestdistance)
			{
				bestdistance = potentialbestdistance;
				bestspawnpoint = spawnpoint;
			}
		}
		bestspawnpoint.spawnscore = bestspawnpoint.spawnscore + 2;
	}
	bestspawn = remotemissilespawnpoints[0];
	foreach(spawnpoint in remotemissilespawnpoints)
	{
		foreach(player in spawnpoint.validplayers)
		{
			spawnpoint.spawnscore = spawnpoint.spawnscore + 1;
			if(bullettracepassed(player.origin + vectorscale((0, 0, 1), 32), spawnpoint.origin, 0, player))
			{
				spawnpoint.spawnscore = spawnpoint.spawnscore + 3;
			}
			if(spawnpoint.spawnscore > bestspawn.spawnscore)
			{
				bestspawn = spawnpoint;
				continue;
			}
			if(spawnpoint.spawnscore == bestspawn.spawnscore)
			{
				if(math::cointoss())
				{
					bestspawn = spawnpoint;
				}
			}
		}
	}
	return bestspawn;
}

/*
	Name: function_9761dd1d
	Namespace: remotemissile
	Checksum: 0xC1F8EF21
	Offset: 0x2648
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_9761dd1d()
{
	self endon(#"death");
	wait(0.1);
	self clientfield::set("remote_missile_fired", 1);
}

/*
	Name: watch_missile_kill_z
	Namespace: remotemissile
	Checksum: 0xE4DE2A86
	Offset: 0x2698
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function watch_missile_kill_z()
{
	if(!isdefined(level.remotemissile_kill_z))
	{
		return;
	}
	rocket = self;
	kill_z = level.remotemissile_kill_z;
	rocket endon(#"remotemissle_killstreak_done", #"death");
	while(rocket.origin[2] > kill_z)
	{
		wait(0.1);
	}
	rocket detonate();
}

/*
	Name: watch_missile_death
	Namespace: remotemissile
	Checksum: 0x86203DC9
	Offset: 0x2740
	Size: 0x146
	Parameters: 4
	Flags: Linked
*/
function watch_missile_death(rocket, team, killstreak_id, killstreaktype)
{
	self endon(#"remotemissle_killstreak_done");
	r1 = rocket.rocket1;
	r2 = rocket.rocket2;
	rocket waittill(#"death");
	if(isdefined(r1))
	{
		r1 deletedelay();
		if(isdefined(rocket.rocket1))
		{
			rocket.rocket1 = undefined;
		}
	}
	if(isdefined(r2))
	{
		r2 deletedelay();
		if(isdefined(rocket.rocket2))
		{
			rocket.rocket2 = undefined;
		}
	}
	if(isdefined(self))
	{
		self thread function_97f822ec(rocket, 1, 1, team, killstreak_id, killstreaktype);
		self thread remotemissile_bda_dialog();
		self notify(#"remotemissle_killstreak_done");
	}
}

/*
	Name: hackedhealthupdate
	Namespace: remotemissile
	Checksum: 0x2C8B19F4
	Offset: 0x2890
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function hackedhealthupdate(hacker)
{
}

/*
	Name: hackedpostfunction
	Namespace: remotemissile
	Checksum: 0x65938496
	Offset: 0x28A8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function hackedpostfunction(hacker)
{
	rocket = self;
	hacker missile_deploy(rocket, 1);
}

/*
	Name: rotaterig
	Namespace: remotemissile
	Checksum: 0x7F7A99D5
	Offset: 0x28E8
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function rotaterig()
{
	for(;;)
	{
		self rotateyaw(-360, 60);
		wait(60);
	}
}

/*
	Name: swayrig
	Namespace: remotemissile
	Checksum: 0x7D060771
	Offset: 0x2920
	Size: 0x10E
	Parameters: 0
	Flags: None
*/
function swayrig()
{
	centerorigin = self.origin;
	for(;;)
	{
		z = randomintrange(-200, -100);
		time = randomintrange(3, 6);
		self moveto(centerorigin + (0, 0, z), time, 1, 1);
		wait(time);
		z = randomintrange(100, 200);
		time = randomintrange(3, 6);
		self moveto(centerorigin + (0, 0, z), time, 1, 1);
		wait(time);
	}
}

/*
	Name: waitthendelete
	Namespace: remotemissile
	Checksum: 0x3265A2CD
	Offset: 0x2A38
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function waitthendelete(waittime)
{
	self endon(#"delete", #"death");
	wait(waittime);
	self delete();
}

/*
	Name: function_71f4cd34
	Namespace: remotemissile
	Checksum: 0x9CDAE01
	Offset: 0x2A90
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function function_71f4cd34()
{
	rocket = self;
	var_d0c52d0b = getweapon(#"hash_33be4792feeabece");
	var_a70219cf = magicbullet(var_d0c52d0b, rocket.origin, rocket.origin + (anglestoforward(rocket.angles) * 1000), rocket.owner);
}

/*
	Name: function_17485b5
	Namespace: remotemissile
	Checksum: 0x17B9F55E
	Offset: 0x2B30
	Size: 0x280
	Parameters: 3
	Flags: Linked
*/
function function_17485b5(position, var_7e0e1fa6, var_3d0e8f5b)
{
	rocket = self;
	rocket.descend = 0;
	starttime = gettime();
	fire_time = 0;
	missiles_fired = 0;
	var_ecf86986 = 0;
	if(var_7e0e1fa6 > 0)
	{
		time_threshold = var_7e0e1fa6;
		var_facd4b29 = 0;
		while(isdefined(rocket))
		{
			if(isdefined(rocket.owner) && rocket.owner attackbuttonpressed() && rocket.owner killstreaks::function_59e2c378())
			{
				if(!is_true(var_facd4b29))
				{
					if(missiles_fired < var_ecf86986)
					{
						rocket function_71f4cd34();
						missiles_fired++;
					}
					else
					{
						break;
					}
				}
				if(missiles_fired == var_ecf86986)
				{
					fire_time = gettime();
				}
				var_facd4b29 = 1;
			}
			else
			{
				var_facd4b29 = 0;
			}
			rocket.origin = position;
			elapsedtime = gettime() - starttime;
			if(elapsedtime > time_threshold * 1000)
			{
				break;
			}
			if(fire_time > 0)
			{
				elapsedtime = gettime() - fire_time;
				if(elapsedtime > var_3d0e8f5b * 1000)
				{
					break;
				}
			}
			waitframe(1);
		}
	}
	rocket clientfield::set("remote_missile_phase2", 1);
	rocket.owner clientfield::set_player_uimodel("hudItems.remoteMissilePhase2", 1);
	rocket.owner clientfield::set_player_uimodel("vehicle.vehicleAttackMode", 1);
	earthquake(0.5, 2, rocket.origin, 200);
	rocket.descend = 1;
	rocket.var_b5bcdb0c = gettime();
	if(isdefined(level.var_dab39bb8))
	{
		self thread [[level.var_dab39bb8]](rocket);
	}
}

/*
	Name: function_97f822ec
	Namespace: remotemissile
	Checksum: 0xA5FBD488
	Offset: 0x2DB8
	Size: 0x30C
	Parameters: 6
	Flags: Linked
*/
function function_97f822ec(rocket, performplayerkillstreakend, unlink, team, killstreak_id, killstreaktype)
{
	self notify(#"player_missile_end_singleton");
	self endon(#"player_missile_end_singleton");
	if(isdefined(rocket))
	{
		rocket influencers::remove_influencers();
		rocket clientfield::set("remote_missile_fired", 0);
		rocket deletedelay();
		if(isdefined(rocket.rocket1))
		{
			rocket.rocket1 deletedelay();
			rocket.rocket1 = undefined;
		}
		if(isdefined(rocket.rocket2))
		{
			rocket.rocket2 deletedelay();
			rocket.rocket2 = undefined;
		}
	}
	self notify(#"snd1stpersonexplo");
	if(isdefined(self))
	{
		self thread destroy_missile_hud();
		self clientfield::set_to_player("remote_missile_piloting", 0);
		self clientfield::set("remote_killstreak_static", 0);
		if(is_true(performplayerkillstreakend))
		{
			self playrumbleonentity("killstreak_remote_missile_impact_1p");
			if(level.gameended == 0)
			{
				self sendkillstreakdamageevent(600);
			}
			if(isdefined(rocket))
			{
				rocket hide();
			}
		}
		self clientfield::set("operating_predator", 0);
		self setmodellodbias(0);
		if(unlink)
		{
			self unlinkfrommissile();
		}
		self notify(#"remotemissile_done");
		self val::reset(#"remote_missile_fire", "freezecontrols");
		self killstreaks::clear_using_remote();
		self killstreaks::thermal_glow(0);
		self enableweaponcycling();
		killstreakrules::killstreakstop(killstreaktype, team, killstreak_id);
		self callback::callback(#"hash_72a7670db71677f");
	}
}

/*
	Name: missile_brake_timeout_watch
	Namespace: remotemissile
	Checksum: 0xF3A40133
	Offset: 0x30D0
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function missile_brake_timeout_watch()
{
	rocket = self;
	player = rocket.owner;
	self endon(#"death");
	self waittill(#"missile_brake");
	rocket clientfield::set("remote_missile_brakes", 1);
	rocket playsound(#"wpn_remote_missile_brake_npc");
	player playlocalsound(#"wpn_remote_missile_brake_plr");
	wait(1.5);
	if(isdefined(self))
	{
		rocket clientfield::set("remote_missile_brakes", 0);
		self setmissilebrake(0);
	}
}

/*
	Name: stopondeath
	Namespace: remotemissile
	Checksum: 0x26DF544B
	Offset: 0x31D0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function stopondeath(snd)
{
	self waittill(#"death");
	if(isdefined(snd))
	{
		snd deletedelay();
	}
}

/*
	Name: cleanupwaiter
	Namespace: remotemissile
	Checksum: 0x7F68EA
	Offset: 0x3218
	Size: 0x9E
	Parameters: 4
	Flags: Linked
*/
function cleanupwaiter(rocket, team, killstreak_id, killstreaktype)
{
	self endon(#"remotemissle_killstreak_done");
	self waittill(#"joined_team", #"joined_spectators", #"disconnect");
	self thread function_97f822ec(rocket, 0, 0, team, killstreak_id, killstreaktype);
	self notify(#"remotemissle_killstreak_done");
}

/*
	Name: function_b4f589cc
	Namespace: remotemissile
	Checksum: 0x535E7C9D
	Offset: 0x32C0
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_b4f589cc(attacker, weapon)
{
	if(self.owner util::isenemyplayer(attacker))
	{
		challenges::destroyedaircraft(attacker, weapon, 1, self, 1);
		attacker challenges::addflyswatterstat(weapon, self);
		attacker stats::function_e24eec31(weapon, #"destroyed_controlled_killstreak", 1);
		self namespace_f9b02f80::play_destroyed_dialog_on_owner("remote_missile", self.killstreak_id);
		if(isdefined(level.var_feddd85a))
		{
			self.owner [[level.var_feddd85a]](attacker, weapon);
		}
	}
	self influencers::remove_influencers();
	self detonate();
}

/*
	Name: rocket_cleanupondeath
	Namespace: remotemissile
	Checksum: 0x4A6FD8E0
	Offset: 0x33D8
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function rocket_cleanupondeath()
{
	entitynumber = self getentitynumber();
	level.rockets[entitynumber] = self;
	self waittill(#"death");
	level.rockets[entitynumber] = undefined;
}

/*
	Name: missile_sound_play
	Namespace: remotemissile
	Checksum: 0xAB7DCDC1
	Offset: 0x3438
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function missile_sound_play(player)
{
	self.snd_first = spawn("script_model", self.origin);
	self.snd_first setmodel(#"tag_origin");
	self.snd_first linkto(self);
	self.snd_first setinvisibletoall();
	self.snd_first setvisibletoplayer(player);
	player playlocalsound(#"hash_520c69ce78db3657");
	self.snd_first playloopsound(#"wpn_remote_missile_loop_plr", 0.5);
	self thread stopondeath(self.snd_first);
	self.snd_third = spawn("script_model", self.origin);
	self.snd_third setmodel(#"tag_origin");
	self.snd_third linkto(self);
	self.snd_third setvisibletoall();
	self.snd_third setinvisibletoplayer(player);
	self.snd_third playloopsound(#"wpn_remote_missile_loop_npc", 0.2);
	self thread stopondeath(self.snd_third);
}

/*
	Name: missile_sound_boost
	Namespace: remotemissile
	Checksum: 0xA96336CB
	Offset: 0x3640
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function missile_sound_boost(rocket)
{
	self endon(#"remotemissile_done", #"joined_team", #"joined_spectators", #"disconnect");
	self waittill(#"missile_boost");
	if(isdefined(rocket))
	{
		rocket playsound(#"wpn_remote_missile_fire_boost_npc");
		rocket.snd_third playloopsound(#"wpn_remote_missile_boost_npc");
		self playlocalsound(#"wpn_remote_missile_fire_boost_plr");
		rocket.snd_first playloopsound(#"wpn_remote_missile_boost_plr");
		self playrumbleonentity("killstreak_remote_missile_boost_1p");
		if(rocket.origin[2] - self.origin[2] > 4000)
		{
			rocket notify(#"stop_impact_sound");
			rocket thread missile_sound_impact(self, 6300);
		}
	}
}

/*
	Name: missile_sound_impact
	Namespace: remotemissile
	Checksum: 0x9D43A43
	Offset: 0x37C0
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function missile_sound_impact(player, distance)
{
	self endon(#"death", #"stop_impact_sound");
	player endon(#"disconnect", #"remotemissile_done", #"joined_team", #"joined_spectators");
	for(;;)
	{
		if(self.origin[2] - player.origin[2] < distance / 0.525)
		{
			self playsound(#"wpn_remote_missile_inc");
			return;
		}
		waitframe(1);
	}
}

/*
	Name: sndwatchexplo
	Namespace: remotemissile
	Checksum: 0xDB60FA65
	Offset: 0x38A0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function sndwatchexplo()
{
	self endon(#"remotemissle_killstreak_done", #"remotemissile_done", #"joined_team", #"joined_spectators", #"disconnect", #"bomblets_deployed");
	self waittill(#"snd1stpersonexplo");
	self playlocalsound(#"wpn_remote_missile_explode_plr");
}

/*
	Name: missile_sound_deploy_bomblets
	Namespace: remotemissile
	Checksum: 0x677DC242
	Offset: 0x3948
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function missile_sound_deploy_bomblets()
{
	self.snd_first playloopsound(#"wpn_remote_missile_loop_plr", 0.5);
}

/*
	Name: getvalidtargets
	Namespace: remotemissile
	Checksum: 0x6C97C57A
	Offset: 0x3988
	Size: 0x440
	Parameters: 3
	Flags: Linked
*/
function getvalidtargets(rocket, trace, max_targets)
{
	pixbeginevent();
	targets = [];
	if(isdefined(self.missiles_fired) && self.missiles_fired >= 2)
	{
		pixendevent();
		return targets;
	}
	forward = anglestoforward(rocket.angles);
	rocketz = rocket.origin[2];
	mapcenterz = level.mapcenter[2];
	diff = mapcenterz - rocketz;
	ratio = diff / forward[2];
	var_7650a84 = rocket.origin + (forward * ratio);
	rocket.var_7650a84 = var_7650a84;
	pixendevent();
	pixbeginevent();
	var_591b6fbd = 90000;
	campos = self getplayercamerapos();
	enemies = self getenemies();
	foreach(enemy in enemies)
	{
		if(!sessionmodeiszombiesgame())
		{
			if(!isplayer(enemy))
			{
				continue;
			}
			if(enemy hasperk(#"specialty_nokillstreakreticle"))
			{
				continue;
			}
			if(enemy.ignoreme === 1)
			{
				continue;
			}
		}
		if(isdefined(enemy.var_f85f9b4d))
		{
			continue;
		}
		dir = enemy.origin - campos;
		dot = vectordot(dir, forward);
		proj = campos + vectorscale(forward, dot);
		dist2 = distancesquared(enemy.origin, proj);
		tracedistance = min(distance(enemy.origin, campos), 2000);
		traceend = enemy.origin - vectorscale(vectornormalize(dir), tracedistance);
		disablelockon = isplayer(enemy) && enemy hasperk(#"specialty_nokillstreakreticle");
		if(dist2 < var_591b6fbd && !disablelockon)
		{
			entnum = enemy getentitynumber();
			if(trace)
			{
				if(bullettracepassed(enemy.origin + vectorscale((0, 0, 1), 60), traceend, 0, enemy, rocket))
				{
					targets[entnum] = enemy;
				}
			}
			else
			{
				targets[entnum] = enemy;
			}
			if(targets.size >= max_targets)
			{
				pixendevent();
				return targets;
			}
		}
	}
	pixendevent();
	return targets;
}

/*
	Name: gettarget
	Namespace: remotemissile
	Checksum: 0xB4F3CC53
	Offset: 0x3DD0
	Size: 0x39E
	Parameters: 2
	Flags: Linked
*/
function gettarget(rocket, trace)
{
	weapon = getweapon(#"remote_missile");
	settings = getscriptbundle(weapon.customsettings);
	target_radius = (isdefined(settings.target_radius) ? settings.target_radius : 600);
	best_target = undefined;
	best_dist2 = target_radius * target_radius;
	fwd = anglestoforward(rocket.angles);
	campos = self getplayercamerapos();
	enemies = self getenemies();
	foreach(target in enemies)
	{
		if(!sessionmodeiszombiesgame())
		{
			if(!isplayer(target))
			{
				continue;
			}
			if(target hasperk(#"specialty_nokillstreakreticle"))
			{
				continue;
			}
		}
		if(isdefined(target.var_f85f9b4d))
		{
			continue;
		}
		var_4ef4e267 = target getentitynumber();
		var_3eaf95a4 = self.var_ebf52bbc[var_4ef4e267];
		if(!(isdefined(var_3eaf95a4) && self.var_bbe80eed[var_3eaf95a4].state === 1))
		{
			continue;
		}
		dir = target.origin - campos;
		dot = vectordot(dir, fwd);
		proj = campos + vectorscale(fwd, dot);
		dist2 = distancesquared(target.origin, proj);
		tracedistance = min(distance(target.origin, campos), 2000);
		traceend = target.origin - vectorscale(vectornormalize(dir), tracedistance);
		if(dist2 < best_dist2)
		{
			if(trace && !bullettracepassed(target.origin + vectorscale((0, 0, 1), 60), traceend, 0, target, rocket))
			{
				continue;
			}
			best_target = target;
			best_dist2 = dist2;
		}
	}
	return best_target;
}

/*
	Name: create_missile_hud
	Namespace: remotemissile
	Checksum: 0xE8B2272C
	Offset: 0x4178
	Size: 0x1D4
	Parameters: 1
	Flags: Linked
*/
function create_missile_hud(rocket)
{
	player = self;
	if(!level.remote_missile_targets remote_missile_targets::is_open(self))
	{
		level.remote_missile_targets remote_missile_targets::open(self);
	}
	player.var_bbe80eed = [];
	player.var_ebf52bbc = [];
	player_entnum = player getentitynumber();
	for(var_3eaf95a4 = 0; var_3eaf95a4 < 2; var_3eaf95a4++)
	{
		player.var_bbe80eed[var_3eaf95a4] = spawnstruct();
		player.var_bbe80eed[var_3eaf95a4].state = 0;
		uifield = level.var_aac98621[var_3eaf95a4];
		if(!uifield remote_missile_target_lockon::is_open(player))
		{
			uifield remote_missile_target_lockon::open(player, 1);
		}
		uifield remote_missile_target_lockon::set_clientnum(player, player_entnum);
		uifield remote_missile_target_lockon::set_target_locked(player, 0);
		uifield remote_missile_target_lockon::set_isHawkTag(player, 0);
		uifield remote_missile_target_lockon::set_isVehicle(player, 0);
		uifield remote_missile_target_lockon::set_killed(player, 0);
	}
	if(isdefined(rocket))
	{
		rocket.iconindexother = 0;
	}
	self thread targeting_hud_think(rocket);
}

/*
	Name: destroy_missile_hud
	Namespace: remotemissile
	Checksum: 0xBC569FCF
	Offset: 0x4358
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function destroy_missile_hud()
{
	if(level.remote_missile_targets remote_missile_targets::is_open(self))
	{
		level.remote_missile_targets remote_missile_targets::close(self);
	}
	for(var_3eaf95a4 = 0; var_3eaf95a4 < 2; var_3eaf95a4++)
	{
		if(level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::is_open(self))
		{
			level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::close(self);
		}
	}
}

/*
	Name: function_8fba4483
	Namespace: remotemissile
	Checksum: 0x3A495501
	Offset: 0x4418
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_8fba4483(rocket)
{
	self endon(#"disconnect", #"remotemissile_done", #"missile_boost");
	rocket endon(#"death");
	level endon(#"game_ended");
	player = self;
	target = self gettarget(rocket, 1);
	framessincetargetscan = 0;
	self.missiles_fired = 0;
	self clientfield::set_player_uimodel("vehicle.rocketAmmo", 2);
	var_156f45fd = (sessionmodeiszombiesgame() ? 9 : 3);
	while(true)
	{
		framessincetargetscan++;
		if(framessincetargetscan > var_156f45fd)
		{
			target = self gettarget(rocket, 1);
			if(isdefined(target))
			{
				target.var_f85f9b4d = 1;
				player function_2c190692(rocket, target);
				self.missiles_fired++;
				self clientfield::set_player_uimodel("vehicle.rocketAmmo", 2 - self.missiles_fired);
				if(self.missiles_fired >= 2)
				{
					break;
				}
			}
			framessincetargetscan = 0;
		}
		waitframe(1);
	}
}

/*
	Name: targeting_hud_think
	Namespace: remotemissile
	Checksum: 0xFA0CB0FA
	Offset: 0x45D8
	Size: 0x4C2
	Parameters: 1
	Flags: Linked
*/
function targeting_hud_think(rocket)
{
	self endon(#"disconnect", #"remotemissile_done");
	rocket endon(#"death");
	level endon(#"game_ended");
	player = self;
	targets = self getvalidtargets(rocket, 1, 2);
	framessincetargetscan = 0;
	var_156f45fd = (sessionmodeiszombiesgame() ? 9 : 3);
	while(true)
	{
		framessincetargetscan++;
		if(framessincetargetscan > var_156f45fd)
		{
			targets = self getvalidtargets(rocket, 1, 2);
			framessincetargetscan = 0;
		}
		foreach(var_8712c5b8 in player.var_bbe80eed)
		{
			if(!isdefined(var_8712c5b8.target.var_f85f9b4d))
			{
				var_8712c5b8.state = 0;
			}
		}
		if(targets.size > 0)
		{
			foreach(target in targets)
			{
				if(!isdefined(target))
				{
					continue;
				}
				if(isplayer(target) || sessionmodeiszombiesgame())
				{
					if(isalive(target))
					{
						player function_758dc2c8(targets, target, entnum);
					}
					continue;
				}
				if(!isdefined(target.missileiconindex))
				{
					target.missileiconindex = rocket.iconindexother;
					rocket.iconindexother = (rocket.iconindexother + 1) % 3;
				}
				index = target.missileiconindex;
				if(index == 0)
				{
					level.remote_missile_targets remote_missile_targets::set_extra_target_1(self, target getentitynumber());
					continue;
				}
				if(index == 1)
				{
					level.remote_missile_targets remote_missile_targets::set_extra_target_2(self, target getentitynumber());
					continue;
				}
				if(index == 2)
				{
					level.remote_missile_targets remote_missile_targets::set_extra_target_2(self, target getentitynumber());
					continue;
				}
				/#
					assertmsg("");
				#/
			}
		}
		foreach(var_8712c5b8 in player.var_bbe80eed)
		{
			if(var_8712c5b8.state == 0)
			{
				level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_clientnum(player, player getentitynumber());
				level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_isVehicle(player, 0);
				level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_target_locked(player, 0);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_758dc2c8
	Namespace: remotemissile
	Checksum: 0x2CAEA503
	Offset: 0x4AA8
	Size: 0x244
	Parameters: 3
	Flags: Linked
*/
function function_758dc2c8(targets, target, entnum)
{
	if(isdefined(self.var_ebf52bbc[entnum]))
	{
		var_3eaf95a4 = self.var_ebf52bbc[entnum];
	}
	else
	{
		if(self.var_ebf52bbc.size >= 2)
		{
			foreach(var_5195fb14 in getarraykeys(self.var_ebf52bbc))
			{
				if(!isdefined(targets[var_5195fb14]))
				{
					var_3eaf95a4 = self.var_ebf52bbc[var_5195fb14];
					if(isdefined(self.var_bbe80eed[var_3eaf95a4].state) && self.var_bbe80eed[var_3eaf95a4].state == 0)
					{
						arrayremoveindex(self.var_ebf52bbc, var_5195fb14, 1);
						self.var_ebf52bbc[entnum] = var_3eaf95a4;
					}
				}
			}
		}
		else
		{
			var_3eaf95a4 = self.var_ebf52bbc.size;
			self.var_ebf52bbc[entnum] = var_3eaf95a4;
		}
	}
	self.var_bbe80eed[var_3eaf95a4].state = 1;
	self.var_bbe80eed[var_3eaf95a4].target = target;
	level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_clientnum(self, entnum);
	level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_isVehicle(self, is_true(target.usingvehicle));
	level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_target_locked(self, 1);
}

/*
	Name: missile_deploy_watch
	Namespace: remotemissile
	Checksum: 0x8B084B27
	Offset: 0x4CF8
	Size: 0x182
	Parameters: 1
	Flags: None
*/
function missile_deploy_watch(rocket)
{
	self endon(#"disconnect", #"remotemissile_done");
	rocket endon(#"remotemissile_bomblets_launched", #"death");
	level endon(#"game_ended");
	params = killstreaks::get_script_bundle("remote_missile");
	var_dc54c0bd = (isdefined(params.var_538e1d5) ? params.var_538e1d5 : 3000);
	wait(0.25);
	while(self attackbuttonpressed() || !self killstreaks::function_59e2c378())
	{
		waitframe(1);
	}
	while(true)
	{
		if(self attackbuttonpressed() || rocket.origin[2] < var_dc54c0bd || !self killstreaks::function_59e2c378())
		{
			self thread missile_deploy(rocket, 0);
		}
		else
		{
			waitframe(1);
		}
	}
}

/*
	Name: missile_deploy
	Namespace: remotemissile
	Checksum: 0x2DFDF940
	Offset: 0x4E88
	Size: 0x3C0
	Parameters: 2
	Flags: Linked
*/
function missile_deploy(rocket, hacked)
{
	rocket notify(#"remotemissile_bomblets_launched");
	rocket.bomblets_deployed = 1;
	waitframes = 2;
	targets = self getvalidtargets(rocket, 1, 2);
	var_940444a6 = getweapon(#"remote_missile_bomblet");
	if(targets.size > 0)
	{
		foreach(target in targets)
		{
			self thread fire_bomblet(var_940444a6, rocket, target, waitframes);
			waitframes++;
		}
	}
	if(rocket.origin[2] - self.origin[2] > 4000)
	{
		rocket notify(#"stop_impact_sound");
	}
	if(hacked == 1)
	{
		rocket.originalowner thread hud::fade_to_black_for_x_sec(0, 0.15, 0, 0, "white");
		self notify(#"remotemissile_done");
	}
	rocket hidepart("tag_attach_panel_right", "", 1);
	rocket hidepart("tag_attach_panel_left", "", 1);
	rocket clientfield::set("remote_missile_fired", 2);
	for(i = targets.size; i < 2; i++)
	{
		self thread fire_random_bomblet(rocket, i % 6, waitframes);
		waitframes++;
	}
	params = killstreaks::get_script_bundle("remote_missile");
	if(isdefined(params.var_64cbe61e))
	{
		playfx(params.var_64cbe61e, rocket.origin, anglestoforward(rocket.angles));
	}
	self playrumbleonentity("killstreak_remote_missile_bomblet_launch_1p");
	earthquake(0.2, 0.2, rocket.origin, 200);
	if(hacked == 0)
	{
		self thread hud::fade_to_black_for_x_sec(0, 0.15, 0, 0, "white");
	}
	rocket missile_sound_deploy_bomblets();
	self notify(#"bomblets_deployed");
	if(hacked == 1)
	{
		rocket notify(#"death");
	}
}

/*
	Name: function_2c190692
	Namespace: remotemissile
	Checksum: 0xF088A2DD
	Offset: 0x5258
	Size: 0x2A4
	Parameters: 2
	Flags: Linked
*/
function function_2c190692(rocket, target)
{
	var_6aece548 = getweapon(#"remote_missile_bomblet");
	origin = rocket.origin;
	targetorigin = target.origin + vectorscale((0, 0, 1), 50);
	if(isdefined(rocket))
	{
		origin = rocket.origin;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(rocket.rocket1))
	{
		origin = origin + (-70, -100, 0);
	}
	else
	{
		origin = origin + (-70, 100, 0);
	}
	var_67ee15f2 = magicbullet(var_6aece548, origin, targetorigin, self, target, vectorscale((0, 0, 1), 30));
	if(isdefined(rocket.rocket1))
	{
		rocket.rocket1 delete();
		rocket.rocket1 = undefined;
	}
	else if(isdefined(rocket.rocket2))
	{
		rocket.rocket2 delete();
		rocket.rocket2 = undefined;
	}
	var_67ee15f2 missile_settarget(target);
	var_67ee15f2.team = self.team;
	var_67ee15f2 setteam(self.team);
	var_67ee15f2.killstreakid = rocket.killstreakid;
	params = killstreaks::get_script_bundle("remote_missile");
	if(isdefined(rocket))
	{
		if(isdefined(params.var_64cbe61e))
		{
			playfx(params.var_64cbe61e, rocket.origin, anglestoforward(rocket.angles));
		}
		self playrumbleonentity("killstreak_remote_missile_bomblet_launch_1p");
		earthquake(0.2, 0.2, rocket.origin, 200);
	}
	var_67ee15f2 thread function_5cdeb64a(self, target);
}

/*
	Name: function_5cdeb64a
	Namespace: remotemissile
	Checksum: 0x71B056FB
	Offset: 0x5508
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_5cdeb64a(player, target)
{
	self waittill(#"death");
	waitframe(1);
	if(!isdefined(target))
	{
		return;
	}
	if(isalive(target))
	{
		target.var_caa3327d = undefined;
	}
	else
	{
		var_4ef4e267 = target getentitynumber();
		var_3eaf95a4 = player.var_ebf52bbc[var_4ef4e267];
		if(isdefined(var_3eaf95a4) && isdefined(player.var_bbe80eed[var_3eaf95a4]))
		{
			level.var_aac98621[var_3eaf95a4] remote_missile_target_lockon::set_killed(player, 1);
		}
	}
}

/*
	Name: bomblet_camera_waiter
	Namespace: remotemissile
	Checksum: 0x5B6B6CA4
	Offset: 0x55F0
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function bomblet_camera_waiter(rocket)
{
	self endon(#"disconnect", #"remotemissile_done");
	rocket endon(#"death");
	level endon(#"game_ended");
	delay = getdvarfloat(#"scr_rmbomblet_camera_delaytime", 1);
	self waittill(#"bomblet_exploded");
	wait(delay);
	rocket notify(#"death");
	self notify(#"remotemissile_done");
}

/*
	Name: setup_bomblet_map_icon
	Namespace: remotemissile
	Checksum: 0xFE36085A
	Offset: 0x56D0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function setup_bomblet_map_icon()
{
	self endon(#"death");
	wait(0.1);
	self clientfield::set("remote_missile_bomblet_fired", 1);
	self clientfield::set("enemyvehicle", 1);
}

/*
	Name: setup_bomblet
	Namespace: remotemissile
	Checksum: 0x95FA9DFF
	Offset: 0x5740
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function setup_bomblet(bomb)
{
	bomb.team = self.team;
	bomb setteam(self.team);
	bomb thread setup_bomblet_map_icon();
	bomb.killcament = self;
	bomb thread function_22e29ec5(self);
	bomb thread function_4c8c3b0b(self);
}

/*
	Name: fire_bomblet
	Namespace: remotemissile
	Checksum: 0x5C5CC5EE
	Offset: 0x57D0
	Size: 0x184
	Parameters: 4
	Flags: Linked
*/
function fire_bomblet(weapon, rocket, target, waitframes)
{
	origin = rocket.origin;
	targetorigin = target.origin + vectorscale((0, 0, 1), 50);
	waitframe(waitframes);
	if(isdefined(rocket))
	{
		origin = rocket.origin;
	}
	if(!isdefined(self) || !isdefined(target))
	{
		return;
	}
	bomb = magicbullet(weapon, origin, targetorigin, self, target, vectorscale((0, 0, 1), 30));
	if(isdefined(rocket) && isdefined(bomb))
	{
		if(!isdefined(rocket.bomblets))
		{
			rocket.bomblets = [];
		}
		if(!isdefined(rocket.bomblets))
		{
			rocket.bomblets = [];
		}
		else if(!isarray(rocket.bomblets))
		{
			rocket.bomblets = array(rocket.bomblets);
		}
		rocket.bomblets[rocket.bomblets.size] = bomb;
	}
	setup_bomblet(bomb);
}

/*
	Name: function_4c8c3b0b
	Namespace: remotemissile
	Checksum: 0xAED31D7E
	Offset: 0x5960
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_4c8c3b0b(player)
{
	self endon(#"bombletdestroyed");
	bomblet = self;
	bomblet waittill(#"death");
	if(!isdefined(bomblet))
	{
		return;
	}
	params = spawnstruct();
	params.position = bomblet.origin;
	params.var_7148a82 = 1;
	player thread callback::callback(#"hash_7e19bff37ddc39e3", params);
}

/*
	Name: fire_random_bomblet
	Namespace: remotemissile
	Checksum: 0x8E2322BD
	Offset: 0x5A18
	Size: 0x1EC
	Parameters: 3
	Flags: Linked
*/
function fire_random_bomblet(rocket, quadrant, waitframes)
{
	origin = rocket.origin;
	angles = rocket.angles;
	owner = rocket.owner;
	fwd = anglestoforward(rocket.angles);
	aimtarget = rocket.origin + vectorscale(fwd, 3000);
	waitframe(waitframes);
	if(!isdefined(self))
	{
		return;
	}
	angle = randomintrange(10 + (60 * quadrant), 50 + (60 * quadrant));
	radius = randomintrange(200, 400);
	x = min(radius, 250) * cos(angle);
	y = min(radius, 250) * sin(angle);
	bomb = magicbullet(getweapon(#"remote_missile_bomblet"), origin, aimtarget + (x, y, 0), self);
	setup_bomblet(bomb);
}

/*
	Name: cleanup_bombs
	Namespace: remotemissile
	Checksum: 0xF77EB9CC
	Offset: 0x5C10
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function cleanup_bombs(bomb)
{
	player = self;
	bomb endon(#"death");
	player waittill(#"joined_team", #"joined_spectators", #"disconnect", #"delete");
	if(isdefined(bomb))
	{
		bomb clientfield::set("remote_missile_bomblet_fired", 0);
		bomb delete();
	}
}

/*
	Name: function_22e29ec5
	Namespace: remotemissile
	Checksum: 0x7EFA5702
	Offset: 0x5CD8
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_22e29ec5(player)
{
	player thread cleanup_bombs(self);
	player endon(#"disconnect", #"remotemissile_done", #"death");
	level endon(#"game_ended");
	self waittill(#"death");
	if(isdefined(player))
	{
		player notify(#"bomblet_exploded");
	}
}

/*
	Name: remotemissile_bda_dialog
	Namespace: remotemissile
	Checksum: 0xC277A04C
	Offset: 0x5D88
	Size: 0x1BE
	Parameters: 0
	Flags: Linked
*/
function remotemissile_bda_dialog()
{
	waittillframeend();
	self endon(#"disconnect");
	wait(battlechatter::mpdialog_value("remoteMissileResultDelay", 0));
	if(!isdefined(self))
	{
		return;
	}
	if(!is_true(self.var_5c0f88a5))
	{
		if(isdefined(self.remotemissilebda))
		{
			if(self.remotemissilebda === 1)
			{
				bdadialog = "kill1";
			}
			else
			{
				if(self.remotemissilebda === 2)
				{
					bdadialog = "kill2";
				}
				else
				{
					if(self.remotemissilebda === 3)
					{
						bdadialog = "kill3";
					}
					else if(self.remotemissilebda > 3)
					{
						bdadialog = "killMultiple";
					}
				}
			}
			taacomdialog = "confirmHit";
		}
		else
		{
			if(is_true(self.("remote_missile" + "_hitconfirmed")))
			{
				taacomdialog = "confirmHit";
			}
			else
			{
				taacomdialog = "confirmMiss";
				bdadialog = "killNone";
			}
		}
		self namespace_f9b02f80::play_pilot_dialog(bdadialog, "remote_missile", undefined, self.remotemissilepilotindex);
		self namespace_f9b02f80::play_taacom_dialog(taacomdialog);
		self.remotemissilebda = undefined;
		self.("remote_missile" + "_hitconfirmed") = undefined;
		self.remotemissilepilotindex = undefined;
	}
}

