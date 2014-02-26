class FeedItem
  attr_accessor :author
  attr_accessor :item
  
  def initialize(author, item)
    @author = author
    @item = item
  end
end

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @feed = Array.new

      current_user.followed_users.each do |fuser|
        fuser.items.each do |item|
          new_feed_item = FeedItem.new(fuser.email, item)
          @feed.push(new_feed_item)
        end
      end

      @feed.sort! { |a, b| a.item.created_at <=> b.item.created_at }
    end
  end
end
