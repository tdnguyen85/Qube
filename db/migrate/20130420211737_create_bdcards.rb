class CreateBdcards < ActiveRecord::Migration
  def change
    create_table :bdcards do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.datetime :date_created

      t.timestamps
    end
  end
end
