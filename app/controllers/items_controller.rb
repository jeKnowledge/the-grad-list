class ItemsController < ApplicationController
  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    current_user.items.push(@item)
    redirect_to(root_path)
  end

  def destroy

  end

  def update

  end

  private
  def item_params
    params.require(:item).permit(:content)
  end
end
