# By: rx97
# 10 Oct 2020
# 
#> Creates Objs. Called from Lantern Load

#define storage rx:info
#define storage rx:temp
#define storage rx:io
#define function rx.playerdb:api/get_self
#define function rx.playerdb:api/save_self

scoreboard objectives add rx.temp dummy

scoreboard objectives add rx.pm.death_id dummy
scoreboard objectives add rx.pm.kill_id dummy
scoreboard objectives add rx.pm.atk_id dummy
scoreboard objectives add rx.pm.def_id dummy

scoreboard players add $curr rx.pm.death_id 1
scoreboard players add $curr rx.pm.kill_id 1
scoreboard players add $curr rx.pm.atk_id 1
scoreboard players add $curr rx.pm.def_id 1

# version
data modify storage rx:info pm.version set value {major: 0, minor: 5}

# schedule tick
schedule function rx.pm:tick 1t replace
