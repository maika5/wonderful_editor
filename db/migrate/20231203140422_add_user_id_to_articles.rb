class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :bigint
    add_index :articles, :user_id, name: "index_articles_on_user_id"
  end
end
