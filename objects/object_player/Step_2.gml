#region
//make camera follow player
var halfWidth = camera_get_view_width(view_camera[0])/2;
var halfHeight = camera_get_view_height(view_camera[0])/2;

camera_set_view_pos(view_camera[0], x-halfWidth, y-halfHeight);

#endregion