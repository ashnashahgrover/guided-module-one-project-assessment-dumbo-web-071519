require_relative '../config/environment'
require "pry"
require "tty-prompt"
#create response
#reading hack
#like/dislike
#create account
#delete comment
#delete hack
#view comments by user, liked, & add like
#random hack gen
# *optional* search engine



exit = false
while(!exit)

cli = Interface.new
active_user = cli.welcome
cli.user = active_user
cli.choices 



binding.pry
end

puts "hello world"
