
instance DIA_Jan_EXIT(C_Info)
{
	npc = DJG_714_Jan;
	nr = 999;
	condition = DIA_Jan_EXIT_Condition;
	information = DIA_Jan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_Hello(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Hello_Condition;
	information = DIA_Jan_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jan_Hello_Condition()
{
	if((Kapitel >= 4) && Npc_IsInState(self,ZS_Talk) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Hello_Info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//To byl ale vážně blbej nápad sem jezdit.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//Měl jsem dojem, že je tu něco, co by stálo za to. Ale až na pár arogantních paladinů a skřetů tu není vůbec nic.
};


instance DIA_JAN_Dragons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragons_Condition;
	information = DIA_Jan_Dragons_Info;
	permanent = FALSE;
	description = "Zapomněli jsme na draky, co?";
};


func int DIA_Jan_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (MIS_JanBecomesSmith == FALSE) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Dragons_Info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomněli jsme na draky, co?
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(posměšně) Jak bych mohl zapomenout. Já ti povím, co. Já jsem kovář, ne bojovník.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Dělám zbraně. Bojování přenechávám někomu jinému.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Tak proč jsi nezůstal u kovadliny?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladinové mě nechtěli pustit do kovárny. Nemohl jsem nic dělat, pokud jsem nechtěl skončit v hladomorně.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Ty jsi taky jedním z nich. Tak co kdybys u nich za mě ztratil slovo?
	};
	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons,"Měl bych si hledět svého.",DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons,"Co z toho budu mít, když ti pomůžu?",DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons,"Pokusím se ti pomoct.",DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Pokusím se ti pomoct.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak to chceš udělat? Parcival nařídil, aby nás nespouštěli z očí.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikdo si nedovolí neuposlechnout.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//To nech na mně.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nedovedu si představit, že by tě vyslechl.
	Log_CreateTopic(TOPIC_JanBecomesSmith,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith,LOG_Running);
	B_LogEntry(TOPIC_JanBecomesSmith,"Drakobijec Jan z hradu v Hornickém údolí chce pracovat v kovárně. Parcival mu to ale nechce dovolit.");
	MIS_JanBecomesSmith = LOG_Running;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co z toho budu mít, když ti pomůžu?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nemám vůbec nic. Nanejvýš tě můžu něčemu přiučit.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Znám postup, jak udělat čepele z magické rudy ještě tvrdší.
	};
	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Měl bych si hledět svého.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//No úžasný. Já teď nemůžu opustit hrad a ani nemůžu nic vykovat.
	Info_ClearChoices(DIA_JAN_Dragons);
};


instance DIA_JAN_Home(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Home_Condition;
	information = DIA_Jan_Home_Info;
	permanent = FALSE;
	description = "Odkud jsi přišel?";
};


func int DIA_Jan_Home_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel >= 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Home_Info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Přidal jsem se k nějakým mužům z hor. Měli jsme namířeno do údolí, kde jsme si chtěli trochu přilepšit lovem draků.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Jejich velitel vystupoval pod jménem Sylvio. Chlape, to bylo hovado. Zacházel se mnou jako s kusem hadru.
};


instance DIA_JAN_OldCamp(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_OldCamp_Condition;
	information = DIA_Jan_OldCamp_Info;
	permanent = TRUE;
	description = "Co všechno se na hradě stalo?";
};


func int DIA_Jan_OldCamp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_OldCamp_Info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co všechno se na hradě stalo?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o čem bych věděl. Jasně, znepokojuje mě, co se děje venku za hradbama.
};


instance DIA_JAN_Parcival(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Parcival_Condition;
	information = DIA_Jan_Parcival_Info;
	permanent = FALSE;
	description = "Mluvil jsem s Parcivalem.";
};


