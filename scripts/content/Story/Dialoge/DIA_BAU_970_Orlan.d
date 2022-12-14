
instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = "P?inesl jsem v?no z kl??tera.";
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//P?inesl jsem v?no z kl??tera.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//V?born?. To je to, na co jsem ?ekal.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//U? jsem p?istoupil na Goraxovu cenu. Hned te? ti d?m 100 zlat?ch.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Dobr?, tak mi dej to zlato.",DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein,"Ty se m? sna??? nap?lit?",DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//Dobr?, tak mi dej to zlato.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Tady m??. Bylo mi pot??en?m s tebou obchodovat.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Pokou??? se m? obrat? Cena je 240 zlat?ch.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Gorax t? snad varoval, ne? Dobr?, mo?n? bychom na tom mohli vyd?lat oba. Hele - d?m ti za to v?no 100 zlat?ch.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//?ekne? Goraxovi, ?e jsem t? nat?hl, a j? ti d?m ?TY?I magick? svitky.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Hej, prost? mi dej 240 zlat?ch.",DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein,"Dobr?, to zn? docela f?rov?. Dej mi ty svitky.",DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein,"Co to je za svitky?",DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, prost? mi dej 240 zlat?ch.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Copak na tom nechce? vyd?lat, co? (povzdych) Dobr?, tady je zlato.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ItemsErhalten);
	PrintScreen(text,-1,-1,FONT_ScreenSmall,2);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Dobr?, to zn? docela f?rov?. Dej mi ty svitky.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Tady jsou svitky a zlato.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//Co to je za svitky?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Netu??m - o tomhle j? nic nev?m. Jsou od hosta, co... ehm... je tady zapomn?l, jo.
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Jsem Orlan, majitel t?hle skromn? hospody.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Co sh?n??, cizin?e? Mo?n? po??dn? me?, nebo snad kus dobr?ho brn?n??
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Dou?ek n??eho dobr?ho z venkovsk?ch pal?ren, nebo jen n?jakou informaci?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//M??u ti to nab?dnou v?echno a dokonce je?t? v?c, pokud jsou tv? mince prav?.
};


instance DIA_Addon_Orlan_Greg(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_Greg_Condition;
	information = DIA_Addon_Orlan_Greg_Info;
	description = "Zn?? toho chl?pka s p?skou p?es oko?";
};


func int DIA_Addon_Orlan_Greg_Condition()
{
	if((SC_SawGregInTaverne == TRUE) && (Kapitel <= 3) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Zn?? toho chl?pka s p?skou p?es oko?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//U? jsem ho tu jednou vid?l - takov? hrubi?n.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Ubytoval se v jednom z m?ch pokoj?. M?l s sebou obrovskou truhlu.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//A? kdy? jsem mu to n?kolikr?t p?ipom?nal, tak mi kone?n? zaplatil n?jem za pokoj - v?bec s t?m nesp?chal.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//A pak byl jednou prost? pry?. I se svou truhlou. U? nechci nic m?t s lidmi jako on.
};


instance DIA_Addon_Orlan_Ranger(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Ranger_Condition;
	information = DIA_Addon_Orlan_Ranger_Info;
	description = "Zd? se mi to nebo fakt z?r?? na m?j prsten?";
};


func int DIA_Addon_Orlan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (SCIsWearingRangerRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//Zd? se mi to nebo fakt z?r?? na m?j prsten?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Nejsem si jist? co s t?m.
	Orlan_KnowsSCAsRanger = TRUE;
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"?lov??e! Pat??m ke 'Kruhu Vody'!",DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Je to akvamar?n. U? jsi n?kdy n?jak? vid?l?",DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//Je to akvamar?n. U? jsi n?kdy n?jak? vid?l?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Jo. V?tej na velitelstv?, brat?e Kruhu.
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//... i kdy? se nazd?? b?t nejchyt?ej?? ...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Co pro tebe m??u ud?lat?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//?lov??e! Pat??m ke 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Vid?m, vid?m. Vypad? to, jako by zjistili, ?e jsou to spr?vn? pitomci ...
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Co chce??
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};


instance DIA_Addon_Orlan_Teleportstein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Teleportstein_Condition;
	information = DIA_Addon_Orlan_Teleportstein_Info;
	description = "U? jsi n?kdy pou?il teleportar?n? k?men?";
};


