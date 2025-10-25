
instance ItPo_Addon_Geist_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Geist_01;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Lektvar obnovy mysli";
	text[2] = "Buď OPATRNÝ před použitím!!!";
	text[3] = "Může pozvednout mysl";
	text[4] = "nebo zabít uživatele";
	text[5] = NAME_Value;
	count[5] = Value_ManaEssenz;
};


func void UseItPo_Geist_01()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1000;
};


instance ItPo_Addon_Geist_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Geist_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Lektvar obnovy mysli";
	text[2] = "Buď OPATRNÝ před použitím!!!";
	text[3] = "Může pozvednout mysl";
	text[4] = "nebo zabít uživatele";
	text[5] = NAME_Value;
	count[5] = Value_ManaEssenz;
};


func void UseItPo_Geist_02()
{
	if(Npc_IsPlayer(self))
	{
		B_GivePlayerXP(XP_Ambient * 5);
	};
};


instance ItPo_Health_Addon_04(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpTrunk;
	visual = "ITPO_HEALTH_04.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_04;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = "Čistý lektvar života";
	text[2] = "Kompletní regenerace života";
	text[5] = NAME_Value;
	count[5] = Value_HpTrunk;
};


func void UseItPo_Health_04()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};


instance ItPo_Mana_Addon_04(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaTrunk;
	visual = "ItPo_Mana_04.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_04;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Čistý lektvar many";
	text[2] = "Kompletní regenerace many";
	text[5] = NAME_Value;
	count[5] = Value_ManaTrunk;
};


func void UseItPo_Mana_04()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
};

