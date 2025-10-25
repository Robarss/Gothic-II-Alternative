
instance DIA_Garvell_EXIT(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 999;
	condition = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garvell_PICKPOCKET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 900;
	condition = DIA_Garvell_PICKPOCKET_Condition;
	information = DIA_Garvell_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Jeho portmonku by dokázalo štípnout i nemluvně.)";
};


func int DIA_Garvell_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,Dialog_Back,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket25,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};


instance DIA_Garvell_GREET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_GREET_Condition;
	information = DIA_Garvell_GREET_Info;
	description = "Co tady děláš?";
};


func int DIA_Garvell_GREET_Condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Stavím loď, protože se chci odsud dostat - co nejrychleji to půjde.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Ale jak to tak vypadá, tu loď nikdy nedokončím.
};


instance DIA_Garvell_eilig(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_eilig_Condition;
	information = DIA_Garvell_eilig_Info;
	description = "Proč tolik pospícháš?";
};


func int DIA_Garvell_eilig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_eilig_Info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Proč tolik pospícháš?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Co nevidět dorazí skřeti a srovnají město se zemí.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Proč si to myslíš?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Hochu, copak jsi neviděl ty paladiny, co pobíhaj všude kolem? Proč si myslíš, ze jsou tady?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Říkám ti, jsou tady, protože skřeti brzy zaútočí. A nebude to nic hezkého.
};


instance DIA_Garvell_Schiff(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_Schiff_Condition;
	information = DIA_Garvell_Schiff_Info;
	description = "Proč nemůžeš dokončit loď?";
};


func int DIA_Garvell_Schiff_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Proč nemůžeš dokončit loď?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//(pohrdavě) Máme milión problémů. Trup ještě není dostatečně pevný a pořád nám ještě chybí spousta fošen.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Ale na nový materiál už nemám moc zlata, a poslední dodávka byla prolezlá červotočem.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Moji chlapci nepracujou pořádně. Jeden chce jen rychlou loď, a druhý se zajímá jen o její výzdobu!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Jako kdybychom neměli důležitější věci na práci!
	AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//No, jeden z mých dělníků nedávno zmizel. Obávámse,  že to může znamenat zpoždění.
};


instance DIA_Addon_Garvell_MissingPeople(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeople_Condition;
	information = DIA_Addon_Garvell_MissingPeople_Info;
	description = "Jeden z tvých zaměstnanců zmizel?";
};


func int DIA_Addon_Garvell_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//Jeden z tvých zaměstnanců zmizel?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//Správně. Jmenuje se Monty. Slehla se po něm zem.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//Vsadil bych se, že ta liná svině sedí na nějaké farmě a užívá si života. Neměl jsem mu platit předem.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Garvell je znepokojen svým dělníkem Montym. Ten se od jednoho dne neobjevil v práci. Prý si dobře žije na jedné z farem.");
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople,"Slyšel jsem, že zmizelo víc lidí.",DIA_Addon_Garvell_MissingPeople_more);
	if(SCKnowsFarimAsWilliamsFriend == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople,"Kdy tu byl Monty naposled.",DIA_Addon_Garvell_MissingPeople_wo);
	};
};

func void DIA_Addon_Garvell_MissingPeople_more()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//Slyšel jsem, že už zmizelo víc lidí.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//Viš? Tím tenhle všechen zmatek začal.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//Rybář Farim se zmiňoval o něčem takovém. Jeho kámoš William zjevně zmizel.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//Vsadil bych se, že zatím vším jsou skřeti.
	SCKnowsFarimAsWilliamsFriend = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Vypadá to, že rybář Farim ví něco o užitečného o svém příteli Williamovi.");
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople,Dialog_Back,DIA_Addon_Garvell_MissingPeople_BACK);
	if(Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople,"Kde můžu najít Farima?",DIA_Addon_Garvell_MissingPeople_Farim);
	};
};

func void DIA_Addon_Garvell_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
};

func void DIA_Addon_Garvell_MissingPeople_Farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//Kde můžu najít Farima?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//Je to rybář. Myslím, že jeho chatrč je někde poblíž skladiště paladinů. Nejsem si jist.
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Farim's cottage is near the paladins' store yard.");
};

