class MovementsController < ApplicationController
 before_filter :require_login

# before_create
    def index
  #  @movements = Account.find(params[:account_id]).movements.order("date", "reference").paginate(page: params[:page])

      @movements = Account.find(params[:account_id]).movements.order("reference", "date", "updated_at")

    end

    def new
      @movement = Movement.new
    end

    def edit
    @movement=Movement.find(params[:id])
    end

    def create
      @category = Category.all
      @movement =Movement.new(movement_params)

       if @movement.save

       flash[:success] = "Creado Correctamente"
       redirect_to user_account_movements_path(current_user)
      #  create_clon(@movement.id)
      # else
      #   render 'new'
        end
    end


def add_movement_child
p @movement=Movement.find(params[:id])
@child_movement = @movement.dup
@child_movement.concepto_de_pago = "IVA DE #{@movement.concepto_de_pago}"
# params[:iva].to_i *= -1.0
        p params[:iva]
        p params[:iva].to_f
        iva = params[:iva].to_f
        iva*= -1.0 if iva < 0
        p iva
        p "-^-"*1000
@child_movement.withdrawal = iva
@child_movement.deposit = 0
@child_movement.reference=""
p @child_movement.save
puts "****"*100
p @child_movement
@movement.movement_parents.create(
  movement_parent: @movement.id,
  movement_child: @child_movement.id,
  iva:true
)


       flash[:success] = "Creado IVA Correctamente"
        redirect_to :back
      #  create_clon(@movement.id)
      # else
      #   render 'new'


end











    def create_clone

      @movement=Movement.find(params[:id])
      @mov_mov = @movement.dup
      @mov_mov.concepto_de_pago = "IVA DE #{@movement.concepto_de_pago}"


    end
    def update
      @movement = Movement.update(params[:id], movement_params)
      # @movement.reference = "Sin referencia" if @movement == ""
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
