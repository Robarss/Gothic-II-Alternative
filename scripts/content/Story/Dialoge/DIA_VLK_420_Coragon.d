
instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_PICKPOCKET(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 900;
	condition = DIA_Coragon_PICKPOCKET_Condition;
	information = DIA_Coragon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Coragon_PICKPOCKET_Condition()
{
	return C_Beklauen(40,45);
};

func void DIA_Coragon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,Dialog_Back,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = "Mohu tu dostat n?co k pit??";
};


func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Mohu tu dostat n?co k pit??
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//M??e? dostat dokonce n?co k j?dlu, pokud m?? zlato.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"J?dlo a pit? m??u nakoupit u hostinsk?ho Coragona.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = "Uka? mi sv? zbo??.";
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Uka? mi sv? zbo??.
};


instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "Tak co, jak jdou k?efty?";
};


func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Tak co, jak jdou k?efty?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Ani mi nemluv. Lord Andre d?v? pivo zadarmo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Nyn? sem chod? docela dost lid? z horn? ?tvti, jen tak posed?t.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//A co je s nimi?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(pobaven?) N?kte?? z t?ch chl?pk? mi opravdu lezou na nervy.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Nap??klad Valentino - nemohu toho chlapa vyst?t.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Ale nemohu si vyb?rat z?kazn?ky, pot?ebuji ka?dou minci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//V?echno mi ukradli, dokonce i m? st??bro.
};


instance DIA_Addon_Coragon_MissingPeople(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Addon_Coragon_MissingPeople_Condition;
	information = DIA_Addon_Coragon_MissingPeople_Info;
	description = "V?? n?co o zmizel?ch?";
};


func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//V?? n?co o zmizel?ch?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Sly?el jsem, ?e jsou to pov?t?inou lid? z p??stavu. Zn?m to tam a v?bec m? to nep?ekvapuje.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Dokonce Thorben ??k?, ?e mu zmizel u?edn?k.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Hakon, jeden z obchodn?k? na tr?i?ti mi ?ekl velmi podivnou historku.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//??kal, ?e v?d?val jednoho chl?pka ka?d? den. Jednoho kr?sn?ho dne prost? zmizel. Dokonce se na to ptal i domobrany.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Mnoho obyvatel pak propadlo panice. Nev?m, co si o tom myslet, ale ?ekl bych, ?e je to nesmysl.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Khorinis je tvrd? m?sto a za jeho branami na tebe ?ek? mnoho nebezpe??.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Mimo m?sto m??e? b?t p?epaden bandity nebo divok?mi zv??aty. Je to jednoduch?.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Hakon - obchodn?k na tr?i?ti - a Thorben - tesa? - by mi mohli n?co pov?d?t.");
};


instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "Co?e, okradli t??";
};


func int DIA_Coragon_Bestohlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Co?e, okradli t??
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Ano, p?ed p?r dny. Toto m?sto bylo p?ecpan? a j? jsem tu nebyl jen chvilku.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//Nebyl jsem za barem jen chvili?ku - ale t?m parchant?m ta chvilka sta?ila.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//?ekl jsem to domobran? - samoz?ejm? nic nena?li. Maj? plno pr?ce s pit?m piva venku.
	MIS_Coragon_Silber = LOG_Running;
};


var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Tady je tv? odm?na.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);
	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//Je to SPECI?LN? pivo. M?j posledn? sud.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//Toto je posledn? dou?ek.
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = "Tvoje st??bro m?m zrovna u sebe.";
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Tvoje st??bro m?m zrovna u sebe.
	if(B_GiveInvItems(other,self,ItMi_CoragonsSilber,8))
	{
		Npc_RemoveInvItems(self,ItMi_CoragonsSilber,8);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Opravdu!
	B_GivePlayerXP(XP_CoragonsSilber);
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
};


instance DIA_Coragon_Schuldenbuch(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Pod?vej, co tady m?m.";
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Pod?vej, co tady m?m.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Hmm? To je Lehmar?v dluhopis!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Co s t?m zam??l?? d?lat?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "Tady m?? svou knihu.";
};


func int DIA_Coragon_GiveBook_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Tady m?? svou knihu.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//D?ky! Zachr?nils m?! Lehmar je docela nep??jemn? pokud jde o jeho pen?ze.
	B_GivePlayerXP(XP_Schuldenbuch);
	B_Coragon_Bier();
};


instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = "Co mus?m ud?lat, abych se dostal do horn? ?tvrti?";
};


func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//Co mus?m ud?lat, abych se dostal do horn? ?tvrti?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Mus?? se st?t ob?anem. Najdi si n?jakou pr?ci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Mo?n? bys m?l promluvit s obchodn?ky, co d?laj? v doln? ??sti m?sta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//Pokud ti to nesta??, m??e? promluvit s lordem Andrem, kter? je v kas?rn?ch.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Mo?n? t? nech? st?t se m?stskou str???. Pak m??e? tak? do horn? ?tvrti.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = "Co je s t?m Valentinem?";
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//Co je s t?m Valentinem?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Je docela bohat? a nemus? pracovat. A d?v? to ka?d?mu najevo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Bez ohledu jestli t? to zaj?m? nebo ne.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Pije hodn? a odch?z? obvykle nad r?nem. A pak se pomalu vrac? zp?t do horn? ?tvrti.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//Ka?d? den.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if(Regis_Ring == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino m?l v?era t??kou noc.
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Sna?il se mi namluvit, ?e byl okraden a du?oval se, ?e zaplat? p???t?. V??n?!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//He, p?edt?m se vytahoval, kolik pen?z u sebe m?.
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//A pak se pod?val do pen??enky, hloup? se zatv??il a rozhl?dl se kolem. Pak mi ?ekl, ?e byl okraden.
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//A jak ses zachoval ty?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Dal jsem mu dal po??dnej v?prask!
};


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "Na, vezmi si tento prsten.";
};


func int DIA_Coragon_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_News) && (Npc_HasItems(other,ItRi_ValentinosRing) > 0))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Na, vezmi si tento prsten.
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Co? Nerozum?m ...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Je to Valentin?v prsten.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//P?edej ho zase n?komu, kdo mu d? v?prask p???t?.
	B_GivePlayerXP(300);
	AI_StopProcessInfos(self);
};

