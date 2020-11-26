# By: rx97
# 10 Oct 2020
# 
#> Check for dependancies before loading
#> Thanks to gm4 for help

#> Temp obj
scoreboard objectives add rx.temp dummy

#> Get version
execute store result score $major rx.temp run data get storage rx:info playerdb.version.major
execute store result score $minor rx.temp run data get storage rx:info playerdb.version.minor
execute store result score $patch rx.temp run data get storage rx:info playerdb.version.patch

#> Info!
data modify storage rx:info pm.name set value 'Player Match'
data modify storage rx:info pm.pretty_name set value '[{"text":"P","color":"#3464a9"},{"text":"l","color":"#3671ac"},{"text":"a","color":"#387eaf"},{"text":"y","color":"#3a8cb2"},{"text":"e","color":"#3c99b5"},{"text":"r","color":"#3fa7b9"},{"text":"M","color":"#409eb9"},{"text":"a","color":"#4195b9"},{"text":"t","color":"#438cb9"},{"text":"c","color":"#4483b9"},{"text":"h","color":"#467aba"}]'

#> Load EnderChest only if PlayerDB is loaded + version
execute if score rx.PlayerDB load matches 1.. if data storage rx:info playerdb.version if score $major rx.temp matches 0..1 if score $minor rx.temp matches 8.. run scoreboard players set rx.PlayerMatch load 1

#> Success, let's load
execute if score rx.PlayerMatch load matches 1.. run tellraw @a[tag=rx.admin] [{"nbt": "pm.pretty_name", "storage": "rx:info", "interpret": true}, " ", {"text":"L","color":"#3464a9"},{"text":"o","color":"#387eaf"},{"text":"a","color":"#3c99b5"},{"text":"d","color":"#409eb9"},{"text":"e","color":"#438cb9"},{"text":"d","color":"#467aba"}]
execute if score rx.PlayerMatch load matches 1.. run function rx.pm:init

#> Oh no, something is wrong
execute unless score rx.PlayerMatch load matches 1.. run schedule clear rx.pm:tick

#> Error messages: a) missing PlayerDB completely b) wrong PlayerDB version
execute unless score rx.PlayerMatch load matches 1.. unless data storage rx:info playerdb.version run tellraw @a [{"nbt": "pm.pretty_name", "storage": "rx:info", "interpret": true, "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":" Warning","color":"red"},{"text":": PlayerDB is not installed. ","color":"gray"},{"text":"Please grab the latest release by clicking this text. ","color":"gray"},{"text":"Install PlayerDB and run `/reload`.","color":"gray"}]
execute unless score rx.PlayerMatch load matches 1.. if data storage rx:info playerdb.version run tellraw @a [{"nbt": "pm.pretty_name", "storage": "rx:info", "interpret": true, "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":" Warning","color":"red"},{"text":": The wrong version of PlayerDB is installed. ","color":"gray"},{"text":"PlayerMatch v0.1 requires PlayerDB v0.8-beta.\nTroubleshooting:\n","color":"gray"},{"text":"  a) Check whether you have PlayerDB v0.8\n","color":"gray"},{"text":"  b) Check that only PlayerDB v0.8 is loaded (delete older versions)\n","color":"gray"},{"text":"  c) Check if there is a new version of PlayerMatch\n","color":"gray", "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerMatch/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}}]
