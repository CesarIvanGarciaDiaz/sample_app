require 'time'

class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :category
  has_many :movement_parents

  scope :dt, -> (params) { where("date BETWEEN ? AND ?",
      params[:since] != nil ? Time.parse(params[:since]).strftime('%Y-%m-%d') : "0000-00-00",
      params[:until] != nil ? Time.parse(params[:until]).strftime('%Y-%m-%d') : "0000-00-00"
  )}

  validates :reference, uniqueness: {:message => "El número de referencia ya ha sido utilizado"}, allow_blank: true
  validates :deposit, :withdrawal, :numericality => { :greater_than_or_equal_to => 0, :message => "La cantidad ingresada debe numerica y sin signos"  }
  validates :concepto_de_pago, presence: {:message => "debe ser llenado"}
  validates :date, presence: {:message => "Debe indicarse una fecha de registro"}

  before_create do
    self.withdrawal = self.withdrawal * -1 if self.withdrawal >= 0
  end


  # has_many :movement_defineds
end
