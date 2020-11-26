# By: rx97
# 18 Nov 20
# 
#> @s: player who atked
#> iterates through every dead person

#> uid matching. rx.died is the matching player who died
scoreboard players operation $pm.uid rx.temp = @s rx.pm.atk_id

#> if multi_atk, grab cache
execute if entity @s[tag=rx.pm.multi_atk] run function rx.playerdb:api/get_self
execute if entity @s[tag=rx.pm.multi_atk] run data modify storage rx:temp pm.atk_stack set from storage rx:io playerdb.player.data.rx.pm.atk_stack

#> process atk. loops through every dead person
function rx.pm:impl/process_atk

#> clean up
execute if entity @s[tag=rx.pm.multi_atk] run data remove storage rx:temp pm.atk_stack
execute if entity @s[tag=rx.pm.multi_atk] run data remove storage rx:io playerdb.player.data.rx.pm.atk_stack
execute if entity @s[tag=rx.pm.multi_atk] run function rx.playerdb:api/save_self
tag @s remove rx.pm.multi_atk
