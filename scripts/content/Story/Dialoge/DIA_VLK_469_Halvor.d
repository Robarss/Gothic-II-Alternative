
instance DIA_Halvor_EXIT(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 999;
	condition = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Halvor_PICKPOCKET(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 900;
	condition = DIA_Halvor_PICKPOCKET_Condition;
	information = DIA_Halvor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Halvor_PICKPOCKET_Condition()
{
	return C_Beklauen(78,150);
};

func void DIA_Halvor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,Dialog_Back,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};


instance DIA_Halvor_Hallo(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hallo_Condition;
	information = DIA_Halvor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Halvor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hej, nepot?ebuje? n?jak? ryby? Vyber si tady, ?erstv?, p??mo z mo?sk?ch hlubin!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Halvor prod?v? v p??stavu ryby.");
};


instance DIA_Halvor_TRADE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_TRADE_Condition;
	information = DIA_Halvor_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka? mi sv? ryby.";
};


func int DIA_Halvor_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Halvor_Hallo) && Wld_IsTime(5,0,20,0) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Uka? mi sv? ryby.
};


instance DIA_Halvor_Night(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Night_Condition;
	information = DIA_Halvor_Night_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Halvor_Night_Condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,ZS_Talk) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Night_Info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hej, jestli m?? z?jem o m? ryby, p?ij? do m?ho st?nku z?tra, dobr??
};


instance DIA_Addon_Halvor_MissingPeople(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 5;
	condition = DIA_Addon_Halvor_MissingPeople_Condition;
	information = DIA_Addon_Halvor_MissingPeople_Info;
	description = "?ekl bys mi n?co o ztracen?ch lidech, tedy pokud o tom n?co v???";
};


func int DIA_Addon_Halvor_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//?ekl bys mi n?co o ztracen?ch lidech, tedy pokud o tom n?co v???
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Ztracen? lid?? Chlape, tohle je p??stavi?t?. Jak asi v??, n?kdo se tu ob?as ztrat?.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Mo?e se s nik?m nepatl?. Je to tak, bu? je n?jakej ten ?tes nebo mo?sk? obluda a hned je koho hledat.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Ale ztratil se tak? kapit?n, kter? naj?mal pos?dku do velk? lodi kotv?c? tady v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//A kdy? u? nebyli dobrovoln?ci vyplul, po chv?li se n?co stalo a po lodi ani vidu ani slechu.
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,Dialog_Back,DIA_Addon_Halvor_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Jak? lo? to byla?",DIA_Addon_Halvor_MissingPeople_schiff);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"V?? n?co o lidech, kte?? zmizeli?",DIA_Addon_Halvor_MissingPeople_wer);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"A TY postr?d?? n?koho?",DIA_Addon_Halvor_MissingPeople_you);
};

func void DIA_Addon_Halvor_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
};

func void DIA_Addon_Halvor_MissingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//V?? n?co o lidech, kte?? zmizeli?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Nic moc. Zkus se zeptat ryb???.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Halvorovi nen? moc do ?e?i, proto m? poslal k ryb???m.");
};

func void DIA_Addon_Halvor_MissingPeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Jak? lo? to byla?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Dobr? ot?zka. Dlouho tu ??dn? lod? nebyly.
};

func void DIA_Addon_Halvor_MissingPeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//A TY postr?d?? n?koho?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//J?? Ne.
};


instance DIA_Halvor_MESSAGE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_MESSAGE_Condition;
	information = DIA_Halvor_MESSAGE_Info;
	permanent = FALSE;
	description = "M?m dojem, ?e tenhle kousek pap?ru pat?? tob?.";
	trade = FALSE;
};


func int DIA_Halvor_MESSAGE_Condition()
{
	if(Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Halvor_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//M?m dojem, ?e tenhle kousek pap?ru pat?? tob?.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Co...? Uka?, pod?v?m se.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(pot? se) Ehm... Dobr?, nikomu o tom ani muk - ehm... poslouchej. Mus?m se zbavit zbo??, co jsem z?skal od bandit?.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(usp?chan?) Ale nen? ??dn? d?vod j?t p??mo za domobranou, jasn?? Jsem si jist, ?e se n?jak dohodneme, co?
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Tak to mi ud?lej nab?dku.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Vypad? to, ?e pat??? do basy.",DIA_Halvor_MESSAGE_PRISON);
};

func void DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Tak to mi ud?lej nab?dku.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Dobr?. N?co ti pov?m. Prod?v?m v?c ne? jen ryby.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Kdy? mi d?? ten sm??n? kousek pap?ru a, ehm... zapomene? na tu v?c, m??eme se st?t obchodn?mi partnery.
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Dobr?, ujedn?no.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Vypad? to, ?e pat??? do basy.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice(DIA_Halvor_MESSAGE,"V??n?? Co by to tak mohlo b?t za zbo???",DIA_Halvor_MESSAGE_DEAL);
};

