class Response <ActiveRecord::Base
    #user_id, hack_id, likes, comment
    belongs_to :user
    belongs_to :hack

    #returns an array of hack ids for the user
    # def find_by_likes(user_id_arg)
    #     user_responses = select_response_by_user(user_id_arg)
    #     return user_responses.map do |response|
    #         response.hack_id
    #     end.uniq
    # end
    #
    # def self.display_my_likes(user_id_arg)
    #     my_likes = select_response_by_user(user_id_arg)
    #     my_likes.each do |like|
    #         Hack.display_hack(like.hack_id)
    #     end
    # end

    def self.view_comments(hack)
      responses = self.all.where("hack_id = ?", hack.id)
      if responses.empty?
        puts "There are no comments for this hack."
        puts "Press <ENTER> to continue"
        gets
      else
        responses.each do |response|
          puts response.comment
            TTY::Prompt.new.select("") do |menu|
            menu.choice "Press Enter to View next", ->{}
            menu.choice "Go to back to Menu", ->{return hack}
            end
        end
      end
    end

end
