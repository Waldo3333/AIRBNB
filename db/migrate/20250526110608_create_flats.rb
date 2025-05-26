class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :title
      t.float :price
      t.integer :guest
      t.integer :bedroom
      t.text :description
      t.string :address
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
