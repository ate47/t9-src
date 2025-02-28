#using script_178024232e91b0a1;
#using script_3aa0f32b70d4f7cb;

#namespace aiutility;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: aiutility
	Checksum: 0xD894F705
	Offset: 0x3A0
	Size: 0x4E4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&explosivekilled));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"explosivekilled", &explosivekilled);
	/#
		assert(isscriptfunctionptr(&electrifiedkilled));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"electrifiedkilled", &electrifiedkilled);
	/#
		assert(isscriptfunctionptr(&burnedkilled));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"burnedkilled", &burnedkilled);
	/#
		assert(isscriptfunctionptr(&rapskilled));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"rapskilled", &rapskilled);
	/#
		assert(isscriptfunctionptr(&tookflashbangdamage));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"tookflashbangdamage", &tookflashbangdamage);
	/#
		assert(isscriptfunctionptr(&function_95482e2b));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5b6a2e66dc5bf7a7", &function_95482e2b);
	/#
		assert(isscriptfunctionptr(&function_f9a1ea10));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7e18cc452c8ecce8", &function_f9a1ea10);
	/#
		assert(isscriptfunctionptr(&function_ebf05a38));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2bb2abb5b247ba91", &function_ebf05a38);
	/#
		assert(isscriptfunctionptr(&function_d63ff497));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_49371f9efa84972e", &function_d63ff497);
	/#
		assert(isscriptfunctionptr(&function_26b6e27e));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7c8fbf66eeb51ccb", &function_26b6e27e);
	/#
		assert(isscriptfunctionptr(&function_603389de));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1b92b6b5f1705db3", &function_603389de);
	/#
		assert(isscriptfunctionptr(&function_13b0963e));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_62a8709f08c68d60", &function_13b0963e);
}