func int DIA_Jan_Parcival_Condition()
{
	if((MIS_JanBecomesSmith != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Parcival_Info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Mluvil jsem s Parcivalem.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//Takže?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Nám drakobijcům prostě nevěří.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Vám drakobijcům prostě nevěří.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Sakra. Prostě chci jen nějakou práci.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Tak to asi budu muset vzdát. Teď už mi může pomoct jen Garond.
};


instance DIA_JAN_JanIsSmith(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_JanIsSmith_Condition;
	information = DIA_Jan_JanIsSmith_Info;
	permanent = FALSE;
	description = "Běž si pro kladivo, máš práci.";
};


func int DIA_Jan_JanIsSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_JanIsSmith_Info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Běž si pro kladivo, máš práci.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Tys to dokázal? Jaks to zařídil?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Přimluvil jsem se za tebe, tak ať mě nezklameš.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Neměj strach. Jsem rád, že vůbec můžu pracovat.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SellWeapons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellWeapons_Condition;
	information = DIA_Jan_SellWeapons_Info;
	permanent = FALSE;
	description = "Prodáváš nějaké zbraně?";
};


func int DIA_Jan_SellWeapons_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (Jan_TeachPlayer == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellWeapons_Info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Prodáváš nějaké zbraně?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//To víš. A pak mě tví kolegové šoupnou za mříže za černej obchod, co? Ne, zapomeň na to.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Udělal bych to, kdybych mohl. Ale nejdřív musím udělat dost zbraní pro paladiny tady na hradě.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale můžu ti ukázat, jak si vykovat vlastní zbraň.
	Jan_TeachPlayer = TRUE;
};


instance Jan_Training_Talente(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = Jan_Training_Talente_Condition;
	information = Jan_Training_Talente_Info;
	permanent = TRUE;
	description = "Nauč mě kovářskému řemeslu.";
};


func int Jan_Training_Talente_Condition()
{
	if((Jan_TeachPlayer == TRUE) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void Jan_Training_Talente_Info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Nauč mě kovářskému řemeslu.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co přesně chceš vyrobit?
	Info_ClearChoices(Jan_Training_Talente);
	Info_AddChoice(Jan_Training_Talente,Dialog_Back,Jan_Training_Smith_Back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente,B_BuildLearnString("Naučit se kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),Jan_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),Jan_Training_Smith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),Jan_Training_Smith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),Jan_Training_Smith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),Jan_Training_Smith_2hSpecial2);
		};
	};
};

func void Jan_Training_Smith_Back()
{
	Info_ClearChoices(Jan_Training_Talente);
};

func void Jan_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void Jan_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void Jan_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void Jan_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void Jan_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};


var int DIA_JAN_SellArmor_permanent;

instance DIA_JAN_SellArmor(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellArmor_Condition;
	information = DIA_Jan_SellArmor_Info;
	permanent = TRUE;
	description = "Můžu si od tebe koupit nějakou zbroj?";
};


func int DIA_Jan_SellArmor_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Můžu si od tebe koupit nějakou zbroj?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Tvému brnění se nic nevyrovná. Zapomeň na to.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Mág, co chce brnění? Zapomeň na to - běž se podívat za krejčím. Pro tebe zbroj udělat nedokážu.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Kdybych nějakou měl, tak bych ti ji prodal. Bohužel, žádnou nemám.
		Info_ClearChoices(DIA_JAN_SellArmor);
		Info_AddChoice(DIA_JAN_SellArmor,"Hádám, že s tím nejde nic dělat.",DIA_JAN_SellArmor_Sorry);
		Info_AddChoice(DIA_JAN_SellArmor,"A mohl bys pro mě nějakou udělat?",DIA_JAN_SellArmor_BuildOne);
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//Hádám, že s tím nejde nic dělat.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Kdybys přece jen na něco narazil, dej mi vědět.
	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//A mohl bys pro mě nějakou udělat?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Dobrá, jestli stojíš o něco lepšího, musíš mi opatřit vhodný materiál.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Co potřebuješ?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chceš bojovat s draky, ne? Přines mi nějaký dračí šupiny - s tím už bych pro tebe mohl něco udělat.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//10 šupin by mohlo stačit.
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices(DIA_JAN_SellArmor);
};


var int Jan_Sells_Armor;

instance DIA_JAN_Dragonscales(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragonscales_Condition;
	information = DIA_Jan_Dragonscales_Info;
	permanent = TRUE;
	description = "Mám pro tebe ty dračí šupiny.";
};


func int DIA_Jan_Dragonscales_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == TRUE) && (Jan_Sells_Armor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 1))
	{
		return 1;
	};
};


var int DIA_JAN_Dragonscales_OneTime;

func void DIA_Jan_Dragonscales_Info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//Mám pro tebe ty dračí šupiny.
	if(Npc_HasItems(other,ItAt_DragonScale) >= 10)
	{
		B_GiveInvItems(other,self,ItAt_DragonScale,10);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobrá, s tím už se dá něco dělat.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Vrať se zítra, pak už by toho mohl být kus hotový.
		if(DIA_JAN_Dragonscales_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};
		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Potřebuju 20 dračích šupin, jinak ti nebudu moct žádný brnění vyrobit.
	};
};


var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;

instance DIA_JAN_ArmorReady(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_ArmorReady_Condition;
	information = DIA_Jan_ArmorReady_Info;
	permanent = TRUE;
	description = "Je ta zbroj hotová?";
};


