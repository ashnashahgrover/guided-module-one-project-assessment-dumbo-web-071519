class Response <ActiveRecord::Base
    #user_id, hack_id, likes, comment
    belongs_to :user
    belongs_to :hack

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

    def self.write_response(chosen_hack)
      puts "Please write comment below:"
      comment = gets.chomp
      Response.create(hack_id: chosen_hack.id, user_id: self.user.id, comment: comment)
      puts "Thank you for your comment:"
      puts "Select an option below:"
    end

    def self.up_vote(chosen_hack)
      Response.create(hack_id: chosen_hack.id, user_id: self.user.id, likes: 1)
    end

end
