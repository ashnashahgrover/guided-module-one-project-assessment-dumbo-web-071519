class Writer < ActiveRecord::Base
  belongs_to :user
  has_many :hacks
end
