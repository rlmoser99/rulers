require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      # Hack solution to prevent console error when browser automatically fetchs the favicon
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end
      
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
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
      @env
    end
  end
end
