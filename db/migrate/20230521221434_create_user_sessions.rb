class CreateUserSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :user_sessions do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.string :token, index: true

      t.string :ip_address, index: true
      t.string :user_agent
      t.timestamp :last_accessed_at, index: true

      t.timestamps
    end
  end
end
