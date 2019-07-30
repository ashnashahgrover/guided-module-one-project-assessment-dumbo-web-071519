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
      username = gets.chomp
      username = User.find_by("username = ?", username)
      if username == nil
        puts "Username not found. Please try again."
      end
    end

    password = nil
    while password != username.password
      puts "Please enter password"
      password = gets.chomp
      if password == username.password
        return username
        binding.pry
      else
        password == nil
        "Wrong Password. Please try again."
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
  end

  def view_or_edit_written
    system "clear"
    puts "Here are the Hacks you've written:"
    hacks = self.writer.hacks.pluck("Heading")
    selection = TTY::Prompt.new.select("Select one of the following", hacks)
    puts selection
    puts Hack.find_by("heading = ?", selection).content
    #should ask if you want to edit your selection
    #also aesthetically we should figure out how to get rid of the DEBUG statements
  end

  def edit?
  end

  def edit
  end

end
