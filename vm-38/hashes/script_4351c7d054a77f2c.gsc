#using scripts\core_common\lui_shared.csc;

class cSpectreRisingIndicator : cLUIelem
{

	/*
		Name: constructor
		Namespace: cSpectreRisingIndicator
		Checksum: 0xB776CD1A
		Offset: 0x390
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cSpectreRisingIndicator
		Checksum: 0x4DDD4D34
		Offset: 0x568
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cSpectreRisingIndicator
		Checksum: 0x67E5735
		Offset: 0x4C8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_clientnum
		Namespace: cSpectreRisingIndicator
		Checksum: 0xD09E8A22
		Offset: 0x4F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: cSpectreRisingIndicator
		Checksum: 0xA76C33
		Offset: 0x438
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("SpectreRisingIndicator");
	}

	/*
		Name: set_isAlive
		Namespace: cSpectreRisingIndicator
		Checksum: 0x3C5A0B5F
		Offset: 0x530
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_isAlive(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "isAlive", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cSpectreRisingIndicator
		Checksum: 0x22A1B197
		Offset: 0x3B0
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_c05c67e2, var_f25b9f45)
	{
		cLUIelem::setup_clientfields("SpectreRisingIndicator");
		cLUIelem::function_da693cbe("clientnum", 1, 7, "int", var_c05c67e2);
		cLUIelem::function_da693cbe("isAlive", 1, 1, "int", var_f25b9f45);
	}

	/*
		Name: function_fa582112
		Namespace: cSpectreRisingIndicator
		Checksum: 0x17F0D1A5
		Offset: 0x460
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "isAlive", 0);
	}

}

#namespace spectrerisingindicator;

/*
	Name: function_654ee4fb
	Namespace: spectrerisingindicator
	Checksum: 0xAA397718
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_654ee4fb()
{
	level notify(1305863389);
}

/*
	Name: register
	Namespace: spectrerisingindicator
	Checksum: 0x92BEEF54
	Offset: 0xF0
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_c05c67e2, var_f25b9f45)
{
	elem = new cSpectreRisingIndicator();
	[[ elem ]]->setup_clientfields(var_c05c67e2, var_f25b9f45);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"spectrerisingindicator"]))
	{
		level.var_ae746e8f[#"spectrerisingindicator"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"spectrerisingindicator"]))
	{
		level.var_ae746e8f[#"spectrerisingindicator"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"spectrerisingindicator"]))
	{
		level.var_ae746e8f[#"spectrerisingindicator"] = array(level.var_ae746e8f[#"spectrerisingindicator"]);
	}
	level.var_ae746e8f[#"spectrerisingindicator"][level.var_ae746e8f[#"spectrerisingindicator"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: spectrerisingindicator
	Checksum: 0x2E88A5B9
	Offset: 0x278
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new cSpectreRisingIndicator();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: spectrerisingindicator
	Checksum: 0x73AC483
	Offset: 0x2B8
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
	Namespace: spectrerisingindicator
	Checksum: 0x307E05D3
	Offset: 0x2E0
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
	Namespace: spectrerisingindicator
	Checksum: 0xD39C071E
	Offset: 0x308
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_clientnum
	Namespace: spectrerisingindicator
	Checksum: 0xF65160FF
	Offset: 0x330
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_isAlive
	Namespace: spectrerisingindicator
	Checksum: 0x45AAB21A
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isAlive(localclientnum, value)
{
	[[ self ]]->set_isAlive(localclientnum, value);
}

