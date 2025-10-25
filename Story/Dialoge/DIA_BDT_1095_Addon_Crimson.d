
instance DIA_Addon_Crimson_EXIT(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 999;
	condition = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Crimson_PICKPOCKET(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 900;
	condition = DIA_Addon_Crimson_PICKPOCKET_Condition;
	information = DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	return C_Beklauen(66,66);
};

func void DIA_Addon_Crimson_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,Dialog_Back,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};

func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};


instance DIA_Addon_Crimson_Hi(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent = FALSE;
	description = "Co to děláš? Tavíš zlato?";
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Co to děláš? Tavíš zlato?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Ne, vařím zeleninu - samozřejmě, že tady tavím zlato a dělám z něj mince.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Zkus si představit krásný večer, když přide Raven a vmáčkne mi do ruky známku za dělání mincí.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Z jednoho zlatého nugetu udělám kopu mincí - má práce je dobrá, nikdo nepozná rozdíl.
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = "Kolik mincí mi dáš za nuget?";
};


func int DIA_Addon_Crimson_How_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_How_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Kolik mincí mi dáš za nuget?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Nevím to jistě, ale víš co, udělám ti přátelskou cenu, dám ti ...
	B_Say_Gold(self,other,10);
};


instance DIA_Addon_Crimson_Feilsch(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = "Chci víc zlatých!";
};


func int DIA_Addon_Crimson_Feilsch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Chci víc zlatých!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm ... ne. To je normální cena, jakou dostane každý.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Myslím, že toto je cena pro přítele.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//To je, tady jsme všichni přátelé.
};


instance DIA_Addon_Crimson_Gold(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 99;
	condition = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent = TRUE;
	description = "Obchodujme ...";
};


func int DIA_Addon_Crimson_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Obchodujme ...
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vyměn všechny zlaté nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vyměn 1 zlatý nuget",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Ale ty nemáš žádné nugety
	};
};

func void DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems(other,ItMi_GoldNugget_Addon);
	B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,CurrentNuggets);
	B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 10);
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vyměn všechny zlaté nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vyměn 1 zlatý nuget",DIA_Addon_Crimson_Gold_1);
	};
};

func void DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,1);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vyměn všechny zlaté nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vyměn 1 zlatý nuget",DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(prosebně) KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = "Co víš o Ravenovi?";
};


func int DIA_Addon_Crimson_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Nebudeš tomu věřit. Byl jsem tam. Viděl jsem, co dělal v hrobce!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(bázlivě) Mumlal a říkal jakási divná slova. Znovu a znovu ...
	B_Say_CrimsonBeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//(hlasitě) A potom jsem uviděl oslepující světlo a slyšel ten strašný výkřik.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//Můj bože, ten zvuk. Bylo to, jako by se hroutil svět.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Raven s tím mluvil, rozprávěli - Raven a TEN zvuk!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Nevzpomínám si, o čem spolu mluvili - vzpomínám si pouze, že jsem se nemohl ještě dlouho pohnout.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = "Můžeš mi zopakovat Ravenova slova jěště jednou?";
};


func int DIA_Addon_Crimson_FATAGN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Raven) && (Crimson_SayBeliar < 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = Crimson_SayBeliar + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//Můžeš mi zopakovat Ravenova slova jěště jednou?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Jistě, můžu.
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"Ano?",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Myslím že bude lépe, když toho necháme ...
	};
};

func void DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play("Mystery_09");
	B_Say_CrimsonBeliar();
	if(Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
};

