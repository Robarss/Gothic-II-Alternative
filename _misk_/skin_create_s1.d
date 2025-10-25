
instance SKIN_CREATE_S1(C_Item)
{
};


func void skincreate_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SKINCREATE;
		AI_ProcessInfos(her);
	};
};


instance PC_NOSKINCREATE(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noskincreate_condition;
	information = pc_noskincreate_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_noskincreate_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SKINCREATE)
	{
		return TRUE;
	};
};

func void pc_noskincreate_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_TRLBLARM(C_Info)
{
	npc = PC_Hero;
	condition = pc_trlblarm_condition;
	information = pc_trlblarm_info;
	permanent = 1;
	description = "Zbroj z kůže černého trola (2x kůže černého trola, 3x Trolí tesák)";
};


func int pc_trlblarm_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINCREATE) && (KNOWS_TRLBLARM == TRUE))
	{
		return TRUE;
	};
};

func void pc_trlblarm_info()
{
	if((Npc_HasItems(hero,ItAt_TrollBlackFur) >= 2) && (Npc_HasItems(hero,ItAt_TrollTooth) >= 3))
	{
		Npc_RemoveInvItems(hero,ItAt_TrollBlackFur,2);
		Npc_RemoveInvItems(hero,ItAt_TrollTooth,3);
		CreateInvItems(hero,itar_huntroll,1);
		PrintScreen("Vyrobil jsi: Zbroj z kůže černého trola!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_trlblarm;

instance PC_WOLFARM(C_Info)
{
	npc = PC_Hero;
	condition = pc_wolfarm_condition;
	information = pc_wolfarm_info;
	permanent = 1;
	description = "Zbroj z kůže skřetího psa  (10x kůže skřetího psa, 10x drápy)";
};


func int pc_wolfarm_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINCREATE) && (KNOWS_WOLFARM == TRUE))
	{
		return TRUE;
	};
};

func void pc_wolfarm_info()
{
	if((Npc_HasItems(hero,ItAt_WargFur) >= 10) && (Npc_HasItems(hero,ItAt_Claw) >= 10))
	{
		Npc_RemoveInvItems(hero,ItAt_WargFur,10);
		Npc_RemoveInvItems(hero,ItAt_Claw,10);
		CreateInvItems(hero,itar_hunarm,1);
		PrintScreen("Vyrobil jsi: Zbroj z kuže skřetího psa!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_wolfarm;

instance PC_SKINARM(C_Info)
{
	npc = PC_Hero;
	condition = pc_skinarm_condition;
	information = pc_skinarm_info;
	permanent = 1;
	description = "Silná zbroj z kůže (5x vlčí kůže, 3x drápy)";
};


func int pc_skinarm_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINCREATE) && (KNOWS_SKINARM == TRUE))
	{
		return TRUE;
	};
};

func void pc_skinarm_info()
{
	if((Npc_HasItems(hero,ItAt_WolfFur) >= 5) && (Npc_HasItems(hero,ItAt_Claw) >= 3))
	{
		Npc_RemoveInvItems(hero,ItAt_WolfFur,5);
		Npc_RemoveInvItems(hero,ItAt_Claw,3);
		CreateInvItems(hero,itar_leather_l_grd3,1);
		PrintScreen("Vyrobil jsi: Silnou zbroj z kůže!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nemáš potřebný material!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


var int knows_skinarm;
