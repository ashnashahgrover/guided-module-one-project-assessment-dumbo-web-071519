class Hack <ActiveRecord::Base
# heading, content, user_id
has_many :responses
has_many :users, through: :responses
end