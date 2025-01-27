require "sinatra"   # starts web server, listening for HTTP request

get("/") do 
  'Hello World'
end
