class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :guest, foreign_key: {to_table: :users}
      t.references :reviewer, foreign_key: {to_table: :users}

      t.integer :status, index: true

      t.datetime :arrival_at, index: true
      t.datetime :departure_at, index: true

      t.timestamps
    end
  end
end
