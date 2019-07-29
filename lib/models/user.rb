class User <ActiveRecord::Base
# username, password
has_many :responses
has_many :hacks, through: :responses

end