class UserCrush < ApplicationRecord
  belongs_to :user
  belongs_to :crush
  validates :crush_level, {presence: true, numericality: true, length: { in: 1..10}}
end
