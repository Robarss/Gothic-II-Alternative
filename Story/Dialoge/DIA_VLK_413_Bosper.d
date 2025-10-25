
instance DIA_Bosper_EXIT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 999;
	condition = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bosper_HALLO(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_HALLO_Condition;
	information = DIA_Bosper_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bosper_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Vítej v mém obchodě, cizinče.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Jmenuji se Bosper. Vyrábím luky a obchoduji s kožešinami.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Co tě přivádí do Khorinisu?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Bosper vyrábí luky a obchoduje s kůžemi. Jeho obchod najdu v dolní části města, u jižní brány.");
};


instance DIA_Bosper_IntoOV(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent = FALSE;
	description = "Musím se dostat do horní čtvrti.";
};


func int DIA_Bosper_IntoOV_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Musím se dostat do horní čtvrti.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Tam, kde sídlí paladinové? Tak na to rovnou zapomeň.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Nejdřív se musíš stát ctihodným měšťanem, nebo si aspoň najít slušné zaměstnání.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//Jako cizinec se tam rozhodně dostat nemůžeš.
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//To jsem taky zjistil.
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry(TOPIC_OV,"Pokud se chci dostat do horní čtvrti, musím se stát buďto váženým občanem, nebo si najít práci.");
};


instance DIA_Bosper_SeekWork(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent = FALSE;
	description = "Hledám práci!";
};


func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Hledám práci!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Hmm - nový učedník by se mi hodil.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Ten poslední to vzdal zrovna předevčírem.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Víš aspoň něco o lovu?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Noooo...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Můžu tě naučit, jak stahovat zvířata.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Za každou kůži, kterou mi přineseš, ti dobře zaplatím.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Můžu ti dát pár kůží, jestli o ně máš zájem.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Výborně! Přines mi tolik zvířecích kůži, kolik můžeš - koupím je od tebe za dobrou cenu.
	};
	B_LogEntry(TOPIC_Lehrling,"Bosper hledá nového učedníka - mohl bych u něj začít pracovat.");
};


var int Bosper_HintToJob;
var int Bosper_StartGuild;

instance DIA_Bosper_LEHRLING(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent = TRUE;
	description = "Chci se stát tvým učedníkem!";
};


func int DIA_Bosper_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Chci se stát tvým učedníkem!
	if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(zakření se) Skvělé! Řekl bych, že základy už máš.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad si myslí, že jsi dobrý člověk.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Ale Harad není o tvých schopnostech zrovna přesvědčen.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Ale Harad tě prý ještě nikdy neviděl.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben ti dal své požehnání. Já sice nejsem tak pobožný, ale vážím si toho.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben ti dá požehnání jen tehdy, pokud si vyprosíš boží smilování.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben nemá ponětí, kdo jsi.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino prohlašuje, že se můžeš zapsat, u koho chceš
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino prohlašuje, žes byl obviněný ze zločinu - doufám, že šlo jen o nějakou banalitu.
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Snaž se to co nejdřív urovnat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino o tobě ještě ani neslyšel.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//A Matteo praví, že by tě měli vyvažovat zlatem.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//A Matteo se zmínil o nějaké půjčce - ať už tím myslel cokoliv, měl by sis s ním radši promluvit.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo tvrdí, že s tebou o téhle věci zatím nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo tvrdí, že tě ještě nikdy v životě neviděl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//To znamená, žes získal doporučení ode všech mistrů!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Nyní tě doporučují čtyři mistři - to postačí, abys mohl k někomu vstoupit do učení.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Můžeš pro mě začít pracovat, kdykoliv budeš chtít.
			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Dobře - rozmyslím si to.",DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Jdu do toho!",DIA_Bosper_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Chceš-li k někomu v dolní části města vstoupit do učení, potřebuješ souhlas alespoň čtyř mistrů.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//Takže by sis měl promluvit se všemi, kteří ti zatím souhlas nedali.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Ještě než tě přijmu, musím samozřejmě vědět, jestli jsi aspoň k něčemu dobrý.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Vrátil jsi mi můj luk, ale to o tvém loveckém talentu moc nevypovídá.
		};
		Bosper_HintToJob = TRUE;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Nebudeš toho litovat! Myslím, že se nám bude dobře spolupracovat.
	Player_IsApprentice = APP_Bosper;
	Npc_ExchangeRoutine(Lothar,"START");
	Bosper_StartGuild = other.guild;
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	CreateInvItems(other,itar_leather_l_grd3,1);
	AI_PrintScreen("Bosper ti daruje koženou zbroj.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(Topic_Bonus,"Bosper mě přijal za učedníka. Nyní mám přístup do horní čtvrti.");
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};


