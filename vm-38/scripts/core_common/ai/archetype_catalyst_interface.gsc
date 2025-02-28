#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\zombie.gsc;

#namespace archetype_catalyst_interface;

/*
	Name: function_babd9b9b
	Namespace: archetype_catalyst_interface
	Checksum: 0xAF657B15
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_babd9b9b()
{
	level notify(2129195837);
}

#namespace catalystinterface;

/*
	Name: registercatalystinterfaceattributes
	Namespace: catalystinterface
	Checksum: 0xDA08DD19
	Offset: 0xA8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function registercatalystinterfaceattributes()
{
	ai::registermatchedinterface(#"catalyst", #"gravity", "normal", array("low", "normal"), &zombiebehavior::function_db26137a);
}

