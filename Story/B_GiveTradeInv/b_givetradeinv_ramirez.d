
var int ramirez_itemsgiven_chapter_1;
var int ramirez_itemsgiven_chapter_2;
var int ramirez_itemsgiven_chapter_3;
var int ramirez_itemsgiven_chapter_4;
var int ramirez_itemsgiven_chapter_5;

func void b_givetradeinv_ramirez(var C_Npc slf)
{
	if((Kapitel >= 1) && (RAMIREZ_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itbe_akro,1);
		CreateInvItems(slf,itmw_sneak1,1);
		CreateInvItems(slf,itmw_sneak3,1);
		CreateInvItems(slf,ItMi_Addon_Lennar_Paket,1);
		RAMIREZ_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (RAMIREZ_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmw_sneak2,1);
		CreateInvItems(slf,ItMi_Addon_Lennar_Paket,1);
		CreateInvItems(slf,itmw_sneak5,1);
		RAMIREZ_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (RAMIREZ_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMw_Rapier,1);
		CreateInvItems(slf,itmw_sneak6,1);
		CreateInvItems(slf,ItMw_Meisterdegen,1);
		CreateInvItems(slf,ItMi_Addon_Lennar_Paket,1);
		RAMIREZ_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (RAMIREZ_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmw_sneak8,1);
		CreateInvItems(slf,it2x29,1);
		CreateInvItems(slf,it92x29,1);
		CreateInvItems(slf,ItMi_Addon_Lennar_Paket,1);
		CreateInvItems(slf,it_fastdeath,1);
		RAMIREZ_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (RAMIREZ_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		RAMIREZ_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

