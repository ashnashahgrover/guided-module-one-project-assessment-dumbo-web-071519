class Response <ActiveRecord::Base
    #user_id, hack_id, likes, comment
    belongs_to :user
    belongs_to :hack


    def self.select_response_by_user(user_id_arg)
        self.all.select do |response|
            response.user_id == user_id_arg
        end
    end

    #returns an array of hack ids for the user
    def find_by_likes(user_id_arg)
        user_responses = select_response_by_user(user_id_arg)
        
        return user_responses.map do |response|
            response.hack_id
        end.uniq
    end

    
    def self.display_my_likes(user_id_arg)
        my_likes = select_response_by_user(user_id_arg)
        my_likes.each do |like|
            Hack.display_hack(like.hack_id)
        end
    end
    

end