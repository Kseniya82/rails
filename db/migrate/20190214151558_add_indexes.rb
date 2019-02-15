class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, %i[title leval], unique: true
  end
end
