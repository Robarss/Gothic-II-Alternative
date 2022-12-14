
instance DIA_Addon_10023_Wache_EXIT(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10023_Wache_Hi(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10023_Wache_Hi_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Hej, kam jde?? Zam??l?? j?t d?le touto stezkou?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//Pro? ne?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//Tam dole je v?c otrok?. M??e? vstoupit, jestli chce?. Nebij je moc, jinak nebudou m?ct d?le pracovat.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//Nechceme, aby tady posed?vali. Musej? dolovat zlato.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//Vid?m. A kdo za t?m stoj??
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//Je to pod p??m?m dohledem Bloodwyna.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//A mysl?m, ?e Raven je tu nejvy??? ??f.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//To je v po??dku. Otroci jsou vlastn? jeho dar Bloodwynovi. U? je v?c nepot?ebuje.
	Pardos.attribute[ATR_HITPOINTS] = 70;
	B_LogEntry(TOPIC_Addon_Sklaven,"Raven nem? dal?? pou?it? pro otroky. Nyn? jsou zotro?eni Bloodwynem.");
};


var int PrisonGuard_Rules;

instance DIA_Addon_10023_Wache_go(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent = TRUE;
	description = "Osvobo? otroky!";
};


func int DIA_Addon_10023_Wache_go_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_go_Info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Osvobo? otroky!
	if(PrisonGuard_Rules == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//Poslouchej k?mo, Bloodwyn tady d?v? rozkazy. Otroci jsou jeho a jen on je m??e osvobodit.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//Taky Thorus tady m? n?jakou autoritu. A co ty?
		PrisonGuard_Rules = TRUE;
		B_LogEntry(TOPIC_Addon_Sklaven,"Pouze Bloodwyn a Thorus m??ou osvobodit otroky.");
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//Jsi tu v?bec d?le?it??
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go,Dialog_Back,DIA_Addon_10023_Wache_go_BACK);
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if(Npc_IsDead(Bloodwyn) && (Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"(Uka? Bloodwynovu hlavu)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Jsem ten, kdo rozhoduje o vstupu do dolu.",DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//Jsem ten, kdo rozhoduje o vstupu do dolu.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//Tak ty nyn? d?l?? Estebanovu pr?ci? Tak to znamen?, ?e tu nem?? ??dn? vliv. Vypadni!
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};


var int Wache_einmal;

func void DIA_Addon_10023_Wache_go_Blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//To sta???
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//(odpudiv?) Dej to pry?! Nechci to vid?t.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//Tak?e nyn? u? pust?? otroky?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//Poslouchej, Bloodwyn nen? jedinn?, kdo o tom rozhoduje. Nem??u je pustit, dokud mi to Thorus nepovol?.
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if(Wache_einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//Ale ?ekls, ?e Bloodwyn vlastn? otroky.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Jo. Nicm?n? je nemohu pustit bez Thorusova svolen?.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//Ty jsi jeden z t?ch chl?pk?, co bez svolen? neud?l? ani prd, ?e?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//Cht?l jsem ??ct, ?e ...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//... jo, jo, v?e v po??dku. ?et?i slovy.
		};
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
	};
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//Mluvil jsem s Thorusem. Propus? ty otroky!
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Dob?e, kdy? to chce Thorus. Ale zaj?malo by m?, pro? to ud?lal ...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//... ale ty nejsi placen? za to, aby ses divil.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//Dobr?, dobr? - tady u? jsem zbyte?n?. Jdu si d?t dobrou pol?vku.
	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

