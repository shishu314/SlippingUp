_x = argument0;
_y = argument1;
snowball = instance_create_depth(_x, _y, 0, obj_player1SnowBall);
powerRatio = obj_player1.currPower / obj_player1.maxPower;
snowballVelocity = powerRatio * snowball.maxVelocity;
angle = obj_player1Aim.angle;
snowball.xVelocity = dcos(angle) * snowballVelocity;
snowball.yVelocity = -dsin(angle) * snowballVelocity;