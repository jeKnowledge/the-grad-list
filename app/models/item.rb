class Item < ActiveRecord::Base
  belongs_to :user

  def show_date
    created_at.to_s.split[0]
  end
end
