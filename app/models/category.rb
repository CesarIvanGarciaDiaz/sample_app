class Category < ApplicationRecord
	has_many :movements

  scope :neutro, proc { where classification: "*" }
  scope :egreso, proc { where classification: "-" }
  scope :ingreso, proc { where classification: "+" }

  def self.resolverEstado( type )
    if type == "*" 
      "Categoria Neutra"
    elsif type == "-"
      "Categoria de Egresos"
    else
      "Categoria de Ingreso"
    end
  end

end
