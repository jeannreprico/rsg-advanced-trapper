local RSGCore = exports['rsg-core']:GetCoreObject()

-- NOTE
-- ALL PELTS ARE rewarditem1

--ALL CARCUS REWARDS ARE rewarditem1, rewarditem2 and rewarditem3

-- Feather REWARDS SHOULD BE rewarditem5


-- store pelt to inventory
RegisterNetEvent('rsg-advanced-trapper:server:storepelt')
AddEventHandler('rsg-advanced-trapper:server:storepelt', function(rewarditem1)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(rewarditem1, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem1], "add")
end)

-- store carcass to inventory
RegisterNetEvent('rsg-advanced-trapper:server:storecarcass')
AddEventHandler('rsg-advanced-trapper:server:storecarcass', function(rewarditem2, rewarditem3, rewarditem4, rewarditem5)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local chance2 = math.random(1, 100) -- carcass
    local chance3 = math.random(1, 100) -- carcass
    local chance4 = math.random(1, 100) -- carcass
    local chance5 = math.random(1, 100) -- feathers

    if rewarditem2 ~= nil then
        if chance2 > 50 then -- chance variable
            Player.Functions.AddItem(rewarditem2, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem2], "add")
        end
    end

    if rewarditem3 ~= nil then
        if chance3 > 50 then -- chance variable
            Player.Functions.AddItem(rewarditem3, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem3], "add")
        end
    end

    if rewarditem4 ~= nil then
        if chance4 > 50 then -- chance variable
            Player.Functions.AddItem(rewarditem4, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem4], "add")
        end
    end

    if rewarditem5 ~= nil then
        if chance5 > 50 then -- chance variable --feathers
            Player.Functions.AddItem(rewarditem5, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem5], "add")
        end
    end
end)




