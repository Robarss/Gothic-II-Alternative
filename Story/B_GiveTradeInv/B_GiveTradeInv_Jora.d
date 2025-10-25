
var int Jora_ItemsGiven_Chapter_1;
var int Jora_ItemsGiven_Chapter_2;
var int Jora_ItemsGiven_Chapter_3;
var int Jora_ItemsGiven_Chapter_4;
var int Jora_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Jora(var C_Npc slf)
{
	if((Kapitel >= 1) && (Jora_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItMw_ShortSword3,1);
		CreateInvItems(slf,itmi_bottle_empty,3);
		CreateInvItems(slf,ItMi_Pitch,10);
		CreateInvItems(slf,ItMi_Quartz,10);
		CreateInvItems(slf,ItAm_Prot_Point_01,1);
		CreateInvItems(slf,ItMi_Saw,2);
		CreateInvItems(slf,ItMi_Scoop,2);
		CreateInvItems(slf,ItMi_Brush,3);
		CreateInvItems(slf,ItLsTorch,3);
		Jora_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Jora_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItPl_Mushroom_02,2);
		CreateInvItems(slf,ItMi_Quartz,5);
		Jora_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Jora_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,10);
		CreateInvItems(slf,ItMi_Broom,4);
		CreateInvItems(slf,ItMi_Brush,1);
		CreateInvItems(slf,ItRw_Arrow,60);
		CreateInvItems(slf,ItRw_Bolt,60);
		Jora_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Jora_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItLsTorch,4);
		CreateInvItems(slf,ItMi_Hammer,5);
		CreateInvItems(slf,ItBe_Addon_STR_10,1);
		Jora_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Jora_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,2);
		Jora_ItemsGiven_Chapter_5 = TRUE;
	};
};

