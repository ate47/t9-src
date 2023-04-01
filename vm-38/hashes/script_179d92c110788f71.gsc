#using scripts\core_common\lui_shared.gsc;

class cDOA_Overworld : cLUIelem
{

	/*
		Name: constructor
		Namespace: cDOA_Overworld
		Checksum: 0x26EA4E8B
		Offset: 0x198
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cDOA_Overworld
		Checksum: 0x95BBD3FC
		Offset: 0x258
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cDOA_Overworld
		Checksum: 0x8EFC0DC
		Offset: 0x1E0
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cLUIelem::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: cDOA_Overworld
		Checksum: 0x335296BF
		Offset: 0x228
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cLUIelem::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cDOA_Overworld
		Checksum: 0xC3C53A14
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("DOA_Overworld");
	}

}

#namespace doa_overworld;

/*
	Name: function_975d508a
	Namespace: doa_overworld
	Checksum: 0x52ADC444
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_975d508a()
{
	level notify(1535432394);
}

/*
	Name: register
	Namespace: doa_overworld
	Checksum: 0x92B0187F
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cDOA_Overworld();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_overworld
	Checksum: 0x83B95F3F
	Offset: 0x108
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: doa_overworld
	Checksum: 0xDE74B2A0
	Offset: 0x148
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: doa_overworld
	Checksum: 0x686D9D85
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

