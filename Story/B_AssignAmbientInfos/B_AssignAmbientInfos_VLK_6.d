
instance DIA_VLK_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_6_EXIT_Condition;
	information = DIA_VLK_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_6_JOIN_Condition;
	information = DIA_VLK_6_JOIN_Info;
	permanent = TRUE;
	description = "Jak se můžu stát občanem tohoto města?";
};


func int DIA_VLK_6_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_6_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_00");	//Jak se můžu stát občanem tohoto města?
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_01");	//Chceš se tu usadit? Teď? Když všechno směřuje ke konci světa?
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_02");	//Nechci tu zůstat napořád.
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_03");	//Fajn, pokud stojíš o moji radu, měl bys odsud upalovat nejdál, co můžeš. Ale když na tom trváš, měl by sis promluvit s jedním z vlivných měšťanů.
};


instance DIA_VLK_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_6_PEOPLE_Condition;
	information = DIA_VLK_6_PEOPLE_Info;
	permanent = TRUE;
	description = "Kde najdu vlivné občany Khorinisu?";
};


func int DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_6_PEOPLE_15_00");	//Kde najdu vlivné občany Khorinisu?
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_01");	//Zkus to u kováře nebo truhláře v dolní části města. Najdeš tam i několik dalších vážených mistrů.
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_02");	//Pokud tady má kromě městské stráže a paladinů někdo nějaké slovo, jsou to tihle muži.
};


instance DIA_VLK_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_6_LOCATION_Condition;
	information = DIA_VLK_6_LOCATION_Info;
	permanent = TRUE;
	description = "Jak se mám ve městě vyznat?";
};


func int DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_6_LOCATION_15_00");	//Jak se mám ve městě vyznat?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_01");	//Není tak snadné najít správný směr, co? Ani ty ukazatele nedokážou pomoct úplně vždycky.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_02");	//Pokud máš špatný orientační smysl, měl bys zajít dolů do přístavu - teda pokud tam trefíš - a poohlédnout se po domku kartografa.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_03");	//Je to hned za hospodou v přístavišti. Brahim pro tebe určitě bude nějakou mapu města mít.
};


instance DIA_VLK_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_6_STANDARD_Condition;
	information = DIA_VLK_6_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_6_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_01");	//Od té doby, co bariéra vzala za své, je tohle město plné banditů. Ale paladinové nedělají vůbec nic. Tak proč tu ksakru vůbec jsou?
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_02");	//Poslední dobou už to s těmi bandity není tak zlé. Skoro to vypadá, že s tím někdo začal něco dělat.
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_03");	//Nechali jít toho mizernýho žoldáka, co zabil paladina. Nebylo by od věci, kdyby ho místo toho raději oběsili.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_04");	//Říká se, že jeden z Onarových žoldáků zabil paladina. Toho chlápka chytili a uvrhli do žaláře. Už brzo se bude houpat.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_05");	//Rád bych věděl, co je na těch dračích povídačkách pravdy.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_06");	//Říká se, že lord Hagen shromažďuje své muže, aby osvobodili Hornické údolí. Konečně se začaly věci hýbat!
	};
};

func void B_AssignAmbientInfos_VLK_6(var C_Npc slf)
{
	dia_vlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

