
instance DIA_Pal_213_Schiffswache_EXIT(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 999;
	condition = DIA_Pal_213_Schiffswache_EXIT_Condition;
	information = DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Pal_213_Checkpoint = "SHIP_DECK_09";

instance DIA_Pal_213_Schiffswache_FirstWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 1;
	condition = DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information = DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Počkej! Kam si myslíš, že jdeš?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Chtěl jsem...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Je nám líto. Tudy neprojdeš.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Tady není nic k vidění. Pokračuj.
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Pal_213_Schiffswache_SecondWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 2;
	condition = DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information = DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ani o krok dál. Bez výjimek.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Nechceš mě snad NUTIT, abych ti ublížil, ne?
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Pal_213_Schiffswache_Attack(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 3;
	condition = DIA_Pal_213_Schiffswache_Attack_Condition;
	information = DIA_Pal_213_Schiffswache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Pal_213_Schiffswache_GoOnBoard(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 5;
	condition = DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information = DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	permanent = FALSE;
	description = "Rád bych se dostal na tu loď.";
};


func int DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//Rád bych se dostal na tu loď.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Nikdo nesmí vstoupit na palubu! Mám své rozkazy!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Zabiju každého, kdo bez povolení vstoupí na loď.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//Ve jméně Innosově, budu loď chránit svým vlastním životem.
};


instance DIA_Pal_213_Schiffswache_IAmKDF(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF_Info;
	permanent = FALSE;
	description = "Ty zpochybňuješ přání mágů ohně?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//Ty zpochybňuješ přání mágů ohně?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//(nervózně) Ne, to samozřejmě ne. Snad mi Innos odpustí.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//(nervózně) Ohniví mágové jsou strážci Innosovy moudrosti...
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//(nervózně)... a kdo pochybuje o jejich činech, pochybuje o Innosovi a nezaslouží si slitování.
};


instance DIA_Pal_213_Schiffswache_IAmKDF2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	permanent = FALSE;
	description = "Co se stane, když půjdu na palubu?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Co se stane, když půjdu na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//(nervózně) Zabiju... tedy, zastavím tě.
};


instance DIA_Pal_213_Schiffswache_IAmKDF3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	permanent = FALSE;
	description = "Ty bys zaútočil na mága ohně?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Ty bys zaútočil na mága ohně?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//(nervózně) Nikdy bych nevztáhl ruku na mága.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Takže co by se stalo, kdybych šel na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//(pokorně) Nic, pane.
};


instance DIA_Pal_213_Schiffswache_IAmKDF4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	permanent = FALSE;
	description = "Půjdu teď na palubu.";
};


func int DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF3))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//Půjdu teď na palubu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//(nervózně) To nesmíš, rozkazy lorda Hagena byly v tomto směru naprosto jasné.
};


instance DIA_Pal_213_Schiffswache_IAmKDF5(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	permanent = FALSE;
	description = "Vztahují se rozkazy lorda Hagena i na mě?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF4))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Vztahují se rozkazy lorda Hagena i na mě?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//(nervózně) To nevím.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Zkus přemýšlet - dovolil by si snad lord Hagen podezírat mága z krádeže?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Tomu nevěřím.
};


instance DIA_Pal_213_Schiffswache_IAmKDF6(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	permanent = FALSE;
	description = "Takže naposledy: Pusť mě na tu loď!";
};


func int DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF5))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//Takže naposledy: Pusť mě na tu loď!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//(nervózně) Rozumím. Můžeš na palubu.
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmPAL(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL_Info;
	permanent = FALSE;
	description = "Copak mi nevěříš, rytíři?";
};


func int DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Copak mi nevěříš, rytíři?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//To ne, ale plním své rozkazy.
};


instance DIA_Pal_213_Schiffswache_IAmPAL2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	permanent = FALSE;
	description = "Pak bys asi měl vědět, kdo z nás má vyšší hodnost.";
};


func int DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmPAL))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Pak bys asi měl vědět, kdo z nás má vyšší hodnost.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Ano, pane!
};


instance DIA_Pal_213_Schiffswache_IAmPAL3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	permanent = FALSE;
	description = "Tímto ti přikazují, abys mi umožnil vstup na loď.";
};


func int DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmPAL2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//Tímto ti přikazují, abys mi umožnil vstup na loď.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Rozumím, pane, vstup povolen.
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmDJG(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG_Info;
	permanent = FALSE;
	description = "A nešlo by s tím něco udělat?";
};


func int DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//A nešlo by s tím něco udělat?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Asi ti nerozumím.
};


instance DIA_Pal_213_Schiffswache_IAmDJG2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	permanent = FALSE;
	description = "Mohl bych ti dát nějaké peníze. Za to, že se budeš zrovna dívat na druhou stranu.";
};


func int DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmDJG))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//Mohl bych ti dát nějaké peníze. Za to, že se budeš zrovna dívat na druhou stranu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Není možné mě uplatit, a jestli okamžitě nezmizíš, budu to brát jako urážku.
};


instance DIA_Pal_213_Schiffswache_IAmDJG3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	permanent = FALSE;
	description = "Mám povolení. Můžu na palubu té lodi vstoupit.";
};


func int DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmDJG) && (Npc_HasItems(other,ITWr_ForgedShipLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//Mám povolení. Můžu na palubu té lodi vstoupit.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Ukaž mi ho.
	B_GiveInvItems(other,self,ITWr_ForgedShipLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//Dobrá, můžeš jít.
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};

