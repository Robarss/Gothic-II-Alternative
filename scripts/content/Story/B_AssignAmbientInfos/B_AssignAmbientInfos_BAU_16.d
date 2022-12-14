
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
	description = "?ekni mi v?c o t?ch ?oldn???ch!";
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
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//?ekni mi v?c o t?ch ?oldn???ch!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Cel? dny se poflakuj? kolem farmy, ml?t?j se mezi sebou jen tak, aby si zkr?tili dlouhou chv?li, a myslej si, jak? je to sranda.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu vel??";
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Kdo tady tomu vel??
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Kdy? se na to pt??, tak ?old?ci.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar je sice plat?, ale v?t?ina z nich si d?l?, co se jim zachce.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = "Co mi m??e? ??ct o tomhle m?st??";
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Co mi m??e? ??ct o tomhle m?st??
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//Jsou tu t?i farmy. Onarova na v?chod? a Sekobova na severn?m konci ?dol?.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Po cest? se dostane? na n?horn? planinu na jihov?chod?. Tam je Bengarova farma.
};


instance DIA_BAU_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Co je nov?ho?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Voj?ci z m?sta u? n?m nebudou odv?d?t n?? dobytek a br?t na?i ?rodu! Te?, kdy? u? se m??eme br?nit, n?jak ztratili z?jem!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//??k? se, ?e se v Hornick?m ?dol? shroma??uje ob?? arm?da. Za chv?li tady budou.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Zaslechl jsem n?jak? zv?sti o tom, ?e jsou v Hornick?m ?dol? draci. St??? tomu m??u uv??it.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//N?kte?? ?e ?oldn??? zmizeli. Nev?m, jestli to m?m pova?ovat ze dobrou, nebo ?patnou v?c.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Paladinov? na ta?en? do Hornick?ho ?dol? - co to v?echno m? znamenat?
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

