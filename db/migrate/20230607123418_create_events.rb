class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :eventable, polymorphic: true
      t.references :creator

      t.string :action, index: true
      t.jsonb :details, default: {}, index: true

      t.timestamps
    end
  end
end
