class Party < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  attr_accessible :title, :parties

  before_create :assign_permalink

  validates_presence_of :owner, :title

  def assign_permalink
    self.permalink = SecureRandom.hex(8)
  end
end
