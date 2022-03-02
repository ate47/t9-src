#using script_3497a6bd0a70a607;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_4bf952f6ba31bb17;
#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_a3cd8b9a;

/*
	Name: function_f76ef8db
	Namespace: namespace_a3cd8b9a
	Checksum: 0xA06ED270
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f76ef8db()
{
	level notify(868734006);
}

#namespace namespace_a216c96;

/*
	Name: main
	Namespace: namespace_a216c96
	Checksum: 0xA82C0324
	Offset: 0x100
	Size: 0x84
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"catalyst", &function_728127b);
	spawner::add_archetype_spawn_function(#"catalyst", &function_5608540a);
	namespace_c61045a2::registercatalystinterfaceattributes();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_a216c96
	Checksum: 0x57B8B711
	Offset: 0x190
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_1fbc23ff));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_153840ec538cefce", &function_1fbc23ff);
	animationstatenetwork::registeranimationmocomp("mocomp_teleport_traversal@catalyst", &function_720a0584, undefined, undefined);
}

/*
	Name: function_1fbc23ff
	Namespace: namespace_a216c96
	Checksum: 0x77E4C2D8
	Offset: 0x238
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_1fbc23ff(entity)
{
	return self.archetype === #"catalyst";
}

/*
	Name: function_5608540a
	Namespace: namespace_a216c96
	Checksum: 0xC676403F
	Offset: 0x268
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_5608540a()
{
	self.zombie_move_speed = "walk";
	var_9d3ec6f = [];
	var_9d3ec6f[#"hash_78ca8e8e6bdbc8ab"] = 1;
	var_9d3ec6f[#"hash_266b62e342076a90"] = 3;
	var_9d3ec6f[#"hash_5cfa99582cc66c59"] = 2;
	var_9d3ec6f[#"hash_5d6b55906fc82ff2"] = 4;
	if(isdefined(self.var_9fde8624) && isdefined(var_9d3ec6f[self.var_9fde8624]))
	{
		function_27c82a36(self, var_9d3ec6f[self.var_9fde8624]);
	}
}

/*
	Name: function_728127b
	Namespace: namespace_a216c96
	Checksum: 0xE75E4209
	Offset: 0x330
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_728127b()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_dc16721f;
}

/*
	Name: function_27c82a36
	Namespace: namespace_a216c96
	Checksum: 0x171D584D
	Offset: 0x388
	Size: 0x16A
	Parameters: 2
	Flags: Linked
*/
function function_27c82a36(entity, var_62e81e47)
{
	entity function_b7e4069(var_62e81e47);
	if(isdefined(level.var_f6d5bd0c))
	{
		if(level.var_f6d5bd0c[0].size > 0)
		{
			foreach(spawn_func in level.var_f6d5bd0c[0])
			{
				entity [[spawn_func]]();
			}
		}
		if(level.var_f6d5bd0c[var_62e81e47].size > 0)
		{
			foreach(spawn_func in level.var_f6d5bd0c[var_62e81e47])
			{
				entity [[spawn_func]]();
			}
		}
	}
	return entity;
}

/*
	Name: function_84c6177b
	Namespace: namespace_a216c96
	Checksum: 0x5FC3945A
	Offset: 0x500
	Size: 0xD8
	Parameters: 3
	Flags: None
*/
function function_84c6177b(spawner, var_62e81e47, location)
{
	spawner.script_forcespawn = 1;
	entity = zombie_utility::spawn_zombie(spawner, undefined, location);
	if(!isdefined(entity))
	{
		return;
	}
	if(isdefined(entity.var_62e81e47))
	{
		return;
	}
	entity = function_27c82a36(entity, var_62e81e47);
	if(!isdefined(location.angles))
	{
		angles = (0, 0, 0);
	}
	else
	{
		angles = location.angles;
	}
	entity forceteleport(location.origin, angles);
	return entity;
}

/*
	Name: function_b7e4069
	Namespace: namespace_a216c96
	Checksum: 0x9F8BDC7A
	Offset: 0x5E0
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b7e4069(var_62e81e47)
{
	self.var_62e81e47 = var_62e81e47;
}

/*
	Name: function_dc16721f
	Namespace: namespace_a216c96
	Checksum: 0xDE316B10
	Offset: 0x608
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dc16721f(entity)
{
	entity.__blackboard = undefined;
	entity function_728127b();
}

/*
	Name: function_8f9b9d24
	Namespace: namespace_a216c96
	Checksum: 0x6C122579
	Offset: 0x640
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_8f9b9d24(var_62e81e47, func)
{
	if(!isdefined(level.var_f6d5bd0c))
	{
		level.var_f6d5bd0c = [];
		level.var_f6d5bd0c[0] = [];
		level.var_f6d5bd0c[1] = [];
		level.var_f6d5bd0c[3] = [];
		level.var_f6d5bd0c[2] = [];
		level.var_f6d5bd0c[4] = [];
	}
	if(isdefined(level.var_f6d5bd0c[var_62e81e47]))
	{
		level.var_f6d5bd0c[var_62e81e47][level.var_f6d5bd0c[var_62e81e47].size] = func;
	}
}

/*
	Name: function_720a0584
	Namespace: namespace_a216c96
	Checksum: 0xDE350F3E
	Offset: 0x700
	Size: 0x174
	Parameters: 5
	Flags: Linked
*/
function function_720a0584(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face angle", mocompduration.angles[1]);
	mocompduration animmode("normal");
	if(isdefined(mocompduration.traverseendnode))
	{
		/#
			print3d(mocompduration.traversestartnode.origin, "", (1, 0, 0), 1, 1, 60);
			print3d(mocompduration.traverseendnode.origin, "", (0, 1, 0), 1, 1, 60);
			line(mocompduration.traversestartnode.origin, mocompduration.traverseendnode.origin, (0, 1, 0), 1, 0, 60);
		#/
		mocompduration forceteleport(mocompduration.traverseendnode.origin, mocompduration.traverseendnode.angles, 0);
	}
}

