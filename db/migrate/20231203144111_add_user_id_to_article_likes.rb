class AddUserIdToArticleLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :article_likes, :user_id, :bigint
    add_column :article_likes, :null, :string
    add_column :article_likes, :false, :string
  end
end
