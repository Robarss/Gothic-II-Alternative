
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
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chceš dostat najíst nebo po hubě? Co chceš?
};


instance DIA_Addon_Snaf_Cook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent = FALSE;
	description = "Co chutnýho máš?";
};


func int DIA_Addon_Snaf_Cook_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_Cook_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Co chutnýho máš?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Chci vyzkoušet novej recept - 'Ohnivé maso řiznuté silnou omáčkou'.
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Ohnivé maso?",DIA_Addon_Snaf_Cook_FEUER);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Kladivová omáčka?",DIA_Addon_Snaf_Cook_HAMMER);
};

func void DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ohnivé maso?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Křupavé lehce pečené maso, smícháno s ohnivým býlím.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Neboj se - Ingredience už mám.
};

func void DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Kladivová omáčka?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Omáčka z fakt tvrdýho destilátu. Dostal jsem ten recept od chlápka jménem Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Obstarej si přísady a propašuj likér do laboratoře nahoře, potom udělej omáčku. Co myslíš?
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Nemám na to čas.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Dobře, udělám to.",DIA_Addon_Snaf_Cook_YES);
};

func void DIA_Addon_Snaf_Cook_NO()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dobře, zapomeň na to.
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
};

func void DIA_Addon_Snaf_Cook_YES()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Dobře, udělám to.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Vypadá to dobře. Tady máš recept.
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_Running;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Log_CreateTopic(Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_Running);
	B_LogEntry(Topic_Addon_Hammer,"Snaf potřebuje destilát pro jeho omáčku. Dal mi recept na kladivový destilát, připravovaný na alchymistickém stole.");
};


var int Snaf_Tip_Kosten;

instance DIA_Addon_Snaf_Booze(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent = FALSE;
	description = "Udělal jsem ten destilát.";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Udělal jsem ten destilát.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Skvěle, teď to dokončím.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Teď můžeš jednu porci ochutnat. Zesílí ti to paže.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Počkej, až budeš přístě něco potřebovat ... všechny informace jsou zdarma.
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
	description = "Co víš o té vraždě?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co víš o té vraždě?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Estebanův případ?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//Víš odkud vítr vane. Barman pozoruje všechno, ale k nikomu se nepřídává ...
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Tak mi aspoň řekni, kde seženu infromace",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Kdybys byl já, co bys udělal?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Takže něco víš?",DIA_Addon_Snaf_Attentat_Something);
};

func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//Takže něco víš?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//TO jsem neřekl.
};

func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Tak mi aspoň řekni, kde získat informace.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Můj bože! To by bylo stejný! Zapomeň na to.
};

func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Kdybys byl já, co bys udělal?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Snažil bych si vzpomenout, co víš o šéfovi..
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Zaprvé. Byl to samozřejmě jeden z banditů, to znamená, je tady v táboře.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Za druhé: Od té doby, co je dotyčný zde v táboře, tě sleduje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Za třetí: Bude-li přesvědčený, že jsi na Estebanově straně, neodkryje svou totožnost.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Zajímavá otázka je, jaké jsou tvé šance najít zaměstnavatele.
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
};


