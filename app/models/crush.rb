class Crush < ApplicationRecord
  belongs_to :zodiac
  has_many :user_crushes
  has_many :users, through: :user_crushes
  # validates :name, {presence: true, length: { in: 1..80}}
  # validates :dob, {presence: true, numericality: true, length: { in: 8..10}}
  after_initialize :set_friend

  def set_friend
    self.friend = false if self.friend.nil?
  end
end
