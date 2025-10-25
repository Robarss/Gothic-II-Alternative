
instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HALLO(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HALLO_Info;
	description = "Jak se vede?";
};


func int DIA_Engrom_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Mizerně!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Mmh!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//Co můžu říct. Celé dny nemůžeš koukat na nic jiného než na tuhle zatracenou řeku.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Nalevo se flákají skřeti, napravo banditi a každý den jím akorát číhavčí maso. Víš, už mi to všecko leze krkem.
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = "Přemýšlel jsi někdy o tom, že odsud odejdeš?";
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//Přemýšlel jsi někdy o tom, že odsud odejdeš?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//No jasně, to přeci není problém!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Nejdřív se prosekám tlupami skřetů, pozdravím všecky ty ostatní příšery, co tu všude obcházejí, a pak prostě projdu průsmykem!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//To je přece sranda!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Já se sem ale taky dostal.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Chceš mi nakukat, žes prostě prošel průsmykem?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Víceméně ano!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Tak to jsi měl teda kliku. Dokud tu bude všechno vzhůru nohama, ani se odsud nehnu.
};


instance DIA_Engrom_Jagd(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = "Jak jde lov?";
};


func int DIA_Engrom_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Jedinou útěchu vidím v lovu, ale rád bych tu někdy viděl i něco jiného než pořád ty nechutný číhavce.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP4_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP4_EXIT_Condition;
	information = DIA_Engrom_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = "Tak co, jde to dobře?";
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = "Posedlo tě zlo.";
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Posedlo tě zlo.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Dovol mi, abych ti pomohl.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(křičí) Nesahej na mě!
	B_NpcClearObsessionByDMT(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,ZS_Flee,0,"");
};


instance DIA_Engrom_KAP5_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP5_EXIT_Condition;
	information = DIA_Engrom_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP6_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP6_EXIT_Condition;
	information = DIA_Engrom_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_PICKPOCKET(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 900;
	condition = DIA_Engrom_PICKPOCKET_Condition;
	information = DIA_Engrom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Engrom_PICKPOCKET_Condition()
{
	return C_Beklauen(10,5);
};

func void DIA_Engrom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,Dialog_Back,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

