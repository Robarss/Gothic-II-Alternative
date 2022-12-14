
func int C_BragoBanditsDead()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_PICKPOCKET(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 900;
	condition = DIA_Addon_Cavalorn_PICKPOCKET_Condition;
	information = DIA_Addon_Cavalorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tyto ??py se daj? snadno ?t?pnout)";
};


func int DIA_Addon_Cavalorn_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (25 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET,Dialog_Back,DIA_Addon_Cavalorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cavalorn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		B_GiveInvItems(self,other,ItRw_Arrow,44);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Addon_Cavalorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
};


instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//V?tej v 'Kruhu' p??teli.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras mi dal jinej ?kol.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "Probl?my?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Probl?my?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Zatracen?. Nev?d?l jsem, kde se schov?vaj. Dostal jsi jednoho a za chv?li budou zp?tky.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(uli?nicky) Moment. J? t? zn?m. Ty jsi ten chl?pek, kter? u m? st?le ?ebral v kolonii ??py.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Jmenuje? se Cavalorn, ?e?",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"T??ko si vzpom?n?m.",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//T??ko si vzpom?n?m.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//No tak! U?il jsem t? lukost?elbu a pl??en? v m? chatr?i bl?zko Star?ho t?bora. U? ti sv?t??
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Jmenuje? se Cavalorn, ?e?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//?. Vid?m, ?e jsi na m? nezapomn?l po tom v?em, ??m jsme pro?li v t? zatracen? kolonii.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Kam jinak jde??
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Nem?m ??dn? ur?it? c?l.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Zp?tky do Hornick?ho ?dol?. ",DIA_Addon_Cavalorn_HALLO_Bauern);
	if(Mil_310_Stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Do m?sta.",DIA_Addon_Cavalorn_HALLO_Stadt);
	};
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do m?sta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(sm?je se) To vid?m. Do m?sta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//M??e? se dostat do probl?m? s m?stskou str???. Nenechaj? kdekoho proj?t po tom, co bylo tohle m?sto zamo?eno bandity.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Jeden z t?ch star?ch Sekt??? z Hornick?ho ?dol? p?i?el p?ed n?kolika dny. ?ekl, ?e se dostane do Khorinisu a ven kdy chce.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Vydal se do ?dol? pod tou velkou v???. N?kde tam bl?zko vodop?du mus? b?t cesta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Mo?n? by sis s n?m m?l promluvit.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Zp?tky do Hornick?ho ?dol?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(p?ekvapen?) Opravdu? Hmm. R?d bych, m??u t? n?sledovat, ale mus?m si je?t? vyjasnit p?r v?c?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Pokud se dostane? do Hornick?ho ?dol? - mohl bys zjistit jestli m? chatr? je?t? stoj?? R?d bych se tam jednoho dne vr?til.
	MIS_Addon_Cavalorn_TheHut = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Lovec Cavalorn m? po??dal, abych se v p??pad?, ?e se dostanu do hornick?ho ?dol?, pod?val, jestli je?t? stoj? jeho loveck? chata, le??c? severn? od b?val?ho Star?ho t?bora.");
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nem?m ??dn? ur?it? c?l.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nechce? mi to ??ct - spr?vn?? ??dn? probl?m.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "Byl jsem v tv? chatr?i v Hornick?m ?dol?.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Byl jsem v tv? chatr?i v Hornick?m ?dol?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Tak?e to st?le stoj?.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Ano. A tak? v?m, co jsi tam cht?l.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Na?el jsi to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Pokud mysl?? tv?j s??ek s hrudkami rudy ... ano, m?m ho.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Jsi starej li??k, v?? o tom.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//Co dal??ho chce? z t? star? chatr?e. Nic tam nezbylo.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//M?? to s sebou? D?m ti za to 100 zla??k?.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Jasn?.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Ne, ale m?m tady tuhle hroudu rudy.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Ne.",DIA_Addon_Cavalorn_Beutel_no);
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Douf?m, ?e to brzy dostanu zp?t.
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Ne, ale m?m tady tuhle hroudu rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Taky dob?e.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, pro? jsi si to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Jasn?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Super.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, pro? jsi si to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Ne.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Tak se vra? pro tu v?c ZNOVU. P?es ve?ker? ?sil? pro to asi budu muset do toho zatracen?ho ?dol? s?m.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Jsem tak dot?en.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, pro? jsi si to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Tak jako tak, pro? jsi si to nevzal?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kdo si mohl myslet, ?e ruda je tady v Khorinisu tak cenn??
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//V kolonii jsi nedostal za takovouhle hrudku rudy ani m?sto na span?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//V p??stavu ti t?me? rozbijou hlavu, pokud zjit?, ?e m?? u sebe rudu.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "Dej mi 100 zla??k?, pak ti vr?t?m rudu.";
};


