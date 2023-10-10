class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.belongs_to :commentable, polymorphic: true, null: false
      t.belongs_to :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
