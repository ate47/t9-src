#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\archetype_human_cover.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\archetype_civilian_interface.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\archetype_human_locomotion.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace archetype_civilian;

/*
	Name: function_d94c789e
	Namespace: archetype_civilian
	Checksum: 0x5DF22E9
	Offset: 0x418
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d94c789e()
{
	level notify(2024108002);
}

/*
	Name: main
	Namespace: archetype_civilian
	Checksum: 0xA2258ED0
	Offset: 0x438
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	archetypecivilian::registerbehaviorscriptfunctions();
	civilianinterface::registercivilianinterfaceattributes();
}

#namespace archetypecivilian;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: archetypecivilian
	Checksum: 0xF0EE4F91
	Offset: 0x468
	Size: 0x7AC
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	spawner::add_archetype_spawn_function(#"civilian", &civilianblackboardinit);
	spawner::add_archetype_spawn_function(#"civilian", &civilianinit);
	/#
		assert(!isdefined(&civilianmoveactioninitialize) || isscriptfunctionptr(&civilianmoveactioninitialize));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&civilianmoveactionfinalize) || isscriptfunctionptr(&civilianmoveactionfinalize));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("civilianMoveAction", &civilianmoveactioninitialize, undefined, &civilianmoveactionfinalize);
	/#
		assert(isscriptfunctionptr(&civilianwanderservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianWanderService", &civilianwanderservice, 1);
	/#
		assert(isscriptfunctionptr(&civilianpanicescapechooseposition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianPanicEscapeChoosePosition", &civilianpanicescapechooseposition, 1);
	/#
		assert(isscriptfunctionptr(&rioterchoosepositionservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("rioterChoosePositionService", &rioterchoosepositionservice, 1);
	/#
		assert(isscriptfunctionptr(&civilianfollowservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianFollowService", &civilianfollowservice, 1);
	/#
		assert(isscriptfunctionptr(&civiliancanthrowmolotovgrenade));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianCanThrowMolotovGrenade", &civiliancanthrowmolotovgrenade);
	/#
		assert(isscriptfunctionptr(&civilianpreparetothrowgrenade));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianPrepareToThrowGrenade", &civilianpreparetothrowgrenade);
	/#
		assert(isscriptfunctionptr(&civiliancleanuptothrowgrenade));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianCleanUpToThrowGrenade", &civiliancleanuptothrowgrenade);
	/#
		assert(isscriptfunctionptr(&civilianispanicked));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianIsPanicked", &civilianispanicked);
	/#
		assert(isscriptfunctionptr(&civilianarrivalallowed));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("civilianArrivalAllowed", &civilianarrivalallowed);
	/#
		assert(isscriptfunctionptr(&civilianareturnsallowed));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("civilianAreTurnsAllowed", &civilianareturnsallowed);
	/#
		assert(isscriptfunctionptr(&civilianisrioter));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("civilianIsRioter", &civilianisrioter);
	/#
		assert(isscriptfunctionptr(&civilianisrioter));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianIsRioter", &civilianisrioter);
	/#
		assert(isscriptfunctionptr(&rioterreaquireservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("rioterReaquireService", &rioterreaquireservice);
	/#
		assert(isscriptfunctionptr(&function_91a0507));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_9d096baef09c4d3", &function_91a0507);
	/#
		assert(isscriptfunctionptr(&function_c93e1821));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_199c583edcee4a40", &function_c93e1821);
	/#
		assert(isscriptfunctionptr(&function_4f13d157));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7b00798f103c87e8", &function_4f13d157);
}

/*
	Name: civilianblackboardinit
	Namespace: archetypecivilian
	Checksum: 0x528EB0D5
	Offset: 0xC20
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private civilianblackboardinit()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &civilianonanimscriptedcallback;
}

/*
	Name: function_49d80e54
	Namespace: archetypecivilian
	Checksum: 0x9A8EBF95
	Offset: 0xC78
	Size: 0x6C
	Parameters: 4
	Flags: Linked
*/
function function_49d80e54(civilian, attribute, oldvalue, value)
{
	/#
		assert(issentient(oldvalue));
	#/
	oldvalue setblackboardattribute("follow", value);
}

