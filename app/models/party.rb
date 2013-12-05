class Party < ActiveRecord::Base
  belongs_to :owner, class_name: "User"

  attr_accessible :title, :parties

  before_create :assign_permalink

  def assign_permalink
    self.permalink = SecureRandom.hex(8)
  end
end