RegisterServerEvent('rsg-advanced-trapper:server:sellpelts')
AddEventHandler('rsg-advanced-trapper:server:sellpelts', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local price = 0
    local haspelts = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then
                -- bear_pelt
                if Player.PlayerData.items[k].name == "poor_bear_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_bear_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_bear_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_bear_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_bear_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_bear_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- black_bear_pelt
                elseif Player.PlayerData.items[k].name == "poor_black_bear_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_black_bear_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_black_bear_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_black_bear_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_black_bear_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_black_bear_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- poor_boar_pelt
                elseif Player.PlayerData.items[k].name == "poor_boar_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_boar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_boar_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_boar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_boar_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_boar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- buck_pelt
                elseif Player.PlayerData.items[k].name == "poor_buck_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_buck_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_buck_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_buck_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_buck_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_buck_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- buffalo_pelt
                elseif Player.PlayerData.items[k].name == "poor_buffalo_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_buffalo_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_buffalo_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_buffalo_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_buffalo_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_buffalo_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- bull_pelt
                elseif Player.PlayerData.items[k].name == "poor_bull_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_bull_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_bull_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_bull_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_bull_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_bull_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- cougar_pelt
                elseif Player.PlayerData.items[k].name == "poor_cougar_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_cougar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_cougar_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_cougar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_cougar_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_cougar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- cow_pelt
                elseif Player.PlayerData.items[k].name == "poor_cow_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_cow_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_cow_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_cow_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_cow_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_cow_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- coyote_pelt
                elseif Player.PlayerData.items[k].name == "poor_coyote_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_coyote_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_coyote_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_cow_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_coyote_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_coyote_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- deer_pelt
                elseif Player.PlayerData.items[k].name == "poor_deer_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_deer_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_deer_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_deer_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_deer_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_deer_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- elk_pelt
                elseif Player.PlayerData.items[k].name == "poor_elk_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_elk_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_elk_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_elk_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_elk_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_elk_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- fox_pelt
                elseif Player.PlayerData.items[k].name == "poor_fox_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_fox_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_fox_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_fox_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_fox_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_fox_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- goat_pelt
                elseif Player.PlayerData.items[k].name == "poor_goat_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_goat_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_goat_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_goat_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_goat_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_goat_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- javelina_pelt
                elseif Player.PlayerData.items[k].name == "poor_javelina_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_javelina_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_javelina_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_javelina_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_javelina_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_javelina_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- moose_pelt
                elseif Player.PlayerData.items[k].name == "poor_moose_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_moose_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_moose_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_moose_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_moose_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_moose_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- ox_pelt
                elseif Player.PlayerData.items[k].name == "poor_ox_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_ox_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_ox_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_ox_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_ox_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_ox_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- panther_pelt
                elseif Player.PlayerData.items[k].name == "poor_panther_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_panther_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_panther_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_panther_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_panther_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_panther_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- pig_pelt
                elseif Player.PlayerData.items[k].name == "poor_pig_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_pig_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_pig_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_pig_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_pig_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_pig_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- pronghorn_pelt
                elseif Player.PlayerData.items[k].name == "poor_pronghorn_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_pronghorn_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_pronghorn_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_pronghorn_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_pronghorn_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_pronghorn_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- bighornram_pelt
                elseif Player.PlayerData.items[k].name == "poor_bighornram_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_bighornram_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_bighornram_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_bighornram_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_bighornram_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_bighornram_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- sheep_pelt
                elseif Player.PlayerData.items[k].name == "poor_sheep_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_sheep_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_sheep_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_sheep_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_sheep_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_sheep_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- wolf_pelt
                elseif Player.PlayerData.items[k].name == "poor_wolf_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_wolf_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_wolf_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_wolf_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_wolf_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_wolf_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- alligator_pelt
                elseif Player.PlayerData.items[k].name == "poor_alligator_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_alligator_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_alligator_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_alligator_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_alligator_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_alligator_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- legendary_alligator_pelt
                elseif Player.PlayerData.items[k].name == "legendary_alligator_pelt" then 
                    price = price + (Config.LegendaryPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("legendary_alligator_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- legendary_boar_pelt
                elseif Player.PlayerData.items[k].name == "legendary_boar_pelt" then 
                    price = price + (Config.LegendaryPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("legendary_boar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- legendary_cougar_pelt
                elseif Player.PlayerData.items[k].name == "legendary_cougar_pelt" then 
                    price = price + (Config.LegendaryPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("legendary_cougar_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- legendary_coyote_pelt
                elseif Player.PlayerData.items[k].name == "legendary_coyote_pelt" then 
                    price = price + (Config.LegendaryPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("legendary_coyote_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- legendary_panther_pelt
                elseif Player.PlayerData.items[k].name == "legendary_panther_pelt" then 
                    price = price + (Config.LegendaryPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("legendary_panther_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- legendary_wolf_pelt
                elseif Player.PlayerData.items[k].name == "legendary_wolf_pelt" then 
                    price = price + (Config.LegendaryPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("legendary_wolf_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                -- raccoon_pelt
                elseif Player.PlayerData.items[k].name == "poor_raccoon_pelt" then 
                    price = price + (Config.PoorPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("poor_raccoon_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "good_raccoon_pelt" then 
                    price = price + (Config.GoodPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("good_raccoon_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "perfect_raccoon_pelt" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("perfect_raccoon_pelt", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                elseif Player.PlayerData.items[k].name == "pelt_rabbit" then 
                    price = price + (Config.PerfectPeltPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("pelt_rabbit", Player.PlayerData.items[k].amount, k)
                    haspelts = true
                end
            end
        end
        if haspelts == true then
            Player.Functions.AddMoney(Config.PaymentType, price, "pelts-sold")
            RSGCore.Functions.Notify(source, Lang:t('success.you_have_sold_all_your_pelts_for')..price, 'success')
            haspelts = false
        else
            RSGCore.Functions.Notify(source, Lang:t('error.you_dont_have_any_pelts_to_sell'), 'error')
        end
    end
end)

RegisterServerEvent('rsg-advanced-trapper:server:sellcarcass')
AddEventHandler('rsg-advanced-trapper:server:sellcarcass', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local price = 0
    local hascarcass = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then
                -- HEART
                if Player.PlayerData.items[k].name == "heart_bear" then 
                    price = price + (Config.PoorCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("heart_bear", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "heart_wolf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("heart_wolf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "heart_deer" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("heart_deer", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "heart_chicken" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("heart_chicken", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                -- BEAK
                elseif Player.PlayerData.items[k].name == "beak_bparrotf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_bparrotf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_quailb" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_quailb", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_bbirdf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_bbirdf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_boobyf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_boobyf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_daruf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_daruf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_condorf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_condorf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_pelicanf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_pelicanf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_peasantf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_peasantf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true

                elseif Player.PlayerData.items[k].name == "beak_loonf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_loonf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_kbirdf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_kbirdf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_goosef" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_goosef", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_egretf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_egretf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_turkeyf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_turkeyf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_seagullf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_seagullf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_rspoonf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_rspoonf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_prairif" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_prairif", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_bparrotf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_bparrotf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_chickenf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_chickenf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_eaglef" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_eaglef", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_hawkf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_hawkf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_owlf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_owlf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_ravenf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_ravenf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_duckf" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_duckf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "beak_vulturef" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("beak_vulturef", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                
                -- TAIL
                elseif Player.PlayerData.items[k].name == "tail_beaver" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tail_beaver", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tail_chipmunk_c" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tail_chipmunk_c", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tail_panthere" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tail_panthere", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tail_lizardl" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tail_lizardl", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tail_rabbitpaw" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tail_rabbitpaw", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
            
                -- HORN
                elseif Player.PlayerData.items[k].name == "horn_bison" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_bison", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_bull" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_bull", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_cowh" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_cowh", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_ox" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_ox", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_prong" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_prong", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_ram" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_ram", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_buckantler" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_buckantler", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "horn_elkantler" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("horn_elkantler", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                
                -- CLAWS
                elseif Player.PlayerData.items[k].name == "claws_armadilloc" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_armadilloc", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_bearc" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_bearc", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_cockc" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_cockc", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_eaglet" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_eaglet", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_hawkt" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_hawkt", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_opossumc" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_opossumc", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_owlt" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_owlt", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "claws_ravenc" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_ravenc", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                -- TOOTH
                elseif Player.PlayerData.items[k].name == "tooth_aligatorto" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_aligatorto", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_beart" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_beart", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_cougarf" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_cougarf", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_coyotef" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_coyotef", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_foxt" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_foxt", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_raccoont" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_raccoont", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_snaket" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_snaket", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_turtlet" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_turtlet", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_wolftooth" then 
                    price = price + (Config.PerfectCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_wolftooth", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                elseif Player.PlayerData.items[k].name == "tooth_boarmusk" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tooth_boarmuskt", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                --other
                elseif Player.PlayerData.items[k].name == "wool" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("wool", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                end
                elseif Player.PlayerData.items[k].name == "claws_beartc" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("claws_beartc", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                end
                elseif Player.PlayerData.items[k].name == "fiber_woolblack" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("fiber_woolblack", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                end
                elseif Player.PlayerData.items[k].name == "tail_bull" then 
                    price = price + (Config.GoodCarcassPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("tail_bull", Player.PlayerData.items[k].amount, k)
                    hascarcass = true
                end
            end
        end
        if hascarcass == true then
            Player.Functions.AddMoney(Config.PaymentType, price, "carcass-sold")
            RSGCore.Functions.Notify(source, Lang:t('success.you_have_sold_all_your_carcass_for')..price, 'success')
            hascarcass = false
        else
            RSGCore.Functions.Notify(source, Lang:t('error.you_dont_have_any_carcass_to_sell'), 'error')
        end
    end
end)

RegisterServerEvent('rsg-advanced-trapper:server:sellfeathers')
AddEventHandler('rsg-advanced-trapper:server:sellfeathers', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local price = 0
    local hasfeathers = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then
                if Player.PlayerData.items[k].name == "feathers" then 
                    price =  price + (Config.FeathersPrice * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("feathers", Player.PlayerData.items[k].amount, k)
                    hasfeathers = true
                end
            end
        end
        if hasfeathers == true then
            Player.Functions.AddMoney(Config.PaymentType, price, "feathers-sold")
            RSGCore.Functions.Notify(source, Lang:t('success.you_have_sold_all_your_feathers_for')..price, 'success')
            hasfeathers = false
        else
            RSGCore.Functions.Notify(source, Lang:t('error.you_dont_have_any_feathers_to_sell'), 'error')
        end
    end
end)
