#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class czm_tungsten_title_cards : cLUIelem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_tungsten_title_cards
		Checksum: 0xBD4A911F
		Offset: 0x1F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_tungsten_title_cards
		Checksum: 0x49280ECB
		Offset: 0x330
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_tungsten_title_cards
		Checksum: 0xC33F5B39
		Offset: 0x268
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cLUIelem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: czm_tungsten_title_cards
		Checksum: 0xCA130BEC
		Offset: 0x2B0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cLUIelem::close_luielem(player);
	}

	/*
		Name: set_is_title_card_02
		Namespace: czm_tungsten_title_cards
		Checksum: 0xE631B585
		Offset: 0x2E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_is_title_card_02(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "is_title_card_02", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_tungsten_title_cards
		Checksum: 0x95532199
		Offset: 0x218
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cLUIelem::setup_clientfields("zm_tungsten_title_cards");
		cLUIelem::add_clientfield("is_title_card_02", 4000, 1, "int");
	}

}

#namespace zm_tungsten_title_cards;

/*
	Name: function_6365072c
	Namespace: zm_tungsten_title_cards
	Checksum: 0xDF67B9EB
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6365072c()
{
	level notify(1188439486);
}

/*
	Name: register
	Namespace: zm_tungsten_title_cards
	Checksum: 0x97CBB6A4
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new czm_tungsten_title_cards();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_tungsten_title_cards
	Checksum: 0xAA4B8EB3
	Offset: 0x138
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: zm_tungsten_title_cards
	Checksum: 0xF8A9CA82
	Offset: 0x178
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_tungsten_title_cards
	Checksum: 0xA2C3BD60
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_is_title_card_02
	Namespace: zm_tungsten_title_cards
	Checksum: 0x48DE785
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_is_title_card_02(player, value)
{
	[[ self ]]->set_is_title_card_02(player, value);
}

