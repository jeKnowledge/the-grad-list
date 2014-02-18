class UserController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  
  def show
    @user = User.find(params[:id])
  end
end
