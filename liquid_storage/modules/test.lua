  -- handle click for slot + mouse item
  function click(button, click_type)
    if click_type == "PRESSED" then
      -- see if we are clicking on a slot
      highlighted = api_get_highlighted("slot")
      if highlighted ~= nil then
        -- if slot has a canister make sure it has the correct max stat
        check_has_max(api_get_inst(highlighted))
      end
      -- if mouse now has canister check the same thing
      mouse = api_get_mouse_inst()
      check_has_max(inst)
    end
  end
  
  -- both slots and the mouse have the same props
  -- so we can re-use the same method to check both
  function check_has_max(inst) 
    if inst ~= nil then
      -- if slot item is our canister
      item = api_gp(inst["id"], "item")
      if item == "liquid_storage_canister1900" then
        stats = api_gp(inst["id"], "stats")
        -- if canister stats max is not 1600 then set it to be
        if stats["max"] ~= 1600 then
          stats["max"] = 1600;
          api_sp(inst["id"], "stats", stats)
        end
      end
    end
  end

  function key(key_code)
    --if key_code == 32 then
      --highlighted = api_get_highlighted("item")
        --if highlighted ~= nil then
            --highlighted = api_get_highlighted(highlighted)
                --if highlighted["item"] == MOD_NAME.. "_canister1900" then
                    --api_sp(highlighted, "stats", {type="",amount="",max=1600})
                        --api_log("canister1900 stats")
                --end
            --end
        --end
    --end

if key_code == 32 then
    local highlighted = api_get_highlighted("item")
    if highlighted ~= nil then
        local inst = api_get_inst(highlighted)
        if inst["oid"] == MOD_NAME .. "_canister1900"
        then
            api_log("test","GOT 1900") 
        else
            api_log("test","not 1900")
                    end
            end
        end
    end
  -- handle click for slot + mouse item
function click(button, click_type)
    if click_type == "PRESSED" then
      -- see if we are clicking on a slot
      highlighted = api_get_highlighted("slot")
      if highlighted ~= nil then
        -- if slot has a canister make sure it has the correct max stat
        check_has_max(api_get_inst(highlighted))
      end
      -- if mouse now has canister check the same thing
      mouse = api_get_mouse_inst()
      check_has_max(inst)
    end
  end
  -- both slots and the mouse have the same props
  -- so we can re-use the same method to check both
  function check_has_max(inst) 
    if inst ~= nil then
      -- if slot item is our canister
      item = api_gp(inst["id"], "item")
      if item == "liquid_storage_canister1900" then
        stats = api_gp(inst["id"], "stats")
        -- if canister stats max is not 1600 then set it to be
        if stats["max"] ~= 1600 then
          stats["max"] = 1600;
          api_sp(inst["id"], "stats", stats)
        end
function check_has_max(inst)
    if inst ~= nil then
        item = api_gp(inst["id"], "item")
        if item == "liquid_storage_Canister1901" then
            stats = api_gp(inst["id"], "stats")
            if stats["max"] ~= 3200 then
                stats["max"] = 3200;
                api_sp(inst[id], "stats", stats)
            end
function check_has_max(inst)
    if inst ~= nil then
        item = api_gp(inst["id"], "item")
        if item == "liquid_storage_canister1902" then
            stats = api_gp(inst["id"], "stats")
            if stats["max"] ~= 6400 then
                stats["max"] = 6400;
                api_sp(inst[id], "stats", stats)
            end
            end
        end
    end
            end
        end
    end
      end
    end
  end

  function click(button, click_type)
    if click_type == "PRESSED" then
        -- see if we are clicking on a slot
        item_instance = api_get_inst(api_get_highlighted("slot"))
        log(item_instance)
        -- no item is clicked exit the function
        if item_instance == nil then
            log('item_instance empty, returning')
            do
                return
            end
        end
        -- if slot has a canister make sure it has the correct max stat
        -- check item that was pressed
        log('checking has max for item')
        check_has_max(item_instance)
        -- if mouse now has canister check the same thing
        -- mouse = api_get_mouse_inst()
        -- -- check item that is in mouse
        -- log('checking has max for instance under mouse')
        -- log(inst)
        -- check_has_max(inst)
    end
end
-- both slots and the mouse have the same props
-- so we can re-use the same method to check both
function check_has_max(inst)
    if inst ~= nil then
        -- if slot item is our canister
        item = api_gp(inst["id"], "item")
        log('item is: ')
        log(item)
        stats = api_gp(inst["id"], "stats")
        log('stats are: ')
        log(stats)
        if item == "liquid_storage_canister1900" then
             log('item is liquid_storage_canister1900')
        --     -- if stats["max"] ~= 1600 then
                 stats["max"] = 1600;
        --     -- end
         end
        if item == "liquid_storage_canister1901" then
            log('item is liquid_storage_canister1901')
            -- if stats["max"] ~= 3200 then
                stats["max"] = 3200;
            -- end
        end
        if item == "liquid_storage_canister1902" then
            log('item is liquid_storage_canister1902')
            -- if stats["max"] ~= 6400 then
                stats["max"] = 6400;
            -- end
        end
        log('setting new stats: ')
        log(stats)
        api_sp(inst["id"], "stats", stats)
    end
end

function log(thing)
    api_log('liquid_mod', thing)
end