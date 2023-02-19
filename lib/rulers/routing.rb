module Rulers
  class Application
    def get_controller_and_action(env)
      # We split the URL on “/”. The “4” just means “split no more than 4 times”
      # So the split assigns an empty string to “_” from before the first slash, 
      # then the controller, then the action, and then everything else un-split in one lump
      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      cont = cont.capitalize
      cont += "Controller"

      # const_get” is a piece of Ruby magic. it looks up any name starting with a capital letter.
      # in this case, it will be the new controller class.
      [Object.const_get(cont), action]
    end
  end
end
