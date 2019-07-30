class Interface

    attr_accessor :prompt, :user

    def initialize()
        @prompt = TTY::Prompt.new
    end
  
    def welcome
    system "clear"
    puts "Welcome to Ruby Hacks. Select one of the options below:"
        prompt.select("") do |menu|
            menu.choice 'Returning User', ->{User.login}
            menu.choice 'New User', ->{User.signup}
            menu.choice 'Exit', ->{exit!}
        end
    end

    def choices
        system "clear"
        user.reload
        puts "Welcome #{self.user}!"
        prompt.select("Please select a choice:") do |menu|
            menu.choice 'Generate Random Hack', ->{view_random()}
            menu.choice 'View Hack By Filter', ->{view_by()}
            menu.choice 'Write a Hack', 3
            menu.choice 'View Other', 4
            menu.choice 'Exit', ->{exit!}
        end
    end


    ##### view random hack #####
    def view_random
        system "clear"
        random_hack = Hack.rand_hack()
        Hack.display_hack(random_hack)
        vote_respond()
        
        
        prompt.select("Would you like another random hack?") do |menu|
            menu.choice "Yes?", ->{view_random()}
            menu.choice "No!!!!", ->{choices}
        end
    end


    ##### view hacks by filter All, Liked, Own ######
    def view_by
        system "clear"

        # will return nil for all, or array of hack ids
        prompt.select("Please select a filter?") do |menu|
            menu.choice "View All Hacks", ->{Hack.display_all_hacks()}
            menu.choice "Hacks I Like", ->{Response.display_my_likes(self.user.id)} 
            menu.choice "View My Hacks", ->{} #{User.find_by_user}
        end

        vote_respond()

        prompt.select("Would you like to view a different filter?") do |menu|
            menu.choice "Yes?", ->{view_by()}
            menu.choice "No!!!!", ->{choices}
        end

    end


    ##### create response #####



    ###### create and delete hacks ######



    ##### vote & respond prompt
    def vote_respond()
        prompt.select("") do |menu|
            menu.choice "Write a response.", ->{Response.write_response(self, hack_id)}
            menu.choice "👍 Up-vote this hack.", ->{}
            menu.choice "continue", ->{}
        end
    end

    # *optional* search engine

    def i_am_done
        return true
        #return prompt.select("Would you like to exit?",{Yes: true}{No: false})
    end
    
end

