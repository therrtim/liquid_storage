function key(key_code)
end

function log(thing)
    api_log('liquid_mod', thing)
end

function click(button, click_type)
    if click_type == "PRESSED" then
        item_instance = api_get_inst(api_get_highlighted("slot"))
        --[[ log(item_instance) ]]
        if item_instance == nil then
            --log('item_instance empty, returning')
            do
                return
            end
        end
        --[[ log('checking has max for item') ]]
        check_has_max(item_instance)
    end
end

function check_has_max(inst)
    if inst ~= nil then
        item = api_gp(inst["id"], "item")
        --[[ log('item is: ')
        log(item) ]]
        stats = api_gp(inst["id"], "stats")
        --[[ log('stats are: ')
        log(stats) ]]
        if item == "liquid_storage_canister1900" then
            --[[ log('item is liquid_storage_canister1900') ]]
            stats["max"] = 1600;
        end
        if item == "liquid_storage_canister1901" then
            --[[ log('item is liquid_storage_canister1901') ]]
            stats["max"] = 3200;
        end
        if item == "liquid_storage_canister1902" then
            --[[ log('item is liquid_storage_canister1902') ]]
            stats["max"] = 6400;
        end
       --[[  log('setting new stats: ')
        log(stats) ]]
        api_sp(inst["id"], "stats", stats)
    end
end
