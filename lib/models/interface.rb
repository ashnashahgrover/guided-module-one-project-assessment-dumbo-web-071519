class Interface
    attr_accessor :prompt, :user

    def initialize()
        @prompt = TTY::Prompt.new
    end
    
    ##### welcome & login #####
    def welcome
        # for testing purposes
        return User.first

    end


    ###### main menu ######
    def main_menu
        system "clear"
        user.reload

    end

    ##### view random hack #####
    def view_random
        system "clear"
        # user.reload
        random_hack = Hack.rand_hack()
        # add display method in hack
        puts random_hack.heading + "\n" + random_hack.content
    end





    ##### view hacks by filter All, Liked, Own ######
    def view_hacks
        system "clear"
        user.reload

        view_response = prompt.select("Select a hack that you would like to see?") do |prompt|
            prompt.choice "Random", "Rand"
            prompt.choice "My Hacks", "My"
            prompt.choice "Liked Hacks", "Liked"
        end
    
        case view_response
        when "Rand"
            random_hack = Hack.rand_hack()
            puts random_hack.heading + "\n" + random_hack.content
            
        when "My"
            #show my hacks
        when "Liked"
            #show hacks that I liked
        end

    end
    







    ##### create response #####


    ###### create and delete hacks ######




    # *optional* search engine

    






end