instance DIA_BOSPER_SELLWHAT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_sellwhat_condition;
	information = dia_bosper_sellwhat_info;
	permanent = FALSE;
	description = "Nevíš kde bych mohl koupit zbroj jako máš ty ?";
};


func int dia_bosper_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_HALLO))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_bosper_sellwhat_info()
{
	AI_Output(other,self,"DIA_Bosper_SellWhat_15_00");	//Nevíš kde bych mohl koupit zbroj jako máš ty ?
	AI_Output(self,other,"DIA_Bosper_SellWhat_09_01");	//Ano a to přímo u mě, ale prodávám ho jen lovcům, takže pokud chceš tuhle loveckou zbroj musíš pro mě pracovat.
};


var int bosper_leatherbought;

instance DIA_BOSPER_LEATHER(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 750;
	condition = dia_bosper_leather_condition;
	information = dia_bosper_leather_info;
	permanent = TRUE;
	description = "Koupit Zbroj Lovce. (1500 zlaťáků)";
};


func int dia_bosper_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_sellwhat) && (BOSPER_LEATHERBOUGHT == FALSE) && (Player_IsApprentice == APP_Bosper))
	{
		return TRUE;
	};
};

func void dia_bosper_leather_info()
{
	AI_Output(other,self,"DIA_Bosper_LEATHER_15_00");	//1500 zlaťáků?? no dobře, jen doufám že při lovu bude opravdu stát za to.
	if(B_GiveInvItems(other,self,ItMi_Gold,1500))
	{
		AI_Output(self,other,"DIA_Bosper_LEATHER_09_01");	//Bude, to se neboj a když budeš dobře pracovat za chvíli to máš zpátky. (ušklíbne se)
		CreateInvItems(other,itar_huntmistr,1);
		AI_PrintScreen("Zbroj od Bosper získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		BOSPER_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEATHER_09_02");	//Zbroj má svou cenu - a opravdu za to stojí. Takže se vrať, až dáš dohromady dost zlata.
	};
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Dobře - rozmyslím si to.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Jen se nerozhodni špatně! Byl bys pro mě úplně ideální.
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};


instance DIA_Bosper_OtherMasters(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent = FALSE;
	description = "Co když se budu chtít zapsat u některého z ostatních mistrů?";
};


func int DIA_Bosper_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//Co když se budu chtít zapsat u některého z ostatních mistrů?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(mrzutě) Nesmysl!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad a Matteo už učedníky mají.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Alchymista Constantino je starý samotář - ten žádného učedníka nepřijal už celé roky.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//A co se týče Thorbena, tak o něm každý ví, že je úplně švorc - nejspíš by ti nemohl zaplatit ani měďák.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//Ovšem já velmi nutně potřebuji učedníka - a taky dobře platím.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Ale ať už se chceš zapsat u kohokoliv, budeš k tomu potřebovat souhlas všech ostatních mistrů z dolní části města.
};


instance DIA_Bosper_Bartok(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent = FALSE;
	description = "Proč to tvůj minulý učedník vzdal?";
};


func int DIA_Bosper_Bartok_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Proč to tvůj minulý učedník vzdal?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Nechal se slyšet, že je tu poslední dobou příliš nebezpečno.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Jestli tě to ale opravdu zajímá, můžeš se ho zeptat sám.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Jmenuje se Bartok a nejspíš se bude potloukat kolem Coragonovy krčmy.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Když z kovárny vyjdeš podchodem, ocitneš se skoro přímo před hospodou.
};


instance DIA_Bosper_ZUSTIMMUNG(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Dáš mi svůj souhlas, abych se mohl zapsat u jiného mistra?";
};


func int DIA_Bosper_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};


