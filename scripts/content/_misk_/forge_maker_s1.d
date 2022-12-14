
instance FORGE_MAKER_S1(C_Item)
{
};


func void forgemaker_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_FORGEMAKER;
		AI_ProcessInfos(her);
	};
};


instance PC_NOFORGEMAKER(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noforgemaker_condition;
	information = pc_noforgemaker_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_noforgemaker_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER)
	{
		return TRUE;
	};
};

func void pc_noforgemaker_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_IGNOTH_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_ignoth_start_condition;
	information = pc_ignoth_start_info;
	permanent = TRUE;
	description = "Rozžhavit surovou ocel.";
};


func int pc_ignoth_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTART == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (IGNOTHSTARTII == FALSE))
	{
		return TRUE;
	};
};

func void pc_ignoth_start_info()
{
	IGNOTHSTART = TRUE;
};


instance PC_IGNOTH_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_ignoth_stop_condition;
	information = pc_ignoth_stop_info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int pc_ignoth_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_ignoth_stop_info()
{
	IGNOTHSTART = FALSE;
};


instance PC_IGNOTH1(C_Info)
{
	npc = PC_Hero;
	condition = pc_ignoth1_condition;
	information = pc_ignoth1_info;
	permanent = 1;
	description = "1x Rozžhavená ocel";
};


func int pc_ignoth1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_ignoth1_info()
{
	if(Npc_HasItems(hero,ItMiSwordraw) >= 1)
	{
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		CreateInvItems(hero,ItMiSwordrawhot,1);
		PrintScreen("Rozžhavil jsi ocel",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_ignoth1;

instance PC_IGNOTH2(C_Info)
{
	npc = PC_Hero;
	condition = pc_ignoth2_condition;
	information = pc_ignoth2_info;
	permanent = 1;
	description = "10x Rozžhavená ocel";
};


func int pc_ignoth2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_ignoth2_info()
{
	if(Npc_HasItems(hero,ItMiSwordraw) >= 9)
	{
		Npc_RemoveInvItems(hero,ItMiSwordraw,9);
		CreateInvItems(hero,ItMiSwordrawhot,9);
		PrintScreen("Rozžhavil jsi ocel",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_ignoth2;

instance PC_IGNOTH3(C_Info)
{
	npc = PC_Hero;
	condition = pc_ignoth3_condition;
	information = pc_ignoth3_info;
	permanent = 1;
	description = "Rozžhavit všechnu ocel";
};


func int pc_ignoth3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_ignoth3_info()
{
	var C_Npc her;
	var C_Npc rock;
	var int rozzhavena_ocel;
	var int ilost_ocel;
	var string napis_oceli;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		if(Npc_HasItems(hero,ItMiSwordraw) >= 1)
		{
			ilost_ocel = Npc_HasItems(hero,ItMiSwordraw);
			if(ilost_ocel > 0)
			{
				Npc_RemoveInvItems(hero,ItMiSwordraw,ilost_ocel);
				CreateInvItems(hero,ItMiSwordrawhot,ilost_ocel);
				napis_oceli = ConcatStrings(IntToString(ilost_ocel)," Kusu rozžhavených oceli.");
				PrintScreen(napis_oceli,-1,70,"font_old_20_white.tga",3);
			};
		}
		else
		{
			PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
			AI_StopProcessInfos(self);
			PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
			self.aivar[AIV_INVINCIBLE] = FALSE;
		};
	};
};


var int knows_ignoth3;

instance PC_IGNOTHII_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_ignothii_start_condition;
	information = pc_ignothii_start_info;
	permanent = TRUE;
	description = "Tavení.";
};


func int pc_ignothii_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTARTII == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (IGNOTHSTART == FALSE) && (KNOWS_MELTINGLER == TRUE))
	{
		return TRUE;
	};
};

func void pc_ignothii_start_info()
{
	IGNOTHSTARTII = TRUE;
};


instance PC_IGNOTHII_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_ignothii_stop_condition;
	information = pc_ignothii_stop_info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int pc_ignothii_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTARTII == TRUE))
	{
		return TRUE;
	};
};

func void pc_ignothii_stop_info()
{
	IGNOTHSTARTII = FALSE;
};


instance PC_MELTING(C_Info)
{
	npc = PC_Hero;
	condition = pc_melting_condition;
	information = pc_melting_info;
	permanent = 1;
	description = "Pøetavit rezavé zbranì";
};


