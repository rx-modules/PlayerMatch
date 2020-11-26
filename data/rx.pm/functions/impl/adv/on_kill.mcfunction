# By: rx97
# 18 Nov 20
# 
#> @s: player from rx.pm:on_kill
#> adds id to kill stack

#> kill_id is set
execute if score @s rx.pm.kill_id matches 1.. run function rx.playerdb:api/get_self
execute if score @s rx.pm.kill_id matches 1.. run data modify storage rx:io playerdb.player.data.rx.pm.kill_stack append value -1
execute if score @s rx.pm.kill_id matches 1.. store result storage rx:io playerdb.player.data.rx.pm.kill_stack[-1] int 1 run scoreboard players get $curr rx.pm.kill_id
execute if score @s rx.pm.kill_id matches 1.. run function rx.playerdb:api/save_self
execute if score @s rx.pm.kill_id matches 1.. run tag @s add rx.pm.multi_kill


#> kill_id is unset
execute unless score @s rx.pm.kill_id matches 1.. run scoreboard players operation @s rx.pm.kill_id = $curr rx.pm.kill_id

#> increment
scoreboard players add $curr rx.pm.kill_id 1

#> revoke for future kills
advancement revoke @s only rx.pm:on_kill
