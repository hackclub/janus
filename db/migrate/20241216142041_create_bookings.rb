class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :occurrence, foreign_key: true
      t.references :guest, foreign_key: {to_table: :users}

      t.string :status, index: true, null: false, default: "pending"

      t.timestamps
    end
  end
end
