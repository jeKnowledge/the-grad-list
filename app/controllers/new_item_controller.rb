class NewItemController < ApplicationController
  def index

  end

  def added
    if request.POST.include? 'item_content' then
      new_item = Item.new({:user => current_user})
      new_item.content = params[:item_content]
      new_item.content = 'Hello'
      current_user.email = params[:item_content]
      current_user.items.push(new_item)
    end
  end
end