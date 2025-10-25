
func void fishing_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_FISHING;
		AI_ProcessInfos(her);
	};
};


instance PC_NOFISHING(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nofishing_condition;
	information = pc_nofishing_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_nofishing_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_FISHING)
	{
		return TRUE;
	};
};

func void pc_nofishing_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_FISHING_N(C_Info)
{
	npc = PC_Hero;
	condition = pc_fishing_n_condition;
	information = pc_fishing_n_info;
	important = 0;
	permanent = 1;
	description = "Začít Rybařit.";
};


func int pc_fishing_n_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_FISHING)
	{
		return TRUE;
	};
};

func void pc_fishing_n_info()
{
	var int zufallsmenge;
	var int anzahl;
	var C_Npc he;
	zufallsmenge = Hlp_Random(180);
	if(zufallsmenge <= 145)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 170)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 155)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 160)
	{
		anzahl = 1;
	};
	if(zufallsmenge >= 165)
	{
		anzahl = 0;
	};
	he = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(he))
	{
		CreateInvItems(self,ItFo_Fish,anzahl);
		if(anzahl == 0)
		{
			PrintScreen("Neulovil jsem nic!",-1,10,FONT_ScreenSmall,2);
		};
		if(anzahl == 0)
		{
			PrintScreen("",-1,30,FONT_ScreenSmall,2);
		};
		if(anzahl == 0)
		{
			PrintScreen("",-1,30,FONT_ScreenSmall,2);
		};
		if(anzahl == 1)
		{
			PrintScreen("Ulovil jsem rybu!",-1,30,FONT_ScreenSmall,2);
		};
	};
};

