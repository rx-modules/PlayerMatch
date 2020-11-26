# By: rx97
# 18 Nov 20
# 
#> @s: player from rx.pm:on_atk
#> adds id to atk stack

#> atk_id is set
execute if score PlayerDB load matches 1 if score @s rx.pm.atk_id matches 1.. run function rx.playerdb:api/get_self
execute if score PlayerDB load matches 1 if score @s rx.pm.atk_id matches 1.. run data modify storage rx:io playerdb.player.data.rx.pm.atk_stack append value -1
execute if score PlayerDB load matches 1 if score @s rx.pm.atk_id matches 1.. store result storage rx:io playerdb.player.data.rx.pm.atk_stack[-1] int 1 run scoreboard players get $curr rx.pm.atk_id
execute if score PlayerDB load matches 1 if score @s rx.pm.atk_id matches 1.. run function rx.playerdb:api/save_self
execute if score PlayerDB load matches 1 if score @s rx.pm.atk_id matches 1.. run tag @s add rx.pm.multi_atk


#> atk_id is unset
execute unless score @s rx.pm.atk_id matches 1.. run scoreboard players operation @s rx.pm.atk_id = $curr rx.pm.atk_id

#> increment
scoreboard players add $curr rx.pm.atk_id 1

#> revoke for future atks
advancement revoke @s only rx.pm:on_atk
