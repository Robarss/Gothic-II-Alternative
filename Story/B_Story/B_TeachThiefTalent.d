
func int B_TeachThiefTalent(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,talent,1);
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET) && (talent != NPC_TALENT_BOW_MAKER) && (talent != NPC_TALENT_ARROW_BOLT) && (talent != NPC_TALENT_FORGE) && (talent != NPC_TALENT_SHIELDD) && (talent != NPC_TALENT_2X2WEAPONS))
	{
		Print("*** CHYBA: nesprávný parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		PrintScreen(PRINT_LearnPicklock,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		PrintScreen(PRINT_LearnSneak,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		PrintScreen(PRINT_LearnAcrobat,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		PrintScreen(PRINT_LearnPickpocket,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW_MAKER)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_BOW_MAKER,1);
		return TRUE;
	};
	if(talent == NPC_TALENT_ARROW_BOLT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ARROW_BOLT,1);
		return TRUE;
	};
	if(talent == NPC_TALENT_FORGE)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_FORGE,1);
		return TRUE;
	};
	if(talent == NPC_TALENT_SHIELDD)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SHIELDD,1);
		return TRUE;
	};
	if(talent == NPC_TALENT_2X2WEAPONS)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_2X2WEAPONS,1);
		return TRUE;
	};
	return FALSE;
};

