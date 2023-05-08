# ================================================================================ #
    # Child ID Assignment
    scoreboard players set @s[family=child] i-child_id -1
# ================================================================================ #

execute as @s[type=minecraft:player] run function custom/player/on_world_entry
