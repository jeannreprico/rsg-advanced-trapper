local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------------------

-- prompts
Citizen.CreateThread(function()
    for trapper, v in pairs(Config.TrapperLocations) do      
       exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds['J'], 'open ' .. v.name, {
            type = 'client',
            event = 'rsg-advanced-trapper:client:menu',
            args = {},
        })
        if v.showblip == true then
            local TrapperBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(TrapperBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(TrapperBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, TrapperBlip, Config.Blip.blipName)
        end
    end
end)

-----------------------------------------------------------------------------------

-- trapper menu
RegisterNetEvent('rsg-advanced-trapper:client:menu', function()
    exports['rsg-menu']:openMenu({
        {
            header =  Lang:t('menu.trapper_menu'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.sell_stored_pelts'),
            txt = Lang:t('text.sell_store_pelts'),
            icon = "fas fa-paw",
            params = {
                event = 'rsg-advanced-trapper:client:sellpelts',
                isServer = false,
            }
        },
        -----------
        {
            header = Lang:t('menu.sell_stored_carcass'),
            txt = Lang:t('text.sell_store_carcass'),
            icon = "fas fa-horse",
            params = {
                event = 'rsg-advanced-trapper:client:sellcarcass',
                isServer = false,
            }
        },
        {
            header = Lang:t('menu.sell_stored_feathers'),
            txt = Lang:t('text.sell_stored_feathers'),
            icon = "fas fa-feather",
            params = {
                event = 'rsg-advanced-trapper:client:sellfeathers',
                isServer = false,
            }
        },
        --------
        {
            header = Lang:t('menu.open_trapper_shop'),
            txt = Lang:t('text.buy_items_from_the_trapper'),
            icon = "fas fa-shopping-basket",
            params = {
                event = 'rsg-advanced-trapper:client:OpenTrapperShop',
                isServer = false,
                args = {}
            }
        },
        {
            header = Lang:t('menu.close_menu'),
            txt = '',
            params = {
                event = 'rsg-menu:closeMenu',
            }
        },
    })
end)

-----------------------------------------------------------------------------------

-- process bar before sell pelts
RegisterNetEvent('rsg-advanced-trapper:client:sellpelts', function()
    RSGCore.Functions.Progressbar('make-product', Lang:t('progressbar.checking_pelts'), Config.SellTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-advanced-trapper:server:sellpelts')
    end)
end)
-- process bar before sell pelts
RegisterNetEvent('rsg-advanced-trapper:client:sellcarcass', function()
    RSGCore.Functions.Progressbar('make-product', Lang:t('progressbar.checking_carcass'), Config.SellTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
    TriggerServerEvent('rsg-advanced-trapper:server:sellcarcass')
    end)
end)
-- process bar before sell feathers
RegisterNetEvent('rsg-advanced-trapper:client:sellfeathers', function()
    RSGCore.Functions.Progressbar('make-product', Lang:t('progressbar.checking_feathers'), Config.SellTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
    TriggerServerEvent('rsg-advanced-trapper:server:sellfeathers')
    end)
end)

-----------------------------------------------------------------------------------
-- pickup pelt and store in inventory ONLY TRIGGERS ON PELT PICKUP!
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
        local pelthash = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
        if holding ~= false then
            for i = 1, #Config.Pelts do
                if pelthash == Config.Pelts[i].pelthash then
                    local name = Config.Pelts[i].name

                    -- PELTREWARD
                    local rewarditem1 = Config.Pelts[i].rewarditem1
                    local chance1 = math.random(1,100)
                    -- CARCUS REWARDS
                    local rewarditem2 = Config.Pelts[i].rewarditem2
                    local rewarditem3 = Config.Pelts[i].rewarditem3
                    local rewarditem4 = Config.Pelts[i].rewarditem4

                    -- FEATHER REWARDS
                    local rewarditem5 = Config.Pelts[i].rewarditem5
                   
                    local deleted = DeleteThis(holding)
                    if deleted then
                        RSGCore.Functions.Notify(name.. Lang:t('primary.stored'), 'primary')
                        TriggerServerEvent('rsg-advanced-trapper:server:storepelt', rewarditem1) -- PELT REWARDS
                        TriggerServerEvent('rsg-advanced-trapper:server:storecarcass', rewarditem2,rewarditem3,rewarditem4,rewarditem5) -- PELT REWARDS
                    else
                        RSGCore.Functions.Notify( Lang:t('error.something_went_wrong'), 'error')
                    end
                end
            end
        end
    end
end)

