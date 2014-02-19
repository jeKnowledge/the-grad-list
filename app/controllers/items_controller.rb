class ItemsController < ApplicationController
  def index
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
  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.done = 0
    current_user.items.push(@item)
    redirect_to(items_path)
  end

  def destroy
    current_user.items.find(params[:id]).destroy
    redirect_to :back
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

    redirect_to :back
  end

  private
  def item_params
    params.require(:item).permit(:content)
  end
end

