
instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return C_Beklauen(20,10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "Tohle jsou tvoje ovce?";
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Tohle jsou tvoje ovce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Ke mně patří jenom ta, která nese jméno Lucy (usměje se) - a to je moje žena.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Ovce jsou majetkem domobrany - hned, jak je získají od farmářů, přivedou je ke mně.
};


instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Hochu, to šílené mlácení kladivem mě přivede do hrobu.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Copak neslyšíš ty rány? Kdo asi tak může v přístavní čtvrti od rána do večera bušit kladivem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Myslím toho cvoka Fellana. Každý den si do té své chatrče bere kladivo.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "Mohl bych se o Fellana postarat.";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mohl bych se o Fellana postarat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ty mi chceš pomoct? A co z toho budeš mít?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//To mi pověz ty.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Aha, tak je to! No dobře - když to jeho bušení nějak umlčíš, zaplatím ti 25 zlaťáků.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale upozorňuju tě, že s ním rozumnou domluvou nic nesvedeš - je to totální magor. Jediná věc, která by mu pomohla, je pár dobře mířených facek!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"Alwin mě požádal, zda bych nepřiměl Fellana, aby přestal bušit kladivem. Zabít ho ale nebude zrovna to nejlepší řešení.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"Uvidím, co se dá dělat...",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"Když ho zmlátím, budu z toho mít jenom opletačky s domobranou...",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Jen si to rozmysli a pamatuj si, že jsem ti slíbil 25 zlaťáků.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Když ho zmlátím, budu z toho mít jenom opletačky s domobranou.
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tady v přístavu se nějaká ta rvačka tak tragicky nebere.
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale jestli tu někde něco šlohneš nebo mi šáhneš na ovce, budeš v pěkném průšvihu.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "Fellan už kladivem tlouci nebude.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan už kladivem tlouci nebude.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Slyšíš to? Ticho - žádné rány. Konečně. Myslel jsem, že ten chlap nikdy nezmlkne.
	if(Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Prokázals mi velkou laskavost. Víš co? Dám ti celých 30 zlaťáků.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "A jak se daří ovcím?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A jak se daří ovcím?
	if((MIS_AttackFellan != LOG_SUCCESS) && (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Z toho Fellanova mlácení už pomalu šílí. Ještě pár dní a budou úplně našrot.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Ovce se jen cpou a jsou čím dál tím tlustší. Stejně jako moje žena. HAHAHA (hlasitě se směje).
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Možná bych měl jednu z nich klepnout - jako poslední večeři!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Jako co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Pro jednoho žoldáka, který zabil paladina. Samozřejmě ho za to popraví.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Jen se musím rozhodnout, která z nich půjde na popravčí špalek.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy má opravdu štěstí, že je ještě naživu.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Myslel jsem, že jsi říkal, že Lucy je tvá žena.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Správně, ale jedna z ovcí se taky jmenuje Lucy. Právě ona měla být posledním jídlem pro Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale nakonec se to všechno vyřešilo a Lucy může být ráda.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Časem je ale pozorování pasoucích se ovcí docela nuda.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Tak se s nimi loučím. Lord Hagen rozkázal, že všechny ovce poslouží jako zásoby pro jeho armádu.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ale aspoň budu mít víc času na svou ženu.
	};
};


instance DIA_ALWIN_JOB(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = dia_alwin_job_condition;
	information = dia_alwin_job_info;
	permanent = FALSE;
	description = "Můžu si od tebe koupit nějaké maso?";
};


func int dia_alwin_job_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_alwin_job_info()
{
	AI_Output(other,self,"DIA_Alwin_Job_15_00");	//Můžu si od tebe koupit nějaké maso?
	AI_Output(self,other,"DIA_Alwin_Job_01_01");	//Ano pokud máš čím platit není problem.
	AI_Output(self,other,"DIA_Alwin_Job_01_02");	//Tady najdeš jen to nejčerstvější zboží.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Cestou do přístaviště Alwin prodává maso.");
};


instance DIA_ALWIN_TRADE(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 99;
	condition = dia_alwin_trade_condition;
	information = dia_alwin_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_alwin_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_job))
	{
		return TRUE;
	};
};

func void dia_alwin_trade_info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Alwin_Trade_15_00");	//Ukaž mi své zboží.
};

