class HistoryMovementsController < ApplicationController
  def current_record
  	@movements = Movement.where('date BETWEEN ? AND ?', "#{Time.now.year}-01-01", "#{Time.now.year}-12-31").all
  end

  def previous_record
  	@movements = Movement.where('date BETWEEN ? AND ?', "#{params[:year]}-01-01", "#{params[:year]}-12-31").all
  end
  
  def show 

  	@movements = Movement.where('date BETWEEN ? AND ?', "#{params[:year]}-01-01", "#{params[:year]}-12-31").all
  end


  def download
  end
end
