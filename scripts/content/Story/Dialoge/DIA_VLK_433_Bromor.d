
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
	description = "To je tv?j k?eft?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To je tv?j k?eft?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jsem Bromor. Tohle je m?j d?m a tohle jsou moje holky. M?m je r?d.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jestli se l?b? i tob?, pak za to mus?? zaplatit - 50 zla??k?.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//A a? t? ani nenapadne d?lat tu n?jak? bordel.
};


instance DIA_Addon_Bromor_MissingPeople(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Addon_Bromor_MissingPeople_Condition;
	information = DIA_Addon_Bromor_MissingPeople_Info;
	description = "Jsou holky vpo??dku?";
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
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Jsou holky vpo??dku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Samoz?ejm?! Mysl??, ?e bych cht?l b?t ve v?zen? za takovou blbost?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Hm ... Nezmi?uji jejich v?k. Mo?n? n?kter? z nich chyb??
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Ach tak. Pr?v? jedna z m?ch d?vek zmizela - jej? jm?no je Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Ozn?mil jsem to i domobran?, ale nebyli schopni sledovat jej? stoupu p??li? dlouho.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Jedna z holek z ?erven? lucerny v p??stavu se ztratila.");
};


instance DIA_Addon_Bromor_Lucia(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_Lucia_Condition;
	information = DIA_Addon_Bromor_Lucia_Info;
	description = "Jak dlouho u? ji postr?d???";
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
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak dlouho u? ji postr?d???
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Mus? to b?t jen p?r dn?. Nev?m to ale p?esn?.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//H?d?m, ?e utekla s jedn?m se sv?ch n?padn?k?.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//A taky utekla s m?m cenn?m zlat?m kalichem.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Kdybych ji chytil ...
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//... dal bych j? co proto, to mi v??.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Jedna z holek jm?nem Lucia ukradla sv?mu ??fovi zlat? kalichy. Bromor je chce zp?t.");
	MIS_Bromor_LuciaStoleGold = LOG_Running;
};


instance DIA_Addon_Bromor_LuciaGold(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_LuciaGold_Condition;
	information = DIA_Addon_Bromor_LuciaGold_Info;
	permanent = TRUE;
	description = "Na?el jsem ten kalich, co ti Lucia vzala.";
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
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Na?el jsem ten kalich, co ti Lucia vzala.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Skv?l?!
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"A co n?jak? odm?na?",DIA_Addon_Bromor_LuciaGold_lohn);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Tady jsou tv? kalichy.",DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Nechce? v?d?t, kde Lucia je?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Tady jsou tv? kalichy.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//D?ky, je to od tebe hezk?. Cht?l bys n?co dal??ho?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;

func void DIA_Addon_Bromor_LuciaGold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nechce? v?d?t, kde je Lucia nyn??
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Ne, pro?? Kalichy jsou zp?t.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//Obchod b??? a j? se obejdu i bez n?. P?ece ji nebudu nutit.
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A co tak n?jak? odm?na?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//M??e? m?t jednu moji holku zadarmo. Souhlas???
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Nechce? v?d?t, kde Lucia je?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Tak to ne.",DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Dohodnuto, tady jsou tv? kalichy.",DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Tak to ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//M??e? to p?ijmout nebo se sem u? nevracej.
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Zapome? na to.",DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Zapom?? na to.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Pak vypadni z m?ho obchodu, ty krimin?ln?ku.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Neo?ek?vej, ?e t? tu n?kdy obslou??m.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Dohodnuto, tady jsou tv? kalichy.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//D?ky, b?? za Nadjou. Zajde s tebou nahoru...
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
	description = "Chci se trochu pobavit (zaplatit 50 zla??k?)";
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
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Fajn (za?kleb? se). Na n?sleduj?c?ch p?r hodin nejsp?? nikdy v ?ivot? nezapomene?.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Vyjdi s Nadjou po schodech nahoru a u?ij si to!
		if(DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};
		Bromor_Pay = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesn???m, kdy? si ze m? n?kdo d?l? dobr? den. Jestli nem?? na zaplacen?, tak odsud vymajzni.
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
	description = "M??u tu dostat i n?jak? 'zvl??tn?' zbo???";
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
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//M??u tu dostat i n?jak? "zvl??tn?" zbo???
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Jasn?, v?echny holky jsou zvl??tn? (za?kleb? se).
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Jestli m?? dost zlata, m??e? j?t s Nadjou nahoru.
};


instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = "Jsi v po??dku?";
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
	description = "Ty jsi posedl?.";
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
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ty jsi posedl?.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Co?e? O ?em to mluv??? Vypadni odsud!
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kr?de? tohoto kl??e by byla dosti riskantn?.)";
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

