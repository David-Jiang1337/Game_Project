//delta timed clock
global.realTime = delta_time/1000000; //actual render frame time
global.idealTime = 1/game_get_speed(gamespeed_fps); //expected render frame time
global.deltaMulti = global.realTime / global.idealTime; //a multiplier that counteracts lag in frame timed events