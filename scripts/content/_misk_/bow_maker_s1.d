
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
};


instance PC_BOW1(C_Info)
{
	npc = PC_Hero;
	condition = pc_bow1_condition;
	information = pc_bow1_info;
	permanent = 1;
	description = "Luk M?s?c (1x D?evo na v?robu, 1x T?tiva, 2x prisky?ice)";
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
		PrintScreen("Vyrobil jsi: M?s?c!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Luk V?tr (1x D?evo na v?robu, 1x T?tiva, 2x zuby)";
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
		PrintScreen("Vyrobil jsi: V?tr!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Luk Ultim?tum (2x D?evo na v?robu, 2x T?tiva, 3x Perla)";
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
		PrintScreen("Vyrobil jsi: Ultim?tum!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Luk ?svit (2x D?evo na v?robu, 2x T?tiva, 1x ?ern? perla)";
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
		PrintScreen("Vyrobil jsi: ?svit!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Luk Tich? smrt (3x D?evo na v?robu, 3x T?tiva, 1x Smaragd)";
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
		PrintScreen("Vyrobil jsi: Tich? smrt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Luk Soumrak (3x D?evo na v?robu, 3x T?tiva, 1x Rub?n)";
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
		PrintScreen("Vyrobil jsi: Soumrak!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Ku?e Ochrana (1x D?evo na v?robu, 1x T?tiva, 2x Dr?py)";
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
		PrintScreen("Vyrobil jsi: Ochrana!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Ku?e Z?blesk (2x D?evo na v?robu, 2x T?tiva, 2x ?ern? perla)";
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
		PrintScreen("Vyrobil jsi: Z?blesk!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Ku?e Ni?itel (3x D?evo na v?robu, 3x T?tiva, 2x Diamant)";
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
		PrintScreen("Vyrobil jsi: Ni?itel!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_crossbow3;