func int DIA_Jan_ArmorReady_Condition()
{
	if((MIS_OCGateOpen == FALSE) && (Jan_Sells_Armor != FALSE) && (DIA_JAN_ArmorReady_NoPerm == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Je ta zbroj hotová?
	if(Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Ne, ještě ne. Vrať se zítra.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Ano, vážně mistrovský kousek. Můžeš si ho koupit, pokud o něj stojíš.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Udělám ti zvláštní cenu. 14 000 zlatých.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co? Po tom všem, co jsem pro tebe udělal?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Nebuď takovej. Musím se nějak živit. Buď ber, nebo nech ležet.
		DJG_Armor_is_offered = TRUE;
		DIA_JAN_ArmorReady_NoPerm = TRUE;
	};
};


var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;

instance DIA_Jan_DJG_ARMOR_M(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_DJG_ARMOR_M_Condition;
	information = DIA_Jan_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "Těžká drakobijecká zbroj: ochrana: zbraně 130, šípy 130 (14000 zlaťáků)";
};


func int DIA_Jan_DJG_ARMOR_M_Condition()
{
	if((Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (DJG_Armor_is_offered == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jan_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chci si koupit nové brnění.
	if(Npc_HasItems(other,ItMi_Gold) >= 14000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Jak vidíš, tak má cenu zlata.
		B_GiveInvItems(other,self,ItMi_Gold,14000);
		CreateInvItems(self,itar_djg_h,1);
		B_GiveInvItems(self,other,itar_djg_h,1);
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nemáš dost zlata.
	};
};


instance DIA_Jan_DragonPlettBericht(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonPlettBericht_Condition;
	information = DIA_Jan_DragonPlettBericht_Info;
	description = "A co se týče těch draků...";
};


var int DIA_Jan_DragonPlettBericht_NoPerm;

func int DIA_Jan_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_JAN_Dragons) && (DIA_Jan_DragonPlettBericht_NoPerm == FALSE) && (MIS_OCGateOpen == FALSE) && (MIS_KilledDragons != 0))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info()
{
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Zabil jsem draka.
	}
	else if((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabil jsem pár draků.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabil jsem všechny draky.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//A co? Jsi přece drakobijec, ne?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//Nejsi náhodou taky jedním z nich?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To je výborný. Ale abych pravdu řekl, vůbec mě to nezajímá.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Už jsem ti říkal, že raděj vyrábím zbraně, než abych chodil zabíjet draky.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Nicméně, je jedna věc, co by mě mohla zajímat.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Pokud bys mi chtěl přinýst nějakou dračí krev, slušně ti za ni zaplatím.
		Jan_WantsDragonBlood = TRUE;
	};
};


instance DIA_Jan_DragonBlood(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonBlood_Condition;
	information = DIA_Jan_DragonBlood_Info;
	permanent = TRUE;
	description = "Mám pro tebe tu dračí krev.";
};


func int DIA_Jan_DragonBlood_Condition()
{
	if((Jan_WantsDragonBlood == TRUE) && (MIS_OCGateOpen == FALSE) && Npc_HasItems(other,ItAt_DragonBlood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonBlood_Info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Mám pro tebe tu dračí krev.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//To je skvělý. Koupím všechno, co máš.
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Všechno)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Jednu lahvičku)",DIA_Jan_DragonBlood_1);
	};
};

func void DIA_Jan_DragonBlood_BACK()
{
	Info_ClearChoices(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = 1;
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Všechno)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Jednu lahvičku)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_PrintScreen(BloodText,-1,-1,FONT_ScreenSmall,2);
};

func void DIA_Jan_DragonBlood_all()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = Npc_HasItems(other,ItAt_DragonBlood);
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Všechno)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Jednu lahvičku)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_PrintScreen(BloodText,-1,-1,FONT_ScreenSmall,2);
};


instance DIA_Jan_NACHOCGATEOPEN(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_NACHOCGATEOPEN_Condition;
	information = DIA_Jan_NACHOCGATEOPEN_Info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int DIA_Jan_NACHOCGATEOPEN_Condition()
{
	if(MIS_OCGateOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jan_NACHOCGATEOPEN_Info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//V pořádku není naprosto nic!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Proč jste vy idioti otevírali tu bránu? Vy paladinové jste taky chytrý jak prdy ve spodkách!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak prostě šli a otevřeli tu bránu. Tupci! Tohle prostě nepochopim.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jan_PICKPOCKET(C_Info)
{
	npc = DJG_714_Jan;
	nr = 900;
	condition = DIA_Jan_PICKPOCKET_Condition;
	information = DIA_Jan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Jan_PICKPOCKET_Condition()
{
	return C_Beklauen(37,95);
};

func void DIA_Jan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
	Info_AddChoice(DIA_Jan_PICKPOCKET,Dialog_Back,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

