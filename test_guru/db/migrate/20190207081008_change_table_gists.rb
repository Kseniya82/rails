class ChangeTableGists < ActiveRecord::Migration[5.2]
  def change
    remove_column :gists, :question_body, :string, limit: 25
    remove_column :gists, :user_email, :string
    remove_column :gists, :gist_url, :string
    add_column :gists, :url, :text
  end
end
