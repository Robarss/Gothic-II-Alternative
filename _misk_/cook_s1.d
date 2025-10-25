
func void cook_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_COOK;
		AI_ProcessInfos(her);
	};
};


instance PC_NOCOOK(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nocook_condition;
	information = pc_nocook_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_nocook_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_COOK)
	{
		return TRUE;
	};
};

func void pc_nocook_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_FISHSOUP(C_Info)
{
	npc = PC_Hero;
	condition = pc_fishsoup_condition;
	information = pc_fishsoup_info;
	permanent = 1;
	description = "Rybí polévka (2x Ryba)";
};


func int pc_fishsoup_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK) && (KNOWS_FISHSOUP == TRUE))
	{
		return TRUE;
	};
};

func void pc_fishsoup_info()
{
	if((Npc_HasItems(hero,ItFo_Fish) >= 1) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Fish,1);
		Npc_RemoveInvItems(hero,ItFo_Fish,1);
		CreateInvItems(hero,ItFo_FishSoup,1);
		PrintScreen("Uvařil jsi: Rybí polévku!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_fishsoup;

instance PC_COOKHPI(C_Info)
{
	npc = PC_Hero;
	condition = pc_cookhpi_condition;
	information = pc_cookhpi_info;
	permanent = 1;
	description = "Kompot z lesních bobulí (20x lesní bobule)";
};


func int pc_cookhpi_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK) && (KNOWS_COOKHPI == TRUE))
	{
		return TRUE;
	};
};

func void pc_cookhpi_info()
{
	if(Npc_HasItems(hero,ItPl_Forestberry) >= 20)
	{
		Npc_RemoveInvItems(hero,ItPl_Forestberry,20);
		CreateInvItems(hero,itfo_cookhpi,1);
		PrintScreen("Uvařil jsi: Kompot z lesních bobulí!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_cookhpi;

instance PC_COOKHPII(C_Info)
{
	npc = PC_Hero;
	condition = pc_cookhpii_condition;
	information = pc_cookhpii_info;
	permanent = 1;
	description = "Kompot z lučních bobulí (20x lesní bobule)";
};


func int pc_cookhpii_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK) && (KNOWS_COOKHPII == TRUE))
	{
		return TRUE;
	};
};

func void pc_cookhpii_info()
{
	if(Npc_HasItems(hero,ItPl_Planeberry) >= 20)
	{
		Npc_RemoveInvItems(hero,ItPl_Planeberry,20);
		CreateInvItems(hero,itfo_cookhpii,1);
		PrintScreen("Uvařil jsi: Kompot z lučních bobulí!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_cookhpii;

instance PC_COOKSTR(C_Info)
{
	npc = PC_Hero;
	condition = pc_cookstr_condition;
	information = pc_cookstr_info;
	permanent = 1;
	description = "Specialní pokrm ze žravých štěnic (3x žravé štěnice, 20x boruvky, 1x dračí kořen)";
};


func int pc_cookstr_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK) && (KNOWS_COOKSTR == TRUE))
	{
		return TRUE;
	};
};

func void pc_cookstr_info()
{
	if((Npc_HasItems(hero,ItAt_Meatbugflesh) >= 3) && (Npc_HasItems(hero,ItPl_Blueplant) >= 20) && (Npc_HasItems(hero,ItPl_Strength_Herb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,3);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,20);
		Npc_RemoveInvItems(hero,ItPl_Strength_Herb_01,1);
		CreateInvItems(hero,itfo_cookstr,1);
		PrintScreen("Uvařil jsi: Specialní pokrm ze žravých štěnic!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_cookstr;

instance PC_COOKDEX(C_Info)
{
	npc = PC_Hero;
	condition = pc_cookdex_condition;
	information = pc_cookdex_info;
	permanent = 1;
	description = "Specialní polévka z ústřic (2x Maso ze škeble, 10x Chňapavčí býlí, 1x Gobliní bobule)";
};


func int pc_cookdex_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK) && (KNOWS_COOKDEX == TRUE))
	{
		return TRUE;
	};
};

func void pc_cookdex_info()
{
	if((Npc_HasItems(hero,ItFo_Addon_Shellflesh) >= 2) && (Npc_HasItems(hero,ItPl_Speed_Herb_01) >= 10) && (Npc_HasItems(hero,ItPl_Dex_Herb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Addon_Shellflesh,2);
		Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,10);
		Npc_RemoveInvItems(hero,ItPl_Dex_Herb_01,1);
		CreateInvItems(hero,itfo_cookdex,1);
		PrintScreen("Uvařil jsi: Specialní polévka z ústřic!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_cookdex;
