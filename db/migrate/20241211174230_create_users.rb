class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email_address, null: false, index: true
      t.string :slack_id, index: {unique: true}
      t.string :role, index: true

      t.timestamps
    end
  end
end
