#using script_8988fdbc78d6c53;
#using scripts\core_common\system_shared.gsc;

#namespace claymore;

/*
	Name: function_89f2df9
	Namespace: claymore
	Checksum: 0xE27B2821
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"claymore", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: claymore
	Checksum: 0x7242489D
	Offset: 0xE8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	weaponobjects::function_e6400478("claymore", &createclaymorewatcher, 0);
}

/*
	Name: createclaymorewatcher
	Namespace: claymore
	Checksum: 0x986020B2
	Offset: 0x120
	Size: 0x252
	Parameters: 1
	Flags: None
*/
function createclaymorewatcher(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = undefined;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.var_8eda8949 = (0, 0, 0);
	var_e2fa0bc6 = getweapon(#"claymore");
	if(isdefined(var_e2fa0bc6.var_4dd46f8a))
	{
		var_e6fbac16 = getscriptbundle(var_e2fa0bc6.var_4dd46f8a);
		/#
			assert(isdefined(var_e6fbac16));
		#/
		watcher.detectiondot = cos((isdefined(var_e6fbac16.var_bec17b8b) ? var_e6fbac16.var_bec17b8b : 0));
		watcher.detectionmindist = (isdefined(var_e6fbac16.var_5303bdc6) ? var_e6fbac16.var_5303bdc6 : 0);
		watcher.detectiongraceperiod = (isdefined(var_e6fbac16.var_88b0248b) ? var_e6fbac16.var_88b0248b : 0);
		if(isdefined(var_e6fbac16.var_29467698) && var_e6fbac16.var_29467698 != 0)
		{
			watcher.detonateradius = var_e6fbac16.var_29467698;
		}
	}
	watcher.stuntime = 1;
	watcher.ondetonatecallback = &weaponobjects::proximitydetonate;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &function_c9893179;
	watcher.stun = &weaponobjects::weaponstun;
	watcher.var_994b472b = &function_aeb91d3;
}

/*
	Name: function_aeb91d3
	Namespace: claymore
	Checksum: 0x5AB90AC6
	Offset: 0x380
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_aeb91d3(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_c9893179
	Namespace: claymore
	Checksum: 0x828FA748
	Offset: 0x3B0
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_c9893179(watcher, player)
{
	weaponobjects::onspawnproximitygrenadeweaponobject(watcher, player);
	self.weapon = getweapon(#"claymore");
}

