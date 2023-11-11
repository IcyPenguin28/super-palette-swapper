/// @description Insert description here
// You can write your code in this editor


if canInteract
{
	switch (activeMenu)
	{
		case optionsmenu.main:
			choices = [
				"Audio",
				"Visuals",
				"Controls"
			];
			break;
		case optionsmenu.audio:
			choices = [
				"BGM",
				"SFX",
				"Voice"
			];
			break;
		case optionsmenu.visuals:
			choices = [
				"UI Opacity"
			];
			break;
		case optionsmenu.controls:
			choices = [
			];
	}
}