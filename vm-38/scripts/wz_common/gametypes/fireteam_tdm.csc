#using scripts\core_common\player\player_insertion.csc;
#using script_78825cbb1ab9f493;

#namespace fireteam_tdm;

/*
	Name: function_fd52c48d
	Namespace: fireteam_tdm
	Checksum: 0xF9D35DF7
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fd52c48d()
{
	level notify(219809791);
}

/*
	Name: main
	Namespace: fireteam_tdm
	Checksum: 0xED613C05
	Offset: 0x90
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
}

