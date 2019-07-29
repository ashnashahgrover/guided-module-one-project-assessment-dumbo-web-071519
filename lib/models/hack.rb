class Hack <ActiveRecord::Base
# heading, content, user_id
has_many :responses
has_many :users, through: :responses





# returns a random hack object
def self.rand_hack()
    return self.all.find do |hack|
        hack.id = rand(self.all.count)
    end
end








end