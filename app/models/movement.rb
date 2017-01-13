class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :category

  validates :reference, uniqueness: {:message => "El número de referencia ya ha sido utilizado"}
  validates :withdrawal, :numericality => {:only_integer => true}
  validates :deposit, :numericality => {:only_integer => true}
  validates :concepto_de_pago, :date, presence: true
  # has_many :movement_defineds

end
