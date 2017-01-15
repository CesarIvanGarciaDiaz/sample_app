class HistoryMovementsController < ApplicationController
include SessionsHelper

 before_filter :require_login


  def current_record
    @movements = Movement.where('date BETWEEN ? AND ?', "#{Time.now.year}-01-01", "#{Time.now.year}-12-31").all
      respond_to do |format|
        format.html
        format.json
        format.pdf {render template: 'history_movements/report', pdf: "Reporte #{Time.now.year}", layout: 'pdf.html' } # nombre del archivo a partir del que se genera el pdf
      end
  end

  def previous_record
     # if params[:year1]
     #  @movements = Movement.where('date BETWEEN ? AND ?', "#{params[:year1].strftime('%Y')}-01-01", "#{params[:year2].strftime('%Y')}-12-31").all
     # else
     #  @movements = Movement.first
     # end
     @history = Movement.where(nil)
     @history = @history.dt(params[:dt]) if params[:dt].present?
  end
  
  def show 
    @movements = Movement.where('date BETWEEN ? AND ?', "#{params[:year]}-01-01", "#{params[:year]}-12-31").all
  end

  def download
    @movements = Movement.where('date BETWEEN ? AND ?', "#{Time.now.year}-01-01", "#{Time.now.year}-12-31").all
    pdf = WickedPdf.new.pdf_from_string(render_to_string(template: 'history_movements/report.pdf.erb', layout: 'pdf.html'))
    send_data(pdf, 
      :filename => "Reporte #{Time.now.year}.pdf", 
      :disposition => 'attachment')
  end

private

def require_login
  unless current_user
  flash[:danger] = "Please log in."
    redirect_to login_url
  end
end
end