/*
	Name: civilianinit
	Namespace: archetypecivilian
	Checksum: 0xA7FAB5FC
	Offset: 0xCF0
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private civilianinit()
{
	entity = self;
	locomotiontypes = array("alt1", "alt2", "alt3");
	altindex = entity getentitynumber() % locomotiontypes.size;
	entity setblackboardattribute("_human_locomotion_variation", locomotiontypes[altindex]);
	entity setavoidancemask("avoid none");
	entity disableaimassist();
	entity.ignorepathenemyfightdist = 1;
	entity trackblackboardattribute("_traversal_type");
	entity finalizetrackedblackboardattributes();
}

/*
	Name: civilianonanimscriptedcallback
	Namespace: archetypecivilian
	Checksum: 0x424159C8
	Offset: 0xE08
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianonanimscriptedcallback(entity)
{
	entity.__blackboard = undefined;
	entity civilianblackboardinit();
}

/*
	Name: function_ebea502e
	Namespace: archetypecivilian
	Checksum: 0x8E79CABB
	Offset: 0xE40
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ebea502e(entity)
{
	if(entity asmistransitionrunning() || entity getbehaviortreestatus() != 5 || entity asmissubstatepending() || entity asmistransdecrunning())
	{
		return true;
	}
	if(entity getpathmode() == "dont move")
	{
		return false;
	}
	return false;
}

/*
	Name: rioterchoosepositionservice
	Namespace: archetypecivilian
	Checksum: 0xF4B0EA44
	Offset: 0xEF0
	Size: 0x414
	Parameters: 1
	Flags: Linked, Private
*/
function private rioterchoosepositionservice(entity)
{
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") != "riot")
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(function_ebea502e(entity))
	{
		return false;
	}
	var_1f2328d0 = entity function_4794d6a3();
	forcedgoal = is_true(var_1f2328d0.goalforced);
	isatscriptgoal = entity isatgoal() || entity isapproachinggoal();
	itsbeenawhile = gettime() > entity.nextfindbestcovertime;
	isinbadplace = entity isinanybadplace();
	lastknownpos = entity lastknownpos(entity.enemy);
	dist = distance2d(entity.origin, lastknownpos);
	var_1ebff8de = itsbeenawhile || !isatscriptgoal || isinbadplace;
	if(!var_1ebff8de)
	{
		return false;
	}
	if(forcedgoal)
	{
		/#
			assert(isdefined(var_1f2328d0.goalpos));
		#/
		entity function_a57c34b7(var_1f2328d0.goalpos);
		aiutility::setnextfindbestcovertime(entity);
		return true;
	}
	center = entity.origin;
	if(isdefined(entity.goalpos))
	{
		center = entity.goalpos;
	}
	cylinder = ai::t_cylinder(center, entity.goalradius, entity.goalheight);
	pixbeginevent();
	aiprofile_beginentry("rioter_tacquery_combat");
	tacpoints = tacticalquery("rioter_tacquery_combat", center, entity, cylinder);
	aiprofile_endentry();
	pixendevent();
	pickedpoint = undefined;
	if(isdefined(tacpoints))
	{
		tacpoints = array::randomize(tacpoints);
		foreach(tacpoint in tacpoints)
		{
			if(self isingoal(tacpoint.origin))
			{
				if(isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin)
				{
					continue;
				}
				pickedpoint = tacpoint;
				break;
			}
		}
	}
	if(isdefined(pickedpoint))
	{
		entity function_a57c34b7(pickedpoint.origin);
		aiutility::setnextfindbestcovertime(entity);
		return true;
	}
	return false;
}

