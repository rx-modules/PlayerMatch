# By: rx97
# 18 Nov 20
# 
#> @s: atker
#> loops the atker through every dead person

execute as @a[scores={rx.pm.def_id=1..}] if score @s rx.pm.def_id = $pm.uid rx.temp run tag @s add rx.pm.Def

function #rx.pm:api/on_atk

tag @a remove rx.pm.Def

execute unless data storage rx:temp pm.atk_stack[] run scoreboard players reset $pm.uid rx.temp
execute if data storage rx:temp pm.atk_stack[] store result score $pm.uid rx.temp run data get storage rx:temp pm.atk_stack[0]
execute if data storage rx:temp pm.atk_stack[] run data remove storage rx:temp pm.atk_stack[0]

execute if score $pm.uid rx.temp = $pm.uid rx.temp run function rx.pm:impl/process_atk
