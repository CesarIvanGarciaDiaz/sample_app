class CategoriesController < ApplicationController
  before_filter :require_login

   def index

     @categories = Category.where(nil)
     @categories = @categories.clsif(params[:csfct]) if params[:csfct].present?

   end

   def new
     @category = Category.new
   end

   def edit
      @category=Category.find(params[:id])

   end

   def create
     @category = Category.new(category_params)
      if @category.save
      flash[:success] = "Creado Correctamente"
      redirect_to user_categories_path(session[:user_id])
     # else
     #   render 'new'
       end
   end

   def update

 @category = Category.update(params[:id], category_params)
 if @category.save
   flash[:success] = "La categoria a sido creada Correctamente."
   redirect_to user_categories_path(session[:user_id])
 end
   end

   def destroy
     @category=Category.find(params[:id])
     @category.destroy
     flash[:success] = "La categoria a sido eliminada Correctamente ."
     redirect_to user_categories_path(session[:user_id])
   end

 private
 def category_params
   params.require(:category).permit(:name, :classification)
 end

 def require_login
   unless current_user
   flash[:danger] = "Please log in."
     redirect_to login_url
   end
 end

 end
