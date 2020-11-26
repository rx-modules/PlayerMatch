# rx97
#> resets all uid and sets $curr to 1

scoreboard players reset @a rx.pm.death_id
scoreboard players reset @a rx.pm.kill_id
scoreboard players reset @a rx.pm.atk_id
scoreboard players reset @a rx.pm.def_id

scoreboard players set $curr rx.pm.death_id 1
scoreboard players set $curr rx.pm.kill_id 1
scoreboard players set $curr rx.pm.atk_id 1
scoreboard players set $curr rx.pm.def_id 1
