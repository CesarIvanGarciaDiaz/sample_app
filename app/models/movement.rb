class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
 # belongs_to :category
end
