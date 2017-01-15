class Category < ApplicationRecord
	has_many :movements

  validates :name, uniqueness: {:message => "El nombre ya ha sido utilizado"}
  # scope :neutro, proc { where classification: "*" }
  scope :clsif, -> (csfct) { where classification: csfct } 

  def self.resolverEstado( type )
    if type == "n" 
      "Categoria Neutra"
    elsif type == "e"
      "Categoria de Egresos"
    else
      "Categoria de Ingreso"
    end
  end

end
