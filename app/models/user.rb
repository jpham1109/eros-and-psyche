class User < ApplicationRecord
  belongs_to :zodiac
  has_secure_password
  has_many :user_crushes
  has_many :crushes, through: :user_crushes
  # validates :username, {presence: true, length: { in: 1..80}}
  # validates :password, {presence: true, length: { in: 1..80}}
  # validates :dob, {presence: true, numericality: true, length: { in: 8..10}}
  def crush_friended
    crushes.select{|crush| crush.friend}
  end
end
