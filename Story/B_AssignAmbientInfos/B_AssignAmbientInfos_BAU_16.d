
instance DIA_BAU_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_16_EXIT_Condition;
	information = DIA_BAU_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_16_JOIN_Condition;
	information = DIA_BAU_16_JOIN_Info;
	permanent = TRUE;
	description = "Řekni mi víc o těch žoldnéřích!";
};


func int DIA_BAU_16_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Řekni mi víc o těch žoldnéřích!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Celé dny se poflakují kolem farmy, mlátěj se mezi sebou jen tak, aby si zkrátili dlouhou chvíli, a myslej si, jaká je to sranda.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Když se na to ptáš, tak žoldáci.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar je sice platí, ale většina z nich si dělá, co se jim zachce.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = "Co mi můžeš říct o tomhle místě?";
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Co mi můžeš říct o tomhle místě?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//Jsou tu tři farmy. Onarova na východě a Sekobova na severním konci údolí.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Po cestě se dostaneš na náhorní planinu na jihovýchodě. Tam je Bengarova farma.
};


instance DIA_BAU_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Vojáci z města už nám nebudou odvádět náš dobytek a brát naši úrodu! Teď, když už se můžeme bránit, nějak ztratili zájem!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//Říká se, že se v Hornickém údolí shromažďuje obří armáda. Za chvíli tady budou.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Zaslechl jsem nějaké zvěsti o tom, že jsou v Hornickém údolí draci. Stěží tomu můžu uvěřit.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Někteří že žoldnéřů zmizeli. Nevím, jestli to mám považovat ze dobrou, nebo špatnou věc.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Paladinové na tažení do Hornického údolí - co to všechno má znamenat?
	};
};

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

