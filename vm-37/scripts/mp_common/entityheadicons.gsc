#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace entityheadicons;

/*
	Name: function_89f2df9
	Namespace: entityheadicons
	Checksum: 0xE371E522
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"entityheadicons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: entityheadicons
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

