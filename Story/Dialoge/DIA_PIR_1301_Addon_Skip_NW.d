
instance DIA_Addon_Skip_NW_EXIT(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 999;
	condition = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToSkipNW = TRUE;
};


instance DIA_Addon_Skip_NW_Hallo(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_NW_Hallo_Condition;
	information = DIA_Addon_Skip_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_NW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//(podrážděně) Tady jsi, konečně. Čekal jsem tu hodiny.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//(zmateně) Počkat. Ty nakonec nejsi obchodník z města, že?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//(kysele) Kde je Baltram?
};


instance DIA_Addon_Skip_NW_WerBistDu(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_WerBistDu_Condition;
	information = DIA_Addon_Skip_NW_WerBistDu_Info;
	description = "Kdo jsi?";
};


func int DIA_Addon_Skip_NW_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Nevím, co ti je do toho. Ale ... pokud to chceš opravdu vědět, moje jméno je Skip. Zazvonil nějaký zvonec?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//(jako kdyby nepochopil) Kdo?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Neříkej mi, že jsi neslyšel jméno Skip. Bože, odkud vlastně jsi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Jsem jeden z nejhledanějších kriminálníků v Khorinisu. Já a mí hoši jsme se plavili těmito vodami okolo tohoto ostrůvku po mnoho let.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//(pobouřeně) Už jsi o tom musel slyšet.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ty jsi pirát.",DIA_Addon_Skip_NW_WerBistDu_pirat);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Měl bych tě znát?",DIA_Addon_Skip_NW_WerBistDu_keineAhnung);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ano, jasně. Už si vzpomínám.",DIA_Addon_Skip_NW_WerBistDu_ja);
};

func void DIA_Addon_Skip_NW_WerBistDu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//Ano, jasně. Už si vzpomínám.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//(užasle) Čestně? Ty už jsi o mě slyšel?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Oh do prdele! Uvažoval jsem, jestli se nemám potloukat okolo města.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Pak je štěstí, že jsem to neudělal.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Domobrana by mě rychle někam zamkla.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Ty jsi mě nepřišel uvěznit, že?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Nooooo ...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//Věř mi, to není moudré. Kdokoli, kdo si začne se starým Skipem skončí jako krmivo pro ryby.
	};
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//Měl bych tě znát?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Dej bacha na to, co říkáš chlapče, nebo poznáš nepřátelskou stranu starého Skipa.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ty jsi pirát.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//(rozlobeně) Ano, zatraceně. Nemůžeš to říct? A rozlobenný z toho.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Můžu kousat do fošen jenom z nudy.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};


instance DIA_Addon_Skip_NW_Baltram(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Baltram_Condition;
	information = DIA_Addon_Skip_NW_Baltram_Info;
	description = "Baltram? Čekáš na obchodníka?";
};


func int DIA_Addon_Skip_NW_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Baltram? Čekáš na obchodníka?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Ty jsi mi ale chytrý, že?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//To jsem řekl, nebo ne?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Vypadá to, že tenhle špatný podomní obchodník na mě zapomněl.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Rád bych na něj položil své ruce, to ti řeknu.
	Log_CreateTopic(TOPIC_Addon_BaltramSkipTrade,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade,LOG_Running);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Pirát Skip mi řekl, že městský obchodník Baltram dělá obchody s piráty.");
	SCKnowsBaltramAsPirateTrader = TRUE;
};


instance DIA_Addon_Skip_BaltramPaket(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_BaltramPaket_Condition;
	information = DIA_Addon_Skip_BaltramPaket_Info;
	description = "Mám pro tebe balík od Baltrama.";
};


func int DIA_Addon_Skip_BaltramPaket_Condition()
{
	if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_BaltramPaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//Mám pro tebe balík od Baltrama.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Co? Teď posílá poslíčka?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Zděsil se, že? Hehe, jo, co jiného jsem taky mohl čekat od všivého obchodníka?
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//Říkal, že za to chce 3 láhve rumu.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(směje se) To by se mu líbilo, huh? Nechal mě tu čekat navždy, nepřišel k člověku, kterému na tom záleželo.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Tady, dej mu 2 láhve. Ta nula teď bude šťastná.
	CreateInvItems(self,ItFo_Addon_Rum,2);
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_NW_Woher(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Woher_Condition;
	information = DIA_Addon_Skip_NW_Woher_Info;
	description = "Odkud jsi přišel?";
};


func int DIA_Addon_Skip_NW_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Woher_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Chceš vědět, kde máme skrýš?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Proč bych to měl říkat chlapovi z domobrany jen tak?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//Když ti to řeknu, bude to jako, kdybych se šel do Khorinisu dobrovolně vzdát.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//To ti nepomůže, pokud jsi pomýšlel o našem narušení.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Ostrov Khorinis je velký a to, kde jsme my, je pro ostatní nepřístupné tak jako tak. Jestliže nemáš loď.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Ani pak, musíš znát cestu skrz útesy. Nikdo se přes ně nedostal, pokud neznali tajnou cestu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Jsou jen dva lidé, kteří znají cestu a ty nejsi jeden z nich.
};


