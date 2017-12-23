require 'rack'
require 'byebug'
require 'puma'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  # debugger
  res.write(req.path)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)