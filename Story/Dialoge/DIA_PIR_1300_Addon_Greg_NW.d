
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Ssst. Hej ty. Pojď sem na chvilku.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//Co se děje?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Na cestě do města? Na důležitém úkolu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//(slizce) Poslouchej. Vypadáš jako chytrý chlapec. Vsadím se, že se v životě dostaneš daleko.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Nedáš se lehce oblbnout. Můžu mluvit přímo.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Nechtěl by sis vydělat nějaké peníze?
	PlayerTalkedToGregNW = TRUE;
	SC_MeetsGregTime = 1;
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Musím jít.",DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Přestaň kuňkat. Řekni mi co chceš.",DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Nevypadáš, že bys měl zlato.",DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Skrýváš se někomu?",DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Proč ne?",DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Musím jít.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//(naštvaně) Takže mi nechceš pomoci. Budu si to pamatovat kámo. Uvidíme se znova.
	AI_StopProcessInfos(self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Proč ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Musíš prominout starému nevzdělanému mořskému vlkovi. Jsem tu nový a neznám zákony téhle země.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Hořce jsem zjistil, že cestující z daleka nejsou v tomto městě vítáni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//(žalostně) Teď jsem ale úpně ztracený a nemůžu se dostat do města.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//Musím se zůčastnit velice důležitého obchodu a moji společníci nepřijmou odložení dobře, jestli víš, co tím myslím.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Mohl bys mi pomoci dostat se přes tyhle městské stráže?
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Podivný chlap s klípcem na oku se chce dostat do města. Předpokládám, že bych ho měl dostat přes městské stráže.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_Running;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Nevypadáš, že by jsi měl zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//(skromně) Já nemám takové znamosti, jako má sir jako ty.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Jistě neodmítneš menší příspěvek, k tvému značnému bohatství, že ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Dobrá, řekni mi! Můžu se na tebe spoléhnout?
};

func void DIA_Addon_Greg_NW_Hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//Přestaň kuňkat. Řekni mi, co chceš.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Vidíš, to je přesně to, co mám na mysli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//Pár fantaskních slov ti nepomůže.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//Věděl jsem hned, že to půjde. Obchoduji zde s tuhým obchodníkem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//Když jsi tak podnikavý, musíš se zajímat o vydělání trocha prašulí do tvé peněženky.
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Schováváš se někomu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Nikdy. To je směšný. Opravdu rád se schovávám za stromy, aby mi vítr nefoukal přímo do obličeje.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//Tak co to má být? Chceš práci?
};


