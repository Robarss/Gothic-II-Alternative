
instance WEAPONS_SHIELD_S1(C_Item)
{
};

instance ITSH_SHIELD(C_Item)
{
	name = "Kulatý štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 200;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_okragla.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_shield()
{
	if(SCATTY_TEACH_PERM1 == TRUE)
	{
		if(SCATTY_TEACH_PERM3 == TRUE)
		{
			SHIELD_EQUIP = TRUE;
			Mdl_ApplyOverlayMds(self,"HUMANS_1HST3SH.MDS");
		}
		else if(SCATTY_TEACH_PERM2 == TRUE)
		{
			SHIELD_EQUIP = TRUE;
			Mdl_ApplyOverlayMds(self,"HUMANS_1HST2SH.MDS");
		}
		else if(SCATTY_TEACH_PERM1 == TRUE)
		{
			SHIELD_EQUIP = TRUE;
			Mdl_ApplyOverlayMds(self,"HUMANS_1HST1SH.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("Neumím používat štíty!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_shield()
{
	SHIELD_EQUIP = FALSE;
	Mdl_RemoveOverlayMds(self,"HUMANS_1HST3SH.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_1HST2SH.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_1HST1SH.MDS");
};


instance ITSH_AROW(C_Item)
{
	name = "Kulatý štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 200;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSL_BACKARROWSACK_01.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_SHIELD_SWAMP(C_Item)
{
	name = "Dřevěný štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 150;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSH_SHIELD_A_SWAMP.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_DRAGON_DS(C_Item)
{
	name = "Dračí štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 4500;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITAR_SHIELD_GOD.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_TWR(C_Item)
{
	name = "Unikatní žoldácký štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 600;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSH_TWR_WAR_DA.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_PALADIN_A(C_Item)
{
	name = "Opotřebovaný rytířský štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 900;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSH_PALADIN_A.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_SHIELD_A_REINFORCED(C_Item)
{
	name = "Kulatý zesílený štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 200;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSH_SHIELD_A_REINFORCED.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_SHIELD_WOLF(C_Item)
{
	name = "Vlčí štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 200;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSH_WOLF_A.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_SHIELD_A_RUNE(C_Item)
{
	name = "Růnový štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 1300;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 50;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ITSH_R_RUNE.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_2SHIELD(C_Item)
{
	name = "Štít stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 200;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_rycerz1.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_3SHIELD(C_Item)
{
	name = "Starý rytířský štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 50;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_rycerz1dark.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_4SHIELD(C_Item)
{
	name = "Rytířský štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 300;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_rycerz2.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_5SHIELD(C_Item)
{
	name = "Starý okovaný rytířský štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 300;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_rycerz2dark.3DS";
	description = name;
	text[0] = "Dost šipnavý, ale jinak v dobrém stavu.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_6SHIELD(C_Item)
{
	name = "Válečný štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 350;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_herbowa.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_7SHIELD(C_Item)
{
	name = "Paladinuv štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 600;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_rycerz3.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_8SHIELD(C_Item)
{
	name = "Paladinský požehnaný štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 10000;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 30;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarczakrol1.3DS";
	description = name;
	text[0] = "";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_9SHIELD(C_Item)
{
	name = "Štít lovců draků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 1000;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_lowcy2.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_10SHIELD(C_Item)
{
	name = "Prasklý štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 30;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_zlamana.3DS";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_11SHIELD(C_Item)
{
	name = "Štít lovců draků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 100;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "tarcza_lowcy2.3DS";
	description = name;
	text[0] = "Musel se zničit během boje.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITSH_12SHIELD(C_Item)
{
	name = "Štít odvahy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	material = MAT_METAL;
	value = 3600;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	on_equip = equip_shield;
	on_unequip = unequip_shield;
	visual = "ItSh_Dragon_DS.3ds";
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};


const int BLADE_DEX1 = 2;

instance ITMW_SNEAK1(C_Item)
{
	name = "Rychlá ruka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 500;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 30;
	on_equip = equip_pir1;
	on_unequip = unequip_pir1;
	visual = "ITMW_CHIEFRAPIER_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 2;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir1()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX1);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir1()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX1);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX2 = 5;

instance ITMW_SNEAK2(C_Item)
{
	name = "Zlodějova obrana";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 70;
	on_equip = equip_pir2;
	on_unequip = unequip_pir2;
	visual = "ITMW_CHIEFRAPIER_05.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir2()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX2);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX2);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX3 = 3;

instance ITMW_SNEAK3(C_Item)
{
	name = "Malý rapír";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 50;
	on_equip = equip_pir3;
	on_unequip = unequip_pir3;
	visual = "ItMw_050_1h_Sword_Rapier_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir3()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX3);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir3()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX3);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX4 = 6;

instance ItMw_Rapier(C_Item)
{
	name = "Unikátní rapír";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Rapier;
	damageTotal = Damage_Rapier;
	damagetype = DAM_EDGE;
	range = Range_Rapier;
	on_equip = equip_pir4;
	on_unequip = unequip_pir4;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Rapier;
	visual = "ITMW_065_1H_SWORDCANE_02.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 6;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir4()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX4);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir4()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX4);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX5 = 4;

instance ITMW_SNEAK5(C_Item)
{
	name = "Rapír";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 60;
	on_equip = equip_pir5;
	on_unequip = unequip_pir5;
	visual = "ITMW_1H_SWORD_RAPIER_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 4;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir5()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX5);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX5);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX6 = 5;

instance ITMW_SNEAK6(C_Item)
{
	name = "Floret";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 90;
	on_equip = equip_pir6;
	on_unequip = unequip_pir6;
	visual = "ITMW_1H_SWORDCANE_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir6()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX6);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir6()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX6);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX7 = 7;

instance ItMw_Meisterdegen(C_Item)
{
	name = "Mistrovský meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Meisterdegen;
	damageTotal = Damage_Meisterdegen;
	damagetype = DAM_EDGE;
	range = Range_Meisterdegen;
	on_equip = equip_pir7;
	on_unequip = unequip_pir7;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Meisterdegen;
	visual = "ITMW_SPAGE_02.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 7;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir7()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX7);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir7()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX7);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


const int BLADE_DEX8 = 10;

instance ITMW_SNEAK8(C_Item)
{
	name = "Velmistruv Kord";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 4500;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 100;
	on_equip = equip_pir8;
	on_unequip = unequip_pir8;
	visual = "ITMW_1H_SWORDCANE_06.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_Bonus_Dex;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_pir8()
{
	if(hero.aivar[REAL_TALENT_1H] >= 0)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BLADE_DEX8);
		if(hero.aivar[REAL_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
		}
		else if(hero.aivar[REAL_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
		};
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_pir8()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BLADE_DEX8);
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST3.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST2.MDS");
	Mdl_RemoveOverlayMds(self,"HUMANS_RAPIER_ST1.MDS");
};


instance ItMw_1h_Vlk_Dagger(C_Item)
{
	name = "Dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_VLKDolch;
	damageTotal = Damage_VLKDolch;
	damagetype = DAM_EDGE;
	range = Range_VLKDolch;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKDolch;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_028_2H_HALBERD_01(C_Item)
{
	name = "Halapartna";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_2H_HALBERD;
	damageTotal = DAMAGE_2H_HALBERD;
	damagetype = DAM_EDGE;
	range = RANGE_2H_HALBERD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_2H_HALBERD;
	on_equip = equip_halap;
	on_unequip = unequip_halap;
	visual = "ITAR_HALLEBERD_NOW.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_halap()
{
	Mdl_ApplyOverlayMds(self,"HUMANS_GUAR_HALAPRT.MDS");
};

func void unequip_halap()
{
	Mdl_RemoveOverlayMds(self,"HUMANS_GUAR_HALAPRT.MDS");
};


instance ITMW_1H_AXE_WOODCHOPPIN(C_Item)
{
	name = "Sekera na dřevo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 19;
	damageTotal = 18;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "WOODCHOPPIIN_AXE.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ULUMULUX(C_Item)
{
	name = "ULU_MULU";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 850;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ULU_MULUX.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_L_01(C_Item)
{
	name = "Pohrabáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Schuerhaken;
	damageTotal = Damage_Schuerhaken;
	damagetype = DAM_EDGE;
	range = Range_Schuerhaken;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schuerhaken;
	visual = "Itmw_005_1h_poker_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Bau_Axe(C_Item)
{
	name = "Srp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_BauAxe;
	damageTotal = Damage_BauAxe;
	damagetype = DAM_EDGE;
	range = Range_BauAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_BauAxe;
	visual = "Itmw_007_1h_sickle_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Vlk_Mace(C_Item)
{
	name = "Vycházková hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_L_03(C_Item)
{
	name = "Palice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Belegnagel;
	damageTotal = Damage_Belegnagel;
	damagetype = DAM_BLUNT;
	range = Range_Belegnagel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Belegnagel;
	visual = "ItMw_008_1h_mace_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Bau_Mace(C_Item)
{
	name = "Velký klacek";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_BauMace;
	damageTotal = Damage_BauMace;
	damagetype = DAM_BLUNT;
	range = Range_BauMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_BauMace;
	visual = "ItMw_010_1h_Club_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Vlk_Axe(C_Item)
{
	name = "Sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_VLKAxe;
	damageTotal = Damage_VLKAxe;
	damagetype = DAM_EDGE;
	range = Range_VLKAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKAxe;
	visual = "Itmw_010_1h_vlk_hatchet_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_L_04(C_Item)
{
	name = "Kovářské kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Schmiedehammer;
	damageTotal = Damage_Schmiedehammer;
	damagetype = DAM_BLUNT;
	range = Range_Schmiedehammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schmiedehammer;
	visual = "ItMw_010_1h_sledgehammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_ShortSword1(C_Item)
{
	name = "Krátký meč domobrany";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_ShortSword1;
	damageTotal = Damage_ShortSword1;
	damagetype = DAM_EDGE;
	range = Range_ShortSword1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ShortSword1;
	visual = "ItMw_010_1h_Sword_short_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Nagelknueppel(C_Item)
{
	name = "Hřeby pobitý kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Nagelknueppel;
	damageTotal = Damage_Nagelknueppel;
	damagetype = DAM_BLUNT;
	range = Range_Nagelknueppel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Nagelknueppel;
	visual = "ItMw_012_1h_Nailmace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_L_03(C_Item)
{
	name = "Vlčí nůž";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Wolfsklinge;
	damageTotal = Damage_Wolfsklinge;
	damagetype = DAM_EDGE;
	range = Range_Wolfsklinge;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Wolfsklinge;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_ShortSword2(C_Item)
{
	name = "Primitivní krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_ShortSword2;
	damageTotal = Damage_ShortSword2;
	damagetype = DAM_EDGE;
	range = Range_ShortSword2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ShortSword2;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Sense(C_Item)
{
	name = "Malá kosa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Sense;
	damageTotal = Damage_Sense;
	damagetype = DAM_EDGE;
	range = Range_Sense;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sense;
	visual = "ItMw_012_1h_Scythe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Nov_Mace(C_Item)
{
	name = "Bojové kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_NovMace;
	damageTotal = Damage_NovMace;
	damagetype = DAM_BLUNT;
	range = Range_NovMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_NovMace;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2h_Bau_Axe(C_Item)
{
	name = "Dřevorubecká sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Bau2hAxt;
	damageTotal = Damage_Bau2hAxt;
	damagetype = DAM_EDGE;
	range = Range_Bau2hAxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Bau2hAxt;
	visual = "ItMw_020_2h_Axe_Lumberjack_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_L_01(C_Item)
{
	name = "Krumpáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_NSPLIT;
	material = MAT_METAL;
	value = Value_Spitzhacke;
	damageTotal = Damage_Spitzhacke;
	damagetype = DAM_EDGE;
	range = Range_Spitzhacke;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Spitzhacke;
	visual = "ItMw_020_2h_Pickaxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_MISC_Sword(C_Item)
{
	name = "Rezavý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_MiscSword;
	damageTotal = Damage_MiscSword;
	damagetype = DAM_EDGE;
	range = Range_MiscSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MiscSword;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Misc_Axe(C_Item)
{
	name = "Rezavá sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_MiscAxe;
	damageTotal = Damage_MiscAxe;
	damagetype = DAM_EDGE;
	range = Range_MiscAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MiscAxe;
	visual = "ItMw_025_2h_Misc_Axe_old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_M_01(C_Item)
{
	name = "Rezavý obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Misc2hSword;
	damageTotal = Damage_Misc2hSword;
	damagetype = DAM_EDGE;
	range = Range_Misc2hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Misc2hSword;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Mil_Sword(C_Item)
{
	name = "Rezavý široký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_MilSchwert;
	damageTotal = Damage_MilSchwert;
	damagetype = DAM_EDGE;
	range = Range_MilSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MilSchwert;
	visual = "Itmw_025_1h_Mil_Sword_broad_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Sld_Axe(C_Item)
{
	name = "Primitivní sekerka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Sld1hAxt;
	damageTotal = Damage_Sld1hAxt;
	damagetype = DAM_EDGE;
	range = Range_Sld1hAxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sld1hAxt;
	visual = "ItMw_025_1h_sld_axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Sld_Sword(C_Item)
{
	name = "Primitivní meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Sld1hSchwert;
	damageTotal = Damage_Sld1hSchwert;
	damagetype = DAM_EDGE;
	range = Range_Sld1hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sld1hSchwert;
	visual = "ItMw_025_1h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2h_Sld_Axe(C_Item)
{
	name = "Primitivní válečná sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Sld2hAxe;
	damageTotal = Damage_Sld2hAxe;
	damagetype = DAM_EDGE;
	range = Range_Sld2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sld2hAxe;
	visual = "ItMw_035_2h_sld_axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2h_Sld_Sword(C_Item)
{
	name = "Primitivní obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Sld2hSchwert;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sld2hSchwert;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Pal_Sword(C_Item)
{
	name = "Paladinský meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_PalSchwert;
	damageTotal = Damage_PalSchwert;
	damagetype = DAM_EDGE;
	range = Range_PalSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PalSchwert;
	visual = "ITMW_1H_PALORESWORD.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2h_Pal_Sword(C_Item)
{
	name = "Paladinský obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_PalZweihaender;
	damageTotal = Damage_PalZweihaender;
	damagetype = DAM_EDGE;
	range = Range_PalZweihaender;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PalZweihaender;
	visual = "ITMW_2H_PALORESWORD.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_OrcAxe_01(C_Item)
{
	name = "Lehká skřetí sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Orkaxt_01;
	damageTotal = Damage_Orkaxt_01;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_01;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_OrcAxe_02(C_Item)
{
	name = "Středně těžká skřetí sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Orkaxt_02;
	damageTotal = Damage_Orkaxt_02;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_02;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_OrcAxe_03(C_Item)
{
	name = "Těžká skřetí sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Orkaxt_03;
	damageTotal = Damage_Orkaxt_03;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_03;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_OrcAxe_04(C_Item)
{
	name = "Hrubá skřetí sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Orkaxt_04;
	damageTotal = Damage_Orkaxt_04;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_04;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_OrcSword_01(C_Item)
{
	name = "Ještěří meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = Damage_Orkschwert;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkschwert;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_OrcSword_02(C_Item)
{
	name = "Skřetí válečný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Orkschwert_01;
	damageTotal = Damage_Orkschwert_01;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkschwert_01;
	visual = "ItMw_2H_OrcSword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_ShortSword3(C_Item)
{
	name = "Krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_ShortSword3;
	damageTotal = Damage_ShortSword3;
	damagetype = DAM_EDGE;
	range = Range_ShortSword3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ShortSword3;
	visual = "ItMw_016_1h_Sword_short_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Vlk_Sword(C_Item)
{
	name = "Meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_VLKSchwert;
	damageTotal = Damage_VLKSchwert;
	damagetype = DAM_EDGE;
	range = Range_VLKSchwert;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Piratensaebel(C_Item)
{
	name = "Pirátská šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Piratensaebel;
	damageTotal = Damage_Piratensaebel;
	damagetype = DAM_EDGE;
	range = Range_Piratensaebel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Piratensaebel;
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

instance ItMw_Nagelkeule(C_Item)
{
	name = "Hřeby pobitá palice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Nagelkeule;
	damageTotal = Damage_Nagelkeule;
	damagetype = DAM_BLUNT;
	range = Range_Nagelkeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Nagelkeule;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_ShortSword4(C_Item)
{
	name = "Vlčí zub";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_ShortSword4;
	damageTotal = Damage_ShortSword4;
	damagetype = DAM_EDGE;
	range = Range_ShortSword4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ShortSword4;
	visual = "ItMw_020_1h_Sword_short_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Kriegskeule(C_Item)
{
	name = "Válečná palice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Kriegskeule;
	damageTotal = Damage_Kriegskeule;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Kriegskeule;
	visual = "ItMw_022_1h_mace_war_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Richtstab(C_Item)
{
	name = "Soudcovská hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Richtstab;
	damageTotal = Damage_Richtstab;
	damagetype = DAM_EDGE;
	range = Range_Richtstab;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Richtstab;
	visual = "ItMw_025_2h_Staff_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_ShortSword5(C_Item)
{
	name = "Kvalitní krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_ShortSword5;
	damageTotal = Damage_ShortSword5;
	damagetype = DAM_EDGE;
	range = Range_ShortSword5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ShortSword5;
	visual = "ItMw_025_1h_Sword_short_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Kriegshammer1(C_Item)
{
	name = "Válečné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Kriegshammer1;
	damageTotal = Damage_Kriegshammer1;
	damagetype = DAM_BLUNT;
	range = Range_Kriegshammer1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Kriegshammer1;
	visual = "ItMw_028_1h_warhammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Hellebarde(C_Item)
{
	name = "Halapartna";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Hellebarde;
	damageTotal = Damage_Hellebarde;
	damagetype = DAM_EDGE;
	range = Range_Hellebarde;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Hellebarde;
	visual = "itmw_028_2h_halberd_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Nagelkeule2(C_Item)
{
	name = "Těžká hřeby pobitá palice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Nagelkeule2;
	damageTotal = Damage_Nagelkeule2;
	damagetype = DAM_BLUNT;
	range = Range_Nagelkeule2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Nagelkeule2;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Schiffsaxt(C_Item)
{
	name = "Loďařská sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Schiffsaxt;
	damageTotal = Damage_Schiffsaxt;
	damagetype = DAM_EDGE;
	range = Range_Schiffsaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schiffsaxt;
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

instance ItMw_Schwert(C_Item)
{
	name = "Primitivní dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert;
	damageTotal = Damage_Schwert;
	damagetype = DAM_EDGE;
	range = Range_Schwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert;
	visual = "ItMw_030_1h_sword_long_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Common_01(C_Item)
{
	name = NAME_ItMw_1H_Common_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Common1;
	damageTotal = Damage_Common1;
	damagetype = DAM_EDGE;
	range = Range_Common1;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Common1;
	visual = "ItMw_030_1h_Common_Sword_01.3DS";
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

instance ItMw_Stabkeule(C_Item)
{
	name = "Dlouhý palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stabkeule;
	damageTotal = Damage_Stabkeule;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Stabkeule;
	visual = "ItMw_032_2h_staff_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Zweihaender1(C_Item)
{
	name = "Lehký obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Zweihaender1;
	damageTotal = Damage_Zweihaender1;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Zweihaender1;
	visual = "ItMw_032_2h_sword_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Steinbrecher(C_Item)
{
	name = "Drtič kamene";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Steinbrecher;
	damageTotal = Damage_Steinbrecher;
	damagetype = DAM_BLUNT;
	range = Range_Steinbrecher;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Steinbrecher;
	visual = "ItMw_035_1h_mace_war_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Spicker(C_Item)
{
	name = "Lebkoštěp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Spicker;
	damageTotal = Damage_Spicker;
	damagetype = DAM_BLUNT;
	range = Range_Spicker;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Spicker;
	visual = "ItMw_035_1h_mace_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Streitaxt1(C_Item)
{
	name = "Lehká bitevní sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Streitaxt1;
	damageTotal = Damage_Streitaxt1;
	damagetype = DAM_EDGE;
	range = Range_Streitaxt1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Streitaxt1;
	visual = "ItMw_035_2h_Axe_light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Schwert1(C_Item)
{
	name = "Kvalitní meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert1;
	damageTotal = Damage_Schwert1;
	damagetype = DAM_EDGE;
	range = Range_Schwert1;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert1;
	visual = "ItMw_035_1h_Sword_04.3DS";
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

instance ItMw_Schwert2(C_Item)
{
	name = "Dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert2;
	damageTotal = Damage_Schwert2;
	damagetype = DAM_EDGE;
	range = Range_Schwert2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert2;
	visual = "ItMw_037_1h_sword_long_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Doppelaxt(C_Item)
{
	name = "Dvoubřitá sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Doppelaxt;
	damageTotal = Damage_Doppelaxt;
	damagetype = DAM_EDGE;
	range = Range_Doppelaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Doppelaxt;
	visual = "ItMw_040_1h_Axe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Bartaxt(C_Item)
{
	name = "Bradatice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Bartaxt;
	damageTotal = Damage_Bartaxt;
	damagetype = DAM_EDGE;
	range = Range_Bartaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Bartaxt;
	visual = "ItMw_040_1h_axe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Morgenstern(C_Item)
{
	name = "Řemdih";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Morgenstern;
	damageTotal = Damage_Morgenstern;
	damagetype = DAM_BLUNT;
	range = Range_Morgenstern;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Morgenstern;
	visual = "ItMW_045_1h_mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Schwert3(C_Item)
{
	name = "Primitivní meč bastard";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert3;
	damageTotal = Damage_Schwert3;
	damagetype = DAM_EDGE;
	range = Range_Schwert3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert3;
	visual = "ItMw_045_1h_Sword_Bastard_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Schwert4(C_Item)
{
	name = "Kvalitní dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert4;
	damageTotal = Damage_Schwert4;
	damagetype = DAM_EDGE;
	range = Range_Schwert4;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert4;
	visual = "ItMw_045_1h_Sword_long_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_06;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Special_01(C_Item)
{
	name = NAME_ItMw_1H_Special_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Special_1H_1;
	damageTotal = Damage_Special_1H_1;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_1;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Special_01(C_Item)
{
	name = NAME_ItMw_2H_Special_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Special_2H_1;
	damageTotal = Damage_Special_2H_1;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_1;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_2H_1;
	visual = "ItMw_050_2h_Sword_smith_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[2] = NAME_ADDON_BONUS_2H;
	count[2] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Rubinklinge(C_Item)
{
	name = "Rubínová čepel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Rubinklinge;
	damageTotal = Damage_Rubinklinge;
	damagetype = DAM_EDGE;
	range = Range_Rubinklinge;
	on_equip = Equip_1H_07;
	on_unequip = UnEquip_1H_07;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rubinklinge;
	visual = "ItMw_050_1h_sword_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_07;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Streitkolben(C_Item)
{
	name = "Palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Streitkolben;
	damageTotal = Damage_Streitkolben;
	damagetype = DAM_BLUNT;
	range = Range_Streitkolben;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Streitkolben;
	visual = "ItMw_050_1h_mace_war_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Zweihaender2(C_Item)
{
	name = "Obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Zweihaender2;
	damageTotal = Damage_Zweihaender2;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Zweihaender2;
	visual = "ItMw_055_2h_sword_light_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Runenschwert(C_Item)
{
	name = "Runový meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Runenschwert;
	damageTotal = Damage_Runenschwert;
	damagetype = DAM_EDGE;
	range = Range_Runenschwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Runenschwert;
	visual = "ItMw_055_1h_sword_long_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Rabenschnabel(C_Item)
{
	name = "Havraní zobák";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Rabenschnabel;
	damageTotal = Damage_Rabenschnabel;
	damagetype = DAM_BLUNT;
	range = Range_Rabenschnabel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rabenschnabel;
	visual = "ItMw_058_1h_warhammer_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Schwert5(C_Item)
{
	name = "Kvalitní meč bastard";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert5;
	damageTotal = Damage_Schwert5;
	damagetype = DAM_EDGE;
	range = Range_Schwert5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Inquisitor(C_Item)
{
	name = "Inkvizitor";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Inquisitor;
	damageTotal = Damage_Inquisitor;
	damagetype = DAM_EDGE;
	range = Range_Inquisitor;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Inquisitor;
	visual = "ItMw_060_1h_mace_war_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Streitaxt2(C_Item)
{
	name = "Bitevní sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Streitaxt2;
	damageTotal = Damage_Streitaxt2;
	damagetype = DAM_EDGE;
	range = Range_Streitaxt2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Streitaxt2;
	visual = "ItMw_060_2h_axe_heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Zweihaender3(C_Item)
{
	name = "Runová moc";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Zweihaender3;
	damageTotal = Damage_Zweihaender3;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Zweihaender3;
	visual = "ItMw_060_2h_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Special_02(C_Item)
{
	name = NAME_ItMw_1H_Special_02;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Special_1H_2;
	damageTotal = Damage_Special_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_2;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Special_02(C_Item)
{
	name = NAME_ItMw_2H_Special_02;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Special_2H_2;
	damageTotal = Damage_Special_2H_2;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_2;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_2H_2;
	visual = "ItMw_070_2h_Sword_smith_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_ElBastardo(C_Item)
{
	name = "El Bastardo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_ElBastardo;
	damageTotal = Damage_ElBastardo;
	damagetype = DAM_EDGE;
	range = Range_ElBastardo;
	on_equip = Equip_1H_08;
	on_unequip = UnEquip_1H_08;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ElBastardo;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_08;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Kriegshammer2(C_Item)
{
	name = "Těžké válečné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Kriegshammer2;
	damageTotal = Damage_Kriegshammer2;
	damagetype = DAM_BLUNT;
	range = Range_Kriegshammer2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Kriegshammer2;
	visual = "ItMw_065_1h_warhammer_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Folteraxt(C_Item)
{
	name = "Mučitelská sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Folteraxt;
	damageTotal = Damage_Folteraxt;
	damagetype = DAM_EDGE;
	range = Range_Folteraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Folteraxt;
	visual = "ItMw_065_2h_greataxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Orkschlaechter(C_Item)
{
	name = "Skřetobij";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Orkschlaechter;
	damageTotal = Damage_Orkschlaechter;
	damagetype = DAM_EDGE;
	range = Range_Orkschlaechter;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkschlaechter;
	visual = "ItMw_065_1h_sword_bastard_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Zweihaender4(C_Item)
{
	name = "Těžký obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Zweihaender4;
	damageTotal = Damage_Zweihaender4;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Zweihaender4;
	visual = "ItMw_068_2h_sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Schlachtaxt(C_Item)
{
	name = "Válečná sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Schlachtaxt;
	damageTotal = Damage_Schlachtaxt;
	damagetype = DAM_EDGE;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schlachtaxt;
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

instance ItMw_Krummschwert(C_Item)
{
	name = "Válečná šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Scimitar;
	damageTotal = Damage_Scimitar;
	damagetype = DAM_EDGE;
	range = Range_Scimitar;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Scimitar;
	visual = "ItMw_070_2h_sword_09.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Barbarenstreitaxt(C_Item)
{
	name = "Barbarská bitevní sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Barbarenstreitaxt;
	damageTotal = Damage_Barbarenstreitaxt;
	damagetype = DAM_EDGE;
	range = Range_Barbarenstreitaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Barbarenstreitaxt;
	visual = "ItMw_075_2h_axe_heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Sturmbringer(C_Item)
{
	name = "Přivolávač bouří";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sturmbringer;
	damageTotal = Damage_Sturmbringer;
	damagetype = DAM_EDGE;
	range = Range_Sturmbringer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sturmbringer;
	visual = "ItMw_075_2h_sword_heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Special_03(C_Item)
{
	name = NAME_ItMw_1H_Special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Special_1H_3;
	damageTotal = Damage_Special_1H_3;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_3;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Special_03(C_Item)
{
	name = NAME_ItMw_2H_Special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Special_2H_3;
	damageTotal = Damage_Special_2H_3;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_3;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_2H_3;
	visual = "ItMw_090_2h_sword_smith_04.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Berserkeraxt(C_Item)
{
	name = "Sekera berserkera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = Damage_Berserkeraxt;
	damagetype = DAM_EDGE;
	range = Range_Berserkeraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Berserkeraxt;
	visual = "G3_WEAPON_AXE_BERZERKAXE_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Drachenschneide(C_Item)
{
	name = "Sekáč draků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Drachenschneide;
	damageTotal = Damage_Drachenschneide;
	damagetype = DAM_EDGE;
	range = Range_Drachenschneide;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Drachenschneide;
	visual = "itMw_080_2h_sword_heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Special_04(C_Item)
{
	name = NAME_ItMw_1H_Special_04;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Special_1H_4;
	damageTotal = Damage_Special_1H_4;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_4;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGESTAFF2";
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_4;
	visual = "Konzeptklingeonehanded.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Special_04(C_Item)
{
	name = NAME_ItMw_2H_Special_04;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Special_2H_4;
	damageTotal = Damage_Special_2H_4;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_4;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGESTAFF2";
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_2H_4;
	visual = "G3_WEAPON_2H_SWORD_INNOSWRATH_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Blessed_01(C_Item)
{
	name = "Primitivní čepel z rudy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_1;
	damageTotal = Damage_Blessed_1H_1;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_1;
	visual = "innoswrathRED.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Blessed_02(C_Item)
{
	name = "Posvěcená čepel z rudy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_2;
	damageTotal = Damage_Blessed_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_2;
	visual = "INNOSWRATH.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Blessed_03(C_Item)
{
	name = "Innosův hněv";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_3;
	damageTotal = Damage_Blessed_1H_3;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_3;
	visual = "INNOSWRATH.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Blessed_01(C_Item)
{
	name = "Primitivní čepel z rudy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Blessed_2H_1;
	damageTotal = Damage_Blessed_2H_1;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_1;
	visual = "innosholyenforcerRED.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Blessed_02(C_Item)
{
	name = "Meč řádu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Blessed_2H_2;
	damageTotal = Damage_Blessed_2H_2;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_2;
	visual = "INNOSHOLYENFORCER.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Blessed_03(C_Item)
{
	name = "Velký innosův hněv";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Blessed_2H_3;
	damageTotal = Damage_Blessed_2H_3;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_3;
	visual = "INNOSHOLYENFORCER.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_CRYPTO01(C_Item)
{
	name = "Prastarý měč válečníků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_CRYPTO01;
	damageTotal = DAMAGE_CRYPTO01;
	damagetype = DAM_EDGE;
	range = RANGE_CRYPTO01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_CRYPTO01;
	visual = "ahktrah_longsword.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_CRYPTO02(C_Item)
{
	name = "Prastarý Velký měč válečníků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_CRYPTO02;
	damageTotal = DAMAGE_CRYPTO02;
	damagetype = DAM_EDGE;
	range = RANGE_CRYPTO02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_CRYPTO02;
	visual = "ahktrah_claymore.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_CRYPTO03(C_Item)
{
	name = "Prastará Dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_CRYPTO03;
	damageTotal = DAMAGE_CRYPTO03;
	damagetype = DAM_EDGE;
	range = RANGE_CRYPTO03;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_CRYPTO03;
	visual = "akhtrah_sword.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SMITHNEW(C_Item)
{
	name = "Spravedlnost";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ARC_SWORD1H.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SMITHNEW(C_Item)
{
	name = "Mírotvůrce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ARC_SWORD2H.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_GREGNEW(C_Item)
{
	name = "Greguv zabiják";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 3500;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ITMW_SPAGE_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT_FASTDEATH(C_Item)
{
	name = "Rychlá smrt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 3500;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 120;
	on_equip = Equip_1H_08;
	on_unequip = UnEquip_1H_08;
	visual = "ITMW_FLYSSA.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

