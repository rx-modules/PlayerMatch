# PlayerMatch - 1.15+ Minecraft Versions
A library to help matching player hits and kills to other players.

This datapack simply allows you to match the player killer/attacker to the player who died or who was hit. It's mostly designed for PvP minigames or servers since this sort of behavior can be hard to emulate.

## What can this be used for?

Custom Death Messages!

![Custom Death Messages](imgs/example.png)

Custom PvP weapons!


## How do I use this?

Simply, there are two function tags:

    #rx.pm:api/on_atk
    #rx.pm:api/on_kill

Just place a function in this tag. Every time there's a player who is attacked or killed, the killer/attacker will be `@s` and the person who died or who was hit will have the tag `rx.pm.Died` and `rx.pm.Def` respectively.

Here's an example of a very simple death message replacement, although they can be much more complex.

    tellraw @a [{"selector": "@a[tag=rx.pm.Died]"}, " was killed by ", {"selector": "@s"}]

## Why do I need **this**?

This uses a technique I stumbled upon a while back. Previously (afaik), there was no good way to match player hits / kills since the advancement `player_killed_entity` only gave us the player context and raycasting would be unreliable. Alternatively, looking at players who died in the same tick as a player who got a kill in the same tick works for simple kills, but will fail if there are multiple people killed in the same tick (using `@p` just helps a bit). 

In order to work around this, I used a temporary id system to assign ids to the player based on the advancement `player_killed_entity` and `player_hurt_entity` along with their counter parts, `entity_hurt_player` and `entity_killer_player`. Each of these advancements are given a condition to only check for players and upon triggering, assign an id to a player and increment the counter. Since these advancements grant sequentually, this allows the kill ids to line up with the death ids (same for atk and def). We can use score matching to match the killer to the dead player and the attacker to the victim. These scores get reset at the end of the tick!

There is one problem, if you attack multiple people or kill multiple people in the same tick (the former is easily common w/ sweeping edge), then the system would have overwritten your id. This is solved through the soft-dependancy of PlayerDB, another system I wrote to store arbituary nbt to each player. If a player strikes at two people, then I store the next id in a stack stored in their PlayerDB entry. This allows me to retrieve through iteration allowing `#api/on_*` to be called for every instance of death/def.

You can grab PlayerDB [here](https://github.com/rx-modules/PlayerDB)

PlayerDB is **soft-dependancy**. This means if PlayerDB isn't there, the system will still function, but multi-kills and multi-atks will only register the first person you kill/atk.

## Reference

If you are in the r/minecraftcommands discord, you can chk out this [post](https://discord.com/channels/154777837382008833/157097006500806656/748652573673652265) I made for more info.
