#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_items;

/*
	Name: function_a6263d6b
	Namespace: zm_items
	Checksum: 0x5631C62A
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a6263d6b()
{
	level notify(834898071);
}

/*
	Name: __init__system__
	Namespace: zm_items
	Checksum: 0x6CCC7E79
	Offset: 0x118
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_items", &function_70a657d8, &postinit, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_items
	Checksum: 0x2C4D6C0B
	Offset: 0x170
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_ddfee332))
	{
		level.var_ddfee332 = 0;
	}
	if(!isdefined(level.item_list))
	{
		level.item_list = [];
	}
	if(!isdefined(level.item_spawns))
	{
		level.item_spawns = [];
	}
	if(!isdefined(level.item_inventory))
	{
		level.item_inventory = [];
	}
	if(!isdefined(level.item_callbacks))
	{
		level.item_callbacks = [];
	}
	clientfield::register("item", "highlight_item", 1, 2, "int");
	callback::on_spawned(&player_on_spawned);
}

/*
	Name: postinit
	Namespace: zm_items
	Checksum: 0xA279E73B
	Offset: 0x260
	Size: 0x3A0
	Parameters: 0
	Flags: Linked, Private
*/
function private postinit()
{
	a_items = getitemarray();
	foreach(item in a_items)
	{
		w_item = item.item;
		if(isdefined(w_item) && is_true(w_item.craftitem))
		{
			tname = w_item;
			if(!isdefined(level.item_spawns[tname]))
			{
				level.item_spawns[tname] = [];
			}
			if(!isdefined(level.item_spawns[tname]))
			{
				level.item_spawns[tname] = [];
			}
			else if(!isarray(level.item_spawns[tname]))
			{
				level.item_spawns[tname] = array(level.item_spawns[tname]);
			}
			level.item_spawns[tname][level.item_spawns[tname].size] = item;
			if(!isdefined(level.item_list))
			{
				level.item_list = [];
			}
			else if(!isarray(level.item_list))
			{
				level.item_list = array(level.item_list);
			}
			if(!isinarray(level.item_list, w_item))
			{
				level.item_list[level.item_list.size] = w_item;
			}
		}
	}
	foreach(a_items in level.item_spawns)
	{
		var_b38ebe37 = a_items[0].item.var_ec2cbce2;
		if(isdefined(level.var_fd2e6f70))
		{
			a_items = [[level.var_fd2e6f70]](a_items);
		}
		else
		{
			a_items = array::randomize(a_items);
		}
		var_7a1b3d24 = 0;
		/#
			var_7a1b3d24 = getdvarint(#"hash_7f8707c59bcda3cb", 0);
		#/
		if(var_7a1b3d24 === 0)
		{
			if(a_items.size > var_b38ebe37)
			{
				for(i = var_b38ebe37; i < a_items.size; i++)
				{
					a_items[i] delete();
				}
			}
		}
	}
	level thread function_307756a0();
	/#
	#/
}

/*
	Name: player_on_spawned
	Namespace: zm_items
	Checksum: 0x3B4EDA0C
	Offset: 0x608
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function player_on_spawned()
{
	if(!isdefined(self.item_inventory))
	{
		self.item_inventory = [];
	}
	if(!isdefined(self.item_slot_inventory))
	{
		self.item_slot_inventory = [];
	}
}

/*
	Name: function_4d230236
	Namespace: zm_items
	Checksum: 0xE98AAB1
	Offset: 0x648
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function function_4d230236(w_item, fn_callback)
{
	if(!isdefined(level.item_callbacks))
	{
		level.item_callbacks = [];
	}
	if(!isdefined(level.item_callbacks[w_item]))
	{
		level.item_callbacks[w_item] = [];
	}
	if(!isdefined(level.item_callbacks[w_item]))
	{
		level.item_callbacks[w_item] = [];
	}
	else if(!isarray(level.item_callbacks[w_item]))
	{
		level.item_callbacks[w_item] = array(level.item_callbacks[w_item]);
	}
	level.item_callbacks[w_item][level.item_callbacks[w_item].size] = fn_callback;
}

/*
	Name: function_307756a0
	Namespace: zm_items
	Checksum: 0x39A0643D
	Offset: 0x748
	Size: 0x68
	Parameters: 0
	Flags: Linked, Private
*/
function private function_307756a0()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"player_bled_out");
		player = waitresult.player;
		player thread function_b64c32cf(player);
	}
}

