#using scripts\core_common\lui_shared.csc;

class cLUIelemText : cLUIelem
{

	/*
		Name: constructor
		Namespace: cLUIelemText
		Checksum: 0xCB39AE69
		Offset: 0x5B8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cLUIelemText
		Checksum: 0x1800AD65
		Offset: 0xBD8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cLUIelemText
		Checksum: 0x64CF93D3
		Offset: 0x978
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: cLUIelemText
		Checksum: 0xFC1471EC
		Offset: 0xBA0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_horizontal_alignment(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "horizontal_alignment", value);
	}

	/*
		Name: set_green
		Namespace: cLUIelemText
		Checksum: 0x9EAE093B
		Offset: 0xAF8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_green(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "green", value);
	}

	/*
		Name: set_fadeOverTime
		Namespace: cLUIelemText
		Checksum: 0x380800C4
		Offset: 0xA50
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_fadeOverTime(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: cLUIelemText
		Checksum: 0x50AED88C
		Offset: 0x7E0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("LUIelemText");
	}

	/*
		Name: set_height
		Namespace: cLUIelemText
		Checksum: 0xFCBE7350
		Offset: 0xA18
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_height(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "height", value);
	}

	/*
		Name: set_blue
		Namespace: cLUIelemText
		Checksum: 0x4BB35CD
		Offset: 0xB30
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cLUIelemText
		Checksum: 0xB23FEB96
		Offset: 0x5D8
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, heightcallback, fadeOverTimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback)
	{
		cLUIelem::setup_clientfields("LUIelemText");
		cLUIelem::function_da693cbe("x", 1, 7, "int", ycallback);
		cLUIelem::function_da693cbe("y", 1, 6, "int", heightcallback);
		cLUIelem::function_da693cbe("height", 1, 2, "int", fadeOverTimecallback);
		cLUIelem::function_da693cbe("fadeOverTime", 1, 5, "int", alphacallback);
		cLUIelem::function_da693cbe("alpha", 1, 4, "float", redcallback);
		cLUIelem::function_da693cbe("red", 1, 4, "float", greencallback);
		cLUIelem::function_da693cbe("green", 1, 4, "float", bluecallback);
		cLUIelem::function_da693cbe("blue", 1, 4, "float", var_f5852d69);
		cLUIelem::function_dcb34c80("string", "text", 1);
		cLUIelem::function_da693cbe("horizontal_alignment", 1, 2, "int", horizontal_alignmentcallback);
	}

	/*
		Name: set_y
		Namespace: cLUIelemText
		Checksum: 0x51A768AF
		Offset: 0x9E0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_y(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "y", value);
	}

	/*
		Name: set_alpha
		Namespace: cLUIelemText
		Checksum: 0xE979E188
		Offset: 0xA88
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_alpha(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", value);
	}

	/*
		Name: set_x
		Namespace: cLUIelemText
		Checksum: 0x5BD53FC8
		Offset: 0x9A8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "x", value);
	}

	/*
		Name: set_text
		Namespace: cLUIelemText
		Checksum: 0x514FB6BC
		Offset: 0xB68
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: set_red
		Namespace: cLUIelemText
		Checksum: 0x4FF7D1EB
		Offset: 0xAC0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_red(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: cLUIelemText
		Checksum: 0xE308FB33
		Offset: 0x808
		Size: 0x168
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "x", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "y", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "height", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "red", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "green", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "horizontal_alignment", 0);
	}

}

#namespace luielemtext;

/*
	Name: function_6928b1e8
	Namespace: luielemtext
	Checksum: 0x6D3B8365
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6928b1e8()
{
	level notify(435270559);
}

/*
	Name: register
	Namespace: luielemtext
	Checksum: 0x7684B2BF
	Offset: 0x148
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(xcallback, ycallback, heightcallback, fadeOverTimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback)
{
	elem = new cLUIelemText();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, heightcallback, fadeOverTimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = array(level.var_ae746e8f[#"luielemtext"]);
	}
	level.var_ae746e8f[#"luielemtext"][level.var_ae746e8f[#"luielemtext"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: luielemtext
	Checksum: 0xDAF63F64
	Offset: 0x320
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new cLUIelemText();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: luielemtext
	Checksum: 0x19478C4E
	Offset: 0x360
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: luielemtext
	Checksum: 0x8A5D6F94
	Offset: 0x388
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
	Namespace: luielemtext
	Checksum: 0x7F38FA4B
	Offset: 0x3B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_x
	Namespace: luielemtext
	Checksum: 0x55093B1F
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_x(localclientnum, value)
{
	[[ self ]]->set_x(localclientnum, value);
}

/*
	Name: set_y
	Namespace: luielemtext
	Checksum: 0xA866CBCD
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: set_height
	Namespace: luielemtext
	Checksum: 0x690919C5
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_height(localclientnum, value)
{
	[[ self ]]->set_height(localclientnum, value);
}

/*
	Name: set_fadeOverTime
	Namespace: luielemtext
	Checksum: 0xCCD835FA
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeOverTime(localclientnum, value)
{
	[[ self ]]->set_fadeOverTime(localclientnum, value);
}

/*
	Name: set_alpha
	Namespace: luielemtext
	Checksum: 0xB753F236
	Offset: 0x498
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(localclientnum, value)
{
	[[ self ]]->set_alpha(localclientnum, value);
}

/*
	Name: set_red
	Namespace: luielemtext
	Checksum: 0xC18B8BE0
	Offset: 0x4C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_red(localclientnum, value)
{
	[[ self ]]->set_red(localclientnum, value);
}

/*
	Name: set_green
	Namespace: luielemtext
	Checksum: 0xE52BF041
	Offset: 0x4F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_green(localclientnum, value)
{
	[[ self ]]->set_green(localclientnum, value);
}

/*
	Name: set_blue
	Namespace: luielemtext
	Checksum: 0xC8145105
	Offset: 0x528
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_text
	Namespace: luielemtext
	Checksum: 0xC1F623C1
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: luielemtext
	Checksum: 0xE13BB230
	Offset: 0x588
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

