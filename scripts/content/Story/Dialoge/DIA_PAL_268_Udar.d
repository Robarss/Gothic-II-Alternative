
instance DIA_Udar_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_EXIT_Condition;
	information = DIA_Udar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_EXIT_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Hello(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = DIA_Udar_Hello_Condition;
	information = DIA_Udar_Hello_Info;
	important = TRUE;
};


func int DIA_Udar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_Hello_Info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//Kdy? jsi ve?el, m?l jsi zatracen? ?t?st?. M?lem jsem t? zast?elil.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//V tom p??pad? bych asi m?l b?t r?d, ?e m?? tak skv?l? zrak.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//?et?i si dech. Jestli n?co chce?, promluv si se Sengrathem.
	AI_StopProcessInfos(self);
};


instance DIA_Udar_YouAreBest(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_YouAreBest_Condition;
	information = DIA_Udar_YouAreBest_Info;
	permanent = FALSE;
	description = "Sly?el jsem, ?e jsi NEJLEP?? st?elec z ku?e ?iroko daleko.";
};


func int DIA_Udar_YouAreBest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_Udar))
	{
		return 1;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//Sly?el jsem, ?e jsi NEJLEP?? st?elec z ku?e ?iroko daleko.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//Pokud se to ??k?, tak to asi bude pravda. Co chce??
};


instance DIA_Udar_TeachMe(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_TeachMe_Condition;
	information = DIA_Udar_TeachME_Info;
	permanent = FALSE;
	description = "Nau? m?, jak spr?vn? st??let z ku?e.";
};


func int DIA_Udar_TeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest) && (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Nau? m?, jak spr?vn? st??let z ku?e.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Zmiz! Kolem hradu pob?h? spousta ter??. Cvi? se na nich.
};


instance DIA_Udar_ImGood(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_ImGood_Condition;
	information = DIA_Udar_ImGood_Info;
	permanent = FALSE;
	description = "Jsem nejlep??.";
};


func int DIA_Udar_ImGood_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};

func void DIA_Udar_ImGood_Info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//Jsem nejlep??.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(sm?je se) To teda jo!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//No, pokud se chce? u?it, pom??u ti.
	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"Udar mi vysv?tl?, jak zach?zet s ku??.");
};


instance DIA_Udar_Teach(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_Teach_Condition;
	information = DIA_Udar_Teach_Info;
	permanent = TRUE;
	description = "Chci se u?it od tebe.";
};


func int DIA_Udar_Teach_Condition()
{
	if(Udar_TeachPlayer == TRUE)
	{
		return 1;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Chci se u?it od tebe.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Dobr?, tak spus?!
	Info_ClearChoices(DIA_Udar_Teach);
	Info_AddChoice(DIA_Udar_Teach,Dialog_Back,DIA_Udar_Teach_Back);
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};

func void DIA_Udar_Teach_Back()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void B_Udar_TeachNoMore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Z?klady u? um?? - na v?c nem?me ?as.
};

func void B_Udar_TeachNoMore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Jestli se chce? nau?it se svou zbran? zach?zet l?pe, m?l by sis naj?t skute?n?ho u?itele.
};

func void DIA_Udar_Teach_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
};

func void DIA_Udar_Teach_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};


instance DIA_Udar_Perm(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Perm_Condition;
	information = DIA_Udar_Perm_Info;
	permanent = FALSE;
	description = "Jak to jde tady na hrad??";
};


func int DIA_Udar_Perm_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Udar_Perm_Info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//Jak to jde tady na hrad??
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//P?r chlapc? tr?nuje, ale v z?sad? ?ek?me, a? se n?co stane.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//Tahle nejistota n?s ub?j?. To maj? sk?eti p?esn? v pl?nu. ?ekaj?, a? n?m prasknou nervy.
};


instance DIA_Udar_Ring(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Ring_Condition;
	information = DIA_Udar_Ring_Info;
	permanent = FALSE;
	description = "P?in???m ti Tengron?v prsten...";
};