func int pc_melting_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTARTII == TRUE) && (IGNOTHSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_melting_info()
{
	var C_Npc her;
	var C_Npc rock;
	var int rozzhavena_melting;
	var int ilost_melting;
	var string napis_meltingi;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		if((Npc_HasItems(hero,ItMw_1h_MISC_Sword) >= 1) || (Npc_HasItems(hero,ItMw_1h_Misc_Axe) >= 1) || (Npc_HasItems(hero,ItMw_2H_Sword_M_01) >= 1) || (Npc_HasItems(hero,ItMw_1h_Mil_Sword) >= 1))
		{
			ilost_melting = Npc_HasItems(hero,ItMw_1h_MISC_Sword);
			if(ilost_melting > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword,ilost_melting);
				CreateInvItems(hero,ItMiSwordraw,ilost_melting);
			};
			ilost_melting = Npc_HasItems(hero,ItMw_1h_Misc_Axe);
			if(ilost_melting > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_1h_Misc_Axe,ilost_melting);
				CreateInvItems(hero,ItMiSwordraw,ilost_melting);
			};
			ilost_melting = Npc_HasItems(hero,ItMw_2H_Sword_M_01);
			if(ilost_melting > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_2H_Sword_M_01,ilost_melting);
				CreateInvItems(hero,ItMiSwordraw,ilost_melting);
			};
			ilost_melting = Npc_HasItems(hero,ItMw_1h_Mil_Sword);
			if(ilost_melting > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_1h_Mil_Sword,ilost_melting);
				CreateInvItems(hero,ItMiSwordraw,ilost_melting);
			};
			PrintScreen("Pøetavil jsi všechny rezavé zbranì",-1,-1,"font_old_20_white.tga",1);
		}
		else
		{
			PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
			AI_StopProcessInfos(self);
			PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
			self.aivar[AIV_INVINCIBLE] = FALSE;
		};
	};
};


var int knows_melting;

instance PC_MELTINGII(C_Info)
{
	npc = PC_Hero;
	condition = pc_meltingii_condition;
	information = pc_meltingii_info;
	permanent = 1;
	description = "Pøetavit skøetí zbranì";
};


func int pc_meltingii_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FORGEMAKER) && (IGNOTHSTARTII == TRUE) && (IGNOTHSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_meltingii_info()
{
	var C_Npc her;
	var C_Npc rock;
	var int rozzhavena_meltingii;
	var int ilost_meltingii;
	var string napis_meltingo;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		if((Npc_HasItems(hero,ItMw_2H_OrcAxe_01) >= 1) || (Npc_HasItems(hero,ItMw_2H_OrcAxe_02) >= 1) || (Npc_HasItems(hero,ItMw_2H_OrcAxe_03) >= 1) || (Npc_HasItems(hero,ItMw_2H_OrcAxe_04) >= 1))
		{
			ilost_meltingii = Npc_HasItems(hero,ItMw_2H_OrcAxe_01);
			if(ilost_meltingii > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_01,ilost_meltingii);
				CreateInvItems(hero,ItMiSwordraw,ilost_meltingii);
			};
			ilost_meltingii = Npc_HasItems(hero,ItMw_2H_OrcAxe_02);
			if(ilost_meltingii > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_02,ilost_meltingii);
				CreateInvItems(hero,ItMiSwordraw,ilost_meltingii);
			};
			ilost_meltingii = Npc_HasItems(hero,ItMw_2H_OrcAxe_03);
			if(ilost_meltingii > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_03,ilost_meltingii);
				CreateInvItems(hero,ItMiSwordraw,ilost_meltingii);
			};
			ilost_meltingii = Npc_HasItems(hero,ItMw_2H_OrcAxe_04);
			if(ilost_meltingii > 0)
			{
				Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_04,ilost_meltingii);
				CreateInvItems(hero,ItMiSwordraw,ilost_meltingii);
			};
			PrintScreen("Pøetavil jsi všechny skøetí zbranì",-1,-1,"font_old_20_white.tga",1);
		}
		else
		{
			PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
			AI_StopProcessInfos(self);
			PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
			self.aivar[AIV_INVINCIBLE] = FALSE;
		};
	};
};


var int knows_meltingii;