-- CHECKS MODEL AFTER EVENT AND TRIGGERS SERVER ADDITEM EVENT
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local size = GetNumberOfEvents(0)
        if size > 0 then
            for index = 0, size - 1 do
                local event = GetEventAtIndex(0, index)
                if event == 1376140891 then
                    local view = exports["rsg-advanced-trapper"]:DataViewNativeGetEventData(0, index, 3)
                    local pedGathered = view['2']
                    local ped = view['0']
                    local model = GetEntityModel(pedGathered)
                    local model = model
                    local bool_unk = view['4']

                    local player = PlayerPedId()
                    local playergate = player == ped

                    -- Used to get models of animals in F8 Console menu turn on if you want to see what the hash is for animal.
                    if model and playergate == true then
                        print('Animal Gathered: ' .. model)
                    end
                   
                    for i = 1, #Config.Animal do 
                        if model and Config.Animal[i].modelhash ~= nil and playergate and bool_unk == 1 then
                            local chosenmodel = Config.Animal[i].modelhash
                            if model == chosenmodel then
                                local rewarditem2 = Config.Animal[i].rewarditem2 -- MODEL REWARDS
                                local rewarditem3 = Config.Animal[i].rewarditem3 -- MODEL REWARDS
                                local rewarditem4 = Config.Animal[i].rewarditem4 -- MODEL REWARDS
                                local rewarditem5 = Config.Animal[i].rewarditem5 -- MODEL REWARDS
                                TriggerServerEvent('rsg-advanced-trapper:server:storecarcass', rewarditem2, rewarditem3, rewarditem4, rewarditem5)
                            end
                        end
                    end
                end
            end
        end
    end
end)




-----------------------------------------------------------------------------------

-- delete holding
function DeleteThis(holding)
    NetworkRequestControlOfEntity(holding)
    SetEntityAsMissionEntity(holding, true, true)
    Wait(100)
    DeleteEntity(holding)
    Wait(500)
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingcheck = GetPedType(entitycheck)
    if holdingcheck == 0 then
        return true
    else
        return false
    end
end

-----------------------------------------------------------------------------------

-- trapper shop
RegisterNetEvent('rsg-advanced-trapper:client:OpenTrapperShop')
AddEventHandler('rsg-advanced-trapper:client:OpenTrapperShop', function()
    local ShopItems = {}
    ShopItems.label = Lang:t('text.trapper_shop')
    ShopItems.items = Config.TrapperShop
    ShopItems.slots = #Config.TrapperShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "TrapperShop_"..math.random(1, 99), ShopItems)
end)

-----------------------------------------------------------------------------------

RegisterCommand('spawn_animal', function(source, args, rawCommand)
    local animal = args[1] -- example : mp_a_c_wolf_01
    local outfit = args[2] -- example : 0
    local wait = args[3] -- example : 1000
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    if animal == nil then
        animal = 'mp_a_c_wolf_01'
    end
    if outfit == nil then
        outfit = 0
    end
    if wait == nil then
        wait = '10000'
    end
    wait = tonumber(wait)
    if Config.Debug then
        RequestModel(animal)
        while not HasModelLoaded(animal) do
            Wait(10)
        end
        animal = CreatePed(animal, playerCoords.x, playerCoords.y +5, playerCoords.z, true, true, true)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, animal, outfit, false)
        Wait(wait)
        FreezeEntityPosition(animal, true)
    end
end, false)


