
func int B_TeachMagicCircle(var C_Npc slf,var C_Npc oth,var int circle)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** CHYBA: nespr?vn? parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic(TOPIC_TalentMagicCircle,LOG_NOTE);
	B_LogEntry(TOPIC_TalentMagicCircle,"Magick? runy, ke kter?m m?m nyn? p??stup, jsou rozd?leny do jednotliv?ch kruh?. Nemohu pou??t kouzlo, je? vy?aduje vy??? kruh, ne? jak? ji? ovl?d?m.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LearnCircle_1,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Kouzla prvn?ho kruhu jsou: sv?tlo, ohniv? ??p, mal? blesk, l??ba lehk?ch zran?n? a vyvol?n? goblin?ho kostlivce.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LearnCircle_2,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Ke kouzl?m druh?ho kruhu pat??: ohniv? koule, ledov? ??p, vyvol?n? vlka, v?trn? p?st a sp?nek.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LearnCircle_3,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Kouzla 3. kruhu zahrnuj?: l??bu st?edn? t??k?ch zran?n?, kulov? blesk, malou ohnivou bou?i, vyvol?n? kostlivce, strach a ledov? blok.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LearnCircle_4,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Ke kouzl?m 4. kruhu n?le??: blesk, vytvo?en? kamenn?ho golema, ni?en? nemrtv?ch a velk? ohniv? koule.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LearnCircle_5,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Kouzla 5. kruhu obsahuj?: velkou ohnivou bou?i, ledovou vlnu, vyvol?n? d?mona a l??bu t??k?ch zran?n?.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LearnCircle_6,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"Kouzla 6. kruhu ??taj?: ohniv? d隝, dech smrti, vlnu smrti, arm?du temnot a zmen?en? nestv?ry.");
		return TRUE;
	};
	return FALSE;
};

