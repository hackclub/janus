class CreateOccurrences < ActiveRecord::Migration[8.1]
  def change
    create_table :occurrences do |t|
      t.belongs_to :occurable, polymorphic: true

      t.datetime :starts_at, index: true
      t.datetime :ends_at, index: true

      t.timestamps
    end
  end
end
