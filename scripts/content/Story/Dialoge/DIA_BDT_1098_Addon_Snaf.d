
instance DIA_Addon_Snaf_EXIT(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 999;
	condition = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Snaf_PICKPOCKET(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 900;
	condition = DIA_Addon_Snaf_PICKPOCKET_Condition;
	information = DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	return C_Beklauen(49,56);
};

func void DIA_Addon_Snaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,Dialog_Back,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};

func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};


instance DIA_Addon_Snaf_Hi(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 1;
	condition = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Snaf_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chce? dostat naj?st nebo po hub?? Co chce??
};


instance DIA_Addon_Snaf_Cook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent = FALSE;
	description = "Co chutn?ho m???";
};


func int DIA_Addon_Snaf_Cook_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_Cook_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Co chutn?ho m???
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Chci vyzkou?et novej recept - 'Ohniv? maso ?iznut? silnou om??kou'.
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Ohniv? maso?",DIA_Addon_Snaf_Cook_FEUER);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Kladivov? om??ka?",DIA_Addon_Snaf_Cook_HAMMER);
};

func void DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ohniv? maso?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//K?upav? lehce pe?en? maso, sm?ch?no s ohniv?m b?l?m.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Neboj se - Ingredience u? m?m.
};

func void DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Kladivov? om??ka?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Om??ka z fakt tvrd?ho destil?tu. Dostal jsem ten recept od chl?pka jm?nem Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Obstarej si p??sady a propa?uj lik?r do laborato?e naho?e, potom ud?lej om??ku. Co mysl???
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Nem?m na to ?as.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Dob?e, ud?l?m to.",DIA_Addon_Snaf_Cook_YES);
};

func void DIA_Addon_Snaf_Cook_NO()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Na to nem?m ?as.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dob?e, zapome? na to.
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
};

func void DIA_Addon_Snaf_Cook_YES()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Dob?e, ud?l?m to.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Vypad? to dob?e. Tady m?? recept.
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_Running;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Log_CreateTopic(Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_Running);
	B_LogEntry(Topic_Addon_Hammer,"Snaf pot?ebuje destil?t pro jeho om??ku. Dal mi recept na kladivov? destil?t, p?ipravovan? na alchymistick?m stole.");
};


var int Snaf_Tip_Kosten;

instance DIA_Addon_Snaf_Booze(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent = FALSE;
	description = "Ud?lal jsem ten destil?t.";
};


func int DIA_Addon_Snaf_Booze_Condition()
{
	if((Npc_HasItems(other,ItFo_Addon_LousHammer) >= 1) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Booze_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Ud?lal jsem ten destil?t.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Skv?le, te? to dokon??m.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Te? m??e? jednu porci ochutnat. Zes?l? ti to pa?e.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Po?kej, a? bude? p??st? n?co pot?ebovat ... v?echny informace jsou zdarma.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Loushammer);
};


instance DIA_Addon_Snaf_Attentat(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 4;
	condition = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent = FALSE;
	description = "Co v?? o t? vra?d??";
};


func int DIA_Addon_Snaf_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co v?? o t? vra?d??
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Esteban?v p??pad?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//V?? odkud v?tr vane. Barman pozoruje v?echno, ale k nikomu se nep??d?v? ...
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Tak mi aspo? ?ekni, kde se?enu infromace",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Kdybys byl j?, co bys ud?lal?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Tak?e n?co v???",DIA_Addon_Snaf_Attentat_Something);
};

func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//Tak?e n?co v???
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//TO jsem ne?ekl.
};

func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Tak mi aspo? ?ekni, kde z?skat informace.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//M?j bo?e! To by bylo stejn?! Zapome? na to.
};

func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Kdybys byl j?, co bys ud?lal?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Sna?il bych si vzpomenout, co v?? o ??fovi..
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Zaprv?. Byl to samoz?ejm? jeden z bandit?, to znamen?, je tady v t?bo?e.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Za druh?: Od t? doby, co je doty?n? zde v t?bo?e, t? sleduje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Za t?et?: Bude-li p?esv?d?en?, ?e jsi na Estebanov? stran?, neodkryje svou toto?nost.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Zaj?mav? ot?zka je, jak? jsou tv? ?ance naj?t zam?stnavatele.
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
};


