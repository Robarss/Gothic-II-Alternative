
var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;

func void b_ravensescapeintotempelavi()
{
	if(B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RavenIsInTempel = TRUE;
		Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_RavenKDW,"Proniknul jsem do Ravenova s�dla. Spat�il jsem ho, jak pr�v� vch�z� do velk� br�ny. Nebyl jsem schopen ho n�sledovat. Tu��m, �e br�na vede do Adanosova chr�mu. Mus�m to ozn�mit Saturasovi.");
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};

