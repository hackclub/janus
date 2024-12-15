class CreateEventsAndRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.belongs_to :request, foreign_key: true

      t.references :subject, polymorphic: true, null: false, index: false
      t.references :creator, foreign_key: {to_table: :users}

      t.string :action, null: false, index: true
      t.string :details, null: false, default: "{}"

      t.index %i[subject_type subject_id action]

      t.timestamps
    end

    create_table :requests do |t|
      t.string :path, null: false
      t.string :method, null: false
      t.string :uuid, index: true

      t.string :ip_address, index: true
      t.string :user_agent

      t.timestamps
    end
  end
end
