execute if loaded 0 0 0 as @a:
    # Setup new players
    execute unless score @s psm.leave_game matches 0:
        scoreboard players set @s psm.leave_game 0
        function psm:v1/check_name_change

    # Loaded check is needed because the item display entity is not immediately loaded
    execute if score @s psm.leave_game matches 1..:
        scoreboard players set @s psm.leave_game 0
        function psm:v1/check_name_change
