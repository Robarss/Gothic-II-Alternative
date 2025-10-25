
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
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//Dobrá, tak jsi mě dostal. To byl ale hrdinský kousek.
		if((MIS_AttackFellan == LOG_Running) && (FellanGeschlagen == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Tak přestaneš už do toho bušit, nebo ti mám znovu nandat?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Ne, už mi neubližuj. Přestanu. Ale jestli to tady kolem všechno spadne, tak je to jen tvoje chyba!
			FellanGeschlagen = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co se děje? Chceš další ránu pěstí?
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//Co seš to za blázna? Bojuj, nebojuj, řekni - co vlastně chceš?
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
	description = "Proč tady do toho mlátíš?";
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
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Proč tady do toho mlátíš?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Několik posledních dní se zoufale snažím zamezit tomu, aby mi zatékalo do domu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krov se mi drobí pokaždé, když přijde pořádný liják. Takže se mi všechno rozsejpá pod rukama!
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_Stop(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 3;
	condition = DIA_Fellan_Stop_Condition;
	information = DIA_Fellan_Stop_Info;
	permanent = FALSE;
	description = "Můžeš přestat s tím boucháním?";
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
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Můžeš přestat s tím boucháním?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Ne, musím to dodělat.
	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop,"Přestaň s tím, nebo ti zpřerážim všechny kosti v těle.",DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop,"Dám ti 10 zlatých, když s tím rámusem přestaneš.",DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop,"Prostě přestaň bušit, fajn?",DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Přestaň s tím, nebo ti zpřerážim všechny kosti v těle.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapomeň na to, nebo ti do tvý palice svym kladivem vtluču alespoň trochu rozumu.
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Dám ti 10 zlatých, když s tím rámusem přestaneš.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Hej... To je od tebe opravdu milé. Ale jako s tim zlatem, můžeš...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//... fajn, ty víš, co se s tim dá dělat.
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Prostě přestaň bušit, fajn?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Prostě mě zkus neposlouchat, fajn?
};


instance DIA_Fellan_klar(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 5;
	condition = DIA_Fellan_klar_Condition;
	information = DIA_Fellan_klar_Info;
	permanent = TRUE;
	description = "Halóóó - je ti dobře?";
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
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Halóóó - je ti dobře?
	if(FellanGeschlagen == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Fajn, jestli se mi podaří tohle všechno včas opravit.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Ta střecha je čím dál tím horší. Až příště zaprší, bude mi voda téct rovnou na hlavu. A za to všechno můžeš ty!
	};
	AI_StopProcessInfos(self);
};

