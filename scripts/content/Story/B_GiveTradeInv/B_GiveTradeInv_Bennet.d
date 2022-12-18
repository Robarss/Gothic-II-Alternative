
var int Bennet_ItemsGiven_Chapter_1;
var int Bennet_ItemsGiven_Chapter_2;
var int Bennet_ItemsGiven_Chapter_3;
var int Bennet_ItemsGiven_Chapter_4;
var int Bennet_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Bennet(var C_Npc slf)
{
	if((Kapitel >= 1) && (Bennet_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,itsh_shield_swamp,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMw_1H_Mace_L_04,2);
		CreateInvItems(slf,ItBE_Addon_SLD_01,1);
		Bennet_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Bennet_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,250);
		CreateInvItems(slf,itsh_shield_wolf,1);
		CreateInvItems(slf,itsh_shield_a_reinforced,1);
		CreateInvItems(slf,ItMiSwordraw,0);
		Bennet_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Bennet_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,450);
		CreateInvItems(slf,itsh_twr,1);
		CreateInvItems(slf,itar_djg_m,1);
		CreateInvItems(slf,itsh_12shield,1);
		CreateInvItems(slf,ithl_helm1,1);
		CreateInvItems(slf,ithl_helm3,1);
		CreateInvItems(slf,ithl_helm4,1);
		CreateInvItems(slf,ItMiSwordraw,0);
		CreateInvItems(slf,ItMi_Nugget,1);
		CreateInvItems(slf,ItBE_Addon_MC,1);
		Bennet_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Bennet_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,700);
		CreateInvItems(slf,ithl_helm15,1);
		CreateInvItems(slf,ItMiSwordraw,0);
		CreateInvItems(slf,ItMi_Nugget,2);
		Bennet_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Bennet_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,1100);
		CreateInvItems(slf,ithl_helm17,1);
		CreateInvItems(slf,ItMiSwordraw,0);
		if(other.guild == GIL_DJG)
		{
			CreateInvItems(slf,itsh_9shield,1);
		};
		CreateInvItems(slf,ItMi_Nugget,2);
		Bennet_ItemsGiven_Chapter_5 = TRUE;
	};
};

