//updating the clock
global.realTime = delta_time/1000000;
global.idealTime = 1/game_get_speed(gamespeed_fps);
global.deltaMulti = global.realTime / global.idealTime;