var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Dáš mi svůj souhlas, abych se mohl zapsat u jiného mistra?
	if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(zklamaně) Doufal jsem, že se rozhodneš pro mě.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Ale když to chceš takhle...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Tím mi chceš naznačit, že mě nedoporučíš?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Když ostatní mistři nebudou proti, pak ano.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Když už nic jiného, aspoň jsi mi vrátil luk.
		};
		if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Ale určitě by z tebe byl dobrý lovec.
		};
		if(Bosper_Zustimmung_Once == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};
		B_LogEntry(TOPIC_Lehrling,"Bosper mi dá doporučení, když se budu chtít stát učedníkem u někoho jiného.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(povzdychne si) No dobře! Přimluvím se za tebe - ale s jednou podmínkou.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Pracuj pro mě, alespoň chvíli.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Tak zjistíš, jestli se ti moje řemeslo zamlouvá, nebo ne.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//A kdo ví - možná se ti zalíbí natolik, že zůstaneš u mě.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//A když jsi dost dobrý, abych tě přijal JÁ, určitě si povedeš dobře i u ostatních.
		Bosper_HintToJob = TRUE;
	};
};


instance DIA_Bosper_Job(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent = FALSE;
	description = "Co mám pro tebe udělat?";
};


func int DIA_Bosper_Job_Condition()
{
	if(Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Co mám pro tebe udělat?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Naučím tě, jak stahovat kůži ze zvířat, a ty mi pak přineseš, řekněme, půl tuctu vlčích kůží.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Bosper mě naučí stahovat zvířecí kůže.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Přines mi půl tuctu vlčích kůží.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Tak poznám, že ses své řemeslo naučil.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Pokud ti to nepotrvá věčnost a jestli ty kůže budou ve slušném stavu, přijmu tě, když budeš chtít.
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Nebo (povzdech) můžeš začít u některého z ostatních mistrů - budeš-li si to opravdu přát.
	};
	MIS_Bosper_WolfFurs = LOG_Running;
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf,LOG_Running);
	B_LogEntry(TOPIC_BosperWolf,"Musím Bosperovi přinést šest vlčích kůží - pak pro něj budu moci pracovat, nebo mě doporučí, abych mohl vstoupit do učení u jiného mistra.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry(TOPIC_BosperWolf,"Měl bych ho přimět, aby mě naučil stahovat zvířecí kůže.");
	};
};


instance DIA_Bosper_BringFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 102;
	condition = DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent = TRUE;
	description = "Co se týče těch vlčích kůží...";
};


