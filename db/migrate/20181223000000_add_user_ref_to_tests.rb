class AddUserRefToTests < ActiveRecord::Migration[5.2]
  def up
    add_reference :tests, :user, foreign_key: true
  end
  def down

  end
end
