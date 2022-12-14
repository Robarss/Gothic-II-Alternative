
instance DIA_Addon_Henry_EXIT(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 999;
	condition = DIA_Addon_Henry_EXIT_Condition;
	information = DIA_Addon_Henry_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Henry_Gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 zlatych.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 zlatych.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 zlatych.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 zlatych.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 zlatych.
	}
	else
	{
		B_Say_Gold(self,other,gold);
	};
};


instance DIA_Addon_Henry_PICKPOCKET(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 900;
	condition = DIA_Addon_Henry_PICKPOCKET_Condition;
	information = DIA_Addon_Henry_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Henry_PICKPOCKET_Condition()
{
	return C_Beklauen(40,60);
};

func void DIA_Addon_Henry_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,Dialog_Back,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};


const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";

instance DIA_Addon_Henry_Hello(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Hello_Condition;
	information = DIA_Addon_Henry_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Hello_Condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//ST?T!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//P??tel nebo nep??tel?
	Info_ClearChoices(DIA_Addon_Henry_Hello);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Nep??tel!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice(DIA_Addon_Henry_Hello,"P??tel!",DIA_Addon_Henry_Hello_Freund);
};


var int Henry_SC_Frech;

func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Nep??tel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Hlup?ku. Jsi p?ipraven? na v?prask?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//Pov?z co chce?, nebo vypadni.
	Henry_SC_Frech = TRUE;
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//P??tel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//To m??e ??ct ka?d?! Ani t? nezn?m. Co tu vlastn? d?l???
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};


instance DIA_Addon_Henry_SecondWarn(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_SecondWarn_Condition;
	information = DIA_Addon_Henry_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//P?ibl?? se je?t? o krok bl?? k t?boru a nakrm?m s tebou ?raloky.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Henry_Attack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Attack_Condition;
	information = DIA_Addon_Henry_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Koledoval sis o to ...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


var int Henry_Zoll_WhatFor;

instance DIA_Addon_Henry_WantEnter(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_WantEnter_Condition;
	information = DIA_Addon_Henry_WantEnter_Info;
	permanent = FALSE;
	description = "Chci j?t do t?bora!";
};


func int DIA_Addon_Henry_WantEnter_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chci j?t do t?bora!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Fakt? Tak to t? v?jde p?kn? draze.
	B_Henry_Gold(500);
	if(Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Co?e? A pro??
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Ty se? n?jak neodbytnej.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//Tady v t?bo?e je mnoho v?c?, o kter? by ses mohl zaj?mat ...
		Henry_Zoll_WhatFor = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ItAr_KDF_L) == TRUE) || (Hlp_IsItem(itm,ItAr_KDF_H) == TRUE) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(itm,ItAr_MIL_M) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//Vypad??, ?e ma? dostatek zlata.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//Men?? poplatek t? ur?it? nezabije.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//Nebo jsi ty fajnov? hadry n?komu ukradl?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//Ur?it? m?? n?jak? zlato, ?e?
	};
};

func void B_Henry_NoJoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Jestli se k n?m chce? p?idat, tak t? asi mus?m zklamat, ml?den?e!
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapit?n s polovinou chlap? z t?bora odplul na mo?e. A on je jedin?, kdo p??jm? nov? ?leny.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale m??e? po?kat, dokud se nevr?t?.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Nesna? se tu ov?em zpusobit n?jak? probl?m!
};


instance DIA_Addon_Henry_Einigen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_Einigen2_Condition;
	information = DIA_Addon_Henry_Einigen2_Info;
	description = "Tu m?? 500 zlat?ch.";
};


func int DIA_Addon_Henry_Einigen2_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter) && !Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (Npc_HasItems(other,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Tu ma? 500 zlat?ch.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//V?born?. V?t?m t? v t?bo?e.
	B_Henry_NoJoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Addon_Henry_Einigen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Einigen_Condition;
	information = DIA_Addon_Henry_Einigen_Info;
	description = "Nemohli bychom se dohodnut n?jak l?p?";
};


func int DIA_Addon_Henry_Einigen_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Nemohli bychom se dohodnut n?jak l?p?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Mo?n?. Dej mi n?jak? dobr? d?vod a mo?n? t? to vyjde levn?ji.
};


