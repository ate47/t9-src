#using script_24c32478acf44108;
#using script_3f9e0dc8454d98e1;
#using script_47fb62300ac0bd60;
#using script_72401f526ba71638;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_cf2b4f27;

/*
	Name: function_89f2df9
	Namespace: namespace_cf2b4f27
	Checksum: 0x32C0C57D
	Offset: 0x218
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_62a392bb15b68ccd", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_cf2b4f27
	Checksum: 0xB39CC709
	Offset: 0x268
	Size: 0x63C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "fx_frost_blast_clientfield", 1, 3, "int");
	clientfield::register("toplayer", "fx_frost_blast_1p_lv1_clientfield", 1, 1, "counter");
	clientfield::register("toplayer", "fx_frost_blast_1p_lv3_clientfield", 1, 1, "counter");
	namespace_1b527536::function_36e0540e(#"hash_85edf3a63bb488c", 1, 30, #"hash_7ea42360bdf2de16");
	namespace_1b527536::function_36e0540e(#"hash_2f148f3f9c3812a8", 1, 30, #"hash_1f9a001790297282");
	namespace_1b527536::function_36e0540e(#"hash_2f14923f9c3817c1", 2, 30, #"hash_649e3a841620150f");
	namespace_1b527536::function_36e0540e(#"hash_2f14913f9c38160e", 2, 30, #"hash_47954c9090e3f900");
	namespace_1b527536::function_36e0540e(#"hash_2f14943f9c381b27", 3, 30, #"hash_12f4d7321d9c5005");
	namespace_1b527536::function_36e0540e(#"frost_blast_5", 3, 30, #"hash_681471b56324b3e");
	namespace_1b527536::function_dbd391bf(#"hash_85edf3a63bb488c", &function_d7d09902);
	namespace_1b527536::function_dbd391bf(#"hash_2f148f3f9c3812a8", &function_de15a58c);
	namespace_1b527536::function_dbd391bf(#"hash_2f14923f9c3817c1", &function_3542d3e9);
	namespace_1b527536::function_dbd391bf(#"hash_2f14913f9c38160e", &function_4980fc65);
	namespace_1b527536::function_dbd391bf(#"hash_2f14943f9c381b27", &function_353fd3e7);
	namespace_1b527536::function_dbd391bf(#"frost_blast_5", &function_4959fc1b);
	namespace_9ff9f642::register_slowdown(#"hash_85edf3a63bb488c", 0.5, 3);
	namespace_9ff9f642::register_slowdown(#"frost_blast_5", 0.1, 5);
	zombie_utility::add_zombie_gib_weapon_callback("frost_blast_5", &no_gib, &no_gib);
	var_202ed5fb = getweapon(#"hash_85edf3a63bb488c");
	var_d49cbe9c = getweapon(#"hash_85edf3a63bb488c");
	var_4ddc3155 = getweapon(#"hash_85edf3a63bb488c");
	var_438d1cb7 = getweapon(#"hash_85edf3a63bb488c");
	var_7132f802 = getweapon(#"hash_85edf3a63bb488c");
	frost_blast_5 = getweapon(#"hash_85edf3a63bb488c");
	zm_weapons::function_90953640(var_202ed5fb, 3, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(var_d49cbe9c, 3, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(var_4ddc3155, 3, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(var_438d1cb7, 3, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(var_7132f802, 3, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(frost_blast_5, 3, float(function_60d95f53()) / 1000);
}

/*
	Name: no_gib
	Namespace: namespace_cf2b4f27
	Checksum: 0x104CF33
	Offset: 0x8B0
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function no_gib(percent)
{
	return false;
}

/*
	Name: vecscale
	Namespace: namespace_cf2b4f27
	Checksum: 0x8AC63DC6
	Offset: 0x8C8
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function vecscale(vec, scalar)
{
	return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

/*
	Name: function_6736205c
	Namespace: namespace_cf2b4f27
	Checksum: 0x59F369CD
	Offset: 0x910
	Size: 0x9E6
	Parameters: 1
	Flags: Linked
*/
function function_6736205c(var_638b775a)
{
	if(!isdefined(var_638b775a))
	{
		var_638b775a = 0;
	}
	self endon(#"death", #"hash_34e7ef4239d22ba9");
	self namespace_1b527536::function_460882e2(1);
	var_189ef5f2 = spawnstruct();
	v_forward = vecscale(vectornormalize(anglestoforward(self.angles)), 64);
	var_189ef5f2.origin = self.origin;
	var_189ef5f2.origin = var_189ef5f2.origin + v_forward;
	switch(var_638b775a)
	{
		case 0:
		{
			playfx("zm_weapons/fx9_fld_frost_blast_lvl0_3p", var_189ef5f2.origin);
			self clientfield::increment_to_player("fx_frost_blast_1p_lv1_clientfield", 1);
			break;
		}
		case 1:
		case 2:
		{
			playfx("zm_weapons/fx9_fld_frost_blast_lvl1_3p", var_189ef5f2.origin);
			self clientfield::increment_to_player("fx_frost_blast_1p_lv3_clientfield", 1);
			break;
		}
		case 3:
		case 4:
		case 5:
		{
			playfx("zm_weapons/fx9_fld_frost_blast_lvl3_3p", var_189ef5f2.origin);
			self clientfield::increment_to_player("fx_frost_blast_1p_lv3_clientfield", 1);
			break;
		}
		default:
		{
			playfx("zm_weapons/fx9_fld_frost_blast_lvl1_3p", var_189ef5f2.origin);
			self clientfield::increment_to_player("fx_frost_blast_1p_lv3_clientfield", 1);
			break;
		}
	}
	radius = 128;
	duration = 3;
	damage = 100;
	weapon = getweapon(#"hash_85edf3a63bb488c");
	var_3decbda2 = #"hash_59f3861d4983e53";
	var_89ae2770 = #"hash_6096d838f90bc781";
	slowdown = #"hash_85edf3a63bb488c";
	switch(var_638b775a)
	{
		case 2:
		{
			weapon = getweapon(#"hash_2f14923f9c3817c1");
			var_89ae2770 = #"hash_6096d538f90bc268";
			break;
		}
		case 3:
		{
			weapon = getweapon(#"hash_2f14913f9c38160e");
			var_89ae2770 = #"hash_6096d638f90bc41b";
			radius = 256;
			damage = 200;
			break;
		}
		case 4:
		{
			weapon = getweapon(#"hash_2f14943f9c381b27");
			var_89ae2770 = #"hash_6096db38f90bcc9a";
			radius = 256;
			damage = 200;
			break;
		}
		case 5:
		{
			weapon = getweapon(#"frost_blast_5");
			var_89ae2770 = #"hash_6096dc38f90bce4d";
			radius = 256;
			damage = 200;
			duration = 5;
			slowdown = #"frost_blast_5";
			break;
		}
	}
	self playsound(var_3decbda2);
	playsoundatposition(var_89ae2770, self.origin);
	var_6c77565b = getentitiesinradius(var_189ef5f2.origin, radius, 15);
	foreach(zombie in var_6c77565b)
	{
		if(isalive(zombie) && zombie.team === level.zombie_team)
		{
			zombie dodamage(damage, zombie.origin, self, undefined, undefined, "MOD_UNKNOWN", 0, weapon);
		}
	}
	if(var_638b775a >= 1)
	{
		self thread function_46f32076();
	}
	while(true)
	{
		var_6c77565b = getentitiesinradius(var_189ef5f2.origin, radius, 15);
		foreach(zombie in var_6c77565b)
		{
			if(isalive(zombie) && zombie.team === level.zombie_team && (zombie.var_6f84b820 === #"normal" || zombie.var_6f84b820 === #"special"))
			{
				var_2b1ad45b = 0;
				if(is_true(zombie.var_958cf9c5) || (zombie.var_6f84b820 === #"special" && var_638b775a < 3))
				{
					continue;
				}
				if(zombie clientfield::get("fx_frost_blast_clientfield") == 0)
				{
					var_2b1ad45b = 1;
					zombie callback::callback(#"hash_7f690ab86160d4f6");
					util::wait_network_frame();
					if(!isalive(zombie))
					{
						continue;
					}
				}
				if(var_638b775a == 0)
				{
					zombie clientfield::set("fx_frost_blast_clientfield", 1);
				}
				else
				{
					zombie clientfield::set("fx_frost_blast_clientfield", var_638b775a);
				}
				if(var_638b775a >= 3)
				{
					if(zombie.var_6f84b820 === #"normal" || zombie.var_6f84b820 === #"special")
					{
						zombie thread namespace_9ff9f642::slowdown(slowdown);
						zombie.var_958cf9c5 = 1;
						zombie.var_991315b5 = self;
						if(var_638b775a == 5 && var_2b1ad45b)
						{
							zombie damagemode("next_shot_kills");
						}
						zombie thread function_e287f5c2(duration, var_638b775a);
					}
				}
				else if(zombie.var_6f84b820 === #"normal")
				{
					self stats::function_622feb0d(#"hash_85edf3a63bb488c", #"hash_485f780a2a3da36a", 1);
					zombie thread namespace_9ff9f642::slowdown(slowdown);
					zombie.var_958cf9c5 = 1;
					zombie.var_991315b5 = self;
					if(var_638b775a == 5 && var_2b1ad45b)
					{
						zombie damagemode("next_shot_kills");
					}
					zombie thread function_e287f5c2(duration, var_638b775a);
				}
				waitframe(1);
			}
		}
		if(var_638b775a >= 1)
		{
			wait(0.2);
		}
		else
		{
			return;
		}
	}
}

/*
	Name: function_46f32076
	Namespace: namespace_cf2b4f27
	Checksum: 0x579F0B8C
	Offset: 0x1300
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_46f32076()
{
	self endon(#"death");
	self flag::increment("zm_field_upgrade_in_use");
	wait(3);
	self flag::decrement("zm_field_upgrade_in_use");
	self notify(#"hash_34e7ef4239d22ba9");
}

/*
	Name: function_d7d09902
	Namespace: namespace_cf2b4f27
	Checksum: 0x44045A06
	Offset: 0x1370
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_d7d09902(params)
{
	self thread function_6736205c(0);
}

/*
	Name: function_de15a58c
	Namespace: namespace_cf2b4f27
	Checksum: 0xAB1E08EA
	Offset: 0x13A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_de15a58c(params)
{
	self thread function_6736205c(1);
}

/*
	Name: function_3542d3e9
	Namespace: namespace_cf2b4f27
	Checksum: 0xE368F005
	Offset: 0x13D0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_3542d3e9(params)
{
	self thread function_6736205c(2);
}

/*
	Name: function_4980fc65
	Namespace: namespace_cf2b4f27
	Checksum: 0x321A001A
	Offset: 0x1400
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_4980fc65(params)
{
	self thread function_6736205c(3);
}

/*
	Name: function_353fd3e7
	Namespace: namespace_cf2b4f27
	Checksum: 0xED5ABB51
	Offset: 0x1430
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_353fd3e7(params)
{
	self thread function_6736205c(4);
}

/*
	Name: function_4959fc1b
	Namespace: namespace_cf2b4f27
	Checksum: 0x271EFE7C
	Offset: 0x1460
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_4959fc1b(params)
{
	self thread function_6736205c(5);
}

/*
	Name: function_e287f5c2
	Namespace: namespace_cf2b4f27
	Checksum: 0xAE894379
	Offset: 0x1490
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_e287f5c2(duration, var_638b775a)
{
	self notify(#"hash_85edf3a63bb488c");
	self endon(#"death", #"hash_85edf3a63bb488c");
	wait(duration);
	self damagemode("normal");
	self.var_958cf9c5 = undefined;
	self.var_991315b5 = undefined;
	self clientfield::set("fx_frost_blast_clientfield", 0);
	self function_93765018(var_638b775a);
	self callback::callback(#"hash_40f6b51ae82126a4");
}

/*
	Name: function_93765018
	Namespace: namespace_cf2b4f27
	Checksum: 0x30283306
	Offset: 0x1570
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_93765018(var_638b775a)
{
	if(var_638b775a < 5)
	{
		self namespace_9ff9f642::function_520f4da5(#"hash_85edf3a63bb488c");
	}
	else
	{
		self namespace_9ff9f642::function_520f4da5(#"frost_blast_5");
	}
}

