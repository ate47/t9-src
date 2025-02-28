#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace death_circle;

/*
	Name: function_89f2df9
	Namespace: death_circle
	Checksum: 0x3490990A
	Offset: 0x248
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"death_circle", &function_70a657d8, undefined, &function_4df027f2, undefined);
}

/*
	Name: function_70a657d8
	Namespace: death_circle
	Checksum: 0x393F0463
	Offset: 0x298
	Size: 0x368
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.deathcircle = {#enabled:is_true(getgametypesetting(#"deathcircle"))};
	if(!level.deathcircle.enabled)
	{
		return;
	}
	level.var_ef215639 = [3:"evt_death_circle_strong", 2:#"hash_5b96bc3a1c23c571", 1:#"hash_1483048e184df991"];
	level.var_cb450873 = #"hash_313f1d0b4ff27caa";
	if(isdefined(level.var_7bd7bdc8))
	{
		level.var_f6795a59 = level.var_7bd7bdc8;
	}
	else
	{
		level.var_f6795a59 = [3:#"hash_3fc5123369b4c59f", 2:#"hash_5c64e89ab323857a", 1:#"hash_7c7ea03189fe65d8"];
	}
	clientfield::register("scriptmover", "deathcircleflag", 1, 1, "int", &function_a380fe5, 0, 0);
	clientfield::register("allplayers", "deathcircleopacityflag", 1, 1, "counter", &function_1a4228a5, 0, 0);
	clientfield::register("toplayer", "deathcircleeffects", 1, 2, "int", undefined, 0, 1);
	clientfield::register("allplayers", "outsidedeathcircle", 1, 1, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseTimerState", #"hash_593f03dd48d5bc1f", #"hash_5817bcf822075730", 1, 2, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseProgress", #"hash_593f03dd48d5bc1f", #"hash_747747a532ccd991", 1, 7, "float", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.distanceFromDeathCircle", #"hud_items", #"hash_31f0ea102cc70608", 1, 7, "float", undefined, 0, 0);
	callback::on_localclient_connect(&on_localclient_connect);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	level.var_32e10fc2 = [];
}

/*
	Name: function_4df027f2
	Namespace: death_circle
	Checksum: 0x1572BF4E
	Offset: 0x608
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4df027f2()
{
	if(!level.deathcircle.enabled)
	{
		return;
	}
	if(level.is_survival === 1)
	{
		level.var_74017fd2 = #"hash_2ebe199a82d38283";
	}
	if(level.var_374c2805 === 1)
	{
		level.var_34ac1fa = #"hash_454cceb988244ba3";
	}
	if(!isdefined(level.var_74017fd2))
	{
		level.var_74017fd2 = #"hash_75168376918f5ab7";
	}
}

/*
	Name: function_a380fe5
	Namespace: death_circle
	Checksum: 0x8EEE40AE
	Offset: 0x6A8
	Size: 0x424
	Parameters: 7
	Flags: Linked
*/
function function_a380fe5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"hash_49f273cd81c6c0f");
	if(bwastimejump)
	{
		var_899562cf = self.team == #"neutral";
		var_929604bb = self.team != #"neutral";
		self setcompassicon("ui_icon_minimap_collapse_ring");
		self function_811196d1(0);
		self function_95bc465d(1);
		self function_5e00861(0, 1);
		self function_bc95cd57(var_899562cf);
		self function_60212003(var_929604bb);
		self thread function_a453467f(fieldname);
		if(var_929604bb)
		{
			player = function_27673a7(fieldname);
			if(isdefined(player) && isdefined(player.var_2cbc8a68))
			{
				player.var_2cbc8a68 function_5d482e78(level.var_74017fd2);
				player.var_2cbc8a68 delete();
			}
			if(isdefined(self.var_2c8e49d2))
			{
				self.var_2c8e49d2 function_5d482e78(level.var_74017fd2);
				self.var_2c8e49d2 delete();
			}
			self function_a5edb367(#"hash_4964cfaa74d2a1ac");
			self.var_2c8e49d2 = spawn(fieldname, self.origin, "script_model");
			self.var_2c8e49d2 setmodel("p8_big_cylinder");
			self.var_2c8e49d2 function_bf9d3071(level.var_74017fd2);
			self.var_2c8e49d2 linkto(self);
			self.var_29b256b0 = spawn(0, self.origin, "script_origin");
			self.var_29b256b0.handle = self.var_29b256b0 playloopsound(level.var_cb450873);
			if(!isdefined(level.var_2bc2d986))
			{
				level.var_18a959b = self.var_2c8e49d2;
			}
		}
		else
		{
			self function_a5edb367(#"none");
		}
	}
	else
	{
		self function_811196d1(1);
		self function_bc95cd57(0);
		if(isdefined(self.var_2c8e49d2))
		{
			self.var_2c8e49d2 function_5d482e78(level.var_74017fd2);
			self.var_2c8e49d2 delete();
		}
		if(isdefined(self.var_29b256b0))
		{
			self.var_29b256b0 stoploopsound(self.var_29b256b0.handle);
			self.var_29b256b0 delete();
		}
	}
}

/*
	Name: function_1a4228a5
	Namespace: death_circle
	Checksum: 0x51CE4334
	Offset: 0xAD8
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function function_1a4228a5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		player = function_27673a7(fieldname);
		if(isdefined(level.var_18a959b))
		{
			level.var_18a959b function_5d482e78(level.var_74017fd2);
		}
		level.var_18a959b function_bf9d3071(level.var_34ac1fa);
		while(player.var_1bee6f4b === 1 || player.weapon.name === #"chopper_gunner")
		{
			waitframe(1);
		}
		if(isdefined(level.var_18a959b))
		{
			level.var_18a959b function_5d482e78(level.var_34ac1fa);
		}
		level.var_18a959b function_bf9d3071(level.var_74017fd2);
	}
}

/*
	Name: on_localclient_connect
	Namespace: death_circle
	Checksum: 0x47C6034
	Offset: 0xC30
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	player = function_27673a7(localclientnum);
	if(isdefined(player))
	{
		player.var_2cbc8a68 = spawn(localclientnum, vectorscale((0, 0, -1), 10000), "script_model");
		player.var_2cbc8a68 function_bf9d3071(level.var_74017fd2);
	}
	level thread function_382da026(localclientnum);
}

/*
	Name: on_localplayer_spawned
	Namespace: death_circle
	Checksum: 0xD4448233
	Offset: 0xCE0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_spawned(localclientnum)
{
	if(self function_da43934d())
	{
		self thread function_7eb327bd(localclientnum);
	}
}

/*
	Name: function_382da026
	Namespace: death_circle
	Checksum: 0x289A4B9F
	Offset: 0xD28
	Size: 0x13E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_382da026(localclientnum)
{
	self notify("7c5d474ab38b8a8");
	self endon("7c5d474ab38b8a8");
	var_ef2f4cec = spawnstruct();
	level.var_32e10fc2[localclientnum] = var_ef2f4cec;
	while(true)
	{
		var_d017e788 = function_5c10bd79(localclientnum);
		if(!isdefined(var_d017e788))
		{
			waitframe(1);
			continue;
		}
		intensity = var_d017e788 clientfield::get_to_player("deathcircleeffects");
		if(var_ef2f4cec.var_e51324b5 !== intensity)
		{
			var_ef2f4cec notify(#"hash_b6468b7475f6790");
			var_ef2f4cec function_43d7470c(localclientnum, intensity);
			var_ef2f4cec function_d69170b(localclientnum, intensity);
			var_ef2f4cec.var_e51324b5 = intensity;
		}
		level.var_d081e853 = intensity > 0;
		waitframe(1);
	}
}

/*
	Name: function_7eb327bd
	Namespace: death_circle
	Checksum: 0xB7A97B5F
	Offset: 0xE70
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7eb327bd(localclientnum)
{
	self waittill(#"death");
	var_ef2f4cec = level.var_32e10fc2[localclientnum];
	if(isdefined(var_ef2f4cec))
	{
		var_ef2f4cec notify(#"hash_b6468b7475f6790");
		var_ef2f4cec function_43d7470c(localclientnum);
		var_ef2f4cec function_d69170b(localclientnum);
	}
}

/*
	Name: function_43d7470c
	Namespace: death_circle
	Checksum: 0xDBE6A809
	Offset: 0xF08
	Size: 0x9A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_43d7470c(localclientnum, intensity)
{
	if(!isdefined(intensity))
	{
		intensity = 0;
	}
	if(isdefined(self.var_ef215639))
	{
		function_d48752e(localclientnum, self.var_ef215639);
		self.var_ef215639 = undefined;
	}
	alias = level.var_ef215639[intensity];
	if(isdefined(alias))
	{
		self.var_ef215639 = function_604c9983(localclientnum, alias);
	}
}

/*
	Name: function_d69170b
	Namespace: death_circle
	Checksum: 0xD62D0E29
	Offset: 0xFB0
	Size: 0x236
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d69170b(localclientnum, intensity)
{
	if(!isdefined(intensity))
	{
		intensity = 0;
	}
	var_d017e788 = function_5c10bd79(localclientnum);
	if(isdefined(self.var_f6795a59))
	{
		function_24cd4cfb(localclientnum, self.var_f6795a59);
		if(isdefined(self.var_6e62d281))
		{
			stopfx(localclientnum, self.var_6e62d281);
		}
		self.var_f6795a59 = undefined;
		self.var_6e62d281 = undefined;
	}
	if(isdefined(var_d017e788.var_103fdf58))
	{
		playsound(localclientnum, #"hash_1757939248ce3124", (0, 0, 0));
		var_d017e788 stoploopsound(var_d017e788.var_103fdf58);
		var_d017e788.var_103fdf58 = undefined;
	}
	postfx = level.var_f6795a59[intensity];
	if(isdefined(postfx))
	{
		if(function_148ccc79(localclientnum, postfx))
		{
			codestoppostfxbundlelocal(localclientnum, postfx);
		}
		function_a837926b(localclientnum, postfx);
		if(isdefined(level.var_6e62d281))
		{
			if(viewmodelhastag(localclientnum, "tag_torso"))
			{
				self.var_6e62d281 = playviewmodelfx(localclientnum, level.var_6e62d281, "tag_torso");
			}
			if(!isdefined(var_d017e788.var_103fdf58))
			{
				playsound(localclientnum, #"hash_639f49c1fc950a5d", (0, 0, 0));
				var_d017e788.var_103fdf58 = var_d017e788 playloopsound("evt_sr_fogofwar_1p_lp");
			}
		}
		self.var_f6795a59 = postfx;
	}
}

/*
	Name: function_63d6411e
	Namespace: death_circle
	Checksum: 0xC37E9278
	Offset: 0x11F0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_63d6411e()
{
	self setcompassicon("");
}

/*
	Name: function_32f7227c
	Namespace: death_circle
	Checksum: 0x5D394F07
	Offset: 0x1220
	Size: 0x140
	Parameters: 3
	Flags: Linked, Private
*/
function private function_32f7227c(deathcircle, currentradius, localclientnum)
{
	localplayer = function_5c10bd79(localclientnum);
	startpos = (deathcircle.origin[0], deathcircle.origin[1], 0);
	var_fc612cde = (0, 0, 0);
	eyepos = startpos + vectorscale((0, 0, 1), 60);
	if(isdefined(localplayer))
	{
		endpos = (localplayer.origin[0], localplayer.origin[1], 0);
		var_fc612cde = (vectornormalize(endpos - startpos)) * currentradius;
		eyepos = localplayer geteyeapprox();
	}
	var_ba5c9ce6 = deathcircle.origin + var_fc612cde;
	return (var_ba5c9ce6[0], var_ba5c9ce6[1], eyepos[2]);
}

/*
	Name: function_a453467f
	Namespace: death_circle
	Checksum: 0x2BA565EC
	Offset: 0x1368
	Size: 0x22E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a453467f(localclientnum)
{
	self endon(#"death", #"hash_49f273cd81c6c0f");
	self thread function_71f8d788();
	while(isdefined(self.scale))
	{
		radius = 15000 * self.scale;
		if(isdefined(self.var_2c8e49d2))
		{
			if(!self.var_2c8e49d2 function_d2503806(level.var_74017fd2) && !self.var_2c8e49d2 function_d2503806(level.var_34ac1fa))
			{
				self.var_2c8e49d2 function_bf9d3071(level.var_74017fd2);
			}
			modelscale = radius / 150000;
			if(self.var_2c8e49d2 function_d2503806(level.var_74017fd2))
			{
				self.var_2c8e49d2 function_78233d29(level.var_74017fd2, "", "Scale", modelscale);
			}
			else if(self.var_2c8e49d2 function_d2503806(level.var_34ac1fa))
			{
				self.var_2c8e49d2 function_78233d29(level.var_34ac1fa, "", "Scale", modelscale);
			}
			if(isdefined(self.var_29b256b0))
			{
				self.var_29b256b0.origin = function_32f7227c(self, radius, localclientnum);
			}
		}
		var_70aac56d = radius * 2;
		self function_5e00861(var_70aac56d, 1);
		waitframe(1);
	}
}

/*
	Name: function_71f8d788
	Namespace: death_circle
	Checksum: 0x59859701
	Offset: 0x15A0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_71f8d788()
{
	self endon(#"hash_49f273cd81c6c0f");
	self waittill(#"death");
	if(isdefined(self.var_2c8e49d2))
	{
		self.var_2c8e49d2 function_5d482e78(level.var_74017fd2);
		self.var_2c8e49d2 delete();
	}
}

