require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies
    # debugger
    if cookie['_rails_lite_app']
      @parsed_cookie = JSON.parse(cookie['_rails_lite_app'])
    else
      @parsed_cookie = {}
    end
  end

  def [](key)
    @parsed_cookie[key]
  end

  def []=(key, val)
    @parsed_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', @parsed_cookie.to_json)
  end
end
