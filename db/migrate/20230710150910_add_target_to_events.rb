class AddTargetToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :target, foreign_key: {to_table: :users}
  end
end
