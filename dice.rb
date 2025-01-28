require "sinatra"             # starts web server, listening for HTTP request
require "sinatra/reloader"    # hot reload
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do 
  # erb argument must be symbol of views file name
  erb(:home)
end

get("/dice/2/6") do
  @rolls = []
  2.times do 
    num = rand(1..6)
    @rolls.push(num)
  end 

  erb(:two_six)
end 

get("/dice/2/10") do
  @rolls = []
  2.times do
    num = rand(1..10)
    @rolls.push(num)
  end 
  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = [] 
  num = rand(1..20)
  @rolls.push(num)

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []
  5.times do
    num = rand(1..4)
    @rolls.push(num)
  end

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    num = rand(1..6)
    @rolls.push(num)
  end 

  erb(:one_hundred_six)
end 
