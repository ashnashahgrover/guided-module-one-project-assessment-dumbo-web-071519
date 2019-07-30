class Hack <ActiveRecord::Base
# heading, content, user_id
has_many :responses
has_many :users, through: :responses

# returns a random hack object
def self.rand_hack()
    
    found_hack_id = self.all.select do |hack|
        hack.id == rand(Hack.all.count-1)
    end
    return found_hack_id[0].id
end

def self.display_all_hacks()
    self.all.each do |hack|
        puts "Title: " + hack.heading
        puts "Written by: " #+ self.user
        puts hack.content
    end
end

# accepts hack id and prints
def self.display_hack(hack_id_arg)
    found_hack = self.all.select   do |hack|
        hack.id == hack_id_arg
    end

    puts "Title: " + found_hack[0].heading
    puts "Written by: " #+ self.user
    puts found_hack[0].content
end








end