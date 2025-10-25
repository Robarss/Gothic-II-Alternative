
var int Bosper_ItemsGiven_Chapter_1;
var int Bosper_ItemsGiven_Chapter_2;
var int Bosper_ItemsGiven_Chapter_3;
var int Bosper_ItemsGiven_Chapter_4;
var int Bosper_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Bosper(var C_Npc slf)
{
	if((Kapitel >= 1) && (Bosper_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItRw_Bolt,200);
		CreateInvItems(slf,ItRw_Arrow,300);
		CreateInvItems(slf,itmi_sleepsack,1);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		CreateInvItems(slf,itrw_wolf,1);
		CreateInvItems(slf,ItRw_Bow_L_02,1);
		CreateInvItems(slf,ItRw_Bow_L_03,1);
		CreateInvItems(slf,ItRw_Bow_L_03,1);
		CreateInvItems(slf,ItRw_Bow_L_04,1);
		CreateInvItems(slf,ItBE_Addon_Leather_01,1);
		CreateInvItems(slf,ItRi_Dex_02,1);
		CreateInvItems(slf,itwr_bow1,1);
		CreateInvItems(slf,itwr_bow2,1);
		CreateInvItems(slf,itwr_crossbow1,1);
		CreateInvItems(slf,itmi_woodmaker01,2);
		CreateInvItems(slf,itmi_woodmaker02,2);
		CreateInvItems(slf,ithl_t0,1);
		Bosper_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Bosper_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,200);
		CreateInvItems(slf,ItBe_Addon_DEX_5,1);
		CreateInvItems(slf,ItRw_Bow_M_01,1);
		CreateInvItems(slf,ItRw_Bow_M_02,1);
		CreateInvItems(slf,ItRw_Bow_M_03,1);
		CreateInvItems(slf,ItRw_Bow_M_04,1);
		CreateInvItems(slf,itwr_bow3,1);
		CreateInvItems(slf,itwr_bow4,1);
		CreateInvItems(slf,itwr_crossbow2,1);
		CreateInvItems(slf,ithl_t1,1);
		Bosper_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Bosper_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,itrw_bow_cobra,1);
		CreateInvItems(slf,ItRw_Arrow,200);
		CreateInvItems(slf,ItBe_Addon_DEX_10,1);
		CreateInvItems(slf,itwr_bow6,1);
		CreateInvItems(slf,itwr_crossbow3,1);
		CreateInvItems(slf,itmi_woodmaker01,3);
		CreateInvItems(slf,itmi_woodmaker02,3);
		CreateInvItems(slf,ithl_t2,1);
		CreateInvItems(slf,ithl_t3,1);
		CreateInvItems(slf,ithl_t4,1);
		Bosper_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Bosper_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bow_H_01,1);
		CreateInvItems(slf,ItRw_Bow_H_02,1);
		CreateInvItems(slf,ItRw_Bow_H_03,1);
		CreateInvItems(slf,ItRw_Bow_H_04,1);
		CreateInvItems(slf,itwr_bow5,1);
		CreateInvItems(slf,itmi_woodmaker01,1);
		CreateInvItems(slf,itmi_woodmaker02,1);
		CreateInvItems(slf,ithl_t5,1);
		Bosper_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Bosper_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		Bosper_ItemsGiven_Chapter_5 = TRUE;
	};
};

