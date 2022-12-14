
instance DIA_Addon_Greg_NW_EXIT(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 999;
	condition = DIA_Addon_Greg_NW_EXIT_Condition;
	information = DIA_Addon_Greg_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToGregNW = TRUE;
};


instance DIA_Addon_Greg_NW_Hallo(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Hallo_Condition;
	information = DIA_Addon_Greg_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_Hallo_Condition()
{
	if(GregLocation == Greg_Farm1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Ssst. Hej ty. Poj? sem na chvilku.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//Co se d?je?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Na cest? do m?sta? Na d?le?it?m ?kolu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//(slizce) Poslouchej. Vypad?? jako chytr? chlapec. Vsad?m se, ?e se v ?ivot? dostane? daleko.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Ned?? se lehce oblbnout. M??u mluvit p??mo.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Necht?l by sis vyd?lat n?jak? pen?ze?
	PlayerTalkedToGregNW = TRUE;
	SC_MeetsGregTime = 1;
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Mus?m j?t.",DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"P?esta? ku?kat. ?ekni mi co chce?.",DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Nevypad??, ?e bys m?l zlato.",DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Skr?v?? se n?komu?",DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Pro? ne?",DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Mus?m j?t.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//(na?tvan?) Tak?e mi nechce? pomoci. Budu si to pamatovat k?mo. Uvid?me se znova.
	AI_StopProcessInfos(self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Pro? ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Mus?? prominout star?mu nevzd?lan?mu mo?sk?mu vlkovi. Jsem tu nov? a nezn?m z?kony t?hle zem?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Ho?ce jsem zjistil, ?e cestuj?c? z daleka nejsou v tomto m?st? v?t?ni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//(?alostn?) Te? jsem ale ?pn? ztracen? a nem??u se dostat do m?sta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//Mus?m se z??astnit velice d?le?it?ho obchodu a moji spole?n?ci nep?ijmou odlo?en? dob?e, jestli v??, co t?m mysl?m.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Mohl bys mi pomoci dostat se p?es tyhle m?stsk? str??e?
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Podivn? chlap s kl?pcem na oku se chce dostat do m?sta. P?edpokl?d?m, ?e bych ho m?l dostat p?es m?stsk? str??e.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_Running;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Nevypad??, ?e by jsi m?l zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//(skromn?) J? nem?m takov? znamosti, jako m? sir jako ty.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Jist? neodm?tne? men?? p??sp?vek, k tv?mu zna?n?mu bohatstv?, ?e ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Dobr?, ?ekni mi! M??u se na tebe spol?hnout?
};

func void DIA_Addon_Greg_NW_Hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//P?esta? ku?kat. ?ekni mi, co chce?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Vid??, to je p?esn? to, co m?m na mysli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//P?r fantaskn?ch slov ti nepom??e.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//V?d?l jsem hned, ?e to p?jde. Obchoduji zde s tuh?m obchodn?kem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//Kdy? jsi tak podnikav?, mus?? se zaj?mat o vyd?l?n? trocha pra?ul? do tv? pen??enky.
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Schov?v?? se n?komu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Nikdy. To je sm??n?. Opravdu r?d se schov?v?m za stromy, aby mi v?tr nefoukal p??mo do obli?eje.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//Tak co to m? b?t? Chce? pr?ci?
};


instance DIA_Addon_Greg_NW_Stadtwachen(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information = DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent = TRUE;
	description = "O m?stsk?ch str???ch ...";
};


func int DIA_Addon_Greg_NW_Stadtwachen_Condition()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};


var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//O m?stsk?ch str???ch ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Ano. M?? n?pad?
	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Mus?m si to promyslet.",DIA_Addon_Greg_NW_Stadtwachen_nochnicht);
	if(DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Co takhle zkusit mal? ?platek?",DIA_Addon_Greg_NW_Stadtwachen_geld);
	};
	if((DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE) && Npc_HasItems(other,ItWr_Passierschein))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"M?m propustku do m?sta.",DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};
	if((MIS_Addon_Lester_PickForConstantino != 0) && (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Sb?ra?i bylinek jsou vpu?t?ni.",DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) || Npc_HasItems(other,ITAR_Bau_M))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"S t?mhle farm??sk?m od?vem t? pust? do m?sta.",DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//S t?mhle farm??sk?m oble?en?m t? pust? dovnit?.
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		B_GiveInvItems(other,self,ITAR_Bau_L,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITAR_Bau_M,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//To je p?esn? to, co pot?ebuju. Chlape, v?d?l jsem, ?e s tebou m??u po??tat.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//(?kleb? se) V p?evle?en? za zdej??ho venkovsk?ho bal?ka se na m? nikdo dvakr?t nepod?v?. Ha ha!
	if(Npc_HasItems(self,ITAR_Bau_L))
	{
		AI_EquipArmor(self,ITAR_Bau_L);
	}
	else
	{
		AI_EquipArmor(self,ITAR_Bau_M);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Super. Vymyslel si to dob?e. Tady je odm?na, kterou jsem sl?bil.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//(nespokojen?) Co to ...? 50 mizern?ch zla??k?? Chce? m? podv?st.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//(blahosklonn?) Zlato nen? v?echno p??teli. Bu? ??asten s t?mto pro tuhle chv?li.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//M?m takov? pocit, ?e se brzy znovu setk?me.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//A kdo v?? Mo?n? budu v?c p?ipraven?. M?j se.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	B_LogEntry(TOPIC_Addon_Greg_NW,"Dal jsem mu farm??sk? oble?en?. M??e se dostat p?es str??e v p?estrojen?.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//Mus?m o tom pop?em??let.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//Tak se stane. Ale a? ti to netrv? p??li? dlouho. Nem??u ztratit dal?? ?as.
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwachen_Schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//M?m propustku do m?sta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(cynicky) Jasn?. Budu se tv??it, ?e jsem obyvatel tohodle poctiv?ho m?sta, m?l bych?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//(pohor?en?) Pod?vej se na m? po??dn? chlap?e. Tady nen? slep? ?ebr?k, m??u je takhle podv?st?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Sb?ra?i bylinek jsou vpu?t?ni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//(na?tvan?) Co? Vypad?m, jako kdy? si vykra?uju po lese a sb?r?m ky?i?ky?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//Co takhle mal? ?platek?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//(rozmarn?) Ano, jestli to bude fungovat, m?l bych to j?t zkusit.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};


instance DIA_Addon_Greg_NW_PERM(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_PERM_Condition;
	information = DIA_Addon_Greg_NW_PERM_Info;
	permanent = TRUE;
	description = "Je?t? jedna v?c ...";
};


func int DIA_Addon_Greg_NW_PERM_Condition()
{
	if(((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Je?t? jedna v?c ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//(arogantn?) Poslouchej synu. Mus?m se te? postarat o d?le?it? obchod.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//(v?hru?n?) Pokec?me pozd?ji. Pochopils?
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_MeetGregSecondTime(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information = DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Pod?vejme koho n?m ko?ka p?it?hla.
	if(MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Venkovsk?ho kluka.
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Bl?zen, kter? se rozhodnul m? odm?tnout. Ne?ekal jsi, ?e m? uvid?? znova, ?e?
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(nevrle) Myslel jsem, ?e m? chce? pomoci. A co jsi ud?lal? Prost? odprejsknul.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//Myslel jsi, ?e jsem tam uv?zl nav?dy, eh?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//Tady to m??. Pomo? si s?m, proto?e nikdo nepom??e. Znovu se z toho tak lehce nevyvl?kne?, chytnu t? te? za slovo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Tak to je, prost? pot?ebuju n?koho, jako tebe..
	SC_SawGregInTaverne = TRUE;
};


instance DIA_Addon_Greg_NW_wer(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_wer_Condition;
	information = DIA_Addon_Greg_NW_wer_Info;
	description = "A kdo vlastn? jsi?";
};


func int DIA_Addon_Greg_NW_wer_Condition()
{
	if(GregLocation >= Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//A kdo vlastn? jsi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//To nen? tvoje v?c.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Kdybych ti cht?l ??ct, kdo jsem, byl bych s t?m rychle hotov?, jasn??
};


instance DIA_Addon_Greg_NW_was(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_was_Condition;
	information = DIA_Addon_Greg_NW_was_Info;
	description = "Co ode m? chce??";
};


func int DIA_Addon_Greg_NW_was_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void B_Greg_Search_Dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Hled?m partnera. Nemohl jsem ho naj?t nikde ve m?st?, a tihle hlup?ci beztak nic nev?d?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Je huben?, ?ernovlas? a nos? ?erven? brn?n?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//Mysl?m, ?e byl v?ze? ve star? kolonii. Mysl?m, ?e jeho jm?no za??n? na "D".
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Mu? se z?platou na oku hled? n?koho, jeho? jm?no za??n? na 'D'.");
	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Co ode mn? chce??
	if(MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//St?le m?? probl?my s m?stkou str????
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(?to?n?) M??u ti ud?lat probl?m v minut? ty pitom?e.
	};
	B_Greg_Search_Dexter();
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Mluv?? o Diegovi?",DIA_Addon_Greg_NW_was_Diego);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"M??e to b?t Dexter?",DIA_Addon_Greg_NW_was_Dexter);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nezn?m nikoho, kdo by odpov?dal tv?mu popisu.",DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//To m??e b?t jeho jm?no, nejsem si jist?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//Mus?m pravd?podobn? po?kat, dokud nebudu st?t p?ed n?m.
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Je?t? n?co?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//(kysele) Jasn? ty hlup?ku. Je?t? n?co.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Pot?ebuju zbran?. Pot?ebuju zaji?t?n?. Ani zlato nebude na ?kodu.
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nem??u ti s t?m pomoct.",DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Obstar?n?? Jsi v hospod?!",DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Zbran?? ?old?ci maj? zbran?.",DIA_Addon_Greg_NW_was_SLD);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Tady je 10 zla??k?.",DIA_Addon_Greg_NW_was_HierGold);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nebyli ve m?st? ??dn? obchodn?ci se zbran?mi?",DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Zlato? V?ichni chceme zlato.",DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Nem??u ti s t?m pomoci.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(rozloben?) Je to tak? Ty JENOM nechce?.
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//To je podruh?, co m? nech?v?? na holi?k?ch.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//D?m ti radu. Ujisti se, ?e se nepotk?me znovu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Zapamatuji si to. M??e? s t?m po??tat.
	};
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Zlato? V?ichni chceme zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Mo?n?. A co s n?m ud?l??? Promrh?? ho na pit? a dole v bordelu.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//A ty m?? lep?? pl?n, ?e?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//(na?tvan?) Bude? se plazit pod sk?lou, pokud bude? v?d?t o v?cech, co jsem ud?lal ve sv?m ?ivot?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Nebu? tak blb?, nebo ti budu muset zav??t hubu.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//Ve m?st? nebyl ??dn? obchodn?k se zbran?mi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//Ty mus?? vtipkovat, ?e? V?e co maj? je haramp?d?.
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Tady je 10 zla??k?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(sm?je se) Ty ne??astn?ku. Nech si svoji almu?nu. M?m lep?? n?pad.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Nedaleko je jeskyn?! U? jsem tam byl a schoval jsem n?jakou sadu na jednotliv?ch m?stech.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//Jeskyn? je pro mne samotn?ho trochu nebezpe?n?. Mus?? mi pomoci.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Nab?dnul jsem mu?i se z?platou na oku trochu zlata, ale necht?l ho. Chce, abych ho n?sledoval do jeho jeskyn?.");
	MIS_Addon_Greg_RakeCave = LOG_Running;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Zbran?? ?old?ci maj? zbran?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Zaj?mav?. Sly?el jsem, ?e Onar, velkostatk??, naj?m? ?old?ky.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//(sm?je se) To nen? ?patn? na suchozemskou krysu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//To nen? ?patn? n?pad. Mo?n? bych jim m?l zaplatit za prohl?dku.
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Obstar?n?? Jsi v hospod?!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Ten uhozen? hospodsk? t? nenech? ani na nic mrknout, dokud mu nezaplat??.
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Zn?m n?koho, kdo by odpov?dal tv?mu popisu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//M?l bych to v?d?t.
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Mluv?? o Diegovi.
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//M??e b?t jeho jm?no Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};


instance DIA_Addon_Greg_NW_RakeCaveLos(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description = "Poj?me do t? jeskyn?.";
};


func int DIA_Addon_Greg_NW_RakeCaveLos_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Poj?me do t? jeskyn?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Jdeme.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void B_Greg_GoNow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//(komanduje) Na co ?ek??? Jdi dovnit? a z?skej m? cetky.
};


instance DIA_Addon_Greg_NW_RakeCaveThere(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCaveThere_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Tady p??teli. To je ta jeskyn?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//Tady m?? krump??.
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Zahrabal jsem to tam n?kde. M?sto jsem ozna?il k???em.
	B_Greg_GoNow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//A co ty?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//N?kdo ti mus? hl?dat z?da. Te? je to na tob?.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Ten chlap chce, abych se v jeskyni porozhl?dl po jeho v?cech. Zahrabal je a m?sto ozna?il k???em. Tak? mi dal krump??.");
	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay();
};


instance DIA_Addon_Greg_NW_RakeCavePlundered(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information = DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition()
{
	if(((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Co ti tak trvalo? Na?el jsi n?co?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Ano. Vykopal jsem tam s??ek se zlatem.",DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Ne.",DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Ne.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//D?l?? si srandu?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//(p?edst?r?) Tam OPRAVDU nic nebylo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Zatracen?. V?d?l jsem to. Tihle chl?pci m? za to znovu zbu??.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//Tak dobr?. To nevad?, nic se ned?je,prcku. Mus?m na cestu. Uvid?me se pozd?ji.
	AI_StopProcessInfos(self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};


var int B_Greg_RakePlaceBriefing_OneTime;

func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Dobr?. Na mal?m jeze?e se dv?ma vodop?dy je ostr?vek. Tam by m?l b?t ukryt? dal??.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//D?le naho?e na pastvin? jsou dal?? dv? m?sta, kde jsem n?co ukryl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Jeden flek je tam za farmou a druh? je bl?zko vchodu do ?dol? u vodop?d?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//Jsou tam schody vedouc? dol? z pol? horn?ho farm??e k Onarovi.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//V roklin? na dn? schod? je dal?? flek.
	if(B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW,"Jsou tady dal?? poklady. 1) Na ostr?vku v jeze?e s dv?ma vodop?dy. 2) Naho?e na pastvin? za farmou. 3) Vedle vchodu do pr?smyku u vodop?d?. 4) V kotlin? pod schody. Vedou z n?horn? pastviny, k jednomu z velk?ch farm???. Mus?m jeho sadu dostat nazp?tek. Bude ?ekat na k?i?ovatce mezi poli.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Ano. Vykopal jsem tam s??ek se zlatem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(chamtiv?) Dej mi to.
	if(Npc_HasItems(other,ItSe_GoldPocket25) || (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		if(B_GiveInvItems(other,self,ItSe_GoldPocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Tady m??.
		}
		else if(B_GiveInvItems(other,self,ItMi_Gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//Uvnit? bylo 25 zla??k?, tady je m??.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Dobr?, to znamen?, ?e tu st?le jsou.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//Vypad? to, ?e jsi nakonec k n??emu dobr?.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Dobr?, poslouchej. Ukryl jsem toho v?c. A ty to pro m? z?sk??.
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//Po?k?m na tebe na k???ovatce mezi poli toho velk?ho farm??e. Nezklam m?. Mohl bys toho litovat, jasn??
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//U? to nem?m.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Nech toho. Nebo to m?m z tebe vyt??skat?
		AI_StopProcessInfos(self);
		MIS_Addon_Greg_RakeCave = LOG_FAILED;
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Addon_Greg_NW_LakeCave(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 100;
	condition = DIA_Addon_Greg_NW_LakeCave_Condition;
	information = DIA_Addon_Greg_NW_LakeCave_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_LakeCave_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (Greg_SuchWeiter == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info()
{
	B_Greg_GoNow();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_WhereTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information = DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent = TRUE;
	description = "Kde?e p?esn? jsi ty v?ci ukryl?";
};


func int DIA_Addon_Greg_NW_WhereTreasures_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Kde?e p?esn? jsi ty v?ci ukryl?
	B_Greg_RakePlaceBriefing();
};


instance DIA_Addon_Greg_NW_PermTaverne(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 99;
	condition = DIA_Addon_Greg_NW_PermTaverne_Condition;
	information = DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent = TRUE;
	description = "Je?t? jedna v?c ...";
};


func int DIA_Addon_Greg_NW_PermTaverne_Condition()
{
	if(((GregLocation == Greg_Bigcross) && (Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_Addon_Greg_RakeCave == LOG_SUCCESS))) || ((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Je?t? jedna v?c ...
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Nejd??v mus?? z?skat moje ukryt? v?ci. Pak si m??eme promluvit o jin?ch v?cech.
	}
	else if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Jsem ??astn?, ?e jsi mi pomohl. To ale neznamen?, ?e jsme te? p??tel?, ch?pe??
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//U? jsme kecali dost.
	};
};


instance DIA_Addon_Greg_NW_Bigcross(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Bigcross_Condition;
	information = DIA_Addon_Greg_NW_Bigcross_Info;
	description = "V?echno v po??dku?";
};


func int DIA_Addon_Greg_NW_Bigcross_Condition()
{
	if((GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Bigcross_Info()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED) || (MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Koho to tu m?me? Nespokojen?ho.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//V?echno v po??dku?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Ne doopravdy. ?old?ci nebyli moc dobr? pomoc.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//Myslel jsem, ?e budou m?t aspo? n?co.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Ale kdy? se pt??, je to jen banda tupc? a kecal?.
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//Tak jak pokra?uje hled?n? m?ch v?c?? U? jsi je na?el?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Ne, ne v?echny.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Tak jdi na to. Nem??e to b?t tak t??k?.
		};
	};
};


instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information = DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description = "Co jsi cht?l od ?old?k??";
};


func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Co jsi cht?l od ?old?k??
	if(SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//V?? co chci. Jdu po tom d?evorubci v ?erven?m brn?n?.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Ale tihle idioti beztak nic nev?d?.
	};
};


instance DIA_Addon_Greg_NW_DexterFound(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_DexterFound_Condition;
	information = DIA_Addon_Greg_NW_DexterFound_Info;
	description = "Mysl?m, ?e hled?? chl?pka jm?nem Dexter.";
};


func int DIA_Addon_Greg_NW_DexterFound_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_DexterFound_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Mysl?m, ?e hled?? chl?pka jm?nem Dexter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Zatracen?. Nev?m, jak se jmenuje.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Jenom mysl?m, ?e jsem m?l.",DIA_Addon_Greg_NW_DexterFound_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Co takhle, kdyby jsme tam ?li spole?n??",DIA_Addon_Greg_NW_DexterFound_together);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"V?m, kde ho m??e? naj?t.",DIA_Addon_Greg_NW_DexterFound_wo);
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//Mysl?m, ?e j? jo.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//V?m, kde ho m??e? naj?t.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//(p?ekvapen?) Opravdu? MLUV!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Nedaleko odtud.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Vypad? to, ?e je v?dcem hnusn? bandy bandit?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//(sarkasticky se sm?je) HAHA. Ano. To je on.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Ved?l jsem, ?e je tady n?kde zalezl?. Ten star? d?evorubec.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//V?e co mus?m ud?lat, je mrknout se do krys?ch pelech? a ?pinav?ch d?r v okol?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Te? ten prase?? mor najdu. U? nepot?ebuji tvoji pomoc.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Co kdyby jsme tam ?li spole?n?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Jdu ho vykostit. To m??u ud?lat s?m.
};


instance DIA_Addon_Greg_NW_CaughtDexter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_CaughtDexter_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(?ve) Kde je to prase?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Kdo? Kapit?n? Je tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//(?ve) Tak mi uhni z cesty.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};


instance DIA_Addon_Greg_NW_WodennNu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WodennNu_Condition;
	information = DIA_Addon_Greg_NW_WodennNu_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_WodennNu_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WodennNu_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//(kysele) Kam p?jde te??
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//Byl tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//(komanduje) Tak jdi a najdi ho!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_CaughtDexter2(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_CaughtDexter2_Condition()
{
	if((GregLocation == Greg_Dexter) && Npc_IsDead(Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Dobr?. Dexter je pry?, he?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Vypad? to, ?e je mrtv?.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Bylo na ?ase. Zkontroluj, jestli n?co nem?.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Greg_NW_RavensLetter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RavensLetter_Condition;
	information = DIA_Addon_Greg_NW_RavensLetter_Info;
	description = "Dexter m?l u sebe jenom tenhle dopis.";
};


func int DIA_Addon_Greg_NW_RavensLetter_Condition()
{
	if((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2) && Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon) && Npc_IsDead(Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Dexter m?l jenom tenhle dopis.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Uka?.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//?, zatracen?. To mi stejn? moc nepom??e.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Nem?li jsme ho nechat odej?t jen tak rychle.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Pot?ebuji v?d?t, jak n?kdo m??e p?ej?t hory na severo-v?chod? Khorinisu.
	if((Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE) && (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Mo?n? skrz podzemn? tunel. M?gov? Vody studuj? port?l, kter? vede do hor na severo-v?chod?.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//(nevrle) Co to je za blbost?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//(vysm?v? se) Hah. M?gov? Vody. Nem?? lep?? pl?n, ?e?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Ne.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(povzdech) Potom jsem tu uv?zl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter byla moje posledn? nad?je.
};


instance DIA_Addon_Greg_NW_WasWillstDu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information = DIA_Addon_Greg_NW_WasWillstDu_Info;
	description = "Co jsi cht?l od Dextera?";
};


func int DIA_Addon_Greg_NW_WasWillstDu_Condition()
{
	if((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_RavensLetter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//Co jsi cht?l od Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//P?i?el jsem z m?st za horami na severo-v?chod? ostrova. A m?m v ?myslu se tam vr?tit.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Doufal jsem, ?e ten dareb?k zn? cestu bez lodi.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Co je na druh? stran? hor?",DIA_Addon_Greg_NW_WasWillstDu_da);
	if(Skip_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Vid?l jsem pir?ta jm?nem Skip nedaleko p??stavu.",DIA_Addon_Greg_NW_WasWillstDu_Skip);
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//Co je na druh? stran? hor??
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//M??u ti doporu?it snad jen to, abys tam nechodil.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Je to tvrd? m?sto. Slaboch jako ty by tam dlouho nep?e?il.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//Vid?l jsem pir?ta jm?nem Skip nedaleko p??stavu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//Ten idiot. ?ekal jsem tam 3 dny. Pro? p?ijel a? te??
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Hned jak se mi vr?t? s?la, dostane co proto.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Greg_NW_FoundTreasure(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information = DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent = TRUE;
	description = "Na?el jsem tvoji zahrabanou soupravu.";
};


func int DIA_Addon_Greg_NW_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Na?el jsem tvoji zahrabanou soupravu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//M?l bys m?t 100 zla??k?, zlat? kalich, st??brnou v?zu a amulet u sebe. Je to moje. Dej mi je.
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Nem?m to te? sebou.",DIA_Addon_Greg_NW_FoundTreasure_not);
	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_GoldCup) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Tady jsou tv? v?ci.",DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Tady jsou tv? v?ci.
	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//V??ek se 100 zla??ky.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 zla??k?.
	};
	if(B_GiveInvItems(other,self,ItMi_GoldCup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Zlat? kalich.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//St??brn? m?sa.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//Amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Velmi dob?e. M?? ??est?, ?e nejsi dostate?n? blb?, abys s t?m utekl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Tady m?? d?l na ko?isti.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nem?m to sebou.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Tak ty v?ci z?skej, nebo se rozlob?m.
	AI_StopProcessInfos(self);
};

