class Folio < ActiveRecord::Base
  belongs_to :user
  has_many :trails

  validates :user_id, presence: true
  validates :title,   presence: true, length: { in: 3..50 }
end
