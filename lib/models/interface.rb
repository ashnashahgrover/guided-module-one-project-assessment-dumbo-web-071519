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

end
