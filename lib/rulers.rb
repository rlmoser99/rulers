require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"


module Rulers
  class Application
    def call(env)
      require 'pry'
      binding.pry
      # Hack solution to prevent console error when browser automatically fetchs the favicon
      if env['PATH_INFO'] == '/favicon.ico'
        require 'pry'
        binding.pry
        return [404, {'Content-Type' => 'text/html'}, []]
      end
      
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
        require 'pry'
        binding.pry
        [200, {'Content-Type' => 'text/html'}, [text]]
      rescue
        raise 'Rulers detected an error'
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      require 'pry'
      binding.pry
      @env
    end
  end
end
