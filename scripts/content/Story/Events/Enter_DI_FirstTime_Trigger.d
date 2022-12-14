
var int EnterDI_Kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if(EnterDI_Kapitel6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,ItMi_InnosEye_MIS) == FALSE)
		{
			if(Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) == FALSE)
			{
				Wld_InsertItem(ItSe_XardasNotfallBeutel_MIS,"FP_ITEM_SHIP_12");
				SC_InnosEyeVergessen_DI = TRUE;
				B_LogEntry(TOPIC_HallenVonIrdorath,"Dnes v noci jsem m?l zvl??tn? sen. Hovo?il se mnou Xardas a ??dal m?, abych na lodi p?istoupil k alchymistick? kolon? a n?co odtamtud sebral. Bylo to velmi zvl??tn?, proto?e jsem ve?er p?ed t?m kupodivu v?bec nic nepil. Mo?n? to bylo delirium ze st??zlivosti.");
			};
			Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
			if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) == FALSE)
			{
				CreateInvItems(OrkElite_AntiPaladinOrkOberst_DI,ItAt_RockdragonHeart,1);
			};
		};
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);
		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapit?n Jorgen z?stane na lodi, dokud se nevr?t?m.");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapit?n Torlof z?stane na lodi a bude ji hl?dat po celou dobu, co budu na ostrov?. P?itom za n?m mohu zaj?t, pokud si budu cht?t zv??it obratnost ?i s?lu.");
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapit?n Jack z?stane tady na lodi, dokud se nevr?t?m. Je sice trochu vyd??en?, ale douf?m, ?e se ?asem uklidn?. Pot?ebuji ho.");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lee se po dobu m? nep??tomnosti dohl?dne na lo?. Tak? se u n?j mohu zastavit, budu-li si cht?t vylep?it schopnosti boje jednoru?n?mi a obouru?n?mi zbran?mi.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"S Miltenovou pomoc? si mohu zv??it sv? z?soby many.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Milten mi krom toho m??e vysv?tlit, jak vyrobit runy.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"M?m pocit, ?e na tom podivn?m ostrov? se Lester?v stav je?t? zhor?il.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Mario je n?jak? divn?. Po celou dobu plavby jen sed? na z?di a nepromluv? ani slovo. ");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Wolf m? nau?? st??let z luku a ku?e.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Vatras se uch?lil do kajuty pro m?gy. M??e m? uzdravit a prozradit mi spoustu v?c? ohledn? m?ch?n? lektvar?. ");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Vatras mi tak? m??e pomoci s postupem do dal??ho magick?ho kruhu. ");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Bennet m? nau?? kova?in?, kdy? ho o to po??d?m.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kdy? nebudu v?d?t, kudy kam, mohu se obr?tit na Diega, kter? m? nav?c z?sob? st?elivem. Tak? m? nau?? p??it z?mky a st??let z luku a ku?e.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Gorn b?hem na?eho v?letu nezah?lel a te? na lo? dohl?dne. Mysl?m, ?e kdy? mu ji sv???m, bude v dobr?ch rukou.");
			Log_AddEntry(TOPIC_MyCrew,"S Gornovou pomoc? se mohu zlep?it v ovl?d?n? obouru?n?ch zbran?.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lares mi sl?bil, ?e m? nau?? pl??en? a jednoru?n?mu boji. Krom toho si u n?j mohu vylep?it obratnost.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Biff je tak hami?n?, a? to bol?. Nebude snadn? na n?j dohl??et.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Angar nem? nikde st?n?. M?m pocit, ?e se zanedlouho pust? do boje s?m se sebou.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Girion se dr?? po??dn? stranou - jeho trp?livost je obdivuhodn?. A p?itom je to bojov? cvi?itel. To se mi na konci m??e hodit.");
		};
		IntroduceChapter(KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav",6000);
		EnterDI_Kapitel6 = TRUE;
	};
};

