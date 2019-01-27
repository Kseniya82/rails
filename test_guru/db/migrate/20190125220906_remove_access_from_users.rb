class RemoveAccessFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :access, :string
  end
end
