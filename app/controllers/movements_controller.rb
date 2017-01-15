class MovementsController < ApplicationController
 before_filter :require_login
    def index
      # @movements = Account.find(params[:account_id]).movements.order("date", "reference")

      # @movements = Account.paginate(page: params[:page])

# @pagi_move = @movements.paginate :page=>params[:page]
# @movements2= Account.find(params[:account_id]).movements.order("date", "reference")

   @movements = Account.find(params[:account_id]).movements.order("date", "reference").paginate(page: params[:page])
    end

    def new
      @movement = Movement.new
    end

    def edit
       @movement=Movement.find(params[:id])

    end

    def create
      params[:movement][:reference] ||= "Sin refencia"
      @category = Category.all
      @movement =Movement.new(movement_params)
       if @movement.save
       flash[:success] = "Creado Correctamente"
       redirect_to user_account_movements_path(current_user)
      # else
      #   render 'new'
        end
    end

    def update
      @movement = Movement.update(params[:id], movement_params)
      if @movement.save
        flash[:success] = "Movimiento a sido actualizado"
        redirect_to user_account_movements_path(current_user)
      end
    end

    def destroy
      @movement=Movement.find(params[:id])
      @movement.destroy
      flash[:success] = "Movement was successfully destroyed."
      redirect_to user_account_movements_path(session[:user_id])
    end
  end

  private
  def movement_params
    params.require(:movement).permit(:account_id, :user_id, :concepto_de_pago, :reference, :date, :detail, :category_id, :withdrawal, :deposit )
  end

  def require_login
    unless current_user
    flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
