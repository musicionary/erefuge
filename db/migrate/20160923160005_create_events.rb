class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :description
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
