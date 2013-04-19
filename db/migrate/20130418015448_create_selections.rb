class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :name
      t.string :description
      t.datetime :date_create

      t.timestamps
    end
  end
end
