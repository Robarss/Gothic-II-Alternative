
instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Nagur_Bote == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//V?tej, cizin?e, jmenuji se Baltram. P?i?el ses z?sobit j?dlem?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Ob?v?m se, ?e t? zklamu. Moc toho pr?v? te? na sklad? nem?m.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale ka?d?m dnem bych m?l dostat nov? zbo??.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Pokud jsi p?i?el ke mn? nakoupit j?dlo, m??e? j?t klidn? zase pry?.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Nemysl?m si o v?s ?old?c?ch nic dobr?ho! Zp?sobujete mi jen sam? probl?my.
	};
};


instance DIA_Addon_Baltram_LaresAbloese(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = DIA_Addon_Baltram_LaresAbloese_Condition;
	information = DIA_Addon_Baltram_LaresAbloese_Info;
	important = TRUE;
};


func int DIA_Addon_Baltram_LaresAbloese_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Pro? vypad?? tak skepticky?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//Vid?m, ?e m?? znamen? 'Kruhu Vody'.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//Jsi jedn?m z nich?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//A pokud by to byl ten p??pad?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//To bych ti pak ?ekl, ?e Lares chce n?koho jin?ho, kdo se postar? o jeho ?kol v p??stavu.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Ok. Pokus?m se naj?t n?koho, kdo bude ochoten to ud?lat.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//V?born?.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_Addon_BringRangerToLares,"Baltram, obchodn?k na tr?i?ti, se postar? o Lares?v ornament. Mo?n? bude moci Lares KONE?N? opustit p??stav.");
	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "M?? pro m? pr?ci?";
};


func int DIA_Baltram_Job_Condition()
{
	if((MIS_Nagur_Bote != LOG_Running) && (MIS_Nagur_Bote != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//M?? pro m? pr?ci?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Ne, posl??ka u? m?m. Zkus to u jin?ho obchodn?ka.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Hled?? pr?ci?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasn?, o co jde?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//M?j posl??ek se je?t? nevr?til zp?tky a j? ?ek?m dod?vku od farm??e Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A kolik mi za to d???
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//D?m ti 50 zla??k?.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Dobr?, to beru.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Dobr?, jenom ?ekni Akilovi, ?e t? pos?l?m. D? ti bal?k. P?ines mi ho.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry(TOPIC_Nagur,"Baltram m? zam?stnal jako posl??ka. M?m mu p?in?st n?jakou z?silku z Akilova statku.");
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,"Kdy? Beltramovi doru??m jeho z?silku, zaplat? mi 50 zla??k?.");
};


var int Baltram_TradeLOG;

instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka? mi sv? zbo??.";
};


