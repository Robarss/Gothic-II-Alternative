
instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_7_JOIN_Condition;
	information = DIA_BAU_7_JOIN_Info;
	permanent = TRUE;
	description = "Co v?? o t?ch ?oldn???ch?";
};


func int DIA_BAU_7_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_7_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_7_JOIN_15_00");	//Co v?? o t?ch ?oldn???ch?
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//Onar si je najal, aby chr?nili jeho farmu.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//V?t?ina se jich chov?, jako by jim farma snad pat?ila. Ale v ka?d?m p??pad? n?s chr?n?.
};


instance DIA_BAU_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_7_PEOPLE_Condition;
	information = DIA_BAU_7_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu vel??";
};


func int DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//Kdo tady tomu vel??
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//Ta velk? farma pat?? Onarovi. Stejn? jako ty mal? okolo. Ale ty jsou te? v pron?jmu.
};


instance DIA_BAU_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_7_LOCATION_Condition;
	information = DIA_BAU_7_LOCATION_Info;
	permanent = TRUE;
	description = "?ekni mi v?c o tomhle m?st?.";
};


func int DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//?ekni mi v?c o tomhle m?st?.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//Ta velk? farma tady na v?chod? ?dol? pat?? Onarovi. Sekobova le?? na severu.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//A Begarova farma je na n?horn? plo?in? na jihov?chod?. Z ?dol? se tam dostane? celkem snadno - vedou tam velk? kamenn? schody.
};


instance DIA_BAU_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Co je nov?ho?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Vyhl?sili jsme nez?vislost - u? nebudeme m?stu d?l odv?d?t dan?. Kr?l pro n?s nehne ani prstem - u? jsme toho m?li prost? dost!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//Te? se tady toho moc ned?je.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Za?aly se tu prosl?chat zv?sti o drac?ch! Kr?l si v?dycky vymysl? n?co nov?ho, jen aby mohl z lid? vym??knout dal?? pen?ze.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//D?vej si pozor, posledn? dobou se sem p?es br?nu dost?v? stra?n? moc temnejch postav a divok? zv??e.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//Te?, kdy? jsou draci mrtv?, se kone?n? p?nov? paladinov? ur??ili odt?hnout z m?sta. U? je na ?ase, aby se sem vr?tila spravedlnost.
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

