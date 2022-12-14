
instance DIA_Pedro_EXIT(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 999;
	condition = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_WELCOME(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 1;
	condition = DIA_Pedro_WELCOME_Condition;
	information = DIA_Pedro_WELCOME_Info;
	important = TRUE;
};


func int DIA_Pedro_WELCOME_Condition()
{
	return TRUE;
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//V?tej v Innosovu kl??te?e, cizin?e.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jsem bratr Pedro, pon??en? slu?ebn?k Innose a str??ce br?ny do svat?ho kl??tera.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co pot?ebuje??
};


instance DIA_Pedro_Wurst(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Wurst_Condition;
	information = DIA_Pedro_Wurst_Info;
	permanent = FALSE;
	description = "Tady m?? klob?su, brat?e.";
};


func int DIA_Pedro_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Tady m?? klob?su, brat?e.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Je od tebe hezk?, ?es na m? myslel. Ka?d? na m? v?t?inou zapomene.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Mo?n? bys mi mohl d?t je?t? jednu.
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Na to zapome?, pak bych jich nem?l dost.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//No co, jedna klob?ska - toho si nikdo nev?imne. N?co za to dostane? - v?m o m?st?, kde rostou ohniv? kop?ivy.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Kdy? je donese? Neorasovi, ur?it? ti d? kl?? od knihovny. Co na to ??k???
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	Info_ClearChoices(DIA_Pedro_Wurst);
	Info_AddChoice(DIA_Pedro_Wurst,"Fajn, tady m?? dal?? klob?su.",DIA_Pedro_Wurst_JA);
	Info_AddChoice(DIA_Pedro_Wurst,"Ne, na to zapome?.",DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Wurst_JA()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Fajn, tady m?? dal?? klob?su.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Tak. N?kolik ohniv?ch kop?iv roste nalevo a napravo od m?stku na druh?m b?ehu.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Info_ClearChoices(DIA_Pedro_Wurst);
};

func void DIA_Pedro_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Ne, na to zapome?.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chce? dob?e vych?zet s Goraxem, co? S nov?mi novici to je v?dycky stejn?.
	Info_ClearChoices(DIA_Pedro_Wurst);
};


instance DIA_Pedro_EINLASS(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_EINLASS_Condition;
	information = DIA_Pedro_EINLASS_Info;
	permanent = FALSE;
	description = "Chci vstoupit do kl??tera.";
};


func int DIA_Pedro_EINLASS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_WELCOME))
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chci vstoupit do kl??tera.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Do kl??tera mohou vstoupit jen slu?ebn?ci Innosovi.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Jestli se chce? pomodlit k Innosovi, m??e? si naj?t n?jakou svatyni u cesty. Na modlitby tam je dostate?n? klid.
};


instance DIA_Pedro_TEMPEL(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_TEMPEL_Condition;
	information = DIA_Pedro_TEMPEL_Info;
	permanent = FALSE;
	description = "Co mus?m ud?lat, aby m? p?ijali do kl??tera?";
};


func int DIA_Pedro_TEMPEL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_EINLASS) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pedro_TEMPEL_Info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co mus?m ud?lat, aby m? p?ijali do kl??tera?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//P??stup do kl??tera ti je zapov?zen - svou cestu sis ji? zvolil.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Pokud chce? vstoupit do Bratrstva Innosova, mus?? se nau?it a dodr?ovat pravidla kl??tera.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Nav?c ??dame po ka?d?m nov?m novici d?rek Innosovi.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//Ovci a 1000 zla??k?.
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To je spousta zlata.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Je to na znamen? toho, ?e za??n?? nov? ?ivot jako Innos?v slu?ebn?k. Kdy? t? kl??ter p?ijme, budou ti v?echny tvoje p?edchoz? h??chy odpu?t?ny.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Ale rozmysli si to - jakmile se jednou stane? Innosov?m slu?ebn?kem, nem??e? to vz?t zp?t.
		SC_KnowsKlosterTribut = TRUE;
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Chci-li se st?t novicem v Innosov? kl??te?e, pot?ebuji ovci a velkou ??stku pen?z.");
	};
};


instance DIA_Addon_Pedro_Statuette(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Condition;
	information = DIA_Addon_Pedro_Statuette_Info;
	permanent = FALSE;
	description = "M?m tady tuhle so?ku...";
};


func int DIA_Addon_Pedro_Statuette_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running) && Npc_KnowsInfo(other,DIA_Pedro_Rules) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//M?m tady tuhle so?ku. M?m dojem, ?e ji postr?daj? v kl??te?e.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//M??u te? proj?t?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//Tak?e, za tohoto stavu v?c? u? ti nic nebr?n? st?t se novicem.
		Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Novic Pedro m? pustil do kl??tera, proto?e jsem m?l tu chyb?j?c? so?ku. M?l bych ji doru?it n?komu v kl??te?e.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//Boj?m se ale, ?e dokonce i s t?mto vz?cn?m skvostem t? nem??u p?ijmout.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//U? jsi se rozhodl pro jinou cestu. Cesta do kl??tera pro tebe z?st?v? uzav?ena.
	};
};


