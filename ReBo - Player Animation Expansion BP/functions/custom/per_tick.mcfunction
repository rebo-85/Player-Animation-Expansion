# ================================================================================ #
    # Player ID Assignment
        scoreboard players set @a v-player_id 0

        execute as @a[scores={i-player_id=0..}] run scoreboard players add @a v-player_id 1

        execute as @p[scores={i-player_id=!0..}] run scoreboard players operation @s i-player_id = @s v-player_id

    # Life time
            scoreboard players add @e i-life_time 1
# ================================================================================ #
