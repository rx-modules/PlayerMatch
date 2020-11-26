# By: rx97
# 18 Nov 20
# 
#> @s: player who killed
#> iterates through every dead person

#> uid matching. rx.died is the matching player who died
scoreboard players operation $pm.uid rx.temp = @s rx.pm.kill_id

#> if multi_kill, grab cache
execute if entity @s[tag=rx.pm.multi_kill] run function rx.playerdb:api/get_self
execute if entity @s[tag=rx.pm.multi_kill] run data modify storage rx:temp pm.kill_stack set from storage rx:io playerdb.player.data.rx.pm.kill_stack

#> process kill. loops through every dead person
function rx.pm:impl/process_kill

#> clean up
execute if entity @s[tag=rx.pm.multi_kill] run data remove storage rx:temp pm.kill_stack
execute if entity @s[tag=rx.pm.multi_kill] run data remove storage rx:io playerdb.player.data.rx.pm.kill_stack
execute if entity @s[tag=rx.pm.multi_kill] run function rx.playerdb:api/save_self
tag @s remove rx.pm.multi_kill