/*
	Name: function_b64c32cf
	Namespace: zm_items
	Checksum: 0x32C61B32
	Offset: 0x7B8
	Size: 0x108
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b64c32cf(player)
{
	foreach(item in level.item_list)
	{
		if(item.var_337fc1cf && is_true(player.item_inventory[item]))
		{
			if(item.var_9fffdcee)
			{
				/#
					assertmsg(("" + item.name) + "");
				#/
				continue;
			}
			function_ab3bb6bf(player, item);
		}
	}
}

/*
	Name: player_has
	Namespace: zm_items
	Checksum: 0xCDDA96ED
	Offset: 0x8C8
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function player_has(player, w_item)
{
	if(!is_true(w_item.craftitem) && isdefined(player))
	{
		if(w_item.var_9fffdcee)
		{
			/#
				assertmsg(("" + w_item.name) + "");
			#/
		}
		else
		{
			return player hasweapon(w_item);
		}
	}
	if(w_item.var_9fffdcee)
	{
		holder = level;
	}
	else
	{
		holder = player;
	}
	if(!isdefined(holder.item_inventory))
	{
		holder.item_inventory = [];
	}
	return is_true(holder.item_inventory[w_item]);
}

/*
	Name: player_pick_up
	Namespace: zm_items
	Checksum: 0xB08618C9
	Offset: 0x9C8
	Size: 0x23C
	Parameters: 2
	Flags: Linked
*/
function player_pick_up(player, w_item)
{
	if(w_item.var_9fffdcee)
	{
		holder = level;
	}
	else
	{
		holder = player;
	}
	if(!isdefined(holder.item_inventory))
	{
		holder.item_inventory = [];
	}
	holder.item_inventory[w_item] = 1;
	if(w_item.var_df0f9ce9)
	{
		if(isdefined(holder.item_slot_inventory[w_item.var_df0f9ce9]))
		{
			player function_ab3bb6bf(holder, holder.item_slot_inventory[w_item.var_df0f9ce9]);
		}
		holder.item_slot_inventory[w_item.var_df0f9ce9] = w_item;
	}
	level notify(#"component_collected", {#holder:holder, #component:w_item});
	player notify(#"component_collected", {#holder:holder, #component:w_item});
	if(isdefined(level.item_callbacks[w_item]))
	{
		foreach(callback in level.item_callbacks[w_item])
		{
			player [[callback]](holder, w_item);
		}
	}
	if(!is_true(level.var_ddfee332) && player hasweapon(w_item))
	{
		player takeweapon(w_item);
	}
}

/*
	Name: player_take
	Namespace: zm_items
	Checksum: 0xBF8E82B6
	Offset: 0xC10
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function player_take(player, w_item)
{
	if(!is_true(w_item.craftitem) && isdefined(player))
	{
		if(w_item.var_9fffdcee)
		{
			/#
				assertmsg(("" + w_item.name) + "");
			#/
		}
		else
		{
			player zm_weapons::weapon_take(w_item);
		}
	}
	if(w_item.var_9fffdcee)
	{
		holder = level;
	}
	else
	{
		holder = player;
		player zm_weapons::weapon_take(w_item);
	}
	if(!isdefined(holder.item_inventory))
	{
		holder.item_inventory = [];
	}
	holder.item_inventory[w_item] = 0;
}

/*
	Name: function_ab3bb6bf
	Namespace: zm_items
	Checksum: 0x1E29A655
	Offset: 0xD18
	Size: 0x12A
	Parameters: 2
	Flags: Linked
*/
function function_ab3bb6bf(holder, w_item)
{
	holder.item_inventory[w_item] = 0;
	if(w_item.var_df0f9ce9)
	{
		holder.item_slot_inventory[w_item.var_df0f9ce9] = undefined;
	}
	level notify(#"component_lost", {#holder:holder, #component:w_item});
	self notify(#"component_lost", {#holder:holder, #component:w_item});
	if(self hasweapon(w_item))
	{
		self takeweapon(w_item);
	}
	new_item = spawn_item(w_item, self.origin + vectorscale((0, 0, 1), 8), self.angles);
	return new_item;
}

/*
	Name: spawn_item
	Namespace: zm_items
	Checksum: 0x69A94A76
	Offset: 0xE50
	Size: 0x62
	Parameters: 4
	Flags: Linked
*/
function spawn_item(w_item, v_origin, v_angles, var_f93e465d)
{
	if(!isdefined(var_f93e465d))
	{
		var_f93e465d = 1;
	}
	new_item = spawnweapon(w_item, v_origin, v_angles, var_f93e465d);
	return new_item;
}

/*
	Name: debug_items
	Namespace: zm_items
	Checksum: 0xEDA51FDB
	Offset: 0xEC0
	Size: 0x10A
	Parameters: 0
	Flags: None
*/
function debug_items()
{
	/#
		for(;;)
		{
			a_items = getitemarray();
			foreach(item in a_items)
			{
				w_item = item.item;
				if(isdefined(w_item) && is_true(w_item.craftitem))
				{
					sphere(item.origin, 6, (0, 0, 1), 1, 0, 12, 20);
				}
			}
			wait(1);
		}
	#/
}