func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if((Orlan_KnowsSCAsRanger == TRUE) && (SCUsed_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//U? jsi n?kdy pou?il teleporta?n? k?men?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Zbl?znil ses? Dokud mi m?gov? Vody ne?eknou, ?e je to bezpe?n?, nep?ibl???m se na 10 krok?.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Pov??ili m?, abych schoval jeden z t?ch teleporta?n?ch k?men? a to je p?esn? to, co chci ud?lat.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"M??u se na ten teleportar?n? k?men mrknout?",DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"Kde je p?esn? ten teleporta?n? k?men?",DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_Teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//M??u se na ten teleporta?n? k?men mrknout?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Pro m? za m?. Tady je kl??. Zatarasil jsem vchod.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	B_GiveInvItems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Orlan zamkl teleporta?n? k?men v jeskyni na jihoz?pad od jeho hospody.");
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Kde je p?esn? ten teleporta?n? k?men?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Kousek na jih od moj? hospody. Tam ho na?li m?gov? Vody.
};


instance DIA_Addon_Orlan_NoMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_NoMeeting_Condition;
	information = DIA_Addon_Orlan_NoMeeting_Info;
	description = "Jsem zde uveden do 'Kruhu Vody'!";
};


func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && !Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger) && (SCIsWearingRangerRing == FALSE) && (MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//Jsem zde uveden do 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//(?tiplav?) Nevid?m prsten. Chce? n?co k pit??
};


instance DIA_Addon_Orlan_WhenRangerMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information = DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description = "Sly?el jsem n?co o srazu 'Kruhu' ve tv? hospod?.";
};


func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Sly?el jsem n?co o srazu 'Kruhu' ve tv? hospod?.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//To je pravda. M?l by ka?dou chv?li za??t.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Zaj?malo by m?, co je zdr?elo.
	B_GivePlayerXP(XP_Ambient);
	B_Addon_Orlan_RangersReadyForComing();
	self.flags = 0;
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Jsem si jist?, ?e se brzy objev?.",DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Ten sraz je dneska?",DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Ten sraz je dneska?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Pokud si to dob?e pamatuju tak ano.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Douf?m, ?e zase p?ijdou pozd?.
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"(V?ce)",DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Jsem si jist?, ?e se brzy objev?.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Uvid?me.
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"(V?ce)",DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = "Jak? druh zbroje mi m??e? nab?dnout?";
};


var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (DIA_Orlan_RUESTUNG_noPerm == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jak? druh zbroje mi m??e? nab?dnout?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//M?m tady jeden velmi p?kn? kousek, kter? se ti ur?it? bude l?bit.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG,"Ko?en? zbroj. (250 zla??k?)",DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Cht?l bych si koupit lehkou zbroj.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Leather_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//Moudr? rozhodnut?.
		CreateInvItems(self,ITAR_Leather_L,1);
		B_GiveInvItems(self,other,ITAR_Leather_L,1);
		AI_EquipBestArmor(other);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Promi?. Dokud nem?? pen?ze, ??dn? obchody nebudou.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Budu o tom p?em??let.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chce?. Ale neot?lej p??li? dlouho.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Uka? mi sv? zbo??.";
};


func int DIA_Orlan_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Uka? mi sv? zbo??.
	B_GiveTradeInv(self);
	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || (SCIsWearingRangerRing == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Samoz?ejm?, brat?e kruhu.
		Orlan_KnowsSCAsRanger = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Samoz?ejm?. Je to pro m? velk? ?est, p?ijmout tak d?le?it? ?kol.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Zajist?, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Pokud na to m??.
	};
};


