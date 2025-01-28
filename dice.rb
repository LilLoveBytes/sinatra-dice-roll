require "sinatra"             # starts web server, listening for HTTP request
require "sinatra/reloader"    # hot reload
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do 
  " 
  <h1>Dice Roll</h1>
  <h3>
   <ul> 
      <li><a href='https://fictional-waddle-6j9g5wqr45p3grw-4567.app.github.dev/dice/2/6'> 2 6-sided</a></li>
      <li><a href='https://fictional-waddle-6j9g5wqr45p3grw-4567.app.github.dev/dice/2/10'>2 10-sided</a></li>
      <li><a href='https://fictional-waddle-6j9g5wqr45p3grw-4567.app.github.dev/dice/1/20'>20-sided</a></li>
      <li><a href='https://fictional-waddle-6j9g5wqr45p3grw-4567.app.github.dev/dice/5/4'>5 4-sided</a></li>
   </ul> 
  </h3>
  "
end

get("/dice/2/6") do
  num_1 = rand(1..6)
  num_2 = rand(1..6)
  summ = num_1 + num_2

  msg = "You rolled a #{num_1.to_i} and a #{num_2.to_i} for a total of #{summ}"

  " <h1> 2 6-sided dice </h1>
  <p> #{msg} </p> "
end 

get("/dice/2/10") do
  num_1 = rand(1..10)
  num_2 = rand(1..10)
  summ = num_1 + num_2
  
  msg = "You rolled a #{num_1.to_i} and a #{num_2.to_i} for a total of #{summ}"

  " <h1> 2 10-sided dice</h1>
  <p> #{msg} </p>"
  end

get("/dice/1/20") do
  num_1 = rand(1..20)
  msg = "You rolled a #{num_1}"
  "<h1> A 20-sided die </h1>
  <p> #{msg} </p>"
end

get("/dice/5/4") do
  num_1 = rand(1..4)
  num_2 = rand(1..4)
  num_3 = rand(1..4)
  num_4 = rand(1..4)
  num_5 = rand(1..4)
  summ = num_1 + num_2 + num_3 + num_4 + num_5
  msg = "You rolled a #{num_1}, a #{num_2}, a #{num_3}, a #{num_4}, and a #{num_5} for a total of #{summ}"
  "<h1> 5 4-sided dice</h1>
  <p> #{msg} </p>"
end
