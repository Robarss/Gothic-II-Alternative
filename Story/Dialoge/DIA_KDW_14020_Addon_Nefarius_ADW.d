
instance DIA_Addon_Nefarius_ADW_EXIT(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 999;
	condition = DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_ADWHello(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_ADWHello_Condition;
	information = DIA_Addon_Nefarius_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_00");	//Uklidnilo mě, že jsi dorazil v pořádku.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_01");	//Jaktože jsi dorazil dřív než já?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_02");	//Cestovali jsme skrz zvláštní dimenzi. Kdo ví, kde ses točil.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_03");	//Zvláštní. Můžu použít portál i jindy?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_04");	//Dorazili jsme přesně sem. Funguje zřejmě velmi dobře.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_05");	//Dám ti vědět, kdybych měl podezření, že se něco změnilo.
};


instance DIA_Addon_Nefarius_Neues(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Neues_Condition;
	information = DIA_Addon_Nefarius_Neues_Info;
	description = "Co jsi dělal do teď?";
};


func int DIA_Addon_Nefarius_Neues_Condition()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Neues_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Co jsi dělal do teď?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_01");	//Studuji historii stavitelů a snažím se přijít na to, proč portál uzavřeli.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_02");	//Vypadá to, jakoby chtěli skrýt toto ztracené město před zbytkem světa.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_03");	//Strašné věci se staly před mnoha lety. Něco strašného je posedlo.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_04");	//Pokud bychom věřili záznamům, tak předtím než bylo město prokleto tu zuřila děsivá občanská válka.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_05");	//Cesty byly v plamenech a hltající příliv nakonec zpečetil osudy stavitelů.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_06");	//Těch pár, co přežili tohle peklo, uzavřelo tuto část ostrova s nadějí, že zde s ním uzamknou i zlo.
	Info_ClearChoices(DIA_Addon_Nefarius_Neues);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Co myslíš, že tady najdeme?",DIA_Addon_Nefarius_Neues_find);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"A my hlupáci znovu otevřeme portál.",DIA_Addon_Nefarius_Neues_auf);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Tak co rozrušilo stavitele?",DIA_Addon_Nefarius_Neues_was);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Říkal jsi, že přišel příliv?",DIA_Addon_Nefarius_Neues_flut);
};

func void DIA_Addon_Nefarius_Neues_find()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_find_15_00");	//Co myslíš, že tady najdeme?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_01");	//To můžeme jenom hádat. Měl by sis promluvit spíš se Saturasem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_02");	//Máme nápad.
	Log_CreateTopic(TOPIC_Addon_Flut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut,LOG_Running);
	B_LogEntry(TOPIC_Addon_Flut,"Nefarius si myslí, že bych si měl promluvit se Saturasem o tomhle zruinovaném městě.");
	NefariusADW_Talk2Saturas = TRUE;
};

func void DIA_Addon_Nefarius_Neues_flut()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_flut_15_00");	//Říkal jsi, že přišel příliv?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_01");	//Adanos se jim sám zjevil za účelem přerušit to šílenství.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_02");	//Zatopil město.
};

func void DIA_Addon_Nefarius_Neues_was()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_was_15_00");	//Tak co rozrušilo stavitele?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_01");	//Někdo z nich svěřil svou duši zlu. Byl to skvělý velitel Quarhodron.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_02");	//Když se vrátil z jedné úspěšné bitvy, přinesl s sebou i zlo.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_03");	//Všichni jeho přívrženci začali mít sklon k šílenství a začali bojovat proti svým vlastním lidem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_04");	//A nastávájíci občanská válka zničila všechno.
};

func void DIA_Addon_Nefarius_Neues_auf()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_auf_15_00");	//A my hlupáci znovu otevřeme portál.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_01");	//Cítím se jinak než obvykle. To je divné.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_02");	//Ale máme na výběr?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_03");	//Pokud se nám nepodaří zastavit to, co se tady děje, tak to snad v Khorinisu pochopí.
};


instance DIA_Addon_Nefarius_PermADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 10;
	condition = DIA_Addon_Nefarius_PermADW_Condition;
	information = DIA_Addon_Nefarius_PermADW_Info;
	permanent = TRUE;
	description = "Cesta portálem je bezpečná?";
};


func int DIA_Addon_Nefarius_PermADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_00");	//Cesta portálem je bezpečná?
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_01");	//Dosud o tom nepochybuji.
};


instance DIA_Addon_Nefarius_PreTeach(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_PreTeach_Condition;
	information = DIA_Addon_Nefarius_PreTeach_Info;
	description = "Mohl bys mě zasvětit do tajů magie?";
};


func int DIA_Addon_Nefarius_PreTeach_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PreTeach_15_00");	//Mohl bys mě zasvětit do tajů magie?
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_01");	//Můžu tě naučit vyrábět nějaké runy a Cronos ti na ně může prodat suroviny.
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_02");	//Vždycky u sebe má knihu o runách.
	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_NefariusTeach);
};


instance DIA_Addon_Nefarius_ADW_Runen(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_ADW_Runen_Condition;
	information = DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent = TRUE;
	description = "Uč mě (tvorba run)";
};


func int DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if(Nefarius_Addon_TeachRunes == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Info()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"6. Kruh magie",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"5. Kruh magie",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"4. Kruh magie",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"3. Kruh magie",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"2. Kruh magie",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"1. Kruh magie",DIA_Addon_Nefarius_ADW_Runen_1);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
};

func void DIA_Addon_Nefarius_ADW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Zap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Zap)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

