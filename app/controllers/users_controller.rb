class UsersController < ApplicationController
  before_action :check_user

  def show
    @user = User.find(params[:id])
    @orders = @user.orders

  end

  private

  def check_user
    if current_user.id != params[:id].to_i
      redirect_to "/"
    end
  end
end