func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Dej mi 100 zla??k?, pak ti vr?t?m rudu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Ujedn?no. Tady m??.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1) == FALSE)
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Jsi opravdov? p??tel. D?kuji ti.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "Co tady d?l???";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Uv?zl jsem. Kdyby to nebylo t?ch zatracen?m bandit?, asi bych tu nebyl.
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "Co banditi?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Co banditi?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Zaspal jsi snad cel? minul? t?den?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ehm ...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Mluv?m o t? hav?ti z trestaneck? kolonie - rozl?zaj? se po krajin?, drancuj? a vra?d?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(povzdech) Jsem r?d, ?e m? nechali na?ivu. Jednou ned?v?m pozor a oni m? pra?t? zezadu do hlavy.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nenapad? m? ??dn? zp?sob, jak dostat moje v?ci zp?t.
	};
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "Ty jsi byl okraden bandity?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Ty jsi byl okraden bandity?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(zachmu?en?) Jo. Srazili m? a nechali jako j?dlo pro gobliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Byly tam zatracen? d?le?it? v?ci. Dopis a v?echny moje pen?ze. Prost? to mus?m dostat zp?t.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nicm?n?, bez podpory tam nejdu. Ta zbab?l? tlupa krimin?ln?k? ...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "M??u ti pomoci s bandity?";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//M??u ti pomoci s bandity?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(uli?nicky) Mo?n?. Ale z tv?ho ztr?pen?ho zjevu ti m??u ??ct, ?e jsi nedr?el opravdov? me? cel? t?dny.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Dobr?. Pravd?podobn? nem?m jinou volbu ne? p?ijmout tvoji nab?dku. Nem?m moc ?asu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Tak?e poslouchej. Dole po tehle cest? je jedna z t?ch ?pinav?ch d?r v zemi, ve kter?ch se banditi r?di schov?vaj?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Ti krimin?ln?ci tady, jsou ti, kte?? mi ukradli moje v?ci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//?ekni mi a? bude? p?ipraven a p?jdem na tu pak??.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"Cavalorn byl okraden bandity o velmi d?le?it? v?ci. Odm?t? s nimi bojovat s?m a tak m? po??dal o pomoc.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "Pot?ebuju lep?? vybaven?.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != 0) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Pot?ebuju lep?? vybaven?.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Ty prasata m? toho moc nenechali.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//M??u ti d?t vl?? n??. Sta?? to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//N?? sta??.
	CreateInvItems(self,ItMW_Addon_Knife01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//Ale co n?jak? lektvary?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zbyly mi dva l??iv? lektvary. M?? z?jem?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Jasn?. Vezmu si je.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "Poj?me zab?t ty fl?ka?e.";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Poj?me zab?t ty fl?ka?e.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobr?. Prost? mi hl?dej z?da, jasn??
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//To maj? za to sprost? p?epaden?.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(Bdt_1013_Away == FALSE)
	{
		Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
	};
	Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Na posledn? chv?li m??u svoje posl?n? dokon?it. U? jsem ztratil moc ?asu.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jak? rozkaz?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(pro sebe) Oh. Ano. Mus?m se dostat do m?sta a pozd?ji ...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(povzdech) Jenom nev?m, jak to splnit v?as.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co j??
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(p?em??l?) Hmm. Pro? ne. Ty m??e? doru?it dopis do m?sta.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//To m? d? trochu ?asu, abych se mohl pod?vat po sv?m vybaven?.
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z bandit? by m?l m?t dopis v kapse.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Dones to Vatrasovi, m?govi Vody ve m?st?. Zastihne? ho v Adanosov? chr?mu, kde cel? den k??e.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//?ekni mu, ?e jsem to nezvl?dl v?as.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A kdy? se zept?, kde jsem - ?ekni mu, ?e m???m na m?sto setk?n?.
		B_LogEntry(TOPIC_Addon_KDW,"M?ga Vody Vatrase m??u naj?t v p??stavn?m m?st? Khorinis. D?l? k?z?n? v Adanosov? chr?mu.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//A je?t? jedna v?c: Kup si n?jak? vhodn? od?v od farm??e.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Jinak si budou myslet, ?e jsi bandita. Tady m?? trochu pen?z.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;
	if(MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
	};
	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};


func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Tak je to odbyt?. Hehe. Nem?li si se mnou hr?t.
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = "Banditi jsou usma?en?.";
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == 0) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Banditi jsou usma?en?
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "Zaj?mav? brn?n?, co nos??. U? nepat??? ke St?n?m?";
};