func void DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Vypad? to, ?e pat??? do basy.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Ne, po?kej, to nem??e? ud?lat! V?dy? p?ece nejsem, v?dy? v??... nic jin?ho ne? mal? ryba.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//To sis m?l rozmyslet d??v. Te? m?m v ?myslu t? nahl?sit lordu Andremu.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Toho bude? litovat.
	Betrayal_Halvor = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//V??n?? Co by to tak mohlo b?t za zbo???
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Dobr?, m??u ti nab?dnout docela zvl??tn? ryby, v?ak v??. Ne jenom ty oby?ejn?, co se jed?.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//M?? na mysli takov?, ve kter?ch jsou ukryt? tv? tajn? zpr?vy?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Jo, trefils. M?m p?r takov?ch... rybek.
};

func void DIA_Halvor_MESSAGE_Okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Dobr?, dohodnuto. Nech?me si to mal? tajemstv? pro sebe.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//D?ky. Zase se zastav, a? bude? pobl??. Ur?it? pro tebe budu m?t n?co zaj?mav?ho.
	B_GiveInvItems(other,self,ItWr_HalvorMessage,1);
	Npc_RemoveInvItems(self,ItWr_HalvorMessage,1);
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_Ringfisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	Info_ClearChoices(DIA_Halvor_MESSAGE);
};


instance DIA_Halvor_Zeichen(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent = FALSE;
	description = "(P?edv?st zlod?jsk? sign?l.)";
};


func int DIA_Halvor_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//V?m. Nep?i?el jsi jen nakupovat ryby.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(potichu) Ud?l?m ti nab?dku. Jestli m?? n?jak? st??brn? t?cy nebo poh?ry, vezmu si je od tebe za dobrou cenu.
	CreateInvItems(self,ItKE_lockpick,20);
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"Halvor nakupuje st??brn? tal??e a kalichy za daleko lep?? cenu ne? ostatn? obchodn?ci.");
};


instance DIA_Halvor_Hehlerei(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent = TRUE;
	description = "(Prodat star? tall??e a kalichy.)";
};


