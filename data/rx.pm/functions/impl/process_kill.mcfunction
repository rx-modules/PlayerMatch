# By: rx97
# 18 Nov 20
# 
#> @s: killer
#> loops the killer through every dead person

execute as @a[scores={rx.pm.death_id=1..}] if score @s rx.pm.death_id = $pm.uid rx.temp run tag @s add rx.pm.Died

function #rx.pm:api/on_kill

tag @a remove rx.pm.Died

execute unless data storage rx:temp pm.kill_stack[] run scoreboard players reset $pm.uid rx.temp
execute if data storage rx:temp pm.kill_stack[] store result score $pm.uid rx.temp run data get storage rx:temp pm.kill_stack[0]
execute if data storage rx:temp pm.kill_stack[] run data remove storage rx:temp pm.kill_stack[0]

execute if score $pm.uid rx.temp = $pm.uid rx.temp run function rx.pm:impl/process_kill