/*
	Name: civilianpanicescapechooseposition
	Namespace: archetypecivilian
	Checksum: 0x56F44319
	Offset: 0x1310
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function civilianpanicescapechooseposition(entity)
{
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") != "panic")
	{
		return false;
	}
	if(is_true(entity.ai.escaping))
	{
		return false;
	}
	if(!ai::getaiattribute(entity, "auto_escape"))
	{
		return false;
	}
	escape_nodes = getnodearray("civ_escape", "targetname");
	if(escape_nodes.size)
	{
		var_cc364bf7 = arraygetclosest(entity.origin, escape_nodes);
		entity function_a57c34b7(var_cc364bf7.origin);
		entity.ai.escaping = 1;
		return true;
	}
	return false;
}

/*
	Name: civilianwanderservice
	Namespace: archetypecivilian
	Checksum: 0x288B5312
	Offset: 0x1438
	Size: 0x42C
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianwanderservice(entity)
{
	if(isentity(entity getblackboardattribute("follow")))
	{
		return false;
	}
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "riot")
	{
		return false;
	}
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "panic" && ai::getaiattribute(entity, "auto_escape"))
	{
		return false;
	}
	if(!ai::getaiattribute(entity, "auto_wander"))
	{
		return false;
	}
	if(function_ebea502e(entity))
	{
		return false;
	}
	var_1f2328d0 = entity function_4794d6a3();
	forcedgoal = is_true(var_1f2328d0.goalforced);
	isatscriptgoal = entity isatgoal() || entity isapproachinggoal();
	itsbeenawhile = gettime() > entity.nextfindbestcovertime;
	var_1ebff8de = itsbeenawhile || !isatscriptgoal;
	if(!var_1ebff8de)
	{
		return false;
	}
	if(forcedgoal)
	{
		/#
			assert(isdefined(var_1f2328d0.goalpos));
		#/
		entity function_a57c34b7(var_1f2328d0.goalpos);
		aiutility::setnextfindbestcovertime(entity);
		return true;
	}
	cylinder = ai::t_cylinder(entity.goalpos, entity.goalradius, entity.goalheight);
	pixbeginevent();
	aiprofile_beginentry("civilian_wander_tacquery");
	tacpoints = tacticalquery("civilian_wander_tacquery", entity.goalpos, entity, cylinder);
	aiprofile_endentry();
	pixendevent();
	pickedpoint = undefined;
	if(isdefined(tacpoints))
	{
		tacpoints = array::randomize(tacpoints);
		foreach(tacpoint in tacpoints)
		{
			if(!self isposinclaimedlocation(tacpoint.origin) && self isingoal(tacpoint.origin))
			{
				if(isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin)
				{
					continue;
				}
				pickedpoint = tacpoint;
				break;
			}
		}
	}
	if(isdefined(pickedpoint))
	{
		entity function_a57c34b7(pickedpoint.origin);
		aiutility::setnextfindbestcovertime(entity);
		return true;
	}
	return false;
}

/*
	Name: civilianfollowservice
	Namespace: archetypecivilian
	Checksum: 0xF5C503CC
	Offset: 0x1870
	Size: 0x3D4
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianfollowservice(entity)
{
	followradiussq = 300 * 300;
	followent = entity getblackboardattribute("follow");
	if(!isentity(followent))
	{
		return false;
	}
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "panic" && ai::getaiattribute(entity, "auto_escape"))
	{
		return false;
	}
	if(function_ebea502e(entity))
	{
		return false;
	}
	var_1f2328d0 = entity function_4794d6a3();
	distsq = (isdefined(entity.overridegoalpos) ? distancesquared(entity.overridegoalpos, followent.origin) : -1);
	forcedgoal = is_true(var_1f2328d0.goalforced);
	isatscriptgoal = entity isatgoal() || entity isapproachinggoal();
	itsbeenawhile = gettime() > entity.nextfindbestcovertime;
	var_1ebff8de = itsbeenawhile || !isatscriptgoal || distsq < 0 || distsq > followradiussq;
	if(!var_1ebff8de)
	{
		return false;
	}
	pixbeginevent();
	aiprofile_beginentry("civilian_follow_tacquery");
	tacpoints = tacticalquery("civilian_follow_tacquery", followent, entity, followent);
	aiprofile_endentry();
	pixendevent();
	pickedpoint = undefined;
	if(isdefined(tacpoints))
	{
		tacpoints = array::randomize(tacpoints);
		if(tacpoints.size == 0)
		{
			pickedpoint = followent;
		}
		else
		{
			foreach(tacpoint in tacpoints)
			{
				if(!self isposinclaimedlocation(tacpoint.origin) && self isingoal(tacpoint.origin))
				{
					if(isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin)
					{
						continue;
					}
					pickedpoint = tacpoint;
					break;
				}
			}
		}
	}
	if(isdefined(pickedpoint))
	{
		entity function_a57c34b7(pickedpoint.origin);
		aiutility::setnextfindbestcovertime(entity);
		return true;
	}
	return false;
}

/*
	Name: civilianmoveactioninitialize
	Namespace: archetypecivilian
	Checksum: 0x76295E12
	Offset: 0x1C50
	Size: 0x58
	Parameters: 2
	Flags: Linked, Private
*/
function private civilianmoveactioninitialize(entity, asmstatename)
{
	entity setblackboardattribute("_desired_stance", "stand");
	animationstatenetworkutility::requeststate(entity, asmstatename);
	return 5;
}

