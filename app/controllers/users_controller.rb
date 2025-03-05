class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
  
    def show
      render json: { email: current_user.email, id: current_user.id }
    end
  end
  