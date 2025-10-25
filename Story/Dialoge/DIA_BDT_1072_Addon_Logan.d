
instance DIA_Addon_Logan_EXIT(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 999;
	condition = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent = TRUE;
	description = "Vrátím se později ...";
};


func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Vrátím se později ...
	if(!((MIS_HlpLogan == LOG_Running) || !(MIS_HlpLogan == LOG_SUCCESS)) && (Logan_Inside == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(bručí) Jasně, uteč. Já tu budu stát a zastavím všechno a všechny, kteří se opováží přiblížit.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Logan_PICKPOCKET(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 900;
	condition = DIA_Addon_Logan_PICKPOCKET_Condition;
	information = DIA_Addon_Logan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Logan_PICKPOCKET_Condition()
{
	return C_Beklauen(59,50);
};

func void DIA_Addon_Logan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,Dialog_Back,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};


instance DIA_Addon_BDT_1072_Logan_Mine(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Logan_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Zvládl jsi to, co? Dobře, je fajn, že mi tady pomáháš.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Logan_How2(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Logan_How2_Condition()
{
	if((Logan_Inside == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Celkem dobře, aspoň že jsem tady. Lucie dělá fakt drsnou kořalku.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Ale Esteban mě nechce pustit do dolu. Aspoň ne teď. Dostal jsem totiž jiný úkol.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//Takže? Co chce abys udělal?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//Někdo se pokusil Estebana zavraždit. A on by rád věděl, kdo za tím stojí.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(šeptá) Esteban věří, že Snaf je do toho zapletený. Mám na něho dávat pozor ...
};


instance DIA_Addon_Logan_Attentat(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Logan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (Logan_Inside == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//Takže, ty hledáš chlápky, kteří jsou za to zodpovědní?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//No, já o tom nic nevím. Měl bych? Když se to stalo, tak já jsem seděl celou dobu v bažině.
};


instance DIA_Addon_Logan_HI(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_HI_Condition()
{
	if((Logan_Inside == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Hele, jestli to není nová tvář.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Plánuješ tady stát celou dobu, nebo mi půjdeš pomoct?
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franco se zmínil. Myslí si, že by se ti hodila nějaká pomoc. Tak co?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//Záleží na tom, jakou přesně potřebuješ pomoc?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//Močáloví žraloci jsou na můj vkus příliš blízko. Měli bychom jich pár zabít.
	Log_CreateTopic(Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan,LOG_Running);
	B_LogEntry(Topic_Addon_Logan,"Logan chce, abych s ním šel lovit močálové žraloky.");
};


instance DIA_Addon_Logan_Why(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent = FALSE;
	description = "A co za to dostanu?";
};


func int DIA_Addon_Logan_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//A co za to dostanu?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(bručí) Franco tě tu nechá shnít, jestli nebudš užitečný.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Chceš do tábora? No, napřed tu musíš trochu pomoct. Samotná slova ti nepomůžou dosáhnout tvého cíle.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Takže, mohl bych ti ukázat, jak zpracovat tyhle monstra.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Ale ve skutečnosti si nemyslím, že by tě Franco pustil jenom proto, že jsme tu zabili pár močálových žraloků.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Tady venku jsou lidé, kteří čekají daleko déle.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//A lepší bude, připojit se také k táboru ... (bručí)
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Logan mě může naučit, jak získat ze zabitých zvířat kůži, drápy a zuby.");
};


instance DIA_Addon_Logan_Lager(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent = FALSE;
	description = "Co je přesně v táboře?";
};


func int DIA_Addon_Logan_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//Co je přesně v táboře?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(bručí) Otázka spíš je, co NENÍ v táboře. Žádní močáloví žraloci, žádně pitomá bažinatá díra ... zkrátka, ŽÁDNÁ bažina, chápeš.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Nejenom že tam mají chlast a zlato, ale pokud si dobře pamatuju, tak jsou tam i ženy, už rozumíš?
};


instance DIA_Addon_Logan_MIS(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 99;
	condition = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent = FALSE;
	description = "Pojďme zabít pár močálových žraloků.";
};


func int DIA_Addon_Logan_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Pojďme zabít pár močálových žraloků.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(bručí) Vypadá to, že jsi pochopil, jak to tady chodí. To se mi líbí. Do prdele ... slyšel jsi to? Slyším je!
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//Máme to - a co budeme dělat teď?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//Přicházejí. A jde jim o to, aby si z nás ukousli pořádný kousek. Takže, pojďme se mrknout kdo z koho. Na ně.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_Running;
	Wld_InsertNpc(MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_Addon_Logan_tot(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_tot_Condition()
{
	if(Npc_IsDead(MIS_Addon_Swampshark_01) && Npc_IsDead(MIS_Addon_Swampshark_02) && Npc_IsDead(MIS_Addon_Swampshark_03) && Npc_KnowsInfo(other,DIA_Addon_Logan_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Mrtvý žralok, dobrý žralok. To by mělo být varování pro ostatní.
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//Ok, ještě něco? Jinak odejdu.
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Ještě ne. Víš, kde hledat jestli se budeš chtít něco naučit.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog();
	B_LogEntry(Topic_Addon_Franco,"Pomohl jsem Loganovi. Je čas se jít mrknout, jestli je Franco spokojený.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Logan_Lern(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 100;
	condition = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent = FALSE;
	description = "Ukaž mi, jak zpracovat zvířata ...";
};


func int DIA_Addon_Logan_Lern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Ukaž mi, jak zpracovat zvířata ...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Jestli chceš vědět víc o krvavých mouchách, zeptej se spíš Edgora.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//Jestli chceš vědět, jak zpracovat močálové žraloky nebo ještěrky, tak by bylo dobré vědět, jak jim stáhnout kůži a odříznout jim zuby. Tohle ti můžu ukázat.
};


instance DIA_Addon_Logan_Allg(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent = TRUE;
	description = "Chci se naučit ...";
};


func int DIA_Addon_Logan_Allg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
	Info_AddChoice(DIA_Addon_Logan_Allg,Dialog_Back,DIA_Addon_Logan_Allg_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString("Vytahování zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_Logan_Allg_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString("Odseknutí drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Addon_Logan_Allg_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString("Stáhnout kůži",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Addon_Logan_Allg_Fur);
	};
};

func void DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur);
};


var int Logan_Lohn;

instance DIA_Addon_Logan_Hacker(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Addon_Logan_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej, musím ti poděkovat! Mám povolení ke vstupu do dolu!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Moc toho o kopání zlata nevím, ale nějak ho dostanu.
	if(Logan_Lohn == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//Už umím základy. Zapři se silně nohama a bouchni tak silně, jak jen můžeš!
		B_Upgrade_Hero_HackChance(10);
		Logan_Lohn = TRUE;
	};
};

