function define_tank()

    api_define_menu_object({
        id = "tank1900",
        name = "Honeycore Tank",
        category = "Tools",
        tooltip = "Lets you store more liquid!",
        layout = {{7, 63, "Liquid Input",
                   {"canister1", "canister2", MOD_NAME .. "_canister1900", MOD_NAME .. "_canister1901",
                    MOD_NAME .. "_canister1902"}}, {30, 63, "Liquid Output",
                                                    {"canister1", "canister2", MOD_NAME .. "_canister1900",
                                                     MOD_NAME .. "_canister1901", MOD_NAME .. "_canister1902"}}},
        buttons = {"Help", "Target", "Close"},
        info = {{"1. Liquid Input Slot", "GREEN"}, {"2. Liquid Drainage Slot", "RED"},
                {"3. Liquid Storage Tank", "ORANGE"}},
        tools = {"hammer1"},
        placeable = true
    }, "sprites/item/tank1900.png", "sprites/item/menu1900.png", {
        define = "tank1900_define",
        draw = "tank_draw",
        tick = "tank_tick",
        change = "tank_change",
        clock = "tank_clock"
    })
    recipe = {{
        item = MOD_NAME .. "_canister1900",
        amount = 2
    }, {
        item = "honeycore2",
        amount = 32
    }}
    res = api_define_recipe("tools", MOD_NAME .. "_tank1900", recipe, 1)
    log("tank1900 loaded")

    api_define_menu_object({
        id = "tank1901",
        name = "Chaos Barrel",
        category = "Tools",
        tooltip = "Lets you store even more liquid!",
        layout = {{7, 63, "Liquid Input",
                   {"canister1", "canister2", MOD_NAME .. "_canister1900", MOD_NAME .. "_canister1901",
                    MOD_NAME .. "_canister1902"}}, {30, 63, "Liquid Output",
                                                    {"canister1", "canister2", MOD_NAME .. "_canister1900",
                                                     MOD_NAME .. "_canister1901", MOD_NAME .. "_canister1902"}}},
        buttons = {"Help", "Target", "Close"},
        info = {{"1. Liquid Input Slot", "GREEN"}, {"2. Liquid Drainage Slot", "RED"},
                {"3. Liquid Storage Tank", "ORANGE"}},
        tools = {"hammer1"},
        placeable = true
    }, "sprites/item/tank1901.png", "sprites/item/menu1900.png", {
        define = "tank1901_define",
        draw = "tank_draw",
        tick = "tank_tick",
        change = "tank_change",
        clock = "tank_clock"
    })
    recipe = {{
        item = MOD_NAME .. "_canister1901",
        amount = 2
    }, {
        item = "unstabledust",
        amount = 64
    }}
    res = api_define_recipe("tools", MOD_NAME .. "_tank1901", recipe, 1)
    log("tank1901 loaded")

    api_define_menu_object({
        id = "tank1902",
        name = "Glitched Barrel",
        category = "Tools",
        tooltip = "Half a stack of liquid!",
        layout = {{7, 63, "Liquid Input",
                   {"canister1", "canister2", MOD_NAME .. "_canister1900", MOD_NAME .. "_canister1901",
                    MOD_NAME .. "_canister1902"}}, {30, 63, "Liquid Output",
                                                    {"canister1", "canister2", MOD_NAME .. "_canister1900",
                                                     MOD_NAME .. "_canister1901", MOD_NAME .. "_canister1902"}}},
        buttons = {"Help", "Target", "Close"},
        info = {{"1. Liquid Input Slot", "GREEN"}, {"2. Liquid Drainage Slot", "RED"},
                {"3. Liquid Storage Tank", "ORANGE"}},
        tools = {"hammer1"},
        placeable = true
    }, "sprites/item/tank1902.png", "sprites/item/menu1900.png", {
        define = "tank1902_define",
        draw = "tank_draw",
        tick = "tank_tick",
        change = "tank_change",
        clock = "tank_clock"
    })
    recipe = {{
        item = MOD_NAME .. "_canister1902",
        amount = 5
    }, {
        item = "randomjelly",
        amount = 128
    }}
    res = api_define_recipe("tools", MOD_NAME .. "_tank1902", recipe, 1)
    log("tank1902 loaded")
    return "success"
end

-- Give the defined object a tank
function tank1900_define(menu_id)
    -- Set tank max 4000
    api_define_tank(menu_id, 0, 4000, "", 7, 14, "medium")
    fields = {"tank_amount", "tank_max", "tank_type"}
    fields = api_sp(menu_id, "_fields", fields)
    log("tank1900 menu loaded")
end

-- Give the defined object a tank
function tank1901_define(menu_id)
    -- Set tank max 8000
    api_define_tank(menu_id, 0, 8000, "", 7, 14, "medium")
    fields = {"tank_amount", "tank_max", "tank_type"}
    fields = api_sp(menu_id, "_fields", fields)
    log("tank1901 menu loaded")
end

-- Give the defined object a tank
function tank1902_define(menu_id)
    -- Set tank max 32000
    api_define_tank(menu_id, 0, 32000, "", 7, 14, "medium")
    fields = {"tank_amount", "tank_max", "tank_type"}
    fields = api_sp(menu_id, "_fields", fields)
    log("tank1902 menu loaded")
end

--[[ -- Give the defined object a tank
function tank1903_define(menu_id)
    -- Set tank max 64000
    api_define_tank(menu_id, 0, 64000, "", 7, 14, "medium")
    fields = {"tank_amount", "tank_max", "tank_type"}
    fields = api_sp(menu_id, "_fields", fields)
    log("tank1902 loaded")
end ]]

function tank_change(menu_id)
    -- define local properties for canister slot to fill tank(1) and drain from tank(2)
    local canister = api_get_slot(menu_id, 1)
    local cani = api_get_slot(menu_id, 2)
    -- Check the drain slot(2) to see if it contains a canister
    if cani["item"] == "canister1" or cani["item"] == "canister2" or cani["item"] == MOD_NAME .. "_canister1900" or
        cani["item"] == MOD_NAME .. "_canister1901" or cani["item"] == MOD_NAME .. "_canister1902" then
        -- if it contains a canister, drain liquid from tank
        api_slot_drain(menu_id, 2)
    end
    -- Check the drain slot(1) to see if it contains a canister
    if canister["item"] == "canister1" or canister["item"] == "canister2" or canister["item"] == MOD_NAME ..
        "_canister1900" or canister["item"] == MOD_NAME .. "_canister1901" or canister["item"] == MOD_NAME ..
        "_canister1902" then
        -- if it contains a canister, fill tank with liquid
        api_slot_fill(menu_id, 1)
    end
end
function tank_tick(menu_id)
    if api_gp(menu_id, "tank_amount") == 0 then
        api_sp(menu_id, "tank_type", "")
    end
end

function tank_draw(menu_id)
    -- draw our water tank
    api_draw_tank(api_gp(menu_id, "tank_gui"))
end
