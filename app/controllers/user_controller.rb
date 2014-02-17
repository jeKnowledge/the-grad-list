class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
    redirect_to(:back)
  end
end
