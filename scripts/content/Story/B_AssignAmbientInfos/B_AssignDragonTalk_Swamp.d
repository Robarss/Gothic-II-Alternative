
instance DIA_Dragon_Swamp_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Swamp_Exit_Condition;
	information = DIA_Dragon_Swamp_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Swamp_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Moc Oka je vy?erp?na. Nit tv?ho ?ivota tady kon??, ?lov??e.
	SwampDragon = Hlp_GetNpc(Dragon_Swamp);
	SwampDragon.flags = 0;
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	if(DJG_SwampParty_GoGoGo == TRUE)
	{
		if((DJG_SwampParty == TRUE) && (Npc_IsDead(DJG_Cipher) == FALSE))
		{
			B_StartOtherRoutine(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine(DJG_Cipher,"SwampDragon");
	};
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};


instance DIA_Dragon_Swamp_Hello(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Swamp_Hello_Condition;
	information = DIA_Dragon_Swamp_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Swamp_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Swamp_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//?ekaj? t? jen sam? pot??e, jestli se odv???? je?t? o krok bl??!
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ach. Vypad? to, ?e Innosovo oko funguje.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//U? p?i?li mnoz? z tv?ho druhu. V?echny jsem je smetl z povrchu zemsk?ho.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//?et?i si dech. Tv? velk? slova m? nemohou vyd?sit, ty smrdut? zplozen?e pekel.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//?ekni mi, co chci v?d?t, nebo t? utop?m ve tv? vlastn? krvi.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ha ha ha. Opova?uje? se mi vyhro?ovat, b?dn? ?erve? ?ekni mi jeden jedin? d?vod, pro? bych t? hned te? nem?l rozsekat na tis?c kousk?.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Jsem Innos?v posel a m?m u sebe posv?tn? Innosovo oko. Nem?? na v?b?r. Mus?? se podrobit m? v?li, nebo bude? zni?en.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(?ve) Arrh. ?ekni, co ode m? chce?.
};


instance DIA_Dragon_Swamp_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Swamp_WERBISTDU_Condition;
	information = DIA_Dragon_Swamp_WERBISTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Dragon_Swamp_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Jmenuju se Pandrodor. A m?l bys sis dob?e rozmyslet, jestli nebude lep?? zal?zt zp?t mezi sk?ly, odkud jsi p?i?el.
};


instance DIA_Dragon_Swamp_WOSINDDIEANDEREN(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;
	description = "Kde najdu zbytek tob? podobn?ch odporn?ch stvo?en??";
};


func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Kde najdu zbytek tob? podobn?ch odporn?ch stvo?en??
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//Elementy, z nich? bylo v?e stvo?eno, dr?? tento sv?t pohromad?.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Ka?d? z nich vyjad?uje schopnost ovl?dat ??st sv?ta.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Hledej elementy a nalezne? v?echny ostatn?.
};

func void B_AssignDragonTalk_Swamp(var C_Npc slf)
{
	DIA_Dragon_Swamp_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

