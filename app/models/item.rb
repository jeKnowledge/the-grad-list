class Item < ActiveRecord::Base
  belongs_to :user

  attr_accessor :content
end
