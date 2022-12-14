
instance DIA_Rengaru_EXIT(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 999;
	condition = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_PICKPOCKET(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 900;
	condition = DIA_Rengaru_PICKPOCKET_Condition;
	information = DIA_Rengaru_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Rengaru_PICKPOCKET_Condition()
{
	return C_Beklauen(20,5);
};

func void DIA_Rengaru_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,Dialog_Back,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};

func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};


instance DIA_Rengaru_Hauab(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Hauab_Condition;
	information = DIA_Rengaru_Hauab_Info;
	permanent = TRUE;
	description = "Co tady d?l???";
};


func int DIA_Rengaru_Hauab_Condition()
{
	if((Jora_Dieb != LOG_Running) && (Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Hauab_Info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//Nejsem si jist, jestli ti do toho n?co je. Ztra? se!
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_HALLODIEB(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_HALLODIEB_Condition;
	information = DIA_Rengaru_HALLODIEB_Info;
	permanent = FALSE;
	description = "Jora ??kal, ?e m?? jeho pen?ze.";
};


func int DIA_Rengaru_HALLODIEB_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora ??kal, ?e m?? jeho pen?ze.
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Sakra! Pad?m pry?!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_Rengaru_GOTYOU(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 3;
	condition = DIA_Rengaru_GOTYOU_Condition;
	information = DIA_Rengaru_GOTYOU_Info;
	permanent = FALSE;
	description = "M?m t?!";
};


func int DIA_Rengaru_GOTYOU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info()
{
	B_GivePlayerXP(XP_RengaruGotThief);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//M?m t?!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Co ode m? chce??
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Okradl jsi Joru za denn?ho sv?tla a on si toho ani nev?iml.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Tak jsem ti p?i?el ??ct, ?e jsi zav?ivenej zlod?j a ?e...
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"Zaslou??m si n?jak? pod?l na ko?isti.",DIA_Rengaru_GOTYOU_Anteil);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"ud?l?? l?p, kdy? mu to hned vr?t??.",DIA_Rengaru_GOTYOU_YouThief);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"A te? mi ?ekni, kdo jsi.",DIA_Rengaru_GOTYOU_WhoAreYou);
};

func void DIA_Rengaru_GOTYOU_YouThief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//Ud?l?? l?p, kdy? mu to hned vr?t??.
	if(Npc_HasItems(self,ItMi_Gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Tady jsou prachy, chlape! Ale te? m? nech j?t, u? to nikdy neud?l?m.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//J? u? to zlato nem?m.
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Ale pro? ti to vlastn? ??k?m? Ty u? jsi m? okradl!
		};
	};
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//Zaslou??m si n?jak? pod?l na ko?isti.
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Npc_HasItems(self,ItMi_Gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Vzal sis v?echno, co jsem m?l u sebe, u? kdy? jsi m? srazil na zem! Tak m? nech j?t!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Dobr?, vypad? to, ?e nem?m navybranou. D?m ti p?lku.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"Ne - d?? mi to v?echno!",DIA_Rengaru_GOTYOU_Anteil_alles);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"Fajn, tak mi dej p?lku.",DIA_Rengaru_GOTYOU_Anteil_GehtKlar);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//Ne - d?? mi to v?echno!
	if(Npc_HasItems(self,ItMi_Gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Tak?e ty m? chce? okr?st. Fajn, tak si to zlato vezmi. A te? m? nech na pokoji.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Dal bych ti to zlato, ale u? ho nem?m.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//Fajn, tak mi dej p?lku.
	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Tady je tvoje polovina! A te? m? nech j?t!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Cht?l bych ti d?t polovinu toho zlata, ale j? u? ho nem?m.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_WhoAreYou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//A te? mi ?ekni, kdo jsi.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Jsem jen ubohej mizera, co se sna?? vyj?t s pen?zi, jak se d?.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Co je?t? m??u ud?lat? Ve m?st? o pr?ci nezavad??.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//Dobr?, to v?m. U?et?i m? t?ch n??k?!
};


instance DIA_Rengaru_INKNAST(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 4;
	condition = DIA_Rengaru_INKNAST_Condition;
	information = DIA_Rengaru_INKNAST_Info;
	permanent = FALSE;
	description = "M?l bych t? p?edhodit domobran?.";
};


func int DIA_Rengaru_INKNAST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//M?l bych t? p?edhodit domobran?.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Co je?t? chce?? Nem?m co ztratit! Nech m? j?t, chlape!
	Info_AddChoice(DIA_Rengaru_INKNAST,"Pro? bych to jako m?l d?lat?",DIA_Rengaru_INKNAST_keinKnast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"Postar?m se, abys skon?il za m???ema.",DIA_Rengaru_INKNAST_Knast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"Ztra? se! A u? tady ten svuj ksicht v?ckr?t neukazuj!",DIA_Rengaru_INKNAST_HauAb);
};

func void DIA_Rengaru_INKNAST_HauAb()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Ztra? se! A u? tady ten sv?j ksicht v?ckr?t neukazuj!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Nebude? toho litovat! D?ky, chlape!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
};

func void DIA_Rengaru_INKNAST_Knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Postar?m se, abys skon?il za m???ema.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(unaven?) U? nechci ??dn? pot??e. Jestli m?? dojem, ?e je to to, co bys m?l ud?lat, tak si poslu?.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(varovn?) D?vej si bacha - m? kamar?di nebudou odv?zan? z toho, co tady vyv?d??.
	Rengaru_InKnast = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_INKNAST_keinKnast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Pro? bych to jako m?l d?lat?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//Ve m?st? se v?dycky hod? zn?t ty prav? lidi - a st?t na jejich stran?.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Mohl bych za tebe ztratit dobr? slovo. V?c ani nechci, ani nem??u ud?lat. Zbytek je na tob?.
};


instance DIA_Rengaru_LastInfoKap1(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 6;
	condition = DIA_Rengaru_LastInfoKap1_Condition;
	information = DIA_Rengaru_LastInfoKap1_Info;
	permanent = TRUE;
	description = "Tak co? V po??dku?";
};


func int DIA_Rengaru_LastInfoKap1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//Tak co? V po??dku?
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Jen si poslu?, je?t? si ze m? utahuj. Nakonec stejn? sl?zne? to, co te? prov?d?? mn?. Slibuju!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Co je?t? chce?? Nic dal??ho u? jsem neukradl, v??n?, chlape!
	};
};


instance DIA_Rengaru_Zeichen(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent = FALSE;
	description = "(P?edv?st zlod?jsk? sign?l.)";
};


func int DIA_Rengaru_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Rengaru_InKnast == FALSE) && Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hej, jsi jedn?m z n?s.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Tak te? ti n?co ?eknu. Jestli chce? n?komu odleh?it o p?r zla??k?, tak si d?vej zvl᚝ pozor na kupce!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Jsou tak nep??jemn? v??mav?, co se t??e jejich vlastn?ch v?c?. Ale m??u ti d?t tip.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Pokus se zvolenou v?c jednou rukou oto?it a tou druhou mezit?m odv?d?j jejich pozornost.
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