instance DIA_Addon_Snaf_Abrechnung(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 5;
	condition = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent = TRUE;
	description = "Jaké jsou mé šance najít šéfa?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//Jaké jsou mé šance najít šéfa?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm ...
	if((Senyan_Erpressung == LOG_Running) && !Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//Velmi špatný. Někteří chlápci si všimli, že jsi se motal kolem Seynana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//Měl bys ses vzdát svýho kontaktu, jinak nemáš žádnou šanci, nájit šéfa vraždy.
		if(Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry(Topic_Addon_Senyan,"Měl bych ukončit Senyanovu práci. Nicméně bylo by nemoudré zaútočit na něj hlava nehlava. Měl bych s ním naposled promluvit.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if(Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//Měl bys sejmout jednoho z Estebanových lidí. Člověk kterého hledáš, bude věřit, že jsi na jeho straně.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale jen tak svou identitu neukáže. Musíš toho rozlousknout mnohem víc.
	}
	else
	{
		if(Finn_Petzt == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Vypadá to že Finn je velmi rozrušen, poté co jsi s ním mluvil.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A všichni ví, že má blízko k Estebanovi.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znamená, že jsi řekl něco, co nechtěl slyšet.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//Člověk kterého hledáš, bude velmi pobavený ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Ale riskujeme život, když poběžíme za Estebanem - (ironicky) ale to víš sám.
		};
		if(Finn_TellAll == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Vypadá to, že bys měl říct Finnovi, že pracuješ pro Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nevím co děláš, ale člověk kterého hledáš, si bude dávat větší pozor.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//Možný je všechno.
		};
	};
	if(Snaf_Rechnung == FALSE)
	{
		if(Snaf_Einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//Díky.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(drsně) Hej! Neřeknu ti nic než to, co jsi věděl předtím, chápeš?
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//Věděl jsem to ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//Přesně.
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
	description = "Huno říkal, že tu někoho potkám ...";
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
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Poslal mě Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Vypadá to, že jsi našel svýho člověka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Jdi nahoru, někdo tam na tebe čeká.
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
	description = "Co si lidé myslí o Estebanovi?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co si lidé myslí o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//Musíš to upřesnit ...
	if((Kosten_Einmal == FALSE) && (MIS_SnafHammer != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Každá informace něco stojí.
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Kolik?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 zlatých.
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
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nemáš dost peněz, chlapče!
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
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Myslím, že nemá Estabana moc v lásce. Od té doby, co pracuje pro Huna, nemůže už do dolu.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Co si o Estebanovi myslí Huno?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//Á! Huno. Nevím o něm skoro nic.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(úsměv) Tahle informace je zdarma.
};

func void DIA_Addon_Snaf_People_Fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co Fisk?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk je Fisk. Platí svou částku Estebanovi a dělí se o jeho zboží, které většinou dostane od pirátů.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Myslím, že se o Estebana nezajímá.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Emilio. Co ten si myslí o Estebanovi?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Myslím, že by nenosil kytky na Estebanův hrob, doufám že víš, co tím myslím.
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
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan je jeden z Estebanových chlápků. Chvíli pro něj pracuje.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co si Lennar myslí o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//Pokud vím, Lennar NEMYSLÍ.
};

func void DIA_Addon_Snaf_People_Finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co Finn?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobrej kopáč. Má na zlato čuch.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Esteban dává přednost z tohoto důvodu jemu. Myslím, že si navzájem celkem rozumnějí.
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
	description = "Můžeš mě naučit něco o vaření?";
};


func int dia_addon_snaf_teach_condition()
{
	return TRUE;
};

func void dia_addon_snaf_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_teach_15_00");	//Můžeš mě naučit něco o vaření?
	AI_Output(self,other,"DIA_Addon_Snaf_teach_01_01");	//Naučím tě svůj recept na můj specialní pokrm.
	Log_CreateTopic(TOPIC_COOKJ,LOG_NOTE);
	B_LogEntry(TOPIC_COOKJ,"Snaf mě může naučit vařit specialní pokrm.");
};


instance DIA_ADDON_SNAF_LEARN(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = dia_addon_snaf_learn_condition;
	information = dia_addon_snaf_learn_info;
	permanent = 5;
	description = "Specialní pokrm ze žravých štěnic (cena: 5 VB)";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Learn_15_00");	//Nauč mě vařit Specialní pokrm ze žravých štěnic.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Addon_Snaf_Learn_12_01");	//Tak a tet ti ukážu jak to uvaříš, sleduj pozorně.
		Log_CreateTopic(TOPIC_COOKJ,LOG_NOTE);
		B_LogEntry(TOPIC_COOKJ,"Umím uvařit: Specialní pokrm ze žravých štěnic.");
		B_LogEntry(TOPIC_COOKJ,"Ingredience jsou: 3x žravé štěnice, 20x boruvky, 1x dračí kořen.");
		KNOWS_COOKSTR = TRUE;
		PrintScreen("Naučil ses uvařit: Specialní pokrm ze žravých štěnic",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Co si myslíš o Estebanovi?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Ten kdo o něm mluví, bude brzo mrtvej ...
};


instance DIA_Addon_Snaf_PERM(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent = TRUE;
	description = "Jak to jde s tvým krámem?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak to jde s tvým krámem?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Dobře! Estebanova smrt je pro pár lidí důvod k oslavě ...
};

