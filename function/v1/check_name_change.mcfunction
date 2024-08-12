
# Get the name and the uuid of the player
# Get player name
loot replace entity d8d66809-57a3-4754-b8e0-28e037d61fd4 container.0 loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:item","name":"minecraft:player_head","functions":[{"function":"minecraft:fill_player_head","entity":"this"}]}]}]}
data modify storage psm:data temp.name set from entity d8d66809-57a3-4754-b8e0-28e037d61fd4 item.components."minecraft:profile".name
# Get player uuid
data modify storage psm:data temp.uuid set from entity @s UUID

# Check if player exists, if not create new player in storage
execute with storage psm:data temp:
    $execute unless data storage psm:data players[{uuid:$(uuid)}] run data modify storage psm:data players append value {uuid:$(uuid), name:$(name)}

execute with storage psm:data temp:
    $data modify storage psm:data args.old_name set from storage psm:data players[{uuid:$(uuid)}].name
    # Check if player name has changed while updating the stored player name
    $execute store success score .new_name psm.leave_game run data modify storage psm:data players[{uuid:$(uuid)}].name set from storage psm:data temp.name

# if yes, update scoreboards
execute if score .new_name psm.leave_game matches 1:
    function #psm:v1/migrate with storage psm:data args
    function #psm_api:v1/migrate with storage psm:data args
