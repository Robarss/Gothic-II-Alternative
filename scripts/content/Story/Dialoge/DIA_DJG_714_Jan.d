
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
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//To byl ale v??n? blbej n?pad sem jezdit.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//M?l jsem dojem, ?e je tu n?co, co by st?lo za to. Ale a? na p?r arogantn?ch paladin? a sk?et? tu nen? v?bec nic.
};


instance DIA_JAN_Dragons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragons_Condition;
	information = DIA_Jan_Dragons_Info;
	permanent = FALSE;
	description = "Zapomn?li jsme na draky, co?";
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
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomn?li jsme na draky, co?
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(posm??n?) Jak bych mohl zapomenout. J? ti pov?m, co. J? jsem kov??, ne bojovn?k.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//D?l?m zbran?. Bojov?n? p?enech?v?m n?komu jin?mu.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Tak pro? jsi nez?stal u kovadliny?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladinov? m? necht?li pustit do kov?rny. Nemohl jsem nic d?lat, pokud jsem necht?l skon?it v hladomorn?.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Ty jsi taky jedn?m z nich. Tak co kdybys u nich za m? ztratil slovo?
	};
	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons,"M?l bych si hled?t sv?ho.",DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons,"Co z toho budu m?t, kdy? ti pom??u?",DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons,"Pokus?m se ti pomoct.",DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Pokus?m se ti pomoct.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak to chce? ud?lat? Parcival na??dil, aby n?s nespou?t?li z o??.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikdo si nedovol? neuposlechnout.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//To nech na mn?.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nedovedu si p?edstavit, ?e by t? vyslechl.
	Log_CreateTopic(TOPIC_JanBecomesSmith,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith,LOG_Running);
	B_LogEntry(TOPIC_JanBecomesSmith,"Drakobijec Jan z hradu v Hornick?m ?dol? chce pracovat v kov?rn?. Parcival mu to ale nechce dovolit.");
	MIS_JanBecomesSmith = LOG_Running;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co z toho budu m?t, kdy? ti pom??u?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nem?m v?bec nic. Nanejv?? t? m??u n??emu p?iu?it.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Zn?m postup, jak ud?lat ?epele z magick? rudy je?t? tvrd??.
	};
	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//M?l bych si hled?t sv?ho.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//No ??asn?. J? te? nem??u opustit hrad a ani nem??u nic vykovat.
	Info_ClearChoices(DIA_JAN_Dragons);
};


instance DIA_JAN_Home(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Home_Condition;
	information = DIA_Jan_Home_Info;
	permanent = FALSE;
	description = "Odkud jsi p?i?el?";
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
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Odkud jsi p?i?el?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//P?idal jsem se k n?jak?m mu??m z hor. M?li jsme nam??eno do ?dol?, kde jsme si cht?li trochu p?ilep?it lovem drak?.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Jejich velitel vystupoval pod jm?nem Sylvio. Chlape, to bylo hovado. Zach?zel se mnou jako s kusem hadru.
};


instance DIA_JAN_OldCamp(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_OldCamp_Condition;
	information = DIA_Jan_OldCamp_Info;
	permanent = TRUE;
	description = "Co v?echno se na hrad? stalo?";
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
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co v?echno se na hrad? stalo?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o ?em bych v?d?l. Jasn?, znepokojuje m?, co se d?je venku za hradbama.
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
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//Tak?e?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//N?m drakobijc?m prost? nev???.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//V?m drakobijc?m prost? nev???.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Sakra. Prost? chci jen n?jakou pr?ci.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Tak to asi budu muset vzd?t. Te? u? mi m??e pomoct jen Garond.
};


instance DIA_JAN_JanIsSmith(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_JanIsSmith_Condition;
	information = DIA_Jan_JanIsSmith_Info;
	permanent = FALSE;
	description = "B?? si pro kladivo, m?? pr?ci.";
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
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//B?? si pro kladivo, m?? pr?ci.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Tys to dok?zal? Jaks to za??dil?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//P?imluvil jsem se za tebe, tak a? m? nezklame?.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Nem?j strach. Jsem r?d, ?e v?bec m??u pracovat.
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
	description = "Prod?v?? n?jak? zbran??";
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
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Prod?v?? n?jak? zbran??
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//To v??. A pak m? tv? kolegov? ?oupnou za m???e za ?ernej obchod, co? Ne, zapome? na to.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Ud?lal bych to, kdybych mohl. Ale nejd??v mus?m ud?lat dost zbran? pro paladiny tady na hrad?.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale m??u ti uk?zat, jak si vykovat vlastn? zbra?.
	Jan_TeachPlayer = TRUE;
};


