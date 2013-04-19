class Selection < ActiveRecord::Base
  attr_accessible :date_create, :description, :name, :user_id
  belongs_to :user
end
