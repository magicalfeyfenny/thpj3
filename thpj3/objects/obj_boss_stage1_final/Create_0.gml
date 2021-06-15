// Inherit the parent event
event_inherited();

phases = 7;
current_phase = 0;
phase_hp = [];
phase_hp[7] = 6500;
phase_hp[6] = 5000;
phase_hp[5] = 4200;
phase_hp[4] = 3000;
phase_hp[3] = 3100;
phase_hp[2] = 3500;
phase_hp[1] = 3400;
phase_hp[0] = 3000;
stagename = "stage1";
bossname = "Nue";
boss_title = "An unidentified flying object";
hp = phase_hp[current_phase];