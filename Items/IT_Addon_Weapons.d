
instance ItMW_Addon_Knife01(C_Item)
{
	name = "Vlčí nůž";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Wolfsmesser;
	damageTotal = Damage_Wolfsmesser;
	damagetype = DAM_EDGE;
	range = Range_Wolfsmesser;
	on_equip = Equip_1H_03;
	on_unequip = UnEquip_1H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Wolfsmesser;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Stab01(C_Item)
{
	name = "Mágova hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab01;
	damageTotal = Damage_Stab01;
	damagetype = DAM_BLUNT;
	range = Range_Stab01;
	on_equip = equip_tab01;
	on_unequip = unequip_tab01;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab01;
	visual = "ITMW_ADDON_STAB01_NEW.3DS";
	effect = "";
	description = "Hůl mágů Ohně";
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 80;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_tab01()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,80);
		Npc_ChangeAttribute(self,ATR_MANA,80);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void unequip_tab01()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-80);
		if(self.attribute[ATR_MANA] >= 80)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-80);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ItMW_Addon_Stab02(C_Item)
{
	name = "Magická hůlka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab02;
	damageTotal = Damage_Stab02;
	damagetype = DAM_BLUNT;
	range = Range_Stab02;
	on_equip = Equip_Zauberstab;
	on_unequip = UnEquip_Zauberstab;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab02;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF2";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 30;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Zauberstab()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,30);
		Npc_ChangeAttribute(self,ATR_MANA,30);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void UnEquip_Zauberstab()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-30);
		if(self.attribute[ATR_MANA] >= 30)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-30);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ItMW_Addon_Stab03(C_Item)
{
	name = "Smršť";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab03;
	damageTotal = Damage_Stab03;
	damagetype = DAM_BLUNT;
	range = Range_Stab03;
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Stab03;
	visual = "ItMW_MageStaff_Blades_2H_01.3DS";
	effect = "";
	description = "Ostrá hůl mága Vody";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_04;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Stab04(C_Item)
{
	name = "Hůl světla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab04;
	damageTotal = Damage_Stab04;
	damagetype = DAM_BLUNT;
	range = Range_Stab04;
	on_equip = equip_tab04;
	on_unequip = unequip_tab04;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab04;
	visual = "FIRE_STAFF.3DS";
	effect = "SPELLFX_WEAKGLIMMER";
	description = "Hůl světla";
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 120;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_tab04()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,120);
		Npc_ChangeAttribute(self,ATR_MANA,120);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void unequip_tab04()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-120);
		if(self.attribute[ATR_MANA] >= 120)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-120);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ITMW_ADDON_STAFFB(C_Item)
{
	name = "Hůl Temnoty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab04;
	damageTotal = Damage_Stab04;
	damagetype = DAM_BLUNT;
	range = Range_Stab04;
	on_equip = equip_staffb;
	on_unequip = unequip_staffb;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab04;
	visual = "STAFF_BELIAR.3DS";
	effect = "SPELLFX_FIRESWORDBLACK";
	description = "Hůl Temnoty";
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 120;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_staffb()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,120);
		Npc_ChangeAttribute(self,ATR_MANA,120);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void unequip_staffb()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-120);
		if(self.attribute[ATR_MANA] >= 120)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-120);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ItMW_Addon_Stab05(C_Item)
{
	name = "Hůl Arcimága vody";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab05;
	damageTotal = Damage_Stab05;
	damagetype = DAM_BLUNT;
	range = Range_Stab05;
	on_equip = equip_tab05;
	on_unequip = unequip_tab05;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab05;
	visual = "WATER_STAFF.3DS";
	effect = "SPELLFX_MAGESTAFF5";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 80;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_tab05()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,80);
		Npc_ChangeAttribute(self,ATR_MANA,80);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void unequip_tab05()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-80);
		if(self.attribute[ATR_MANA] >= 80)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-80);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ITMW_ADDON_STAB06(C_Item)
{
	name = "Hůl vody";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB06;
	damageTotal = DAMAGE_STAB06;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB06;
	on_equip = equip_tab06;
	on_unequip = unequip_tab06;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = CONDITION_STAB06;
	visual = "ITMW_ADDON_STAB04_NEW.3DS";
	effect = "";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 50;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_tab06()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,50);
		Npc_ChangeAttribute(self,ATR_MANA,50);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void unequip_tab06()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-50);
		if(self.attribute[ATR_MANA] >= 50)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-50);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ITMW_ADDON_STAB07(C_Item)
{
	name = "Hůl ohně";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB07;
	damageTotal = DAMAGE_STAB07;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB07;
	on_equip = equip_tab07;
	on_unequip = unequip_tab07;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = CONDITION_STAB07;
	visual = "ITMW_2H_G3_STAFFFIRE_01.3DS";
	effect = "";
	description = "Magická hůl ohně ";
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 60;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_tab07()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,60);
		Npc_ChangeAttribute(self,ATR_MANA,60);
	};
	if(hero.aivar[REAL_TALENT_2H] >= 90)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST2.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 60)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_2HST3.MDS");
	}
	else if(hero.aivar[REAL_TALENT_2H] >= 30)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_SPST1.MDS");
	};
};

