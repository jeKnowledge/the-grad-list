class NewItemController < ApplicationController
  def index

  end

  def added
    if request.POST.include? 'item_content' then
      new_item = Item.new({:user => current_user, :content => params[:item_content]})
      current_user.items.push(new_item)
    end
  end
end
