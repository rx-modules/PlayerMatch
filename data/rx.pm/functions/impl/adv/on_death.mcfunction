# By: rx97
# 18 Nov 20
# 
#> @s: player from rx.pm:on_death

scoreboard players operation @s rx.pm.death_id = $curr rx.pm.death_id
scoreboard players add $curr rx.pm.death_id 1

advancement revoke @s only rx.pm:on_death
