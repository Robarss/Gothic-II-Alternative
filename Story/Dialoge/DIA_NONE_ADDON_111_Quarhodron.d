
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
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Proč rušíš můj klid, strážce?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//(otráveně) Řekni mi, co chceš?
		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Co se skrývá v Adanově chrámu?",DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Někdo vstoupil do Adanova chrámu.",DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Uděl mi vstup do Adanova chrámu.",DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Země je rozbita zemětřeseními.",DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems(hero,ItWr_Addon_SUMMONANCIENTGHOST,1);
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//(hlasitě) Bengla anthani, Osiri?
		AI_StopProcessInfos(self);
	};
};


var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;

func void B_Quarhodron_Hello_KommZumPunkt()
{
	if((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3) && (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Něco od tebe potřebuji.",DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Země je rozbita zemětřeseními. Pokud nic neuděláme, celý ostrov se potopí.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Tady není nic, co bychom mohli udělat.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Adanosův hněv přišel na Jharkendar, aby ztrestal bezvěrce.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Někdo vstoupil do Adanosova chrámu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Nesmysl. Sám jsem zapečetil vstup. Je nemožné se dostat dovnitř.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Je tak?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Uděl mi vstup do Adanosova chrámu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Chrám zůstane uzavřen navěky, jak rada nařídila.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co se skrývá v Adanosově chrámu?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//Mé největší hoře, mé největší zklamání.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//Něco od tebe potřebuji.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Muž s tvým postavením by se mnou neměl takto mluvit.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nemůžu se zbavit pocitu, že nejsi ten, za koho se vydáváš.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Jestli chceš mou pomoc, budeš muset prvně zodpovědět několik otázek.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpovědí na mé otázky mě ujistíš, že neodhaluji něco cizího.
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Quarhodron mi pomůže až, co zodpovím nějaké obtížné otázky. Musím je zodpovědět správně, aby mi pomohl.");
	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};


instance DIA_Addon_Quarhodron_Fragen(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Fragen_Condition;
	information = DIA_Addon_Quarhodron_Fragen_Info;
	permanent = TRUE;
	description = "Ptej se na otázky.";
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
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Tvé odpovědi jsou chybné jako tvé záměry.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nepomůžu ti.
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	Log_AddEntry(TOPIC_Addon_Quarhodron," --- QUARHODRONOVY OTÁZKY ---");
	if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else if((Quarhodrons_NextQuestion == 1) && (Quarhodrons_RichtigeAntworten == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nevěřím ti.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Myslím, že by ses měl vrátit, jakmile se rozhodneš mluvit pravdu.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Quarhodrons_NextQuestion == 1)
		{
			if(B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(přemýšlivě) Schopnost strážce smrti ti dovolila probudit mě, není-li pravda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Jestli jsi ten, za koho se vydáváš, měl bys být schopen zodpovědět všechny mé otázky.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Nehledě na jedno ...
				B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
			};
			Quarhodrons_NextQuestion = 2;
		};
		if(Quarhodrons_NextQuestion == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kdo zapečetil portál, který chránil svět před zlem?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo zapečetil portál chránící svět před zlem? ---");
			Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
		}
		else if(Quarhodrons_NextQuestion == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kdo zmírní utrpení a ošetřuje nemocné?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo zmírňuje utrpení a ošetřuje nemocné v Jharkendaru? --- ");
			Quarhodrons_NextQuestion = 7;
		}
		else if(Quarhodrons_NextQuestion == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kdo má konečné slovo v radě pěti?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo má konečné slovo v radě pěti? --- ");
			Quarhodrons_NextQuestion = 6;
		}
		else if(Quarhodrons_NextQuestion == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kdo je zodpovědný za zlo, které nás přepadlo?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo je zodpovědný za zlo, které nás přepadlo? --- ");
			Quarhodrons_NextQuestion = 5;
		}
		else if(Quarhodrons_NextQuestion == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kdo mi může dát přímý rozkaz?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo mi může dát přímý rozkaz? --- ");
			Quarhodrons_NextQuestion = 4;
		}
		else if(Quarhodrons_NextQuestion == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kdo kdysi chránil lid Jharkendaru před nepřátelskými útoky?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo kdysi chránil lid Jharkendaru před nepřátelskými útoky? --- ");
			Quarhodrons_NextQuestion = 3;
		};
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
		if(Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"To nemůžu přesně říct.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		}
		else
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Nevím.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		};
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Učenci",DIA_Addon_Quarhodron_Fragen_gele);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Strážci smrti",DIA_Addon_Quarhodron_Fragen_totenw);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Knězi",DIA_Addon_Quarhodron_Fragen_prie);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Válečnická kasta",DIA_Addon_Quarhodron_Fragen_warr);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Léčitelé",DIA_Addon_Quarhodron_Fragen_heiler);
	};
};


var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_RichtigeAntworten = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Ptej se na otázky.
	if(DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//Já jsem Quarhodron, bývalý válečník Jharkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Vzbudils mě.
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Ke které kastě jsi patřil?
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Válečnická kasta
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Kněží.
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//Učenci
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//K strážcům smrti
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//Léčitelé
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Nevím
	if((Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt) && (Quarhodrons_RichtigeAntworten >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dobře, věřím ti a poskytnu ti svou pomoc.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Pak neplýtvej mým časem.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Quarhodron_GibMirKey(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_GibMirKey_Condition;
	information = DIA_Addon_Quarhodron_GibMirKey_Info;
	description = "(požaduj klíč od chrámu)";
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Slyš, někdo se dostal svou vlastní mocí do Adansoova chrámu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Jestli mi nepomůžeš dostat se dovnitř, pak bude pravděpodobně příliš pozdě a toto zde půjde k čertu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//To nemůže být pravda! Nejvyšší kněz KHARDIMON a JÁ jsme jediní v JHARKENDARU, kteří ví, jak otevřít portál v Adanosově chrámu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Dobrá. Zdá se, že tvůj kamarád KHARDIMON asi povídal.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//Říkám, že brána je otevřena. Viděl jsem to na vlastní oči..
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobrá, v tvém hlasu je slyšet pravda. Nebudu déle pochybovat o tvých slovech.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Doufám v to.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Vezmi nyní slova, která ti umožní vstup. Jsou napsána na kamenné desce. Řekni slova před zavřenými dveřmi chrámu a měly by se otevřít.
	CreateInvItems(self,ItMi_TempelTorKey,1);
	B_GiveInvItems(self,other,ItMi_TempelTorKey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//(poloslyšitelně) Můj čas je u konce, už ti déle nomohu být nápomocen.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//(poloslyšitelně) Ale opatrně. Mysli na Adanosovy komnaty. Nebo to bude tvá jistá smrt.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Zatraceně. CO JSOU tyto Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//(poloslyšitelně) Moje síly jsou u konce. Sbohem. Měli bychom se opět setkat v království smrti ...
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Quarhodron mi dal kamennou desku, která otevírá bránu v Adanově chrámu.");
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,"Quarhodron zmínil 'Adanosovy Komory' a říkal, že bych měl být opatrný. Musím zjistit, co to znamená, protože nechci skončit v Adanově chrámu.");
	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};