instance DIA_Addon_Snaf_Abrechnung(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 5;
	condition = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent = TRUE;
	description = "Jak? jsou m? ?ance naj?t ??fa?";
};


func int DIA_Addon_Snaf_Abrechnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && (MIS_Judas == LOG_Running) && (Huno_zuSnaf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//Jak? jsou m? ?ance naj?t ??fa?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm ...
	if((Senyan_Erpressung == LOG_Running) && !Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//Velmi ?patn?. N?kte?? chl?pci si v?imli, ?e jsi se motal kolem Seynana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//M?l bys ses vzd?t sv?ho kontaktu, jinak nem?? ??dnou ?anci, n?jit ??fa vra?dy.
		if(Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry(Topic_Addon_Senyan,"M?l bych ukon?it Senyanovu pr?ci. Nicm?n? bylo by nemoudr? za?to?it na n?j hlava nehlava. M?l bych s n?m naposled promluvit.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if(Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//M?l bys sejmout jednoho z Estebanov?ch lid?. ?lov?k kter?ho hled??, bude v??it, ?e jsi na jeho stran?.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale jen tak svou identitu neuk??e. Mus?? toho rozlousknout mnohem v?c.
	}
	else
	{
		if(Finn_Petzt == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Vypad? to ?e Finn je velmi rozru?en, pot? co jsi s n?m mluvil.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A v?ichni v?, ?e m? bl?zko k Estebanovi.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znamen?, ?e jsi ?ekl n?co, co necht?l sly?et.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//?lov?k kter?ho hled??, bude velmi pobaven? ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Ale riskujeme ?ivot, kdy? pob???me za Estebanem - (ironicky) ale to v?? s?m.
		};
		if(Finn_TellAll == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Vypad? to, ?e bys m?l ??ct Finnovi, ?e pracuje? pro Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nev?m co d?l??, ale ?lov?k kter?ho hled??, si bude d?vat v?t?? pozor.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//Mo?n? je v?echno.
		};
	};
	if(Snaf_Rechnung == FALSE)
	{
		if(Snaf_Einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//D?ky.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(drsn?) Hej! Ne?eknu ti nic ne? to, co jsi v?d?l p?edt?m, ch?pe??
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//V?d?l jsem to ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//P?esn?.
		};
	};
};


instance DIA_Addon_Snaf_HOCH(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent = FALSE;
	description = "Huno ??kal, ?e tu n?koho potk?m ...";
};


func int DIA_Addon_Snaf_HOCH_Condition()
{
	if(Huno_zuSnaf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Poslal m? Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Vypad? to, ?e jsi na?el sv?ho ?lov?ka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Jdi nahoru, n?kdo tam na tebe ?ek?.
	AI_StopProcessInfos(self);
	AI_Teleport(Fisk,"BL_INN_UP_06");
	B_StartOtherRoutine(Fisk,"MEETING");
	B_GivePlayerXP(XP_Addon_Auftraggeber);
};


var int Kosten_Einmal;

instance DIA_Addon_Snaf_People(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent = TRUE;
	description = "Co si lid? mysl? o Estebanovi?";
};


func int DIA_Addon_Snaf_People_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_People_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co si lid? mysl? o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//Mus?? to up?esnit ...
	if((Kosten_Einmal == FALSE) && (MIS_SnafHammer != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Ka?d? informace n?co stoj?.
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Kolik?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 zlat?ch.
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Snaf_People);
	Info_AddChoice(DIA_Addon_Snaf_People,Dialog_Back,DIA_Addon_Snaf_People_BACK);
	Info_AddChoice(DIA_Addon_Snaf_People,"Paul.",DIA_Addon_Snaf_People_Paul);
	Info_AddChoice(DIA_Addon_Snaf_People,"Huno.",DIA_Addon_Snaf_People_Huno);
	Info_AddChoice(DIA_Addon_Snaf_People,"Fisk.",DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice(DIA_Addon_Snaf_People,"Emilio.",DIA_Addon_Snaf_People_Emilio);
	if(!Npc_IsDead(Senyan))
	{
		Info_AddChoice(DIA_Addon_Snaf_People,"Senyan.",DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice(DIA_Addon_Snaf_People,"Lennar.",DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice(DIA_Addon_Snaf_People,"Finn.",DIA_Addon_Snaf_People_Finn);
};

func void B_Addon_Snaf_NotEnough()
{
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nem?? dost pen?z, chlap?e!
};

func void DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_People);
};

func void DIA_Addon_Snaf_People_Paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//Co Paul?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Mysl?m, ?e nem? Estabana moc v l?sce. Od t? doby, co pracuje pro Huna, nem??e u? do dolu.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Co si o Estebanovi mysl? Huno?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//?! Huno. Nev?m o n?m skoro nic.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(?sm?v) Tahle informace je zdarma.
};

func void DIA_Addon_Snaf_People_Fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co Fisk?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk je Fisk. Plat? svou ??stku Estebanovi a d?l? se o jeho zbo??, kter? v?t?inou dostane od pir?t?.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Mysl?m, ?e se o Estebana nezaj?m?.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Emilio. Co ten si mysl? o Estebanovi?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Mysl?m, ?e by nenosil kytky na Esteban?v hrob, douf?m ?e v??, co t?m mysl?m.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//Co Senyan?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan je jeden z Estebanov?ch chl?pk?. Chv?li pro n?j pracuje.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co si Lennar mysl? o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//Pokud v?m, Lennar NEMYSL?.
};

func void DIA_Addon_Snaf_People_Finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co Finn?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobrej kop??. M? na zlato ?uch.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Esteban d?v? p?ednost z tohoto d?vodu jemu. Mysl?m, ?e si navz?jem celkem rozumn?j?.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};


instance DIA_ADDON_SNAF_TEACH(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 7;
	condition = dia_addon_snaf_teach_condition;
	information = dia_addon_snaf_teach_info;
	permanent = 0;
	description = "M??e? m? nau?it n?co o va?en??";
};


func int dia_addon_snaf_teach_condition()
{
	return TRUE;
};

func void dia_addon_snaf_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_teach_15_00");	//M??e? m? nau?it n?co o va?en??
	AI_Output(self,other,"DIA_Addon_Snaf_teach_01_01");	//Nau??m t? sv?j recept na m?j specialn? pokrm.
	Log_CreateTopic(TOPIC_COOKJ,LOG_NOTE);
	B_LogEntry(TOPIC_COOKJ,"Snaf m? m??e nau?it va?it specialn? pokrm.");
};


instance DIA_ADDON_SNAF_LEARN(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = dia_addon_snaf_learn_condition;
	information = dia_addon_snaf_learn_info;
	permanent = 5;
	description = "Specialn? pokrm ze ?rav?ch ?t?nic (cena: 5 VB)";
};


func int dia_addon_snaf_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_snaf_teach) && (KNOWS_COOKSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_learn_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Learn_15_00");	//Nau? m? va?it Specialn? pokrm ze ?rav?ch ?t?nic.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Addon_Snaf_Learn_12_01");	//Tak a tet ti uk??u jak to uva???, sleduj pozorn?.
		Log_CreateTopic(TOPIC_COOKJ,LOG_NOTE);
		B_LogEntry(TOPIC_COOKJ,"Um?m uva?it: Specialn? pokrm ze ?rav?ch ?t?nic.");
		B_LogEntry(TOPIC_COOKJ,"Ingredience jsou: 3x ?rav? ?t?nice, 20x boruvky, 1x dra?? ko?en.");
		KNOWS_COOKSTR = TRUE;
		PrintScreen("Nau?il ses uva?it: Specialn? pokrm ze ?rav?ch ?t?nic",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Addon_Snaf_Himself(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 7;
	condition = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent = FALSE;
	description = "Co si mysl?? o Estebanovi?";
};


func int DIA_Addon_Snaf_Himself_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Himself_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//Co si mysl?? o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Ten kdo o n?m mluv?, bude brzo mrtvej ...
};


instance DIA_Addon_Snaf_PERM(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent = TRUE;
	description = "Jak to jde s tv?m kr?mem?";
};


func int DIA_Addon_Snaf_PERM_Condition()
{
	if(Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak to jde s tv?m kr?mem?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Dob?e! Estebanova smrt je pro p?r lid? d?vod k oslav? ...
};