/*
	Name: civilianmoveactionfinalize
	Namespace: archetypecivilian
	Checksum: 0x9F5FAD8
	Offset: 0x1CB0
	Size: 0x68
	Parameters: 2
	Flags: Linked, Private
*/
function private civilianmoveactionfinalize(entity, asmstatename)
{
	if(asmstatename getblackboardattribute("_stance") != "stand")
	{
		asmstatename setblackboardattribute("_desired_stance", "stand");
	}
	return 4;
}

/*
	Name: civilianispanicked
	Namespace: archetypecivilian
	Checksum: 0xF2C509C1
	Offset: 0x1D20
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianispanicked(entity)
{
	return entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "panic";
}

/*
	Name: function_e27d2a1b
	Namespace: archetypecivilian
	Checksum: 0xF92681ED
	Offset: 0x1D60
	Size: 0x22
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e27d2a1b()
{
	return ai::getaiattribute(self, #"hash_78e762abc4fbf1de");
}

/*
	Name: civilianarrivalallowed
	Namespace: archetypecivilian
	Checksum: 0xCA8E85BD
	Offset: 0x1D90
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianarrivalallowed(entity)
{
	if(ai::getaiattribute(entity, "disablearrivals"))
	{
		return false;
	}
	return true;
}

/*
	Name: civilianareturnsallowed
	Namespace: archetypecivilian
	Checksum: 0xD0BA2311
	Offset: 0x1DD0
	Size: 0x40
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianareturnsallowed(entity)
{
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "calm")
	{
		return false;
	}
	return true;
}

/*
	Name: civilianisrioter
	Namespace: archetypecivilian
	Checksum: 0x9A60135E
	Offset: 0x1E18
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function civilianisrioter(entity)
{
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "riot")
	{
		return true;
	}
	return false;
}

/*
	Name: civiliancanthrowmolotovgrenade
	Namespace: archetypecivilian
	Checksum: 0x3BCCBB1B
	Offset: 0x1E60
	Size: 0x58E
	Parameters: 2
	Flags: Linked
*/
function civiliancanthrowmolotovgrenade(behaviortreeentity, throwifpossible)
{
	if(!isdefined(throwifpossible))
	{
		throwifpossible = 0;
	}
	if(!isdefined(behaviortreeentity.enemy))
	{
		return false;
	}
	if(!issentient(behaviortreeentity.enemy))
	{
		return false;
	}
	if(isvehicle(behaviortreeentity.enemy) && behaviortreeentity.enemy.vehicleclass === "helicopter")
	{
		return false;
	}
	if(!ai::getaiattribute(behaviortreeentity, "useGrenades"))
	{
		return false;
	}
	entityangles = behaviortreeentity.angles;
	toenemy = behaviortreeentity.enemy.origin - behaviortreeentity.origin;
	toenemy = vectornormalize((toenemy[0], toenemy[1], 0));
	entityforward = anglestoforward(entityangles);
	entityforward = vectornormalize((entityforward[0], entityforward[1], 0));
	if(vectordot(toenemy, entityforward) < 0.5)
	{
		return false;
	}
	if(!throwifpossible)
	{
		foreach(player in level.players)
		{
			if(player laststand::player_is_in_laststand() && distancesquared(behaviortreeentity.enemy.origin, player.origin) <= 640000)
			{
				return false;
			}
		}
		grenadethrowinfos = blackboard::getblackboardevents("team_grenade_throw");
		foreach(grenadethrowinfo in grenadethrowinfos)
		{
			if(grenadethrowinfo.data.grenadethrowerteam === behaviortreeentity.team)
			{
				return false;
			}
		}
		grenadethrowinfos = blackboard::getblackboardevents("riot_grenade_throw");
		foreach(grenadethrowinfo in grenadethrowinfos)
		{
			if(isdefined(grenadethrowinfo.data.grenadethrownat) && isalive(grenadethrowinfo.data.grenadethrownat))
			{
				if(grenadethrowinfo.data.grenadethrower == behaviortreeentity)
				{
					return false;
				}
				if(isdefined(grenadethrowinfo.data.grenadethrownat) && grenadethrowinfo.data.grenadethrownat == behaviortreeentity.enemy)
				{
					return false;
				}
				if(isdefined(grenadethrowinfo.data.grenadethrownposition) && isdefined(behaviortreeentity.grenadethrowposition) && distancesquared(grenadethrowinfo.data.grenadethrownposition, behaviortreeentity.grenadethrowposition) <= 1440000)
				{
					return false;
				}
			}
		}
	}
	throw_dist = distance2dsquared(behaviortreeentity.origin, behaviortreeentity lastknownpos(behaviortreeentity.enemy));
	if(throw_dist < sqr(300) || throw_dist > sqr(1250))
	{
		return false;
	}
	arm_offset = archetype_human_cover::temp_get_arm_offset(behaviortreeentity, behaviortreeentity lastknownpos(behaviortreeentity.enemy));
	throw_vel = behaviortreeentity canthrowgrenadepos(arm_offset, behaviortreeentity lastknownpos(behaviortreeentity.enemy));
	if(!isdefined(throw_vel))
	{
		return false;
	}
	return true;
}

