
instance DIA_Ramirez_EXIT(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 999;
	condition = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ramirez_PICKPOCKET(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 900;
	condition = DIA_Ramirez_PICKPOCKET_Condition;
	information = DIA_Ramirez_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Ramirez_PICKPOCKET_Condition()
{
	return C_Beklauen(90,300);
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,Dialog_Back,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};


instance DIA_Ramirez_Zeichen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent = FALSE;
	description = "(Předvést zlodějský signál.)";
};


func int DIA_Ramirez_Zeichen_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//Fajn, fajn, znáš signál. (zívá) Docela mě to překvapuje.
};


instance DIA_Ramirez_Hallo(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ramirez_Hallo_permanent;

func int DIA_Ramirez_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ramirez_Hallo_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (Join_Thiefs == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Ztratil ses? Nemyslim si, že tohle je to pravé místo pro tebe.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Jestli se ti tady něco stane, nikdo z nás ti pomoct nepůjde. Takže si dávej bacha. (široký úsměv)
	};
	if(Join_Thiefs == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Tak jsi tady. Dobrá, tak ti přeju hodně štěstí - ale buď opatrný, ať už děláš cokoli.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//A ještě jedna věc - je mi jedno, kdo jsi tam nahoře a s kým pracuješ.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Tady dole jsi jen jedním z nás. Zloděj. Nic víc, nic míň.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Ramirez_Beute(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ramirez_Beute_Condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",ItMi_Gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",ItMi_Gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",ItMi_SilverCup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Beute_Info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Poslouchej, to nemůžeš myslet vážně, že ne? Hrabeš se v našem zlatu - to se nás pokoušíš okrást?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Neříkej, že za tu dřinu je jen těchhle pár mincí.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//Myslím, tahle hromádka tady - to je CELÁ kořist? To je všechno, co má zlodějský cech Khorinisu k dispozici?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Kdo říkal, že tady dole máme naši kořist?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//Stejně tomu nemůžu uvěřit. Tak kde jste schovali ty poklady?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//Na velmi bezpečné místo.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Aha.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//Dobrá, můžeš si to zlato nechat. Ale budu na tebe dávat pozor. Tak to nepřepískni.
};


instance DIA_Ramirez_Bezahlen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 9;
	condition = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


var int DIA_Ramirez_Bezahlen_permanent;

func int DIA_Ramirez_Bezahlen_Condition()
{
	if((Join_Thiefs == TRUE) && (DIA_Ramirez_Bezahlen_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Bezahlen_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else
	{
		Ramirez_Cost = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//Můžeš mě něčemu naučit?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Nemůžu tě naučit nic. O páčení zámků už víš všechno.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Teď už jen potřebuješ zdokonalit svou obratnost.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//Můžu ti ukázat, jak páčit zámky. Bude tě to stát jen...
		B_Say_Gold(self,other,Ramirez_Cost);
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
		Info_AddChoice(DIA_Ramirez_Bezahlen,"Možná později ... (ZPĚT)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice(DIA_Ramirez_Bezahlen,"OK, zaplatím ...",DIA_Ramirez_Bezahlen_Okay);
	};
};

func void DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices(DIA_Ramirez_Bezahlen);
};

func void DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//Dobrá, zaplatím.
	if(B_GiveInvItems(other,self,ItMi_Gold,Ramirez_Cost))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//... Tady je zlato.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//Výborně. Jsem ti k službám.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//Nejdřív si sežeň zlato a pak se vrať.
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	};
};


instance DIA_Ramirez_Teach(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 99;
	condition = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak se páčí zámky!";
};


func int DIA_Ramirez_Teach_Condition()
{
	if((Ramirez_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Ukaž mi, jak se páčí zámky!
	if(Ramirez_Zweimal == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//Páčení zámku je zlodějské umění.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Potřebuješ spoustu citu a intuice. A hromadu šperháků.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Nicméně, některé truhly mají speciální zámky, které lze odemknout jen za pomoci odpovídajícího klíče.
		Ramirez_Zweimal = TRUE;
	};
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Takže si klekneš před zámek a šperhákem otáčíš napravo a nalevo.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Když jím otočíš moc rychle nebo moc silně, zlomí se.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Ale čím zkušenější budeš, tím pro tebe bude snazší s nimi zacházet.
	};
};


instance DIA_Ramirez_Viertel(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 8;
	condition = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent = FALSE;
	description = "Kde to páčení zámků stojí za námahu?";
};


func int DIA_Ramirez_Viertel_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Viertel_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Kde to páčení zámků stojí za námahu?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//V horní čtvrti, samozřejmě.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Ale jestli se tam budeš chtít k někomu vloupat, počkej si na noc, až všichni usnou - teda kromě stráží.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//Hlídkují tam celou noc. Jednoho z nich znám - jmenuje se Wambo. On je jedinej, koho zajímá zlato.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Je drahej, ale když mu jednou zaplatíš, už se o to nemusíš dál starat.
};


instance DIA_Ramirez_Sextant(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent = FALSE;
	description = "Máš pro mě práci?";
};


func int DIA_Ramirez_Sextant_Condition()
{
	if((Knows_SecretSign == TRUE) && (MIS_CassiaRing == LOG_SUCCESS) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//Máš pro mě práci?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Hmm... je tu jedna věcička, kterou bych rád měl. Ale zatím jsem ji nenašel.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Co to je?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//Úhloměr. Přines mi úhloměr - dám ti za něj dobrou cenu.
	Log_CreateTopic(Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_Running);
	B_LogEntry(Topic_RamirezSextant,"Ramirez mě požádal, abych mu přinesl úhloměr.");
	MIS_RamirezSextant = LOG_Running;
};


instance DIA_Ramirez_Success(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent = FALSE;
	description = "Mám pro tebe ten úhloměr.";
};


func int DIA_Ramirez_Success_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Sextant) && (Npc_HasItems(other,ItMi_Sextant) > 0))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//Mám pro tebe ten úhloměr.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//To není možný. Vážně se ti povedlo nějaký najít.
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Tady, ty peníze si vážně zasloužíš a ještě ti dám tuhle zbroj takhle se budeš líp pohybovat.
	CreateInvItems(other,itar_wma_assn,1);
	AI_PrintScreen("Ramirez ti daruje zlodějsou zbroj.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_GiveInvItems(self,other,ItMi_Gold,Value_Sextant / 2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP(XP_RamirezSextant);
};


instance DIA_RAMIREZ_TRADEI(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = dia_ramirez_tradei_condition;
	information = dia_ramirez_tradei_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_ramirez_tradei_condition()
{
	if((Ramirez_TeachPlayer == TRUE) || (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_ramirez_tradei_info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Ramirez_TRADEI_15_00");	//Ukaž mi své zboží.
};

