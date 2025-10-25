
instance DIA_Bromor_EXIT(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 999;
	condition = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_GIRLS(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_GIRLS_Condition;
	information = DIA_Bromor_GIRLS_Info;
	permanent = FALSE;
	description = "To je tvůj kšeft?";
};


func int DIA_Bromor_GIRLS_Condition()
{
	if(NpcObsessedByDMT_Bromor == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To je tvůj kšeft?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jsem Bromor. Tohle je můj dům a tohle jsou moje holky. Mám je rád.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jestli se líbí i tobě, pak za to musíš zaplatit - 50 zlaťáků.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//A ať tě ani nenapadne dělat tu nějaký bordel.
};


instance DIA_Addon_Bromor_MissingPeople(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Addon_Bromor_MissingPeople_Condition;
	information = DIA_Addon_Bromor_MissingPeople_Info;
	description = "Jsou holky vpořádku?";
};


func int DIA_Addon_Bromor_MissingPeople_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Bromor_GIRLS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Jsou holky vpořádku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Samozřejmě! Myslíš, že bych chtěl být ve vězení za takovou blbost?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Hm ... Nezmiňuji jejich věk. Možná některá z nich chybí?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Ach tak. Právě jedna z mých dívek zmizela - její jméno je Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Oznámil jsem to i domobraně, ale nebyli schopni sledovat její stoupu příliš dlouho.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Jedna z holek z Červené lucerny v přístavu se ztratila.");
};


instance DIA_Addon_Bromor_Lucia(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_Lucia_Condition;
	information = DIA_Addon_Bromor_Lucia_Info;
	description = "Jak dlouho už ji postrádáš?";
};


func int DIA_Addon_Bromor_Lucia_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Bromor_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_Lucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak dlouho už ji postrádáš?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Musí to být jen pár dnů. Nevím to ale přesně.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//Hádám, že utekla s jedním se svých nápadníků.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//A taky utekla s mým cenným zlatým kalichem.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Kdybych ji chytil ...
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//... dal bych jí co proto, to mi věř.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Jedna z holek jménem Lucia ukradla svému šéfovi zlaté kalichy. Bromor je chce zpět.");
	MIS_Bromor_LuciaStoleGold = LOG_Running;
};


instance DIA_Addon_Bromor_LuciaGold(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_LuciaGold_Condition;
	information = DIA_Addon_Bromor_LuciaGold_Info;
	permanent = TRUE;
	description = "Našel jsem ten kalich, co ti Lucia vzala.";
};


func int DIA_Addon_Bromor_LuciaGold_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (MIS_Bromor_LuciaStoleGold == LOG_Running) && Npc_HasItems(other,ItMi_BromorsGeld_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_LuciaGold_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Našel jsem ten kalich, co ti Lucia vzala.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Skvělé!
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"A co nějaká odměna?",DIA_Addon_Bromor_LuciaGold_lohn);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Tady jsou tvé kalichy.",DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Nechceš vědět, kde Lucia je?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Tady jsou tvé kalichy.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Díky, je to od tebe hezké. Chtěl bys něco dalšího?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;

func void DIA_Addon_Bromor_LuciaGold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nechceš vědět, kde je Lucia nyní?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Ne, proč? Kalichy jsou zpět.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//Obchod běží a já se obejdu i bez ní. Přece ji nebudu nutit.
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A co tak nějaká odměna?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//Můžeš mít jednu moji holku zadarmo. Souhlasíš?
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Nechceš vědět, kde Lucia je?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Tak to ne.",DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Dohodnuto, tady jsou tvé kalichy.",DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Tak to ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//Můžeš to přijmout nebo se sem už nevracej.
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Zapomeň na to.",DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Zapoměň na to.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Pak vypadni z mého obchodu, ty kriminálníku.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Neočekávej, že tě tu někdy obsloužím.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Dohodnuto, tady jsou tvé kalichy.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Díky, běž za Nadjou. Zajde s tebou nahoru...
	Bromor_Pay = 1;
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


instance DIA_Bromor_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_Pay_Condition;
	information = DIA_Bromor_Pay_Info;
	permanent = TRUE;
	description = "Chci se trochu pobavit (zaplatit 50 zlaťáků)";
};


func int DIA_Bromor_Pay_Condition()
{
	if((Bromor_Pay == FALSE) && (Bromor_Hausverbot == FALSE) && Npc_KnowsInfo(other,DIA_Bromor_GIRLS) && (NpcObsessedByDMT_Bromor == FALSE) && (Npc_IsDead(Nadja) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Pay_OneTime;

func void DIA_Bromor_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chci se trochu pobavit.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Fajn (zašklebí se). Na následujících pár hodin nejspíš nikdy v životě nezapomeneš.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Vyjdi s Nadjou po schodech nahoru a užij si to!
		if(DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};
		Bromor_Pay = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesnáším, když si ze mě někdo dělá dobrý den. Jestli nemáš na zaplacení, tak odsud vymajzni.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_DOPE(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 3;
	condition = DIA_Bromor_DOPE_Condition;
	information = DIA_Bromor_DOPE_Info;
	permanent = FALSE;
	description = "Můžu tu dostat i nějaké 'zvláštní' zboží?";
};


func int DIA_Bromor_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (NpcObsessedByDMT_Bromor == FALSE) && (Bromor_Hausverbot == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Můžu tu dostat i nějaké "zvláštní" zboží?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Jasně, všechny holky jsou zvláštní (zašklebí se).
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Jestli máš dost zlata, můžeš jít s Nadjou nahoru.
};


instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = "Jsi v pořádku?";
};


func int DIA_Bromor_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Bromor == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Bromor_Heilung(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 55;
	condition = DIA_Bromor_Heilung_Condition;
	information = DIA_Bromor_Heilung_Info;
	permanent = TRUE;
	description = "Ty jsi posedlý.";
};


func int DIA_Bromor_Heilung_Condition()
{
	if((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Heilung_Info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ty jsi posedlý.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Cože? O čem to mluvíš? Vypadni odsud!
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Krádež tohoto klíče by byla dosti riskantní.)";
};


func int DIA_Bromor_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,Dialog_Back,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItKe_Bromor,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};

