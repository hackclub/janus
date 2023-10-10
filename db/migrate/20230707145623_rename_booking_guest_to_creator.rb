class RenameBookingGuestToCreator < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :guest_id, :creator_id
  end
end
