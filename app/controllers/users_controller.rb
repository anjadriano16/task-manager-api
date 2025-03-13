class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]

    def create
      user = User.new(user_params)
      if user.save
        render json: { message: "User created successfully" }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def show
      render json: { email: current_user.email, id: current_user.id }
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
  