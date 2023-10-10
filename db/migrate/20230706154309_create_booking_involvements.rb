class CreateBookingInvolvements < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_involvements do |t|
      t.references :booking, null: false, foreign_key: true, index: false
      t.references :guest, null: false, foreign_key: {to_table: :users}

      t.index [:booking_id, :guest_id], unique: true

      t.timestamps
    end
  end
end
