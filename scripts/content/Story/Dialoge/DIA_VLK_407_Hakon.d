
instance DIA_Hakon_EXIT(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 999;
	condition = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Sperre(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Sperre_Condition;
	information = DIA_Hakon_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hakon_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Sperre_Info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Ztra? se, ty krimin?ln?ku! Canthar mi ?ekl, jakej mizernej bastard se?!
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Hallo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Hallo_Condition;
	information = DIA_Hakon_Hallo_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Hakon_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Jsem Hakon, prodava? zbran?.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//V tyhle dny by m?l m?t ka?d? mu? u sebe zbra?. Zvl᚝, kdy? se vyd? za hradby.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Hakon prod?v? na tr?i?ti zbran?.");
};


instance DIA_Hakon_Trade(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 99;
	condition = DIA_Hakon_Trade_Condition;
	information = DIA_Hakon_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka? mi sv? zbo??.";
};


func int DIA_Hakon_Trade_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Uka? mi sv? zbo??.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//Je pro m? velkou ct?, kdy? se o m? zbo?? zaj?m? p?edstavitel svat? c?rkve.
	};
};


instance DIA_Addon_Hakon_MissingPeople(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Addon_Hakon_MissingPeople_Condition;
	information = DIA_Addon_Hakon_MissingPeople_Info;
	description = "Nev?? n?hodou n?co o ztracen?ch obyvatel?ch Khorinisu?";
};


func int DIA_Addon_Hakon_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Hakon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Nev?? n?hodou n?co o ztracen?ch obyvatel?ch Khorinisu?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Vid?l jsem mnoho lid? proch?zet v?chodn? branou.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//N?kter? z nich jsem v ?ivot? nevid?l. A mnoho z nich se nikdy nevr?tilo.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Ale, n?co opravdu divn?ho se asi d?je.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//Tamhle byl n?jak? t?pek. Mysl?m, ?e se jmenoval Joe. Po??d se vychloubal, ?e bude brzy prach??.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Vyzv?dal, jak se m? dostat do jedn? z m?stsk?ch v???, kam si domobrana ukl?d? zbran?.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//Potom jsem ho u? nikdy nevid?l. Chodil jsem okolo n?j ka?d? den, dokud se neztratil.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Byl jsem udiven, kdy? ho domobrana zatkla a ptala se n?s na n?j.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Lord Andre nev?d?l, o ?em jsem mluvil a necht?l o tom chl?pkovi u? sly?et.
	Log_CreateTopic(TOPIC_Addon_Joe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe,LOG_Running);
	B_LogEntry(TOPIC_Addon_Joe,"Hakon, obchodn?k v Khorinisu, v?dal chl?pka jm?nem Joe, ne? se ztratil. Joe se cht?l dostat do jedn? z m?stsk?ch v???, kde si domobrana skladovala zbran?.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_OutOfTown(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_OutOfTown_Condition;
	information = DIA_Hakon_OutOfTown_Info;
	permanent = FALSE;
	description = "?ekni mi n?co o okol? m?sta.";
};


func int DIA_Hakon_OutOfTown_Condition()
{
	return TRUE;
};

func void DIA_Hakon_OutOfTown_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//?ekni mi n?co o okol? m?sta.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Je to tam ??m d?l nebezpe?n?j??.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Jednak kv?li bandit?m, a taky kv?li divok? zv??i.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Vypad? to, jako by ani zv??ata v t?chhle zatracen?ch ?asech nem?la ??m zahnat hlad.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Odva?uj? se k m?stu st?le bl??.
};


instance DIA_Hakon_Paladine(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Paladine_Condition;
	information = DIA_Hakon_Paladine_Info;
	permanent = FALSE;
	description = "V?? n?co o paladinech?";
};


func int DIA_Hakon_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Paladine_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//V?? n?co o paladinech?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Ano! Ti chlapi mi ma?? moje obchody!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//V?echno, co si p?i nejlep?? v?li m??e? v tomhle m?st? koupit, je kr?tk? me?.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Seberou v?echno, co je del?? ne? stopu a p?l.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(j?zliv?) A na opl?tku se te? m??u v hotelu v?let zdarma - ha!
};


instance DIA_Hakon_WoWaffen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_WoWaffen_Condition;
	information = DIA_Hakon_WoWaffen_Info;
	permanent = FALSE;
	description = "Odkud bere? sv? zbran??";
};


func int DIA_Hakon_WoWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Hakon_WoWaffen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Odkud bere? sv? zbran??
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Odnikud! A? dote? byl m?m dodavatelem Harad.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//A? dote? byl m?m dodavatelem kov?? Harad.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Ned?l? te? na ni?em jin?m ne? na zak?zce pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Pracuje pro ty chl?pky dnem i noc? jako magor bez n?roku na odm?nu. M? dojem, ?e to jeho povinnost.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//V?echno, co ti m??u nab?dnout, jsou zbytky m?ch z?sob.
};


instance DIA_Hakon_HaradBandits(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_HaradBandits_Condition;
	information = DIA_Hakon_HaradBandits_Info;
	permanent = FALSE;
	description = "Harad mi ?ekl o ?toku bandit?.";
};


func int DIA_Hakon_HaradBandits_Condition()
{
	if(Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hakon_HaradBandits_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad mi ?ekl o ?toku bandit?.
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Hm? A?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//D? mi souhlas pro p?ijet? do u?en?, kdy? se vypo??d?m s t?mi bandity.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(sm?ch) Star? dobr? Harad. To asi bude zp?sob, jak?m se mi cht?l omluvit za to, ?e pro m? nem??e d?lat ??dn? zbran?.
};


instance DIA_Hakon_Banditen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Banditen_Condition;
	information = DIA_Hakon_Banditen_Info;
	permanent = FALSE;
	description = "Co v?? o banditech?";
};


