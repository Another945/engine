/// @description Start the battle

prt_player.function_state = 1;

var myboss = instance_nearest(x, y, prt_boss);
myboss.function_state = 1;
global.frozen_bosses = false;

battle = true;

