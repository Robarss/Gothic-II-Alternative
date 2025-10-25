
func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	Wld_StopEffect("DEMENTOR_FX");
	if(SC_IsObsessed == TRUE)
	{
		PrintScreen(PRINT_SleepOverObsessed,-1,-1,FONT_Screen,2);
	}
	else
	{
		PrintScreen(PRINT_SleepOver,-1,-1,FONT_Screen,2);
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	};
	if(Npc_HasItems(hero,itmi_1sleepsack) == TRUE)
	{
		AI_PlayAni(hero,"T_SLEEPGROUND_2_STAND");
		Npc_RemoveInvItems(hero,itmi_1sleepsack,100);
	};
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

func void sleepabit_s1()
{
	var C_Npc her;
	var C_Npc rock;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SleepAbit;
		AI_ProcessInfos(her);
		if(SC_IsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
	};
};


instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	if(Npc_HasItems(hero,itmi_1sleepsack) == TRUE)
	{
		AI_PlayAni(hero,"T_SLEEPGROUND_2_STAND");
		Npc_RemoveInvItems(hero,itmi_1sleepsack,100);
	};
};


instance PC_SleepTime_Morning(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Morning_Condition;
	information = PC_SleepTime_Morning_Info;
	important = 0;
	permanent = 1;
	description = "Spát až do rána";
};


func int PC_SleepTime_Morning_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(8);
};


instance PC_SleepTime_Noon(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Noon_Condition;
	information = PC_SleepTime_Noon_Info;
	important = 0;
	permanent = 1;
	description = "Spát až do poledne";
};


func int PC_SleepTime_Noon_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};


instance PC_SleepTime_Evening(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Evening_Condition;
	information = PC_SleepTime_Evening_Info;
	important = 0;
	permanent = 1;
	description = "Spát až do dalšího večera";
};


func int PC_SleepTime_Evening_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(20);
};


instance PC_SleepTime_Midnight(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Midnight_Condition;
	information = PC_SleepTime_Midnight_Info;
	important = 0;
	permanent = 1;
	description = "Spát až do půlnoci";
};


func int PC_SleepTime_Midnight_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
};


instance ITMI_1SLEEPSACK(C_Item)
{
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_SleepSack_New_02.3DS";
	material = MAT_LEATHER;
	description = name;
};

instance ITMI_SLEEPSACK(C_Item)
{
	name = "Spací pytel";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 1000;
	visual = "ITMI_SLEEPSACK_NEW_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Vhodný na spaní v přírodě.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_sleepfur;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void use_sleepfur()
{
	if(Npc_HasItems(hero,itmi_sleepsack) == FALSE)
	{
		CreateInvItems(self,itmi_sleepsack,1);
		CreateInvItems(self,itmi_1sleepsack,1);
		B_StopLookAt(self);
		AI_StopPointAt(self);
		AI_DropItem(self,itmi_sleepsack);
		AI_PlayAni(self,"T_PLUNDER");
		AI_PlayAni(self,"T_STAND_2_SLEEPGROUND");
		sleepabit_s1();
	};
};

