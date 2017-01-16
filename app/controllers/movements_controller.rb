class MovementsController < ApplicationController
 before_filter :require_login
    def index
  #  @movements = Account.find(params[:account_id]).movements.order("date", "reference").paginate(page: params[:page])

      @movements = Account.find(params[:account_id]).movements.order("date", "reference")

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
       create_clon(@movement.id)
      # else
      #   render 'new'
        end
    end

    def create_clon(id)
      @clon = Movement.find(id)
      @c1_n = @clon.concepto_de_pago << " total"
      @c2_n = @clon.concepto_de_pago << " iva"
      @conv = @clon.deposit - @clon.withdrawal
      @c1 = ((@conv / 1.16)*100).round/100.0  #sin iva
      @c2 = ((@conv - @c1)*100).round/100.0   #valor d iva
      @val_1 = 0
      @val_2 = 0

      if @clon.withdrawal != 0 
        @val_1 = @c1
      elsif @clon.deposit != 0
        @val_2 = @c1
      end

      if @clon.withdrawal != 0
        @iva_1 = @c2
      elsif @clon.deposit != 0
        @iva_2 = @c2
      end
      

@total = Movement.new(user_id:           current_user, 
                      account_id:        @clon.account_id,
                      concepto_de_pago:  @c1_n,
                      reference:         "hijo_SubTotal#{id}",
                      date:              @clon.date,
                      detail:            @clon.detail,
                      category_id:       @clon.category_id,
                      withdrawal:        @val_1,
                      deposit:           @val_2)
@total.save
      
@iva = Movement.new(user_id:           current_user, 
                    account_id:        @clon.account_id,
                    concepto_de_pago:  @c2_n,
                    reference:         "hijo_IVA#{id}",
                    date:              @clon.date,
                    detail:            @clon.detail,
                    category_id:       @clon.category_id,
                    withdrawal:        @iva_1,
                    deposit:           @iva_2)
@iva.save

      puts "*"*1000
      puts @c1
      puts @c2
      puts @c3 = @c1 + @c2
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
