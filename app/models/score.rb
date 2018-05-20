class Score < ApplicationRecord

  MAX_PONTUATION = 3126
  validates :date, :username, :uid, :points, presence:true

end
