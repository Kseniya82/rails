class ChangeUsersColumnsNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :first_name, true)
    change_column_null(:users, :access, true)
  end
end
