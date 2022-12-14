
instance DIA_Addon_Francis_EXIT(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 999;
	condition = DIA_Addon_Francis_EXIT_Condition;
	information = DIA_Addon_Francis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Francis_EXIT_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Francis_First(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 1;
	condition = DIA_Addon_Francis_First_Condition;
	information = DIA_Addon_Francis_First_Info;
	permanent = FALSE;
	description = "To je tv? chatr??";
};


func int DIA_Addon_Francis_First_Condition()
{
	if((Knows_GregsHut == FALSE) && (Francis_ausgeschissen == FALSE) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_First_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//To je tv? chatr??
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//Ne, pat?? Gregovi.
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Francis_LetMeIn(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 2;
	condition = DIA_Addon_Francis_LetMeIn_Condition;
	information = DIA_Addon_Francis_LetMeIn_Info;
	permanent = FALSE;
	description = "Mus?m se dostat dovnit? do Gregovy chatr?e.";
};


func int DIA_Addon_Francis_LetMeIn_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Francis_First) || (Knows_GregsHut == TRUE)) && (Francis_ausgeschissen == FALSE) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_LetMeIn_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//Mus?m se dostat dovnit? do Gregovy chatr?e.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Greg tu nen?. Zamkl jsem dve?e a ujistil se, ?e nikdo nedostane n?pad se tam vloupat.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//Odje? nebo nedopadne? dob?e.
};


instance DIA_Addon_Francis_AboutGreg(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 3;
	condition = DIA_Addon_Francis_AboutGreg_Condition;
	information = DIA_Addon_Francis_AboutGreg_Info;
	permanent = FALSE;
	description = "Greg je tv?j ??f?";
};


func int DIA_Addon_Francis_AboutGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && (Francis_ausgeschissen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AboutGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Greg je tv?j ??f?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//Nyn? tu nen?, ale zn?m ho!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Ka?d? n?mo?n?k, jak ??k?m, ka?d? suchozemec na tomto ostrov? zn? stra?n?ho kapit?na Grega!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(nad?azen?) Sv??il mi zde velen?!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//Jsem zodpov?dn? za tento t?bor, kter? mi byl sv??en!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//N?kte?? ho?i si mysl?, ?e si mohou d?lat, co cht?j?, kdy? tu kapit?n Greg nen?.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Ale budou velice p?ekvapeni, a? se Greg vr?t?.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//?eknu mu v?e, co se zde stalo, sly????
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//A taky v?ci, jako kdo chce vstoupit do jeho chatr?e.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//Tak rad?i vypadni, jestli je ti ?ivot mil?.
};


var int Francis_bezahlt;

instance DIA_Addon_Francis_Key(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 4;
	condition = DIA_Addon_Francis_Key_Condition;
	information = DIA_Addon_Francis_Key_Info;
	permanent = TRUE;
	description = "Dej mi kl?? od Gregovy chatr?e!";
};


func int DIA_Addon_Francis_Key_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Key_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Dej mi kl?? od Gregovy chatr?e!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//Mus?? si d?lat legraci!
	Info_ClearChoices(DIA_Addon_Francis_Key);
	Info_AddChoice(DIA_Addon_Francis_Key,"Pop?em??l?m o tom...",DIA_Addon_Francis_Key_BACK);
	Info_AddChoice(DIA_Addon_Francis_Key,"D?m ti 2000 zlata!",DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice(DIA_Addon_Francis_Key,"D?m ti 1000 zlata!",DIA_Addon_Francis_Key_1000Gold);
};

func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices(DIA_Addon_Francis_Key);
};

func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//D?m ti 1000 zlata!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//To je trochu m?lo za zradu kapit?na, nemysl???
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//D?vej si v?c pozor, co ??k??! Jinak bych ti byl nucen d?t asi po??dn? v?prask!
};

func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//D?m ti 2000 zlata!
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Chlape, ty po mn? ??d?? vzpouru!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(k sob?) Ale kdy? se nad t?m zamysl?m ...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Ah, ruku na to, nikdo na to nep?ijde.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Tu je kl??!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//Ale rychle, dokud se Greg nevr?til! A ani slovo ostatn?m, sly????!
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(sm?je se) Ha! Ty nem?? tolik pen?z!
	};
	Info_ClearChoices(DIA_Addon_Francis_Key);
};


instance DIA_Addon_Francis_AufsMaul(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_AufsMaul_Condition;
	information = DIA_Addon_Francis_AufsMaul_Info;
	permanent = TRUE;
	description = "Dob?e, pod?v?me se, jak na tom jsi.";
};


func int DIA_Addon_Francis_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//Dob?e, pod?v?me se, jak na tom jsi.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(pronikav?) Co? J? jsem tady kapit?n!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//J? t? nau??m zp?sob?m, ty suchozemsk? kryso!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Francis_Buch(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_Buch_Condition;
	information = DIA_Addon_Francis_Buch_Info;
	permanent = TRUE;
	description = "Na?el jsem tvoje mal? doup?...";
};


func int DIA_Addon_Francis_Buch_Condition()
{
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Buch_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//Na?el jsem tvoje mal? doup?. Tv?j poklad a v?platn? listinu. To je tv? kn??e?ka, nebo ne?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Er ... Nikdy jsem tu kn??ku nevid?l ...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//A ... er ... a kdyby to bylo moje ...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//A ty si skute?n? mysl??, ?e ho?i uv??? n?jak?mu za?loutl?mu kusu pap?ru?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//Ty jsi je o?idil o ??st jejich pod?lu!
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Er ... Po?kej ...
	if(Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(ti?e) Necht?ls kl?? od Gregovy chatr?e ...
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//D?m ti kl?? ke Gregov? chatr?i!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//M??e? tam vz?t mnoho zaj?mav?ch v?c?...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(rozru?en?) Ale d?? mi tu knihu a bude? o tom ml?et, jasn??
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Jen neud?lej nic hloup?ho!
		if((Francis_bezahlt == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Tady m?? 2000 zlata!
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//A 500 nav?c.
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Tady m?? 500 zlata!
			B_GiveInvItems(self,other,ItMi_Gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(na?tvan?) A nyn? m? nech ...
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Francis_PICKPOCKET(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_PICKPOCKET_Condition;
	information = DIA_Francis_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Ukr?st tento kl?? bude jednoduch?.)";
};


func int DIA_Francis_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ITKE_Greg_ADDON_MIS) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Francis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
	Info_AddChoice(DIA_Francis_PICKPOCKET,Dialog_Back,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Francis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Francis_PICKPOCKET_DoIt);
};

func void DIA_Francis_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};

func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};


instance DIA_Francis_Ausgeschissen(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_Ausgeschissen_Condition;
	information = DIA_Francis_Ausgeschissen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Francis_Ausgeschissen_Condition()
{
	if((Francis_ausgeschissen == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Francis_Ausgeschissen_Info()
{
	if(!Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(nahlas) Proto?e by m? Greg  jinak nechal k?cet stromy do posedn?ho zbyl?ho ke???ku!
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//Ztra? se!
	AI_StopProcessInfos(self);
};

