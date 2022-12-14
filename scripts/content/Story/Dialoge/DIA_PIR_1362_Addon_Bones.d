
instance DIA_Addon_Bones_EXIT(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 999;
	condition = DIA_Addon_Bones_EXIT_Condition;
	information = DIA_Addon_Bones_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bones_PICKPOCKET(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 900;
	condition = DIA_Addon_Bones_PICKPOCKET_Condition;
	information = DIA_Addon_Bones_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Addon_Bones_PICKPOCKET_Condition()
{
	return C_Beklauen(75,104);
};

func void DIA_Addon_Bones_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET,Dialog_Back,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void B_Addon_Bones_KeineZeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//Je mi l?to, ale nem?m ?as.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//Mus?m tr?novat.
};


instance DIA_Addon_Bones_Anheuern(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 1;
	condition = DIA_Addon_Bones_Anheuern_Condition;
	information = DIA_Addon_Bones_Anheuern_Info;
	description = "Ka?on ?ek?.";
};


func int DIA_Addon_Bones_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//Ka?on ?ek?.
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Hello(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Hello_Condition;
	information = DIA_Addon_Bones_Hello_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//V pohod?. Je to trochu nuda, ale aspo? nemus?m pracovat.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//Pr?v? se p?ipravuji na dal?? ?kol, kter? mi Greg d?.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//Jak? ?kol?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//To ti nem??u ??ct.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//Bez ur??ky k?mo, pracoval jsem dlouho a nechci tuto pr?ci ztratit.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bones_Train(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Train_Condition;
	information = DIA_Addon_Bones_Train_Info;
	permanent = FALSE;
	description = "M??e? m? n?co nau?it?";
};


func int DIA_Addon_Bones_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//M??e? m? n?co nau?it?
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Teacher(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Teacher_Condition;
	information = DIA_Addon_Bones_Teacher_Info;
	permanent = FALSE;
	description = "Kdo m? tu m??e n?co nau?it?";
};


func int DIA_Addon_Bones_Teacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Teacher_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Kdo m? tu m??e n?co nau?it?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Henry a Morgan ??d? stravov?n? na?ich lid?.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//Ti t? mohou nau?it, jak l?pe bojovat.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//V?ichni Henryho lid? um? zach?zet s obouru?n?mi zbran?mi.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Morgan d?v? p?ednost rychlej??m jednoru?n?m zbran?m.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//Kdo d?l?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Nem?m p?ru, j? se o toto nezaj?m?m.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//Nicm?n? jsem si jist, ?e Alligator Jack nebo Samuel by ti mohli n?jak? trik uk?zat.
	Knows_HenrysEntertrupp = TRUE;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
};


instance DIA_Addon_Bones_Francis(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 3;
	condition = DIA_Addon_Bones_Francis_Condition;
	information = DIA_Addon_Bones_Francis_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ct o Francisovi?";
};


func int DIA_Addon_Bones_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Bones_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Co mi m??e? ??ct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//Jen se rozhl?dni kolem. Jedin? lid?, co n?co d?laj?, jsou Henry a jeho chlapi.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Morgan str?v? cel? den v posteli nebo chlast?.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//Ned?l? v?bec nic. A kdo se ne??d? podle n?j, m? probl?m!
};


instance DIA_Addon_Bones_WantArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_WantArmor_Condition;
	information = DIA_Addon_Bones_WantArmor_Info;
	permanent = TRUE;
	description = "Dej mi brn?n? bandity.";
};


func int DIA_Addon_Bones_WantArmor_Condition()
{
	if((Greg_GaveArmorToBones == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_WantArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Dej mi brn?n? bandity.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//Nejsem bl?zen, Greg by mi s?al hlavu.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//??k?l, ?e bez jeho rozkazu nem??u nikomu d?t to brn?n?.
	if(GregIsBack == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//Nem??u ti ho d?t. Aspo? dokud nen? zp?t.
	};
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Bones mi nechce d?t brn?n? bandit? bez Gregova svolen?.");
};


instance DIA_Addon_Bones_GiveArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_GiveArmor_Condition;
	information = DIA_Addon_Bones_GiveArmor_Info;
	permanent = FALSE;
	description = "Greg?v rozkaz je, ?e mi m?? d?t brn?n?.";
};


func int DIA_Addon_Bones_GiveArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_GiveArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//Greg?v rozkaz je, ?e mi m?? d?t brn?n?.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//Greg?v p??kaz? Puh, a mysl?m, ?e bych pak musel j?t s?m.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//B?t ?pionem v tom t?bo?e je hol? sebevra?da.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//Rad?ji strp?m Gregovo v?zen?, ne? aby m? zabili banditi.
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//Brn?n?.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//Tady to m??.
	B_GiveInvItems(self,other,ItAr_BDT_M,1);
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Ale nezahr?vej si s t?ma chl?pkama.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Zd? se, ?e greg?v rozkaz m??e d?lat z?zraky. M?m brn?n? bandit?!");
	B_GivePlayerXP(XP_Bones_GetBDTArmor);
};

