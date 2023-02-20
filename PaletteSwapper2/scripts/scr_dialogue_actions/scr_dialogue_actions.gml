// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro TEXT new TextAction
#macro PORTRAITS new PortraitAction

function DialogueAction() constructor
{
	act = function() { };
}

function TextAction(_text) : DialogueAction() constructor
{
	text = _text;
	act = function(textbox)
	{
		textbox.setText(text);
	}
}

function PortraitAction(_portraitL, _portraitR, _swapL, _swapR) : DialogueAction() constructor
{
	portraitL = _portraitL;
	portraitR = _portraitR;
	swapL = _swapL;
	swapR = _swapR;
	
	act = function(textbox)
	{
		textbox.setPortraits(portraitL, portraitR, swapL, swapR);
		textbox.next();
	}
}