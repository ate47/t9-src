#using script_57f7003580bb15e0;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_dot;

/*
	Name: function_758c6b1b
	Namespace: status_effect_dot
	Checksum: 0xBDBF367F
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_758c6b1b()
{
	level notify(1233073015);
}

/*
	Name: __init__system__
	Namespace: status_effect_dot
	Checksum: 0x3E616653
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_dot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_dot
	Checksum: 0xDF949BAE
	Offset: 0x150
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(7, &dot_apply);
	status_effect::function_5bae5120(7, &dot_end);
	status_effect::function_6f4eaf88(function_4d1e7b48("dot"));
	clientfield::register("toplayer", "dot_splatter", 1, 1, "counter");
	clientfield::register("toplayer", "dot_no_splatter", 1, 1, "counter");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: status_effect_dot
	Checksum: 0x80F724D1
	Offset: 0x248
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

/*
	Name: dot_apply
	Namespace: status_effect_dot
	Checksum: 0x808F3A50
	Offset: 0x258
	Size: 0x1BC
	Parameters: 3
	Flags: Linked
*/
function dot_apply(var_756fda07, weapon, var_84171a6c)
{
	self.var_7b465aaa = var_756fda07.var_7b465aaa;
	self.var_234d0133 = var_756fda07.var_234d0133;
	self.var_48b3f3eb = var_756fda07.var_48b3f3eb;
	self.var_dc45cd85 = var_756fda07.var_5cf129b8;
	self.var_cd9ab93d = var_756fda07.var_cd9ab93d;
	self.var_73c55eee = var_756fda07.var_9f648d82;
	self.var_4c4e9eb3 = var_756fda07.var_44ff1a4;
	self.var_5cf129b8 = self.var_dc45cd85;
	self.var_adb1692a = self.var_73c55eee;
	self.var_848a19e0 = var_756fda07.var_848a19e0;
	self.var_200f6b2b = 1 / (self.var_5cf129b8 / 1000);
	self.weapon = weapon;
	self.var_8df76e2f = var_756fda07.var_8df76e2f;
	self.var_423e3c32 = var_756fda07.var_423e3c32;
	self.var_ddf59c36 = var_756fda07.var_ddf59c36;
	self.var_c878586d = var_756fda07.var_c878586d;
	if(!isdefined(self.var_45c9768))
	{
		self.owner.var_213b4a61 = 1;
		self.var_45c9768 = gettime();
		self.var_82e80202 = 0;
		if(self.var_8df76e2f > 0)
		{
			self function_37c39554(var_84171a6c);
		}
		self thread function_5236325e(var_84171a6c, var_756fda07.killcament);
		self thread function_c13d20c4();
	}
}