func int DIA_Baltram_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Baltram_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Uka? mi sv? zbo??.
	if(Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Baltram prod?v? na tr?i?ti potraviny.");
		Baltram_TradeLOG = TRUE;
	};
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nem?li to nechat doj?t tak daleko. Te? jeden ze ?old?k? zavra?dil paladina.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//N?co by se m?lo st?t!
	};
	if((MIS_BaltramTrade != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Lid? jako ty ode mne nic nedostanou.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Pro??
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Nejd??v znesv???te farm??e a potom d?l?te, jako by se nic nestalo.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Te? vypadni, odh?n?? mi z?kazn?ky.
		MIS_BaltramTrade = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Baltram_Skip(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_Skip_Condition;
	information = DIA_Addon_Baltram_Skip_Info;
	description = "Mimochodem, ty jsi v kontaktu s pir?ty?";
};


func int DIA_Addon_Baltram_Skip_Condition()
{
	if(SCKnowsBaltramAsPirateTrader == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_Skip_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//(n?hodile) Mimochoem, ty jsi v kontaktu s pir?ty?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(c?t? se odhalen) Co? Kdo to ??kal?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//Mluvil jsem s jedn?m. Vypad? to, ?e na tebe ?ek? ve sv?m z?livu.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//Dob?e, a co bych m?l teda d?lat? T??k? ?asy, v?dy? v??. Mus?m se n?jak ?ivit.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Neboj?? se, ?e t? p?itom chyt??",DIA_Addon_Baltram_Skip_erwischen);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Bude? muset ?elit d?sledk?m sv?ch ?in?!",DIA_Addon_Baltram_Skip_MIL);
};

func void DIA_Addon_Baltram_Skip_Back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//Ok, to je v?e, co jsem cht?l v?d?t.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//Bude? muset ?elit d?sledk?m sv?ch ?in?!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Hej, poslouchej. ?eknu ti v?echno, co v?m a ty to na m? na opl?tku ne?ekne?, dob?e?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Jak? zbo?? vym??uje??",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Co v?? o pir?tech?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//Neboj?? se, ?e t? p?itom chyt??
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//No, m??e se to st?t. Nakonec ty jsi to p?ece zjistil.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//Ale ty to nikomu ne?ekne?, ?e ne?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Jak? zbo?? vym??uje??",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Co v?? o pir?tech?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//(tvrd?) Jak? zbo?? vym??uje??
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//Obvykle j?dlo.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//A v?m?nou za to dost?v?m ten nejlep?? rum, jak? m??es v Khorinisu dostat.
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Ok, to je v?e, co jsem cht?l v?d?t.",DIA_Addon_Baltram_Skip_Back);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Mohl bych ti pomoci.",DIA_Addon_Baltram_Skip_Ich);
};

func void DIA_Addon_Baltram_Skip_Ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(s ?sm?vem) Mohl bych ti pomoci.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//To nen? ?patn? n?pad. Te? zrovna nem??u opustit Khorinis.
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	B_GiveInvItems(self,other,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//Tady, vezmi si tento bal??ek a ?ekni Skipovi, a? tentokr?t s t?m rumem ne?et??.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//Nem?lo by to b?t m?? ne? 3 fla?ky.
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Baltram mi dal bal??ek. M?l bych ho doru?it Skipovi.");
	MIS_Addon_Baltram_Paket4Skip = LOG_Running;
};

func void DIA_Addon_Baltram_Skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//(tvrd?) Co v?? o pir?tech?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//(sp??n?) ?ij? n?kde schovan? na ostrov?.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//Pokud v?m, tak se tam d? dostat jedin? lod?.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//Ob?an? Khorinisu se jich boj?. Opr?vn?n?. V podstat? je to banda smradlav?ch hrdlo?ez?.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Na druhou stranu si mysl?m, ?e po??d nejsou tak stra?n? jako banditi.
};


instance DIA_Addon_Baltram_SkipsRum(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_SkipsRum_Condition;
	information = DIA_Addon_Baltram_SkipsRum_Info;
	description = "M?m ten rum. Bohu?el mi Skip dal jen 2 fla?ky.";
};


func int DIA_Addon_Baltram_SkipsRum_Condition()
{
	if((Skip_Rum4Baltram == TRUE) && (MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_SkipsRum_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//M?m ten rum. Bohu?el mi Skip dal jen 2 fla?ky.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(na?tvan?) Zatracen? drah?. Co si o sob? ten Skip v?bec mysl?? Ale dob?e, dej to sem.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//Nem??u ti za to d?t mnoho. To je v?e, co m?m.
	CreateInvItems(self,ItMi_Gold,10);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Projdi v?chodn? branou a dr? se cesty vedouc? na jihov?chod.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chv?li p?ijde? ke kamenn?mu schodi?ti. Vyjdi nahoru a odtud u? uvid?? Akilovu farmu.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "M?m Akilovu dod?vku.";
};


func int DIA_Baltram_Lieferung_Condition()
{
	if(Npc_HasItems(other,ItMi_BaltramPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//M?m Akilovu dod?vku.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//V?born?. Kone?n? zase m??u nab?zet ?erstv? zbo??. Tady m?? 50 zlat?ch.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};


instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = "Mohli bychom po tom v?em spolu uzav??t obchod?";
};


func int DIA_Baltram_LetUsTrade_Condition()
{
	if(MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Mohli bychom po tom v?em spolu uzav??t obchod?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Poslouchej, kdy? mi p?inese? 10 ?unek a 10 lahv? v?na, potom s tebou budu zase obchodovat.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Uvid?m, co se d? d?lat.
	MIS_BaltramTrade = LOG_Running;
};


var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = "M?m tv? zbo??.";
};


func int DIA_Baltram_HaveYourWarez_Condition()
{
	if((MIS_BaltramTrade == LOG_Running) && (MIS_BaltramTrade != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//M?m tv? zbo??.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Uka? mi to.
	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Dohodli jsme se snad na 10 ?unk?ch. P?ij?, a? jich bude? m?t dost.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co 10 lahv? v?na? Na ty jsi zapomn?l?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmm, nen? to sice nejlep?? kvalita, ale v t?chto dob?ch nem??e? b?t moc vyb?rav?.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTrade = LOG_SUCCESS;
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Te? n?m nic nebr?n? v uzav?en? obchodu.
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return C_Beklauen(76,175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