func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Zaj?mav? brn?n?, co nos??. U? nepat??? ke St?n?m?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//St?nov?? Ti u? neexistuj? po tom, co padla bari?ra.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//V moment?, kdy? jsme mohli opustit Hornick? ?dol?, nebyl ??dn? d?vod lp?t na tom.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Te? pracuji pro m?gy Vody. Pat??m do 'Kruhu vody'.
	SC_KnowsRanger = TRUE;
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Cavalorn mi ?ekl o tajn? gild?, do kter? s?m pat??. O takzvan?m 'Kruhu vody'.");
	Cavalorn_RangerHint = TRUE;
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = "?ekni mi v?ce o 'Kruhu Vody'.";
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//?ekni mi v?ce o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nem?m povolen? se o tom s tebou bavit.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//V?echno co m??u ud?lat, je poslat t? za Vatrasem. Je z?stupcem m?g? Vody v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Bude nejlep??, kdy? si s n?m promluv??. ?ekni mu, ?e jsem t? poslal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Mo?n?, ?e t? p?ijme do Kruhu. Zoufale pot?ebujeme dobr? lidi ...
	B_LogEntry(TOPIC_Addon_RingOfWater,"M?g Vody Vatras m? m??e p??jmout do 'Kruhu vody'. M?m se u n?j zastavit a ??ct, ?e m? pos?l? Cavalorn.");
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = "Nebyl jsi ty a va?i lid? nep??telmi m?g? Vody?.";
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Nebyl jsi ty a va?i lid? nep??tel? m?g? Vody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Ta debiln? minulost skon?ila. U? nen? ??dn? "Nov?" nebo "Star?" t?bor.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//Te? - proto?e u? nen? ??dn? trestaneck? kolonie, ka?d? je zodpov?dn? s?m za sebe.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Mnoho z b?val?ch trestanc? je ale po??d je?t? st?h?no.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//M?gov? Vody byli schopn? pro m? sehnat odpu?t?n? - tak?e se m??u te? voln? pohybovat.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "Co d?laj? m?gov? Vody te??";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co d?laj? m?gov? Vody te??
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Jdou po n??em velk?m. Je to o nezn?m? ??sti ostrova.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Nezn?m? ??st? Kde m??e b?t?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nem??u ti ??ct v?c. Promluv si s Vatrasem v Khorinisu.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "Dal jsem Vatrasovi tv?j dopis.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Dal jsem Vatrasovi tv?j dopis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Neo?ek?val jsem od tebe nic jin?ho. D?kuju ti.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "Hled?? n?co?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Hled?? n?co?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//Tak z?ejm?? Ano, poslali m? m?gov? Vody, abych na?el ornamenty.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//To je n?hoda. Dostal jsem ten sam? ?kol od Nefaria.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Ty tedy pat??? do 'Kruhu vody'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Ano.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Zat?m ne, ale pracuji na tom.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To je dob?e. Pak to nemus?m d?lat s?m.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//U? jsi na?el ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Na?el jsem m?sto, kde pravd?podobn? jeden najdeme.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Tyhle kamenn? kruhy m??ou b?t jedny z t?ch staven?, kter? Nefarius popisoval.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Te? pot?ebujeme jen naj?t mechanismus.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = "Aktivoval jsem mechanizmus. Nic se ale nestalo.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Aktivoval jsem mechanizmus. Nic se ale nestalo.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Potom m?li Lobartovi roln?ci pravdu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//?ekli, ?e n?kdo jin? se potloukal okolo t?ch kamen?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Najednou se objevil kamenn? str??ce a za?to?il na n?.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farm??i zavolali pro domobranu, voj?ci domobrany paladiny, kte?? p?i?li a zni?ili to monstrum.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//U? jsem prohledal cel? okol?. Jestli tady byl oranment, maj? ho te? paladinov?.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Pak se jeden z n?s mus? dostat do horn? ??sti m?sta.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Pak za nimi zajdu a z?sk?m ornament.",DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//P?jdu te? do m?sta. Setk?me se u Vatrase.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Jeden ze ztracen?ch ornament? maj? paladinov? ve m?st?.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Pak za nimi zajdu a z?sk?m ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Dob?e.
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Pak se jeden z n?s mus? dostat do horn? ??sti m?sta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//J? na to nem?m ?as. Mus?? to ud?lat ty.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "Z?skal jsem chyb?j?c? ornament od Lorda Hagena.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Z?skal jsem chyb?j?c? ornament od Lorda Hagena.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Vid??? J? v?d?l, ?e ho paladinov? maj?.
	B_GivePlayerXP(XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "M??e? m? n?co nau?it?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//M??e? m? n?co nau?it?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Jasn?. Zn?m to. Chlape - pron?sledovali t? za dobr?, co?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Nic si nepamatuje?, ?e?
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Cavalorn_Teach);
};


var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "Chci se nau?it tvoje schopnosti.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if(Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_TEACH_Choices()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString("Pl??en?",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Addon_Cavalorn_Teach_Sneak);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Cavalorn_Teach_1H_5);
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chci se nau?it tvoje schopnosti.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Jasn?, co chce? v?d?t?
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//S lehk?m na?lapov?n?m, bude? m?t lep?? ?anci se k nep??teli dostat nezpozorov?n.
	};
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Addon_Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Mnohem lep??. Zapomn?l jsi hodn?, ale dostaneme t? zp?t do formy.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};

