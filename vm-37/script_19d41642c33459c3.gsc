#using script_64ac23dbb2d7d587;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_6c80b2d;

/*
	Name: function_89f2df9
	Namespace: namespace_6c80b2d
	Checksum: 0x1B6A559
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7b0eae528185fda9", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6c80b2d
	Checksum: 0x187E28DA
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register_clientfields();
}

/*
	Name: register_clientfields
	Namespace: namespace_6c80b2d
	Checksum: 0x27766483
	Offset: 0x108
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private register_clientfields()
{
	clientfield::register("vehicle", "" + #"hash_2d5a2cd7892a4fdc", 1, 1, "counter", &function_a874e85b, 0, 0);
	clientfield::register("missile", "" + #"hash_2d5a2cd7892a4fdc", 1, 1, "counter", &function_a874e85b, 0, 0);
}

/*
	Name: function_a874e85b
	Namespace: namespace_6c80b2d
	Checksum: 0xA1D45670
	Offset: 0x1C8
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function function_a874e85b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self weaponobjects::updateenemyequipment(bwastimejump);
}

