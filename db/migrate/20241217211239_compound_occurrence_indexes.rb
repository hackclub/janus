class CompoundOccurrenceIndexes < ActiveRecord::Migration[8.1]
  def change
    add_index :occurrences, %i[starts_at ends_at]
    remove_index :occurrences, :starts_at
  end
end
