// Inherit the parent event
event_inherited();

phases = 3;
current_phase = 0;
phase_hp = [];
phase_hp[3] = 3000;
phase_hp[2] = 3500;
phase_hp[1] = 2500;
phase_hp[0] = 2000;
stagename = "stage1";
bossname = "Byakuren";
boss_title = "Superhuman Youkai Savior";
hp = phase_hp[current_phase];