func int DIA_Halvor_Hehlerei_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Halvor_Zeichen) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0;
	if(Halvor_Day != Wld_GetDay())
	{
		if((Npc_HasItems(other,ItMi_SilverPlate) >= 1) || (Npc_HasItems(other,ItMi_SilverCup) >= 1) || (Npc_HasItems(other,ItMi_SilverRing) >= 1) || (Npc_HasItems(other,ItMi_SilverChalice) >= 1) || (Npc_HasItems(other,ItMi_JeweleryChest) >= 1) || (Npc_HasItems(other,ItMi_SilverCandleHolder) >= 1))
		{
			Halvor_Score = (Npc_HasItems(other,ItMi_SilverPlate) * (Value_SilverPlate / 2)) + (Npc_HasItems(other,ItMi_SilverCup) * (Value_SilverCup / 2)) + (Npc_HasItems(other,ItMi_SilverRing) * (Value_SilverRing / 2)) + (Npc_HasItems(other,ItMi_SilverChalice) * (Value_SilverChalice / 2)) + (Npc_HasItems(other,ItMi_JeweleryChest) * (Value_JeweleryChest / 2)) + (Npc_HasItems(other,ItMi_SilverCandleHolder) * (Value_SilverCandleHolder / 2));
			if(Halvor_Score <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//Za v?echno, co m??, ti d?m...
				B_Say_Gold(self,other,Halvor_Score);
				Info_ClearChoices(DIA_Halvor_Hehlerei);
				Info_AddChoice(DIA_Halvor_Hehlerei,"Dobr?, prod?no.",DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice(DIA_Halvor_Hehlerei,"Budu o tom p?em??let.",DIA_Halvor_Hehlerei_Ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//P?inesl jsi moc zbo??. Nem??u ti d?t tolik zlata nejednou.
				Info_ClearChoices(DIA_Halvor_Hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Vra? se, a? bude? m?t n?jak? st??brn? podnosy nebo poh?ry.
			Info_ClearChoices(DIA_Halvor_Hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//M??e? se toho st??bra zbavit z?tra. Dneska je moc brzo.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Promi?, dneska u? ??dn? obchody. Vra? se z?tra, dobr??
	};
};

func void DIA_Halvor_Hehlerei_Annehmen()
{
	var int amount;
	var string concatText;
	amount = Npc_HasItems(other,ItMi_SilverPlate) + Npc_HasItems(other,ItMi_SilverCup) + Npc_HasItems(other,ItMi_SilverRing) + Npc_HasItems(other,ItMi_SilverChalice) + Npc_HasItems(other,ItMi_JeweleryChest) + Npc_HasItems(other,ItMi_SilverCandleHolder);
	concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItems(other,ItMi_SilverCup,Npc_HasItems(other,ItMi_SilverCup));
	Npc_RemoveInvItems(other,ItMi_SilverPlate,Npc_HasItems(other,ItMi_SilverPlate));
	Npc_RemoveInvItems(other,ItMi_SilverRing,Npc_HasItems(other,ItMi_SilverRing));
	Npc_RemoveInvItems(other,ItMi_SilverChalice,Npc_HasItems(other,ItMi_SilverChalice));
	Npc_RemoveInvItems(other,ItMi_JeweleryChest,Npc_HasItems(other,ItMi_JeweleryChest));
	Npc_RemoveInvItems(other,ItMi_SilverCandleHolder,Npc_HasItems(other,ItMi_SilverCandleHolder));
	B_GiveInvItems(self,other,ItMi_Gold,Halvor_Score);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Dobr?, prod?no.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Ud?lali jsme dneska dobrej k?eft. Lep?? to bude nejd??v z?tra, jinak by n?kdo mohl dostat podez?en?, v?ak v??.
	Halvor_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

func void DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};


instance DIA_Halvor_Crew(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 51;
	condition = DIA_Halvor_Crew_Condition;
	information = DIA_Halvor_Crew_Info;
	permanent = FALSE;
	description = "Sh?n?m pos?dku.";
};


func int DIA_Halvor_Crew_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Crew_Info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Sh?n?m pos?dku.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//Ale jak se chce? odsud dostat?
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,"To je ?ist? moje v?c.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice(DIA_Halvor_Crew,"Hodl?m z?skat lo?.",DIA_Halvor_Crew_StealShip);
};

func void DIA_Halvor_Crew_MyThing()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//To je ?ist? moje v?c.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Jak je libo. To opravdu nen? moje v?c.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Tak jde? do toho?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice(DIA_Halvor_Crew,"M??e? mi pomoct?",DIA_Halvor_Crew_HelpMe);
};

func void DIA_Halvor_Crew_StealShip()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Hodl?m z?skat lo?.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Jo, jasn?. Jinak se? zdravej? Paladinov? s tebou ud?laj kr?tkej proces, a? na to p?ijdou.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Jak je libo - neriskuje? m?j ?ivot.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Tak jde? do toho?",DIA_Halvor_Crew_JoinMe);
	if(Npc_IsDead(Jack) == FALSE)
	{
		Info_AddChoice(DIA_Halvor_Crew,"M??e? mi pomoct?",DIA_Halvor_Crew_HelpMe);
	};
};

func void DIA_Halvor_Crew_JoinMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Tak jde? do toho?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Ne, m?m dojem, ?e ne. M?m tady spoustu pr?ce a up??mn?, netou??m zrovna po tom, abych potkal otrok??skou gal?ru plnou sk?et?.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Ale p?eju ti hodn? ?t?st?.
};

func void DIA_Halvor_Crew_HelpMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//M??e? mi pomoct?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//J? na tohle nejsem ten pravej ?lov?k. Ale zajdi si promluvit s Jackem. M?l by se poflakovat n?kde tady po p??stavu. On bude v?d?t nejl?p, co na tu plavbu bude? pot?ebovat.
};

func void DIA_Halvor_Crew_BACK()
{
	Info_ClearChoices(DIA_Halvor_Crew);
};

