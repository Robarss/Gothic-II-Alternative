
instance BOW_MAKER_S1(C_Item)
{
};


func void bowmaker_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_BOWMAKER;
		AI_ProcessInfos(her);
	};
};


instance PC_NOBOWMAKER(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nobowmaker_condition;
	information = pc_nobowmaker_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_nobowmaker_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER)
	{
		return TRUE;
	};
};

func void pc_nobowmaker_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_BOW1(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow1_condition;
	information = pc_bow1_info;
	permanent = 1;
	description = "Luk Měsíc (1x Dřevo na výrobu, 1x Tětiva, 2x priskyřice)";
};


func int pc_bow1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_BOW1 == TRUE))
	{
		return TRUE;
	};
};

func void pc_bow1_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,itmi_woodmaker02) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		CreateInvItems(hero,itrw_bowmaker1,1);
		PrintScreen("Vyrobil jsi: Měsíc!",-1,-1,FONT_ScreenSmall,2);  
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_bow1;

instance PC_BOW2(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow2_condition;
	information = pc_bow2_info;
	permanent = 1;
	description = "Luk Vítr (1x Dřevo na výrobu, 1x Tětiva, 2x zuby)";
};


func int pc_bow2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_BOW2 == TRUE))
	{
		return TRUE;
	};
};

func void pc_bow2_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,itmi_woodmaker02) >= 1) && (Npc_HasItems(hero,ItAt_Teeth) >= 2))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,1);
		Npc_RemoveInvItems(hero,ItAt_Teeth,2);
		CreateInvItems(hero,itrw_bowmaker2,1);
		PrintScreen("Vyrobil jsi: Vítr!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_bow2;

instance PC_BOW3(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow3_condition;
	information = pc_bow3_info;
	permanent = 1;
	description = "Luk Ultimátum (2x Dřevo na výrobu, 2x Tětiva, 3x Perla)";
};


func int pc_bow3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_BOW3 == TRUE))
	{
		return TRUE;
	};
};

func void pc_bow3_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 2) && (Npc_HasItems(hero,itmi_woodmaker02) >= 2) && (Npc_HasItems(hero,ItMi_Addon_WhitePearl) >= 3))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,2);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,2);
		Npc_RemoveInvItems(hero,ItMi_Addon_WhitePearl,3);
		CreateInvItems(hero,itrw_bowmaker4,1);
		PrintScreen("Vyrobil jsi: Ultimátum!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_bow3;

instance PC_BOW4(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow4_condition;
	information = pc_bow4_info;
	permanent = 1;
	description = "Luk Úsvit (2x Dřevo na výrobu, 2x Tětiva, 1x Černá perla)";
};


func int pc_bow4_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_BOW4 == TRUE))
	{
		return TRUE;
	};
};

func void pc_bow4_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 2) && (Npc_HasItems(hero,itmi_woodmaker02) >= 2) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,2);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,2);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		CreateInvItems(hero,itrw_bowmaker3,1);
		PrintScreen("Vyrobil jsi: Úsvit!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_bow4;

instance PC_BOW5(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow5_condition;
	information = pc_bow5_info;
	permanent = 1;
	description = "Luk Tichá smrt (3x Dřevo na výrobu, 3x Tětiva, 1x Smaragd)";
};


func int pc_bow5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_BOW5 == TRUE))
	{
		return TRUE;
	};
};

func void pc_bow5_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 3) && (Npc_HasItems(hero,itmi_woodmaker02) >= 3) && (Npc_HasItems(hero,itmi_smar) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,3);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,3);
		Npc_RemoveInvItems(hero,itmi_smar,1);
		CreateInvItems(hero,itrw_bowmaker5,1);
		PrintScreen("Vyrobil jsi: Tichá smrt!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_bow5;

instance PC_BOW6(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow6_condition;
	information = pc_bow6_info;
	permanent = 1;
	description = "Luk Soumrak (3x Dřevo na výrobu, 3x Tětiva, 1x Rubín)";
};


func int pc_bow6_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_BOW6 == TRUE))
	{
		return TRUE;
	};
};

func void pc_bow6_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 3) && (Npc_HasItems(hero,itmi_woodmaker02) >= 3) && (Npc_HasItems(hero,itmi_ruby) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,3);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,3);
		Npc_RemoveInvItems(hero,itmi_ruby,1);
		CreateInvItems(hero,itrw_bowmaker6,1);
		PrintScreen("Vyrobil jsi: Soumrak!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_bow6;

instance PC_CROSSBOW1(C_Info)
{
	npc = PC_Hero;
	condition = pc_crossbow1_condition;
	information = pc_crossbow1_info;
	permanent = 1;
	description = "Kuše Ochrana (1x Dřevo na výrobu, 1x Tětiva, 2x Drápy)";
};


func int pc_crossbow1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_CROSSBOW1 == TRUE))
	{
		return TRUE;
	};
};

func void pc_crossbow1_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,itmi_woodmaker02) >= 1) && (Npc_HasItems(hero,ItAt_Claw) >= 2))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,1);
		Npc_RemoveInvItems(hero,ItAt_Claw,2);
		CreateInvItems(hero,itrw_crosmaker1,1);
		PrintScreen("Vyrobil jsi: Ochrana!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_crossbow1;

instance PC_CROSSBOW2(C_Info)
{
	npc = PC_Hero;
	condition = pc_crossbow2_condition;
	information = pc_crossbow2_info;
	permanent = 1;
	description = "Kuše Záblesk (2x Dřevo na výrobu, 2x Tětiva, 2x Černá perla)";
};


func int pc_crossbow2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_CROSSBOW2 == TRUE))
	{
		return TRUE;
	};
};

func void pc_crossbow2_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 2) && (Npc_HasItems(hero,itmi_woodmaker02) >= 2) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 2))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,2);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,2);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,2);
		CreateInvItems(hero,itrw_crosmaker2,1);
		PrintScreen("Vyrobil jsi: Záblesk!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_crossbow2;

instance PC_CROSSBOW3(C_Info)
{
	npc = PC_Hero;
	condition = pc_crossbow3_condition;
	information = pc_crossbow3_info;
	permanent = 1;
	description = "Kuše Ničitel (3x Dřevo na výrobu, 3x Tětiva, 2x Diamant)";
};


func int pc_crossbow3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKER) && (KNOWS_CROSSBOW3 == TRUE))
	{
		return TRUE;
	};
};

func void pc_crossbow3_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 3) && (Npc_HasItems(hero,itmi_woodmaker02) >= 3) && (Npc_HasItems(hero,itmi_diam) >= 2))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,3);
		Npc_RemoveInvItems(hero,itmi_woodmaker02,3);
		Npc_RemoveInvItems(hero,itmi_diam,2);
		CreateInvItems(hero,itrw_crosmaker3,1);
		PrintScreen("Vyrobil jsi: Ničitel!",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,FONT_ScreenSmall,2);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_crossbow3;
