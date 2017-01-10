class Account < ApplicationRecord
  validates :name , presence: true
  has_many :movements
  has_many :users,through: :movements
end
