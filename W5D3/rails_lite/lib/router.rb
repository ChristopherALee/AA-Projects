require 'byebug'

class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern = pattern
    @http_method = http_method
    @controller_class = controller_class
    @action_name = action_name
  end

  # checks if pattern matches path and method matches request method
  def matches?(req)
    # debugger
    pattern.match(req.path) && http_method.to_s.upcase == req.request_method
  end

  # use pattern to pull out route params (save for later?)
  # instantiate controller and call controller action
  def run(req, res)
    match_data = @pattern.match(req.path)
    route_params = (match_data.names.zip(match_data.captures)).to_h
    
    controller = controller_class.new(req, res, route_params)
    controller.invoke_action(action_name)
  end
end

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  # simply adds a new route to the list of routes
  def add_route(pattern, method, controller_class, action_name)
    @routes << [pattern, method, controller_class, action_name]
  end

  # evaluate the proc in the context of the instance
  # for syntactic sugar :)
  def draw(&proc)
    self.instance_eval(&proc)
  end

  # make each of these methods that
  # when called add route
  [:get, :post, :put, :delete].each do |http_method|
  end

  # should return the route that matches this request
  def match(req)
    route = @routes.find(req.request_method)
    route_path = route.first.first
    # debugger
    return route if route_path.match(req.path)
    nil
  end

  # either throw 404 or call run on a matched route
  def run(req, res)
    if match(req)
      match(req).run
    else
      res.status = 404
    end
  end
  
  def get(pattern, controller_class, action_name)
    add_route(pattern, "GET", controller_class, action_name)
  end
  
  def post(pattern, controller_class, action_name)
    add_route(pattern, "POST", controller_class, action_name)
  end
  
  def put(pattern, controller_class, action_name)
    add_route(pattern, "PUT", controller_class, action_name)
  end
  
  def delete(pattern, controller_class, action_name)
    add_route(pattern, "DELETE", controller_class, action_name)
  end
end
