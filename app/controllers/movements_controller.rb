class MovementsController < ApplicationController

    def index
      @movements = Account.find(params[:account_id]).movements
    end

    def new
      @movement = Movement.new
    end

    def edit
       @movement=Movement.find(params[:id])

    end

    def create
      # @movement = Movement.new(movement_params)
      # if @movement.save
      #   flash[:success] = "Creado Correctamente"
      #   redirect_to user_account_movements_path()
      # else
      #   render 'new'
      # end


      @movement =Movement.new(movement_params)
       if @movement.save
       flash[:success] = "Creado Correctamente"
       redirect_to user_account_movements_path(current_user)
      # else
      #   render 'new'
        end
    end

    def update
      # @movement=Movement.find(params[:id])
      # if @movement.update_attributes(movement_params)
      # @movement.save
      #   flash[:success] = "movement was successfully updated."
      # redirect_to user_account_movements_path
      # else
      #   render 'edit'
      # end


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
    params.require(:movement).permit(:account_id, :user_id, :concepto_de_pago, :reference, :date, :detail, :category_id)
end
