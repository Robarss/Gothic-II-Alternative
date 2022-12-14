
instance DIA_Isgaroth_EXIT(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 999;
	condition = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//Nech? nad tebou Innos bd?.
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Hello(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Isgaroth_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//Innos t? doprov?zej. Co pro tebe mohu ud?lat, poutn??e?
};


instance DIA_Isgaroth_Segen(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 10;
	condition = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent = TRUE;
	description = "Po?ehnej mi!";
};


func int DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Segen_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//Po?ehnej mi!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//?ehn?m ti jm?nem Innosov?m. Nech? ve tv?m srdci plane ohe? na?eho P?na a nech? ti d? s?lu ??dit se jeho spravedlivost?.
	Isgaroth_Segen = TRUE;
};


instance DIA_Isgaroth_Wolf(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent = FALSE;
	description = "Pos?l? m? Sergio...";
};


func int DIA_Isgaroth_Wolf_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (Sergio_Sends == TRUE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//Pos?l? m? Sergio. P?evzal jsem jeho ?kol. Tak, o co jde?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//Posledn? dobou se po okol? toul? ?ern? vlk. Vystopuj jej a zabij ho.
	MIS_IsgarothWolf = LOG_Running;
	B_LogEntry(Topic_IsgarothWolf,"Kolem svatyn? se potuluje temn? vlk. M?l bych ho naj?t a zab?t.");
};


instance DIA_Isgaroth_tot(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent = TRUE;
	description = "Zabil jsem toho vlka.";
};


func int DIA_Isgaroth_tot_Condition()
{
	Wolfi = Hlp_GetNpc(BlackWolf);
	if((MIS_IsgarothWolf == LOG_Running) && Npc_IsDead(Wolfi))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//Zabil jsem toho vlka.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//Dobr? pr?ce, novici. Jsi state?n? mu?. Te? se vra? do kl??tera a v?nuj se sv?m povinnostem.
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Job(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 4;
	condition = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent = FALSE;
	description = "Co tady d?l???";
};


func int DIA_Isgaroth_Job_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//Jsem ohniv? m?g. Kn?z na?eho boha Innose.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//Toto m?sto je zasv?cen? JEMU, nejvy???mu bohu, stvo?iteli ohn? a p?novi spravedlnosti.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//Lid? sem p?ich?zej?, aby se modlili k Innosovi a obdr?eli po?ehn?n?.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//Za n?jak? ten drobn? ode m? tak? m??e? dostat mnoh? u?ite?n? v?ci.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"Ve svatyni p?ed kl??terem s?dl? mistr Isgaroth, kter? prod?v? u?ite?n? magick? p?edm?ty.");
};


instance DIA_Isgaroth_Trade(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 99;
	condition = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka? mi sv? zbo??.";
};


func int DIA_Isgaroth_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//Uka? mi sv? zbo??.
};


instance DIA_Isgaroth_Kloster(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent = FALSE;
	description = "Kam m? tahle cesta dovede?";
};


func int DIA_Isgaroth_Kloster_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//Kam m? tahle cesta dovede?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//Tahle cesta vede do kl??tera ohniv?ch m?g?. Vstup do n?j je ov?em povolen jen slu?ebn?k?m Innose.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//A jestli chce? b?t do kl??tera p?ijat jako novic, mus?? s sebou p?iv?st ovci a...
		B_Say_Gold(self,other,Summe_Kloster);
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Chci-li se st?t novicem v Innosov? svatyni, pot?ebuji ovci a 1000 zla??k?.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//Proto?e ses ov?em ji? rozhodl spojit se s jinou skupinou, bude ti vstup odep?en.
	};
};


instance DIA_Isgaroth_Vatras(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent = TRUE;
	description = "Nesu zpr?vu od Vatrase.";
};


func int DIA_Isgaroth_Vatras_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && ((Npc_HasItems(other,ItWr_VatrasMessage) == 1) || (Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//Nesu zpr?vu od Vatrase.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//Co je to za zpr?vu?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//Je to dopis. Tady.
	if(Npc_HasItems(other,ItWr_VatrasMessage) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage,1);
		};
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//Dobr?, m??e? Vatrasovi vy??dit, ?e jsem tu zpr?vu obdr?el.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//Vezmi si tyhle lektvary jako odm?nu za sv? slu?by, ur?it? se ti budou hodit.
		CreateInvItems(self,ItPo_Health_02,2);
		B_GiveInvItems(self,other,ItPo_Health_02,2);
		B_GivePlayerXP(XP_Ambient * 2);
	}
	else if(Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage_Open,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage_Open,1);
		};
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//Pe?e? je rozlomen?. Na cos myslel, ty bl?zne!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//B?? a vy?i? Vatrasovi, ?e jsem jeho zpr?vu obdr?el.
		AI_StopProcessInfos(self);
	};
	Vatras_Return = TRUE;
};


instance DIA_Isgaroth_PICKPOCKET(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 900;
	condition = DIA_Isgaroth_PICKPOCKET_Condition;
	information = DIA_Isgaroth_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Isgaroth_PICKPOCKET_Condition()
{
	return C_Beklauen(48,50);
};

func void DIA_Isgaroth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,Dialog_Back,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

