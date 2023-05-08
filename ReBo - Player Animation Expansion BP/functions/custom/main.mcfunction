# ================================================================================ #
    # Scores
        scoreboard objectives add b-ignited dummy
        scoreboard objectives add b-initialized dummy
        scoreboard objectives add i-child_id dummy
        scoreboard objectives add i-control_count dummy
        scoreboard objectives add i-life_time dummy
        scoreboard objectives add i-player_count dummy
        scoreboard objectives add v-player_count_1 dummy
        scoreboard objectives add v-player_count_2 dummy
        scoreboard objectives add i-player_id dummy
        scoreboard objectives add v-player_id dummy
        scoreboard objectives add i-variant dummy
        scoreboard objectives add v-damage_tick dummy
        scoreboard objectives add v-on_entry dummy
        scoreboard objectives add v-second dummy
        
# ================================================================================ #
    # On Addon Initialization
        tickingarea add circle 1000000 1000000 1000000 1 control_area

        execute unless entity @e[type=minecraft:armor_stand,name=control] run summon minecraft:armor_stand "control" 1000000 1000000 1000000

        scoreboard players add @e b-initialized 0
        execute as @e[c=1,scores={b-initialized=1}] run scoreboard players set @e b-initialized 1

        execute if entity @e[type=minecraft:armor_stand,name=control,scores={b-initialized=0}] run function custom/on_addon_initialization
# ================================================================================ #
    # On World Entry
        scoreboard players add @e v-on_entry 0

        execute as @e[scores={v-on_entry=0}] run function custom/on_world_entry

        scoreboard players reset * v-on_entry

        scoreboard players set @e v-on_entry 1
# ================================================================================ #
    # On World Exit
        scoreboard players reset * v-player_count_1
        execute as @a run scoreboard players add @a v-player_count_1 1
        
        tag @p add this-0

        scoreboard players set @p[tag=this-0] v-player_count_2 0

        execute as @p[tag=this-0] run scoreboard players operation @s v-player_count_2 = @s i-player_count
        execute as @p[tag=this-0] run scoreboard players operation @s v-player_count_2 -= @s v-player_count_1
        

        tag @p[tag=this-0] remove this-0

        execute as @p[scores={v-player_count_2=1..}] run function custom/player/on_world_exit

        scoreboard players reset * v-player_count_1
        scoreboard players reset * v-player_count_2
# ================================================================================ #
    # Per tick
        function custom/per_tick
        function custom/debug/per_tick
    
    # Per Damage Tick
        execute as @p[scores={v-damage_tick=0..}] run scoreboard players add @a v-damage_tick 1

        execute as @p[scores={v-damage_tick=4}] run function custom/per_damage_tick
        execute as @p[scores={v-damage_tick=4}] run function custom/debug/per_damage_tick

        execute as @p[scores={v-damage_tick=4..}] run scoreboard players set @s v-damage_tick 0

    # Per Second
        execute as @p[scores={v-second=0..}] run scoreboard players add @a v-second 1

        execute as @p[scores={v-second=20}] run function custom/per_second
        execute as @p[scores={v-second=20}] run function custom/debug/per_second

        execute as @p[scores={v-second=20..}] run scoreboard players set @s v-second 0
# ================================================================================ #
