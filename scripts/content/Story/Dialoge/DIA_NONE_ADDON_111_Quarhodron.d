
instance DIA_Addon_Quarhodron_EXIT(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 999;
	condition = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Quarhodron_Hello(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Hello_Condition;
	information = DIA_Addon_Quarhodron_Hello_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Quarhodron_Hello_NoPerm;

func int DIA_Addon_Quarhodron_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_Info()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Pro? ru??? m?j klid, str??ce?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//(otr?ven?) ?ekni mi, co chce??
		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Co se skr?v? v Adanov? chr?mu?",DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"N?kdo vstoupil do Adanova chr?mu.",DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Ud?l mi vstup do Adanova chr?mu.",DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Zem? je rozbita zem?t?esen?mi.",DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems(hero,ItWr_Addon_SUMMONANCIENTGHOST,1);
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//(hlasit?) Bengla anthani, Osiri?
		AI_StopProcessInfos(self);
	};
};


var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;

func void B_Quarhodron_Hello_KommZumPunkt()
{
	if((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3) && (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"N?co od tebe pot?ebuji.",DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Zem? je rozbita zem?t?esen?mi. Pokud nic neud?l?me, cel? ostrov se potop?.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Tady nen? nic, co bychom mohli ud?lat.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Adanos?v hn?v p?i?el na Jharkendar, aby ztrestal bezv?rce.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//N?kdo vstoupil do Adanosova chr?mu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Nesmysl. S?m jsem zape?etil vstup. Je nemo?n? se dostat dovnit?.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Je tak?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Ud?l mi vstup do Adanosova chr?mu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Chr?m z?stane uzav?en nav?ky, jak rada na??dila.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co se skr?v? v Adanosov? chr?mu?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//M? nejv?t?? ho?e, m? nejv?t?? zklam?n?.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//N?co od tebe pot?ebuji.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Mu? s tv?m postaven?m by se mnou nem?l takto mluvit.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nem??u se zbavit pocitu, ?e nejsi ten, za koho se vyd?v??.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Jestli chce? mou pomoc, bude? muset prvn? zodpov?d?t n?kolik ot?zek.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpov?d? na m? ot?zky m? ujist??, ?e neodhaluji n?co ciz?ho.
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Quarhodron mi pom??e a?, co zodpov?m n?jak? obt??n? ot?zky. Mus?m je zodpov?d?t spr?vn?, aby mi pomohl.");
	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};


instance DIA_Addon_Quarhodron_Fragen(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Fragen_Condition;
	information = DIA_Addon_Quarhodron_Fragen_Info;
	permanent = TRUE;
	description = "Ptej se na ot?zky.";
};


func int DIA_Addon_Quarhodron_Fragen_Condition()
{
	if(QuarhodronIstZufrieden == FALSE)
	{
		return TRUE;
	};
};


var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed()
{
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Tv? odpov?di jsou chybn? jako tv? z?m?ry.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nepom??u ti.
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	Log_AddEntry(TOPIC_Addon_Quarhodron," --- QUARHODRONOVY OT?ZKY ---");
	if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else if((Quarhodrons_NextQuestion == 1) && (Quarhodrons_RichtigeAntworten == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nev???m ti.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Mysl?m, ?e by ses m?l vr?tit, jakmile se rozhodne? mluvit pravdu.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Quarhodrons_NextQuestion == 1)
		{
			if(B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(p?em??liv?) Schopnost str??ce smrti ti dovolila probudit m?, nen?-li pravda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Jestli jsi ten, za koho se vyd?v??, m?l bys b?t schopen zodpov?d?t v?echny m? ot?zky.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Nehled? na jedno ...
				B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
			};
			Quarhodrons_NextQuestion = 2;
		};
		if(Quarhodrons_NextQuestion == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kdo zape?etil port?l, kter? chr?nil sv?t p?ed zlem?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo zape?etil port?l chr?n?c? sv?t p?ed zlem? ---");
			Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
		}
		else if(Quarhodrons_NextQuestion == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kdo zm?rn? utrpen? a o?et?uje nemocn??
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo zm?r?uje utrpen? a o?et?uje nemocn? v Jharkendaru? --- ");
			Quarhodrons_NextQuestion = 7;
		}
		else if(Quarhodrons_NextQuestion == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kdo m? kone?n? slovo v rad? p?ti?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo m? kone?n? slovo v rad? p?ti? --- ");
			Quarhodrons_NextQuestion = 6;
		}
		else if(Quarhodrons_NextQuestion == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kdo je zodpov?dn? za zlo, kter? n?s p?epadlo?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo je zodpov?dn? za zlo, kter? n?s p?epadlo? --- ");
			Quarhodrons_NextQuestion = 5;
		}
		else if(Quarhodrons_NextQuestion == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kdo mi m??e d?t p??m? rozkaz?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo mi m??e d?t p??m? rozkaz? --- ");
			Quarhodrons_NextQuestion = 4;
		}
		else if(Quarhodrons_NextQuestion == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kdo kdysi chr?nil lid Jharkendaru p?ed nep??telsk?mi ?toky?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo kdysi chr?nil lid Jharkendaru p?ed nep??telsk?mi ?toky? --- ");
			Quarhodrons_NextQuestion = 3;
		};
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
		if(Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"To nem??u p?esn? ??ct.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		}
		else
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Nev?m.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		};
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"U?enci",DIA_Addon_Quarhodron_Fragen_gele);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Str??ci smrti",DIA_Addon_Quarhodron_Fragen_totenw);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Kn?zi",DIA_Addon_Quarhodron_Fragen_prie);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"V?le?nick? kasta",DIA_Addon_Quarhodron_Fragen_warr);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"L??itel?",DIA_Addon_Quarhodron_Fragen_heiler);
	};
};


