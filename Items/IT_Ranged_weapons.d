
const int BOW_DEX = 5;
const int BOW_DEX02 = 5;
const int BOW_DEX03 = 10;
const int BOW_DEX04 = 10;
const int BOW_DEX05 = 15;
const int BOW_DEX06 = 15;
const int BOW_STR = 5;
const int BOW_STR02 = 10;
const int BOW_STR03 = 15;
const int VALUE_NEWARROW = 3;
const int VALUE_NEWARROW2 = 4;

instance ItRw_Arrow(C_Item)
{
	name = "Šíp";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = VALUE_NEWARROW;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bolt(C_Item)
{
	name = "Střela";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = VALUE_NEWARROW2;
	visual = "ItRw_Bolt.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Mil_Crossbow(C_Item)
{
	name = "Kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damageTotal = Damage_MilArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MilArmbrust;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Sld_Bow(C_Item)
{
	name = "Luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_SldBogen;
	damageTotal = Damage_SldBogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_SldBogen;
	visual = "ITRW_BOW_D_R2.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_01(C_Item)
{
	name = "Krátký luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kurzbogen;
	damageTotal = Damage_Kurzbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kurzbogen;
	visual = "ItRw_Bow_L_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_02(C_Item)
{
	name = "Vrbový luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Weidenbogen;
	damageTotal = Damage_Weidenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Weidenbogen;
	visual = "ITRW_G3_SMALL_BOW_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_03(C_Item)
{
	name = "Lovecký luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_M_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_04(C_Item)
{
	name = "Jilmový luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Ulmenbogen;
	damageTotal = Damage_Ulmenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Ulmenbogen;
	visual = "ItRw_Bow_M_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_01(C_Item)
{
	name = "Skládaný luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kompositbogen;
	damageTotal = Damage_Kompositbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kompositbogen;
	visual = "ITRW_BOW_LONG_ARABIC.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_02(C_Item)
{
	name = "Jasanový luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Eschenbogen;
	damageTotal = Damage_Eschenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Eschenbogen;
	visual = "ITRW_KMR_SHADOWS_BOW_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_03(C_Item)
{
	name = "Dlouhý luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Langbogen;
	damageTotal = Damage_Langbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Langbogen;
	visual = "ItRw_Bow_H_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_04(C_Item)
{
	name = "Bukový luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Buchenbogen;
	damageTotal = Damage_Buchenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Buchenbogen;
	visual = "ItRw_Bow_M_04.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_01(C_Item)
{
	name = "Kostěný luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Knochenbogen;
	damageTotal = Damage_Knochenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Knochenbogen;
	visual = "ITRW_BOWMAKED4_G3_HORN.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_02(C_Item)
{
	name = "Dubový luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Eichenbogen;
	damageTotal = Damage_Eichenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Eichenbogen;
	visual = "ITRW_G4_OAK_BOW_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_03(C_Item)
{
	name = "Válečný luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kriegsbogen;
	damageTotal = Damage_Kriegsbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kriegsbogen;
	visual = "ItRw_Bow_H_03_NEW.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_04(C_Item)
{
	name = "Dračí luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Drachenbogen;
	damageTotal = Damage_Drachenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Drachenbogen;
	visual = "ITRW_BOW_S_DAEDRIC.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_L_01(C_Item)
{
	name = "Lovecká kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Jagdarmbrust;
	damageTotal = Damage_Jagdarmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Jagdarmbrust;
	visual = "ItRw_Crossbow_L_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_L_02(C_Item)
{
	name = "Lehká kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damageTotal = Damage_LeichteArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_M_01(C_Item)
{
	name = "Bojová kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Armbrust;
	damageTotal = Damage_Armbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Armbrust;
	visual = "ITRW_CROSSBOW_S_DAWNGUARD.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_M_02(C_Item)
{
	name = "Válečná kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Kriegsarmbrust;
	damageTotal = Damage_Kriegsarmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Kriegsarmbrust;
	visual = "ItRw_Crossbow_M_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_H_01(C_Item)
{
	name = "Těžká kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_SchwereArmbrust;
	damageTotal = Damage_SchwereArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_SchwereArmbrust;
	visual = "CROSSBOW_BLACK_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_H_02(C_Item)
{
	name = "Kuše drakobijců";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Drachenjaegerarmbrust;
	damageTotal = Damage_Drachenjaegerarmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Drachenjaegerarmbrust;
	visual = "ItRw_Crossbow_H_01_NEW.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_WOLF(C_Item)
{
	name = "Vylepšený luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Ulmenbogen;
	damageTotal = Damage_Ulmenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Ulmenbogen;
	visual = "ITRW_BOW_A_WOLFRIPPER.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_BOW_COBRA(C_Item)
{
	name = "Unikatní luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kriegsbogen;
	damageTotal = Damage_Kriegsbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kriegsbogen;
	visual = "ITRW_BOW_R2_COBRA.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_BOWMAKER1(C_Item)
{
	name = "Luk Měsíc";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 1000;
	damageTotal = 55;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_bowmaker1;
	on_unequip = unequip_bowmaker1;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 40;
	visual = "ITRW_BOW_R2_SLD.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobený";
	text[4] = NAME_Bonus_Dex;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_bowmaker1()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BOW_DEX);
};

func void unequip_bowmaker1()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BOW_DEX);
};


instance ITRW_BOWMAKER2(C_Item)
{
	name = "Luk Vítr";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 1000;
	damageTotal = 60;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_bowmaker2;
	on_unequip = unequip_bowmaker2;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 45;
	visual = "ITRW_BOWMAKED8_S_DRAGONBONE.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobený";
	text[4] = NAME_Bonus_Dex;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_bowmaker2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BOW_DEX02);
};

func void unequip_bowmaker2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BOW_DEX02);
};


instance ITRW_BOWMAKER3(C_Item)
{
	name = "Luk Ultimátum";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 1500;
	damageTotal = 100;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_bowmaker3;
	on_unequip = unequip_bowmaker3;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 80;
	visual = "ITRW_KMR_DARKLONG_BOW_01.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobený";
	text[4] = NAME_Bonus_Dex;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_bowmaker3()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BOW_DEX03);
};

func void unequip_bowmaker3()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BOW_DEX03);
};


instance ITRW_BOWMAKER4(C_Item)
{
	name = "Luk Úsvit";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 1500;
	damageTotal = 105;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_bowmaker4;
	on_unequip = unequip_bowmaker4;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 85;
	visual = "ITRW_KMR_KADAT_BOW_01.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobený";
	text[4] = NAME_Bonus_Dex;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_bowmaker4()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BOW_DEX04);
};

func void unequip_bowmaker4()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BOW_DEX04);
};


instance ITRW_BOWMAKER5(C_Item)
{
	name = "Luk Tichá smrt";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 3500;
	damageTotal = 170;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_bowmaker5;
	on_unequip = unequip_bowmaker5;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 130;
	visual = "ITRW_G3_SILENTDEATH_BOW_01.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobený";
	text[4] = NAME_Bonus_Dex;
	count[4] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_bowmaker5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BOW_DEX05);
};

func void unequip_bowmaker5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BOW_DEX05);
};


instance ITRW_BOWMAKER6(C_Item)
{
	name = "Luk Soumrak";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 3500;
	damageTotal = 175;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_bowmaker6;
	on_unequip = unequip_bowmaker6;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 140;
	visual = "ITRW_BOWMAKED6_S_NIGHTINGALEBOW.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobený";
	text[4] = NAME_Bonus_Dex;
	count[4] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_bowmaker6()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BOW_DEX06);
};

func void unequip_bowmaker6()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BOW_DEX06);
};


instance ITRW_CROSMAKER1(C_Item)
{
	name = "Kuše Ochrana";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 1500;
	damageTotal = 80;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	on_equip = equip_crosmaker1;
	on_unequip = unequip_crosmaker1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "CROSSBOW_BLACK_01.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobená";
	text[4] = NAME_Bonus_Str;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_crosmaker1()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BOW_STR);
};

func void unequip_crosmaker1()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BOW_STR);
};


instance ITRW_CROSMAKER2(C_Item)
{
	name = "Kuše Záblesk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 2500;
	damageTotal = 140;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	on_equip = equip_crosmaker2;
	on_unequip = unequip_crosmaker2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "KM_ITRW_CROSSBOW_02.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobená";
	text[4] = NAME_Bonus_Str;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_crosmaker2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BOW_STR02);
};

func void unequip_crosmaker2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BOW_STR02);
};


instance ITRW_CROSMAKER3(C_Item)
{
	name = "Kuše Ničitel";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 3500;
	damageTotal = 190;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	on_equip = equip_crosmaker3;
	on_unequip = unequip_crosmaker3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	visual = "ITRW_CROSSBOW_A_XBOW_LEVIATHAN.MMS";
	effect = "";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Vlastnoručně vyrobená";
	text[4] = NAME_Bonus_Str;
	count[4] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_crosmaker3()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BOW_STR03);
};

func void unequip_crosmaker3()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BOW_STR03);
};