instance Jan_Training_Talente(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = Jan_Training_Talente_Condition;
	information = Jan_Training_Talente_Info;
	permanent = TRUE;
	description = "Nau? m? kov??sk?mu ?emeslu.";
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
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Nau? m? kov??sk?mu ?emeslu.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co p?esn? chce? vyrobit?
	Info_ClearChoices(Jan_Training_Talente);
	Info_AddChoice(Jan_Training_Talente,Dialog_Back,Jan_Training_Smith_Back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente,B_BuildLearnString("Nau?it se kov??stv?",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),Jan_Training_Smith_Common);
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
	description = "M??u si od tebe koupit n?jakou zbroj?";
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
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//M??u si od tebe koupit n?jakou zbroj?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Tv?mu brn?n? se nic nevyrovn?. Zapome? na to.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//M?g, co chce brn?n?? Zapome? na to - b?? se pod?vat za krej??m. Pro tebe zbroj ud?lat nedok??u.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Kdybych n?jakou m?l, tak bych ti ji prodal. Bohu?el, ??dnou nem?m.
		Info_ClearChoices(DIA_JAN_SellArmor);
		Info_AddChoice(DIA_JAN_SellArmor,"H?d?m, ?e s t?m nejde nic d?lat.",DIA_JAN_SellArmor_Sorry);
		Info_AddChoice(DIA_JAN_SellArmor,"A mohl bys pro m? n?jakou ud?lat?",DIA_JAN_SellArmor_BuildOne);
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//H?d?m, ?e s t?m nejde nic d?lat.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Kdybys p?ece jen na n?co narazil, dej mi v?d?t.
	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//A mohl bys pro m? n?jakou ud?lat?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Dobr?, jestli stoj?? o n?co lep??ho, mus?? mi opat?it vhodn? materi?l.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Co pot?ebuje??
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chce? bojovat s draky, ne? P?ines mi n?jak? dra?? ?upiny - s t?m u? bych pro tebe mohl n?co ud?lat.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 ?upin by mohlo sta?it.
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
	description = "M?m pro tebe ty dra?? ?upiny.";
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
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//M?m pro tebe ty dra?? ?upiny.
	if(Npc_HasItems(other,ItAt_DragonScale) >= 10)
	{
		B_GiveInvItems(other,self,ItAt_DragonScale,10);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobr?, s t?m u? se d? n?co d?lat.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Vra? se z?tra, pak u? by toho mohl b?t kus hotov?.
		if(DIA_JAN_Dragonscales_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};
		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Pot?ebuju 20 dra??ch ?upin, jinak ti nebudu moct ??dn? brn?n? vyrobit.
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
	description = "Je ta zbroj hotov??";
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
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Je ta zbroj hotov??
	if(Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Ne, je?t? ne. Vra? se z?tra.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Ano, v??n? mistrovsk? kousek. M??e? si ho koupit, pokud o n?j stoj??.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Ud?l?m ti zvl??tn? cenu. 12 000 zlat?ch.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co? Po tom v?em, co jsem pro tebe ud?lal?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Nebu? takovej. Mus?m se n?jak ?ivit. Bu? ber, nebo nech le?et.
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
	description = "T??k? drakobijeck? zbroj: ochrana: zbran? 130, ??py 130 (14000 zla??k?)";
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
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chci si koupit nov? brn?n?.
	if(Npc_HasItems(other,ItMi_Gold) >= 14000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Jak vid??, tak m? cenu zlata.
		B_GiveInvItems(other,self,ItMi_Gold,14000);
		CreateInvItems(self,itar_djg_h,1);
		B_GiveInvItems(self,other,itar_djg_h,1);
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nem?? dost zlata.
	};
};


instance DIA_Jan_DragonPlettBericht(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonPlettBericht_Condition;
	information = DIA_Jan_DragonPlettBericht_Info;
	description = "A co se t??e t?ch drak?...";
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
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabil jsem p?r drak?.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabil jsem v?echny draky.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//A co? Jsi p?ece drakobijec, ne?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//Nejsi n?hodou taky jedn?m z nich?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To je v?born?. Ale abych pravdu ?ekl, v?bec m? to nezaj?m?.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//U? jsem ti ??kal, ?e rad?j vyr?b?m zbran?, ne? abych chodil zab?jet draky.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Nicm?n?, je jedna v?c, co by m? mohla zaj?mat.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Pokud bys mi cht?l p?in?st n?jakou dra?? krev, slu?n? ti za ni zaplat?m.
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
	description = "M?m pro tebe tu dra?? krev.";
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
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//M?m pro tebe tu dra?? krev.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//To je skv?l?. Koup?m v?echno, co m??.
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(V?echno)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Jednu lahvi?ku)",DIA_Jan_DragonBlood_1);
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
		Info_AddChoice(DIA_Jan_DragonBlood,"(V?echno)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Jednu lahvi?ku)",DIA_Jan_DragonBlood_1);
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
		Info_AddChoice(DIA_Jan_DragonBlood,"(V?echno)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Jednu lahvi?ku)",DIA_Jan_DragonBlood_1);
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
	description = "Je v?echno v po??dku?";
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
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Je v?echno v po??dku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//V po??dku nen? naprosto nic!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Pro? jste vy idioti otev?rali tu br?nu? Vy paladinov? jste taky chytr? jak prdy ve spodk?ch!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak prost? ?li a otev?eli tu br?nu. Tupci! Tohle prost? nepochopim.
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

