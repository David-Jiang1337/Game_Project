var camera = camera_get_default();

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text(camera_get_view_width(camera)*0.5,y, "Level:" + string(global.currentLevel));