instance DIA_Addon_Skip_SCSawGreg(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_SCSawGreg_Condition;
	information = DIA_Addon_Skip_SCSawGreg_Info;
	description = "Znáš někoho se záplatou na oku?";
};


func int DIA_Addon_Skip_SCSawGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (SC_KnowsConnectionSkipGreg == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_SCSawGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Znáš někoho se záplatou na oku?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Znám mnoho mužů se záplatou na oku.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//Tady je někdo, kdo se potuluje po Khorinisu, a vypadá to, že tě dobře zná.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Nedovedu si to představit. Lidé, které znám nejsou farmáři.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Ale ...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Nech to bejt, opravdu mě to nezajímá.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Skip_NW_MissingPeople(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_MissingPeople_Condition;
	information = DIA_Addon_Skip_NW_MissingPeople_Info;
	description = "Spousta lidí z města zmizela. A spouta lidí říká, že ty v tom máš taky prsty.";
};


func int DIA_Addon_Skip_NW_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Spousta lidí z města zmizela. A spouta lidí říká, že ty v tom máš taky prsty.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//(cítí se bezradný) Er ... zatraceně. Ale není to tak, jak si myslíš.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Vypadám jako otrokář? Ne, já převážím věci. Co je to za věci, nebo odkud jsou, není moje věc.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Převážíme všechny možné věci pro ty prasata.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Na začátku to bylo jenom obyčejné zboží. Jasně, bylo to pašované zboží.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Poté ale začali unášet lidi z města. Nevím, co od nich chtěli.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//Prostě jsme je přeplavili.
};


instance DIA_Addon_Skip_NW_Dexter(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Dexter_Condition;
	information = DIA_Addon_Skip_NW_Dexter_Info;
	description = "O kom mluvíš?";
};


func int DIA_Addon_Skip_NW_Dexter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Dexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//O kom mluvíš?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//O banditech chlape. Kdo jiný? Ta spodina, která se teď rozlézá po celé zemi.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//A není to jen okolo Khorinisu.
};

func void B_Skip_SaysDextersName()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//Vzpomněl jsem si na jeho jméno. Dexter. Ano, myslím, že jeho jméno je Dexter.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Zmizelí lidé byli uneseni bandity na příkaz vůdce banditů Dextera. Říká se, že se skrývá někde na západě od Onarovy farmy.");
	SC_KnowsDexterAsKidnapper = TRUE;
	Ranger_SCKnowsDexter = TRUE;
};


instance DIA_Addon_Skip_NW_Name(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Name_Condition;
	information = DIA_Addon_Skip_NW_Name_Info;
	description = "Bandité! To nestačí. Chci jména ...";
};


func int DIA_Addon_Skip_NW_Name_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Dexter) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Name_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Bandité! To nestačí. Chci jména ...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Jména? Chceš vědět, kdo je hlava banditů? Zatraceně, jak se to psisko vlastně jmenovalo ...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Hhm. Nemůžu si vzpomenout na jméno toho chlapa. I když myslím, že to bylo lehké na zapamatování.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Ale můžu ti ukázat, kde najít velitele banditů v této části ostrova.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//Máš s sebou dobrou mapu?
	if(Npc_HasItems(other,ItWr_Map_NewWorld) == FALSE)
	{
		if((Npc_HasItems(other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE) || (Npc_HasItems(other,ItWr_Map_Shrine_MIS) == TRUE) || (Npc_HasItems(other,ItWr_Map_Caves_MIS) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Tady, mám mapu.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//Už to bylo označeno. Je to sranda ti ničit mapu.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Ne.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//Tak ti to mám tedy popsat?
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Daleko na východě je rozlehlá farma. Myslím, že farmář se jmenuje Onar.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Má tam pěkně velká pole. Na západě od těch polí je malá pevnost na vršku vysokého útesu.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//A tam je tvůj muž.
		B_Skip_SaysDextersName();
	};
};


instance DIA_Addon_Skip_NW_Landkarte(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Landkarte_Condition;
	information = DIA_Addon_Skip_NW_Landkarte_Info;
	description = "Tady, mám mapu.";
};


func int DIA_Addon_Skip_NW_Landkarte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Name) && Npc_HasItems(other,ItWr_Map_NewWorld) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Landkarte_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Tady, mám mapu.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//To je dobře. Vyznačím ti, kde asi ten chlap pobývá.
	B_GiveInvItems(other,self,ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Tady. Tvoje mapa.
	Npc_RemoveInvItems(self,ItWr_Map_NewWorld,1);
	CreateInvItems(self,ItWr_Map_NewWorld_Dexter,1);
	B_GiveInvItems(self,other,ItWr_Map_NewWorld_Dexter,1);
};


instance DIA_Addon_Skip_NW_Wohin(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 99;
	condition = DIA_Addon_Skip_NW_Wohin_Condition;
	information = DIA_Addon_Skip_NW_Wohin_Info;
	permanent = TRUE;
	description = "Kam jsi odvezl lidi?";
};


func int DIA_Addon_Skip_NW_Wohin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Wohin_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Kam jsi odvezl lidi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//Už jsem ti řekl, že ti neřeknu, kde máme přístav.
};

