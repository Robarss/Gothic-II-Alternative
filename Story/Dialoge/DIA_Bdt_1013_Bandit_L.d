
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//Bejt tebou, nahoru do jeskyně nechodím - mí kámoši tam z tebe stáhnou kůži. A věř tomu, že bojovat umí.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hej, odkud to jdeš, hm?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Z hor..",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem u Xardase ...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Z hor.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//Přesně. Přišel jsi z hor. A to je pro tebe zlé.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Velmi zlé.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Hledají tě - celá banda zlejch chlapů.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Je tady někdo, s kým by sis měl za každou cenu promluvit. Pojď za mnou!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Kdo se po mně shání?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Byl jsem u Xardase...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//To je ten starý čaroděj? Říkají mu Xardas... To bude Braga zajímat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//Fajn! Jdi první!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//Tak pojď za mnou, Jeskyně je hned tady nahoře.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Kdo se po mně shání?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Jde po tobě půlka Khorinisu a ty mi chceš tvrdit, že o tom nic nevíš?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Á! Už vím! Ty o tom prostě se mnou nechceš mluvit, hm? Jak chceš - je to tvoje věc.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//Tak jdeš, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později ... ",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"S kým bych to měl mluvit?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//S kým bych to měl mluvit?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//S mým šéfem. Jmenuje se Brago. Vysvětlí ti to líp než já.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//Tak jak - jdeme?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Jak mám vědět, že to není past?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Jak mám vědět, že to není past?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Hele, už mě začínáš unavovat. Když o mou pomoc nestojíš, ta si jdi do města a nech se strčit do basy!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Buď se mnou půjdeš hned, nebo na to můžeme rovnou zapomenout, jasný?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Pomalu, kámo! Podruhý se napálit nenechám.",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Pomalu, kámo! Podruhý se napálit nenechám.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Hm?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Jeden chlapík navrhnul, abysme společně získali nějakej amulet a pak se rozdělili o to, co z toho kápne.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Jakmile se nám to podařilo, společně s přáteli mě napadl.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Tak to tak vypadá, že ses zapletl se špatnými lidmi - kde se to stalo?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Na tom až tak nezáleží.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem vězněm v trestanecké kolonii.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//Byl jsem vězněm v těžařské kolonii.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(ohromeně) Ty jsi přišel zpoza bariéry? Chlape, tak to jsme tam byli společně.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Nevím...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//Byl jsem kopáčem ve Starém táboře. Neměl jsem s tím vším moc co do činění.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(spiklenecky) Ale co je teď důležitější - jsi v pěknym maléru!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Někdo nabídl za tvou hlavu slušnou odměnu. A vyvěsil několik oznámení - s tvým ksichtem!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//Bejt tebou, tak jsem velmi, velmi opatrný. Je mezi náma pár lidí, co by pro prachy zabili i vlastní mámu.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Ale mám dojem, že my chlapi z kolonie bysme měli držet spolu!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Tak to abych ti raději poděkoval.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Za nic. Prostě koukej zůstat naživu.
	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//Na tom až tak nezáleží.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Jak je libo. Tak jdeme, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Možná později.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//Žádné později neexistuje, kámo!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if(Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//To od tebe byla pěkná blbost, žes šel za mnou.
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hej lidi, koukejte, koho jsem vám přivedl.
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = "Kdo je ten chlápek, co nabídl odměnu?";
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Kdo je ten chlápek, co nabídl odměnu?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//To nevím, u nás to ví jen jeden jediný.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//A kdo to jako má být?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hele, chlape, tak tohle ti fakt říct nemůžu. Víš, jak to chodí.
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits,"Jdou po mně nějací banditi, kteří chtějí získat odměnu, vypsanou na mou hlavu. Zajímalo by mě, co za tím vším vězí.");
	MIS_Steckbriefe = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = "10 zlatých za jméno toho, co vypsal tu odměnu.";
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if((Bdt13_Friend == TRUE) && (Bdt13_Dexter_verraten == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 zlatých za jméno toho, co vypsal tu odměnu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Ach jo, chlape, tohle fakt nemůžu udělat.
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//Tak už to vyklop!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(s hlubokým povzdechem) Ale, chlape! No dobrá. Jmenuje se Dexter. Poblíž farmy velkostatkáře narazíš na takovou strmou skálu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//Úplně nahoře je strážní věž a několik dolů. Někde poblíž má svůj úkryt.
	B_LogEntry(Topic_Bandits,"Bandity vede Dexter. Skrývá se v dolu poblíž velkostatkářova sídla.");
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Ani to nebolelo, co. Tady je zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//NÉ - Teď jsem si vzpomněl, že vlastně nemám 10 zlatých, co bych mohl postrádat.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Co?! Já... Hm - zapomeň na to - je to moje chyba. Neměl jsem ti to jméno říkat dřív, než jsi mi ukázal zlato.
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//A hlavně jim neříkej, kdo ti vyklopil.
	Bdt13_Dexter_verraten = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = "Můžu dostat ten obrázek?";
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Můžu dostat ten obrázek?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Jasně (směje se) - konec konců, je tam TVŮJ ksicht.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	information = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = "Jeden z farmářů z venkova mě poslal.";
};


func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Jeden z farmářů z venkova mě poslal.
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Co? Farmáři o tom úkrytu vědí?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//Všimli si, že jim mizejí ovce.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//Sakra! Tak to bych sebou měl hodit. Když našli ten úkryt prázdný, možná po mně ještě pátrají.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//Chtějí tě vidět mrtvého.
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Počkej - nehodláš mě oddělat, že ne - po tom, co jsem ti pomohl?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//Jen do toho, pozabíjej všechny ostatní, když tak bažíš po krvi - já s tím nechci nic mít!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = "Brzo tu bude hodně dusno!";
};


func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Brzo zde bude hodně dusno!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Co se děje?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Znáš Cavalorna? Chystá se na tebe!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//K sakru! Je na živu? Já mizím.
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_Gossip_Wildnis;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = "Je tu ještě něco dalšího, co by mě mělo zajímat?";
};


func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Je tu ještě něco dalšího, co by mě mělo zajímat?
	if(bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Myslíš tady v okolí? Jestli chceš zůstat naživu, nescházej z cesty.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//Čím dál zajdeš do divočiny, tím větší na tebe bude číhat nebezpečí.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//Už jsem ti řekl všechno, co jsem věděl.
	};
};

