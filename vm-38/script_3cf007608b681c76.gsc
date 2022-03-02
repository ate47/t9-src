#using scripts\core_common\lui_shared.gsc;

class class_b20c2804 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b20c2804
		Checksum: 0x53FEFE1D
		Offset: 0x298
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b20c2804
		Checksum: 0xC93F394D
		Offset: 0x528
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b20c2804
		Checksum: 0xDF4E5F22
		Offset: 0x2E0
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_4f6e830d
		Namespace: namespace_b20c2804
		Checksum: 0x44E8EB2C
		Offset: 0x478
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_4f6e830d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

	/*
		Name: close
		Namespace: namespace_b20c2804
		Checksum: 0x25468508
		Offset: 0x328
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_61312692
		Namespace: namespace_b20c2804
		Checksum: 0xC62228AC
		Offset: 0x420
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_61312692(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: function_7ddfdfef
		Namespace: namespace_b20c2804
		Checksum: 0x6F50056
		Offset: 0x4D0
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_7ddfdfef(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b20c2804
		Checksum: 0xDFCA18D2
		Offset: 0x2B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextBubble");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_b20c2804
		Checksum: 0x331A2767
		Offset: 0x358
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 0);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_b20c2804
		Checksum: 0xC53329BB
		Offset: 0x3B0
		Size: 0x64
		Parameters: 2
		Flags: None
	*/
	function function_d5ea17f0(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, function_f2d511a6("string", value), 0);
	}

}

#namespace doa_textbubble;

/*
	Name: function_f35a204
	Namespace: doa_textbubble
	Checksum: 0xA350B1FF
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f35a204()
{
	level notify(1894827777);
}

/*
	Name: register
	Namespace: doa_textbubble
	Checksum: 0x75A63B0E
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_b20c2804();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_textbubble
	Checksum: 0x22B7D0A0
	Offset: 0x118
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
	Namespace: doa_textbubble
	Checksum: 0xBEEC1AC2
	Offset: 0x158
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
	Namespace: doa_textbubble
	Checksum: 0xD0CA6291
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_c8350e33
	Namespace: doa_textbubble
	Checksum: 0x211934FB
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(player, value)
{
	[[ self ]]->function_c8350e33(player, value);
}

/*
	Name: function_d5ea17f0
	Namespace: doa_textbubble
	Checksum: 0xB55C6D8B
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(player, value)
{
	[[ self ]]->function_d5ea17f0(player, value);
}

/*
	Name: function_61312692
	Namespace: doa_textbubble
	Checksum: 0x1D0324AA
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_61312692(player, value)
{
	[[ self ]]->function_61312692(player, value);
}

/*
	Name: function_4f6e830d
	Namespace: doa_textbubble
	Checksum: 0x6EB18DBA
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4f6e830d(player, value)
{
	[[ self ]]->function_4f6e830d(player, value);
}

/*
	Name: function_7ddfdfef
	Namespace: doa_textbubble
	Checksum: 0xF693605A
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7ddfdfef(player, value)
{
	[[ self ]]->function_7ddfdfef(player, value);
}

