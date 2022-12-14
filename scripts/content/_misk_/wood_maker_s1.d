
instance WOOD_MAKER_S1(C_Item)
{
};


func void woodmaker_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_WOODMAKER;
		AI_ProcessInfos(her);
	};
};


instance PC_NOWOODMAKER(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nowoodmaker_condition;
	information = pc_nowoodmaker_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_nowoodmaker_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER)
	{
		return TRUE;
	};
};

func void pc_nowoodmaker_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_TORCH(C_Info)
{
	npc = PC_Hero;
	condition = pc_torch_condition;
	information = pc_torch_info;
	permanent = 1;
	description = "Pochode? (1x D?evo ze stromu, 1x Prysky?ice)";
};


func int pc_torch_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER)
	{
		return TRUE;
	};
};

func void pc_torch_info()
{
	if((Npc_HasItems(hero,itmi_woodbasic) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodbasic,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItems(hero,ItLsTorch,2);
		PrintScreen("Vyrobil jsi: Pochode?!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_torch;

instance PC_PICKLOC(C_Info)
{
	npc = PC_Hero;
	condition = pc_pickloc_condition;
	information = pc_pickloc_info;
	permanent = 1;
	description = "Pakl?? (1x D?evo ze stromu, 1x Surov? ocel)";
};


func int pc_pickloc_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 1))
	{
		return TRUE;
	};
};

func void pc_pickloc_info()
{
	if((Npc_HasItems(hero,itmi_woodbasic) >= 1) && (Npc_HasItems(hero,ItMiSwordraw) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodbasic,1);
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		CreateInvItems(hero,ItKE_lockpick,10);
		PrintScreen("Vyrobil jsi: Pakl??e!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_pickloc;

instance PC_ARROWMAKER(C_Info)
{
	npc = PC_Hero;
	condition = pc_arrowmaker_condition;
	information = pc_arrowmaker_info;
	permanent = 1;
	description = "??p (1x D?evo na v?robu, 1x Surov? ocel)";
};


func int pc_arrowmaker_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_ARROWBOLT == TRUE))
	{
		return TRUE;
	};
};

func void pc_arrowmaker_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,ItMiSwordraw) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		CreateInvItems(hero,ItRw_Arrow,10);
		PrintScreen("Vyrobil jsi: ??py!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_arrowmaker;

instance PC_ARROWMAKERFIRE(C_Info)
{
	npc = PC_Hero;
	condition = pc_arrowmakerfire_condition;
	information = pc_arrowmakerfire_info;
	permanent = 1;
	description = "Ohniv? ??py (1x D?evo na v?robu, 1x Surov? ocel 1x Prysky?ice)";
};


func int pc_arrowmakerfire_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_ARROWBOLT == TRUE))
	{
		return TRUE;
	};
};

func void pc_arrowmakerfire_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,ItMiSwordraw) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItems(hero,ItRw_Addon_FireArrow,5);
		PrintScreen("Vyrobil jsi: Ohniv? ??py!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_arrowmakerfire;

instance PC_ARROWMAKERMAGIC(C_Info)
{
	npc = PC_Hero;
	condition = pc_arrowmakermagic_condition;
	information = pc_arrowmakermagic_info;
	permanent = 1;
	description = "Magick? ??py (1x D?evo na v?robu, 1x Surov? ocel 1x Magick? nugget)";
};


func int pc_arrowmakermagic_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_ARROWBOLT == TRUE))
	{
		return TRUE;
	};
};

func void pc_arrowmakermagic_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,ItMiSwordraw) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,1);
		CreateInvItems(hero,ItRw_Addon_MagicArrow,5);
		PrintScreen("Vyrobil jsi: Magick? ??py!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_arrowmakermagic;

instance PC_BOLTMAKER(C_Info)
{
	npc = PC_Hero;
	condition = pc_boltmaker_condition;
	information = pc_boltmaker_info;
	permanent = 1;
	description = "St?ela (1x D?evo na v?robu, 1x Surov? ocel)";
};


func int pc_boltmaker_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_ARROWBOLT == TRUE))
	{
		return TRUE;
	};
};

func void pc_boltmaker_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,ItMiSwordraw) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		CreateInvItems(hero,ItRw_Bolt,10);
		PrintScreen("Vyrobil jsi: St?eli!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_boltmaker;

instance PC_BOLTMAKERMAGIC(C_Info)
{
	npc = PC_Hero;
	condition = pc_boltmakermagic_condition;
	information = pc_boltmakermagic_info;
	permanent = 1;
	description = "Magick? st?ela (1x D?evo na v?robu, 1x Surov? ocel, 1x Magick? nugget)";
};


func int pc_boltmakermagic_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_ARROWBOLT == TRUE))
	{
		return TRUE;
	};
};

func void pc_boltmakermagic_info()
{
	if((Npc_HasItems(hero,itmi_woodmaker01) >= 1) && (Npc_HasItems(hero,ItMiSwordraw) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 1))
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		Npc_RemoveInvItems(hero,ItMiSwordraw,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,1);
		CreateInvItems(hero,ItRw_Addon_MagicBolt,5);
		PrintScreen("Vyrobil jsi: Magick? st?eli!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_boltmakermagic;

instance PC_WOODMAK(C_Info)
{
	npc = PC_Hero;
	condition = pc_woodmak_condition;
	information = pc_woodmak_info;
	permanent = 1;
	description = "D?evo na v?robu (1x D?evo ze stromu)";
};


func int pc_woodmak_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_BOWSCROLLSI == TRUE))
	{
		return TRUE;
	};
};

func void pc_woodmak_info()
{
	if(Npc_HasItems(hero,itmi_woodbasic) >= 1)
	{
		Npc_RemoveInvItems(hero,itmi_woodbasic,1);
		CreateInvItems(hero,itmi_woodmaker01,2);
		PrintScreen("Vyrobil jsi: D?evo na v?robu!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_woodmak;

instance PC_LIANMAKER(C_Info)
{
	npc = PC_Hero;
	condition = pc_lianmaker_condition;
	information = pc_lianmaker_info;
	permanent = 1;
	description = "T?tiva (1x D?evo na v?robu)";
};


func int pc_lianmaker_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODMAKER) && (KNOWS_BOWSCROLLSI == TRUE))
	{
		return TRUE;
	};
};

func void pc_lianmaker_info()
{
	if(Npc_HasItems(hero,itmi_woodmaker01) >= 1)
	{
		Npc_RemoveInvItems(hero,itmi_woodmaker01,1);
		CreateInvItems(hero,itmi_woodmaker02,2);
		PrintScreen("Vyrobil jsi: T?tivu!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nem?? pot?ebn? material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_lianmaker;
