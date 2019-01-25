class ChangeUsersColumnsNullConstraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:users, :first_name, true)
  end
end
