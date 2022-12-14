
instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Jmenuju se Lutero. Obchoduju se v??m, na co si vzpomene?.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Jak? zbo?? mi m??e? nab?dnout?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//No, hlavn? vz?cn? a neobvykl? v?ci. V?dycky jsem se sna?il vyhov?t z?kazn?kovu p??n?.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Lutero prod?v? v horn? ?tvrti neobvykl? a vz?cn? v?ci.");
};


instance DIA_LUTERO_SELLWHAT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 1;
	condition = dia_lutero_sellwhat_condition;
	information = dia_lutero_sellwhat_info;
	permanent = FALSE;
	description = "Nev?? kde bych mohl koupit takov? oblek jako m?? ty ?.";
};


func int dia_lutero_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_lutero_sellwhat_info()
{
	AI_Output(other,self,"DIA_Lutero_SellWhat_15_00");	//Nev?? kde bych mohl koupit takov? oblek jako m?? ty ?
	AI_Output(self,other,"DIA_Lutero_SellWhat_09_01");	//Ano a to p??mo u m?, akorat nev?m jestli na to bude? m?t, proto?e tohle je toti? dost luxusn? od?v, tak?e jedin? pokud bude? m?t dost zlata klidn? ti ho prod?m.
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Zmizni, ko?ene! Nem?? co d?lat? Tak si koukej sehnat pr?ci - ale n?kde jinde!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Co tady chce?, novici? Nem?l bys b?t v kl??te?e?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "Hled?? n?co konkr?tn?ho?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Hled?? n?co konkr?tn?ho?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Pro sv?j sou?asn? ?kol pot?ebuju dr?py ch?apavce.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Ale ne jen tak ledajak? dr?py. Mus? to b?t n?co zvl??tn?ho - dr?py mocn? bestie, co u? zabila mnoho mu??, nebo n?co takov?ho.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Kde najdu ch?apavce?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Na tomhle ostrov? jich p?r je, ale v?t?ina z nich ?ije v Hornick?m ?dol?.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//A co z toho budu m?t?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//M??u ti opat?it n?jak? runov? k?men.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//M??u ti d?t prsten nep?emo?itelnosti.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Uvid?m, co se d? d?lat.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"Obchodn?k Lutero hled? dr?py zvl᚝ siln?ho ch?apavce.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "M?m pro tebe n?jak? zaj?mav? dr?py ch?apavce.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if((Npc_HasItems(other,ItAt_ClawLeader) >= 1) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//M?m pro tebe n?jak? zaj?mav? dr?py ch?apavce.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//M?j z?kazn?k to r?d usly??.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nem?m ten runov? k?men tady u sebe. Ale v?m, kde ho m??e? naj?t.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//A? p?jde? z m?sta do hospody, projde? pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Je tam jeskyn?, moji p??tel? tam maj? v truhle ulo?en? runov? kameny. Tady je kl??.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Tady je ten prsten, co jsem si sl?bil.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = "Uka? mi sv? zbo??.";
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Uka? mi sv? zbo??.
};


var int lutero_leatherbought;

instance DIA_LUTERO_LEATHER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 650;
	condition = dia_lutero_leather_condition;
	information = dia_lutero_leather_info;
	permanent = TRUE;
	description = "Koupit Velitelsk? kab?tec. (3500 zla??k?)";
};


func int dia_lutero_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_lutero_sellwhat) && (LUTERO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lutero_leather_info()
{
	AI_Output(other,self,"DIA_Lutero_LEATHER_15_00");	//3500 zla??k???? no dob?e ?iju jen jednou, te? aspon budu vypadat Luxusn?.
	if(B_GiveInvItems(other,self,ItMi_Gold,3500))
	{
		AI_Output(self,other,"DIA_Lutero_LEATHER_09_01");	//Bude se ti moc l?bit. (u?kl?bne se)
		CreateInvItems(other,ITAR_Governor,1);
		AI_PrintScreen("Zbroj od Lutera z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		LUTERO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_LEATHER_09_02");	//Od?v m? svou cenu - a opravdu za to stoj?. Tak?e se vra?, a? d?? dohromady dost zlata.
	};
};


instance DIA_Lutero_PICKPOCKET(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return C_Beklauen(58,65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

