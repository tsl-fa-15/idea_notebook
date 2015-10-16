class Idea < ActiveRecord::Base
  validates :desc, presence: true
end
