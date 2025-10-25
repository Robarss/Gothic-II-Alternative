
instance WEAPONS_2X2_S1(C_Item)
{
};

instance ITWR_TRAKTAT1(C_Item)
{
	name = "Rozprava o štítech";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Požadavky: 30% boj s jednoručními zbraněmi, cena 5 LP";
	text[2] = "Umožní boj se štítem";
	text[3] = "Kap. I Obsahuje zakladní zkušenosti ze štítem";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_traktat1;
};


func void use_traktat1()
{
	if((SCATTY_TEACH_PERM1 == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) >= 1) && (hero.lp >= 5))      //if((Cedric_Teach1H == TRUE) && (SCATTY_TEACH_PERM1 == FALSE)) // ((other.lp >= 5) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 1))
	{
		hero.lp = hero.lp - 5;
		SCATTY_TEACH_PERM1 = TRUE;
		B_TeachThiefTalent(other,self,NPC_TALENT_SHIELDD);
		PrintScreen("Naučil ses: Boj se štítem",-1,-1,FONT_Screen,3);
		CreateInvItems(hero,itwr_traktat1,1);
	}
	else
	{
		PrintScreen("Nejsem připraven!",-1,-1,FONT_Screen,3);
		CreateInvItems(hero,itwr_traktat1,1);
	};
};


instance ITWR_TRAKTAT2(C_Item)
{
	name = "Pojednání o štítech";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Požadavky: 60% boj s jednoručními zbraněmi, cena 10 LP";
	text[2] = "Umožní lépe bojovat se štítem.";
	text[3] = "Kap. II Obsahuje cenné rady pro zkušené bojovníky se štítem. ";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_traktat2;
};


func void use_traktat2()
{
	if((SCATTY_TEACH_PERM2 == FALSE) && (SCATTY_TEACH_PERM1 == TRUE) && (hero.lp >= 10) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) >= 2)) //Alternativa: (hero.aivar[REAL_TALENT_1H] >= 60)
	{
		hero.lp = hero.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		AI_UnequipWeapons(hero);
		B_TeachThiefTalent(other,self,NPC_TALENT_SHIELDD);
		PrintScreen("Naučil ses lépe bojovat se štítem",-1,-1,FONT_Screen,3);
		CreateInvItems(hero,itwr_traktat2,1);
	}
	else
	{
		PrintScreen("Nejsem připraven!",-1,-1,FONT_Screen,3);
		CreateInvItems(hero,itwr_traktat2,1);
	};
};


instance ITWR_TRAKTAT3(C_Item)
{
	name = "Pojednání o štítech";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 4000;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "Požadavky: 90% boj s jednoručními zbraněmi, cena 15 LP";
	text[2] = "Umožní lépe bojovat se štítem.";
	text[3] = "Kap. III Obsahuje mistrovské rady pro zkušené bojovníky se štítem. ";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_traktat3;
};


func void use_traktat3()
{
	if((SCATTY_TEACH_PERM3 == FALSE) && (SCATTY_TEACH_PERM2 == TRUE) && (SCATTY_TEACH_PERM1 == TRUE) && (hero.lp >= 15) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) >= 3)) //Alternativa: (hero.aivar[REAL_TALENT_1H] >= 90)
	{
		hero.lp = hero.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		AI_UnequipWeapons(hero);
		B_TeachThiefTalent(other,self,NPC_TALENT_SHIELDD);
		PrintScreen("Naučil ses mistrovsky bojovat se štítem",-1,-1,FONT_Screen,3);
		CreateInvItems(hero,itwr_traktat3,1);
	}
	else
	{
		PrintScreen("Nejsem připraven!",-1,-1,FONT_Screen,3);
		CreateInvItems(hero,itwr_traktat3,1);
	};
};


