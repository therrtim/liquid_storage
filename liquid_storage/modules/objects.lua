function define_tank()
  
  api_define_menu_object({
    id = "tank1900",
    name = "Honeycore Tank",
    category = "Tools",
    tooltip = "Lets you store more liquid!",
    shop_key = false,
    layout = {
      {6, 62, "Liquid Input",{"canister1", "canister2", MOD_NAME .. "_canister1900", MOD_NAME .. "_canister1901", MOD_NAME .. "_canister1902"}},
      {29, 62, "Liquid Output",{"canister1", "canister2", MOD_NAME .. "_canister1900", MOD_NAME .. "_canister1901", MOD_NAME .. "_canister1902"}}
    },
    buttons = {"Help", "Target", "Close"},
    info = {
      {"1. Liquid Input Slot", "GREEN"},
      {"2. Liquid Drainage Slot", "RED"},
      {"3. Liquid Storage Tank", "ORANGE"},
    },
    tools = {"hammer1"},
    placeable = true
  }, "sprites/item/tank1900.png", "sprites/item/menu1900.png", {
    define = "tank1900_define",
    draw = "tank1900_draw",
    drain = "tank_drain",
    fill = "tank_fill"
  })
  recipe = {
    { item = "log", amount = 1}
    --{ item = "canister2", amount = 2 },
   -- { item = "honeycore2", amount = 16}
  }
  res = api_define_recipe("tools", MOD_NAME .. "_tank1900", recipe, 1)
  log("tank1900 loaded")

  return "Success"
end

function tank1900_define(menu_id)
  api_define_tank(menu_id, 0, 4000, "", 8, 15, "xlarge") 
  fields = {"tank_amount", "tank_max", "tank_type"}
  fields = api_sp(menu_id, "_fields", fields)
  log("tank menu loaded")
end

function tank_drain(menu_id)
  -- check if we have a canister, if so try and drain to the canister
  slot = api_get_slot(menu_id, 2)
  if slot["item"] == "canister1" or slot["item"] == "canister2" or slot["item"] == MOD_NAME .. "_canister1900" or slot["item"] == MOD_NAME .. "_canister1901" or slot["item"] == MOD_NAME .. "_canister1902" then
    api_slot_drain(menu_id, 2)
    log("tank draining")
  end
end

function tank_fill(menu_id)
  slot = api_get_slot(menu_id, 1)
  if slot["item"] == "canister1" or slot["item"] == "canister2" or slot["item"] == MOD_NAME .. "_canister1900" or slot["item"] == MOD_NAME .. "_canister1901" or slot["item"] == MOD_NAME .. "_canister1902" then
    api_slot_fill(menu_id,1)
    log("tank Filling")
  end
end

function tank1900_draw(menu_id)
  -- draw our water tank
  api_draw_tank(api_gp(menu_id, "tank_gui"))
end