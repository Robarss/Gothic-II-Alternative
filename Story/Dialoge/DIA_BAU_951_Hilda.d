
instance DIA_Hilda_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_EXIT_Condition;
	information = DIA_Hilda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_Hallo(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Hallo_Condition;
	information = DIA_Hilda_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_Hallo_Condition()
{
	if((MIS_Lobart_Rueben != LOG_SUCCESS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//Hej, kdo tě sem zval? Okamžitě vypadni. Nikdo tě tu nechce.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//Jo, co je?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_WasZuEssen(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_WasZuEssen_Condition;
	information = DIA_Hilda_WasZuEssen_Info;
	permanent = TRUE;
	description = "Můžeš mi dát něco k jídlu?";
};


func int DIA_Hilda_WasZuEssen_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Hilda_Hallo) || (MIS_Lobart_Rueben == LOG_SUCCESS)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info()
{
	var int Rueben_TagNull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//Můžeš mi dát něco k jídlu?
		if(MIS_Lobart_Rueben == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,DIA_Hilda_PfanneTooLate))
			{
				if(Hilda_Stew_Day != Wld_GetDay())
				{
					B_GiveInvItems(self,other,ItFo_Stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//Tady, vezmi si to. Jsi dobrej pracant.
					Hilda_Stew_Day = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (Rueben_TagNull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//Pro další si můžeš přijít zase zítra.
					B_GiveInvItems(self,other,ItFo_Stew,1);
					Hilda_Stew_Day = Wld_GetDay();
					Rueben_TagNull = TRUE;
					Log_CreateTopic(Topic_Bonus,LOG_NOTE);
					B_LogEntry(Topic_Bonus,"Každý den dostanu od Hildy trochu dušených tuřínů.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//Dnešní porci už jsi dostal! Vrať se později.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//Flákače tu nekrmíme. Vypadni!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//Najíst dostanou jen ti, co tu pracují!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//Určitě máš dost zlata, aby sis mohl sám něco koupit ve městě.
	};
};


instance DIA_Hilda_BringBeet(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_BringBeet_Condition;
	information = DIA_Hilda_BringBeet_Info;
	permanent = FALSE;
	description = "Mám tady pro tebe pár tuřínů.";
};


func int DIA_Hilda_BringBeet_Condition()
{
	if((MIS_Lobart_RuebenToHilda == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >= 1) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//Mám tady pro tebe pár tuřínů.
	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems(other,self,ItPl_Beet,Npc_HasItems(other,ItPl_Beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//Výborně! (smích) To by mohlo na nakrmení těch chlapů i stačit!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//Jinak, dokud jsi tady - viděla jsem tudy před pár minutami procházet kočovného kupce.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//Mám dojem, že na cestě do města na chvíli zastavil. Běž se ho zeptat, jestli by pro mě neměl pořádnou pánev.
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//Co?! A to má být jako všechno?
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//To není moc.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//Běž na pole a přines mi další. Chlapi mají hlad!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_Einkaufen(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Einkaufen_Condition;
	information = DIA_Hilda_Einkaufen_Info;
	permanent = FALSE;
	description = "Dej mi zlato a já zajdu za tím kupcem.";
};


func int DIA_Hilda_Einkaufen_Condition()
{
	if((MIS_Lobart_RuebenToHilda == LOG_SUCCESS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//Dej mi zlato a já zajdu za tím kupcem.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//Říkáš, že ti mám věřit? Tak jen ty peníze nevyhoď za chlast, slyšíš?!
	};
	B_GiveInvItems(self,other,ItMi_Gold,20);
	MIS_Hilda_PfanneKaufen = LOG_Running;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	Log_CreateTopic(TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_Running);
	B_LogEntry(TOPIC_Hilda,"Hilda, žena sedláka Lobarta, mě požádala, abych jí u podomního obchodníka koupil nějakou pánev.");
};


instance DIA_Hilda_PfanneGeholt(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_PfanneGeholt_Condition;
	information = DIA_Hilda_PfanneGeholt_Info;
	permanent = FALSE;
	description = "Tady je tvoje pánev.";
};


func int DIA_Hilda_PfanneGeholt_Condition()
{
	if((MIS_Hilda_PfanneKaufen == LOG_Running) && (Npc_HasItems(other,ItMi_Pan) > 0) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//Tady je tvoje pánev.
	B_GiveInvItems(other,self,ItMi_Pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//Fajn. To se podívejme, ještě se dá narazit na poctivce.
	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP(XP_HildaHolPfanne);
};


instance DIA_Hilda_PfanneTooLate(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_PfanneTooLate_Condition;
	information = DIA_Hilda_PfanneTooLate_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_PfanneTooLate_Condition()
{
	if((MIS_Hilda_PfanneKaufen == LOG_Running) && (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay() - 1)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//To si ještě dovolíš se sem vracet? Cos udělal s mými penězi, ty darmošlape?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//Měls na to dost času. Kde jsou peníze, co jsem ti dala na tu pánev?
	};
	if(Npc_HasItems(other,ItMi_Pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//Promiň, zapomněl jsem. Tady je tvoje pánev!
		B_GiveInvItems(other,self,ItMi_Pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//Arrh, tak sem tu věc dej. Taková drzost - neuvěřitelné!
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP(XP_HildaHolPfanne / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//Ach! Ty to ještě pořád máš u sebe! Vrať mi to. Hned.
			B_GiveInvItems(other,self,ItMi_Gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//Taková drzost - neuvěřitelné!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//Ty to ještě nemáš! Dala jsem ti 20 zlatých!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//Jdi mi z očí, ty mizernej zloději!
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_KAP3_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP3_EXIT_Condition;
	information = DIA_Hilda_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KRANK(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 30;
	condition = DIA_Hilda_KRANK_Condition;
	information = DIA_Hilda_KRANK_Info;
	permanent = TRUE;
	description = "Cítíš se dobře?";
};


func int DIA_Hilda_KRANK_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HealHilda != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Hilda_KRANK_OnTime;

func void DIA_Hilda_KRANK_Info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//Cítíš se dobře?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//Ne, vůbec ne. Mám zase tu strašnou horečku.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//Měla bych zajít za městským léčitelem, ale jsem na to moc slabá.
	if(DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices(DIA_Hilda_KRANK);
		Info_AddChoice(DIA_Hilda_KRANK,"Tak se brzo uzdrav. Už musím jít.",DIA_Hilda_KRANK_besserung);
		Info_AddChoice(DIA_Hilda_KRANK,"Mohu nějak pomoci?",DIA_Hilda_KRANK_helfen);
		DIA_Hilda_KRANK_OnTime = TRUE;
	};
	MIS_HealHilda = LOG_Running;
};

func void DIA_Hilda_KRANK_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//Tak se brzo uzdrav. Už musím jít.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//Doufejme, že přijdou lepší časy.
	AI_StopProcessInfos(self);
};

func void DIA_Hilda_KRANK_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//Mohu nějak pomoci?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//Bylo by od tebe moc milé, kdybys zašel za Vatrasem a získal od něj lék.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//On už bude vědět, co má udělat! Já už to sama nezvládnu.
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda,"Lobartově ženě Hildě je špatně, ale Vatras by pro ni měl mít lék.");
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_HEILUNGBRINGEN(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 31;
	condition = DIA_Hilda_HEILUNGBRINGEN_Condition;
	information = DIA_Hilda_HEILUNGBRINGEN_Info;
	description = "Mám pro tebe ten lék.";
};


func int DIA_Hilda_HEILUNGBRINGEN_Condition()
{
	if(Npc_HasItems(other,ItPo_HealHilda_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//Mám pro tebe ten lék.
	B_GiveInvItems(other,self,ItPo_HealHilda_MIS,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//Vážně. Naše společnost by potřebovala víc lidí jako ty. Mockrát díky.
	B_UseItem(self,ItPo_HealHilda_MIS);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//Doufám, že těchhle pár zlatých bude stačit.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealHilda);
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_DISTURB(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 32;
	condition = DIA_Hilda_DISTURB_Condition;
	information = DIA_Hilda_DISTURB_Info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int DIA_Hilda_DISTURB_Condition()
{
	if((MIS_HealHilda == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Kapitel > 3)))
	{
		return TRUE;
	};
};

func void DIA_Hilda_DISTURB_Info()
{
	if(MIS_HealHilda == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//Jak se máš?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//Už je mi líp, díky tobě.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//Žádná sláva.
	};
};


instance DIA_Hilda_KAP4_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP4_EXIT_Condition;
	information = DIA_Hilda_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP5_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP5_EXIT_Condition;
	information = DIA_Hilda_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP6_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP6_EXIT_Condition;
	information = DIA_Hilda_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_PICKPOCKET(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 900;
	condition = DIA_Hilda_PICKPOCKET_Condition;
	information = DIA_Hilda_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Hilda_PICKPOCKET_Condition()
{
	return C_Beklauen(26,35);
};

func void DIA_Hilda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,Dialog_Back,DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

