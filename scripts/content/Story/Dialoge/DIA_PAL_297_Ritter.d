
instance DIA_PAL_297_EXIT(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 999;
	condition = DIA_PAL_297_EXIT_Condition;
	information = DIA_PAL_297_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 2;
	condition = DIA_PAL_297_TRESPAS_Condition;
	information = DIA_PAL_297_TRESPAS_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_PAL_297_TRESPAS_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_TRESPAS_Info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Jak se vede?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Okol? je hodn? nebezpe?n?, tak?e by ses m?l mo?n? vr?tit - rozhodn? nechceme, aby se ti n?co stalo.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Vstoupit do ?dol? chce hodn? odvahy. Alespo? ?e u sebe m?? dostatek l??iv?ch lektvar?.
	};
};


instance DIA_Addon_PAL_297_Rangerbandits(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 5;
	condition = DIA_Addon_PAL_297_Rangerbandits_Condition;
	information = DIA_Addon_PAL_297_Rangerbandits_Info;
	description = "Pro?li tudy v posledn? dob? n?jac? banditi?";
};


func int DIA_Addon_PAL_297_Rangerbandits_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_PAL_297_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_PAL_297_Rangerbandits_15_00");	//Pro?li tudy v posledn? dob? n?jac? banditi?
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_01");	//Nev?m o ?em to mluv??. Za tu dobu, co jsme tu na str??i tudy nikdo nepro?el. A u? v?bec ne nikdo z t?ch v?iv?ch bandit?.
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_02");	//Farm??i na ot?zky moc odpov?dat necht?j?. Mo?n? n?co zahl?dli.
};

