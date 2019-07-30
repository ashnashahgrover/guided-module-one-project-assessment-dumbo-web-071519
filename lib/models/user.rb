class User <ActiveRecord::Base
# username, password
has_many :responses
has_many :hacks, through: :responses

  

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
    while !password
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

end
