class RemoveUnusedOccurrenceIdOnBookings < ActiveRecord::Migration[8.1]
  def change
    remove_column :bookings, :occurrence_id, :integer
  end
end
