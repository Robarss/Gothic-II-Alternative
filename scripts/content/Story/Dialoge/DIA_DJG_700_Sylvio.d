
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Dobr?, a? se propadnu! Kouk??, jak si vyd?lat, co? V?d?l jsem to! M?? ?old?ckou du?i.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Hele, jestli si mysl??, ?e si tu m??e? nahrabat, tak to se fakt plete?. Byl jsem tu prvn?.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hej, ty! M?gov? m? znerv?z?uj?! B?? n?kam jinam! Tady pro tebe nic nen?.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hej, ty, paladine! Vra? se zp?tky do t?ch svejch dol?. Tady pro tebe nic nen?.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Jasn?. Nikdo se nechce d?lit o svou ko?ist.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//P?esn? tak. Zmizni.
};


instance DIA_Sylvio_VERSAGER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = "A co kdy? se mi nechce?";
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//A co kdy? se mi nechce?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Nehraj si na tvr??ka, p?skle, jinak skon??? jako ty mizern? svin?, co se v?lej t?mhle na sn?hu.
};


instance DIA_Sylvio_DEINELEUTE(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = "To byli tv? lid??";
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_DJG_Sylvio_KillIceGolem == 0))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//To byli tv? lid??
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Ne tak docela. ??dn? velk? ztr?ty. Ti idioti stejn? nest?li za nic.
};


instance DIA_Sylvio_WASISTPASSIERT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = "Co se jim stalo?";
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Co se jim stalo?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Nebyli schopn? se dostat tam p?es ty ledov? obry. Z?stali tam.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Kdy? se? tak tvrdej, tak pro? to nezkus???
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Tak dobr?. Pro? ne?",DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"K ?emu ti bude dobr?, kdy? to ud?l?m?",DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co z toho budu m?t?",DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Pro? to nevy??d?? s?m?",DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem,"Sylvio se boj? dvou ledov?ch golem? p?ed vchodem do zamrzl? ??sti Hornick?ho ?dol?.");
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Pro? to nevy??d?? s?m?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Hele, nech si ty nafoukan? ?e?i.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//Jak to j? vid?m, se? pod?lanej strachy.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Nem?m v ?myslu p?istoupit na tvoji hru.",DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Co z toho budu m?t?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Hodn?. ?ekn?me... 1000 zlat?ch. To zn? dob?e, ne?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//K ?emu ti bude dobr?, kdy? to ud?l?m?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//K tomu sam?mu, co tob?. Ale abych ti odpov?d?l na ot?zku, chci se dostat do t? zamrzl? oblasti.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Bohu?el, v cest? mi stojej ty zatracen? v?ci.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co chce? v t? zamrzl? oblasti d?lat?",DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Nem?m v ?myslu p?istoupit na tvoji hru.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Aha. Tak odsud koukej sypat, ty babo.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Co chce? v t? zamrzl? oblasti d?lat?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ty s t?ma ot?zkama nep?estane?, co? Dobr?, pov?m ti to.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Tady, za t?m sr?zem, je takov? ledov? pustina, jakou jsi nikdy p?edt?m nevid?l.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Spolu s tu?n?mi z?sobami tam je ukryt? poklad ledov?ho draka.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Chci ho dostat. Tak jak? Ano, nebo ne?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//Tak dobr?. Pro? ne?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Tak honem. Nem?m na to cel? den.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = "Cesta je voln?! Ti ledov? ob?i u? tam zacl?n?t nebudou.";
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MIS_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Cesta je voln?! Ti ledov? ob?i u? tam zacl?n?t nebudou.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Dobr? pr?ce. Pod?v?me se na to.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Tak moment. A co prachy?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//V?echno m? sv?j ?as.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	B_StartOtherRoutine(DJG_Bullco,"IceWait1");
};


instance DIA_Sylvio_WASJETZT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = "Co d?l?";
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if((MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Co d?l?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Fajn. ?ekl bych, ?e to vypad? p?kn? na leva?ku.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Nejl?p bude, kdy? p?jde? prvn? a j? za tebou.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Tak dobr?.",DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Boj?? se?",DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Nebudu za tebe d?lat ?pinavou pr?ci.",DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT,"Nejd??v bych r?d vid?l ty prachy.",DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Boj?? se?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nesmysl, p?esta? ?vanit. Jdeme.
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Tak dobr?.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Fajn, pokra?uj, do toho.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Nebudu za tebe d?lat ?pinavou pr?ci.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Babo!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Nejd??v bych r?d vid?l ty prachy.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//A? dostaneme toho draka, bude? m?t pen?z, kolik unese?.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Chci ty pen?ze hned.",DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Chci ty pen?ze hned.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Bu? p?jde? vp?edu, nebo si to s tebou vy??dim.
};


instance DIA_Sylvio_KOMMSTDU(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = "Myslel jsem, ?e m?me nam??eno do t? zamrzl? oblasti.";
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Myslel jsem, ?e m?me nam??eno do t? zamrzl? oblasti.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//Pokra?uj d?l. Budu hned za tebou.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = "Pot?ebovat bych n?jakou pomoc.";
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Pot?ebovat bych n?jakou pomoc.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nesmysl. Vede? si dob?e.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(IceDragon))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Ledov? drak je mrtv?! A te? mi dej v?echno, co u sebe m??!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ani n?hodou!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//Budu to j?, koho nemine sl?va za zabit? ledov?ho draka.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Tvoje nepodstatn? role je pr?v? u konce!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter,"Ten hajzl Sylvio si d?lal n?roky na moje v?t?zstv? nad ledov?m drakem. Trochu jsme se kv?li tomu po?korpili.");
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};


instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//Je na?ase vyrovnat sk?re.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};


instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

