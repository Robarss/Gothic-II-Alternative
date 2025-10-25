
instance DIA_Nagur_EXIT(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 999;
	condition = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_PICKPOCKET(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 900;
	condition = DIA_Nagur_PICKPOCKET_Condition;
	information = DIA_Nagur_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Nagur_PICKPOCKET_Condition()
{
	return C_Beklauen(75,150);
};

func void DIA_Nagur_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
	Info_AddChoice(DIA_Nagur_PICKPOCKET,Dialog_Back,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nagur_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};

func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};


instance DIA_Nagur_Hallo(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 2;
	condition = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Hallo_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Hej, nemám čas tady s tebou klábosit. Jestli chceš nějaké informace, promluv si s Kardifem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Hele, chlape, prostě mě nech na pokoji, dobrá?
		AI_StopProcessInfos(self);
	};
};


var int NagurHack;

func void B_Nagur_Abfertigen()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_MIL_M) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_PAL_M) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_PAl_H) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_NOV_L) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_KDF_L) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_KDF_H) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//Nemám dojem, že bych tě nepoznal jen proto, že máš jiný hadry!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(spiklenecky) Ty rád strkáš nos co věcí, do kterých ti nic není, co?!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Ztrať se!
	MIS_Nagur_Bote = LOG_SUCCESS;
	NagurHack = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Job(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 3;
	condition = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent = FALSE;
	description = "Kardif říkal, že pro mě možná budeš mít nějakou práci.";
};


func int DIA_Nagur_Job_Condition()
{
	if(DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Nagur_Job_Info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Kardif říkal, že pro mě možná budeš mít nějakou práci.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//Tady v přístavu není pro klášterní panáky na práci vůbec nic (smích).
		B_Nagur_Abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Tady v přístavu není pro královské vojáky na práci vůbec nic.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(zkoumavě) Dobrá, dobrá, tak ty se poohlížíš po nějaké speciální přácičce. Ale hraje se podle mejch pravidel, jasný?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Co to znamená?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//To znamená to, že uděláš, co ti řeknu, a dostaneš třetinu zisku.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Jestli se ti to nelíbí, nic pro tebe nemám.
		Info_ClearChoices(DIA_Nagur_Job);
		Info_AddChoice(DIA_Nagur_Job,"Jsme obchodní partneři, takže hezky fifty-fifty.",DIA_Nagur_Job_Halbe);
		Info_AddChoice(DIA_Nagur_Job,"Dobrá, ty jsi šéf.",DIA_Nagur_Job_Klar);
	};
};

func void DIA_Nagur_Job_Klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//Dobrá, ty jsi šéf.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Fajn, dej mi vědět, až budeš připravenej na nahrabání hromady peněz.
	Nagur_Deal = 80;
	Info_ClearChoices(DIA_Nagur_Job);
};

func void DIA_Nagur_Job_Halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Jsme parťáci, takže fifty-fifty.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//Jo, jasně, stejně jsem si myslel, že to tak bude. Samozřejmě, že se spravedlivě rozdělíme.
	Nagur_Deal = 120;
	Info_ClearChoices(DIA_Nagur_Job);
};


instance DIA_Nagur_Auftrag(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 4;
	condition = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent = FALSE;
	description = "Fajn, jakej je plán?";
};


func int DIA_Nagur_Auftrag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Nagur_Job) && (MIS_Nagur_Bote != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Fajn, jakej je plán?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Znáš obchodníka Baltrama, ne? Jestli ne, tak je načase si s ním promluvit.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//Ten Baltram má poslíčka, kterej ho zásobuje zbožím z Akilovy farmy.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//Teda, MĚL poslíčka, dokud jsem ho nepodříz. A teď si Baltram shání nového. A tím budeš ty.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Necháš se Baltramem najmout a vezmeš tu dodávku od Akila.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//Přineseš mi ji a já ji pak prodám jednomu zajímavýmu zákazníkovi. Dá nám za to pořádnou sumičku zlata.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//A nepokoušej se to prodat sám. Je ti všechno jasný?
	Info_ClearChoices(DIA_Nagur_Auftrag);
	Info_AddChoice(DIA_Nagur_Auftrag,"Tak dobrá, jdeme na to. (KONEC)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice(DIA_Nagur_Auftrag,"Kde najdu Baltrama?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice(DIA_Nagur_Auftrag,"Kdy si mám s Baltramem promluvit?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice(DIA_Nagur_Auftrag,"Kde je Akilova farma?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice(DIA_Nagur_Auftrag,"Kolik nám z toho kouká?",DIA_Nagur_Auftrag_Gewinn);
};

func void DIA_Nagur_Auftrag_Akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Kde je Akilova farma?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Opustíš město východní branou. Je to ta přímo u tržiště.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Když půjdeš po cestě napravo, brzo narazíš na několik stupňů vytesaných do skály.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Vyjdi po nich a narazíš na Akilovu farmu.
};

func void DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//Kolik nám z toho kouká?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//Přesně těžko říct. Ale tak kolem 400 zlatých.
};

