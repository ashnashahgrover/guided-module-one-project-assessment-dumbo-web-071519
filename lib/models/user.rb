class User <ActiveRecord::Base
# username, password
has_many :responses
has_many :hacks, through: :responses
belongs_to :writer
#belongs_to :writer add writer_id column to user?




  def self.login

    username = nil
    while !username
      puts "Please enter username:"
      username = gets.chomp.to_s
      username = User.find_by("username = ?", username)
      if username == nil
        puts "Username not found. Please try again."
      end
    end

    password = nil
    while password != username.password
      puts "Please enter password"
      #make this mask
      password = gets.chomp
      if password == username.password
        return username
        binding.pry
      else
        puts "Wrong Password. Please try again."
      end
    end

  end

  def self.signup
    puts "Please enter a username"
    username = gets.chomp
    if User.find_by("username = ?", username)
      puts "Username already exists. Please try again."
      self.signup
    end
    puts "Please enter a password"
    password = gets.chomp
    self.create(username:username, password:password)
  end

  def write_hack
    if !self.writer_id
      writer = Writer.create(user_id: self.id)
      self.writer_id = writer.id
      self.save
    end
    puts "Write your heading below:"
    heading = gets.chomp
    puts "Write your hack below:"
    content = gets.chomp
    new_hack = Hack.create(heading: heading, content: content, writer_id: self.writer_id)
    puts "Thank you for your submission."
    CLI.choices
  end

  def view_or_edit_written
    if self.writer
      puts "Here are the Hacks you've written:"
      hacks = self.writer.hacks.pluck("Heading")
      if hacks.empty?
        puts "All your Hacks have been deleted"
        puts "Press <ENTER> to Continue"
        gets
        CLI.choices
      end
      selection = TTY::Prompt.new.select("Select one of the following", hacks)
      selection = Hack.find_by("heading = ?", selection)
      puts selection.heading
      puts selection.content
      #should ask if you want to edit your selection
      #also aesthetically we should figure out how to get rid of the DEBUG statements
      def edit_content(hack)
          puts "Type Modified Content Here:"
          new_content = gets.chomp
          hack.content = new_content
          hack.save
          hack
      end
      TTY::Prompt.new.select("") do |menu|
        menu.choice "Edit Content", ->{self.edit_content(selection)}
        menu.choice "Delete This Hack", ->{Hack.delete_hack(selection, self)}
        menu.choice "Return to Main Menu", ->{CLI.choices}
      end
    else
      puts "You haven't written any hacks yet."
      puts "Press <ENTER> to Continue"
      gets
      CLI.choices
    end
  end

  def display_likes
    likes = Response.all.where({user_id: self.id, likes: true})
    headings = likes.map {|response| response.hack.heading}.uniq
    if !headings.empty?
      selection = TTY::Prompt.new.select("Select one of the following", headings)
      selection = Hack.find_by("heading = ?", selection)
      puts selection.heading
      puts selection.content
      return selection
    else
      puts "You have not liked any hacks yet. Press <ENTER> to continue"
      gets
      CLI.choices
    end
  end

end
