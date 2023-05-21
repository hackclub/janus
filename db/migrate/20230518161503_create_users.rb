class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :slack_id, null: false, index: {unique: true}
      t.string :email_address, null: false, index: true
      t.string :name
      t.integer :role, index: true

      t.timestamps
    end
  end
end
