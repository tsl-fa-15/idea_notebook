class Comment < ActiveRecord::Base
  validates :contents, :idea_id, presence: true
end