instance DIA_Addon_Pedro_Statuette_Abgeben(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information = DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent = FALSE;
	description = "M??u ti tu so?ku tady nechat?";
};


func int DIA_Addon_Pedro_Statuette_Abgeben_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//M??u ti tu so?ku tady nechat?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Samoz?ejm?, okam?it? se o ni postar?m. D?ky za tv?j nesobeck? skutek.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Pedro_Rules(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Rules_Condition;
	information = DIA_Pedro_Rules_Info;
	permanent = FALSE;
	description = "Podle jak?ch pravidel ?ijete?";
};


func int DIA_Pedro_Rules_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Podle jak?ch pravidel ?ijete?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos je b?h pravdy a ??du, tak?e NIKDY nesm?? zalhat nebo sp?chat n?jak? zlo?in.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Pokud se proh?e??? proti sv?mu bratru nebo ukradne? n?co z na?ich v?c?, zaplat?? za to.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos je tak? b?h vl?dy a ohn?.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jako?to novic mus?? prokazovat POSLU?NOST a ?CTU v?em ohniv?m m?g?m.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Aha.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//D?le je POVINNOST? novice vykon?vat v kl??te?e v?echny pr?ce pro dobro na?eho spole?enstv?.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Pokud jsi p?ipraven se t?mito pravidly ??dit a m?? dar pro Innose, r?di t? p?ijmeme do kl??tera jako novice.
	};
};


instance DIA_Pedro_AUFNAHME(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_AUFNAHME_Condition;
	information = DIA_Pedro_AUFNAHME_Info;
	permanent = TRUE;
	description = "Chci se st?t novicem.";
};


var int DIA_Pedro_AUFNAHME_NOPERM;

func int DIA_Pedro_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_Rules) && (DIA_Pedro_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_AUFNAHME_Choice()
{
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Je?t? si to nech?m proj?t hlavou.",DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Ano, chci zasv?tit sv?j ?ivot slu?b? Innosovi.",DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_AUFNAHME_Info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chci se st?t novicem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Svou cestu sis ji? zvolil. Cesta magie ti je uzav?ena.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Je to opravdu tvoje p??n?? Uv?dom si ale jednu v?c. V?echny ostatn? cesty pro tebe z?stanou nav?dy uzav?eny.
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,ItMi_Gold) >= Summe_Kloster) && Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Vid?m, ?es p?inesl po?adovan? dar. Pokud opravdu chce?, m??e? se st?t novicem.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Ale pokud se tak rozhodne?, u? nen? cesty zp?t - zva? dob?e, zda je toto cesta, po n?? tou???!
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nep?inesl jsi po?adovan? dar.
	};
};

func void DIA_Pedro_AUFNAHME_YES()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Ano, chci zasv?tit sv?j ?ivot slu?b? Innosovi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//V tom p??pad? v?tej, brat?e. D?m ti kl?? ke kl??tern? br?n?.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Na d?kaz sv? svobodn? v?le s?m otev?i br?nu a projdi dovnit?.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Nyn? jsi novic. Nos tento ?at na znamen?, ?e jsi te? ?lenem bratrstva.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//A? bude? v kl??te?e, jdi za Parlanem. Od nyn?j?ka se bude starat o to, abys m?l, co pot?ebuje?.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Budou te? m? proh?e?ky odpu?t?ny?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Je?t? ne. Promluv si s mistrem Parlanem. Po?ehn? ti a o?ist? t? od h??ch?.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
	CreateInvItems(other,ItAr_NOV_L,1);
	AI_EquipArmor(other,ItAr_NOV_L);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP(XP_AufnahmeNovize);
	if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE;
	};
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void DIA_Pedro_AUFNAHME_NO()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Je?t? si to nech?m proj?t hlavou.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Vra? se, a? bude? p?ipraven.
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
};


instance DIA_Pedro_Monastery(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 90;
	condition = DIA_Pedro_Monastery_Condition;
	information = DIA_Pedro_Monastery_Info;
	permanent = TRUE;
	description = "Pov?z mi o ?ivot? v kl??te?e.";
};


func int DIA_Pedro_Monastery_Condition()
{
	return TRUE;
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Pov?z mi o ?ivot? v kl??te?e.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//?ijeme v kl??te?e, abychom slou?ili Innosovi. My novicov? vykon?v?me v?echny pr?ce a kdykoliv m??eme, studujeme posv?tn? knihy.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Na n?s dohl??ej? m?gov? a ti zase zkoumaj? um?n? magie.
};


instance DIA_Pedro_PICKPOCKET(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 900;
	condition = DIA_Pedro_PICKPOCKET_Condition;
	information = DIA_Pedro_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Pedro_PICKPOCKET_Condition()
{
	return C_Beklauen(45,60);
};

func void DIA_Pedro_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,Dialog_Back,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

