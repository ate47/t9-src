#using script_1cc417743d7c262d;
#using script_545a0bac37bda541;
#using script_57f7003580bb15e0;
#using script_79a7e1c31a3e8cc;
#using script_8988fdbc78d6c53;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace teargas;

/*
	Name: init_shared
	Namespace: teargas
	Checksum: 0xBA9F74CA
	Offset: 0x178
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	level.var_2ee59975 = [];
	level.var_29115f03 = [];
	level.var_29115f03[1] = {#hash_18c0a09d:#"hash_42b275f8ad52e92d", #slow:#"hash_8a5fd5a0a3d0325"};
	level.var_29115f03[2] = {#hash_18c0a09d:#"hash_42b272f8ad52e414", #slow:#"hash_8a5fa5a0a3cfe0c"};
	level.var_29115f03[3] = {#hash_18c0a09d:#"hash_42b273f8ad52e5c7", #slow:#"hash_8a5fb5a0a3cffbf"};
	weapon = getweapon(#"tear_gas");
	clientfield::register("toplayer", "in_tear_gas", 1, 2, "int");
	weaponobjects::function_e6400478(#"tear_gas", &function_db9e3adb, 0);
	deployable::function_2e088f73(weapon);
	globallogic_score::function_a458dbe1(#"hash_69c2a47bf2322b6b", &function_dbdedd18);
	callback::on_finalize_initialization(&function_1c601b99);
}

/*
	Name: function_1c601b99
	Namespace: teargas
	Checksum: 0xF60D2C71
	Offset: 0x380
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon("tear_gas"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: teargas
	Checksum: 0x42695CC8
	Offset: 0x3D0
	Size: 0x1DC
	Parameters: 2
	Flags: None
*/
function function_bff5c062(teargas, var_dbd1a594)
{
	var_f3ab6571 = teargas.owner weaponobjects::function_8481fc06(teargas.weapon) > 1;
	teargas.owner thread globallogic_audio::function_a2cde53d(teargas.weapon, var_f3ab6571);
	teargas.owner weaponobjects::hackerremoveweapon(teargas);
	teargas weaponobjects::function_fb7b0024(teargas.owner);
	teargas.team = var_dbd1a594.team;
	teargas setteam(var_dbd1a594.team);
	teargas.owner = var_dbd1a594;
	teargas setowner(var_dbd1a594);
	teargas weaponobjects::function_386fa470(var_dbd1a594);
	teargas weaponobjects::function_931041f8(var_dbd1a594);
	if(isdefined(teargas) && isdefined(level.var_f1edf93f))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			teargas notify(#"hash_602ae7ca650d6287");
			teargas thread weaponobjects::weapon_object_timeout(teargas.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
	teargas thread weaponobjects::function_6d8aa6a0(var_dbd1a594, teargas.var_2d045452);
}

/*
	Name: function_db9e3adb
	Namespace: teargas
	Checksum: 0xB5A4F864
	Offset: 0x5B8
	Size: 0x1CA
	Parameters: 1
	Flags: None
*/
function function_db9e3adb(watcher)
{
	watcher.watchforfire = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunegastrap";
	watcher.var_8eda8949 = (0, 0, 0);
	watcher.stuntime = 1;
	watcher.var_10efd558 = "switched_field_upgrade";
	if(isdefined(watcher.weapon.var_4dd46f8a))
	{
		var_e6fbac16 = getscriptbundle(watcher.weapon.var_4dd46f8a);
		watcher.var_20d0363e = var_e6fbac16.var_af22b5dc;
		watcher.activationdelay = var_e6fbac16.var_a3fd61e7;
		watcher.detectiongraceperiod = (isdefined(var_e6fbac16.var_88b0248b) ? var_e6fbac16.var_88b0248b : 0);
		if(isdefined(var_e6fbac16.var_29467698) && var_e6fbac16.var_29467698 != 0)
		{
			watcher.detonateradius = var_e6fbac16.var_29467698;
		}
	}
	watcher.ondetonatecallback = &function_f82566e8;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &function_7641afa6;
	watcher.var_994b472b = &function_5192d9d6;
	watcher.stun = &weaponobjects::weaponstun;
}

/*
	Name: function_dbdedd18
	Namespace: teargas
	Checksum: 0xA8DAB7DB
	Offset: 0x790
	Size: 0x50
	Parameters: 5
	Flags: None
*/
function function_dbdedd18(attacker, victim, var_3d1ed4bd, weapon, meansofdeath)
{
	meansofdeath contracts::function_a54e2068(#"hash_d9376f51d3c734c");
	return true;
}

/*
	Name: function_7641afa6
	Namespace: teargas
	Checksum: 0x681F9AEB
	Offset: 0x7E8
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_7641afa6(watcher, player)
{
	self.delete_on_death = 1;
	self.var_48d842c3 = 1;
	self.var_515d6dda = 1;
	self function_619a5c20();
	var_e6fbac16 = getscriptbundle(self.weapon.var_4dd46f8a);
	self.var_b2ed661a = var_e6fbac16.teargasduration + 3;
	self weaponobjects::onspawnproximitygrenadeweaponobject(watcher, player);
	player battlechatter::function_fc82b10(getweapon(#"tear_gas"), self.origin, self);
}

/*
	Name: function_5192d9d6
	Namespace: teargas
	Checksum: 0x4D9B3B06
	Offset: 0x8D8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_5192d9d6(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_f82566e8
	Namespace: teargas
	Checksum: 0x7C174215
	Offset: 0x908
	Size: 0x334
	Parameters: 3
	Flags: None
*/
function function_f82566e8(attacker, weapon, target)
{
	var_7e6e7f9f = self.weapon;
	if(is_true(self.wasdamaged))
	{
		if(self.owner util::isenemyplayer(attacker))
		{
			attacker challenges::destroyedexplosive(weapon);
			scoreevents::processscoreevent(#"hash_6913b395f1030cd3", attacker, self.owner, weapon);
			self thread battlechatter::function_d2600afc(attacker, self.owner, var_7e6e7f9f, weapon);
			self.owner globallogic_score::function_5829abe3(attacker, weapon, var_7e6e7f9f);
			var_f3ab6571 = self.owner weaponobjects::function_8481fc06(var_7e6e7f9f) > 1;
			self.owner thread globallogic_audio::function_6daffa93(var_7e6e7f9f, var_f3ab6571);
		}
		if(isdefined(level._equipment_explode_fx))
		{
			playfx(level._equipment_explode_fx, self.origin);
		}
		self playsound(#"hash_16dfe84ea21fd143");
		self delete();
		return;
	}
	var_e6fbac16 = getscriptbundle(var_7e6e7f9f.var_4dd46f8a);
	radius = var_e6fbac16.var_b86ce9f4;
	duration = var_e6fbac16.teargasduration;
	position = self.origin;
	dir_up = (0, 0, 1);
	ent = spawn("script_model", position);
	ent setteam(self.team);
	ent.team = self.team;
	owner = self.owner;
	ent.killcament = self.killcament;
	if(isdefined(owner))
	{
		ent setowner(owner);
		ent.owner = owner;
		owner.var_d56524fc = gettime();
		owner.var_2af14143 = position;
	}
	ent thread function_2f37f73e(var_7e6e7f9f, duration, radius);
	level thread function_a2493473(position, duration, var_7e6e7f9f.projsmokestartsound, var_7e6e7f9f.projsmokeendsound, var_7e6e7f9f.projsmokeloopsound);
	self weaponobjects::proximitydetonate(attacker, weapon, target);
}

/*
	Name: function_2f37f73e
	Namespace: teargas
	Checksum: 0xB85B7C04
	Offset: 0xC48
	Size: 0x17C
	Parameters: 3
	Flags: None
*/
function function_2f37f73e(var_7e6e7f9f, duration, radius)
{
	team = self.team;
	owner = self.owner;
	trigger = spawn("trigger_radius", self.origin, 0, radius, radius);
	trigger.owner = owner;
	self.var_160d2855 = trigger;
	if(!isdefined(level.var_2ee59975))
	{
		level.var_2ee59975 = [];
	}
	else if(!isarray(level.var_2ee59975))
	{
		level.var_2ee59975 = array(level.var_2ee59975);
	}
	level.var_2ee59975[level.var_2ee59975.size] = trigger;
	level thread function_516794d8(self, var_7e6e7f9f);
	self waittilltimeout(duration, #"death");
	arrayremovevalue(level.var_2ee59975, trigger);
	if(isdefined(trigger))
	{
		trigger delete();
	}
}

/*
	Name: function_12b45f48
	Namespace: teargas
	Checksum: 0x2ED5A3B9
	Offset: 0xDD0
	Size: 0xEE
	Parameters: 2
	Flags: None
*/
function function_12b45f48(var_7acab93a, team)
{
	foreach(trigger in level.var_2ee59975)
	{
		if(isdefined(team) && trigger util::isenemyteam(team))
		{
			continue;
		}
		if(self istouching(trigger))
		{
			if(isdefined(var_7acab93a))
			{
				if(var_7acab93a != trigger)
				{
					return trigger;
				}
				continue;
			}
			return trigger;
		}
	}
	return undefined;
}

/*
	Name: function_585ad28f
	Namespace: teargas
	Checksum: 0x2D00AB0D
	Offset: 0xEC8
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_585ad28f(weapon)
{
	if(getweapon(#"tear_gas") == weapon.rootweapon)
	{
		return true;
	}
	return false;
}

/*
	Name: function_516794d8
	Namespace: teargas
	Checksum: 0xC4298AAC
	Offset: 0xF10
	Size: 0x2F0
	Parameters: 2
	Flags: None
*/
function function_516794d8(grenadeent, var_7e6e7f9f)
{
	var_160d2855 = grenadeent.var_160d2855;
	if(!isdefined(var_160d2855))
	{
		return;
	}
	var_ce7665b1 = grenadeent.team;
	owner = grenadeent.owner;
	while(true)
	{
		waitresult = undefined;
		waitresult = var_160d2855 waittilltimeout(0.2, #"death");
		playertargets = grenadeent getpotentialtargets(owner, var_ce7665b1, var_7e6e7f9f);
		foreach(player in playertargets)
		{
			if(player hasperk(#"hash_5fef46715b368a6e"))
			{
				continue;
			}
			if(waitresult._notify == #"timeout" && isdefined(var_160d2855) && player istouching(var_160d2855) && bullettracepassed(grenadeent.origin, player.origin + vectorscale((0, 0, 1), 12), 0, player))
			{
				if(!isdefined(player.var_2ee59975))
				{
					player.var_2ee59975 = [];
				}
				else if(!isarray(player.var_2ee59975))
				{
					player.var_2ee59975 = array(player.var_2ee59975);
				}
				if(!isinarray(player.var_2ee59975, var_160d2855))
				{
					player.var_2ee59975[var_160d2855 getentitynumber()] = var_160d2855;
					if(!isdefined(player.var_1b05dcde))
					{
						player thread function_78d7002(var_7e6e7f9f, owner, grenadeent);
					}
				}
				continue;
			}
			if(isdefined(player.var_1b05dcde))
			{
				player function_9eda41cd(var_160d2855, var_7e6e7f9f, owner);
			}
		}
		if(!isdefined(var_160d2855) || waitresult._notify != "timeout")
		{
			return;
		}
	}
}

/*
	Name: getpotentialtargets
	Namespace: teargas
	Checksum: 0x1618F482
	Offset: 0x1208
	Size: 0xD0
	Parameters: 3
	Flags: Private
*/
function private getpotentialtargets(owner, ownerteam, var_7e6e7f9f)
{
	if(level.friendlyfire)
	{
		return function_a1ef346b();
	}
	potentialtargets = function_f6f34851(ownerteam);
	var_e6fbac16 = getscriptbundle(var_7e6e7f9f.var_4dd46f8a);
	if(is_true(var_e6fbac16.var_fc20cda3) && isalive(owner))
	{
		potentialtargets[potentialtargets.size] = owner;
	}
	return potentialtargets;
}

/*
	Name: function_78d7002
	Namespace: teargas
	Checksum: 0x469C7194
	Offset: 0x12E0
	Size: 0x212
	Parameters: 3
	Flags: Private
*/
function private function_78d7002(var_7e6e7f9f, owner, grenadeent)
{
	self endoncallback(&function_ac86e0a9, #"death", #"hash_7adffd186663a874");
	dot = (level.hardcoremode === 1 ? function_4d1e7b48(#"hash_5f651c0a59d8c40d") : function_4d1e7b48(#"hash_69c2a47bf2322b6b"));
	dot.killcament = grenadeent.killcament;
	self thread status_effect::status_effect_apply(dot, var_7e6e7f9f, owner, 0, undefined, undefined, grenadeent.origin);
	self playsoundtoplayer(#"hash_569fa11d8a4005ba", self);
	foreach(stage, var_c62d6d34 in level.var_29115f03)
	{
		self.var_1b05dcde = stage;
		slow = function_4d1e7b48(var_c62d6d34.slow);
		self thread status_effect::status_effect_apply(slow, var_7e6e7f9f, owner);
		self clientfield::set_to_player("in_tear_gas", stage);
		wait(float(slow.var_77449e9) / 1000);
	}
}

/*
	Name: function_ac86e0a9
	Namespace: teargas
	Checksum: 0x1577F169
	Offset: 0x1500
	Size: 0x156
	Parameters: 1
	Flags: Private
*/
function private function_ac86e0a9(notifyhash)
{
	if(notifyhash == "death" && isdefined(self))
	{
		if(isdefined(self.var_1b05dcde))
		{
			var_c62d6d34 = level.var_29115f03[self.var_1b05dcde];
			slow = function_4d1e7b48(var_c62d6d34.slow);
			self status_effect::function_408158ef(slow.var_67e2281d, slow.var_18d16a6b);
			self.var_1b05dcde = undefined;
		}
		dot = (level.hardcoremode === 1 ? function_4d1e7b48(#"hash_5f651c0a59d8c40d") : function_4d1e7b48(#"hash_69c2a47bf2322b6b"));
		self status_effect::function_408158ef(dot.var_67e2281d, dot.var_18d16a6b);
		self clientfield::set_to_player("in_tear_gas", 0);
		self.var_2ee59975 = undefined;
	}
}

/*
	Name: function_9eda41cd
	Namespace: teargas
	Checksum: 0x229D432E
	Offset: 0x1660
	Size: 0x216
	Parameters: 3
	Flags: Private
*/
function private function_9eda41cd(var_160d2855, var_7e6e7f9f, owner)
{
	if(isarray(self.var_2ee59975) && isinarray(self.var_2ee59975, var_160d2855))
	{
		arrayremovevalue(self.var_2ee59975, var_160d2855);
		if(!self.var_2ee59975.size)
		{
			self.var_2ee59975 = undefined;
		}
	}
	if(isdefined(self.var_2ee59975))
	{
		return;
	}
	self notify(#"hash_7adffd186663a874");
	if(!isdefined(self.var_1b05dcde))
	{
		return;
	}
	var_c62d6d34 = level.var_29115f03[self.var_1b05dcde];
	slow = function_4d1e7b48(var_c62d6d34.slow);
	var_18c0a09d = function_4d1e7b48(var_c62d6d34.var_18c0a09d);
	dot = (level.hardcoremode === 1 ? function_4d1e7b48(#"hash_5f651c0a59d8c40d") : function_4d1e7b48(#"hash_69c2a47bf2322b6b"));
	self status_effect::function_408158ef(dot.var_67e2281d, dot.var_18d16a6b);
	self status_effect::function_408158ef(slow.var_67e2281d, slow.var_18d16a6b);
	self thread status_effect::status_effect_apply(var_18c0a09d, var_7e6e7f9f, owner);
	self clientfield::set_to_player("in_tear_gas", 0);
	self.var_1b05dcde = undefined;
}

/*
	Name: function_a2493473
	Namespace: teargas
	Checksum: 0xEDDCDDBA
	Offset: 0x1880
	Size: 0x13C
	Parameters: 5
	Flags: None
*/
function function_a2493473(position, duration, startsound, stopsound, loopsound)
{
	var_4af5a2e7 = spawn("script_origin", (0, 0, 1));
	if(isdefined(var_4af5a2e7))
	{
		var_4af5a2e7 endon(#"death");
		var_4af5a2e7.origin = position;
		if(isdefined(startsound))
		{
			var_4af5a2e7 playsound(startsound);
		}
		if(isdefined(loopsound))
		{
			var_4af5a2e7 playloopsound(loopsound);
		}
		if(duration > 7.5)
		{
			wait(duration - 7.5);
		}
		if(isdefined(stopsound))
		{
			thread sound::play_in_space(stopsound, position);
		}
		var_4af5a2e7 stoploopsound(0.5);
		wait(0.5);
		var_4af5a2e7 delete();
	}
}