/*
	Name: function_c13d20c4
	Namespace: status_effect_dot
	Checksum: 0x295858C7
	Offset: 0x420
	Size: 0xD8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c13d20c4()
{
	self notify(#"hash_516e8022bc912ad7");
	self endon(#"hash_516e8022bc912ad7", #"hash_13d72ca5a7cfd2bd");
	waitframe(1);
	if(!isplayer(self.owner))
	{
		return;
	}
	self.owner endon(#"spawned");
	rumble = (isdefined(self.var_c878586d) ? self.var_c878586d : "status_effect_dot");
	while(isdefined(self) && isdefined(self.owner))
	{
		self.owner playrumbleonentity(rumble);
		wait(0.1);
	}
}

/*
	Name: dot_end
	Namespace: status_effect_dot
	Checksum: 0xCFBAA242
	Offset: 0x500
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function dot_end()
{
	self.owner.var_213b4a61 = undefined;
	self.owner stoprumble("status_effect_dot");
	self.owner.var_4dcf932b = undefined;
	self.owner.var_e8bb749a = undefined;
	self.var_45c9768 = undefined;
}

/*
	Name: function_3b694684
	Namespace: status_effect_dot
	Checksum: 0x9FC8B4F9
	Offset: 0x568
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b694684(count)
{
	if(!isplayer(self.owner))
	{
		return;
	}
	if(!self.var_ddf59c36 === 1)
	{
		self.owner clientfield::increment_to_player("dot_no_splatter");
	}
	if(!isdefined(self.var_423e3c32))
	{
		return;
	}
	if(count % self.var_423e3c32)
	{
		self.owner clientfield::increment_to_player("dot_no_splatter");
		return;
	}
	self.owner clientfield::increment_to_player("dot_splatter");
}

/*
	Name: function_5236325e
	Namespace: status_effect_dot
	Checksum: 0x7D99AC5E
	Offset: 0x630
	Size: 0x280
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5236325e(var_84171a6c, killcament)
{
	self endon(#"hash_13d72ca5a7cfd2bd");
	var_6307def9 = 0;
	var_f3fdc692 = 0;
	while(true)
	{
		self function_1d5bd9af();
		var_85ef8797 = 5;
		mod = "MOD_DOT";
		function_3b694684(var_f3fdc692);
		var_f3fdc692++;
		if(isdefined(self.owner))
		{
			resistance = 0;
			if(isplayer(self.owner) && self.weapon.doesfiredamage !== 0)
			{
				resistance = self.owner status_effect::function_3c54ae98(7);
			}
			var_d6bae87d = (1 - resistance) * self.var_adb1692a;
			if(isdefined(self.var_4b22e697) && self.owner === self.var_4b22e697)
			{
				var_d6bae87d = var_d6bae87d * self.owner status_effect::function_37683813();
			}
			var_6307def9 = var_6307def9 + var_d6bae87d;
			if(var_6307def9 >= 1)
			{
				var_4ba055ed = int(floor(var_6307def9));
				location = (isdefined(self.location) ? self.location : self.owner.origin);
				if(isdefined(var_84171a6c) && isdefined(var_84171a6c.var_d44d1214))
				{
					location = var_84171a6c.var_d44d1214.origin;
				}
				self.owner dodamage(var_4ba055ed, location, var_84171a6c, killcament, undefined, mod, var_85ef8797, self.weapon);
				var_6307def9 = var_6307def9 - var_4ba055ed;
			}
		}
		wait(self.var_5cf129b8 / 1000);
		self function_ae0405e2(var_84171a6c);
	}
}

/*
	Name: function_ae0405e2
	Namespace: status_effect_dot
	Checksum: 0x2F903E67
	Offset: 0x8B8
	Size: 0xE2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ae0405e2(var_84171a6c)
{
	if(self.var_82e80202 == self.var_8df76e2f)
	{
		self.var_82e80202 = 0;
		self function_37c39554(var_84171a6c);
	}
	else
	{
		self.var_82e80202++;
		if(isdefined(self.owner))
		{
			self.owner.var_dbffaa32 = undefined;
		}
		if(isdefined(var_84171a6c) && (!isdefined(self.owner) || self.owner != var_84171a6c))
		{
			var_84171a6c.var_dbffaa32 = undefined;
			if(isdefined(var_84171a6c.owner) && isplayer(var_84171a6c.owner))
			{
				var_84171a6c.owner.var_dbffaa32 = undefined;
			}
		}
	}
}

/*
	Name: function_37c39554
	Namespace: status_effect_dot
	Checksum: 0x57689D58
	Offset: 0x9A8
	Size: 0x174
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37c39554(var_84171a6c)
{
	if(!isdefined(self.owner))
	{
		return;
	}
	if(!isdefined(var_84171a6c))
	{
		return;
	}
	self.owner.var_dbffaa32 = 1;
	if(isplayer(var_84171a6c))
	{
		var_84171a6c.var_dbffaa32 = 1;
	}
	else if(isdefined(var_84171a6c.owner) && isplayer(var_84171a6c.owner))
	{
		var_84171a6c.owner.var_dbffaa32 = 1;
	}
	location = (isdefined(self.location) ? self.location : self.owner.origin);
	if(isdefined(var_84171a6c.var_d44d1214))
	{
		location = var_84171a6c.var_d44d1214.origin;
	}
	dir = self.owner.origin - location;
	if(isplayer(self.owner) && !self.owner getinvulnerability())
	{
		self.owner addtodamageindicator(self.var_adb1692a, dir);
	}
}

/*
	Name: function_1d5bd9af
	Namespace: status_effect_dot
	Checksum: 0x5132E006
	Offset: 0xB28
	Size: 0xDA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1d5bd9af()
{
	if(!self.var_7b465aaa)
	{
		return;
	}
	var_9002d607 = gettime() - (isdefined(self.var_45c9768) ? self.var_45c9768 : 0) + (isdefined(self.var_48b3f3eb) ? self.var_48b3f3eb : 0);
	if(var_9002d607 < 0)
	{
		return;
	}
	var_7473be02 = var_9002d607 / self.var_234d0133;
	self.var_5cf129b8 = lerpfloat(self.var_dc45cd85, self.var_cd9ab93d, var_7473be02);
	self.var_adb1692a = int(lerpfloat(self.var_73c55eee, self.var_4c4e9eb3, var_7473be02));
}

