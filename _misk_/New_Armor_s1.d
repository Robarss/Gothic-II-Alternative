
instance NEW_ARMOR_S1(C_Item)
{
};

instance ITAR_LEATHER_L_GRD3(C_Item)
{
	name = "Silnější kožená zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L_GRD3.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l_grd3;
	on_unequip = unequip_itar_leather_l_grd3;
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


func void equip_itar_leather_l_grd3()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = TRUE;
		if(Leather01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_leather_l_grd3()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = FALSE;
		if(Leather01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_HUNARM(C_Item)
{
	name = "Zbroj ze skřetích psů";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	value = 800;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "FER_M_BLACK_ARMOR_01.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_PCHERO(C_Item)
{
	name = "Otrhaný oblek";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 1;
	protection[PROT_BLUNT] = 1;
	protection[PROT_POINT] = 1;
	protection[PROT_FIRE] = 1;
	protection[PROT_MAGIC] = 1;
	value = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	visual_change = "LUMPEN1.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_HUNTROLL(C_Item)
{
	name = "Zbroj z černého trola";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 20;
	value = 1500;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "FER_BLACKTROLL_ARMOR_H01.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_SLD_H01(C_Item)
{
	name = "Těžká  žoldnéřská zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 85;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	value = VALUE_ITAR_SLD_H;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_H.3ds";
	visual_change = "Armor_Sld_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_h01;
	on_unequip = unequip_itar_sld_h01;
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


func void equip_itar_sld_h01()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_sld_h01()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_GERALT_ADDON(C_Item)
{
	name = "Vystužená tunika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_GERALT_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_geralt_addon;
	on_unequip = unequip_itar_geralt_addon;
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


func void equip_itar_geralt_addon()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_geralt_addon()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_WMA_ASSN(C_Item)
{
	name = "Zlodějská zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "ARMOR_WMA_ASSN.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_wma_assn;
	on_unequip = unequip_itar_wma_assn;
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


func void equip_itar_wma_assn()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_wma_assn()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_W2_VES(C_Item)
{
	name = "Zlodějský šat";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "ARMOR_W2_VES.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_w2_ves;
	on_unequip = unequip_itar_w2_ves;
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


func void equip_itar_w2_ves()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_w2_ves()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_HUNTER_LIGHT(C_Item)
{
	name = "Lovecká zbroj z trollí kůže";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_TROLL_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_w2_ves;
	on_unequip = unequip_itar_w2_ves;
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


func void equip_itar_hunter_light()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_hunter_light()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_NADJA_ADDON(C_Item)
{
	name = "Corset";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 35;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "HUM_BODY_NADJA.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_w2_ves;
	on_unequip = unequip_itar_w2_ves;
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


func void equip_itar_nadja_addon()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_nadja_addon()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_NOBLE_THIEF(C_Item)
{
	name = "Zlodějský oděv";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 20;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3ds";
	visual_change = "ARMOR_NOBLE_THIEF.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_noble_thief;
	on_unequip = unequip_itar_noble_thief;
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


func void equip_itar_noble_thief()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_noble_thief()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_PALS_ARMOR(C_Item)
{
	name = "Stará královská obřadní zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 30;
	value = value_itar_pals_armor;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "HUM_PALS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_pals_armor;
	on_unequip = unequip_itar_pals_armor;
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


func void equip_itar_pals_armor()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_pals_armor()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_KNG_ARMOR(C_Item)
{
	name = "Stará obřadní zbroj krále";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 85;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 40;
	value = VALUE_ITAR_PALS_ARMOR;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "HUM_KNG_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_pals_armor;
	on_unequip = unequip_itar_pals_armor;
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


func void equip_itar_kng_armor()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_kng_armor()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_W2_TKNIGHT_GRD7(C_Item)
{
	name = "Masivní zbroj stráže ";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	value = VALUE_ITAR_PALS_ARMOR;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "ARMOR_W2_TKNIGHT_GRD7";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_w2_tknight_grd7;
	on_unequip = unequip_itar_w2_tknight_grd7;
	description = name;
	text[0] = "Může regenerovat 1 život za 7 sek.";
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


func void equip_itar_w2_tknight_grd7()
{
	Npc_ChangeAttribute(self,ATR_REGENERATEHP,-53);
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = TRUE;
		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void unequip_itar_w2_tknight_grd7()
{
	Npc_ChangeAttribute(self,ATR_REGENERATEHP,53);
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;
		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


const int VALUE_ITAR_MAGICFIGHTER = 120;

instance ITAR_MAGICFIGHTER(C_Item)
{
	name = "Válečné roucho ohně";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 125;
	protection[PROT_BLUNT] = 125;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 120;
	value = 120;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Itar_Magicfighter.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_magicfighter;
	on_unequip = unequip_itar_magicfighter;
	description = name;
	text[0] = "Může regenerovat manu a život (1 hp za 3 sek. manu za 1 sek.)";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};


func void equip_itar_magicfighter()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,-57);
	};
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEMANA,-59);
	};
};

func void unequip_itar_magicfighter()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,57);
	};
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEMANA,59);
	};
};


instance ITAR_DRAGONSS(C_Item)
{
	name = "Dračí růdná zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 140;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 110;
	protection[PROT_MAGIC] = 60;
	value = 20000;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_H.3ds";
	visual_change = "EBONOWAZBROJA13.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itar_dragonss;
	on_unequip = unequip_itar_dragonss;
	description = name;
	text[0] = "Může regenerovat život 1 bod za 1 sek.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};


func void equip_itar_dragonss()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,-59);
	};
};

func void unequip_itar_dragonss()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,59);
	};
};


instance ITAR_JACK(C_Item)
{
	name = "Stará kapitánská zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = 2000;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_L_ADDON.3ds";
	visual_change = "INUIT_M.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_PALUP(C_Item)
{
	name = "Vylepšená Rytířská zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 75;
	protection[PROT_MAGIC] = 35;
	value = 4000;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "ITAR_PAL_M_V15.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itar_palup;
	on_unequip = unequip_itar_palup;
	description = name;
	text[0] = "Může regenerovat život 1 bod za 3 sek.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};


func void equip_itar_palup()
{
	Npc_ChangeAttribute(self,ATR_REGENERATEHP,-57);
};

func void unequip_itar_palup()
{
	Npc_ChangeAttribute(self,ATR_REGENERATEHP,57);
};


instance ITAR_CRYPTOARM(C_Item)
{
	name = "Prastaré kněžské roucho";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 70;
	value = 4000;
	wear = WEAR_TORSO;
	visual = "ItAr_KDW_L_ADDON.3ds";
	visual_change = "HUM_GURM_ARMOR.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_DEMETORDEMON(C_Item)
{
	name = "Demonické roucho";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 200;
	protection[PROT_MAGIC] = 200;
	value = 4000;
	wear = WEAR_TORSO;
	visual = "ItAr_KDW_L_ADDON.3ds";
	visual_change = "ITAR_DEMENTOR_MASTER.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_HAGENPAL(C_Item)
{
	name = "Generálova zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 150;
	value = 5000;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "ARMOR_PAL_HLC.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_HUNTMISTR(C_Item)
{
	name = "Zbroj mistra Lovce";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	value = 3000;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "Armor_EVIL_New.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_NOBLES(C_Item)
{
	name = "Noblesní oděv";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = 1500;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3ds";
	visual_change = "czarna_dlugaaa.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_NOBLES2(C_Item)
{
	name = "Noblesní oděv";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = 1500;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3ds";
	visual_change = "zolta_dlugaaa.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};

instance ITAR_PALINNOS(C_Item)
{
	name = "Paladinská posvěcená zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 155;
	protection[PROT_BLUNT] = 155;
	protection[PROT_POINT] = 155;
	protection[PROT_FIRE] = 110;
	protection[PROT_MAGIC] = 60;
	value = 25000;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "ARMOR_PAL_H_INNOS.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itar_palinnos;
	on_unequip = unequip_itar_palinnos;
	description = name;
	text[0] = "Může regenerovat život a manu (1 hp za 1 sek. manu za 3 sek.)";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};


func void equip_itar_palinnos()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,-59);
	};
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEMANA,-57);
	};
};

func void unequip_itar_palinnos()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,59);
	};
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEMANA,57);
	};
};


instance ITAR_PALINNOS2(C_Item)
{
	name = "Paladinská posvěcená zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 155;
	protection[PROT_BLUNT] = 155;
	protection[PROT_POINT] = 155;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 60;
	value = 25000;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "ARMOR_PAL_H_INNOS2.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itar_palinnos2;
	on_unequip = unequip_itar_palinnos2;
	description = name;
	text[0] = "Může regenerovat život a manu (1 hp za 1 sek. manu za 3 sek.)";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = "Cena";
	count[5] = value;
};


func void equip_itar_palinnos2()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,-59);
	};
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEMANA,-57);
	};
};

func void unequip_itar_palinnos2()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEHP,59);
	};
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_REGENERATEMANA,57);
	};
};

