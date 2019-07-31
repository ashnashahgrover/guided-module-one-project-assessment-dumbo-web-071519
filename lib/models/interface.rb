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
            menu.choice 'Write a Hack', ->{self.user.write_hack}
            menu.choice 'Exit', ->{exit!}
        end
    end

    def view_random
        system "clear"
        random = Hack.rand_hack()
        prompt.select("Generate another random hack?") do |menu|
            menu.choice "Yes?", ->{view_random()}
            menu.choice "No, Respond or Exit", ->{vote_respond(random)}
        end
    end

    def view_by
        system "clear"
        #return value of any of these methods should always be a SINGLE hack
        chosen_hack = prompt.select("Please select a filter?") do |menu|
            menu.choice "View All Hacks", ->{Hack.view_all}
            menu.choice "Hacks I Like", ->{self.user.display_likes}
            menu.choice "View My Hacks", ->{self.user.view_or_edit_written}
        end
        vote_respond(chosen_hack)
    end

    def vote_respond(chosen_hack)
        prompt.select("") do |menu|
            menu.choice "Write a comment.", ->{self.write_response(chosen_hack)}
            menu.choice "👍 Up-vote this hack.", ->{self.up_vote(chosen_hack)}
            menu.choice "View a different filter", ->{self.view_by}
            menu.choice "Main Menu", ->{self.choices}
            menu.choice "View Comments", ->{Response.view_comments(chosen_hack)}
        end
        vote_respond(chosen_hack)
    end

    def write_response(chosen_hack)
      puts "Please write comment below:"
      comment = gets.chomp.to_s
      Response.create(hack_id: chosen_hack.id, user_id: self.user.id, comment: comment)
      puts "Thank you for your comment:"
      puts "Select an option below:"
    end

    def up_vote(chosen_hack)
      Response.create(hack_id: chosen_hack.id, user_id: self.user.id, likes: 1)
    end

end
