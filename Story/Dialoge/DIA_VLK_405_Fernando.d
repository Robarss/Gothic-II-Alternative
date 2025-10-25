
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
	description = "(Krádež jeho portmonky by byla dosti riskantní.)";
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
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nic moc. Když ještě stála bariéra, bylo to lepší časy.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Trestanci dodávali tuny a tuny rudy z dolů a mé lodě ji pak odvážely na pevninu.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//A zpátky zase přivážely potraviny a jiné zboží.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Ale teď jsme odříznuti od pevniny a jsme se zásobami závislí na farmářích.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "Z čeho teď žiješ?";
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
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z čeho teď žiješ?
	if(Fernando_ImKnast == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Nevím. Vyhýbám se černému trhu.
	}
	else if(Npc_KnowsInfo(other,DIA_Fernando_Success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Zrovna teď žiju ze svých zásob. Ale jestli se zase nezačne obchodovat, dožiju se strašných časů.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Je ze mě žebrák. Měl jsem poslechnout svého otce a držet se od toho hornického kšeftu dál.
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
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hej ty - počkej chvilku. Máš namířeno do Hornického údolí, že ano?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//A?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Mám pro tebe nabídku. Ty mi dáš vědět, jak se to má s rudou a já ti pak za to dám...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... runový kámen.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... prsten, co posílí tvou životní energii.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Uvidím, co se dá dělat.
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Obchodník Fernando chce vědět, co se v Hornickém údolí děje s rudou.");
};


instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	description = "Prodávals zbraně banditům.";
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
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Prodávals zbraně banditům.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(překvapeně) Huh. Jak jsi přišel na ten nápad?
	B_LogEntry(TOPIC_Addon_Bandittrader,"Fernando, zámořský kupec, přiznal, že dodává zbraně banditům.");
	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;
	if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//To je soupis zboží. Dostal jsem ho od banditů. Je na něm tvůj podpis.
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Našel jsem také tento prsten u zámořského průvodce Araxosose. A ty jsi zámořský obchodník.
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//A meče banditů jsou podepsány tvým iniciálem 'F'.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//Meče banditů jsou podepsány tvým iniciálem 'F'
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nemusíš zapírat. Odkryl jsem tvou nekalou činnost.
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Tak tos byl ty? Tys mě zradil. Za to zaplatíš.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Myslím, že odtud poputuješ někam jinam. Nicméně, jsem si jist, že tě nenechají jít zase tak brzy na světlo.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(nazlobeně) Můj čas nadešel.
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(žebravě) Musíš mi věřit, že jsem to nechtěl udělat!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(žebravě) Prvně to bylo pouze jídlo, co chtěli. Můj obchod nešlapal zrovna tak, jak by měl, tak jsem souhlasil.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(žebravě) A časem mi začali vyhrožovat, že mě zabijí, pokud jim nebudu dodávat víc a víc mečů.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(žebravě) Nemůžeš mě vinit z toho, co jsem udělal. Jsem pouze oběť!
		if(Fernando_ImKnast == FALSE)
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Kolik mi zaplatíš, pokud tě nechám uprchnout?",DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Začne se o tebe zajímat domobrana.",DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Oh, to mě opravdu rozesmutnělo.",DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Oh, to mě fakt rozesmutnělo. Víš, jsi docela hnusný na někoho, kdo žije v horní čtvrti.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Prodat svou duši za pár kusů zlata.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Musím si vydělat na živobytí. Když nepokryju náklady, vyhodí mě z přístavu. Stane se ze mě chátra.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Domobrana se o tebe začne zajímat.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Nemůžeš to udělat!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Jistě, že můžu.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Ve jménu Innosově, jsem na mizině.
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Kolik mi zaplatíš, pokud tě nechám uprchnout?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Znáš mou situaci. Nemohu ti moc zaplatit.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Co tak 200 zlata a cenný prsten?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//To je vše, co ti mohu dát. Dáš mi teď ten seznam?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"No, nechystám se ti to dát.",DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Okay. Ujednáno.",DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Okay. Dohodnuto.
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero,ItWr_Addon_BanditTrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Dobrá, tady je zlato.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//A prsten. Nyní jsme dohodnuti.
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Ne, nechystám se ti to dát.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobrá. Vem si to, ale nezkoušej mě podvést...
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};


instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "Byl jsem v Hornickém údolí.";
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
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Byl jsem v Hornickém údolí.
	if(Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP(XP_Ambient);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//A? Jak se to tam má?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Všechny doly jsou vytěženy, je tam sotva pár truhel rudy. Nemá cenu tam vůbec kopat.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To nemůže být pravda! To znamená, že je ze mě žebrák.
		if(Fernando_HatsZugegeben == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co naše dohoda?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Teď k tvé odměně...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Tady, vezmi si ten runový kámen.
				B_GiveInvItems(self,other,ItMi_RuneBlank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Tady je tvůj prsten.
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
	description = "Jsi v pořádku?";
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
	description = "Ty jsi posedlý!";
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
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ty jsi posedlý!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Jdi pryč. Tak jdi už.
	B_NpcClearObsessionByDMT(self);
};

