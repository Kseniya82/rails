class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.string :question_body, limit: 25
      t.string :user_email
      t.string :gist_url

      t.timestamps
    end
  end
end
