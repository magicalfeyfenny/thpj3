counter++;

if (counter > 360) {
	alpha_cycle = (420 - counter) / 60;
} else {
	alpha_cycle = counter / 60;
}

if ( counter >= countermax ) {
	room_goto_next();
}
