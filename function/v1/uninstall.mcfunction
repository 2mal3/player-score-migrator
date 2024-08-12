scoreboard objectives remove psm.leave_game

data modify storage psm:data players set value []
data modify storage psm:data temp set value {}
data modify storage psm:data args set value {}

kill d8d66809-57a3-4754-b8e0-28e037d61fd4
forceload remove 0 0
