class UserCrush < ApplicationRecord
  belongs_to :user
  belongs_to :crush
  validates :crush_level, presence: true#, numericality: { only_integer: true, :greater_than: 0, :less_than: 10}
  # validates :user_id, uniqueness: { scope: :crush_id, message: "has already added this crush!"}
end
