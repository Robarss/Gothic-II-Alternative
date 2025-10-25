
instance WATHER_BARREL_S1(C_Item)
{
};


func void trinkfass_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_TRINKFASS;
		AI_ProcessInfos(her);
	};
};


instance PC_TRINKFASS_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_trinkfass_end_condition;
	information = pc_trinkfass_end_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int pc_trinkfass_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_TRINKFASS)
	{
		return TRUE;
	};
};

func void pc_trinkfass_end_info()
{
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance TRINKFASS_NWASSER(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = trinkfass_nwasser_condition;
	information = trinkfass_nwasser_info;
	permanent = TRUE;
	description = "Napít se vody";
};


func int trinkfass_nwasser_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_TRINKFASS)
	{
		return TRUE;
	};
};

func void trinkfass_nwasser_info()
{
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] += 4;
	}
	else if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};
	AI_PlayAni(hero,"T_TRINKFASS_SEP");
};

