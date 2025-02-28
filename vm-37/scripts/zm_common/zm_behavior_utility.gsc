#using script_3aa0f32b70d4f7cb;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_6809bf766eba194a;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_spawner.gsc;

#namespace zm_behavior_utility;

/*
	Name: setupattackproperties
	Namespace: zm_behavior_utility
	Checksum: 0x60E75163
	Offset: 0xC8
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function setupattackproperties()
{
	self val::reset(#"hash_62fca810699077f3", "ignoreall");
	self.meleeattackdist = 64;
}

/*
	Name: enteredplayablearea
	Namespace: zm_behavior_utility
	Checksum: 0x7DE7DFEB
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function enteredplayablearea()
{
	self zm_spawner::zombie_complete_emerging_into_playable_area();
	self.pushable = 1;
	self setupattackproperties();
}

