class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



  def self.month(date)
    date = date.strftime('%B')
    month_names = { "January" => "Enero", 
                   "February" => "Febrero", 
                   "March" => "Marzo", 
                   "April" => "Abril", 
                   "May" => "Mayo",
                   "June" => "Junio", 
                   "July" => "Julio", 
                   "August" => "Agosto", 
                   "September" => "Septiembre", 
                   "October"  => "Octubre", 
                   "November" => "Noviembre", 
                   "December" => "Diciembre"}
    month_names[date]
  end
end
