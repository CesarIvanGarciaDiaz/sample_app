class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :category
  



  validates :reference, uniqueness: {:message => "El número de referencia ya ha sido utilizado"}, allow_blank: true
  validates :deposit, :withdrawal, :numericality => { :greater_than_or_equal_to => 0, :message => "La cantidad ingresada debe numerica y sin signos"  }
  validates :concepto_de_pago, presence: {:message => "debe ser llenado"}
  validates :date, presence: {:message => "Debe indicarse una fecha de registro"}

  before_create do
    self.withdrawal = self.withdrawal * -1 if self.withdrawal >= 0
    self.reference = "Sin referencia" if self.reference.blank?
  end

  # has_many :movement_defineds

end
