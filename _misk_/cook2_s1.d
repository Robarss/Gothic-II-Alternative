
func void cook2_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_COOK2;
		AI_ProcessInfos(her);
	};
};


instance PC_NOCOOK2(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nocook2_condition;
	information = pc_nocook2_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_nocook2_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2)
	{
		return TRUE;
	};
};

func void pc_nocook2_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_MEATCOOK_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_meatcook_start_condition;
	information = pc_meatcook_start_info;
	permanent = TRUE;
	description = "Opéct maso.";
};


func int pc_meatcook_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_meatcook_start_info()
{
	MEATCOOKSTART = TRUE;
};


instance PC_MEATCOOK_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_meatcook_stop_condition;
	information = pc_meatcook_stop_info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int pc_meatcook_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_meatcook_stop_info()
{
	MEATCOOKSTART = FALSE;
};


instance PC_MET(C_Info)
{
	npc = PC_Hero;
	condition = pc_met_condition;
	information = pc_met_info;
	permanent = 1;
	description = "Opéct 1x maso";
};


func int pc_met_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_met_info()
{
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		CreateInvItems(hero,ItFoMutton,1);
		PrintScreen("Opekl jsi maso",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_met;

instance PC_METII(C_Info)
{
	npc = PC_Hero;
	condition = pc_metii_condition;
	information = pc_metii_info;
	permanent = 1;
	description = "Opéct 5x maso";
};


func int pc_metii_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_metii_info()
{
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 5)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,5);
		CreateInvItems(hero,ItFoMutton,5);
		PrintScreen("Opekl jsi maso",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_metii;

instance PC_METIII(C_Info)
{
	npc = PC_Hero;
	condition = pc_metiii_condition;
	information = pc_metiii_info;
	permanent = 1;
	description = "Opéct 10x maso";
};


func int pc_metiii_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_metiii_info()
{
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 10)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,10);
		CreateInvItems(hero,ItFoMutton,10);
		PrintScreen("Opekl jsi maso",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_metiii;

instance PC_METV(C_Info)
{
	npc = PC_Hero;
	condition = pc_metv_condition;
	information = pc_metv_info;
	permanent = 1;
	description = "Opéct 1x rybu";
};


func int pc_metv_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_metv_info()
{
	if(Npc_HasItems(hero,ItFo_Fish) >= 1)
	{
		Npc_RemoveInvItems(hero,ItFo_Fish,1);
		CreateInvItems(hero,itfo_fish2,1);
		PrintScreen("Opekl jsi Rybu",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_metv;

instance PC_METVI(C_Info)
{
	npc = PC_Hero;
	condition = pc_metvi_condition;
	information = pc_metvi_info;
	permanent = 1;
	description = "Opéct všechno maso";
};


func int pc_metvi_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_COOK2) && (MEATCOOKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_metvi_info()
{
	var C_Npc her;
	var C_Npc rock;
	var int opecene_maso;
	var int ilost_maso;
	var string napis_maso;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
		{
			ilost_maso = Npc_HasItems(hero,ItFoMuttonRaw);
			if(ilost_maso > 0)
			{
				Npc_RemoveInvItems(hero,ItFoMuttonRaw,ilost_maso);
				CreateInvItems(hero,ItFoMutton,ilost_maso);
				napis_maso = ConcatStrings(IntToString(ilost_maso)," Kusu masa opečeno.");
				PrintScreen(napis_maso,-1,70,FONT_ScreenSmall,2);
			};
		}
		else
		{
			PrintScreen("Nedostatek ingrediencí!",-1,-1,FONT_ScreenSmall,2);
			AI_StopProcessInfos(self);
			PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
			self.aivar[AIV_INVINCIBLE] = FALSE;
		};
	};
};


var int knows_metvi;
