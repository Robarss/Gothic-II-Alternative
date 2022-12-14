
instance DIA_Addon_Owen_EXIT(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 999;
	condition = DIA_Addon_Owen_EXIT_Condition;
	information = DIA_Addon_Owen_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Owen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Owen_PICKPOCKET(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 900;
	condition = DIA_Addon_Owen_PICKPOCKET_Condition;
	information = DIA_Addon_Owen_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Owen_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Addon_Owen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,Dialog_Back,DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};

func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};


instance DIA_Addon_Owen_Hello(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_Hello_Condition;
	information = DIA_Addon_Owen_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Owen_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Hello_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//V?echno v po??dku?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//A ty jsi KDO? Jsi jedn?m z bandit??
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//Vypad?m tak?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_PIR_M_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_L_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Nos?? na?e oble?en?, ale nezn?m t?.
	}
	else if((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Kdybych m?l b?t up??mn?, ?ekl bych ti, abys to ud?lal.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Ne. Jak se tak d?v?m na tvoje ?aty, tak bych ?ekl, ?e jsi zdaleka.
	};
};


instance DIA_Addon_Owen_WasMachen(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_WasMachen_Condition;
	information = DIA_Addon_Owen_WasMachen_Info;
	description = "Co tady d?l???";
};


func int DIA_Addon_Owen_WasMachen_Condition()
{
	if(Malcom_Accident == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Jsem d?evorubec a sek?m d??v? pro n?? t?bor.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//Vl???m se sem za touto vy?erp?vaj?c? prac? a jin? si leno?? na slunci.
};


instance DIA_Addon_Owen_Perm(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 99;
	condition = DIA_Addon_Owen_Perm_Condition;
	information = DIA_Addon_Owen_Perm_Info;
	permanent = TRUE;
	description = "Co jin?ho?";
};


func int DIA_Addon_Owen_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_WasMachen) || Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//Co jin?ho?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Pokud bych v?ehno tohle v?d?l d??v, nestal bych se pir?tem.
};


instance DIA_Addon_Owen_Henry(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_Henry_Condition;
	information = DIA_Addon_Owen_Henry_Info;
	permanent = TRUE;
	description = "Henry ?ek? na doru?en? d?ava na palis?du.";
};


func int DIA_Addon_Owen_Henry_Condition()
{
	if((MIS_Henry_HolOwen == LOG_Running) && (Owen_ComesToHenry == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Henry_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry ?ek? na doru?en? d?ava na palis?du.
	if(MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//Prvn? chci v?d?t, co se stalo s m?m k?mo?em Malcomem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Dob?e, dob?e. P?esv?d??m se, jestli dostane to jeho hloup? d?evo.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Jdi zp?tky a vy?i? mu to.
		B_LogEntry(TOPIC_Addon_HolOwen,"?ekl jsem Henrymu, ?e Owen tu dod?vku d?eva doru??.");
		AI_StopProcessInfos(self);
		Owen_ComesToHenry = TRUE;
	};
};


instance DIA_Addon_Owen_MalcomStunt(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_MalcomStunt_Condition;
	information = DIA_Addon_Owen_MalcomStunt_Info;
	description = "Co je?";
};


func int DIA_Addon_Owen_MalcomStunt_Condition()
{
	if(Malcom_Accident == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_MalcomStunt_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Co je?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//M?j k?mo? Malcom po??d chyb?.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//Za?to?il na n?s jeden z t?ch ??havc?.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Tak jsme se schovali do t?to jeskyn?.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Bohu?el ten ??havec p?i?el za n?mi.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcom s n?m bojoval a pak s n?m spadl tady to t? d?ry.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Vypad? to, ?e je tam voda.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Malcom s ??havcem je?t? chv?li bojovali. Potom ale nastalo ?pln? ticho.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Nem?m tu?en? jestli je je?t? na ?ivu nebo ne.
	Log_CreateTopic(TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MalcomsStunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_MalcomsStunt,"Owen chce v?d?t, jestli jeho kamar?d Malcom st?le ?ije. Spadl toti? s ??havcem do hlubok? propasti vedle t?bora.");
	Log_AddEntry(TOPIC_Addon_MalcomsStunt,"Owen ??kal, ?e je tam dole vodop?d a ?e Malcom byl je?t? chv?li na ?ivu. Ale kr?tce na to bylo v?ude ticho.");
	MIS_Owen_FindMalcom = LOG_Running;
};


instance DIA_Addon_Owen_runter(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_runter_Condition;
	information = DIA_Addon_Owen_runter_Info;
	description = "Jak bych se mohl dostat do t? ?t?rbiny?";
};


func int DIA_Addon_Owen_runter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) > 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_runter_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Jak bych se mohl dostat do t? ?t?rbiny?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Kdo v?. Ale h?dal bych, ?e jedin? ?plh?n?m nebo sk?k?n?m.
};


instance DIA_Addon_Owen_MalcomDead(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_MalcomDead_Condition;
	information = DIA_Addon_Owen_MalcomDead_Info;
	description = "Tv?j k?mo? Malcom je mrtv?.";
};


func int DIA_Addon_Owen_MalcomDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_MalcomDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Tv?j k?mo? Malcom je mrtv?.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//Toho jsem se ob?val. Chud?k. M?l jsem mu pomoct.
	if(SC_MadeStunt == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//M?? opravdu odvahu, v?? to?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Nikdy bych to nemohl ud?lat.
	};
	B_LogEntry(TOPIC_Addon_MalcomsStunt,"Informoval jsem Owena o Malcomov? smrti. Vzal to docela dob?e.");
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Owen_MalcomDead);
};

