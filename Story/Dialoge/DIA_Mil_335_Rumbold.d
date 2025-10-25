
instance DIA_Rumbold_EXIT(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 999;
	condition = DIA_Rumbold_EXIT_Condition;
	information = DIA_Rumbold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_PrePerm(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_PrePerm_Condition;
	information = DIA_Rumbold_PrePerm_Info;
	permanent = TRUE;
	description = "Co tady děláš?";
};


func int DIA_Rumbold_PrePerm_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//Ztrať se! Rozumíš?
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_Hallo(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_Hallo_Condition;
	information = DIA_Rumbold_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rumbold_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//No podívejte na tohohle. Další vtipálek. Co tady děláš, hm?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//Kdo sakra jsi?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//Jsi jeden z těch špinavých žoldáků!
	};
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"Já nejsem nikdo.",DIA_Rumbold_HALLO_schwanzeinziehen);
	Info_AddChoice(DIA_Rumbold_Hallo,"Chci, abyste odsud zmizeli.",DIA_Rumbold_HALLO_verschwindet);
	Info_AddChoice(DIA_Rumbold_Hallo,"Jsem tvoje nejhorší noční můra.",DIA_Rumbold_HALLO_Attack);
};

func void DIA_Rumbold_HALLO_Attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//Jsem tvoje nejhorší noční můra.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//Jsi mrtvola!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,Dialog_Ende,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//Chci, abyste odsud zmizeli.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//Hleďme, hleďme. Takže ty chceš, abychom zmizeli.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//(výhrůžně) A co se stane, když zůstaneme?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"Kolik vám musím zaplatit, abyste se ztratili?",DIA_Rumbold_HALLO_geld);
	Info_AddChoice(DIA_Rumbold_Hallo,"V tom případě to je naposledy, co jste ty farmáře obtěžovali.",DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//V tom případě to je naposledy, co jste ty farmáře obtěžovali.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//Ukousl sis trošku větší sousto, než dokážeš spolknout, pitomče!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,Dialog_Ende,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//Kolik vám musím zaplatit, abyste se ztratili?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//Chceš zaplatit za Bengara? To je něco jiného.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//Nech mě přemýšlet. Se všemi těmi obrovskými výlohami nám Bengar dluží ještě 65 zlatých.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//Buď vysolíš prachy na dřevo, nebo se do ničeho nemíchej.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//Tak. Ty jsi Bengarův pokladní, nebo co?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"Zbláznil ses? To je trošku moc, ne?",DIA_Rumbold_HALLO_Geld_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 65)
	{
		Info_AddChoice(DIA_Rumbold_Hallo,"Tady máš prachy a teď odsud zmizni.",DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//Tady jsou vaše prachy. Teď zmizte.
	B_GiveInvItems(other,self,ItMi_Gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//Mně je jedno, kdo za Bengara zaplatí. Přeji hezký den. (k sobě) Pitomče!
	AI_StopProcessInfos(self);
	Rumbold_Bezahlt = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"Start");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Bengar) && !Npc_IsDead(Bengar))
	{
		Npc_ExchangeRoutine(Bengar,"Start");
		AI_ContinueRoutine(Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//Zbláznil ses? To je trošku moc, ne?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//V tom případě se do ničeho nepleť!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//Já nejsem nikdo.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//Tak mi jdi z cesty!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_FightNow(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_FightNow_Condition;
	information = DIA_Rumbold_FightNow_Info;
	permanent = TRUE;
	description = "Nechte toho farmáře být!";
};


func int DIA_Rumbold_FightNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//Nechte toho farmáře být!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//Máš snad něco s ušima, chlapče?
	Info_ClearChoices(DIA_Rumbold_FightNow);
	Info_AddChoice(DIA_Rumbold_FightNow,Dialog_Ende,DIA_Rumbold_FightNow_ENDAttack);
};

func void DIA_Rumbold_FightNow_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_StillThere(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_StillThere_Condition;
	information = DIA_Rumbold_StillThere_Info;
	permanent = TRUE;
	description = "Hele, jak to, že jsi ještě tady!";
};


func int DIA_Rumbold_StillThere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//Hele, jak to, že jsi ještě tady!
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//Vyřídím si to s vámi!
	Info_ClearChoices(DIA_Rumbold_StillThere);
	Info_AddChoice(DIA_Rumbold_StillThere,Dialog_Ende,DIA_Rumbold_StillThere_ENDAttack);
};

func void DIA_Rumbold_StillThere_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_PICKPOCKET(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 900;
	condition = DIA_Rumbold_PICKPOCKET_Condition;
	information = DIA_Rumbold_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Rumbold_PICKPOCKET_Condition()
{
	return C_Beklauen(24,45);
};

func void DIA_Rumbold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,Dialog_Back,DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