/*
	Name: civilianpreparetothrowgrenade
	Namespace: archetypecivilian
	Checksum: 0xB61C34B6
	Offset: 0x23F8
	Size: 0x13E
	Parameters: 1
	Flags: Linked, Private
*/
function private civilianpreparetothrowgrenade(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	if(isdefined(behaviortreeentity.enemy))
	{
		behaviortreeentity.grenadethrowposition = behaviortreeentity lastknownpos(behaviortreeentity.enemy);
	}
	grenadethrowinfo = spawnstruct();
	grenadethrowinfo.grenadethrower = behaviortreeentity;
	grenadethrowinfo.grenadethrownat = behaviortreeentity.enemy;
	grenadethrowinfo.grenadethrownposition = behaviortreeentity.grenadethrowposition;
	blackboard::addblackboardevent("riot_grenade_throw", grenadethrowinfo, randomintrange(15000, 20000));
	grenadethrowinfo = spawnstruct();
	grenadethrowinfo.grenadethrowerteam = behaviortreeentity.team;
	blackboard::addblackboardevent("team_grenade_throw", grenadethrowinfo, randomintrange(5000, 10000));
	behaviortreeentity.preparegrenadeammo = behaviortreeentity.grenadeammo;
}

/*
	Name: civiliancleanuptothrowgrenade
	Namespace: archetypecivilian
	Checksum: 0x6222BE8C
	Offset: 0x2540
	Size: 0x1E4
	Parameters: 1
	Flags: Linked, Private
*/
function private civiliancleanuptothrowgrenade(behaviortreeentity)
{
	aiutility::releaseclaimnode(behaviortreeentity);
	if(behaviortreeentity.preparegrenadeammo == behaviortreeentity.grenadeammo)
	{
		if(behaviortreeentity.health <= 0)
		{
			grenade = undefined;
			if(isactor(behaviortreeentity.enemy) && isdefined(behaviortreeentity.grenadeweapon))
			{
				grenade = behaviortreeentity.enemy magicgrenadetype(behaviortreeentity.grenadeweapon, behaviortreeentity gettagorigin("j_wrist_ri"), (0, 0, 0), float(behaviortreeentity.grenadeweapon.aifusetime) / 1000);
			}
			else if(isplayer(behaviortreeentity.enemy) && isdefined(behaviortreeentity.grenadeweapon))
			{
				grenade = behaviortreeentity.enemy magicgrenadeplayer(behaviortreeentity.grenadeweapon, behaviortreeentity gettagorigin("j_wrist_ri"), (0, 0, 0));
			}
			if(isdefined(grenade))
			{
				grenade.owner = behaviortreeentity;
				grenade.team = behaviortreeentity.team;
				grenade setcontents(grenade setcontents(0) & (~(((32768 | 16777216) | 2097152) | 8388608)));
			}
		}
	}
}