func void DIA_Addon_Garvell_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//Kdy tu byl Monty naposled?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(naštvaně) Nepřišel do práce už dva dny.
};


instance DIA_Garvell_ReturnMonty(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_ReturnMonty_Condition;
	information = DIA_Garvell_ReturnMonty_Info;
	description = "A jak to jde teď?";
};


func int DIA_Garvell_ReturnMonty_Condition()
{
	if((Npc_GetDistToWP(Monty_NW,"NW_CITY_HABOUR_WERFT_IN_01") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_ReturnMonty_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//A jak to jde teď?
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//Monty je zpátky! Zrovna se dívá na plány.
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//Možná nakonec tu loď přece jen dokončíme.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_MISSION(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_MISSION_Condition;
	information = DIA_Garvell_MISSION_Info;
	permanent = FALSE;
	description = "Můžu ti nějak pomoct?";
};


func int DIA_Garvell_MISSION_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_eilig) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Můžu ti nějak pomoct?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//To můžeš. Zjisti, co mají paladinové za lubem. Zajímalo by mě, proč jsou tady.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//A taky bych měl vědět, jestli se skřeti chystají zaútočit - a jak daleko od města jsou.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Jednoho z těch bastardů viděli hned za městem.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Prostě mi dones tolik informací, kolik se ti podaří získat.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Potřebuju vědět, kolik času mám na dokončení lodi.
	MIS_Garvell_Infos = LOG_Running;
	Knows_Ork = TRUE;
	Log_CreateTopic(TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell,LOG_Running);
	B_LogEntry(TOPIC_Garvell,"Garvell by rád získal nějaké informace o skřetech a také by ho zajímalo, proč se ve městě usadili paladinové.");
};

func void B_GarvellWeiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Dobře. Jestli zjistíš něco dalšího, dej mi vědět.
};

func void B_GarvellSuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Díky za informace. Takhle to vypadá, že na postavení lodi máme celou věčnost.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_Orks(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 3;
	condition = DIA_Garvell_Orks_Condition;
	information = DIA_Garvell_Orks_Info;
	permanent = FALSE;
	description = "Mám nějaké informace o skřetech.";
};


func int DIA_Garvell_Orks_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//Mám nějaké informace o skřetech.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Tak povídej.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Zasekli se v Hornickém údolí a vypadá to, že tam chtějí zůstat.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Aby nás udrželi v bezpečí, hlídají paladinové průsmyk do údolí.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Paladine(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_Paladine_Condition;
	information = DIA_Garvell_Paladine_Info;
	permanent = FALSE;
	description = "Vím, proč tu paladinové jsou.";
};


func int DIA_Garvell_Paladine_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Vím, proč tu paladinové jsou.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Vážně? Řekni mi to!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Paladinové jsou tu, aby získali magickou rudu z Hornického údolí, ne proto, že by očekávali skřetí útok na město.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Jakmile dostanou rudu, vrátí se na pevninu.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_City(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 4;
	condition = DIA_Garvell_City_Condition;
	information = DIA_Garvell_City_Info;
	permanent = FALSE;
	description = "A ten skřet za městem...";
};


func int DIA_Garvell_City_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 2))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//A ten skřet za městem...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Anooo...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Nedělej si s ním starosti. Městská stráž to s ním vyřídí.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Perm(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 13;
	condition = DIA_Garvell_Perm_Condition;
	information = DIA_Garvell_Perm_Info;
	permanent = TRUE;
	description = "Jak to jde v přístavu?";
};


func int DIA_Garvell_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Jak to jde v přístavu?
	if(MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Skřeti nám jdou po krku a ty se ptáš na přístav?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Jen jsem chtěl...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Náš největší problém je v tom, že nemáme dost lodí, abychom se odsud mohli dostat.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Vlastně je tu jen jedna loď, a ta patří paladinům. Určitě ji tu nemají proto, aby nás na ní odsud dostali.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Jen se podívej sám, nic se tu neděje.
	};
};

