class CreateSaveArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :save_articles do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
