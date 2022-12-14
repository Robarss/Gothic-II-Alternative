
instance DIA_Rangar_EXIT(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 999;
	condition = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rangar_PICKPOCKET(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 900;
	condition = DIA_Rangar_PICKPOCKET_Condition;
	information = DIA_Rangar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tenhle kl?? lze snadno ukr?st)";
};


func int DIA_Rangar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,Dialog_Back,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_02,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};


instance DIA_Rangar_Hallo(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent = FALSE;
	description = "Zdar, jak se vede?";
};


func int DIA_Rangar_Hallo_Condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Zdar, jak se vede?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Ne? mi paladinov? daj? n?jak? dal?? p??kazy, m??u si tady v klidu d?t n?kolik piv. Co v?c by si jeden mohl p??t? (za?kleb? se)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracuje? pro paladiny?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Jo, pod?v?m jim hl??en? o d?n? ve m?st?. Moment?ln? je tady docela klid.
};


instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = "Jak to vypad? se sk?ety?";
};


func int DIA_Rangar_Ork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak to vypad? se sk?ety?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Nen? d?vod si d?lat t??kou hlavu - my z m?stsk? str??e a paladinov? m?me v?echno pod kontrolou.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//B?? dom? a nech n?s d?lat na?i pr?ci. Dohl???me na m?sto a jeho ob?any. -?KYT-
};


instance DIA_Rangar_Bier(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent = TRUE;
	description = "Dal by sis je?t? pivo?";
};


func int DIA_Rangar_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Dal by sis je?t? pivo?
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if(Knows_Paladins == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//??? - nic se nevyrovn? spr?vn? vychlazen?mu pivku.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Chystal ses ??ct n?co o sk?etech.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Jo, no jo, jasn?. Sk?eti nep?edstavuj? pro m?sto v?bec ??dnou hrozbu.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Obsadili Hornick? ?dol?. A pr?smyk dr?? paladinov?.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Neproklouzne kolem nich ani my?.
			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if((Knows_Paladins == 1) && (Knows_Ork == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Po??dnou pintu rozhodn? neodm?tnu.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Dokonce vid?li sk?eta hned za m?stem.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//No jo, jasn?, nebezpe?n? sk?et za m?stem. Opravdu p???ern? sk?et. Ur?it? co nevid?t za?to?? na m?sto.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Poslouchej, toho tlust?ho sk?eta nakopeme do toho jeho tlust?ho zadku ve chv?li, kdy se moc p?ibl??? k m?stu. Jasan?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Aha.
			Knows_Paladins = 2;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Dobr? ho?k? pivko je to nejlep??, co m??e b?t.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//V??, nenaraz?? ?asto na n?koho, kdo by t? pozval na pivo. Jsi docela fajn.
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasn?, ?e si je?t? d?m pivo. Jedno pro m?.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rangar_Erwischt(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 5;
	condition = DIA_Addon_Rangar_Erwischt_Condition;
	information = DIA_Addon_Rangar_Erwischt_Info;
	description = "Co tady d?l???";
};


var int DIA_Addon_Rangar_Erwischt_OneTime;

func int DIA_Addon_Rangar_Erwischt_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_Addon_Rangar_Erwischt_OneTime == FALSE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_Erwischt_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//(c?t? se p?isti?en) Eeehm. J?...eh..to t? nemus? zaj?mat. Ztra? se.
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Martin bude r?d, a? mu pov?m, kdo se ??oural v jeho v?cech mezi t?m, co byl pry?.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//(v?sm??n?) Ud?lej, co chce?. P?jdu je?t? jednou, chlap?e.
	B_GivePlayerXP(XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GotRangar = TRUE;
};


instance DIA_Addon_Rangar_nachhaken(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Addon_Rangar_nachhaken_Condition;
	information = DIA_Addon_Rangar_nachhaken_Info;
	permanent = TRUE;
	description = "Asi si mysl??, ?e t? nech?m uniknout trestu?";
};


func int DIA_Addon_Rangar_nachhaken_Condition()
{
	if((SC_GotRangar == TRUE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_nachhaken_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//Asi si mysl??, ?e t? nech?m uniknout trestu?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(lhostejn?) Ned?lej tak velk? d?sledky kv?li tro?ce z?sob a potravin.
};