instance DIA_Addon_Henry_MeatForMorgan(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 4;
	condition = DIA_Addon_Henry_MeatForMorgan_Condition;
	information = DIA_Addon_Henry_MeatForMorgan_Info;
	permanent = FALSE;
	description = "M?m p?in?st Morganovi tohle maso.";
};


func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//M?m p?in?st Morganovi tohle maso.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//(ost?e) A kdo t? poslal?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Alligator Jack. ?ekl mi, ?e Morgan na n?j u? ?ek?.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Rozum?m, rozum?m. P?ece se nebude obt??ovat s?m, ?e?
};


instance DIA_Addon_Henry_Malcom(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Malcom_Condition;
	information = DIA_Addon_Henry_Malcom_Info;
	description = "Pos?la m? Malcom...";
};


func int DIA_Addon_Henry_Malcom_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MalcomBotschaft == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Pos?la m? Malcom. M?m ti vzk?zat, ?e na ty tr?my pot?ebuje je?t? n?jak? ?as.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(lamentov?n?) Och ano, ano. To jsem si mohl myslet. Ur?it? mu to bude trvat celou v??nost.
	B_MalcomExident();
};


instance DIA_Addon_Henry_BaltramPack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_BaltramPack_Condition;
	information = DIA_Addon_Henry_BaltramPack_Info;
	description = "M?m z?silku pro Skipa. Je v t?bo?e?";
};


func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//M?m z?silku pro Skipa. Je v t?bo?e?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Ano. Skip tu je. A co je?t? chce??
};


var int Henry_Amount;

instance DIA_Addon_Henry_Tribut(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 7;
	condition = DIA_Addon_Henry_Tribut_Condition;
	information = DIA_Addon_Henry_Tribut_Info;
	permanent = TRUE;
	description = "Pus? m? dovnit?.";
};


func int DIA_Addon_Henry_Tribut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Pus? m? dovnit?.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm ...
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//P?inesl jsi mi vzkaz od d?evorubce.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Chce? si hr?t na posl??ka Aligatora Jacka a doru?it maso z mo??lov?ch krys Morganovi.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//M?? z?silku pro Skipa.
		Henry_Amount = Henry_Amount - 100;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if(Henry_Amount < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A nejlep?? na tom je:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Postaral JSI se o ty spr?skan? psy na v??i.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nemyslel jsem si, ?e to vzl?dne? s?m.
		Henry_Amount = Henry_Amount - 200;
	};
	if(Henry_Amount <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//V?? co, m??e? j?t dovnit? zadarmo.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//... anebo znovu zmizne?. Je to jednoduch?.
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut,"To je dost.",DIA_Addon_Henry_Tribut_nein);
		if(Npc_HasItems(other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut,"Dobr?. Tu je tv? zlato.",DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobr?. Tu je tv? zlato.
	B_GiveInvItems(other,self,ItMi_Gold,Henry_Amount);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//D?kuji. V?tam t? v na?em t?bo?e.
	B_Henry_NoJoin();
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To je dost.
	if(Henry_Amount < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No tak, u? jsem ti to dost zlevnil.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Tak potom vypadni.
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};


instance DIA_Addon_Henry_Palisade(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Condition;
	information = DIA_Addon_Henry_Palisade_Info;
	permanent = FALSE;
	description = "Co tu dela??";
};


func int DIA_Addon_Henry_Palisade_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co tu dela??
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//Co si mysl??? Mus?m dohl?dnut na tyhle slabochy, aby dostav?li palis?du.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Jak to nepostav?me, tak m? kapit?n Greg nakope do zadku.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Nav?c mus?m dohl??et na to, aby sem nenapochodoval ka?d?, komu se zachce!
};


instance DIA_Addon_Henry_Palisade_WhatFor(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 12;
	condition = DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information = DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent = FALSE;
	description = "Pro? tu stav?te palisadu?";
};


func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Pro? tu stav?te palisadu?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Aby to banditi nem?li TAK jednoduch?!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Ti bastardi jsou ??md?l drzej??. Ji? n?kolik dn? obkli?uj? n?? t?bor. P?esn? jako ?raloci obkli?uj? ztroskotance na mo?i.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//N?kolik t?ch bastard? se ukrylo do v??e na jih od t?bora.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale jsem si jist, ?e je to jen v?zv?dn? hl?dka.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Jestli jsou tak blb?, ?e na n?s za?to??, tak je p?iv?t?me jak se pat??.
	Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
	B_LogEntry(TOPIC_Addon_BanditsTower,"N?kolik bandit? se usadilo ve v??i na jih od pir?tsk?ho t?bora a zabarik?dovali se tam.");
};

