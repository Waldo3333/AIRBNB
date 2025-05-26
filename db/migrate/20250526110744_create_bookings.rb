class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :entry_date
      t.date :out_date
      t.boolean :confirmed, default: false
      t.string :guest

      t.timestamps
    end
  end
end
