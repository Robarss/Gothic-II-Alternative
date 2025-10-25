
instance DIA_Pal_212_Schiffswache_EXIT(C_Info)
{
	npc = PAL_212_Schiffswache;
	nr = 999;
	condition = DIA_Pal_212_Schiffswache_EXIT_Condition;
	information = DIA_Pal_212_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_212_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pal_212_Schiffswache_WERSEIDIHR(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition;
	information = DIA_Pal_212_Schiffswache_WERSEIDIHR_Info;
	description = "Kdo jste?";
};


func int DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_212_Schiffswache_WERSEIDIHR_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Kdo jste?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//Jsme vyslanci krále Rhobara, služebníci Innosovi, jinak také řečení paladini.
};


instance DIA_Pal_212_Schiffswache_WASMACHSTDU2(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;
	description = "Co tady děláš?";
};


func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//Co tady děláš?
	if(MIS_ShipIsFree == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//Na tu loď nevstoupíš. To je jediné, co potřebuješ vědět.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//Byli jsme sem postaveni jako stráže. Nikdo nesmí na loď vstoupit. Je nám líto, ale ani ty.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//Mrháte mým časem. Mnohem raději bych byl s vašimi bratry v Hornickém údolí.
	};
	AI_StopProcessInfos(self);
};

