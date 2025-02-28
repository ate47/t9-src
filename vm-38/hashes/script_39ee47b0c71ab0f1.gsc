#using scripts\core_common\lui_shared.csc;

class czm_trial_weapon_locked : cLUIelem
{

	/*
		Name: constructor
		Namespace: czm_trial_weapon_locked
		Checksum: 0x50D4A747
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_trial_weapon_locked
		Checksum: 0x7059FDB2
		Offset: 0x4D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_1e74977
		Namespace: czm_trial_weapon_locked
		Checksum: 0x73C8BDB9
		Offset: 0x460
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_1e74977(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "show_icon");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "show_icon", new_val);
	}

	/*
		Name: open
		Namespace: czm_trial_weapon_locked
		Checksum: 0xAB2F901B
		Offset: 0x430
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: czm_trial_weapon_locked
		Checksum: 0x231AA368
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cLUIelem::register_clientside("zm_trial_weapon_locked");
	}

	/*
		Name: setup_clientfields
		Namespace: czm_trial_weapon_locked
		Checksum: 0xB753C22D
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_18c795d0)
	{
		cLUIelem::setup_clientfields("zm_trial_weapon_locked");
		cLUIelem::add_clientfield("show_icon", 1, 1, "counter", var_18c795d0);
	}

	/*
		Name: function_fa582112
		Namespace: czm_trial_weapon_locked
		Checksum: 0xB983646F
		Offset: 0x3E8
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "show_icon", 0);
	}

}

#namespace zm_trial_weapon_locked;

/*
	Name: function_76cbbb1a
	Namespace: zm_trial_weapon_locked
	Checksum: 0x23FBF0A5
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_76cbbb1a()
{
	level notify(236353079);
}

/*
	Name: register
	Namespace: zm_trial_weapon_locked
	Checksum: 0xED2A2CB1
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_18c795d0)
{
	elem = new czm_trial_weapon_locked();
	[[ elem ]]->setup_clientfields(var_18c795d0);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_weapon_locked"]))
	{
		level.var_ae746e8f[#"zm_trial_weapon_locked"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_weapon_locked"]))
	{
		level.var_ae746e8f[#"zm_trial_weapon_locked"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_trial_weapon_locked"]))
	{
		level.var_ae746e8f[#"zm_trial_weapon_locked"] = array(level.var_ae746e8f[#"zm_trial_weapon_locked"]);
	}
	level.var_ae746e8f[#"zm_trial_weapon_locked"][level.var_ae746e8f[#"zm_trial_weapon_locked"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_trial_weapon_locked
	Checksum: 0xF312C59B
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new czm_trial_weapon_locked();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_weapon_locked
	Checksum: 0xAB7C1ABF
	Offset: 0x2A8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: zm_trial_weapon_locked
	Checksum: 0x2C2BB37
	Offset: 0x2D0
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
	Namespace: zm_trial_weapon_locked
	Checksum: 0x71B19878
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_1e74977
	Namespace: zm_trial_weapon_locked
	Checksum: 0xCB27C72A
	Offset: 0x320
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_1e74977(localclientnum)
{
	[[ self ]]->function_1e74977(localclientnum);
}

