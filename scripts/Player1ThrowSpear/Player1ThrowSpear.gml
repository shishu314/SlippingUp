_x = argument0;
_y = argument1;
spear = instance_create_depth(_x, _y, 0, obj_spear);
spear.fromPlayer1 = true;
powerRatio = obj_player1.currPower / obj_player1.maxPower;
spearVelocity = powerRatio * spear.maxVelocity;
spear.xVelocity = obj_player1.image_xscale > 0 ? spearVelocity : -spearVelocity;obj_player1.hasSpear = false;
--global.spearCount;