func void B_Henry_WhereIsTower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Kde p?esn? je ta v???
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Vyjdi odsud a dr? se vpravo.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//Tam, na mal?m ?tesu, najde? v??.
};


instance DIA_Addon_Henry_Turmbanditen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 13;
	condition = DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information = DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent = TRUE;
	description = "Ohledn? t?ch bandit? z v??e ...";
};


func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor) && (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Ohledn? t?ch bandit? z v??e ...
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Ano?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Postaral jsem se o to.
		if(MIS_Henry_FreeBDTTower == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Vyborn?! O jeden probl?m m??.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Fakt jsi je vyhnal s?m? Jse? dobrej!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kdo v?, mo?n? se z tebe jednou stane opravdov? pir?t!
		};
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(HammerPirate,"START");
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_LogEntry(TOPIC_Addon_BanditsTower,"Banditi z v??e jsou mrtv?.");
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co te??
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Jestli se chyst?? j?t na n? S?M, tak na to zapome?!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//P?inejhor??m tam po?lu dva sv? chlapy. Oni se o ty bandity postaraj?.
		Knows_HenrysEntertrupp = TRUE;
	};
};


instance DIA_Addon_Henry_Palisade_Bandits(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 14;
	condition = DIA_Addon_Henry_Palisade_Bandits_Condition;
	information = DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent = FALSE;
	description = "Pro? na v?s banditi ?to???";
};


func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Pro? na v?s banditi ?to???
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//Proto?e boj mezi n?mi a nimi pokra?uje! Co sis myslel?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na za??tku to bylo v po??dku. P?ivezli jsme je sem a oni se usadili v ba?in?ch, nechaj?c n?s na pokoji.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Od t? doby za?ali napadat ka?d?ho, kdo k nim nepat??.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Co jsem se doslechl, d?moni je vyhnali.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//Myslel jsem, ?e cht?j? na?e lod?. Prece jen - nen? ??dnej jinej zp?sob, jak se odsud dostat.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Zeptej se na to Skipa. Byl tam - a vyv?zl ?ivej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//Je to zaj?mav? p??b?h. U? mi o tom hodn? ??kal.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(podez??vav?) ?koda ?e si to nem??e? poslechnout, kdy? te? nem?? na zaplacen? cla.
		Henry_Zoll_WhatFor = TRUE;
	};
};


var int Henry_EnterCrewMember;

instance DIA_Addon_Henry_Entercrew(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 31;
	condition = DIA_Addon_Henry_Entercrew_Condition;
	information = DIA_Addon_Henry_Entercrew_Info;
	permanent = TRUE;
	description = "Chci se p?idat do va?? party.";
};


