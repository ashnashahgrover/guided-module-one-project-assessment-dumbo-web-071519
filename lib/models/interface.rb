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
    puts "Welcome #{self.user}!"
    prompt.select("Please select a choice:") do |menu|
      menu.choice 'Generate Random Hack', 1
      menu.choice 'Write a Hack', 2
      menu.choice 'View Other', 3
      menu.choice 'Exit', ->{exit!}
    end
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