instance DIA_Addon_Greg_NW_Stadtwachen(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information = DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent = TRUE;
	description = "O městských strážích ...";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//O městských strážích ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Ano. Máš nápad?
	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Musím si to promyslet.",DIA_Addon_Greg_NW_Stadtwachen_nochnicht);
	if(DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Co takhle zkusit malý úplatek?",DIA_Addon_Greg_NW_Stadtwachen_geld);
	};
	if((DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE) && Npc_HasItems(other,ItWr_Passierschein))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Mám propustku do města.",DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};
	if((MIS_Addon_Lester_PickForConstantino != 0) && (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Sběrači bylinek jsou vpuštěni.",DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) || Npc_HasItems(other,ITAR_Bau_M))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"S tímhle farmářským oděvem tě pustí do města.",DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//S tímhle farmářským oblečením tě pustí dovnitř.
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		B_GiveInvItems(other,self,ITAR_Bau_L,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITAR_Bau_M,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//To je přesně to, co potřebuju. Chlape, věděl jsem, že s tebou můžu počítat.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//(šklebí se) V převlečení za zdejšího venkovského balíka se na mě nikdo dvakrát nepodívá. Ha ha!
	if(Npc_HasItems(self,ITAR_Bau_L))
	{
		AI_EquipArmor(self,ITAR_Bau_L);
	}
	else
	{
		AI_EquipArmor(self,ITAR_Bau_M);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Super. Vymyslel si to dobře. Tady je odměna, kterou jsem slíbil.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//(nespokojeně) Co to ...? 50 mizerných zlaťáků? Chceš mě podvést.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//(blahosklonně) Zlato není všechno příteli. Buď šťasten s tímto pro tuhle chvíli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//Mám takový pocit, že se brzy znovu setkáme.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//A kdo ví? Možná budu víc připravený. Měj se.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	B_LogEntry(TOPIC_Addon_Greg_NW,"Dal jsem mu farmářské oblečení. Může se dostat přes stráže v přestrojení.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//Musím o tom popřemýšlet.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//Tak se stane. Ale ať ti to netrvá příliš dlouho. Nemůžu ztratit další čas.
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwachen_Schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//Mám propustku do města.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(cynicky) Jasně. Budu se tvářit, že jsem obyvatel tohodle poctivého města, měl bych?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//(pohoršeně) Podívej se na mě pořádně chlapče. Tady není slepý žebrák, můžu je takhle podvést?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Sběrači bylinek jsou vpuštěni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//(naštvaně) Co? Vypadám, jako když si vykračuju po lese a sbírám kyťičky?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//Co takhle malý úplatek?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//(rozmarně) Ano, jestli to bude fungovat, měl bych to jít zkusit.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};


instance DIA_Addon_Greg_NW_PERM(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_PERM_Condition;
	information = DIA_Addon_Greg_NW_PERM_Info;
	permanent = TRUE;
	description = "Ještě jedna věc ...";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Ještě jedna věc ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//(arogantně) Poslouchej synu. Musím se teď postarat o důležitý obchod.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//(výhružně) Pokecáme později. Pochopils?
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Podívejme koho nám kočka přitáhla.
	if(MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Venkovského kluka.
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Blázen, který se rozhodnul mě odmítnout. Nečekal jsi, že mě uvidíš znova, že?
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(nevrle) Myslel jsem, že mě chceš pomoci. A co jsi udělal? Prostě odprejsknul.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//Myslel jsi, že jsem tam uvízl navždy, eh?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//Tady to máš. Pomož si sám, protože nikdo nepomůže. Znovu se z toho tak lehce nevyvlékneš, chytnu tě teď za slovo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Tak to je, prostě potřebuju někoho, jako tebe..
	SC_SawGregInTaverne = TRUE;
};


instance DIA_Addon_Greg_NW_wer(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_wer_Condition;
	information = DIA_Addon_Greg_NW_wer_Info;
	description = "A kdo vlastně jsi?";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//A kdo vlastně jsi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//To není tvoje věc.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Kdybych ti chtěl říct, kdo jsem, byl bych s tím rychle hotový, jasné?
};


instance DIA_Addon_Greg_NW_was(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_was_Condition;
	information = DIA_Addon_Greg_NW_was_Info;
	description = "Co ode mě chceš?";
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Hledám partnera. Nemohl jsem ho najít nikde ve městě, a tihle hlupáci beztak nic nevědí.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Je hubený, černovlasý a nosí červené brnění.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//Myslím, že byl vězeň ve staré kolonii. Myslím, že jeho jméno začíná na "D".
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Muž se záplatou na oku hledá někoho, jehož jméno začíná na 'D'.");
	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Co ode mně chceš?
	if(MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//Stále máš problémy s městkou stráží?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(útočně) Můžu ti udělat problém v minutě ty pitomče.
	};
	B_Greg_Search_Dexter();
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Mluvíš o Diegovi?",DIA_Addon_Greg_NW_was_Diego);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"Může to být Dexter?",DIA_Addon_Greg_NW_was_Dexter);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Neznám nikoho, kdo by odpovídal tvému popisu.",DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//To může být jeho jméno, nejsem si jistý.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//Musím pravděpodobně počkat, dokud nebudu stát před ním.
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Ještě něco?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//(kysele) Jasně ty hlupáku. Ještě něco.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Potřebuju zbraně. Potřebuju zajištění. Ani zlato nebude na škodu.
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nemůžu ti s tím pomoct.",DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Obstarání? Jsi v hospodě!",DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Zbraně? Žoldáci mají zbraně.",DIA_Addon_Greg_NW_was_SLD);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Tady je 10 zlaťáků.",DIA_Addon_Greg_NW_was_HierGold);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Nebyli ve městě žádní obchodníci se zbraněmi?",DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Zlato? Všichni chceme zlato.",DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Nemůžu ti s tím pomoci.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(rozlobeně) Je to tak? Ty JENOM nechceš.
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//To je podruhé, co mě necháváš na holičkách.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//Dám ti radu. Ujisti se, že se nepotkáme znovu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Zapamatuji si to. Můžeš s tím počítat.
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Zlato? Všichni chceme zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Možná. A co s ním uděláš? Promrháš ho na pití a dole v bordelu.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//A ty máš lepší plán, že?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//(naštvaně) Budeš se plazit pod skálou, pokud budeš vědět o věcech, co jsem udělal ve svém životě.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Nebuď tak blbý, nebo ti budu muset zavřít hubu.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//Ve městě nebyl žádný obchodník se zbraněmi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//Ty musíš vtipkovat, že? Vše co mají je harampádí.
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Tady je 10 zlaťáků.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(směje se) Ty nešťastníku. Nech si svoji almužnu. Mám lepší nápad.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Nedaleko je jeskyně! Už jsem tam byl a schoval jsem nějakou sadu na jednotlivých místech.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//Jeskyně je pro mne samotného trochu nebezpečná. Musíš mi pomoci.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Nabídnul jsem muži se záplatou na oku trochu zlata, ale nechtěl ho. Chce, abych ho následoval do jeho jeskyně.");
	MIS_Addon_Greg_RakeCave = LOG_Running;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Zbraně? Žoldáci mají zbraně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Zajímavé. Slyšel jsem, že Onar, velkostatkář, najímá žoldáky.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//(směje se) To není špatné na suchozemskou krysu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//To není špatný nápad. Možná bych jim měl zaplatit za prohlídku.
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Obstarání? Jsi v hospodě!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Ten uhozený hospodský tě nenechá ani na nic mrknout, dokud mu nezaplatíš.
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Znám někoho, kdo by odpovídal tvému popisu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//Měl bych to vědět.
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Mluvíš o Diegovi.
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//Může být jeho jméno Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};


instance DIA_Addon_Greg_NW_RakeCaveLos(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description = "Pojďme do té jeskyně.";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Pojďme do té jeskyně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Jdeme.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void B_Greg_GoNow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//(komanduje) Na co čekáš? Jdi dovnitř a získej mé cetky.
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Tady příteli. To je ta jeskyně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//Tady máš krumpáč.
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Zahrabal jsem to tam někde. Místo jsem označil křížem.
	B_Greg_GoNow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//A co ty?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//Někdo ti musí hlídat záda. Teď je to na tobě.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Ten chlap chce, abych se v jeskyni porozhlédl po jeho věcech. Zahrabal je a místo označil křížem. Také mi dal krumpáč.");
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Co ti tak trvalo? Našel jsi něco?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Ano. Vykopal jsem tam sáček se zlatem.",DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Ne.",DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Ne.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//Děláš si srandu?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//(předstírá) Tam OPRAVDU nic nebylo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Zatraceně. Věděl jsem to. Tihle chlápci mě za to znovu zbuší.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//Tak dobrá. To nevadí, nic se neděje,prcku. Musím na cestu. Uvidíme se později.
	AI_StopProcessInfos(self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};


var int B_Greg_RakePlaceBriefing_OneTime;

func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Dobrá. Na malém jezeře se dvěma vodopády je ostrůvek. Tam by měl být ukrytý další.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//Dále nahoře na pastvině jsou další dvě místa, kde jsem něco ukryl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Jeden flek je tam za farmou a druhý je blízko vchodu do údolí u vodopádů.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//Jsou tam schody vedoucí dolů z polí horního farmáře k Onarovi.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//V roklině na dně schodů je další flek.
	if(B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW,"Jsou tady další poklady. 1) Na ostrůvku v jezeře s dvěma vodopády. 2) Nahoře na pastvině za farmou. 3) Vedle vchodu do průsmyku u vodopádů. 4) V kotlině pod schody. Vedou z náhorní pastviny, k jednomu z velkých farmářů. Musím jeho sadu dostat nazpátek. Bude čekat na křižovatce mezi poli.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Ano. Vykopal jsem tam sáček se zlatem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(chamtivě) Dej mi to.
	if(Npc_HasItems(other,ItSe_GoldPocket25) || (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		if(B_GiveInvItems(other,self,ItSe_GoldPocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Tady máš.
		}
		else if(B_GiveInvItems(other,self,ItMi_Gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//Uvnitř bylo 25 zlaťáků, tady je máš.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Dobrá, to znamená, že tu stále jsou.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//Vypadá to, že jsi nakonec k něčemu dobrý.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Dobrá, poslouchej. Ukryl jsem toho víc. A ty to pro mě získáš.
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//Počkám na tebe na křížovatce mezi poli toho velkého farmáře. Nezklam mě. Mohl bys toho litovat, jasné?
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//Už to nemám.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Nech toho. Nebo to mám z tebe vytřískat?
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
	description = "Kdeže přesně jsi ty věci ukryl?";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Kdeže přesně jsi ty věci ukryl?
	B_Greg_RakePlaceBriefing();
};


instance DIA_Addon_Greg_NW_PermTaverne(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 99;
	condition = DIA_Addon_Greg_NW_PermTaverne_Condition;
	information = DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent = TRUE;
	description = "Ještě jedna věc ...";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Ještě jedna věc ...
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Nejdřív musíš získat moje ukryté věci. Pak si můžeme promluvit o jiných věcech.
	}
	else if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Jsem šťastný, že jsi mi pomohl. To ale neznamená, že jsme teď přátelé, chápeš?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//Už jsme kecali dost.
	};
};


instance DIA_Addon_Greg_NW_Bigcross(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Bigcross_Condition;
	information = DIA_Addon_Greg_NW_Bigcross_Info;
	description = "Všechno v pořádku?";
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
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Koho to tu máme? Nespokojeného.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Ne doopravdy. Žoldáci nebyli moc dobrá pomoc.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//Myslel jsem, že budou mít aspoň něco.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Ale když se ptáš, je to jen banda tupců a kecalů.
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//Tak jak pokračuje hledání mých věcí? Už jsi je našel?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Ne, ne všechny.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Tak jdi na to. Nemůže to být tak těžké.
		};
	};
};


instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information = DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description = "Co jsi chtěl od žoldáků?";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Co jsi chtěl od žoldáků?
	if(SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//Víš co chci. Jdu po tom dřevorubci v červeném brnění.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Ale tihle idioti beztak nic nevědí.
	};
};


instance DIA_Addon_Greg_NW_DexterFound(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_DexterFound_Condition;
	information = DIA_Addon_Greg_NW_DexterFound_Info;
	description = "Myslím, že hledáš chlápka jménem Dexter.";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Myslím, že hledáš chlápka jménem Dexter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Zatraceně. Nevím, jak se jmenuje.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Jenom myslím, že jsem měl.",DIA_Addon_Greg_NW_DexterFound_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Co takhle, kdyby jsme tam šli společně?",DIA_Addon_Greg_NW_DexterFound_together);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Vím, kde ho můžeš najít.",DIA_Addon_Greg_NW_DexterFound_wo);
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//Myslím, že já jo.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//Vím, kde ho můžeš najít.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//(překvapeně) Opravdu? MLUV!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Nedaleko odtud.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Vypadá to, že je vůdcem hnusné bandy banditů.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//(sarkasticky se směje) HAHA. Ano. To je on.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Veděl jsem, že je tady někde zalezlý. Ten starý dřevorubec.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//Vše co musím udělat, je mrknout se do krysích pelechů a špinavých děr v okolí.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Teď ten prasečí mor najdu. Už nepotřebuji tvoji pomoc.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Co kdyby jsme tam šli společně.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Jdu ho vykostit. To můžu udělat sám.
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(řve) Kde je to prase?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Kdo? Kapitán? Je tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//(řve) Tak mi uhni z cesty.
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//(kysele) Kam půjde teď?
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
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Dobrá. Dexter je pryč, he?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Vypadá to, že je mrtvý.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Bylo na čase. Zkontroluj, jestli něco nemá.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Greg_NW_RavensLetter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RavensLetter_Condition;
	information = DIA_Addon_Greg_NW_RavensLetter_Info;
	description = "Dexter měl u sebe jenom tenhle dopis.";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Dexter měl jenom tenhle dopis.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Ukaž.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//Á, zatraceně. To mi stejně moc nepomůže.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Neměli jsme ho nechat odejít jen tak rychle.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Potřebuji vědět, jak někdo může přejít hory na severo-východě Khorinisu.
	if((Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE) && (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Možná skrz podzemní tunel. Mágové Vody studují portál, který vede do hor na severo-východě.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//(nevrle) Co to je za blbost?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//(vysmívá se) Hah. Mágové Vody. Nemáš lepší plán, že?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Ne.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(povzdech) Potom jsem tu uvízl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter byla moje poslední naděje.
};


instance DIA_Addon_Greg_NW_WasWillstDu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information = DIA_Addon_Greg_NW_WasWillstDu_Info;
	description = "Co jsi chtěl od Dextera?";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//Co jsi chtěl od Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//Přišel jsem z míst za horami na severo-východě ostrova. A mám v úmyslu se tam vrátit.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Doufal jsem, že ten darebák zná cestu bez lodi.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Co je na druhé straně hor?",DIA_Addon_Greg_NW_WasWillstDu_da);
	if(Skip_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Viděl jsem piráta jménem Skip nedaleko přístavu.",DIA_Addon_Greg_NW_WasWillstDu_Skip);
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//Co je na druhé straně hor??
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//Můžu ti doporučit snad jen to, abys tam nechodil.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Je to tvrdé místo. Slaboch jako ty by tam dlouho nepřežil.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//Viděl jsem piráta jménem Skip nedaleko přístavu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//Ten idiot. Čekal jsem tam 3 dny. Proč přijel až teď?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Hned jak se mi vrátí síla, dostane co proto.
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
	description = "Našel jsem tvoji zahrabanou soupravu.";
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
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Našel jsem tvoji zahrabanou soupravu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Měl bys mít 100 zlaťáků, zlatý kalich, stříbrnou vázu a amulet u sebe. Je to moje. Dej mi je.
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Nemám to teď sebou.",DIA_Addon_Greg_NW_FoundTreasure_not);
	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_GoldCup) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Tady jsou tvé věci.",DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Tady jsou tvé věci.
	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Váček se 100 zlaťáky.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 zlaťáků.
	};
	if(B_GiveInvItems(other,self,ItMi_GoldCup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Zlatý kalich.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Stříbrná mísa.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//Amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Velmi dobře. Máš šťestí, že nejsi dostatečně blbý, abys s tím utekl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Tady máš díl na kořisti.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nemám to sebou.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Tak ty věci získej, nebo se rozlobím.
	AI_StopProcessInfos(self);
};

