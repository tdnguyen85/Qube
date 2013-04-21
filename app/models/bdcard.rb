class Bdcard < ActiveRecord::Base
  attr_accessible :date_created, :description, :title, :user_id
  belongs_to :user
end
