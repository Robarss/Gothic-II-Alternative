
var int alwin_itemsgiven_chapter_1;
var int alwin_itemsgiven_chapter_2;
var int alwin_itemsgiven_chapter_3;
var int alwin_itemsgiven_chapter_4;
var int alwin_itemsgiven_chapter_5;

func void b_givetradeinv_alwin(var C_Npc slf)
{
	if((Kapitel >= 1) && (ALWIN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Sausage,30);
		CreateInvItems(slf,ItFo_Bacon,20);
		CreateInvItems(slf,ItFoMuttonRaw,50);
		ALWIN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (ALWIN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Sausage,30);
		CreateInvItems(slf,ItFo_Bacon,20);
		CreateInvItems(slf,ItFoMuttonRaw,20);
		CreateInvItems(slf,ItFo_FishSoup,5);
		ALWIN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (ALWIN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Sausage,30);
		CreateInvItems(slf,ItFo_Bacon,20);
		CreateInvItems(slf,ItFoMuttonRaw,10);
		ALWIN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (ALWIN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItFo_Milk,10);
		CreateInvItems(slf,ItFo_Sausage,30);
		CreateInvItems(slf,ItFo_Bacon,20);
		CreateInvItems(slf,ItFoMuttonRaw,5);
		ALWIN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (ALWIN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItFo_Sausage,30);
		CreateInvItems(slf,ItFo_Bacon,20);
		CreateInvItems(slf,ItFoMuttonRaw,50);
		ALWIN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

