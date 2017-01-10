class Account < ApplicationRecord
  has_many :movements
  has_many :users, through: :movements

  validates :name , presence: true
end
