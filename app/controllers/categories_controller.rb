class CategoriesController < ApplicationController
before_action :require_user, only:[:new, :create]
	def show 
		@category = Category.find(params[:id])
	end

	def new
	  @category = Category.new
	end 

	def create
		 @category = Category.new(params.require(:category).permit(:name))
		 if @category.save
		 	flash[:notice]= 'Category added'
		 	redirect_to posts_path
		 else
		 	render :new
		 end
	end


end