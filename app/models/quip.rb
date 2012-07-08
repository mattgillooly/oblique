class Quip < ActiveRecord::Base
  attr_accessible :text

  validates_presence_of :user, :text

  belongs_to :user
end
