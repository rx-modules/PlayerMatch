# By: rx97
# 18 Nov 20
# 
#> @s: player from rx.pm:on_def

scoreboard players operation @s rx.pm.def_id = $curr rx.pm.def_id
scoreboard players add $curr rx.pm.def_id 1

advancement revoke @s only rx.pm:on_def
