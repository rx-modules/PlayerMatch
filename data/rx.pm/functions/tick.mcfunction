# By: rx97
# 17 Nov 20
# 
#> tick func

#> runs on player kill
execute as @a[scores={rx.pm.kill_id=1..}] run function rx.pm:impl/kill

#> runs on player atk
execute as @a[scores={rx.pm.atk_id=1..}] run function rx.pm:impl/atk

#> resets everything
function rx.pm:reset

# loop
schedule function rx.pm:tick 1t replace
