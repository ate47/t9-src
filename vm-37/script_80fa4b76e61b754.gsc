#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_bonfire_sale;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0xB725DBEA
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_bonfire_sale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0xBE4DC3BC
	Offset: 0xE8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("bonfire_sale");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("bonfire_sale", "powerup_bon_fire");
	}
}

