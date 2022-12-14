
instance DIA_Garvell_EXIT(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 999;
	condition = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garvell_PICKPOCKET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 900;
	condition = DIA_Garvell_PICKPOCKET_Condition;
	information = DIA_Garvell_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Jeho portmonku by dok?zalo ?t?pnout i nemluvn?.)";
};


func int DIA_Garvell_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,Dialog_Back,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket25,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};


instance DIA_Garvell_GREET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_GREET_Condition;
	information = DIA_Garvell_GREET_Info;
	description = "Co tady d?l???";
};


func int DIA_Garvell_GREET_Condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Stav?m lo?, proto?e se chci odsud dostat - co nejrychleji to p?jde.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Ale jak to tak vypad?, tu lo? nikdy nedokon??m.
};


instance DIA_Garvell_eilig(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_eilig_Condition;
	information = DIA_Garvell_eilig_Info;
	description = "Pro? tolik posp?ch???";
};


func int DIA_Garvell_eilig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_eilig_Info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Pro? tolik posp?ch???
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Co nevid?t doraz? sk?eti a srovnaj? m?sto se zem?.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Pro? si to mysl???
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Hochu, copak jsi nevid?l ty paladiny, co pob?haj v?ude kolem? Pro? si mysl??, ze jsou tady?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//??k?m ti, jsou tady, proto?e sk?eti brzy za?to??. A nebude to nic hezk?ho.
};


instance DIA_Garvell_Schiff(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_Schiff_Condition;
	information = DIA_Garvell_Schiff_Info;
	description = "Pro? nem??e? dokon?it lo??";
};


func int DIA_Garvell_Schiff_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Pro? nem??e? dokon?it lo??
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//(pohrdav?) M?me mili?n probl?m?. Trup je?t? nen? dostate?n? pevn? a po??d n?m je?t? chyb? spousta fo?en.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Ale na nov? materi?l u? nem?m moc zlata, a posledn? dod?vka byla prolezl? ?ervoto?em.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Moji chlapci nepracujou po??dn?. Jeden chce jen rychlou lo?, a druh? se zaj?m? jen o jej? v?zdobu!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Jako kdybychom nem?li d?le?it?j?? v?ci na pr?ci!
	AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//No, jeden z m?ch d?ln?k? ned?vno zmizel. Ob?v?mse,  ?e to m??e znamenat zpo?d?n?.
};


instance DIA_Addon_Garvell_MissingPeople(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeople_Condition;
	information = DIA_Addon_Garvell_MissingPeople_Info;
	description = "Jeden z tv?ch zam?stnanc? zmizel?";
};


func int DIA_Addon_Garvell_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//Jeden z tv?ch zam?stnanc? zmizel?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//Spr?vn?. Jmenuje se Monty. Slehla se po n?m zem.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//Vsadil bych se, ?e ta lin? svin? sed? na n?jak? farm? a u??v? si ?ivota. Nem?l jsem mu platit p?edem.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Garvell je znepokojen sv?m d?ln?kem Montym. Ten se od jednoho dne neobjevil v pr?ci. Pr? si dob?e ?ije na jedn? z farem.");
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople,"Sly?el jsem, ?e zmizelo v?c lid?.",DIA_Addon_Garvell_MissingPeople_more);
	if(SCKnowsFarimAsWilliamsFriend == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople,"Kdy tu byl Monty naposled.",DIA_Addon_Garvell_MissingPeople_wo);
	};
};

func void DIA_Addon_Garvell_MissingPeople_more()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//Sly?el jsem, ?e u? zmizelo v?c lid?.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//Vi?? T?m tenhle v?echen zmatek za?al.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//Ryb?? Farim se zmi?oval o n??em takov?m. Jeho k?mo? William zjevn? zmizel.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//Vsadil bych se, ?e zat?m v??m jsou sk?eti.
	SCKnowsFarimAsWilliamsFriend = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Vypad? to, ?e ryb?? Farim v? n?co o u?ite?n?ho o sv?m p??teli Williamovi.");
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople,Dialog_Back,DIA_Addon_Garvell_MissingPeople_BACK);
	if(Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople,"Kde m??u naj?t Farima?",DIA_Addon_Garvell_MissingPeople_Farim);
	};
};

func void DIA_Addon_Garvell_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
};

func void DIA_Addon_Garvell_MissingPeople_Farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//Kde m??u naj?t Farima?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//Je to ryb??. Mysl?m, ?e jeho chatr? je n?kde pobl?? skladi?t? paladin?. Nejsem si jist.
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Farim's cottage is near the paladins' store yard.");
};