func void DIA_Nagur_Auftrag_Baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Kde najdu Baltrama?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//Má svůj stánek na tržišti.
};

func void DIA_Nagur_Auftrag_Wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Kdy si mám s Baltramem promluvit?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//Můžeš jít hned teď. Už by měl vědět, že se jeho poslíček už nikdy neukáže. (sprostý smích)
};

func void DIA_Nagur_Auftrag_Okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//Tak teda dobrá, jdu na to.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Fajn, tak jdi - ale jestli se mě pokusíš podvést, budeš úplně stejně mrtvej jako ten poslíček! Nezapomeň na to!
	MIS_Nagur_Bote = LOG_Running;
	Log_CreateTopic(TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Nagur,LOG_Running);
	B_LogEntry(TOPIC_Nagur,"Musím Baltrama přimět, aby mě přijal jako nového poslíčka. Pak musím přebrat zásilku od farmáře Akila a předat ji Nagurovi.");
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Success(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 5;
	condition = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent = FALSE;
	description = "Přinesl jsem ten balík.";
};


func int DIA_Nagur_Success_Condition()
{
	if((MIS_Nagur_Bote == LOG_Running) && (Npc_HasItems(other,ItMi_BaltramPaket) >= 1) && (Nagur_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Success_Info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//Přinesl jsem ten balík.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Dobrá práce. Zkusím to prodat. Vrať se zítra.
	B_LogEntry(TOPIC_Nagur,"Nagur přijal zásilku. Zaplatí mi zítra.");
	AI_StopProcessInfos(self);
	if(B_GiveInvItems(other,self,ItMi_BaltramPaket,1))
	{
		Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();
};


instance DIA_Nagur_Deal(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 6;
	condition = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent = TRUE;
	description = "Prodal jsi teda to zboží?";
};


var int DIA_Nagur_Deal_permanent;

func int DIA_Nagur_Deal_Condition()
{
	if((DIA_Nagur_Deal_permanent == FALSE) && (MIS_Nagur_Bote == LOG_Running) && (Nagur_Ausgeliefert == FALSE) && Npc_KnowsInfo(other,DIA_Nagur_Success))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Deal_Info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//Prodal jsi teda to zboží?
	if(B_GetDayPlus() > NagurDay)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Jo, ale za míň, než jsem myslel. Dostal jsem jen 300 zlatých.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//Kus z toho je pro moje zaměstnance.
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//A Kardif dostane svůj obvyklý podíl - plus zlato na tvoji provizi.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//Což nakonec dělá 240 zlatých. Rozdělíme si to, jak jsme se dohodli. Tady je tvůj díl.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Odvedl jsi dobrou práci. Nechal jsem na to svých zaměstnancích.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Co se na tom vydělá, už nijak neovlivním.
		B_GiveInvItems(self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP(XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = Diebesgilde_Okay + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Ne, ještě ne. Tahle věc chce svůj čas. Chci po tom všem dostat dobrou cenu.
	};
};


instance DIA_Nagur_Auftraggeber(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent = FALSE;
	description = "Kdo jsou tví zaměstnanci?";
};


func int DIA_Nagur_Auftraggeber_Condition()
{
	if(MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftraggeber_Info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Kdo jsou tví zaměstnanci?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//Vážně si nemyslíš, že ti to řeknu, že ne?
};


instance DIA_Nagur_Fazit(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Fazit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Nagur_Auftraggeber) && Npc_IsInState(self,ZS_Talk) && (Knows_SecretSign == FALSE) && (NagurHack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Fazit_Info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Ten kšeft dopadnul dobře, ale o svých lidech nemluvím. Takže klídek.
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Knast(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Knast_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (Nagur_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Knast_Info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Podvedl jsi mě! To byla velká chyba - jdi do hajzlu!
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Sign(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent = FALSE;
	description = "(Předvést zlodějský signál.)";
};


func int DIA_Nagur_Sign_Condition()
{
	if((MIS_Nagur_Bote == LOG_SUCCESS) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Dokázals to. Teď víš, kdo jsou mí zaměstnanci.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Drž se toho, co ti řekla Cassia - nestaráme se o to, kdo jsou ti ostatní. Jsi jedním z nás, a na ničem jiným nesejde.
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Perm(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Perm_Condition()
{
	if((MIS_Nagur_Bote == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Nagur_Sign) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Perm_Info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Podívej se po někom jiném. Potlouká se tu kolem dost lidí. Už pro tebe nic dalšího nemám.
	AI_StopProcessInfos(self);
};

