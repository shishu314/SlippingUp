var numPlatforms = instance_number(obj_platform);
var randomNum = random(numPlatforms);
var platform = instance_find(obj_platform, randomNum);
var left = platform.x - platform.sprite_width/2;
var right = platform.x + platform.sprite_width/2;
var spearX = irandom_range(left, right);
instance_create_depth(spearX, 0, 0, obj_spearItem);
++global.spearCount;