func int DIA_Bosper_BringFur_Condition()
{
	if(MIS_Bosper_WolfFurs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Co se týče těch vlčích kůží...
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Už jsi vstoupil do učení k jinému mistrovi. Kůže od tebe proto odkoupím už jenom za běžnou cenu.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	if(B_GiveInvItems(other,self,ItAt_WolfFur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Mám je - tady.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Skvělé! Já věděl, že se pro tuhle práci hodíš!
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Tady máš peníze, jak jsem ti slíbil.
		B_GiveInvItems(self,other,ItMi_Gold,Value_WolfFur * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//No a? Co si myslíš? Není to lepší práce, než se celé dny ohánět mečem nebo se v nevětraném kutlochu patlat s nějakými lahvičkami?
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry(TOPIC_Lehrling,"Bosper mě přijme do učení, pokud s tím budou souhlasit i ostatní z mistrů.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Dohodli jsme se na půltuctu - ještě máš ale čas. Pokračuj a opatři mi ty kůže.
	};
};


instance DIA_Bosper_TeachFUR(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent = TRUE;
	description = "Vysvětli mi, jak stahovat zvířata z kůže!";
};


func int DIA_Bosper_TeachFUR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Vysvětli mi, jak stahovat zvířata z kůže!
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//No tak poslouchej, je to jednoduché, opravdu.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Stačí vzít ostrý nůž a rozříznout zvířeti břicho. Pak po stranách trochu nařízni kůži na nohou a můžeš celou kožišinu směle stáhnout.
		if(MIS_Bosper_WolfFurs == LOG_Running)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Přines mi vlčí kůže a pak se uvidí.
			B_LogEntry(TOPIC_BosperWolf,"Bosper mě naučil stahovat zvířecí kůže.");
		};
	};
};


instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 700;
	condition = DIA_Bosper_Trade_Condition;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Bosper_Trade_Condition()
{
	if(MIS_Bosper_WolfFurs != LOG_Running)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	return TRUE;
};

func void DIA_Bosper_Trade_Info()
{
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Ukaž mi své zboží.
	if(DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Nejsi tady, aby sis prohlížel moje zboží - máš mi přece přinést ty kůže!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Tak pokračuj!
	};
};


instance DIA_Bosper_BogenRunning(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BogenRunning_Condition;
	information = DIA_Bosper_BogenRunning_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že tě prý někdo okradl.";
};


func int DIA_Bosper_BogenRunning_Condition()
{
	if(MIS_Bosper_Bogen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Slyšel jsem, že tě prý někdo okradl.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Kdo ti to řekl? Nejspíš Bartok, že? To ti nemohl povědět nic lepšího? No tak jo.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Řeknu ti, ať se ten hajzl modlí, abych ho nedostal do ruky!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Jen na chviličku jsem odešel z krámu a když jsem se vrátil, spatřil jsem jenom, jak utíká - s mým lukem na rameni.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Okamžitě jsem zavolal stráže, ale ten lump běžel směrem k přístavu. A tam se jim ztratil.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Trochu jsem jim připálil koudel u zadku, takže prohledali celou přístavní čtvrť, ale nenašli vůbec nic.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Jsou to prostě mamlasové!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Vsadím se, že můj luk bude pořád ještě někde ve městě. Informoval jsem stráže u obou městských bran, a tak by nikoho s mým lukem ven nepustili.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Kdybych jen toho šmejda dostal do rukou...
	Log_CreateTopic(TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_Running);
	B_LogEntry(TOPIC_BosperBogen,"Bosperovi někdo ukradl luk. Zloděj uprchl do přístavu, ale pak někam zmizel. Domobrana prohledala celou čtvrť, ale nikdo nic nenašel, i když luk musí být stále ještě kdesi ve městě.");
};


instance DIA_Bosper_BogenSuccess(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 6;
	condition = DIA_Bosper_BogenSuccess_Condition;
	information = DIA_Bosper_BogenSuccess_Info;
	permanent = FALSE;
	description = "Mám pocit, že tenhle luk je tvůj.";
};


func int DIA_Bosper_BogenSuccess_Condition()
{
	if(Npc_HasItems(other,ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//Mám pocit, že tenhle luk je tvůj.
	B_GiveInvItems(other,self,ItRw_Bow_L_03_MIS,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Můj luk! Kdes ho našel?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//V černé díře plné krys.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Doufám, žes s tím neměl nějaké trable.
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Ne - s takovými věcmi už jsem se vypořádal dřív.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hm, ať je to, jak chce, děkuji ti. Jsem tvým dlužníkem!
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems(self,ItRw_Bow_L_03_MIS,1);
};


var int Bosper_Island;

instance DIA_Bosper_PERM(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 10;
	condition = DIA_Bosper_PERM_Condition;
	information = DIA_Bosper_PERM_Info;
	permanent = TRUE;
	description = "Co novýho ve městě?";
};


func int DIA_Bosper_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Co novýho ve městě?
	if(Bosper_Island == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Jestli nás skřeti opravdu obklíčí, začne to tu být velmi nepříjemné.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//Jediná loď, která tu kotví, patří paladinům a ti si ji taky pořádně hlídají. A nemyslím, že by ji použili na záchranu měšťanů.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Nedá se odsud dostat ještě nějak jinak?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Ne, nikdo z nás odsud bez lodi neunikne.
		Bosper_Island = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Zatím se nic nového nepřihodilo. Stav se později.
	};
};


var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;

instance DIA_Bosper_AlsLehrling(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bosper_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Bosper_StartGuild != GIL_MIL) && (Bosper_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Takže ty ses přidal k domobraně?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Ne že by mi to nějak vadilo. Kromě skřetů a banditů můžeš vždycky ulovit i pár vlků (ušklíbne se).
		Bosper_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Bosper_StartGuild != GIL_PAL) && (Bosper_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Koukám, že tvoje kariéra letí rychle vzhůru, královský paladine!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Ať už odsud půjdeš kamkoliv, nezapomeň na svého starého mistra.
		Bosper_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Bosper_StartGuild != GIL_NOV) && (Bosper_StartGuild != GIL_KDF) && (Bosper_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Tak tys vstoupil do kláštera, jo? Doufám, že tě občas taky pustí ven, abys mě mohl i nadále zásobovat kůžemi.
		Bosper_INNOSKommentar = TRUE;
	}
	else if((Bosper_Lehrling_Day <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Kde ses tak dlouho flákal?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Potřebuji další kůže, přinesls mi je?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Tak tě tu máme zas...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Bosper_Aufgaben(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_Aufgaben_Condition;
	information = DIA_Bosper_Aufgaben_Info;
	permanent = FALSE;
	description = "Jaké mám jako učedník povinnosti?";
};


func int DIA_Bosper_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Jaké mám jako učedník povinnosti?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Je to jednoduché - přines mi co nejvíc kožešin.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Zaplatím ti za ně daleko lepší cenu, než jakou by ti mohli nabídnout ostatní obchodníci.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Kromě toho se nemusíš v obchodě moc ukazovat - zvládnu to klidně všechno sám.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//A kde mám spát?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//Bohužel tu pro tebe nemám žádný volný pokoj. Ale v hotelu na tržišti tě někam uložit musí.
	};
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Bosper mi za zvířecí kůže zaplatí velmi příznivou cenu.");
};


var int Bosper_TrollFurSold;

instance DIA_Bosper_SellFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = DIA_Bosper_SellFur_Condition;
	information = DIA_Bosper_SellFur_Info;
	permanent = TRUE;
	description = "Mám tu pro tebe pár kůží.";
};


func int DIA_Bosper_SellFur_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Mám tu pro tebe pár kůží.
	if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0))
	{
		if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait(self,3);
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur);
			B_GiveInvItems(other,self,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		};
		if(Npc_HasItems(other,ItAt_SheepFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Ovčí kůže? Doufám, žes tu ovci nezabil nějakému sedlákovi na pastvě.
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//To by mě ani ve snu nenapadlo.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur);
			B_GiveInvItems(other,self,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
		};
		if(Npc_HasItems(other,ItAt_WolfFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Vlčí kůže, ty jsou dobré.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_WolfFur) * Value_WolfFur);
			B_GiveInvItems(other,self,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
		};
		if(Npc_HasItems(other,ItAt_WargFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Kůže ze skřetího psa? To jsou pěkné bestie.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_WargFur) * Value_WargFur);
			B_GiveInvItems(other,self,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
		};
		if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Páni, dokonce kůže stínové šelmy - ty jsou velmi cenné.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur);
			B_GiveInvItems(other,self,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		};
		if((Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0))
		{
			if(Bosper_TrollFurSold == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//A co je ksakru TOHLE za kůži?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Tu jsem stáhl z trola.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//... ta má cenu celého jmění!
				Bosper_TrollFurSold = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Další velká trolí kůže - tos ty potvory vážně zabil?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//To víš - když narazím na nějakou nestvůru, prostě chytím příležitost za pačesy.
			};
			if(Npc_HasItems(other,ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur);
				B_GiveInvItems(other,self,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
			};
			if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//A dokonce kůže z černého trola!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
				B_GiveInvItems(other,self,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Dobrá práce. Přijď zase, až seženeš další.
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Ale vždyť víš, že mě zajímají pouze kůže z vlků, stínových šelem a tak podobně.
	};
};


const int VALUE_HUNT1 = 3;
const int VALUE_HUNT2 = 4;
const int VALUE_HUNT3 = 30;
const int VALUE_HUNT4 = 60;
const int VALUE_HUNT5 = 100;
const int VALUE_HUNT6 = 120;

instance DIA_BOSPER_SELLFUR2(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = dia_bosper_sellfur2_condition;
	information = dia_bosper_sellfur2_info;
	permanent = TRUE;
	description = "Mám tu pro tebe jiné trofeje z monster (drápy,zuby,rohy).";
};


func int dia_bosper_sellfur2_condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur2_info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur1_09_00");	//Mám tu pro tebe jiné trofeje z monster (drápy,zuby,rohy).
	if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0) || (Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0) || (Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0))
	{
		if(Npc_HasItems(other,ItAt_Claw) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_09_01");	//Klasické drápy z monster, tady máš zlato.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Claw) * VALUE_HUNT1);
			B_GiveInvItems(other,self,ItAt_Claw,Npc_HasItems(other,ItAt_Claw));
		};
		if(Npc_HasItems(other,ItAt_LurkerClaw) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_10_03");	//Výborně, drápy číhavce, ty jsou dobré.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_LurkerClaw) * VALUE_HUNT2);
			B_GiveInvItems(other,self,ItAt_LurkerClaw,Npc_HasItems(other,ItAt_LurkerClaw));
		};
		if(Npc_HasItems(other,ItAt_Teeth) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_10_04");	//Klasické zuby z monster, tady máš zlato.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Teeth) * VALUE_HUNT1);
			B_GiveInvItems(other,self,ItAt_Teeth,Npc_HasItems(other,ItAt_Teeth));
		};
		if(Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_10_05");	//Páni, Roh dračího chňapavce, to jsou nechutné bestie.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_DrgSnapperHorn) * VALUE_HUNT3);
			B_GiveInvItems(other,self,ItAt_DrgSnapperHorn,Npc_HasItems(other,ItAt_DrgSnapperHorn));
		};
		if(Npc_HasItems(other,ItAt_ShadowHorn) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_12_06");	//Páni, Roh stínové šelmy - ty jsou velmi cenné.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowHorn) * VALUE_HUNT5);
			B_GiveInvItems(other,self,ItAt_ShadowHorn,Npc_HasItems(other,ItAt_ShadowHorn));
		};
		if(Npc_HasItems(other,ItAt_SharkTeeth) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_13_07");	//Zuby močálového žraloka, no tyhle bestie jsou taky nebezpečné, tady máš zlato.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SharkTeeth) * VALUE_HUNT4);
			B_GiveInvItems(other,self,ItAt_SharkTeeth,Npc_HasItems(other,ItAt_SharkTeeth));
		};
		if(Npc_HasItems(other,ItAt_TrollTooth) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur1_14_08");	//A dokonce Trolí tesák, neuvěřitelné! to má cenu celého jmění.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollTooth) * VALUE_HUNT6);
			B_GiveInvItems(other,self,ItAt_TrollTooth,Npc_HasItems(other,ItAt_TrollTooth));
		};
		AI_Output(self,other,"DIA_Bosper_SellFur1_11_12");	//Dobrá práce. Přijď zase, až seženeš další.
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur1_11_13");	//Ale vždyť víš, že mě zajímají pouze různé kůže ze šelem, zuby, drápy a rohy, nic jiného.
	};
};


