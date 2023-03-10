//2021
//Miniature Crystal ball
RegisterResourceGenerationFunction("IOTMCrystalBallGenerateTasks");
void IOTMCrystalBallGenerateTasks(ChecklistEntry [int] resource_entries)
{
	if (lookupItem("miniature crystal ball").available_amount() == 0)
		return;
	string title = "Miniature crystal ball monster prediction";
	string image_name = "__item miniature crystal ball";
	monster crystalBallPrediction = (get_property_monster("crystalBallMonster"));
	location crystalBallZone = (get_property_location("crystalBallLocation"));
	image_name = "__monster " + crystalBallPrediction;
	string [int] description;
	string url = invSearch("miniature crystal ball");
	if (!lookupItem("miniature crystal ball").equipped())
	{
		if (crystalBallPrediction != $monster[none])
		{
			description.listAppend("Next fight in " + HTMLGenerateSpanFont(crystalBallZone, "black") + " will be: " + HTMLGenerateSpanFont(crystalBallPrediction, "black"));
			description.listAppend("" + HTMLGenerateSpanFont("Equip the miniature crystal ball first!", "red") + "");
			resource_entries.listAppend(ChecklistEntryMake(image_name, url, ChecklistSubentryMake(title, description), -11));
		}
		else
		{
			description.listAppend("Equip the miniature crystal ball to predict a monster!");
			resource_entries.listAppend(ChecklistEntryMake("__item miniature crystal ball", url, ChecklistSubentryMake(title, description)));
		}
	}
	else
	{
		if (crystalBallPrediction != $monster[none])
		{
			description.listAppend("Next fight in " + HTMLGenerateSpanFont(crystalBallZone, "blue") + " will be: " + HTMLGenerateSpanFont(crystalBallPrediction, "blue"));
			resource_entries.listAppend(ChecklistEntryMake(image_name, url, ChecklistSubentryMake(title, description), -11));
		}
		else
		{
			description.listAppend("Adventure in a snarfblat to predict a monster!");
			resource_entries.listAppend(ChecklistEntryMake("__item quantum of familiar", url, ChecklistSubentryMake(title, description)));
		}	
	}
}