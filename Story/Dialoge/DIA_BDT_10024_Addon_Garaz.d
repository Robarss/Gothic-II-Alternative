
instance DIA_Addon_Garaz_EXIT(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 999;
	condition = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garaz_PICKPOCKET(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 900;
	condition = DIA_Addon_Garaz_PICKPOCKET_Condition;
	information = DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	return C_Beklauen(66,80);
};

func void DIA_Addon_Garaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,Dialog_Back,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};


instance DIA_Addon_Garaz_Probleme(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 2;
	condition = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Probleme_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Počkej chvíli.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Nějaký problém?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Důlní červi. Je jich pěkná řádka. Vypadá to, jako kdybychom narazili na hnízdo.
};


instance DIA_Addon_Garaz_Hi(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent = FALSE;
	description = "Proč nezaútočíme na ty červy?";
};


func int DIA_Addon_Garaz_Hi_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && (Minecrawler_Killed < 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Proč ty červy nezničíte?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Tomu bych se dost divil. Stráže mají pravděpodobně jiné 'důležité' věci na práci.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Bloodwyn mi nakázal, zbavit se toho problému.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Tuším, že ve skutečností nezamýšlíš s červama bojovat.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//Proč bych měl? Copak takhle se můžeme dostat ke zlatu v jeskyni?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn bude stejně většinu chtít. A já rozhodně nehodlám riskovat svůj zadek pro tu trochu, co by zbyla.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//Pokud chceš TY s nimi bojovat - klidně, běž dál. Hlavně je nenalákej sem nahoru.
};


instance DIA_Addon_Garaz_Bloodwyn(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 8;
	condition = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent = FALSE;
	description = "Ještě něco co mi můžeš říct o Bloodwynovi?";
};


func int DIA_Addon_Garaz_Bloodwyn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garaz_Hi) && (Minecrawler_Killed < 9) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Ještě něco, co mi můžeš říct o Bloodwynovi?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Jo, je to chamtivý bastard. Kontroluje každou zlatou žilku a hrudku.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Zlato je to, co ho zajímá. Nám by nedal ani hovno.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Ještě něco?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Myslí si, že je nejlepší. Bloodwyn nedokáže vystát někoho, kdo je lepší než on. Jasně, já bych se mu rozhodně netroufl vzepřít.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Nejlepší je vyhnout se jeho přítomnosti a neprovokovat ho - leda že bys ho chtěl fakt nasrat.
	B_LogEntry(Topic_Addon_Tempel,"Bloodwyn určitě opustí chrám, pokud se objeví povídačky o nalezení nové zlaté žíly tady v dole.");
	B_LogEntry(Topic_Addon_Tempel,"Pokud bude Bloodwyn překvapený, přestane se ovládat. To se mi určitě bude hodit.");
};


instance DIA_Addon_Garaz_Sieg(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent = FALSE;
	description = "Červi jsou mrtví.";
};


func int DIA_Addon_Garaz_Sieg_Condition()
{
	if((Minecrawler_Killed >= 9) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Skvěle, to je ono. Červi jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn je na cestě dolů. To je to, cos chtěl, ne?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//Tím myslím - povraždil jsi ty červy, abys dostal Bloodwyna sem dolů, ne? Takže, cokoliv jsi zamýšlel udělat, udělej to teď.
	B_StartOtherRoutine(Bloodwyn,"GOLD");
};


instance DIA_Addon_Garaz_Blood(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Blood_Condition()
{
	if(Npc_IsDead(Bloodwyn) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Blood_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Dal jsi tomu bastardovi co proto. Dobrá práce.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Nyní se tedy podívám tady okolo.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	B_StartOtherRoutine(Thorus,"TALK");
};


instance DIA_Addon_Garaz_Gold(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Gold_Condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Gold_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//Wow, chlape, tady je spousta zlata.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Potřebovali bychom se nějak snadno k tomu zlatu nahoře dostat.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Nicméně, nikdo už žebříky od pádu bariéry nepoužívá....jaká škoda...
};

