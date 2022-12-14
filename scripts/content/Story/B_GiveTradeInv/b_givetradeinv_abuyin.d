
var int abuyin_itemsgiven_chapter_1;
var int abuyin_itemsgiven_chapter_2;
var int abuyin_itemsgiven_chapter_3;
var int abuyin_itemsgiven_chapter_4;
var int abuyin_itemsgiven_chapter_5;

func void b_givetradeinv_abuyin(var C_Npc slf)
{
	if((Kapitel >= 1) && (ABUYIN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,it_2x2,1);
		CreateInvItems(slf,it2x21,1);
		CreateInvItems(slf,it12x21,1);
		ABUYIN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (ABUYIN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,it2x22,1);
		CreateInvItems(slf,it22x22,1);
		CreateInvItems(slf,it2x23,1);
		CreateInvItems(slf,it32x23,1);
		ABUYIN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (ABUYIN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,it2x20,1);
		CreateInvItems(slf,it02x20,1);
		CreateInvItems(slf,it2x26,1);
		CreateInvItems(slf,it62x26,1);
		CreateInvItems(slf,it2x28,1);
		CreateInvItems(slf,it82x28,1);
		ABUYIN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (ABUYIN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,it2x27,1);
		CreateInvItems(slf,it72x27,1);
		CreateInvItems(slf,it2x30,1);
		CreateInvItems(slf,it2x31,1);
		CreateInvItems(slf,it2x32,1);
		CreateInvItems(slf,it2x33,1);
		ABUYIN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (ABUYIN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		ABUYIN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

