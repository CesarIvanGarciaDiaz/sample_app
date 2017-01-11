class HistoryMovementsController < ApplicationController
include SessionsHelper

 before_filter :require_login


  def current_record
    @movements = Movement.where('date BETWEEN ? AND ?', "#{Time.now.year}-01-01", "#{Time.now.year}-12-31").all
  end

  def previous_record
     if params[:year1]
      @movements = Movement.where('date BETWEEN ? AND ?', "#{params[:year1].strftime('%Y')}-01-01", "#{params[:year2].strftime('%Y')}-12-31").all
     else
      @movements = Movement.first
     end
  end
  
  def show 
    @movements = Movement.where('date BETWEEN ? AND ?', "#{params[:year]}-01-01", "#{params[:year]}-12-31").all
  end

  def guardar
    puts params[:year1]
    puts "*"*1000
  end

  def download
  end
private

def require_login
  unless current_user
  flash[:danger] = "Please log in."
    redirect_to login_url
  end
end
end