func int DIA_Hakon_Banditen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hakon_HaradBandits) || Npc_KnowsInfo(hero,DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Banditen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Co v?? o banditech?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Co o nich v?m? Cestou do m?sta m? oloupili!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//A nejsem jedin?. To se jen tak nezm?n?.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Domobrana se je sna?? vysl?dit, ale n?jak se to neda??.
	MIS_HakonBandits = LOG_Running;
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HakonBanditen,LOG_Running);
	B_LogEntry(TOPIC_HakonBanditen,"Hakona, obchodn?ka se zbran?mi, okradli za m?stem bandit?.");
};


instance DIA_Hakon_Wieviel(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Wieviel_Condition;
	information = DIA_Hakon_Wieviel_Info;
	permanent = FALSE;
	description = "M??u se o to postarat.";
};


func int DIA_Hakon_Wieviel_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//M??u se o to postarat.
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Co, TY se chce? pustit do bandit?? To jako ty s?m? Ty jsi asi dost dobr? bojovn?k, co?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Jak moc ti na tom z?le???
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(potuteln?) Chce? se dostat k Haradov?m bibl?m, co?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Nemysl?m, ?e bych ti za to m?l platit.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//Je to p?kn? nebezpe?n?.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//No, mn? to nevad?. Jestli ty bandity p?em??e?, d?m ti 100 zla??k?.
		MIS_HakonBanditsPay = TRUE;
	};
	Info_ClearChoices(DIA_Hakon_Banditen);
};


instance DIA_Hakon_Miliz(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_Miliz_Condition;
	information = DIA_Hakon_Miliz_Info;
	permanent = FALSE;
	description = "Nem?? pon?t?, kdo z domobrany se p?tr?n? ??astnil?";
};


func int DIA_Hakon_Miliz_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Miliz_Info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Nem?? pon?t?, kdo z domobrany se p?tr?n? ??astnil?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Jo, ten chlap?k se jmenoval Pablo. Spolu s p?r ostatn?mi po banditech p?trali, ale nikoho nena?li.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//A nev??, kde bych toho Pabla na?el?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Je na str??i ve m?st?. Bu? ho potk?? v chr?mov? uli?ce, nebo v doln? ?tvrti.
	B_LogEntry(TOPIC_HakonBanditen,"Ne?sp??n?ho p?tr?n? po banditech se ??astnil i Pablo, p??slu?n?k m?stsk? gardy.");
};


instance DIA_Hakon_Wo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Wo_Condition;
	information = DIA_Hakon_Wo_Info;
	permanent = FALSE;
	description = "Kde t? p?epadli?";
};


func int DIA_Hakon_Wo_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wo_Info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Kde t? p?epadli?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//U Akilova statku. Kdy? odsud vyjde? m?stskou branou a pak se d?? cestou doprava, nem??e? to minout.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Za chv?li naraz?? na p?r schod? - a pr?v? odtamtud se na m? ti bastardi vy??tili. Vsad?m se, ?e n?kde v t?ch les?ch maj? doup?.
};


instance DIA_Hakon_Success(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Success_Condition;
	information = DIA_Hakon_Success_Info;
	permanent = FALSE;
	description = "U? jsem ty bandity vy??dil.";
};


func int DIA_Hakon_Success_Condition()
{
	if((MIS_HakonBandits == LOG_Running) && Npc_IsDead(Bandit_1) && Npc_IsDead(Bandit_2) && Npc_IsDead(Bandit_3))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Success_Info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//U? jsem ty bandity vy??dil.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Opravdu? To by mohl ??ct ka?d?. M?? n?jak? d?kaz?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(povzdech) To se tam m?m vr?tit a usekat jim hlavy, nebo co?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(rychle) Ne - to snad ani nebude nutn?. V???m ti.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Prok?zal jsi m?stsk?m obchodn?k?m nesm?rnou slu?bu.
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Harad bude spokojen? - aspo? mysl?m.
	};
	if(MIS_HakonBanditsPay == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//A tady m?? sl?benou odm?nu.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Hakon_Bandits);
};


instance DIA_Hakon_Minenanteil(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Minenanteil_Condition;
	information = DIA_Hakon_Minenanteil_Info;
	permanent = FALSE;
	description = "Kde jsi sehnal ty d?ln? akcie, kter? prod?v???";
};


func int DIA_Hakon_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Kde jsi sehnal ty d?ln? akcie, kter? prod?v???
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Je mi l?to, ale to ti nem??u prozradit. Je to moc nebezpe?n?.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_PICKPOCKET(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 900;
	condition = DIA_Hakon_PICKPOCKET_Condition;
	information = DIA_Hakon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Hakon_PICKPOCKET_Condition()
{
	return C_Beklauen(45,65);
};

func void DIA_Hakon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,Dialog_Back,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};


instance DIA_Hakon_Kapitel2(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Kapitel2_Condition;
	information = DIA_Hakon_Kapitel2_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hakon_Kapitel2_Condition()
{
	if((Kapitel >= 2) && (Canthar_Sperre == FALSE) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Kapitel2_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//U? zase TY!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad kone?n? skon?il s tou zatrachtilou mis? pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//To zna??, ?e ti te? m??u nab?dnout nov? zbran?. M?? z?jem?
};