func int DIA_Addon_Henry_Entercrew_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chci se p?idat do va?? party.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(sm?ch) To nen? tak jednoduch? dostat se k n?m, chlap?e!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Nejd??v si mus?me popov?dat, zda t? v?bec pust?m do t?bora.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//J?, v?t?m t? v na?? part?!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//O jednoho mu?e v?c, kter? n?m pom??e ubr?nit se p?ed bandity.
		if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm, cht?l jsem ??ct, aby sis vzal jednoho chlapa a vymydlil ty lumpy z v??e.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ty jsi to u? ud?lal.
		}
		else
		{
			if(Npc_IsDead(SawPirate) && Npc_IsDead(HammerPirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Oba moji chlapi jsou mrtv?. Vypad? to tak, ?e si bude? muset poradit s?m.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Zbav sa t?ch bandit? ve v??i.
				B_LogEntry(TOPIC_Addon_BanditsTower,"Henry chce abych vyhnal bandity z v??e. Nedal mi ov?em nic na obranu.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//Seber si jednoho chlapa a vy?e?te ty bandity z v??e.
				Henry_GetPartyMember = TRUE;
				B_LogEntry(TOPIC_Addon_BanditsTower,"Henry chce abych vyhnal bandity z v??e. M??u sebou vz?t jednoho mu?e.");
			};
			B_Henry_WhereIsTower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//V?dy s v?ma, pane.
			MIS_Henry_FreeBDTTower = LOG_Running;
		};
		Henry_EnterCrewMember = TRUE;
	};
};


instance DIA_Addon_Henry_Owen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 32;
	condition = DIA_Addon_Henry_Owen_Condition;
	information = DIA_Addon_Henry_Owen_Info;
	description = "Je je?t? n?co, s ??m bych mohl pomoct?";
};


func int DIA_Addon_Henry_Owen_Condition()
{
	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE) && !Npc_IsDead(Malcom))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Je je?t? n?co, s ??m bych mohl pomoct?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//U? n?kolik dn? ?ek?me na z?silku tr?m? na palis?du.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcom a Owen to m?li don?st u? d?vno.
	if(!Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//D?evorubeck? t?bor je nedaleko odsud, u jezera na jihov?chod?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcom s?ce ?ekl ?e to m??e trvat trochu d?le, ale ne?ekl ?e to bude trvat celou v??nost.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//?ekni jim, ?e ?ek?me na ty tr?my.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nezdr?uj se. Pov?z to rad?i OWENOVI. Malcom nen? spolehliv?.
	B_MalcomExident();
	MIS_Henry_HolOwen = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_Running);
	B_LogEntry(TOPIC_Addon_HolOwen,"Henry ?ek? na tr?my na hradby. Ozn?mil jsem to Owenovi. Stoj? u jezera spolu s Malcomem.");
};

func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Stalo se n?co Malcomovi?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Je mrtv?.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Vypad? to, ?e jeho ?test? pominulo, co?
};


instance DIA_Addon_Henry_Owen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 33;
	condition = DIA_Addon_Henry_Owen2_Condition;
	information = DIA_Addon_Henry_Owen2_Info;
	permanent = TRUE;
	description = "O d?evorubci Owenovi ...";
};


