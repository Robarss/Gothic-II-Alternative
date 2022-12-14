
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Fernando_PICKPOCKET(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 900;
	condition = DIA_Fernando_PICKPOCKET_Condition;
	information = DIA_Fernando_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kr?de? jeho portmonky by byla dosti riskantn?.)";
};


func int DIA_Fernando_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,Dialog_Back,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		B_NpcClearObsessionByDMT(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};


instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int DIA_Fernando_Hello_Condition()
{
	if(NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nic moc. Kdy? je?t? st?la bari?ra, bylo to lep?? ?asy.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Trestanci dod?vali tuny a tuny rudy z dol? a m? lod? ji pak odv??ely na pevninu.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//A zp?tky zase p?iv??ely potraviny a jin? zbo??.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Ale te? jsme od??znuti od pevniny a jsme se z?sobami z?visl? na farm???ch.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "Z ?eho te? ?ije??";
};


func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z ?eho te? ?ije??
	if(Fernando_ImKnast == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Nev?m. Vyh?b?m se ?ern?mu trhu.
	}
	else if(Npc_KnowsInfo(other,DIA_Fernando_Success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Zrovna te? ?iju ze sv?ch z?sob. Ale jestli se zase neza?ne obchodovat, do?iju se stra?n?ch ?as?.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Je ze m? ?ebr?k. M?l jsem poslechnout sv?ho otce a dr?et se od toho hornick?ho k?eftu d?l.
	};
};


instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fernando_Minental_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2) && (EnterOW_Kapitel2 == FALSE) && (Fernando_HatsZugegeben == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hej ty - po?kej chvilku. M?? nam??eno do Hornick?ho ?dol?, ?e ano?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//A?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//M?m pro tebe nab?dku. Ty mi d?? v?d?t, jak se to m? s rudou a j? ti pak za to d?m...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... runov? k?men.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... prsten, co pos?l? tvou ?ivotn? energii.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Uvid?m, co se d? d?lat.
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Obchodn?k Fernando chce v?d?t, co se v Hornick?m ?dol? d?je s rudou.");
};


instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	description = "Prod?vals zbran? bandit?m.";
};


func int DIA_Addon_Fernando_BanditTrader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Prod?vals zbran? bandit?m.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(p?ekvapen?) Huh. Jak jsi p?i?el na ten n?pad?
	B_LogEntry(TOPIC_Addon_Bandittrader,"Fernando, z?mo?sk? kupec, p?iznal, ?e dod?v? zbran? bandit?m.");
	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;
	if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//To je soupis zbo??. Dostal jsem ho od bandit?. Je na n?m tv?j podpis.
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Na?el jsem tak? tento prsten u z?mo?sk?ho pr?vodce Araxosose. A ty jsi z?mo?sk? obchodn?k.
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//A me?e bandit? jsou podeps?ny tv?m inici?lem 'F'.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//Me?e bandit? jsou podeps?ny tv?m inici?lem 'F'
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nemus?? zap?rat. Odkryl jsem tvou nekalou ?innost.
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Tak tos byl ty? Tys m? zradil. Za to zaplat??.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Mysl?m, ?e odtud poputuje? n?kam jinam. Nicm?n?, jsem si jist, ?e t? nenechaj? j?t zase tak brzy na sv?tlo.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(nazloben?) M?j ?as nade?el.
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(?ebrav?) Mus?? mi v??it, ?e jsem to necht?l ud?lat!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(?ebrav?) Prvn? to bylo pouze j?dlo, co cht?li. M?j obchod ne?lapal zrovna tak, jak by m?l, tak jsem souhlasil.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(?ebrav?) A ?asem mi za?ali vyhro?ovat, ?e m? zabij?, pokud jim nebudu dod?vat v?c a v?c me??.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(?ebrav?) Nem??e? m? vinit z toho, co jsem ud?lal. Jsem pouze ob??!
		if(Fernando_ImKnast == FALSE)
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Kolik mi zaplat??, pokud t? nech?m uprchnout?",DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Za?ne se o tebe zaj?mat domobrana.",DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Oh, to m? opravdu rozesmutn?lo.",DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Oh, to m? fakt rozesmutn?lo. V??, jsi docela hnusn? na n?koho, kdo ?ije v horn? ?tvrti.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Prodat svou du?i za p?r kus? zlata.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Mus?m si vyd?lat na ?ivobyt?. Kdy? nepokryju n?klady, vyhod? m? z p??stavu. Stane se ze m? ch?tra.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Domobrana se o tebe za?ne zaj?mat.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Nem??e? to ud?lat!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Jist?, ?e m??u.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Ve jm?nu Innosov?, jsem na mizin?.
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Kolik mi zaplat??, pokud t? nech?m uprchnout?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Zn?? mou situaci. Nemohu ti moc zaplatit.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Co tak 200 zlata a cenn? prsten?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//To je v?e, co ti mohu d?t. D?? mi te? ten seznam?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"No, nechyst?m se ti to d?t.",DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Okay. Ujedn?no.",DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Okay. Dohodnuto.
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero,ItWr_Addon_BanditTrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Dobr?, tady je zlato.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//A prsten. Nyn? jsme dohodnuti.
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Ne, nechyst?m se ti to d?t.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobr?. Vem si to, ale nezkou?ej m? podv?st...
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};


instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "Byl jsem v Hornick?m ?dol?.";
};


func int DIA_Fernando_Success_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Fernando_Minental))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Byl jsem v Hornick?m ?dol?.
	if(Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP(XP_Ambient);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//A? Jak se to tam m??
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//V?echny doly jsou vyt??eny, je tam sotva p?r truhel rudy. Nem? cenu tam v?bec kopat.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To nem??e b?t pravda! To znamen?, ?e je ze m? ?ebr?k.
		if(Fernando_HatsZugegeben == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co na?e dohoda?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Te? k tv? odm?n?...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Tady, vezmi si ten runov? k?men.
				B_GiveInvItems(self,other,ItMi_RuneBlank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Tady je tv?j prsten.
				B_GiveInvItems(self,other,ItRi_Hp_02,1);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_Fernando,LOG_OBSOLETE);
		B_LogEntry(TOPIC_Fernando,"Fernando doesn't want the information anymore. And I don't want to get any other fee neither.");
	};
};


instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "Jsi v po??dku?";
};


func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "Ty jsi posedl?!";
};


func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ty jsi posedl?!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Jdi pry?. Tak jdi u?.
	B_NpcClearObsessionByDMT(self);
};

