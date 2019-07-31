class Hack <ActiveRecord::Base
  # heading, content, writer_id
  has_many :responses
  has_many :users, through: :responses
  belongs_to :writer

  # returns a random hack object
  def self.rand_hack()
    id = self.pluck("id").sample
    rand = self.find(id)
    self.display_hack(rand)
    return rand
  end

  # accepts hack id and prints
  def self.display_hack(hack)
      puts "Title: #{hack.heading}"
      puts "Written by: #{hack.writer}"
      puts hack.content
  end

  def self.view_all
    hacks = Hack.all.pluck("heading")
    selection = TTY::Prompt.new.select("Select one of the following", hacks)
    selection = Hack.find_by("heading = ?", selection)
    self.display_hack(selection)
    selection
  end

end
