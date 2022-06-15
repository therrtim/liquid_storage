function define_item()

  api_define_item({
    id = "canister1900",
    name = "Honeycore Canister",
    category = "Liquid",
    tooltip = "Store more liquid!",
    singular = true,
  }, "sprites/item/1900canister.png")
  recipe = {
    { item = "log", amount = 1}
    --{ item = "canister2", amount = 2 },
    --{ item = "honeycore2", amount = 16}
  }
  res = api_define_recipe("tools", MOD_NAME .. "_canister1900", recipe, 1)
  log("1900 loaded")

api_define_item({
    id = "canister1901",
    name = "1901 Canister",
    category = "Liquid",
    tooltip = "Store even more liquid!",
    singular = true,
  }, "sprites/item/1901canister.png")
  recipe = {
    { item = "log", amount = 1}
    --{ item = "canister2", amount = 2 },
   -- { item = "honeycore2", amount = 16}
  }
  res = api_define_recipe("tools", MOD_NAME .. "_canister1901", recipe, 1)
  log("1901 loaded")
  
api_define_item({
    id = "canister1902",
    name = "1902 Canister",
    category = "Liquid",
    tooltip = "That's a lot of liquid...",
    singular = true,
  }, "sprites/item/1902canister.png")
  recipe = {
    { item = "log", amount = 1}
    --{ item = "canister2", amount = 2 },
   -- { item = "honeycore2", amount = 16}
  }
  res = api_define_recipe("tools", MOD_NAME .. "_canister1902", recipe, 1)
  log("1902 loaded")
end