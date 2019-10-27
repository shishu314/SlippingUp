_x = argument0;
_y = argument1;
snowball = instance_create_depth(_x, _y, 0, obj_player2SnowBall);
powerRatio = obj_player2.currPower / obj_player2.maxPower;
snowballVelocity = powerRatio * snowball.maxVelocity;
angle = obj_player2Aim.angle;
snowball.xVelocity = dcos(angle) * snowballVelocity;
snowball.yVelocity = -dsin(angle) * snowballVelocity;