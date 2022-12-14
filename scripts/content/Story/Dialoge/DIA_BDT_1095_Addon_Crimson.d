
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
	description = "Co to d?l??? Tav?? zlato?";
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Co to d?l??? Tav?? zlato?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Ne, va??m zeleninu - samoz?ejm?, ?e tady tav?m zlato a d?l?m z n?j mince.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Zkus si p?edstavit kr?sn? ve?er, kdy? p?ide Raven a vm??kne mi do ruky zn?mku za d?l?n? minc?.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Z jednoho zlat?ho nugetu ud?l?m kopu minc? - m? pr?ce je dobr?, nikdo nepozn? rozd?l.
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = "Kolik minc? mi d?? za nuget?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Kolik minc? mi d?? za nuget?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Nev?m to jist?, ale v?? co, ud?l?m ti p??telskou cenu, d?m ti ...
	B_Say_Gold(self,other,10);
};


instance DIA_Addon_Crimson_Feilsch(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = "Chci v?c zlat?ch!";
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
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Chci v?c zlat?ch!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm ... ne. To je norm?ln? cena, jakou dostane ka?d?.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Mysl?m, ?e toto je cena pro p??tele.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//To je, tady jsme v?ichni p??tel?.
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
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vym?n v?echny zlat? nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vym?n 1 zlat? nuget",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Ale ty nem?? ??dn? nugety
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
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vym?n v?echny zlat? nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vym?n 1 zlat? nuget",DIA_Addon_Crimson_Gold_1);
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
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vym?n v?echny zlat? nugety",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"Vym?n 1 zlat? nuget",DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(prosebn?) KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = "Co v?? o Ravenovi?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Co v?? o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Nebude? tomu v??it. Byl jsem tam. Vid?l jsem, co d?lal v hrobce!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(b?zliv?) Mumlal a ??kal jak?si divn? slova. Znovu a znovu ...
	B_Say_CrimsonBeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//(hlasit?) A potom jsem uvid?l oslepuj?c? sv?tlo a sly?el ten stra?n? v?k?ik.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//M?j bo?e, ten zvuk. Bylo to, jako by se hroutil sv?t.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Raven s t?m mluvil, rozpr?v?li - Raven a TEN zvuk!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Nevzpom?n?m si, o ?em spolu mluvili - vzpom?n?m si pouze, ?e jsem se nemohl je?t? dlouho pohnout.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = "M??e? mi zopakovat Ravenova slova j??t? jednou?";
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
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//M??e? mi zopakovat Ravenova slova j??t? jednou?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Jist?, m??u.
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"Ano?",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Mysl?m ?e bude l?pe, kdy? toho nech?me ...
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