func int DIA_Udar_Ring_Condition()
{
	if(Npc_HasItems(other,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//P?in???m ti Tengron?v prsten. M?l by t? chr?nit. A? se Tengron vr?t?, bude ho cht?t zp?tky.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//Co?e? V??, co to je za prsten? Dostal ho jako odm?nu za svou odvahu v boji.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//??k??, ?e ho bude cht?t zp?tky? Pokud to je v?le Innosova, stane se tak. Pokud to je v?le Innosova...
	B_GiveInvItems(other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};


instance DIA_Udar_KAP4_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP4_EXIT_Condition;
	information = DIA_Udar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Kap4WiederDa(C_Info)
{
	npc = PAL_268_Udar;
	nr = 40;
	condition = DIA_Udar_Kap4WiederDa_Condition;
	information = DIA_Udar_Kap4WiederDa_Info;
	important = TRUE;
};


func int DIA_Udar_Kap4WiederDa_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//Je dob?e, ?e jsi p?i?el. Brzy tady propukne peklo.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//Co se stalo?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//Po hrad? se poflakuj? drakobijci a chv?staj? se, ?e dok??? vy?e?it na?e probl?my s draky.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//Ale n?co ti pov?m - vypadaj?, jako by nedok?zali zne?kodnit ani nemocn?ho star?ho slep??e.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//Spousta z n?s si za??n? d?lat starosti a u? moc nev???me, ?e se odsud dostaneme se zdravou k???.
};


instance DIA_Udar_Sengrath(C_Info)
{
	npc = PAL_268_Udar;
	nr = 41;
	condition = DIA_Udar_Sengrath_Condition;
	information = DIA_Udar_Sengrath_Info;
	description = "Nebyli jste tady na hl?dce dva?";
};


func int DIA_Udar_Sengrath_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Kap4WiederDa) && (Sengrath_Missing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Sengrath_Info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//Nebyli jste tady na hl?dce dva?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//B?valo. Sengrath st?l tady na hradb?ch a najednou z ni?eho nic usnul.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//Kdy? se to stalo, jeho dobr? samost??l spadnul dol?.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//Vid?li jsme, jak ho sk?eti popadli a zmizeli s n?m ve tm?.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Sengrath se hned probudil a vyb?hl do noci sm?rem ke sk?et? palis?d?. Od t? chv?le jsme ho nevid?li.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Innos st?j p?i n?s!
	Log_CreateTopic(TOPIC_Sengrath_Missing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing,LOG_Running);
	B_LogEntry(TOPIC_Sengrath_Missing,"Udar, str??n? z hradu, postr?d? sv?ho druha Sengratha. Naposledy ho vid?l pozd? v noci, kdy? m??il ke sk?et?mu opevn?n? a vracel se pro svou ku?i.");
};


instance DIA_Udar_SENGRATHGEFUNDEN(C_Info)
{
	npc = PAL_268_Udar;
	nr = 42;
	condition = DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information = DIA_Udar_SENGRATHGEFUNDEN_Info;
	description = "Na?el jsem Sengratha.";
};


func int DIA_Udar_SENGRATHGEFUNDEN_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Sengrath) && Npc_HasItems(other,ItRw_SengrathsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//Na?el jsem Sengratha.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//V??n?? Kde je?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//Je mrtv?. Tady je jeho ku?e. M?l ji u sebe.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//Nejsp?? se mu ji poda?ilo z?skat zp?t, ale sk?eti ho nakonec p?ece jenom dostali.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Zatracen? bl?zen. V?d?l jsem to. V?ichni tady pochc?peme.
	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};


instance DIA_Udar_BADFEELING(C_Info)
{
	npc = PAL_268_Udar;
	nr = 50;
	condition = DIA_Udar_BADFEELING_Condition;
	information = DIA_Udar_BADFEELING_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Udar_BADFEELING_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Udar_SENGRATHGEFUNDEN) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_BADFEELING_Info()
{
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Je?t? jeden takov? ?tok a budeme ?r?t hl?nu.
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//Sk?eti maj? dost starost?. N?co je hrozn? vyd?silo. C?t?m to.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//Nem?m z toho v?bec dobr? pocit.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_Udar_KAP5_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP5_EXIT_Condition;
	information = DIA_Udar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_KAP6_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP6_EXIT_Condition;
	information = DIA_Udar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_PICKPOCKET(C_Info)
{
	npc = PAL_268_Udar;
	nr = 900;
	condition = DIA_Udar_PICKPOCKET_Condition;
	information = DIA_Udar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Udar_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Udar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
	Info_AddChoice(DIA_Udar_PICKPOCKET,Dialog_Back,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Udar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

