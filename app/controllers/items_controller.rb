class ItemsController < ApplicationController
  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save then
      flash[:success] = "Ola"
    else
      flash[:errors] = @item.errors.first
    end

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
