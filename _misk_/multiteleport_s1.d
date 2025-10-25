
func void multiteleport_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MULTITELEPORT;
		AI_ProcessInfos(her);
	};
};


instance PC_NOMULTITELEPORT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nomultiteleport_condition;
	information = pc_nomultiteleport_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_nomultiteleport_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (MULTITELEPORTSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_nomultiteleport_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_MULTITELEPORT_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_multiteleport_start_condition;
	information = pc_multiteleport_start_info;
	permanent = TRUE;
	description = "Teleportovat se...";
};


func int pc_multiteleport_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (MULTITELEPORTSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_multiteleport_start_info()
{
	MULTITELEPORTSTART = TRUE;
};


instance PC_MULTITELEPORT_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_multiteleport_stop_condition;
	information = pc_multiteleport_stop_info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int pc_multiteleport_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_multiteleport_stop_info()
{
	MULTITELEPORTSTART = FALSE;
};


instance PC_TP_TAVERNE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_tp_taverne_condition;
	information = pc_tp_taverne_info;
	permanent = TRUE;
	description = "Hospoda u Orlana";
};


func int pc_tp_taverne_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_TAVERNE == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_taverne_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"NW_TAVERNE_04");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_SEAPORT(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_tp_seaport_condition;
	information = pc_tp_seaport_info;
	permanent = TRUE;
	description = "Město Khorinis";
};


func int pc_tp_seaport_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_SEAPORT == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_seaport_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"HAFEN");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_FARM(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_tp_farm_condition;
	information = pc_tp_farm_info;
	permanent = TRUE;
	description = "Farma Onara";
};


func int pc_tp_farm_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_FARM == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_farm_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"BIGFARM");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_MONASTERY(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_tp_monastery_condition;
	information = pc_tp_monastery_info;
	permanent = TRUE;
	description = "Klášter";
};


func int pc_tp_monastery_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_MONASTERY == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_monastery_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"KLOSTER");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_XARDAS(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_tp_xardas_condition;
	information = pc_tp_xardas_info;
	permanent = TRUE;
	description = "Věž Xardase";
};


func int pc_tp_xardas_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_XARDAS == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_xardas_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"XARDAS");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_TELEPORTPASSNW(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_tp_teleportpassnw_condition;
	information = pc_tp_teleportpassnw_info;
	permanent = TRUE;
	description = "Průsmyk u Khorinisu";
};


func int pc_tp_teleportpassnw_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_TELEPORTPASSNW == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_teleportpassnw_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"LEVELCHANGE");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_TELEPORTPASSOW(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = pc_tp_teleportpassow_condition;
	information = pc_tp_teleportpassow_info;
	permanent = TRUE;
	description = "Průsmyk u hornického udolí";
};


func int pc_tp_teleportpassow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_TELEPORTPASSOW == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_teleportpassow_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"SPAWN_MOLERAT02_SPAWN01");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};


instance PC_TP_OLDCAMP(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = pc_tp_oldcamp_condition;
	information = pc_tp_oldcamp_info;
	permanent = TRUE;
	description = "Hrad v hornickém udolí";
};


func int pc_tp_oldcamp_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MULTITELEPORT) && (TP_OLDCAMP == TRUE) && (MULTITELEPORTSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tp_oldcamp_info()
{
	if(self.attribute[ATR_MANA] <= 9)
	{
		AI_PrintScreen("",-1,YPOS_ItemGiven,FONT_ScreenSmall,3);
	}
	else
	{
		self.attribute[ATR_MANA] -= 10;
		AI_StopProcessInfos(self);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		AI_Teleport(self,"OC_MAGE_CENTER");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		Wld_PlayEffect("Spellfx_Teleport_Ring",self,self,0,0,0,FALSE);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
};