instance IT_2X2(C_Item)
{
	name = "Kniha o umění boje";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 6000;
	visual = "ItWr_Book_02_04.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_2x22;
	scemeName = "MAP";
	description = "Jižanské umění dvou zbraní";
	text[2] = "Varantský styl dvou zbraní";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_2x22()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if((hero.aivar[REAL_TALENT_1H] >= 80) && (hero.aivar[REAL_TALENT_2H] >= 80) && (Lerne_Einhand == TRUE))
		{
			TEACH_2X2_01 = TRUE;
			B_TeachThiefTalent(other,self,NPC_TALENT_2X2WEAPONS);
			Snd_Play("LevelUP");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jižanské umění dvou zbraní");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"K pochopení tohoto umění musí uživatel znát Jižanské umění obrany a být naprostý MISTR v jednoručními a obouručními zbraněmi.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sepsal Ugrasal z ishtary, mistr dvou zbraní.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance IT2X20(C_Item)
{
	name = "Hashishinská katana";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1100;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_2H_MASIAF.3DS";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_twoh2()
{
	if(TEACH_2X2_01 == TRUE)
	{
		Mdl_ApplyOverlayMds(self,"HUM_2X2.MDS");
	}
	else if(Npc_IsPlayer(self))
	{
		AI_UnequipWeapons(hero);
		PrintScreen("Neumím používat dvě zbraně!",-1,-1,FONT_Screen,3);
	};
};

func void unequip_twoh2()
{
	Mdl_RemoveOverlayMds(self,"HUM_2X2.MDS");
};


instance IT02X20(C_Item)
{
	name = "Hashishinská katana";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1100;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ITMW_2H_MASIAF.3DS";
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X21(C_Item)
{
	name = "Katana";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 900;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_2H_KATANA.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT12X21(C_Item)
{
	name = "Katana";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 900;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ITMW_2H_KATANA.3DS";
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X22(C_Item)
{
	name = "Měsíční čepel";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1300;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 100;
	visual = "ITMW_ARABICSWORD_01.3ds";
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT22X22(C_Item)
{
	name = "Měsíční čepel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1300;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 100;
	visual = "ITMW_ARABICSWORD_01.3DS";
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X23(C_Item)
{
	name = "Katana míru";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_KATANA_01.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT32X23(C_Item)
{
	name = "Katana míru";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ITMW_KATANA_01.3DS";
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X24(C_Item)
{
	name = "Sekera z jihu";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_1H_CHELDRAK_RIGHT.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT42X24(C_Item)
{
	name = "Sekera z jihu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_1H_CHELDRAK_RIGHT.3ds";
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X25(C_Item)
{
	name = "Pouštní zabiják Prastarých";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 850;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_1H_ANCIENT_RIGHT.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT52X25(C_Item)
{
	name = "Pouštní zabiják Prastarých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 850;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_1H_ANCIENT_RIGHT.3ds";
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X26(C_Item)
{
	name = "El Bastardo";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1200;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ItMw_065_1h_sword_bastard_03.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT62X26(C_Item)
{
	name = "El Bastardo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1200;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	on_equip = Equip_1H_08;
	on_unequip = UnEquip_1H_08;
	visual = "ItMw_065_1h_sword_bastard_03.3ds";
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X27(C_Item)
{
	name = "Skřetobij";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1300;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ItMw_065_1h_sword_bastard_04.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT72X27(C_Item)
{
	name = "Skřetobij";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1300;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	visual = "ItMw_065_1h_sword_bastard_04.3ds";
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X28(C_Item)
{
	name = "Kvalitní dlouhý meč";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ItMw_045_1h_Sword_long_04.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT82X28(C_Item)
{
	name = "Kvalitní dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	visual = "ItMw_065_1h_sword_bastard_04.3ds";
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X29(C_Item)
{
	name = "Rychlá smrt";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 3500;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 120;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ITMW_FLYSSA.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT92X29(C_Item)
{
	name = "Rychlá smrt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 3500;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 120;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	visual = "ITMW_FLYSSA.3ds";
	description = name;
	text[0] = "Pro pravou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X30(C_Item)
{
	name = "Sekáč draků";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 3000;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "itMw_080_2h_sword_heavy_04.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X31(C_Item)
{
	name = "Přivolávač bouří";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ItMw_075_2h_sword_heavy_03.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X32(C_Item)
{
	name = "Runová moc";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 115;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 115;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ItMw_060_2h_sword_01.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

instance IT2X33(C_Item)
{
	name = "Šavle";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 145;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 135;
	on_equip = equip_twoh2;
	on_unequip = unequip_twoh2;
	visual = "ItMw_070_2h_sword_09.3ds";
	description = name;
	text[0] = "Pro levou ruku";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TWOXTWO;
	text[5] = NAME_Value;
	count[5] = value;
};

