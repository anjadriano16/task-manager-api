class CategoriesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      render json: Category.all
    end
  
    def create
      category = Category.new(category_params)
      if category.save
        render json: category, status: :created
      else
        render json: category.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end
  