/*
	Name: function_95482e2b
	Namespace: aiutility
	Checksum: 0x6AB4F9F
	Offset: 0x890
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_95482e2b(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("helmet", "head", "neck"), shitloc);
	}
	return 0;
}

/*
	Name: function_f9a1ea10
	Namespace: aiutility
	Checksum: 0x9B04A650
	Offset: 0x900
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_f9a1ea10(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("torso_upper", "torso_mid"), shitloc) || isinarray(array("torso_lower", "groin"), shitloc);
	}
	return 0;
}

/*
	Name: function_ebf05a38
	Namespace: aiutility
	Checksum: 0x50345150
	Offset: 0x9A0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_ebf05a38(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("right_arm_upper", "right_arm_lower", "right_hand", "gun"), shitloc);
	}
	return 0;
}

/*
	Name: function_d63ff497
	Namespace: aiutility
	Checksum: 0x7BB4D3E0
	Offset: 0xA18
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_d63ff497(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("left_arm_upper", "left_arm_lower", "left_hand"), shitloc);
	}
	return 0;
}

/*
	Name: function_26b6e27e
	Namespace: aiutility
	Checksum: 0x67438D3D
	Offset: 0xA88
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_26b6e27e(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("torso_lower", "groin"), shitloc);
	}
	return 0;
}

/*
	Name: function_603389de
	Namespace: aiutility
	Checksum: 0x42C1EF4A
	Offset: 0xAF0
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_603389de(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("right_leg_upper", "right_leg_lower", "right_foot"), shitloc);
	}
	return 0;
}

/*
	Name: function_13b0963e
	Namespace: aiutility
	Checksum: 0xED1A04E8
	Offset: 0xB60
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_13b0963e(entity)
{
	shitloc = entity.damagelocation;
	if(isdefined(shitloc))
	{
		return isinarray(array("left_leg_upper", "left_leg_lower", "left_foot"), shitloc);
	}
	return 0;
}

/*
	Name: explosivekilled
	Namespace: aiutility
	Checksum: 0xE520A63C
	Offset: 0xBD0
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function explosivekilled(entity)
{
	if(entity getblackboardattribute("_damage_weapon_class") == "explosive" && entity getblackboardattribute("_damage_taken") != "light")
	{
		return true;
	}
	return false;
}

/*
	Name: electrifiedkilled
	Namespace: aiutility
	Checksum: 0x3610CF2F
	Offset: 0xC48
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function electrifiedkilled(entity)
{
	if(entity.damageweapon.rootweapon.name == "shotgun_pump_taser")
	{
		return true;
	}
	if(entity getblackboardattribute("_damage_mod") == "mod_electrocuted")
	{
		return true;
	}
	return false;
}

/*
	Name: burnedkilled
	Namespace: aiutility
	Checksum: 0x3440738C
	Offset: 0xCB8
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function burnedkilled(entity)
{
	if(entity getblackboardattribute("_damage_mod") == "mod_burned")
	{
		return true;
	}
	return false;
}

/*
	Name: rapskilled
	Namespace: aiutility
	Checksum: 0x78B941FF
	Offset: 0xD00
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function rapskilled(entity)
{
	if(isdefined(self.attacker) && isdefined(self.attacker.archetype) && self.attacker.archetype == #"raps")
	{
		return true;
	}
	return false;
}

/*
	Name: function_e2010f4c
	Namespace: aiutility
	Checksum: 0x276764A
	Offset: 0xD68
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function function_e2010f4c(entity, var_515373f2)
{
	if(isdefined(entity) && isdefined(var_515373f2.durations) && var_515373f2.durations.size > 0)
	{
		foreach(var_4e73c1e in var_515373f2.durations)
		{
			if(var_4e73c1e.archetype === entity.archetype)
			{
				return var_4e73c1e;
			}
		}
	}
}

/*
	Name: tookflashbangdamage
	Namespace: aiutility
	Checksum: 0xE1870185
	Offset: 0xE40
	Size: 0x9A
	Parameters: 1
	Flags: Linked, Private
*/
function private tookflashbangdamage(entity)
{
	if(isdefined(entity.damageweapon) && isdefined(entity.damagemod))
	{
		weapon = entity.damageweapon;
		if(entity.damagemod == "MOD_GRENADE_SPLASH" && isdefined(self.var_40543c03))
		{
			if(self.var_40543c03 == "foam" || self.var_40543c03 == "flash")
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: bb_getdamagedirection
	Namespace: aiutility
	Checksum: 0x9C2AEE5F
	Offset: 0xEE8
	Size: 0xEE
	Parameters: 0
	Flags: Linked
*/
function bb_getdamagedirection()
{
	/#
		if(isdefined(level._debug_damage_direction))
		{
			return level._debug_damage_direction;
		}
	#/
	if(self.damageyaw > 135 || self.damageyaw <= -135)
	{
		self.damage_direction = "front";
		return "front";
	}
	if(self.damageyaw > 45 && self.damageyaw <= 135)
	{
		self.damage_direction = "right";
		return "right";
	}
	if(self.damageyaw > -45 && self.damageyaw <= 45)
	{
		self.damage_direction = "back";
		return "back";
	}
	self.damage_direction = "left";
	return "left";
}

/*
	Name: function_7e269d82
	Namespace: aiutility
	Checksum: 0xFE42E23F
	Offset: 0xFE0
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_7e269d82()
{
	if(isdefined(self.var_40543c03))
	{
		return self.var_40543c03;
	}
	return "normal";
}

/*
	Name: bb_actorgetdamagelocation
	Namespace: aiutility
	Checksum: 0xDA842B35
	Offset: 0x1008
	Size: 0x38E
	Parameters: 0
	Flags: Linked
*/
function bb_actorgetdamagelocation()
{
	/#
		if(isdefined(level._debug_damage_pain_location))
		{
			return level._debug_damage_pain_location;
		}
	#/
	damagelocation = undefined;
	if(isdefined(self.var_b7884e7f))
	{
		damagelocation = self [[self.var_b7884e7f]]();
	}
	if(!isdefined(damagelocation))
	{
		shitloc = self.damagelocation;
		possiblehitlocations = array();
		if(isdefined(shitloc) && shitloc != "none")
		{
			if(isinarray(array("helmet", "head", "neck"), shitloc))
			{
				possiblehitlocations[possiblehitlocations.size] = "head";
			}
			else
			{
				if(isinarray(array("torso_upper", "torso_mid"), shitloc))
				{
					possiblehitlocations[possiblehitlocations.size] = "chest";
				}
				else
				{
					if(isinarray(array("torso_lower", "groin"), shitloc))
					{
						possiblehitlocations[possiblehitlocations.size] = "groin";
					}
					else
					{
						if(isinarray(array("torso_lower", "groin"), shitloc))
						{
							possiblehitlocations[possiblehitlocations.size] = "legs";
						}
						else
						{
							if(isinarray(array("left_arm_upper", "left_arm_lower", "left_hand"), shitloc))
							{
								possiblehitlocations[possiblehitlocations.size] = "left_arm";
							}
							else
							{
								if(isinarray(array("right_arm_upper", "right_arm_lower", "right_hand", "gun"), shitloc))
								{
									possiblehitlocations[possiblehitlocations.size] = "right_arm";
								}
								else if(isinarray(array("right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot"), shitloc))
								{
									possiblehitlocations[possiblehitlocations.size] = "legs";
								}
							}
						}
					}
				}
			}
		}
		if(possiblehitlocations.size == 0)
		{
			possiblehitlocations[possiblehitlocations.size] = "chest";
			possiblehitlocations[possiblehitlocations.size] = "groin";
		}
		/#
			assert(possiblehitlocations.size > 0, possiblehitlocations.size);
		#/
		damagelocation = possiblehitlocations[randomint(possiblehitlocations.size)];
	}
	return damagelocation;
}

/*
	Name: bb_getdamageweaponclass
	Namespace: aiutility
	Checksum: 0x364CE668
	Offset: 0x13A0
	Size: 0x1BE
	Parameters: 0
	Flags: Linked
*/
function bb_getdamageweaponclass()
{
	if(isdefined(level.var_1516eaca))
	{
		special = self [[level.var_1516eaca]]();
		if(isdefined(special))
		{
			return special;
		}
	}
	if(isdefined(self.damagemod))
	{
		if(isinarray(array("mod_rifle_bullet"), tolower(self.damagemod)))
		{
			return "rifle";
		}
		if(isinarray(array("mod_pistol_bullet"), tolower(self.damagemod)))
		{
			return "pistol";
		}
		if(isinarray(array("mod_melee", "mod_melee_assassinate", "mod_melee_weapon_butt"), tolower(self.damagemod)))
		{
			return "melee";
		}
		if(isinarray(array("mod_grenade", "mod_grenade_splash", "mod_projectile", "mod_projectile_splash", "mod_explosive"), tolower(self.damagemod)))
		{
			return "explosive";
		}
	}
	return "rifle";
}

/*
	Name: bb_getdamageweapon
	Namespace: aiutility
	Checksum: 0x560ED48
	Offset: 0x1568
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function bb_getdamageweapon()
{
	if(isdefined(self.special_weapon) && isdefined(self.special_weapon.name))
	{
		return self.special_weapon.name;
	}
	if(isdefined(self.damageweapon) && isdefined(self.damageweapon.name))
	{
		return self.damageweapon.name;
	}
	return "unknown";
}

/*
	Name: bb_getdamagemod
	Namespace: aiutility
	Checksum: 0x95B22CC5
	Offset: 0x15E8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function bb_getdamagemod()
{
	if(isdefined(self.damagemod))
	{
		return tolower(self.damagemod);
	}
	return "unknown";
}

/*
	Name: function_9144ba8
	Namespace: aiutility
	Checksum: 0xD94318A3
	Offset: 0x1628
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function function_9144ba8()
{
	damagetakentype = "none";
	if(gettime() - self.damagetime < 500)
	{
		if(isdefined(self.var_ec422675))
		{
			return self.var_ec422675;
		}
		ratio = self.damagetaken / 100;
		if(isdefined(self.var_fe72f961))
		{
			damagetakentype = self [[self.var_fe72f961]](ratio);
		}
		else
		{
			if(ratio >= 0.7)
			{
				damagetakentype = "heavy";
			}
			else
			{
				damagetakentype = "light";
			}
		}
	}
	return damagetakentype;
}

/*
	Name: bb_getdamagetaken
	Namespace: aiutility
	Checksum: 0xF4ED90A7
	Offset: 0x16E0
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function bb_getdamagetaken()
{
	/#
		if(isdefined(level._debug_damage_intensity))
		{
			return level._debug_damage_intensity;
		}
	#/
	if(isdefined(self.var_ec422675))
	{
		return self.var_ec422675;
	}
	damagetaken = self.damagetaken;
	if(isdefined(self.var_27feb91e))
	{
		damagetaken = self.var_27feb91e;
	}
	maxhealth = self.maxhealth;
	damagetakentype = "light";
	if(isalive(self))
	{
		ratio = damagetaken / 100;
		if(isdefined(self.var_fe72f961))
		{
			damagetakentype = self [[self.var_fe72f961]](ratio);
		}
		else if(ratio > 0.7)
		{
			damagetakentype = "heavy";
		}
		self.lastdamagetime = gettime();
	}
	else
	{
		ratio = damagetaken / 100;
		if(isdefined(self.var_fe72f961))
		{
			damagetakentype = self [[self.var_fe72f961]](ratio);
		}
		else if(ratio > 0.7)
		{
			damagetakentype = "heavy";
		}
	}
	return damagetakentype;
}

/*
	Name: bb_idgungetdamagedirection
	Namespace: aiutility
	Checksum: 0xF76CF7D5
	Offset: 0x1850
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function bb_idgungetdamagedirection()
{
	if(isdefined(self.damage_direction))
	{
		return self.damage_direction;
	}
	return self bb_getdamagedirection();
}

/*
	Name: bb_actorgetfataldamagelocation
	Namespace: aiutility
	Checksum: 0x9691776
	Offset: 0x1888
	Size: 0x246
	Parameters: 0
	Flags: Linked
*/
function bb_actorgetfataldamagelocation()
{
	/#
		if(isdefined(level._debug_damage_location))
		{
			return level._debug_damage_location;
		}
	#/
	shitloc = self.damagelocation;
	if(isdefined(shitloc))
	{
		if(isinarray(array("helmet", "head", "neck"), shitloc))
		{
			return "head";
		}
		if(isinarray(array("torso_upper", "torso_mid"), shitloc))
		{
			return "chest";
		}
		if(isinarray(array("torso_lower", "groin"), shitloc))
		{
			return "hips";
		}
		if(isinarray(array("right_arm_upper", "right_arm_lower", "right_hand", "gun"), shitloc))
		{
			return "right_arm";
		}
		if(isinarray(array("left_arm_upper", "left_arm_lower", "left_hand"), shitloc))
		{
			return "left_arm";
		}
		if(isinarray(array("right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot"), shitloc))
		{
			return "legs";
		}
	}
	randomlocs = array("chest", "hips");
	return randomlocs[randomint(randomlocs.size)];
}

/*
	Name: addaioverridedamagecallback
	Namespace: aiutility
	Checksum: 0xD559E8BC
	Offset: 0x1AD8
	Size: 0x23C
	Parameters: 3
	Flags: Linked
*/
function addaioverridedamagecallback(entity, callback, addtofront)
{
	/#
		assert(isentity(entity));
	#/
	/#
		assert(isfunctionptr(callback));
	#/
	/#
		assert(!isdefined(entity.aioverridedamage) || isarray(entity.aioverridedamage));
	#/
	if(!isdefined(entity.aioverridedamage))
	{
		entity.aioverridedamage = [];
	}
	else if(!isarray(entity.aioverridedamage))
	{
		entity.aioverridedamage = array(entity.aioverridedamage);
	}
	if(is_true(addtofront))
	{
		damageoverrides = [];
		damageoverrides[damageoverrides.size] = callback;
		foreach(override in entity.aioverridedamage)
		{
			damageoverrides[damageoverrides.size] = override;
		}
		entity.aioverridedamage = damageoverrides;
	}
	else
	{
		if(!isdefined(entity.aioverridedamage))
		{
			entity.aioverridedamage = [];
		}
		else if(!isarray(entity.aioverridedamage))
		{
			entity.aioverridedamage = array(entity.aioverridedamage);
		}
		entity.aioverridedamage[entity.aioverridedamage.size] = callback;
	}
}

/*
	Name: removeaioverridedamagecallback
	Namespace: aiutility
	Checksum: 0xF5FF6786
	Offset: 0x1D20
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function removeaioverridedamagecallback(entity, callback)
{
	/#
		assert(isentity(entity));
	#/
	/#
		assert(isfunctionptr(callback));
	#/
	/#
		assert(isarray(entity.aioverridedamage));
	#/
	currentdamagecallbacks = entity.aioverridedamage;
	entity.aioverridedamage = [];
	foreach(value in currentdamagecallbacks)
	{
		if(value != callback)
		{
			entity.aioverridedamage[entity.aioverridedamage.size] = value;
		}
	}
}

/*
	Name: clearaioverridedamagecallbacks
	Namespace: aiutility
	Checksum: 0x7F611D6A
	Offset: 0x1E70
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function clearaioverridedamagecallbacks(entity)
{
	entity.aioverridedamage = [];
}

/*
	Name: addaioverridekilledcallback
	Namespace: aiutility
	Checksum: 0x7C8B015F
	Offset: 0x1E90
	Size: 0x11C
	Parameters: 2
	Flags: Linked
*/
function addaioverridekilledcallback(entity, callback)
{
	/#
		assert(isentity(entity));
	#/
	/#
		assert(isfunctionptr(callback));
	#/
	/#
		assert(!isdefined(entity.aioverridekilled) || isarray(entity.aioverridekilled));
	#/
	if(!isdefined(entity.aioverridekilled))
	{
		entity.aioverridekilled = [];
	}
	else if(!isarray(entity.aioverridekilled))
	{
		entity.aioverridekilled = array(entity.aioverridekilled);
	}
	entity.aioverridekilled[entity.aioverridekilled.size] = callback;
}