instance DIA_Bosper_Minenanteil(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_Minenanteil_Condition;
	information = DIA_Bosper_Minenanteil_Info;
	description = "Vidím, že máš na prodej nějaké důlní akcie.";
};


func int DIA_Bosper_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Vidím, že máš na prodej nějaké důlní akcie.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Ehm, o tom nic nevím. Klidně si je vezmi, jestli chceš.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_BOSPER_TEACH(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = dia_bosper_teach_condition;
	information = dia_bosper_teach_info;
	permanent = 0;
	description = "Můžeš mě naučit vyrobit zbroj?";
};


func int dia_bosper_teach_condition()
{
	return TRUE;
};

func void dia_bosper_teach_info()
{
	AI_Output(other,self,"DIA_Bosper_teach_15_00");	//Můžeš mě naučit vyrobit zbroj?
	AI_Output(self,other,"DIA_Bosper_teach_01_01");	//Můžu tě naučit jak udělat Silnější koženou zbroj.
	Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
	B_LogEntry(TOPIC_SKINHUN,"Bospr mě může naučit jak vyrobit silnější koženou zbroj.");
};


instance DIA_BOSPER_LEARN(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = dia_bosper_learn_condition;
	information = dia_bosper_learn_info;
	permanent = 2;
	description = "Silná kožená zbroj (cena: 2 VB)";
};


