
instance ORE_MINING_S1(C_Item)
{
};


func void schuerfen_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SCHUERFEN;
		AI_ProcessInfos(her);
	};
};


instance PC_NOSCHUERFEN(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noschuerfen_condition;
	information = pc_noschuerfen_info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int pc_noschuerfen_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SCHUERFEN)
	{
		return TRUE;
	};
};

func void pc_noschuerfen_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_SCHUERFEN_N(C_Info)
{
	npc = PC_Hero;
	condition = pc_schuerfen_n_condition;
	information = pc_schuerfen_n_info;
	important = 0;
	permanent = 1;
	description = "Začít kopat rudu.";
};


func int pc_schuerfen_n_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SCHUERFEN)
	{
		return TRUE;
	};
};

func void pc_schuerfen_n_info()
{
	var int rudnazilavytezena;
	var int zufallsmenge;
	var int anzahl;
	var C_Npc he;
	rudnazilavytezena = FALSE;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA1"))
	{
		if(SCHUERFEN1 < 100)
		{
			SCHUERFEN1 += 1;
		};
		if(SCHUERFEN1 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA2"))
	{
		if(SCHUERFEN2 < 100)
		{
			SCHUERFEN2 += 1;
		};
		if(SCHUERFEN2 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA3"))
	{
		if(SCHUERFEN3 < 100)
		{
			SCHUERFEN3 += 1;
		};
		if(SCHUERFEN3 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA4"))
	{
		if(SCHUERFEN4 < 100)
		{
			SCHUERFEN4 += 1;
		};
		if(SCHUERFEN4 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA5"))
	{
		if(SCHUERFEN5 < 70)
		{
			SCHUERFEN5 += 1;
		};
		if(SCHUERFEN5 >= 70)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA6"))
	{
		if(SCHUERFEN6 < 100)
		{
			SCHUERFEN6 += 1;
		};
		if(SCHUERFEN6 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA7"))
	{
		if(SCHUERFEN7 < 100)
		{
			SCHUERFEN7 += 1;
		};
		if(SCHUERFEN7 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA8"))
	{
		if(SCHUERFEN8 < 80)
		{
			SCHUERFEN8 += 1;
		};
		if(SCHUERFEN8 >= 80)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA9"))
	{
		if(SCHUERFEN9 < 100)
		{
			SCHUERFEN9 += 1;
		};
		if(SCHUERFEN9 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA10"))
	{
		if(SCHUERFEN10 < 100)
		{
			SCHUERFEN10 += 1;
		};
		if(SCHUERFEN10 >= 100)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_RUDNAZILA11"))
	{
		if(SCHUERFEN11 < 80)
		{
			SCHUERFEN11 += 1;
		};
		if(SCHUERFEN11 >= 80)
		{
			rudnazilavytezena = TRUE;
		};
	}
	else
	{
		PrintScreen("Tady už nic nevykopu!",-1,30,"font_old_20_white.tga",1);
		return;
	};
	if(rudnazilavytezena == TRUE)
	{
		PrintScreen("Už tu žádná ruda není",-1,30,"font_old_20_white.tga",1);
		return;
	};
	zufallsmenge = Hlp_Random(180);
	if(zufallsmenge <= 145)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 170)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 155)
	{
		anzahl = 1;
	};
	if(zufallsmenge >= 160)
	{
		anzahl = 3;
	};
	if(zufallsmenge >= 165)
	{
		anzahl = 2;
	};
	he = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(he))
	{
		CreateInvItems(self,ItMi_Nugget,anzahl);
		if(anzahl == 0)
		{
			PrintScreen("Kousky rudy prolétají kolem!",-1,10,FONT_ScreenSmall,2);
		};
		if(anzahl == 1)
		{
			PrintScreen("Vykopal si 1 hrudku rudy!",-1,30,FONT_ScreenSmall,2);
		};
		if(anzahl == 2)
		{
			PrintScreen("Vykopal si 2 hrudky rudy!",-1,30,FONT_ScreenSmall,2);
		};
		if(anzahl == 3)
		{
			PrintScreen("Vykopal si 3 hrudky rudy!",-1,30,FONT_ScreenSmall,2);
		};
	};
};

