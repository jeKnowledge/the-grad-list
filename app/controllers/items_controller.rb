class ItemsController < ApplicationController
  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.done = 0;
    current_user.items.push(@item)
    redirect_to(root_path)
  end

  def destroy
    current_user.items.find(params[:id]).destroy
    redirect_to(root_path)
  end

  def show
    redirect_to(root_path)
  end

  def done
    i = current_user.items.find(params[:id])

    if i.done == 0
      i.update_attribute(:done, 1)
    else
      i.update_attribute(:done, 0)
    end

    redirect_to(root_path)
  end

  private
  def item_params
    params.require(:item).permit(:content)
  end
end
