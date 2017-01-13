class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :category

  # has_many :movement_defineds

  validates :withdrawal, :deposit, :numericality => {:only_integer => true}
end