func int dia_bosper_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_bosper_teach) && (KNOWS_SKINARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_learn_info()
{
	AI_Output(other,self,"DIA_Bosper_Learn_15_00");	//Nauč mě vyrobit silnou koženou zbroj.
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Bosper_Learn_12_01");	//Začni tím, že si na dílně na kůže připravíš věci na výrobu.
		AI_Output(self,other,"DIA_Bosper_Learn_12_02");	//Potom si připrav kůže ze kterých budeš vyrábět zbroj a očisti ji.
		AI_Output(self,other,"DIA_Bosper_Learn_12_04");	//Natáhni je a sešívej přesně aby byla pevná tak jak ti to ukazuji.
		Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
		B_LogEntry(TOPIC_SKINHUN,"Umim vyrobit: Koženou zbroj.");
		B_LogEntry(TOPIC_SKINHUN,"Material na výrobu: 5x vlčí kůže, 3x drápy.");
		KNOWS_SKINARM = TRUE;
		PrintScreen("Umím vyrobit: Koženou zbroj",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_BOSPER_TEACHBOW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = dia_bosper_teachbow_condition;
	information = dia_bosper_teachbow_info;
	permanent = 0;
	description = "Můžeš mě naučit jak na výrobu luků?";
};


func int dia_bosper_teachbow_condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void dia_bosper_teachbow_info()
{
	AI_Output(other,self,"DIA_Bosper_bow_15_00");	//Můžeš mě naučit jak na výrobu luků?
	AI_Output(self,other,"DIA_Bosper_bow_01_01");	//Ano, můžu tě naučit jak na výrobu luků.
	Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
	B_LogEntry(TOPIC_BOWHUNT,"Bospr mě může naučit jak vyrobit luky a kuše.");
};


instance DIA_BOSPER_LEARNBOW1(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = dia_bosper_learnbow1_condition;
	information = dia_bosper_learnbow1_info;
	permanent = TRUE;
	description = "Zakladní výroba  (cena: 2 VB)";
};


func int dia_bosper_learnbow1_condition()
{
	if(Npc_KnowsInfo(hero,dia_bosper_teachbow) && (KNOWS_BOWSCROLLSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_learnbow1_info()
{
	AI_Output(other,self,"DIA_Bosper_Learnbow1_15_00");	//Nauč mě zakladní výrobu.
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		B_TeachThiefTalent(self,other,NPC_TALENT_BOW_MAKER);
		AI_Output(self,other,"DIA_Bosper_Learnbow1_12_01");	//Začni tím, že si na dílně na luky připravíš věci na výrobu.
		AI_Output(self,other,"DIA_Bosper_Learnbow1_12_02");	//Potom uděláš tohle a tam to, zbytek pochopíš z nákresu a dílna je přímo za mnou.
		AI_Output(self,other,"DIA_Bosper_Learnbow1_12_04");	//Nákresy můžeš zakoupit i u mě a lze ten samý postup použít i na kuše.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		B_LogEntry(TOPIC_BOWHUNT,"Umím vyrobit luky a kuše.");
		KNOWS_BOWSCROLLSI = TRUE;
		PrintScreen("Umím vyrobit luky a kuše",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_BOSPER_LEARNBOW2(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = dia_bosper_learnbow2_condition;
	information = dia_bosper_learnbow2_info;
	permanent = TRUE;
	description = "Pokročilá výroba  (cena: 4 VB)";
};


func int dia_bosper_learnbow2_condition()
{
	if(Npc_KnowsInfo(hero,dia_bosper_teachbow) && (KNOWS_BOWSCROLLSI == TRUE) && (KNOWS_BOWSCROLLSII == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_learnbow2_info()
{
	AI_Output(other,self,"DIA_Bosper_Learnbow2_15_00");	//Nauč mě pokročilou výrobu.
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Bosper_Learnbow2_12_01");	//Je to jen o trochu složitější ale stojí to za to, podívej.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		KNOWS_BOWSCROLLSII = TRUE;
		PrintScreen("Umím vyrobit pokročilé luky a kuše",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_BOSPER_LEARNBOW3(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = dia_bosper_learnbow3_condition;
	information = dia_bosper_learnbow3_info;
	permanent = TRUE;
	description = "Mistrovská výroba  (cena: 8 VB)";
};


func int dia_bosper_learnbow3_condition()
{
	if(Npc_KnowsInfo(hero,dia_bosper_teachbow) && (KNOWS_BOWSCROLLSII == TRUE) && (KNOWS_BOWSCROLLSIII == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_learnbow3_info()
{
	AI_Output(other,self,"DIA_Bosper_Learnbow3_15_00");	//Nauč mě Mistrovskou výrobu.
	if(hero.lp >= 8)
	{
		hero.lp = hero.lp - 8;
		AI_Output(self,other,"DIA_Bosper_Learnbow3_12_01");	//Tady už to chce trochu umění a trpělivost, podívej.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		KNOWS_BOWSCROLLSIII = TRUE;
		PrintScreen("Umím vyrobit mistrovské luky a kuše",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_BOSPER_TEACHNOBOSPER(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = dia_bosper_teachnobosper_condition;
	information = dia_bosper_teachnobosper_info;
	permanent = 0;
	description = "Můžeš mě naučit Mistrovskou výrobu luků?";
};


func int dia_bosper_teachnobosper_condition()
{
	if((Player_IsApprentice == APP_Constantino) || ((Player_IsApprentice == APP_Harad) && (KNOWS_BOWSCROLLSII == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bosper_teachnobosper_info()
{
	AI_Output(other,self,"DIA_teachNoBosper_15_00");	//Můžeš mě naučit Mistrovskou výrobu luků?
	AI_Output(self,other,"DIA_teachNoBosper_15_01");	//Ne učím jen lovce, měl ses ke mě přidat do učení.
	AI_Output(other,self,"DIA_teachNoBosper_15_02");	//Nemohli bychom se nějak dohodnout za rozumnou cenu?
	AI_Output(self,other,"DIA_teachNoBosper_15_03");	//Chceš se učit mistrovskou úroveň? jenže to není jen tak, rozumíš tomu aspoň trochu?
	AI_Output(other,self,"DIA_teachNoBosper_15_04");	//Ano ovládám už pokorčilou výrobu, tak co dohodnem se?
	AI_Output(self,other,"DIA_teachNoBosper_15_05");	//Hmmm.. v takovém případě bych to mohl udělat, ale nebude to levný.
	AI_Output(other,self,"DIA_teachNoBosper_15_06");	//Kolik za to chceš?
	AI_Output(self,other,"DIA_teachNoBosper_15_07");	//3000 zlatých a nehodlám smlouvat, takže je to na tobě.
	Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
	B_LogEntry(TOPIC_BOWHUNT,"Bospr mě může naučit Mistrovskou výrobu luků.");
};


instance DIA_BOSPER_BOWNOBOSPER(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = dia_bosper_bownobosper_condition;
	information = dia_bosper_bownobosper_info;
	permanent = TRUE;
	description = "Mistrovská výroba  (cena: 15 VB, 3000 zlatých)";
};


func int dia_bosper_bownobosper_condition()
{
	if(Npc_KnowsInfo(hero,dia_bosper_teachnobosper) && (KNOWS_BOWSCROLLSII == TRUE) && (KNOWS_BOWSCROLLSIII == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_bownobosper_info()
{
	AI_Output(other,self,"DIA_Bosper_BowNoBosper_15_00");	//Nauč mě Mistrovskou výrobu.
	if((hero.lp >= 15) && (Npc_HasItems(other,ItMi_Gold) > 3000))
	{
		hero.lp = hero.lp - 15;
		Npc_RemoveInvItems(hero,ItMi_Gold,3000);
		AI_Output(self,other,"DIA_Bosper_BowNoBosper_12_01");	//Tady už to chce trochu umění a trpělivost, podívej.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		KNOWS_BOWSCROLLSIII = TRUE;
		PrintScreen("Umím vyrobit mistrovské luky a kuše",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Bosper_PICKPOCKET(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 900;
	condition = DIA_Bosper_PICKPOCKET_Condition;
	information = DIA_Bosper_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Bosper_PICKPOCKET_Condition()
{
	return C_Beklauen(67,120);
};

func void DIA_Bosper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,Dialog_Back,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

