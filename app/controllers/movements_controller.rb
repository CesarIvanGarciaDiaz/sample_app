class MovementsController < ApplicationController
 before_filter :require_login

# before_create
    def index
  #  @movements = Account.find(params[:account_id]).movements.order("date", "reference").paginate(page: params[:page])
      @movements = Account.find(params[:account_id]).movements.order("reference", "date", "id")
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
        end
    end


    def add_movement_child
      iva = params[:iva].to_f
      subt = params[:subtotal].to_f
      iva*= -1.0 if iva < 0
      subt*= -1.0 if iva < 0

      @movement=Movement.find(params[:id])
      if MovementParent.where('movement_parent == ? and parent == ?', params[:id], true).blank?
        MovementParent.create(movement_id: @movement.id, movement_parent:@movement.id, movement_child: "", parent:true, iva:true)
      else
        @mov = MovementParent.find_by(movement_id: @movement.id)
        @mov.iva = true
        @mov.save
      end
      @iva_movement = @movement.dup
      @iva_movement.concepto_de_pago = "IVA de #{@movement.concepto_de_pago}"
      @iva_movement.withdrawal  = iva
      @iva_movement.deposit     = 0
      @iva_movement.reference   = ""
      @iva_movement.save

      @subtotal_mov = @movement.dup
      @subtotal_mov.concepto_de_pago = "SubTotal de #{@movement.concepto_de_pago}"
      @subtotal_mov.withdrawal  = 0
      @subtotal_mov.deposit     = subt
      @subtotal_mov.reference   = ""
      @subtotal_mov.save

      @movement.movement_parents.create(
        movement_parent: @movement.id,
        movement_child: @iva_movement.id,
        iva:true
        )
      @movement.movement_parents.create(
        movement_parent: @movement.id,
        movement_child: @subtotal_mov.id,
        iva:true
        )
      redirect_to :back
    end

    def add_register_child
      @original = Movement.find(params[:id])
      if MovementParent.where('movement_parent == ? and parent == ?', params[:id], true).blank?
        MovementParent.create(movement_id: @original.id, movement_parent:@original.id, movement_child: "", parent:true, iva:false)
      end
      # @total = @original.deposit - @original.withdrawal
      # @total = @total - params[:deposit].to_f
      # @original.deposit = @total
      # @original.save

      p "*"*1000
      mov_dual = Movement.new
        mov_dual.account_id    =   @original.account_id
        mov_dual.user_id       =   current_user.id
        mov_dual.concepto_de_pago =params[:concepto_de_pago]
        mov_dual.reference     =   params[:reference]
        mov_dual.date          =   params[:date]
        mov_dual.detail        =   params[:detail]
        mov_dual.category_id   =   params[:category_id].to_i
        mov_dual.withdrawal    =   params[:withdrawal].to_f
        mov_dual.deposit       =   params[:deposit].to_f

      mov_dual.save
      p "-^-"*1000
      MovementParent.create(
        movement_id:     params[:id],
        movement_parent: params[:id],
        movement_child:  mov_dual.id
        )
      p "-</>-"*1000

       flash[:success] = "Creado Correctamente"
             #  create_clon(@movement.id)

              redirect_to :back
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


@test_iva = MovementParent.find_by('movement_child == ? and iva == ?',params[:id],true)

unless @test_iva.blank?                         # si el movimiento es procedente del iva
@padre = MovementParent.where(movement_parent: @test_iva.movement_parent)
  @padre.each do |t|
  unless t.movement_child.blank?
    @existe = Movement.find(t.movement_child).destroy
  end
    # @existe.destroy unless @existe.nil?         #destruir registros en movimientos
  end
  @padre.destroy_all
else
    # @movement.destroy
    @power = MovementParent.where(movement_parent: params[:id])
      @power.each do |t|
        unless t.movement_child.blank?
          Movement.find(t.movement_child).destroy
        end
      end
    @power.destroy_all                            #destruir registros en MovementParent
end

@movement.destroy



      #
      # if !(MovementParent.find_by(movement_child: params[:id]).nil?)
      #     MovementParent.find_by(movement_child: params[:id]).destroy
      # elsif !(MovementParent.find_by(movement_id: params[:id]).nil?)
      #   @delete_parent = MovementParent.where(movement_id: params[:id])
      #   @delete_parent.each do |t|
      #     Movement.find(t.movement_child).destroy
      #   end
      #   @delete_parent.destroy_all
      # end
      #
      #



#      unless MovementParent.find_by(movement_child: params[:id]).nil?  # si el registro existe
        # borra el registro del hijo
 #       MovementParent.find_by('movement_child == ? and iva == ?', params[:id], true).destroy
        # elimina la asosciacion del hijo
  #    end

   #   unless MovementParent.find_by(movement_id: params[:id]).nil? # si el registro existe
      # borra los hijos
      # end
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
