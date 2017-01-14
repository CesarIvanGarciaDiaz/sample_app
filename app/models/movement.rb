class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :category
  



  validates :reference, uniqueness: {:message => "El número de referencia ya ha sido utilizado"}, allow_blank: true
  validates :withdrawal, :numericality => {:only_integer => true, :less_than_or_equal_to => 0, :message => "La cantidad ingresada debe ser menor o igual a cero"    }
  validates :deposit, :numericality =>    {:only_integer => true, :greater_than_or_equal_to => 0, :message => "La cantidad ingresada debe ser mayo o igual a cero"  }
  validates :concepto_de_pago, presence: {:message => "debe ser llenado"}
  validates :date, presence: {:message => "Debe indicarse una fecha de registro"}

  before_create do
    if self.reference.blank?
      self.reference = "Sin referencia"
    end
  end


  # has_many :movement_defineds

end