func void unequip_tab07()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-60);
		if(self.attribute[ATR_MANA] >= 60)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-60);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_2HST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_SPST1.MDS");
};


instance ItMW_Addon_Hacker_1h_01(C_Item)
{
	name = "Mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Machete;
	damageTotal = Damage_Machete;
	damagetype = DAM_EDGE;
	range = Range_Machete;
	on_equip = Equip_1H_03;
	on_unequip = UnEquip_1H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Machete;
	visual = "ItMw_1H_Machete_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_1h_02(C_Item)
{
	name = "Stará mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_AltMachete;
	damageTotal = Damage_AltMachete;
	damagetype = DAM_EDGE;
	range = Range_AltMachete;
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_AltMachete;
	visual = "ItMw_1H_Machete_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_02;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_2h_01(C_Item)
{
	name = "Obří mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Hacker;
	damageTotal = Damage_Hacker;
	damagetype = DAM_EDGE;
	range = Range_Hacker;
	on_equip = Equip_2H_03;
	on_unequip = UnEquip_2H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Hacker;
	visual = "ItMw_2H_Machete_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_2h_02(C_Item)
{
	name = "Stará obří mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_AltHacker;
	damageTotal = Damage_AltHacker;
	damagetype = DAM_EDGE;
	range = Range_AltHacker;
	on_equip = Equip_2H_02;
	on_unequip = UnEquip_2H_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_AltHacker;
	visual = "ItMw_2H_Machete_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_02;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Keule_1h_01(C_Item)
{
	name = "Služebník větru";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Windknecht;
	damageTotal = Damage_Windknecht;
	damagetype = DAM_BLUNT;
	range = Range_Windknecht;
	on_equip = UnEquip_1H_10;
	on_unequip = Equip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Windknecht;
	visual = "ItMW_Club_1H_01.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_ADDON_MALUS_1H;
	count[2] = Waffenbonus_10;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Keule_2h_01(C_Item)
{
	name = "Služebník bouře";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Sturmknecht;
	damageTotal = Damage_Sturmknecht;
	damagetype = DAM_BLUNT;
	range = Range_Sturmknecht;
	on_equip = UnEquip_2H_10;
	on_unequip = Equip_2H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sturmknecht;
	visual = "ItMW_Club_2H_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_FrancisDagger_Mis(C_Item)
{
	name = "Dobrá dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 0;
	damageTotal = Damage_VLKDolch;
	damagetype = DAM_EDGE;
	range = Range_VLKDolch;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKDolch;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_RangerStaff_Addon(C_Item)
{
	name = "Bojová hůl Kruhu Vody";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_RangerStaff;
	damageTotal = Damage_RangerStaff;
	damagetype = DAM_BLUNT;
	range = Range_RangerStaff;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_RangerStaff;
	visual = "ITMW_MAGESTAFF_NORMAL_2H_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR2hAxe(C_Item)
{
	name = "Dřevěný drtič";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_PIR2hAxe;
	damageTotal = Damage_PIR2hAxe;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR2hAxe;
	visual = "ItMw_070_2h_axe_heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR2hSword(C_Item)
{
	name = "Meč zásobovatelů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_PIR2hSword;
	damageTotal = Damage_PIR2hSword;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR2hSword;
	visual = "ITMW_1H_SABRE.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR1hAxe(C_Item)
{
	name = "Sekera zásobovatelů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_PIR1hAxe;
	damageTotal = Damage_PIR1hAxe;
	damagetype = DAM_EDGE;
	range = Range_PIR1hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR1hAxe;
	visual = "ItMw_030_1h_axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR1hSword(C_Item)
{
	name = "Šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_PIR1hSword;
	damageTotal = Damage_PIR1hSword;
	damagetype = DAM_EDGE;
	range = Range_PIR1hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR1hSword;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_BanditTrader(C_Item)
{
	name = "Meč banditů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_BanditTrader;
	damageTotal = Damage_VLKSchwert;
	damagetype = DAM_EDGE;
	range = Range_VLKSchwert;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[1] = "Na každém je vyryto písmeno 'F'";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_Betty(C_Item)
{
	name = "Betty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Betty;
	damageTotal = Damage_Betty;
	damagetype = DAM_EDGE;
	range = Range_ElBastardo;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ElBastardo;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicArrow(C_Item)
{
	name = "Magický šíp";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ARROW";
	value = Value_Pfeil;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_FireArrow(C_Item)
{
	name = "Ohnivý šíp";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREARROW";
	value = Value_Pfeil;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicBow(C_Item)
{
	name = "Magický luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_MagicBow;
	damageTotal = Damage_MagicBow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_MagicArrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_MagicBow;
	visual = "ItRw_Bow_H_03_old.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_FireBow(C_Item)
{
	name = "Ohnivý luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_FireBow;
	damageTotal = Damage_FireBow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_FireArrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREBOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_FireBow;
	visual = "ItRw_Bow_H_04_old.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicBolt(C_Item)
{
	name = "Magická šipka";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = Value_Bolzen;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOLT";
	visual = "ItRw_Bolt.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicCrossbow(C_Item)
{
	name = "Magická kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_CROSSBOW";
	value = Value_MagicCrossbow;
	damageTotal = Damage_MagicCrossbow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_MagicBolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MagicCrossbow;
	visual = "ItRw_Crossbow_H_01_old.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

