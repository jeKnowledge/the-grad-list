class UserController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]

  def show
    @user = User.find(params[:id])
    @done_items = Array.new
    @todo_items = Array.new

    current_user.items.each do |item|
      if item.done == 0
        @todo_items.push(item)
      else
        @done_items.push(item)
      end
    end
  end
end
