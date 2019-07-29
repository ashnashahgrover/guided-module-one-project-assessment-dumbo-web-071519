class Response <ActiveRecord::Base
    #user_id, hack_id, likes, comment
    belongs_to :user
    belongs_to :hack
    

end