MOD_NAME = "liquid_storage"

MY_BOOK_MENU = nil
MY_BOOK_OBJ = nil

function register()
  return {
    name = MOD_NAME,
    hooks = {"click"}, 
    modules = {"define","scripts","objects"},
  }
end

function init() 
  -- turn on devmode
  --api_set_devmode(false)
  define_item()
  define_tank()
  
  return "Success"
end