/*
	Name: rioterreaquireservice
	Namespace: archetypecivilian
	Checksum: 0x83832A9D
	Offset: 0x2730
	Size: 0x2C2
	Parameters: 1
	Flags: Linked, Private
*/
function private rioterreaquireservice(entity)
{
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") != "riot")
	{
		return false;
	}
	if(!isdefined(entity.reacquire_state))
	{
		entity.reacquire_state = 0;
	}
	if(!isdefined(entity.enemy))
	{
		entity.reacquire_state = 0;
		return false;
	}
	if(entity haspath())
	{
		return false;
	}
	if(entity seerecently(entity.enemy, 3))
	{
		entity.reacquire_state = 0;
		return false;
	}
	dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
	forward = anglestoforward(entity.angles);
	if(vectordot(dirtoenemy, forward) < 0.5)
	{
		entity.reacquire_state = 0;
		return false;
	}
	switch(entity.reacquire_state)
	{
		case 0:
		case 1:
		case 2:
		{
			step_size = 32 + (entity.reacquire_state * 32);
			reacquirepos = entity reacquirestep(step_size);
			break;
		}
		case 4:
		{
			if(!entity cansee(entity.enemy) || !entity canshootenemy())
			{
				entity flagenemyunattackable();
			}
			break;
		}
		default:
		{
			if(entity.reacquire_state > 15)
			{
				entity.reacquire_state = 0;
				return false;
			}
			break;
		}
	}
	if(isvec(reacquirepos))
	{
		entity function_a57c34b7(reacquirepos);
		entity.reacquire_state = 0;
		return true;
	}
	entity.reacquire_state++;
	return false;
}

/*
	Name: function_91a0507
	Namespace: archetypecivilian
	Checksum: 0x77BB7025
	Offset: 0x2A00
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_91a0507(entity)
{
	entity function_ed7c3705("non_combat_run");
	return true;
}

/*
	Name: function_c93e1821
	Namespace: archetypecivilian
	Checksum: 0x4C17A255
	Offset: 0x2A38
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c93e1821(entity)
{
	namespace_2dd2c4d8::function_3b9e6ead(entity, "turn@locomotion");
	return true;
}

/*
	Name: function_4f13d157
	Namespace: archetypecivilian
	Checksum: 0xC6308504
	Offset: 0x2A70
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4f13d157(entity)
{
	entity function_ed7c3705("none");
	return true;
}

