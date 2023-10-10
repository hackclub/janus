class MakeSlackIdNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :slack_id, true
  end
end
