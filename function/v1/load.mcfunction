scoreboard objectives add psm.leave_game minecraft.custom:minecraft.leave_game

forceload add 0 0
# d8d66809-57a3-4754-b8e0-28e037d61fd4
execute unless entity d8d66809-57a3-4754-b8e0-28e037d61fd4 run \
    summon minecraft:item_display 0 0 0 {UUID: [I;-657037303,1470318420,-1193269024,936779732]}

execute unless data storage psm:data players run data modify storage psm:data players set value []