func void DIA_Addon_Garvell_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//Kdy tu byl Monty naposled?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(na?tvan?) Nep?i?el do pr?ce u? dva dny.
};


instance DIA_Garvell_ReturnMonty(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_ReturnMonty_Condition;
	information = DIA_Garvell_ReturnMonty_Info;
	description = "A jak to jde te??";
};


func int DIA_Garvell_ReturnMonty_Condition()
{
	if((Npc_GetDistToWP(Monty_NW,"NW_CITY_HABOUR_WERFT_IN_01") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_ReturnMonty_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//A jak to jde te??
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//Monty je zp?tky! Zrovna se d?v? na pl?ny.
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//Mo?n? nakonec tu lo? p?ece jen dokon??me.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_MISSION(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_MISSION_Condition;
	information = DIA_Garvell_MISSION_Info;
	permanent = FALSE;
	description = "M??u ti n?jak pomoct?";
};


func int DIA_Garvell_MISSION_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_eilig) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//M??u ti n?jak pomoct?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//To m??e?. Zjisti, co maj? paladinov? za lubem. Zaj?malo by m?, pro? jsou tady.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//A taky bych m?l v?d?t, jestli se sk?eti chystaj? za?to?it - a jak daleko od m?sta jsou.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Jednoho z t?ch bastard? vid?li hned za m?stem.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Prost? mi dones tolik informac?, kolik se ti poda?? z?skat.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Pot?ebuju v?d?t, kolik ?asu m?m na dokon?en? lodi.
	MIS_Garvell_Infos = LOG_Running;
	Knows_Ork = TRUE;
	Log_CreateTopic(TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell,LOG_Running);
	B_LogEntry(TOPIC_Garvell,"Garvell by r?d z?skal n?jak? informace o sk?etech a tak? by ho zaj?malo, pro? se ve m?st? usadili paladinov?.");
};

func void B_GarvellWeiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Dob?e. Jestli zjist?? n?co dal??ho, dej mi v?d?t.
};

func void B_GarvellSuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//D?ky za informace. Takhle to vypad?, ?e na postaven? lodi m?me celou v??nost.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_Orks(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 3;
	condition = DIA_Garvell_Orks_Condition;
	information = DIA_Garvell_Orks_Info;
	permanent = FALSE;
	description = "M?m n?jak? informace o sk?etech.";
};


func int DIA_Garvell_Orks_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//M?m n?jak? informace o sk?etech.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Tak pov?dej.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Zasekli se v Hornick?m ?dol? a vypad? to, ?e tam cht?j? z?stat.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Aby n?s udr?eli v bezpe??, hl?daj? paladinov? pr?smyk do ?dol?.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Paladine(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_Paladine_Condition;
	information = DIA_Garvell_Paladine_Info;
	permanent = FALSE;
	description = "V?m, pro? tu paladinov? jsou.";
};


func int DIA_Garvell_Paladine_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//V?m, pro? tu paladinov? jsou.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//V??n?? ?ekni mi to!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Paladinov? jsou tu, aby z?skali magickou rudu z Hornick?ho ?dol?, ne proto, ?e by o?ek?vali sk?et? ?tok na m?sto.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Jakmile dostanou rudu, vr?t? se na pevninu.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_City(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 4;
	condition = DIA_Garvell_City_Condition;
	information = DIA_Garvell_City_Info;
	permanent = FALSE;
	description = "A ten sk?et za m?stem...";
};


func int DIA_Garvell_City_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 2))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//A ten sk?et za m?stem...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Anooo...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Ned?lej si s n?m starosti. M?stsk? str?? to s n?m vy??d?.
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Perm(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 13;
	condition = DIA_Garvell_Perm_Condition;
	information = DIA_Garvell_Perm_Info;
	permanent = TRUE;
	description = "Jak to jde v p??stavu?";
};


func int DIA_Garvell_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Jak to jde v p??stavu?
	if(MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Sk?eti n?m jdou po krku a ty se pt?? na p??stav?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Jen jsem cht?l...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//N?? nejv?t?? probl?m je v tom, ?e nem?me dost lod?, abychom se odsud mohli dostat.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Vlastn? je tu jen jedna lo?, a ta pat?? paladin?m. Ur?it? ji tu nemaj? proto, aby n?s na n? odsud dostali.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Jen se pod?vej s?m, nic se tu ned?je.
	};
};

