
var _depth = (aim_dir > 0 and aim_dir < 180);
my_bow.depth = depth + _depth;

my_bow.x = x + lengthdir_x(bow_dis, aim_dir);
my_bow.y = y + lengthdir_y(bow_dis, aim_dir);