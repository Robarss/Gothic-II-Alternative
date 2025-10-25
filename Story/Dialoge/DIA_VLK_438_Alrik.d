
instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return C_Beklauen(55,50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tady děláš?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(směje se) Já tady bydlím!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//Co bych tu asi tak měl dělat? Piju!
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Vyjdu si na menší procházku.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jestli tím myslíš, co dělám celý cen, tak pořádám souboje.
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "Ty pořádáš souboje?";
};


func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty pořádáš souboje?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Každý den od poledne do večera.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//A přímo tady!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za skladištěm v přístavní čtvrti - všude dobře, doma nejlíp!
};


instance DIA_ALRIK_SELLWHAT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = dia_alrik_sellwhat_condition;
	information = dia_alrik_sellwhat_info;
	permanent = FALSE;
	description = "Nevíš kde bych mohl koupit takoví oblek jako máš ty ?.";
};


func int dia_alrik_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_alrik_sellwhat_info()
{
	AI_Output(other,self,"DIA_Alrik_SellWhat_15_00");	//Nevíš kde bych mohl koupit takoví oblek jako máš ty ?
	AI_Output(self,other,"DIA_Alrik_SellWhat_09_01");	//Ano a to přímo u mě.
};


var int alrik_leatherbought;

instance DIA_ALRIK_LEATHER(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 650;
	condition = dia_alrik_leather_condition;
	information = dia_alrik_leather_info;
	permanent = TRUE;
	description = "Koupit Vystuženou tuniku. (500 zlaťáků)";
};


func int dia_alrik_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_sellwhat) && (ALRIK_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_leather_info()
{
	AI_Output(other,self,"DIA_Alrik_LEATHER_15_00");	//Díky za dobrý obchod.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Alrik_LEATHER_09_01");	//Bude se ti moc líbit.
		CreateInvItems(other,itar_geralt_addon,1);
		AI_PrintScreen("Zbroj od Alrika získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		ALRIK_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_LEATHER_09_02");	//Oděv má svou cenu - a opravdu za to stojí. Takže se vrať, až dáš dohromady dost zlata.
	};
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "Jsou nějaký pravidla?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jsou nějaký pravidla?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Je to jednoduchý: jsou povolený všechny normální zbraně. Žádný luky ani kuše a ŽÁDNÁ magie!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Bojujeme, dokud jeden z nás nepadne. Jakmile bude jeden ležet s držkou v hlíně, je konec, jasný?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Každý, kdo opustí místo zápasu, taky prohrál. Takže když utečeš, vyhrál jsem já!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Zápisné je 50 zlaťáků a když vyhraješ, dostaneš zpátky stovku. Když ne, tak o ty prachy přijdeš (ušklíbne se).
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Chápeš?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jo!
};

func void B_Alrik_Again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Tak co? Chceš si to se mnou znova rozdat? Myslím, že jsem se mezitím zlepšil.
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,4);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//Řekl bych, že už ses navyhrával dost.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nechápej mě špatně, ale od minula mi ještě nepřestalo hučet v hlavě.
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Tak se vrať později - já mezitím budu cvičit.
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "Chci s tebou bojovat!";
};


