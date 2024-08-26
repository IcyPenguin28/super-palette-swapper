/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
myFile = "";

numNormalStages = 12;
numSpecialStages = 4;
numBosses = 4;
numLevels = numNormalStages + numSpecialStages + numBosses + 1;

numStars = (numNormalStages + numBosses) * 3;
numKeys = (numNormalStages + numBosses);
numCollectibles = numLevels + numStars + numKeys;
numCollected = 0;

alteredImage = false;

chosen = false;
movingToRoom = false;

