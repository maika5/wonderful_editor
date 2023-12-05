class RemoveNullAndFalseFromArticleLikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :article_likes, :null, :boolean
    remove_column :article_likes, :false, :boolean
  end
end