func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chci s tebou bojovat!
	Info_ClearChoices(DIA_Alrik_WannaFight);
	if(((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Nejdřív mi vrať meč a pak uvidíme.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Ne-e, než se ti znova postavím, potřebuju lepší zbraň!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Před pár dny jsem musel prodat svůj meč.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//S ním mě totiž nikdo neporazí, hochu! Když mi ho přineseš, klidně si s tebou zase zabojuju!
			Alrik_VomSchwertErzaehlt = TRUE;
			Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
			B_LogEntry(TOPIC_AlrikSchwert,"Alrik prodal svůj meč obchodníku Jorovi. Bude se se mnou bít pouze tehdy, pokud mu jej přinesu zpátky.");
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Myslím, že to by prozatím mohlo stačit.
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Nech mě trochu vydechnout.
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren > 9))
	{
		B_Alrik_Enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Krom toho jsem už dal dohromady dost peněz.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Končím a jdu si ve městě najít nějaké místo, kde bych mohl zůstat.
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kdo ví, možná si otevřu obchod se zbraněmi.
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//Máš 50 zlaťáků?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Ani náhodou...",DIA_Alrik_WannaFight_NoGold);
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Jak si přeješ...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Bojuju pouze od oběda do večera.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Boj stojí za to pouze tehdy, pokud je kolem dost diváků, kteří uzavírají sázky!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Teď už je moc pozdě, vrať se zítra v poledne!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Teď je ještě brzo, vrať se později!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Jak si přeješ.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(hlasitě) Máme tu nového vyzyvatele!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Sázky jsou uzavřeny.
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	CreateInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jsi připraven?
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"Ještě chvilku.",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"Pojď sem!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Ani náhodou.
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Tak je sežeň! Bez sázek není žádný boj!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Pojď sem!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Tak uvidíme, jak to zvládneš!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Ještě chvilku.
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Klidně si dej na čas - já začínám teď!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Páni, chlape, ty máš ale sílu!
			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Tady máš těch 100 zlaťáků, zasloužil sis je!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Vidím, že své zlato sis už vzal.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Měls ale počkat, až ti je dám - já své slovo držím!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Tys mě ale prošacoval, když jsem byl v bezvědomí!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To není dobrý, chlape! No, nevadí, ty prachy ti stejně patřily - a tady je zbytek!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To byl dobrý boj. Sázku jsi ale prohrál - nic si z toho ale nedělej, přispěls na dobrou věc! (ušklíbne se)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, jak jsem řekl, každý, kdo se vzdálí ze zápasiště, prohrál! Jestli to chceš ale zkusit znova, jsem ti k dispozici!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//A ještě jedna věc: o tom, co se děje za skladištěm, se nemluví.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Domobrana tě může šoupnout za mříže za sebemenší prohřešek - a sázení na souboje se jim rozhodně moc nelíbí.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Boj skončil, břídile!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nelíbí se mi, když někdo porušuje pravidla.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Vypadni odsud!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Když jsi se mnou chtěl bojovat, stačilo, abys mě prostě vyzval.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Jestli chceš další boj, tak mě k němu prostě vyzvi!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//S takovými pobudy, jako jsi ty, nechci nic mít! Odpal!
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = "Ty bydlíš za skladištěm?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(překvapeně) Ty bydlíš za skladištěm?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Je to jenom dočasné. (ušklíbne se) Kdybys měl tolik peněz co já, taky by sis dopřál trochu pohodlí!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//Býval jsem výcvikovým instruktorem v armádě, ale pak jsem toho nechal a vydal se za dobrodružstvím.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A teď jsem skončil v týhle špinavý díře a posledních 100 zlaťáků vysolil strážím u brány.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Takže teď koukám zase přijít k nějakým penězům. Dokonce jsem musel prodat i svůj meč.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "Komu jsi svůj meč prodal?";
};


func int DIA_Alrik_WerSchwert_Condition()
{
	if((Alrik_VomSchwertErzaehlt == TRUE) && (MIS_Alrik_Sword != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu jsi svůj meč prodal?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//U jednoho obchodníka na tržišti jsem jej vyměnil za nějaké zásoby.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Ten chlápek se jmenuje Jora. Ty pochodně a trochu jídla, co mi dal, jsem už dávno spotřeboval.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Ten meč mi ale asi jen tak zadarmo nedá.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Ten meč je starý a nejspíš za něj moc chtít nebude. Mysli přitom na prachy, které si vyděláš na sázkách při zápase. (ušklíbne se)
	MIS_Alrik_Sword = LOG_Running;
};


var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = TRUE;
	description = "Mám ten tvůj meč.";
};


func int DIA_Alrik_HaveSword_Condition()
{
	if(Npc_HasItems(other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Mám ten tvůj meč.
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	if(MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Páni! To je mnohem lepší než bojovat s nějakým starým klackem!
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP(XP_AlriksSword);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Skvělé! Jsem zvědav, jestli se mě teď odvážíš vyzvat ještě jednou!
	};
	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "Co víš o té válce se skřety?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co víš o té válce se skřety?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//K tomu není moc co říct. Ta válka prostě trvá už moc dlouho.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Celá země hladoví. Všude propukají rolnické nepokoje, které král nemilosrdně potírá.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale moc mu to nepomůže - těch vzpour je příliš mnoho. Jestli válka brzo neskončí, celá říše se rozpadne.
};


var int Alrik_VorausErzaehlt;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "Můžeš mě učit?";
};


func int DIA_Alrik_Ausbilden_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE)) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Můžeš mě učit?
	if((Alrik_Kaempfe == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jestli se opravdu chceš naučit bojovat, tak si to pojď rozdat se mnou. (domýšlivě) A ani si za tu lekci nebudeš muset připlatit.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Dodržím slovo a naučím tě všechno, co znám - pokud máš tedy dostatek zkušeností.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jestli máš dostatek zkušeností, tak jasně!
		};
		Alrik_Teach1H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Alrik mě naučí bojovat jednoručními zbraněmi. Potuluje se za skladištěm v přístavní čtvrti.");
	};
};


var int Alrik_Merke_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "Vycvič mě v boji s mečem!";
};


func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Vycvič mě v boji s mečem!
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//Už nejsi žádný nováček!
	}
	else if(other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//Už ses pořádně zlepšil - brzo z tebe bude pořádný bojovník!
	};
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

