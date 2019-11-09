_x = argument0;
_y = argument1;
spear = instance_create_depth(_x, _y, 0, obj_spear);
spear.fromPlayer1 = false;
powerRatio = obj_player2.currPower / obj_player2.maxPower;
spearVelocity = powerRatio * spear.maxVelocity;
spear.xVelocity = obj_player2.image_xscale > 0 ? spearVelocity : -spearVelocity;
obj_player2.hasSpear = false;
--global.spearCount;