var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_RichtigeAntworten = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Ptej se na ot?zky.
	if(DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//J? jsem Quarhodron, b?val? v?le?n?k Jharkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Vzbudils m?.
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Ke kter? kast? jsi pat?il?
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//V?le?nick? kasta
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 3)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	if(Quarhodrons_NextQuestion == 5)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Kn???.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 4)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_gele()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//U?enci
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 6)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_totenw()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//K str??c?m smrti
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_heiler()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//L??itel?
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 7)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_NoPlan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Nev?m
	if((Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt) && (Quarhodrons_RichtigeAntworten >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dob?e, v???m ti a poskytnu ti svou pomoc.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Pak nepl?tvej m?m ?asem.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Quarhodron_GibMirKey(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_GibMirKey_Condition;
	information = DIA_Addon_Quarhodron_GibMirKey_Info;
	description = "(po?aduj kl?? od chr?mu)";
};


func int DIA_Addon_Quarhodron_GibMirKey_Condition()
{
	if(QuarhodronIstZufrieden == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_GibMirKey_Info()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Sly?, n?kdo se dostal svou vlastn? moc? do Adansoova chr?mu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Jestli mi nepom??e? dostat se dovnit?, pak bude pravd?podobn? p??li? pozd? a toto zde p?jde k ?ertu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//To nem??e b?t pravda! Nejvy??? kn?z KHARDIMON a J? jsme jedin? v JHARKENDARU, kte?? v?, jak otev??t port?l v Adanosov? chr?mu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Dobr?. Zd? se, ?e tv?j kamar?d KHARDIMON asi pov?dal.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//??k?m, ?e br?na je otev?ena. Vid?l jsem to na vlastn? o?i..
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobr?, v tv?m hlasu je sly?et pravda. Nebudu d?le pochybovat o tv?ch slovech.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Douf?m v to.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Vezmi nyn? slova, kter? ti umo?n? vstup. Jsou naps?na na kamenn? desce. ?ekni slova p?ed zav?en?mi dve?mi chr?mu a m?ly by se otev??t.
	CreateInvItems(self,ItMi_TempelTorKey,1);
	B_GiveInvItems(self,other,ItMi_TempelTorKey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//(polosly?iteln?) M?j ?as je u konce, u? ti d?le nomohu b?t n?pomocen.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//(polosly?iteln?) Ale opatrn?. Mysli na Adanosovy komnaty. Nebo to bude tv? jist? smrt.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Zatracen?. CO JSOU tyto Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//(polosly?iteln?) Moje s?ly jsou u konce. Sbohem. M?li bychom se op?t setkat v kr?lovstv? smrti ...
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Quarhodron mi dal kamennou desku, kter? otev?r? br?nu v Adanov? chr?mu.");
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,"Quarhodron zm?nil 'Adanosovy Komory' a ??kal, ?e bych m?l b?t opatrn?. Mus?m zjistit, co to znamen?, proto?e nechci skon?it v Adanov? chr?mu.");
	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};