instance DIA_Orlan_HotelZimmer(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelZimmer_Condition;
	information = DIA_Orlan_HotelZimmer_Info;
	permanent = TRUE;
	description = "Kolik si ??tuje? za pokoj?";
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelZimmer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Kolik si ??tuje? za pokoj?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if((SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Pro bratra 'Kruhu'? V?bec nic.
			Orlan_RangerHelpZimmer = TRUE;
			Orlan_KnowsSCAsRanger = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Pro kr?lovy ryt??e m?m v?dycky voln? pokoj. Samoz?ejm? zdarma.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nikdy bych si nedovolil br?t pen?ze od z?stupc? Innose.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Tady je kl?? od ho?ej??ch pokoj?. Jeden z nich si zaber.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Dej mi 50 zlat?ch na t?den a m??e? si vybrat n?kter? z pokoj?.
		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"To je zatracen? drah?.",DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Dobr?. Tady jsou prachy.",DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//Dobr?. Tady jsou prachy.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Tady m?? kl??. Pokoje jsou naho?e nad schody. Ale moc to tam nezama? a pla? v?as, jasn??
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Orlan_SCGotHotelZimmer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nem?? 50. Nejd??v pen?ze, pak z?bava.
	};
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Tak to je zatracen? drah?.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Tak to by ses m?l poohl?dnout po n??em jin?m, p??teli.
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};


var int Orlan_AngriffWegenMiete;

instance DIA_Orlan_MieteFaellig(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};
	if((Orlan_AngriffWegenMiete == TRUE) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	if((Orlan_SCGotHotelZimmer == TRUE) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7)) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(?lisn?) Jsem pot??en tvou ctihodnou n?v?t?vou. Z?sta? tu tak dlouho, jak bude? cht?t. Je to pro m? ?est.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kdy kone?n? dostanu n?jem?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Zapome? na to, u? ti ned?m ani zl?manou gre?li.",DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Tady je tv?ch 50 zlat?ch.",DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Tady je tv?ch 50 zlat?ch.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Fajn, u? bylo na?ase.
		if(DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Kde ses cel? den toulal?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Do toho ti nic nen?.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. Dobr?, stejn? to nen? moje v?c.
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Hele, pokou??? se m? podv?st? Nem?? dost pen?z ani na to, abys zaplatil tohle j?dlo. J? ti uk??u, ty, ty...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Zapome? na to. U? ti nezaplat?m.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Fajn, j? ti uk??u, ty mizernej podvodn?ku.
	Orlan_AngriffWegenMiete = TRUE;
	Info_ClearChoices(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//Tak p?ece ses uk?zal. ?ekal jsem na tebe.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co se stalo?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Sout?? v pit? skon?ila.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kdo vyhr?l?
	if((Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",ItFo_Water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tentokr?t Randolph. Rukhar musel m?t ?patnej den.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar to u? zase Randolphovi nandal. To se dalo jen o?ek?vat.
		Rukhar_Won_Wettkampf = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Tak dobr?, douf?m, ?e to bylo naposledy. O takov?hle pozdvi?en? ve sv?m dom? nestoj?m, zapi?te si to v?ichni za u?i.
	};
	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(Randolph,"Start");
	if(Hlp_IsValidNpc(Rukhar))
	{
		if(Rukhar_Won_Wettkampf == TRUE)
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharWon");
		}
		else
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharLost");
		};
	};
	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_EINGEBROCKT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Tos m? dostal do p?kn? ka?e. Te? abych Rukharovi je?t? nalil.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Pro??
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Dokud si tady po??d? ty sv? sout??e, je lep??, aby se o tom nikdo z venku nedozv?d?l. Nen? to dobr? pro obchod, jasn??
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = "Jak to jde s hospodou?";
};


func int DIA_Orlan_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Jak to jde s hospodou?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//U? to bylo lep??, v?ak v??.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Lid? u? nesahaj? do sv?ch m??c? tak ochotn?, jak by m?li.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Snad ty ?ern? m?gov? brzy odt?hnou, jinak m??u hospodu zav??t.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//U? se skoro nikdo neodv??? zaj?t a? sem.
	};
};


instance DIA_Orlan_Minenanteil(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_Minenanteil_Info;
	description = "Prod?v?? d?ln? akcie?";
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Prod?v?? d?ln? akcie?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasn?. Ode m? dostane? v?echno, tedy pokud na to m??.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_PICKPOCKET(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_Orlan_PICKPOCKET_Condition;
	information = DIA_Orlan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Orlan_PICKPOCKET_Condition()
{
	return C_Beklauen(89,260);
};

func void DIA_Orlan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,Dialog_Back,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

