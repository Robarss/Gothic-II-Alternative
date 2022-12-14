
instance DIA_Fellan_EXIT(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 999;
	condition = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_PICKPOCKET(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 900;
	condition = DIA_Fellan_PICKPOCKET_Condition;
	information = DIA_Fellan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Fellan_PICKPOCKET_Condition()
{
	return C_Beklauen(40,40);
};

func void DIA_Fellan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,Dialog_Back,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};


instance DIA_Fellan_News(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = DIA_Fellan_News_Condition;
	information = DIA_Fellan_News_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Fellan_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_News_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//Dobr?, tak jsi m? dostal. To byl ale hrdinsk? kousek.
		if((MIS_AttackFellan == LOG_Running) && (FellanGeschlagen == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Tak p?estane? u? do toho bu?it, nebo ti m?m znovu nandat?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Ne, u? mi neubli?uj. P?estanu. Ale jestli to tady kolem v?echno spadne, tak je to jen tvoje chyba!
			FellanGeschlagen = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co se d?je? Chce? dal?? r?nu p?st??
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//Co se? to za bl?zna? Bojuj, nebojuj, ?ekni - co vlastn? chce??
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Fellan_HALLO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 2;
	condition = DIA_Fellan_HALLO_Condition;
	information = DIA_Fellan_HALLO_Info;
	permanent = FALSE;
	description = "Pro? tady do toho ml?t???";
};


func int DIA_Fellan_HALLO_Condition()
{
	if(FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fellan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Pro? tady do toho ml?t???
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//N?kolik posledn?ch dn? se zoufale sna??m zamezit tomu, aby mi zat?kalo do domu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krov se mi drob? poka?d?, kdy? p?ijde po??dn? lij?k. Tak?e se mi v?echno rozsejp? pod rukama!
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_Stop(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 3;
	condition = DIA_Fellan_Stop_Condition;
	information = DIA_Fellan_Stop_Info;
	permanent = FALSE;
	description = "M??e? p?estat s t?m bouch?n?m?";
};


func int DIA_Fellan_Stop_Condition()
{
	if(MIS_AttackFellan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fellan_Stop_Info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//M??e? p?estat s t?m bouch?n?m?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Ne, mus?m to dod?lat.
	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop,"P?esta? s t?m, nebo ti zp?er??im v?echny kosti v t?le.",DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop,"D?m ti 10 zlat?ch, kdy? s t?m r?musem p?estane?.",DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop,"Prost? p?esta? bu?it, fajn?",DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//P?esta? s t?m, nebo ti zp?er??im v?echny kosti v t?le.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapome? na to, nebo ti do tv? palice svym kladivem vtlu?u alespo? trochu rozumu.
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//D?m ti 10 zlat?ch, kdy? s t?m r?musem p?estane?.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Hej... To je od tebe opravdu mil?. Ale jako s tim zlatem, m??e?...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//... fajn, ty v??, co se s tim d? d?lat.
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Prost? p?esta? bu?it, fajn?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Prost? m? zkus neposlouchat, fajn?
};


instance DIA_Fellan_klar(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 5;
	condition = DIA_Fellan_klar_Condition;
	information = DIA_Fellan_klar_Info;
	permanent = TRUE;
	description = "Hal??? - je ti dob?e?";
};


func int DIA_Fellan_klar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fellan_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Fellan_klar_Info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Hal??? - je ti dob?e?
	if(FellanGeschlagen == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Fajn, jestli se mi poda?? tohle v?echno v?as opravit.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Ta st?echa je ??m d?l t?m hor??. A? p???t? zapr??, bude mi voda t?ct rovnou na hlavu. A za to v?echno m??e? ty!
	};
	AI_StopProcessInfos(self);
};