func int DIA_Addon_Henry_Owen2_Condition()
{
	if(MIS_Henry_HolOwen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//O d?evorubci Owenovi ...
	if(Npc_IsDead(PIR_1367_Addon_Owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Je mrtv?.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Sakra! To znamen?, ?e se o to mus? postarat n?kdo jin?.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//(podr??d?n?) Je na?ase, aby Morgan za?al d?lat svoji pr?ci po??dn? a vy?istil oblast od v?ech p???er.
		B_Addon_Henry_MalcomsDead();
		MIS_Henry_HolOwen = LOG_OBSOLETE;
		B_LogEntry(TOPIC_Addon_HolOwen,"Owen a Malcom jsou mrtv?.");
		Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	}
	else if(Owen_ComesToHenry == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen brzo po?le tr?my.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//V?born?, u? bylo na?ase.
		B_Addon_Henry_MalcomsDead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Tady je tv? odm?na.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		B_StartOtherRoutine(PIR_1367_Addon_Owen,"PostStart");
		B_LogEntry(TOPIC_Addon_HolOwen,"Owen po?le tr?my Henrymu.");
		MIS_Henry_HolOwen = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Kde se zase ut?bo?il?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Nen? to daleko odsud, sm?rem na jihov?chod, bl?zko jezera.
	};
};


var int Henry_PERM_Once;

instance DIA_Addon_Henry_Palisade_CanHelp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 34;
	condition = DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information = DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent = TRUE;
	description = "Pot?ebuje? pomoc?";
};


func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if((MIS_Henry_HolOwen == LOG_SUCCESS) || (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Pot?ebuje? pomoc?
	if(Henry_PERM_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//M?? zku?enosti se stav?n?m palis?d?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Ne, v?bec.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//V tom p??pad? pro tebe nem?m vyu?it?. Jdi pomoct n?kam jinam.
		Henry_PERM_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//UH! A te? b?? pro m? za m? kam chce?, ale hlavn? nevyru?uj m? d?ln?ky.
};


instance DIA_Addon_Henry_WhatTeach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 21;
	condition = DIA_Addon_Henry_WhatTeach_Condition;
	information = DIA_Addon_Henry_WhatTeach_Info;
	permanent = TRUE;
	description = "M??e? mi pomoct vylep?it se v boji?";
};


func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//M??e? mi pomoct vylep?it se v boji?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(sm?ch) Nejrpve si spl? povinnosti. A? potom ti pov?m n?co o vylep?en? boje!
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//(?ibalsky) Moje povol?n? zahrnuje v?e.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Jist?, pro? ne?
		Henry_Addon_TeachPlayer = TRUE;
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};


var int Henry_merke2h;
var int Henry_Labercount;

func void B_Henry_CommentFightSkill()
{
	if(Henry_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//U??? se rychle, jako spr?vnej pir?t.
		Henry_Labercount = 1;
	}
	else if(Henry_Labercount == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Jak bude? takhle pokra?ovat, m??e? nastoupit na galeje celkem s?m.
		Henry_Labercount = 2;
	}
	else if(Henry_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//A pamatuj, kdo se kryje, ?ije d?le.
		Henry_Labercount = 0;
	};
};


instance DIA_Addon_Henry_Teach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_Teach_Condition;
	information = DIA_Addon_Henry_Teach_Info;
	permanent = TRUE;
	description = "U? m?!";
};


func int DIA_Addon_Henry_Teach_Condition()
{
	if(Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//U? m?!
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] > Henry_merke2h)
	{
		B_Henry_CommentFightSkill();
	}
	else if(other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Pekeln? ses zlep?il.
	};
	Info_ClearChoices(DIA_Addon_Henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};


instance DIA_Addon_Henry_Palisade_Train(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Train_Condition;
	information = DIA_Addon_Henry_Palisade_Train_Info;
	permanent = FALSE;
	description = "Greg je tvuj ??f?";
};


func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg je tvuj ??f?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//P?esn? tak. A pro tebe je to KAPIT?N Greg. M?m ti to vysv?tlit?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//Je to skv?l? mu?. Kdy? ho potk??, tak na n?j nezkou?ej ?adnej podraz. Nemusela by se ti l?bit jeho reakce.
	if(PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ve skute?nosti jsem se s n?m u? potkal.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//Ach tak. Tak?e v?? o ?em mluv?m.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Nane???st? te? nen? v t?bo?e.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jeho z?stupce se jmenuje Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Po cel? den sed? p?ed Gregovou chatr??, a z?r? na n?s, jak pracujeme.
};


instance DIA_Addon_Henry_YourOwnTrupp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_YourOwnTrupp_Condition;
	information = DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapit?n z v?s ud?lal ??dnou partu, co?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ano, d??v ne? se ujist?me, ?e chlapi za?ali pracovat!
	AI_StopProcessInfos(self);
};

